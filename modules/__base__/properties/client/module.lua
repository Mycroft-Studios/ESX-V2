-- Copyright (c) Jérémie N'gadi
--
-- All rights reserved.
--
-- Even if 'All rights reserved' is very clear :
--
--   You shall not use any piece of this software in a commercial product / service
--   You shall not resell this software
--   You shall not provide any facility to install this particular software in a commercial product / service
--   If you redistribute this software, you must link to ORIGINAL repository at https://github.com/ESX-Org/es_extended
--   This copyright should appear in every part of the project code

M('events')

M('serializable')
M('cache')
M('ui.menu')

local instance = M("instance")
local Interact = M('interact')
local utils    = M("utils")
local camera   = M("camera")
local garages   = M("garages")

local OwnedProperties, Blips, CurrentActionData, propertyAccess = {}, {}, {}, {}
local CurrentProperty, CurrentPropertyOwner, LastProperty, LastPart, CurrentAction, CurrentActionMsg
local firstSpawn, hasChest, hasAlreadyEnteredMarker = true, false, false

module.Config  = run('data/config.lua', {vector3 = vector3})['Config']

module.inMarker          = false
module.CurrentAction     = nil
module.CurrentActionData = nil
module.spawnedVehicle    = nil
module.savedPosition     = nil
module.vehicleLoaded     = false

-----------------------------------------------------------------------------------
-- INIT
-----------------------------------------------------------------------------------

module.Init = function()
  local translations = run('data/locales/' .. Config.Locale .. '.lua')['Translations']
  LoadLocale('properties', Config.Locale, translations)

  Citizen.CreateThread(function()
    for k,v in pairs(module.Config.Properties) do
      local blip = AddBlipForCoord(v.Entry)

      SetBlipSprite (blip, 375)
      SetBlipDisplay(blip, 4)
      SetBlipScale  (blip, 0.75)
      SetBlipColour (blip, 38)
      SetBlipAsShortRange(blip, true)

      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Properties")
      EndTextCommandSetBlipName(blip)
    end
  end)

  for k, v in pairs(module.Config.Properties) do
    local key = 'properties:entrance:' .. tostring(k)

    Interact.Register({
      name         = key,
      location     = tostring(k),
      type         = 'marker',
      distance     = module.Config.DrawDistance,
      radius       = 2.0,
      pos          = v.Entry,
      size         = v.Size,
      mtype        = v.Type,
      color        = v.Color,
      rotate       = true,
      bobUpAndDown = true,
      faceCamera   = true,
      groundMarker = true
    })

    on('esx:interact:enter:' .. key, function(data)
      if data.name == key then
        module.CurrentActionData = {
          Location = data.location,
          Pos      = module.Config.Properties[Entry]
        }

        Interact.ShowHelpNotification(_U('properties:property_menu'))

        module.CurrentAction = function()
          module.OpenPropertyMenu()
          module.Exit()
        end

        if not module.inMarker then
          module.inMarker = true
        end

      end
    end)

    on('esx:interact:exit:' .. key, function(data)
   if data.name == key then
        module.CurrentActionData = {
          Location = data.location,
          Pos      = module.Config.Properties[Entry]
        }
      module.CurrentAction = function()
        module.Exit()
      end

      if module.inMarker then
        module.inMarker = false
      end
    end
  end)

    local key = 'properties:exit:' .. tostring(k)
    Interact.Register({
      name         = key,
      location     = tostring(k),
      type         = 'marker',
      distance     = module.Config.DrawDistance,
      radius       = 1.5,
      pos          = v.Exit,
      size         = v.Size,
      mtype        = v.Type,
      color        = v.Color,
      rotate       = true,
      bobUpAndDown = true,
      faceCamera   = true,
      groundMarker = true
    })

    on('esx:interact:enter:' .. key, function(data)
      if data.name == key then
        module.CurrentActionData = {
          Location = data.location,
          Pos      = module.Config.Properties[Exit]
        }

        Interact.ShowHelpNotification(_U('properties:property_menu'))

        module.CurrentAction = function()
          module.OpenPropertyMenu()
          module.Exit()
          -- module.ExitProperty("Appartment1")
        end

        if not module.inMarker then
          module.inMarker = true
        end

      end
    end)

    on('esx:interact:exit:' .. key, function(data)
      if data.name == key then
           module.CurrentActionData = {
             Location = data.location,
             Pos      = module.Config.Properties[Exit]
           }
         module.CurrentAction = function()
           module.Exit()
         end
   
         if module.inMarker then
           module.inMarker = false
         end
       end
     end)

    local key = 'properties:garage:' .. tostring(k)

    Interact.Register({
      name         = key,
      location     = tostring(k),
      type         = 'marker',
      distance     = module.Config.DrawDistance,
      radius       = 2.0,
      pos          = v.Garage,
      size         = v.Size,
      mtype        = v.Type,
      color        = v.Color,
      rotate       = true,
      bobUpAndDown = true,
      faceCamera   = true,
      groundMarker = true
    })

    on('esx:interact:enter:' .. key, function(data)
      if data.name == key then
        module.CurrentActionData = {
          Location = data.location,
          Pos      = module.Config.Properties[Garage]
        }

        Interact.ShowHelpNotification(_U('properties:property_menu'))

        module.CurrentAction = function()
          garages.OpenGarageMenu(data)
          -- garages.StoreVehicle()
          module.Exit()
          -- module.ExitProperty("Appartment1")
        end

        if not module.inMarker then
          module.inMarker = true
        end

        on('esx:interact:exit:' .. key, function(data)
          if data.name == key then
               module.CurrentActionData = {
                 Location = data.location,
                 Pos      = module.Config.Properties[Entry]
               }
             module.CurrentAction = function()
               module.Exit()
             end
       
             if module.inMarker then
               module.inMarker = false
             end
           end
         end)
      end
    end)
  end
end
-----------------------------------------------------------------------------------
-- MENU FUNCTIONS
-----------------------------------------------------------------------------------

module.OpenPropertyMenu = function()
  local Point = nil
  local currentProperty = nil
  local IsOwned, HasKey, IsLocked, Owner, IsOwner = false, false,false, nil, false
  local distanceEn, distanceEx = 0, 0

  coords = GetEntityCoords(PlayerPedId())
  table.map(module.Config.Properties, function(property)
    -- here im like in a foor loop, meaning that each property execute this code below
    -- also since player coords wont change during this code execution, I moved it above.
    distanceEn = GetDistanceBetweenCoords(coords, property.Entry.x, property.Entry.y, property.Entry.z,  true)
    distanceEx = GetDistanceBetweenCoords(coords, property.Exit.x, property.Exit.y, property.Exit.z, true)
  --  print(json.encode(property))

      if (distanceEn < 3) or (distanceEx < 7) then
       currentProperty = property
       distanceEnt = distanceEn
       distanceExi = distanceEx
    --   end
    -- end)

  if currentProperty ~= nil then
    request("esx:properties:Info", function(PropertyData)
      if PropertyData then
          IsOwned = PropertyData.IsOwned
          IsLocked = PropertyData.IsLocked
          HasKey = PropertyData.HasKey
          Owner = PropertyData.Owner
          IsOwner = PropertyData.Owner
        
          print(PropertyData.IsOwned)
          print(PropertyData.IsLocked)
          print(PropertyData.HasKey)
          print(table.unpack(PropertyData))
          print(PropertyData)
          print(PropertyData[1])
          
            if (distanceEnt < 3) then 
              if IsOwned then
               Point = "Entry"
              else 
                Point = "Buy"
              end
             elseif (distanceExi < 7) then
               Point = "Exit"
             else
              print("ERROR: NO distance")
              print("distanceEn: ", distanceEn)
              print("distanceEnt: ", distanceEnt)
              print("distanceExi: ", distanceExi)
              print("distanceEx: ", distanceEx)
              print("name: ", currentProperty.name)
              print("Entry x:", currentProperty.Entry.x)
              print("Entry y:", currentProperty.Entry.y)
              print("Entry z:", currentProperty.Entry.z)
              print("Coords:", coords)
             end
                   
            local eitems = {{name = 'Return', label = '>> Return <<', type = 'button'}}
           
            if Point == "Entry" then
              if IsOwner then 
                table.insert(eitems,{name = 'Sell', label = '>> Sell <<', type = 'button'}) 
                end
              if HasKey then
                if not IsLocked then 
                  table.insert(eitems,{name = 'lock', label = '>> Lock <<', type = 'button'}) 
                else
                  table.insert(eitems,{name = 'unlock', label = '>> Unlock <<', type = 'button'}) 
                end
              end
              if not IsLocked then 
                table.insert(eitems,{name = 'Enter', label = '>> Enter <<', type = 'button'}) 
              end
            elseif Point == "Exit" then
              if not IsLocked then 
              table.insert(eitems,{name = 'Exit', label = '>> Exit <<', type = 'button'}) 
          --    table.insert(eitems,{name = 'Sell', label = '>> Sell <<', type = 'button'}) 
              end
              if HasKey then
                if not IsLocked then 
                  table.insert(eitems,{name = 'lock', label = '>> Lock <<', type = 'button'}) 
                else
                  table.insert(eitems,{name = 'unlock', label = '>> Unlock <<', type = 'button'}) 
                end
              end
            elseif Point == "Buy" then
              table.insert(eitems,{name = 'Buy', label = '>> Buy <<', type = 'button'}) 
              table.insert(eitems,{name = 'Price', label = ">> Price: $".. currentProperty.Price .. " <<"}) 
            end
        
            module.propertyMenu = Menu('properties.property', {
              title = ("House:\n".. currentProperty.name),
              float = 'top|left', -- not needed, default value
              items = eitems
            })
        
             module.currentMenu = module.propertyMenu
           
          
        
            module.propertyMenu:on('item.click', function(item, index)
              if item.name == 'Enter' then
                module.EnterProperty(currentProperty.name)
                module.propertyMenu:destroy()
                module.propertyMenu = nil
                
        
              elseif  item.name == 'Exit' then
                module.ExitProperty(currentProperty.name)
                module.propertyMenu:destroy()
                module.propertyMenu = nil
                
        
              elseif  item.name == 'Return' then
                module.propertyMenu:destroy()
                module.propertyMenu = nil
                
        
              elseif  item.name == 'Buy' then
                if IsOwned then
                  print("Already Owned")
                else
                  module.EnterProperty(currentProperty.name)
                  emitServer("esx:properties:BuyProperty", currentProperty.name)
                end
                module.propertyMenu:destroy()
                module.propertyMenu = nil
                
              
              elseif  item.name == 'lock' then
                if IsLocked then
                  print("Already Locked")
                else
                  emitServer("esx:properties:LockProperty", currentProperty.name)
                  module.propertyMenu:destroy()
                  module.propertyMenu = nil
                  Wait(4)
          module.OpenPropertyMenu()
          module.propertyMenu:destroy()
                  module.propertyMenu = nil
                end
        
              elseif  item.name == 'unlock' then
                if not IsLocked then
                  print("Already Unlocked")
                else
                  emitServer("esx:properties:UnLockProperty", currentProperty.name)
                  module.propertyMenu:destroy()
                  module.propertyMenu = nil
                  Wait(2)
          module.OpenPropertyMenu()
          module.propertyMenu:destroy()
                  module.propertyMenu = nil
                end
            
        
              elseif  item.name == 'Sell' then
                if not IsOwned then
                  print("Not Owned")
                else
              --    module.ExitProperty(property.name)
                 emitServer("esx:properties:SellProperty", currentProperty.name)
                end      
                module.propertyMenu:destroy()
                module.propertyMenu = nil
                
              end
        end)
      else
        print("ERROR: NO DATA FOUND")
      end
      end, currentProperty.name)
    else
      print("ERROR: No Property")
    end
  end
end)
end


-----------------------------------------------------------------------------------
-- LOGIC FUNCTIONS
-----------------------------------------------------------------------------------
-- REMOVE 
if module.Config.Debug then
RegisterCommand("property", function(source, args, rawCommand )
module.OpenPropertyMenu()
end, false)
-- REMOVE 
RegisterCommand("ExitProperty", function(source, args, rawCommand )
  module.ExitProperty(args[1])
  end, false)

-- REMOVE 
RegisterCommand("getcoords", function(source, args, rawCommand )

  coords = GetEntityCoords(PlayerPedId())
  print(coords)

end, false)

RegisterCommand("buyhouse", function(source, args, rawCommand )

  if IsOwned then
    print("Already Owned")
  else
    IsOwned = true
  end

end, false)

RegisterCommand("sellhouse", function(source, args, rawCommand )

  if not IsOwned then
    print("Not Owned")
  else
    emitServer("esx:properties:SellProperty", args[1])
    IsOwned = false
  end

end, false)
RegisterCommand("storevehicle", function(source, args, rawCommand )
  garages.StoreVehicle()
end, false)

RegisterCommand("garagemenu", function(source, args, rawCommand )
    garages.OpenGarageMenu()
    end, false)

end

function GetProperty(name)
  for i=1, #module.Config.Properties, 1 do
		if module.Config.Properties[i].name == name then
			return module.Config.Properties[i]
		end
	end
end

function GetAllProperty()
  return module.Config.Properties
end

module.EnterProperty = function(name)
  local playerPed = PlayerPedId()
  local property       = GetProperty(name)

    SetEntityCoords(playerPed, property.Exit)
    emitServer("esx:instance:enter", property.name)

   DoScreenFadeIn(800)

  emit('esx:identity:preventSaving', true)

end

module.ExitProperty = function(name)
  local playerPed = PlayerPedId()
  local property       = GetProperty(name)

  if property.Interior == nil then
    SetEntityCoords(playerPed, property.Entry)
  else
      SetEntityCoords(playerPed, property.Entry)
  end
  emitServer("esx:instance:exit", property.name)
  emit('esx:identity:preventSaving', true)

end

module.SetMouseIn = function(value)
  camera.setMouseIn(value)
end

module.ReturnPlayer = function(pos)
  local ped = PlayerPedId()
  SetEntityCoords(ped, pos)

  Citizen.Wait(500)
  DoScreenFadeIn(250)
end

module.Exit = function()
  module.CurrentAction     = nil
  module.CurrentActionData = nil
  module.inMarker          = false

  Interact.StopHelpNotification()
end

-----------------------------------------------------------------------------------
-- CAMERA FUNCTIONS
-----------------------------------------------------------------------------------

module.mainCameraScene = function()
  local ped       = PlayerPedId()
  local pedCoords = GetEntityCoords(ped)
  local forward   = GetEntityForwardVector(ped)

  camera.setRadius(1.25)
  camera.setCoords(pedCoords + forward * 1.25)
  camera.setPolarAzimuthAngle(utils.math.world3DtoPolar3D(pedCoords, pedCoords + forward * 1.25))

  camera.pointToBone(SKEL_ROOT)
end