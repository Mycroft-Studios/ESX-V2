fx_version 'adamant'

game 'gta5'

description 'ESX'

version '2.0.5'

ui_page 'hud/index.html'

ui_page_preload 'yes'

lua54 'yes'

dependencies {
  'yarn',
  'spawnmanager',
  'baseevents',
  'mysql-async'
}

files {
  'data/ped_bones.json',
  'data/ped_components.json',
  'data/ped_models.json',
  'data/weapon_components.json',
  'data/weapons.json',
  'hud/app.css',
  'hud/app.js',
  'hud/index.html',
  'hud/wrapper.js',
  'config/modules.groups.json',
  'modules/__base__/modules.json',
  'modules/__core__/modules.json',
  'modules/__examples__/modules.json',
  'modules/__user__/modules.json',
  'modules/__base__/animations/data/config.lua',
  'modules/__base__/animations/data/locales/en.lua',
  'modules/__base__/clotheshop/data/config.lua',
  'modules/__base__/clotheshop/data/locales/cs.lua',
  'modules/__base__/clotheshop/data/locales/en.lua',
  'modules/__base__/clotheshop/data/locales/es.lua',
  'modules/__base__/clotheshop/data/locales/fi.lua',
  'modules/__base__/clotheshop/data/locales/fr.lua',
  'modules/__base__/clotheshop/data/locales/nl.lua',
  'modules/__base__/clotheshop/data/locales/pl.lua',
  'modules/__base__/clotheshop/data/locales/ru.lua',
  'modules/__base__/clotheshop/data/locales/sv.lua',
  'modules/__base__/garages/data/config.lua',
  'modules/__base__/garages/data/locales/en.lua',
  'modules/__base__/garages/data/locales/fr.lua',
  'modules/__base__/garages/data/locales/sv.lua',
  'modules/__base__/instance/data/config.lua',
  'modules/__base__/instance/data/locales/en.lua',
  'modules/__base__/properties/data/config.lua',
  'modules/__base__/properties/data/interiors.lua',
  'modules/__base__/properties/data/locales/en.lua',
  'modules/__base__/properties/data/locales/fr.lua',
  'modules/__base__/rpchat/data/config.lua',
  'modules/__base__/scoreboard/data/html/index.html',
  'modules/__base__/sit/data/config.lua',
  'modules/__base__/sit/data/locales/en.lua',
  'modules/__base__/society/data/config.lua',
  'modules/__base__/society/data/locales/br.lua',
  'modules/__base__/society/data/locales/cs.lua',
  'modules/__base__/society/data/locales/de.lua',
  'modules/__base__/society/data/locales/en.lua',
  'modules/__base__/society/data/locales/es.lua',
  'modules/__base__/society/data/locales/fi.lua',
  'modules/__base__/society/data/locales/fr.lua',
  'modules/__base__/society/data/locales/it.lua',
  'modules/__base__/society/data/locales/nl.lua',
  'modules/__base__/society/data/locales/pl.lua',
  'modules/__base__/society/data/locales/sv.lua',
  'modules/__base__/vehicleshop/data/config.lua',
  'modules/__base__/vehicleshop/data/locales/en.lua',
  'modules/__base__/vehicleshop/data/locales/fr.lua',
  'modules/__base__/vehicleshop/data/locales/sv.lua',
  'modules/__base__/voice/data/config.lua',
  'modules/__base__/voice/data/locales/br.lua',
  'modules/__base__/voice/data/locales/cs.lua',
  'modules/__base__/voice/data/locales/en.lua',
  'modules/__base__/voice/data/locales/es.lua',
  'modules/__base__/voice/data/locales/fi.lua',
  'modules/__base__/voice/data/locales/fr.lua',
  'modules/__base__/voice/data/locales/ko.lua',
  'modules/__base__/voice/data/locales/nl.lua',
  'modules/__base__/voice/data/locales/pl.lua',
  'modules/__base__/voice/data/locales/sv.lua',
  'modules/__core__/account/data/html/index.css',
  'modules/__core__/account/data/html/index.html',
  'modules/__core__/account/data/html/index.js',
  'modules/__core__/account/data/html/pdown.ttf',
  'modules/__core__/account/data/html/prepros.config',
  'modules/__core__/admin/data/build/0ab54153eeeca0ce03978cc463b257f7.woff2',
  'modules/__core__/admin/data/build/13db00b7a34fee4d819ab7f9838cc428.eot',
  'modules/__core__/admin/data/build/701ae6abd4719e9c2ada3535a497b341.eot',
  'modules/__core__/admin/data/build/82f60bd0b94a1ed68b1e6e309ce2e8c3.svg',
  'modules/__core__/admin/data/build/8e3c7f5520f5ae906c6cf6d7f3ddcd19.eot',
  'modules/__core__/admin/data/build/962a1bf31c081691065fe333d9fa8105.svg',
  'modules/__core__/admin/data/build/9c74e172f87984c48ddf5c8108cabe67.png',
  'modules/__core__/admin/data/build/a046592bac8f2fd96e994733faf3858c.woff',
  'modules/__core__/admin/data/build/a1a749e89f578a49306ec2b055c073da.svg',
  'modules/__core__/admin/data/build/ad97afd3337e8cda302d10ff5a4026b8.ttf',
  'modules/__core__/admin/data/build/b87b9ba532ace76ae9f6edfe9f72ded2.ttf',
  'modules/__core__/admin/data/build/c5ebe0b32dc1b5cc449a76c4204d13bb.ttf',
  'modules/__core__/admin/data/build/cd6c777f1945164224dee082abaea03a.woff2',
  'modules/__core__/admin/data/build/e8c322de9658cbeb8a774b6624167c2c.woff2',
  'modules/__core__/admin/data/build/ef60a4f6c25ef7f39f2d25a748dbecfe.woff',
  'modules/__core__/admin/data/build/faff92145777a3cbaf8e7367b4807987.woff',
  'modules/__core__/admin/data/build/index.html',
  'modules/__core__/admin/data/build/main.js',
  'modules/__core__/admin/data/config.lua',
  'modules/__core__/atm/data/html/index.css',
  'modules/__core__/atm/data/html/index.html',
  'modules/__core__/atm/data/html/index.js',
  'modules/__core__/atm/data/html/prepros.config',
  'modules/__core__/game.hud/data/html/css/app.css',
  'modules/__core__/game.hud/data/html/fonts/bankgothic.ttf',
  'modules/__core__/game.hud/data/html/fonts/pdown.ttf',
  'modules/__core__/game.hud/data/html/img/accounts/bank.png',
  'modules/__core__/game.hud/data/html/img/accounts/black_money.png',
  'modules/__core__/game.hud/data/html/img/accounts/money.png',
  'modules/__core__/game.hud/data/html/js/app.js',
  'modules/__core__/game.hud/data/html/js/mustache.min.js',
  'modules/__core__/game.hud/data/html/js/wrapper.js',
  'modules/__core__/game.hud/data/html/ui.html',
  'modules/__core__/inventory/data/build/0ab54153eeeca0ce03978cc463b257f7.woff2',
  'modules/__core__/inventory/data/build/1.js',
  'modules/__core__/inventory/data/build/10.js',
  'modules/__core__/inventory/data/build/11.js',
  'modules/__core__/inventory/data/build/12.js',
  'modules/__core__/inventory/data/build/13.js',
  'modules/__core__/inventory/data/build/13db00b7a34fee4d819ab7f9838cc428.eot',
  'modules/__core__/inventory/data/build/14.js',
  'modules/__core__/inventory/data/build/2.js',
  'modules/__core__/inventory/data/build/3.js',
  'modules/__core__/inventory/data/build/4.js',
  'modules/__core__/inventory/data/build/4bc532dcb57c25e3e58fd01ce327bed5.png',
  'modules/__core__/inventory/data/build/5.js',
  'modules/__core__/inventory/data/build/6.js',
  'modules/__core__/inventory/data/build/7.js',
  'modules/__core__/inventory/data/build/701ae6abd4719e9c2ada3535a497b341.eot',
  'modules/__core__/inventory/data/build/8.js',
  'modules/__core__/inventory/data/build/82f60bd0b94a1ed68b1e6e309ce2e8c3.svg',
  'modules/__core__/inventory/data/build/8e3c7f5520f5ae906c6cf6d7f3ddcd19.eot',
  'modules/__core__/inventory/data/build/9.js',
  'modules/__core__/inventory/data/build/962a1bf31c081691065fe333d9fa8105.svg',
  'modules/__core__/inventory/data/build/9c74e172f87984c48ddf5c8108cabe67.png',
  'modules/__core__/inventory/data/build/a046592bac8f2fd96e994733faf3858c.woff',
  'modules/__core__/inventory/data/build/a1a749e89f578a49306ec2b055c073da.svg',
  'modules/__core__/inventory/data/build/ad97afd3337e8cda302d10ff5a4026b8.ttf',
  'modules/__core__/inventory/data/build/b87b9ba532ace76ae9f6edfe9f72ded2.ttf',
  'modules/__core__/inventory/data/build/c5ebe0b32dc1b5cc449a76c4204d13bb.ttf',
  'modules/__core__/inventory/data/build/cd6c777f1945164224dee082abaea03a.woff2',
  'modules/__core__/inventory/data/build/e8c322de9658cbeb8a774b6624167c2c.woff2',
  'modules/__core__/inventory/data/build/ef60a4f6c25ef7f39f2d25a748dbecfe.woff',
  'modules/__core__/inventory/data/build/faff92145777a3cbaf8e7367b4807987.woff',
  'modules/__core__/inventory/data/build/index.html',
  'modules/__core__/inventory/data/build/main.js',
  'modules/__core__/skin/data/config.lua',
  'modules/__core__/skin/data/html/css/font-awesome.min.css',
  'modules/__core__/skin/data/html/css/material.min.css',
  'modules/__core__/skin/data/html/css/style.css',
  'modules/__core__/skin/data/html/debug.log',
  'modules/__core__/skin/data/html/fonts/coolvetica.ttf',
  'modules/__core__/skin/data/html/fonts/fontawesome-webfont.woff2',
  'modules/__core__/skin/data/html/fonts/Montserrat-Bold.ttf',
  'modules/__core__/skin/data/html/fonts/Montserrat-Regular.ttf',
  'modules/__core__/skin/data/html/images/check.svg',
  'modules/__core__/skin/data/html/images/eye1.png',
  'modules/__core__/skin/data/html/images/eye10.png',
  'modules/__core__/skin/data/html/images/eye11.png',
  'modules/__core__/skin/data/html/images/eye12.png',
  'modules/__core__/skin/data/html/images/eye13.png',
  'modules/__core__/skin/data/html/images/eye14.png',
  'modules/__core__/skin/data/html/images/eye15.png',
  'modules/__core__/skin/data/html/images/eye16.png',
  'modules/__core__/skin/data/html/images/eye17.png',
  'modules/__core__/skin/data/html/images/eye18.png',
  'modules/__core__/skin/data/html/images/eye19.png',
  'modules/__core__/skin/data/html/images/eye2.png',
  'modules/__core__/skin/data/html/images/eye20.png',
  'modules/__core__/skin/data/html/images/eye21.png',
  'modules/__core__/skin/data/html/images/eye22.png',
  'modules/__core__/skin/data/html/images/eye23.png',
  'modules/__core__/skin/data/html/images/eye24.png',
  'modules/__core__/skin/data/html/images/eye25.png',
  'modules/__core__/skin/data/html/images/eye26.png',
  'modules/__core__/skin/data/html/images/eye27.png',
  'modules/__core__/skin/data/html/images/eye28.png',
  'modules/__core__/skin/data/html/images/eye29.png',
  'modules/__core__/skin/data/html/images/eye3.png',
  'modules/__core__/skin/data/html/images/eye30.png',
  'modules/__core__/skin/data/html/images/eye31.png',
  'modules/__core__/skin/data/html/images/eye32.png',
  'modules/__core__/skin/data/html/images/eye4.png',
  'modules/__core__/skin/data/html/images/eye5.png',
  'modules/__core__/skin/data/html/images/eye6.png',
  'modules/__core__/skin/data/html/images/eye7.png',
  'modules/__core__/skin/data/html/images/eye8.png',
  'modules/__core__/skin/data/html/images/eye9.png',
  'modules/__core__/skin/data/html/images/femaleIcon.png',
  'modules/__core__/skin/data/html/images/genderIcon.png',
  'modules/__core__/skin/data/html/images/maleIcon.png',
  'modules/__core__/skin/data/html/index.html',
  'modules/__core__/skin/data/html/js/skin.js',
  'modules/__core__/skin/data/locales/br.lua',
  'modules/__core__/skin/data/locales/cs.lua',
  'modules/__core__/skin/data/locales/de.lua',
  'modules/__core__/skin/data/locales/en.lua',
  'modules/__core__/skin/data/locales/es.lua',
  'modules/__core__/skin/data/locales/fi.lua',
  'modules/__core__/skin/data/locales/fr.lua',
  'modules/__core__/skin/data/locales/nl.lua',
  'modules/__core__/skin/data/locales/pl.lua',
  'modules/__core__/skin/data/locales/sv.lua',
  'modules/__core__/status/data/html/1.js',
  'modules/__core__/status/data/html/index.html',
  'modules/__core__/status/data/html/main.js',
  'modules/__core__/ui.menu/data/html/build/bundle.css',
  'modules/__core__/ui.menu/data/html/build/bundle.css.map',
  'modules/__core__/ui.menu/data/html/build/bundle.js',
  'modules/__core__/ui.menu/data/html/build/bundle.js.map',
  'modules/__core__/ui.menu/data/html/favicon.png',
  'modules/__core__/ui.menu/data/html/global.css',
  'modules/__core__/ui.menu/data/html/img/bg.jpg',
  'modules/__core__/ui.menu/data/html/index.html',
  'modules/__core__/admin/shared/events.lua',
  'modules/__core__/admin/shared/main.lua',
  'modules/__core__/admin/shared/module.lua',
  'modules/__core__/async/shared/events.lua',
  'modules/__core__/async/shared/main.lua',
  'modules/__core__/async/shared/module.lua',
  'modules/__core__/cache/shared/events.lua',
  'modules/__core__/cache/shared/main.lua',
  'modules/__core__/cache/shared/module.lua',
  'modules/__core__/class/shared/events.lua',
  'modules/__core__/class/shared/main.lua',
  'modules/__core__/class/shared/module.lua',
  'modules/__core__/constants/shared/events.lua',
  'modules/__core__/constants/shared/main.lua',
  'modules/__core__/constants/shared/module.lua',
  'modules/__core__/events/shared/events.lua',
  'modules/__core__/events/shared/main.lua',
  'modules/__core__/events/shared/module.lua',
  'modules/__core__/identity/shared/events.lua',
  'modules/__core__/identity/shared/main.lua',
  'modules/__core__/identity/shared/module.lua',
  'modules/__core__/inventory/shared/events.lua',
  'modules/__core__/inventory/shared/main.lua',
  'modules/__core__/inventory/shared/module.lua',
  'modules/__core__/math/shared/events.lua',
  'modules/__core__/math/shared/main.lua',
  'modules/__core__/math/shared/module.lua',
  'modules/__core__/role/shared/events.lua',
  'modules/__core__/role/shared/main.lua',
  'modules/__core__/role/shared/module.lua',
  'modules/__core__/serializable/shared/events.lua',
  'modules/__core__/serializable/shared/main.lua',
  'modules/__core__/serializable/shared/module.lua',
  'modules/__core__/status/shared/events.lua',
  'modules/__core__/status/shared/main.lua',
  'modules/__core__/status/shared/module.lua',
  'modules/__core__/string/shared/events.lua',
  'modules/__core__/string/shared/main.lua',
  'modules/__core__/string/shared/module.lua',
  'modules/__core__/table/shared/events.lua',
  'modules/__core__/table/shared/main.lua',
  'modules/__core__/table/shared/module.lua',
  'modules/__core__/utils/shared/events.lua',
  'modules/__core__/utils/shared/main.lua',
  'modules/__core__/utils/shared/module.lua',
  'modules/__base__/animations/client/events.lua',
  'modules/__base__/animations/client/main.lua',
  'modules/__base__/animations/client/module.lua',
  'modules/__base__/clotheshop/client/events.lua',
  'modules/__base__/clotheshop/client/main.lua',
  'modules/__base__/clotheshop/client/module.lua',
  'modules/__base__/garages/client/events.lua',
  'modules/__base__/garages/client/main.lua',
  'modules/__base__/garages/client/module.lua',
  'modules/__base__/instance/client/events.lua',
  'modules/__base__/instance/client/main.lua',
  'modules/__base__/instance/client/module.lua',
  'modules/__base__/properties/client/events.lua',
  'modules/__base__/properties/client/main.lua',
  'modules/__base__/properties/client/module.lua',
  'modules/__base__/rpchat/client/events.lua',
  'modules/__base__/rpchat/client/main.lua',
  'modules/__base__/rpchat/client/module.lua',
  'modules/__base__/scoreboard/client/events.lua',
  'modules/__base__/scoreboard/client/main.lua',
  'modules/__base__/scoreboard/client/module.lua',
  'modules/__base__/sit/client/events.lua',
  'modules/__base__/sit/client/main.lua',
  'modules/__base__/sit/client/module.lua',
  'modules/__base__/society/client/events.lua',
  'modules/__base__/society/client/main.lua',
  'modules/__base__/society/client/module.lua',
  'modules/__base__/vehicleshop/client/events.lua',
  'modules/__base__/vehicleshop/client/main.lua',
  'modules/__base__/vehicleshop/client/module.lua',
  'modules/__base__/voice/client/events.lua',
  'modules/__base__/voice/client/main.lua',
  'modules/__base__/voice/client/module.lua',
  'modules/__core__/account/client/events.lua',
  'modules/__core__/account/client/main.lua',
  'modules/__core__/account/client/module.lua',
  'modules/__core__/admin/client/events.lua',
  'modules/__core__/admin/client/main.lua',
  'modules/__core__/admin/client/module.lua',
  'modules/__core__/atm/client/events.lua',
  'modules/__core__/atm/client/main.lua',
  'modules/__core__/atm/client/module.lua',
  'modules/__core__/cache/client/events.lua',
  'modules/__core__/cache/client/main.lua',
  'modules/__core__/cache/client/module.lua',
  'modules/__core__/camera/client/events.lua',
  'modules/__core__/camera/client/main.lua',
  'modules/__core__/camera/client/module.lua',
  'modules/__core__/character/client/events.lua',
  'modules/__core__/character/client/main.lua',
  'modules/__core__/character/client/module.lua',
  'modules/__core__/container/client/events.lua',
  'modules/__core__/container/client/main.lua',
  'modules/__core__/container/client/module.lua',
  'modules/__core__/game.hud/client/events.lua',
  'modules/__core__/game.hud/client/main.lua',
  'modules/__core__/game.hud/client/module.lua',
  'modules/__core__/identity/client/events.lua',
  'modules/__core__/identity/client/main.lua',
  'modules/__core__/identity/client/module.lua',
  'modules/__core__/input/client/events.lua',
  'modules/__core__/input/client/main.lua',
  'modules/__core__/input/client/module.lua',
  'modules/__core__/interact/client/events.lua',
  'modules/__core__/interact/client/main.lua',
  'modules/__core__/interact/client/module.lua',
  'modules/__core__/inventory/client/events.lua',
  'modules/__core__/inventory/client/main.lua',
  'modules/__core__/inventory/client/module.lua',
  'modules/__core__/owned.vehicles/client/events.lua',
  'modules/__core__/owned.vehicles/client/main.lua',
  'modules/__core__/owned.vehicles/client/module.lua',
  'modules/__core__/player/client/events.lua',
  'modules/__core__/player/client/main.lua',
  'modules/__core__/player/client/module.lua',
  'modules/__core__/role/client/events.lua',
  'modules/__core__/role/client/main.lua',
  'modules/__core__/role/client/module.lua',
  'modules/__core__/skin/client/events.lua',
  'modules/__core__/skin/client/main.lua',
  'modules/__core__/skin/client/module.lua',
  'modules/__core__/status/client/events.lua',
  'modules/__core__/status/client/main.lua',
  'modules/__core__/status/client/module.lua',
  'modules/__core__/ui.hud/client/events.lua',
  'modules/__core__/ui.hud/client/main.lua',
  'modules/__core__/ui.hud/client/module.lua',
  'modules/__core__/ui.menu/client/events.lua',
  'modules/__core__/ui.menu/client/main.lua',
  'modules/__core__/ui.menu/client/module.lua',
  'modules/__core__/utils/client/events.lua',
  'modules/__core__/utils/client/main.lua',
  'modules/__core__/utils/client/module.lua',
  'modules/__core__/vehicles/client/events.lua',
  'modules/__core__/vehicles/client/main.lua',
  'modules/__core__/vehicles/client/module.lua',
  'modules/__examples__/menu/client/events.lua',
  'modules/__examples__/menu/client/main.lua',
  'modules/__examples__/menu/client/module.lua'
}

server_scripts {
  'fxmanifest.workaround.js',
  '@mysql-async/lib/MySQL.lua',
  'locale.lua',
  'locales/br.lua',
  'locales/cs.lua',
  'locales/de.lua',
  'locales/en.lua',
  'locales/es.lua',
  'locales/fi.lua',
  'locales/fr.lua',
  'locales/it.lua',
  'locales/pl.lua',
  'locales/pt.lua',
  'locales/sc.lua',
  'locales/sv.lua',
  'locales/tc.lua',
  'locales/tr.lua',
  'config/default/config.lua',
  'config/default/config.account.lua',
  'config/default/config.admin.lua',
  'config/default/config.cache.lua',
  'config/default/config.character.lua',
  'config/default/config.connect.lua',
  'config/default/config.identity.lua',
  'config/default/config.items.lua',
  'config/default/config.roles.lua',
  'config/default/config.status.lua',
  'config/default/config.weapons.lua',
  'boot/shared/module.lua',
  'boot/server/module.lua',
  'boot/shared/events.lua',
  'boot/server/events.lua',
  'boot/shared/main.lua',
  'boot/server/main.lua'
}

client_scripts {
  'locale.lua',
  'locales/br.lua',
  'locales/cs.lua',
  'locales/de.lua',
  'locales/en.lua',
  'locales/es.lua',
  'locales/fi.lua',
  'locales/fr.lua',
  'locales/it.lua',
  'locales/pl.lua',
  'locales/pt.lua',
  'locales/sc.lua',
  'locales/sv.lua',
  'locales/tc.lua',
  'locales/tr.lua',
  'vendor/matrix.lua',
  'config/default/config.lua',
  'config/default/config.account.lua',
  'config/default/config.admin.lua',
  'config/default/config.cache.lua',
  'config/default/config.character.lua',
  'config/default/config.connect.lua',
  'config/default/config.identity.lua',
  'config/default/config.items.lua',
  'config/default/config.roles.lua',
  'config/default/config.status.lua',
  'config/default/config.weapons.lua',
  'boot/shared/module.lua',
  'boot/client/module.lua',
  'boot/shared/events.lua',
  'boot/client/events.lua',
  'boot/shared/main.lua',
  'boot/client/main.lua'
}

shared_scripts {

}

