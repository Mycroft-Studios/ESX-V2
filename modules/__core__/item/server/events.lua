local utils = M("utils")

on("esx:db:ready", function()
  Item.find({}, function(itemResults)
    if itemResults ~= nil then
      module.register(itemResults)
    end
  end)
end)

onClient('esx:item:use', function(payload)
  local sourcePlayer = Player.fromId(source)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()

  local itemName = payload.name
  local quantity = payload.quantity

    local hasItemQuantity = sourceInventory:has(itemName, quantity)
    if not(hasItemQuantity) then
      print("doesn't has item quantity")
      return
    else
      print("Used")
      module.UseItem(source, itemName, quantity) 
      emitClient("esx:inventory:update", source, sourceInventory:serialize())
      sourceInventory:save()
    end
end)

onClient('esx:item:drop', function(payload)
  local sourcePlayer = Player.fromId(source)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()

  local itemName = payload.name
  local quantity = payload.quantity

    local hasItemQuantity = sourceInventory:has(itemName, quantity)
    if not(hasItemQuantity) then
      print("doesn't has item quantity")
      return
    else
      print("Dropped")
      sourceInventory:remove(itemName, 1)
      -- notify changed
      emitClient("esx:inventory:update", source, sourceInventory:serialize())
      sourceInventory:save()
    end
end)
