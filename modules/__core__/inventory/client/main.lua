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