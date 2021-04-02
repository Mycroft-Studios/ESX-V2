M('persistent')
M('events')
M('table')

Items = {}
module.UsableItemsCallbacks = {}

module.register = function(items)
  table.map(items, function(item) 
    Items[item:getName()] = item
  end)
  
  emit("esx:items:update")
end

Item = Persist('items', 'id', EventEmitter)

Item.define({
  {name = 'id',         field = {name = 'id',         type = 'INT',     length = nil, default = nil, extra = 'NOT NULL AUTO_INCREMENT'}},
  {name = 'name',       field = {name = 'name',       type = 'VARCHAR', length = 128, default = nil, extra = 'NOT NULL'}},
  {name = 'countLimit', field = {name = 'count_limit',type = 'INT',     length = nil, default = nil, extra = nil}}
})

function Item:constructor(data)
  self.super:ctor(data)
end

module.RegisterUsableItem = function(item, cb)
    module.UsableItemsCallbacks[item] = cb
end

module.UseItem = function(source, item, quantity)
  local sourcePlayer = Player.fromId(source)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
  local hasItemQuantity = sourceInventory:has(item, quantity)
  if not(hasItemQuantity) then
    print("doesn't has item quantity")
    return
  else
  	module.UsableItemsCallbacks[item](source, item)
  end
end

module.RegisterUsableItem('water_bottle', function(playerId)
  local sourcePlayer = Player.fromId(playerId)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
    print("water_bottle")
    -- transaction
    sourceInventory:remove('water_bottle', 1)
    -- notify changed
end)

module.RegisterUsableItem('vodka', function(playerId)
  local sourcePlayer = Player.fromId(playerId)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
    print("vodka")
    -- transaction
    sourceInventory:remove('vodka', 1)
    -- notify changed
end)

module.RegisterUsableItem('pistol', function(playerId)
  local sourcePlayer = Player.fromId(playerId)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
    print("pistol")
    emitClient("esx:inventory:weapontoggle", playerId, "pistol")
end)

module.RegisterUsableItem('combatpistol', function(playerId)
  local sourcePlayer = Player.fromId(playerId)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
    print("combatpistol")
    emitClient("esx:inventory:weapontoggle", playerId, "combatpistol")
end)

module.RegisterUsableItem('hamburger', function(playerId)
  local sourcePlayer = Player.fromId(playerId)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
    print("hamburger")
    -- transaction
    sourceInventory:remove('hamburger', 1)
end)

module.RegisterUsableItem('bread', function(playerId)
  local sourcePlayer = Player.fromId(playerId)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
    print("bread")
    -- transaction
    sourceInventory:remove('bread', 1)
end)

module.RegisterUsableItem('fuel', function(playerId)
  local sourcePlayer = Player.fromId(playerId)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
    print("fuel")
    -- transaction
    sourceInventory:remove('fuel', 1)
end)

module.RegisterUsableItem('ammo', function(playerId)
  local sourcePlayer = Player.fromId(playerId)
  local sourceInventory = sourcePlayer:getIdentity():getInventory()
    print("ammo")
    emitClient("esx:inventory:ammoadd", playerId, 100)
    sourceInventory:remove('ammo', 1)
end)


