RegisterCommand('open_inventory', function()
  module.OpenInventory()
  ClearTimecycleModifier()
  SetTimecycleModifier("hud_def_blur")
end, false)

RegisterKeyMapping('open_inventory', 'Open Inventory', 'keyboard', 'i')

RegisterCommand('use', function(source, args, rawCommand)
  payload = {name = args[1], quantity = 1}

  emitServer("esx:item:use", payload)
end, false)

RegisterCommand('give', function(source, args, rawCommand)
  emitServer("esx:admin:AddItem", args[1], args[2], args[3])
end, false)