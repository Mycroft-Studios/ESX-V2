module.Frame = nil
module.isOpeningInventory = false
module.showOther = false

RegisterCommand("showOther", function(source, args, rawCommand)
 if module.showOther then
  module.showOther = false
 else
  module.showOther = true
 end
end)
module.Init = function()
  module.Frame = Frame('inventory', 'nui://' .. __RESOURCE__ .. '/modules/__core__/inventory/data/build/index.html', false)

  module.Frame:on('close', function()
    module.CloseInventory()
  end)

  module.Frame:on('reorder', function(data)
    emitServer('esx:inventory:reorder', data.items)
  end)

  module.Frame:on('give', function(data)
    emitServer('esx:inventory:give', {
      name = data.name,
      quantity = data.quantity,
      target = "player:" .. data.playerId
    })
  end)

  module.Frame:on('use', function(data)
    emitServer('esx:item:use', {
      name = data.name,
      quantity = 1
    })
  end)

  module.Frame:on('drop', function(data)
    emitServer('esx:item:drop', {
      name = data.name,
      quantity = 1
    })
  end)
end

module.OpenInventory = function()
  -- if inventory isn't inited yet, exit
  if module.Frame == nil then return end

  -- if we're already loading players, exit
  if module.isOpeningInventory then return end

  module.isOpeningInventory = true

  -- @TODO: do not query server on each open but rather
  -- store the last inventory state client side
  request("esx:inventory:get", function(inventory)
    if not(inventory == nil) then

      -- get near player loop
      Citizen.CreateThread(function()
        while module.Frame.visible do

          local playerCoords = GetEntityCoords(GetPlayerPed(-1))
          local nearPlayers = {}
          for _, playerId in ipairs(GetActivePlayers()) do
            -- do not add the current player
             if not(playerId == PlayerId()) then
              local otherPlayerCoords = GetEntityCoords(GetPlayerPed(playerId))              

              local distance = #(playerCoords - otherPlayerCoords)
              if (distance) <= 5 then
                table.insert(nearPlayers, {playerId = GetPlayerServerId(playerId), distance = (math.ceil(distance * 100) / 100) })
              end
             end
          end

          module.Frame:postMessage({
            action = 'updateNearPlayers',
            -- @TODO: only map properties that are required on the ui side
            -- for now, we're sending all the datas we have on inventory
            data = nearPlayers
          })

          -- avoid lags, but less precise
          Wait(1000)
        end
      end)

      module.Frame:postMessage({
        action = 'updateSelfInventory',

        data = inventory
      })

      module.Frame:postMessage({
        action = 'updateOtherInventory',

        data = inventory
      })

      module.Frame:postMessage({
        action = 'SetShowOtherInv',

        data = module.showOther
      })
local playerName = "John Doee"

request("esx:inventory:getPlayerName", function(pname)
if pname then
  playerName = pname 
  module.Frame:postMessage({
    action = 'SetPlayerData',
    data = 	playerName
  })
 
else
  playerName = "John Doe"
  module.Frame:postMessage({
    action = 'SetPlayerData',
    data = 	playerName
  })
 
end
end)
      
      module.Frame:show()
      module.Frame:focus(true)
    end
    module.isOpeningInventory = false
  end)
end

module.CloseInventory = function()
  module.Frame:hide()
  module.Frame:unfocus()
  ClearTimecycleModifier()
end

module.UpdateInventory = function(inventory)
  module.Frame:postMessage({
    action = 'updateSelfInventory',
    -- @TODO: only map properties that are required on the ui side
    -- for now, we're sending all the datas we have on inventory
    data = inventory
  })
end

module.WeaponToggle = function(Weapon)
 local ped = PlayerPedId()
 local weponselect = "WEAPON_".. string.upper(Weapon)
 local retval, weaponHash = GetCurrentPedWeapon(ped)
	if IsPedArmed(ped , 4) then
    if weaponHash == GetHashKey(weponselect) then
      RemoveWeaponFromPed(ped, weponselect)
    else
      RemoveWeaponFromPed(ped, weaponHash)
      print(weaponHash)
      GiveWeaponToPed(ped , weponselect,  0,  false,  true)
    end
  else
    GiveWeaponToPed(ped , weponselect,  0,  false,  true)
  end
end

module.AmmoAdd = function(Amount)
  local ped = PlayerPedId()
  local retval, weaponHash = GetCurrentPedWeapon(ped)
   if IsPedArmed(ped , 4) then
      AddAmmoToPed(ped , weaponHash , Amount)
   end
 end