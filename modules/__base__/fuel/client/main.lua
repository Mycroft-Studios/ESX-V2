M('events')

module.Init()

ESX.SetInterval(250, function()
	module.ManageTheFuel()

    local coords = GetEntityCoords(PlayerPedId())
	local fuelPumps = {}
	local handle, object = FindFirstObject()
	local success

	repeat
		if module.Config.PumpModels[GetEntityModel(object)] then
			table.insert(fuelPumps, object)
		end

		success, object = FindNextObject(handle, object)
	until not success

	EndFindObject(handle)

	local pumpObject = 0
	local pumpDistance = 1000

	for _, fuelPumpObject in pairs(fuelPumps) do
		local dstcheck = GetDistanceBetweenCoords(coords, GetEntityCoords(fuelPumpObject))

		if dstcheck < pumpDistance then
			pumpDistance = dstcheck
			pumpObject = fuelPumpObject
		end
    end
	if pumpDistance < 2.5 then
        module.NearbyPump = pumpObject
	else
        module.NearbyPump = false
    end
end)

ESX.SetInterval(1, function()
	if module.NearPump and module.CanFuel then
		if IsControlJustPressed(0, 38) then
			module.ChooseFuel(module.Vehicle)
		end
	end
end)

ESX.SetInterval(7, function()
	local ped = PlayerPedId()
	module.FuelSystem(module.NearbyPump, ped)
end)

ESX.SetInterval(250, function()
	module.Vehicle = GetPlayersLastVehicle()
end)