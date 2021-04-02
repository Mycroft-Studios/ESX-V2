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

local Cache   = M("cache")
local utils   = M("utils")
local instance = M("instance")

M('persistent')

module.Cache = {}

module.Config  = run('data/config.lua', {vector3 = vector3})['Config']

module.addInstances = function()

  for k, v in pairs(module.Config.Properties) do
     table.insert(instance.Instances, {name = v.name, Type = "Property", players = {""}})
  end
end

module.Init = function()
  local translations = run('data/locales/' .. Config.Locale .. '.lua')['Translations']
  LoadLocale('properties', Config.Locale, translations)
  
  module.addInstances()
end

OwnedProperties = Persist('OwnedProperties', 'name', EventEmitter)

OwnedProperties.define({
  {name = 'name', field = {name = 'name', type = 'VARCHAR', length = 128, default = nil, extra = 'NOT NULL'}},
  {name = 'owner', field = {name = 'owner', type = 'VARCHAR', length = 128, default = nil, extra = 'NOT NULL'}},
  {name = 'islocked', field = {name = 'islocked', type = 'VARCHAR', length = 128, default ="true", extra = 'NOT NULL'}}
})
