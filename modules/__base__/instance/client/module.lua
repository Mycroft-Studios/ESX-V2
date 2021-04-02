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

local utils = M('utils')

module.Config = run('data/config.lua', {vector3 = vector3})['Config']

module.Init = function()
  local translations = run('data/locales/' .. Config.Locale .. '.lua')['Translations']
  LoadLocale('sit', Config.Locale, translations)

end

RegisterCommand("enterInstance", function(source, args, rawCommand)
  emitServer("esx:instance:enter", args[1])
end, false )

RegisterCommand("exitInstance", function(source, args, rawCommand)
  emitServer("esx:instance:exit", args[1])
end, false )

RegisterCommand("GetInstance", function(source, args, rawCommand)
  emitServer("esx:instance:GetInfo", args[1])
end, false )