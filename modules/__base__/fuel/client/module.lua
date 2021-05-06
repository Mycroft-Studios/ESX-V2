M('events')
M('ui.menu')
local utils = M('utils')
local Interact = M('interact')

module.Ready = false
module.Frame = nil
module.Debug = true

module.Config  = run('data/config.lua', {vector3 = vector3})['Config']

module.IsFueling, module.NearbyPump, module.CurrentPump = false, false, false
module.Exited, module.InMenu, module.CanFuel = false, false, false
module.Vehicle, module.CurrentFuel, module.ActualFuel = nil, nil, nil
module.LitersToAdd, module.Price, module.IsCharging  = 0, 0, false
-----------------------------------------------------------------------------------
-- INIT
-----------------------------------------------------------------------------------
module.Init = function()
  local translations = run('data/locales/' .. Config.Locale .. '.lua')['Translations']
  LoadLocale('fuel', Config.Locale, translations)

  Citizen.CreateThread(function()
  for _,v in pairs(module.Config.GasStations) do
    local blip = AddBlipForCoord(v)

    SetBlipSprite(blip, 361)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 4)
    SetBlipDisplay(blip, 4)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(_U('fuel:gas_station_blipname'))
    EndTextCommandSetBlipName(blip)
  end
  end)
end

module.FuelSystem = function(nearbyPump, ped) -- Didn't added the Jerrican Yet.
    module.CurrentPump = nearbyPump

    if module.Vehicle then
      if not module.IsMenu and ((nearbyPump and GetEntityHealth(nearbyPump) > 0)) then
        module.Exited = false
        if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped), -1) == ped then
            local pumpCoords = GetEntityCoords(nearbyPump)
            Interact.ShowHelpNotification(_U('fuel:turn_off_and_leave_vehicle'))
        else
          Interact.StopHelpNotification()
          local vehicleCoords = GetEntityCoords(module.Vehicle)

          if DoesEntityExist(module.Vehicle) and GetDistanceBetweenCoords(GetEntityCoords(ped), vehicleCoords) < 2.5 then
            if not DoesEntityExist(GetPedInVehicleSeat(module.Vehicle, -1)) then
              local stringCoords = GetEntityCoords(nearbyPump)

              if GetVehicleFuelLevel(module.Vehicle) < 99 then
                module.NearPump = true
                module.CanFuel  = true
                Interact.ShowHelpNotification(_U('fuel:press_to_choose_fuel')) 
                utils.ui.draw3DText(vehicleCoords.x,vehicleCoords.y, vehicleCoords.z ,255, 255, 255, 255, "fuel Level :".. GetVehicleFuelLevel(module.Vehicle))
                
              else
                module.NearPump = true
                module.CanFuel  = false
                Interact.ShowHelpNotification(_U('fuel:tank_full'))
              end
            end
          end
        end
      else
        if module.InMenu then
          Interact.StopHelpNotification()
        else
          module.Exited = true
          Interact.StopHelpNotification()
        end
      end
    end
end

Citizen.CreateThread(function()
    Wait(1)
if IsPedInAnyVehicle(PlayerPedId()) then 
 local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  utils.ui.DrawText(GetVehicleFuelLevel(vehicle), 50, 50)
end
end)

-------------------
-- Commands
-------------------

RegisterCommand("OpenFUEL", function()
  if module.Debug then print("FUEL:OPEN") end

  SetTimecycleModifier("hud_def_blur")
  module.Frame:postMessage({action = "SHOW:FUEL"})
  module.Frame:focus(true) -- sets nui focus automatically, and true or false determines if mouse cursor should exit
end)


module.CloseFUEL = function()
  module.Frame:postMessage({action = "HIDE:FUEL"})
  SetTimecycleModifier('default')
  module.Frame:unfocusAll()
end

-------------------
-- Commands
-------------------
module.ChooseFuel = function(vehicle)
  module.InMenu = true

  local coords = GetEntityCoords(module.CurrentPump)
  local heading = GetEntityHeading(PlayerPedId())
  TaskGoStraightToCoord(PlayerPedId(), coords.x, coords.y, coords.z, 0.5, 500, heading, 0)
  Wait(500)
  TaskTurnPedToFaceEntity(PlayerPedId(), module.CurrentPump, 1000)
  utils.game.StartScenarioInPlace("WORLD_HUMAN_CLIPBOARD")

  local menu = Menu('fuel.main', {
    float = 'top|left',
    title = _U('fuel:choose_fuel_type'),
    items = {
      {label = _U('fuel:gasoline'), name = 'Gasoline',  type = 'button'},
      {label = _U('fuel:diesel'), name = 'Diesel',  type = 'button'},
      {label = _U('fuel:Electric'), name = 'Electric',  type = 'button'},
      {label = 'Close', name = 'Close',  type = 'button'},
    }
  })

  menu:on('item.click', function(item)
    if item.name == "Close" then
      module.InMenu = false
      menu:destroy()
    else
      menu:destroy()
      module[item.name](menu,vehicle)
      fuel = item.name
    end
  end)
end

module.Diesel = function(menu)
  local totalLiters = (100 - math.floor(GetVehicleFuelLevel(module.Vehicle) * 10) / 10)
  local menu = Menu('fuel.main', {
    float = 'top|left',
    title = _U('fuel:Diesel'),
    items = {
      {name = 'fuel', label = "Estimated Fuel Required : ".. totalLiters},
      {label = _U('fuel:estimated_price', 0, _U('fuel:money_symbol'.. "l"), 0), name = 'price', value = 1, max = totalLiters*module.Config["DieselPrice"], type = 'slider'},
      {label = _U('fuel:press_to_refuel'), name = 'ReFuel',  type = 'button'},
      {label = 'Close', name = 'Close',  type = 'button'},
    }
  })

  menu:on('item.change', module.onItemChangedDiesel)

  menu:on('item.click', function(item)
    if item.name == 'Close' then
      module.InMenu = false
      menu:destroy()
    elseif item.name == 'ReFuel' then
      utils.ui.showNotification(_U('fuel:now_filling'))
      module.IsFueling = true
      menu:destroy()
      module[item.name](menu)
    end
  end)
end



module.Electric = function(menu)
  local totalWatts = (100 - math.floor(GetVehicleFuelLevel(module.Vehicle) * 10) / 10)
  local menu = Menu('fuel.main', {
    float = 'top|left',
    title = _U('fuel:Electric'),
    items = {{name = 'fuel', label = "Estimated Fuel Required: ".. totalWatts .. "l"},
      {label = _U('fuel:estimated_price', 0, _U('fuel:money_symbol'), 0), name = 'price', value = 1, max = totalWatts*module.Config["GasolinePrice"], type = 'slider'},
      {label = _U('fuel:press_to_refuel'), name = 'ReCharge',  type = 'button'},
      {label = 'Close', name = 'Close',  type = 'button'},
    }
  })

  menu:on('item.change', module.onItemChangedElectric)

  menu:on('item.click', function(item)
    if item.name == 'Close' then
      module.InMenu = false
      menu:destroy()
    elseif item.name == 'ReCharge' then
      utils.ui.showNotification(_U('fuel:now_filling'))
      module.IsCharging = true
      menu:destroy()
      module[item.name](menu)
    end
  end)
end

module.Gasoline = function(menu,vehicle)
  local totalLiters = (100 - math.floor(GetVehicleFuelLevel(module.Vehicle) * 100) / 100)
  local menu = Menu('fuel.main', {
    float = 'top|left',
    title = _U('fuel:gasoline'),
    items = {
      {name = 'fuel', label = "Estimated Fuel Required : ".. totalLiters},
      {label = _U('fuel:estimated_price', 0, _U('fuel:money_symbol'.. "l"), 0), name = 'price', value = 1, max = totalLiters*module.Config["GasolinePrice"], type = 'slider'},
      {label = _U('fuel:press_to_refuel'), name = 'ReFuel',  type = 'button'},
      {label = 'Close', name = 'Close',  type = 'button'},
    }
  })

  menu:on('item.change', module.onItemChangedGasoline)

  menu:on('item.click', function(item)
    if item.name == 'Close' then
      module.InMenu = false
      menu:destroy()
    elseif item.name == 'ReFuel' then
      utils.ui.showNotification(_U('fuel:now_filling'))
      module.IsFueling = true
      menu:destroy()
      module[item.name](menu)
    end
  end)
end

module.ReCharge = function(menu)
  ClearPedTasks(PlayerPedId())
  Wait(100)
    module.CurrentCharge = GetVehicleFuelLevel(module.Vehicle)
    local ChargeToAdd = math.random(10, 20) / 10.0
    module.ActualCharge = module.CurrentCharge
    local coords = GetEntityCoords(module.Vehicle)
    local heading = GetEntityHeading(PlayerPedId())
    TaskGoStraightToCoord(PlayerPedId(), coords.x, coords.y, coords.z, 0.5, 500, heading, 0)
    Wait(250)
    TaskTurnPedToFaceEntity(PlayerPedId(), module.Vehicle, 1000)
    Wait(1100)
    utils.game.LoopAnimation("timetable@gardener@filling_can", "gar_ig_5_filling_can", -1, 0)

    while module.IsCharging do
      if not module.CurrentPump then
          --Script for use jerrycan
      else
        if module.ActualCharge >= (module.CurrentCharge + module.ChargeToAdd) then
          ClearPedTasks(PlayerPedId())
          module.ActualCharge = (module.CurrentCharge + module.ChargeToAdd)   
          SetVehicleFuelLevel(module.Vehicle, module.ActualCharge)
          module.IsCharging = false
          local totalPrice = math.round(module.ChargeToAdd*module.Config[fuel.."Price"],2)
          local totalCharge = module.ChargeToAdd

          local menu = Menu('fuel.ReCharge', {
            float = 'top|left',
            title = _U('fuel:pay_title'),
            items = {
              {label = _U('fuel:total_fuel', totalCharge), name = 'Fuel',  type = 'button'},
              {label = _U('fuel:total_cost', _U('fuel:money_symbol'), totalPrice),  type = 'button'},
              {label = 'Close and pay', name = 'Close',  type = 'button'},
            }
          })

          menu:on('item.click', function(item)
            request('fuel:payme', function(result, totalPrice)
                if result then
                  utils.ui.showNotification(_U('fuel:success'))
                else
                  utils.ui.showNotification(_U('fuel:not_enough_money'))
                  SetVehicleFuelLevel(module.Vehicle, module.CurrentCharge)
                end
            end)

            menu:destroy()
          end)
        else
          module.ActualCharge = module.ActualCharge + ChargeToAdd
          SetVehicleFuelLevel(module.Vehicle, module.ActualCharge)
        end
      end

      Citizen.Wait(250) 
    end
end

module.onItemChangedElectric = function(item, prop, val, index)
  if (item.name == 'price') and (prop == 'value') then
      module.ChargeToAdd = val
      module.Price = math.round(module.ChargeToAdd*module.Config["WattPrice"],2)
      local estimatedCharge = math.round(module.ChargeToAdd,2)
      item.label =  _U('fuel:estimated_price', estimatedCharge, _U('fuel:money_symbol'), module.Price)
  end
end

module.ReFuel = function(menu)
  ClearPedTasks(PlayerPedId())
  Wait(100)
    module.CurrentFuel = GetVehicleFuelLevel(module.Vehicle)
    local fuelToAdd = math.random(10, 20) / 10.0
    module.ActualFuel = module.CurrentFuel
    local coords = GetEntityCoords(module.Vehicle)
    local heading = GetEntityHeading(PlayerPedId())
    TaskGoStraightToCoord(PlayerPedId(), coords.x, coords.y, coords.z, 0.5, 500, heading, 0)
    Wait(500)
    TaskTurnPedToFaceEntity(PlayerPedId(), module.Vehicle, 1000)
    Wait(1100)
    utils.game.LoopAnimation("timetable@gardener@filling_can", "gar_ig_5_filling_can", -1, 0)

    while module.IsFueling do
      if not module.CurrentPump then
          --Script for use jerrycan
      else
        if module.ActualFuel >= (module.CurrentFuel + module.LitersToAdd) then
          ClearPedTasks(PlayerPedId())
          module.ActualFuel = (module.CurrentFuel + module.LitersToAdd)   
          SetVehicleFuelLevel(module.Vehicle, module.ActualFuel)
          module.IsFueling = false
          local totalPrice = math.round(module.LitersToAdd*module.Config[fuel.."Price"],2)
          local totalFuel = module.LitersToAdd

          local menu = Menu('fuel.refuel', {
            float = 'top|left',
            title = _U('fuel:pay_title'),
            items = {
              {label = _U('fuel:total_fuel', totalFuel), name = 'Fuel',  type = 'button'},
              {label = _U('fuel:total_cost', _U('fuel:money_symbol'), totalPrice),  type = 'button'},
              {label = 'Close and pay', name = 'Close',  type = 'button'},
            }
          })

          menu:on('item.click', function(item)
            request('fuel:payme', function(result, totalPrice)
                if result then
                  utils.ui.showNotification(_U('fuel:success'))
                else
                  utils.ui.showNotification(_U('fuel:not_enough_money'))
                  SetVehicleFuelLevel(module.Vehicle, module.CurrentFuel)
                end
            end)

            menu:destroy()
          end)
        else
          module.ActualFuel = module.ActualFuel + fuelToAdd
          SetVehicleFuelLevel(module.Vehicle, module.ActualFuel)
        end
      end

      Citizen.Wait(250) 
    end
end

module.onItemChangedGasoline = function(item, prop, val, index)
  if (item.name == 'price') and (prop == 'value') then
      module.LitersToAdd = val
      module.Price = math.round(module.LitersToAdd*module.Config["GasolinePrice"],2)
      local estimatedLiters = math.round(module.LitersToAdd,2)
      item.label =  _U('fuel:estimated_price', estimatedLiters, _U('fuel:money_symbol'), module.Price)
  end
end


module.onItemChangedDiesel = function(item, prop, val, index)
  if (item.name == 'price') and (prop == 'value') then
      module.LitersToAdd = val
      module.Price = math.round(module.LitersToAdd*module.Config["DieselPrice"],2)
      local estimatedLiters = math.round(module.LitersToAdd,2)
      item.label =  _U('fuel:estimated_price', estimatedLiters, _U('fuel:money_symbol'), module.Price)
  end
end



module.Close = function(menu)

end

RegisterCommand("Fuel", function(source, args, rawCommand )
 local level = GetVehicleFuelLevel(module.Vehicle)
print(level)
  end, false)

RegisterCommand("SetFuel", function(source, args, rawCommand )
SetVehicleFuelLevel(module.Vehicle, args[1])
     end, false)

module.ManageTheFuel = function()
  local allowed = true
  local blacklisted = {"13", "14", "15", "16", "21"}

  local vehicle = module.Vehicle
    if IsVehicleEngineOn(module.Vehicle) then
      SetVehicleFuelLevel(vehicle, GetVehicleFuelLevel(vehicle) - module.Config.FuelUsage[math.round(GetVehicleCurrentRpm(vehicle), 1)] / 30)
    end
end