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

local Command = M("events")
local Cache   = M("cache")
local utils   = M("utils")


-- onRequest('esx:properties:HasKey', function(source, cb)
-- 	local player = Player.fromId(source)

--   local sourceInventory = player:getIdentity():getInventory()

--     -- verify source has requested item quantity
--     local hasItemQuantity = sourceInventory:has("key", 1)
--     if not(hasItemQuantity) then
--       cb(false)
--     else
--       cb(true)
--     end
-- end)

-- onRequest('esx:properties:IsOwned', function(source, cb, property)
-- 	MySQL.Async.fetchAll('SELECT name FROM ownedproperties WHERE name = @name', {
--     ['@name'] = property
--   }, function(result)
--     if result[1] then
--       cb(true)
--     else
--       cb(false)
--       end
--     end)
-- end)

-- onRequest('esx:properties:IsLocked', function(source, cb, property)
-- 	MySQL.Async.fetchAll('SELECT islocked FROM ownedproperties WHERE name = @name', {
--     ['@name'] = property
--   }, function(result)
--     if result then
--     if result[1].islocked == "true" then
--     cb(true)
--   else
--     cb(false)
--     end
--   else
--     cb(nil)
--   end
--     end)
-- end)  

onRequest("esx:properties:Info", function(source, cb, property)
	MySQL.Async.fetchAll('SELECT * FROM ownedproperties WHERE name = @name', {
    ['@name'] = property
  }, function(result)
    local IsPOwned, IsPLocked, HasPKey, POwner, IsPowner = false, false, false, nil
    if result then
  print("Result")
    if result[1] then
      IsPOwned = true
      POwner = result[1].owner
      print("Owned")
      local player = Player.fromId(source)

      local sourceInventory = player:getIdentity():getInventory()
    
        -- verify source has requested item quantity
        local hasItemQuantity = sourceInventory:has("key", 1)
        if hasItemQuantity then
         HasPKey = true
         print("Has Key")
        else
         print("No Key")
        end
  
      if result[1].islocked == "true" then
      IsPLocked = true
      print("Locked")
    else
      print("Not Locked")
    end

    for k,v in pairs(GetPlayerIdentifiers(source))do
      if string.sub(v, 1, string.len("license:")) == "license:" then
        if v == POwner then 
          IsPowner = true
        end
      end
  end

  else
    print("Not Owned")
  end
    else
    print("No Result")
    end

      local data = {IsOwned = IsPOwned, IsLocked = IsPLocked, HasKey = HasPKey, Owner = POwner, IsOwner = IsPowner}
      cb(data)
    end)
end)  

onClient('esx:properties:BuyProperty', function(property)
  local player = Player.fromId(source)
  local license = nil
  for k,v in pairs(GetPlayerIdentifiers(source))do
      if string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
      end
  end
  local sourceInventory = player:getIdentity():getInventory()

  -- reorder check if items is included in the current content.
  sourceInventory:add("key", 1)
  emitClient("esx:inventory:update", source, sourceInventory:serialize())
  MySQL.Async.execute( 'INSERT INTO `ownedproperties` (name, owner) VALUES (@name, @owner)', {['@name'] = property, ['@owner'] = license})
end)

onClient('esx:properties:LockProperty', function(property)

 MySQL.Sync.execute('UPDATE ownedproperties SET islocked = @toggle  WHERE name = @name', {
    ['@name'] = property,
    ['@toggle'] = "true"
  })
end)

onClient('esx:properties:UnLockProperty', function(property)

  MySQL.Sync.execute('UPDATE ownedproperties SET islocked = @toggle  WHERE name = @name', {
    ['@name'] = property,
    ['@toggle'] = "false"
  })
end)
onClient('esx:properties:SellProperty', function(property)
  local player = Player.fromId(source)

  local sourceInventory = player:getIdentity():getInventory()


  -- reorder check if items is included in the current content.
  sourceInventory:remove("key", 1)
  emitClient("esx:inventory:update", source, sourceInventory:serialize())

  MySQL.Async.execute('DELETE FROM ownedproperties WHERE name = @name', {
    ['@name'] = property
  })
end)