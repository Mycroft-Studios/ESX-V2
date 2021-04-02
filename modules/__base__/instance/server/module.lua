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
module.Instances = {}
module.GetInstance = function(name)
  for i=1, #module.Instances, 1 do
		if module.Instances[i].name == name then
			return module.Instances[i]
		end
	end
end


module.GetInstancePlayerIsIn = function(player)
  for i=1, #module.Instances, 1 do
		if module.Instances[i].players[player] then
			return module.Instances[i]
		end
	end
end

module.EnterInstance = function(source, name)
local targetinstance = module.GetInstance(name)
 local currentinstance = module.GetInstancePlayerIsIn(source)
 if not currentinstance then 
  if targetinstance then
 table.insert(targetinstance.players, source)
 print("Entering: ", targetinstance.name, " | Connected players:", table.unpack(targetinstance.players))
else
  print("ERROR: invalid Instance")
end
else
  print("ERROR: already Within an Instance")
  print("Current Instance: ", currentinstance.name, " | Connected players:", table.unpack(currentinstance.players))
end
end

module.ExitInstance = function(source, name)
  local instance = module.GetInstance(name)
  if instance then
  if instance.players[source] then 
  table.remove(instance.players, source)
  print("Exiting: ", instance.name, " | Connected players:", table.unpack(instance.players))
  else
    print("ERROR: not instanced")
  end
else
  print("ERROR: invalid Instance")
end
 end

onClient('esx:instance:enter', function(name)
  module.EnterInstance(source, name)
end)


onClient('esx:instance:exit', function(name)
  module.ExitInstance(source, name)
end)


onClient('esx:instance:GetInfo', function(name)
  local instance = module.GetInstance(name)
  if instance then
  print(instance.name, " | Type: ",instance.Type, " | Connected players:", table.unpack(instance.players))
else
  print("ERROR: invalid Instance")
end
end)