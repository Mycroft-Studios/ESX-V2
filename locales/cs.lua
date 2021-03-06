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

Locales['cs'] = {
    -- Global
  ['submit'] = 'Odeslat',

  -- Inventory
  ['inventory'] = 'inventar %s / %s',
  ['use'] = 'pouzit',
  ['give'] = 'dat',
  ['remove'] = 'zahodit',
  ['return'] = 'zpet',
  ['give_to'] = 'dat',
  ['amount'] = 'mnozstvi',
  ['giveammo'] = 'dat munici',
  ['amountammo'] = 'mnozstvi munice',
  ['noammo'] = 'nemate dostatek munice!',
  ['gave_item'] = 'dali jste ~y~%sx~s~ ~b~%s~s~ ~y~%s~s~',
  ['received_item'] = 'obdrzeli jste ~y~%sx~s~ ~b~%s~s~ od ~b~%s~s~',
  ['gave_weapon'] = 'dali jste ~b~%s~s~ hraci ~y~%s~s~',
  ['gave_weapon_ammo'] = 'dali jste ~o~%sx %s~s~ za ~b~%s~s~ ~y~%s~s~',
  ['gave_weapon_withammo'] = 'dali jste ~b~%s~s~ s ~o~%sx %s~s~ ~y~%s~s~',
  ['gave_weapon_hasalready'] = '~y~%s~s~ jiz ma ~y~%s~s~',
  ['gave_weapon_noweapon'] = '~y~%s~s~ nema tuhle zbran',
  ['received_weapon'] = 'obdrzeli jste ~b~%s~s~ od ~b~%s~s~',
  ['received_weapon_ammo'] = 'obdrzeli jste ~o~%sx %s~s~ za vase ~b~%s~s~ od ~b~%s~s~',
  ['received_weapon_withammo'] = 'obdzeli jste ~b~%s~s~ s ~o~%sx %s~s~ od ~b~%s~s~',
  ['received_weapon_hasalready'] = '~b~%s~s~ se pokusil ti dat ~y~%s~s~, ale jiz tento predmet jednou mas',
  ['received_weapon_noweapon'] = '~b~%s~s~ se pokusil ti dat naboje pro ~y~%s~s~, ale tuhle zbran nemas',
  ['gave_account_money'] = 'dali jste ~g~$%s~s~ (%s) ~y~%s~s~',
  ['received_account_money'] = 'obdrzeli jste ~g~$%s~s~ (%s) od ~b~%s~s~',
  ['amount_invalid'] = 'neplatne mnozstvi',
  ['players_nearby'] = 'zadni hraci pobliz',
  ['ex_inv_lim'] = 'akce neni mozna, prekrocen limit inventare pro ~y~%s~s~',
  ['imp_invalid_quantity'] = 'akce neni mozna, neplatny pocet',
  ['imp_invalid_amount'] = 'akce neni mozna, neplatne mnozstvi',
  ['threw_standard'] = 'vyhodili jste ~y~%sx~s~ ~b~%s~s~',
  ['threw_account'] = 'vyhodili jste ~g~$%s~s~ ~b~%s~s~',
  ['threw_weapon'] = 'vyhodili jste ~b~%s~s~',
  ['threw_weapon_ammo'] = 'vyhodili jste ~b~%s~s~ s ~o~%sx %s~s~',
  ['threw_weapon_already'] = 'jiz mate stejnou zbran',
  ['threw_cannot_pickup'] = 'tohle nemuzete sebrat, protoze vas inventar je plny',
  ['threw_pickup_prompt'] = 'stisknete ~y~E~s~ po sebrani',

  -- Key mapping
  ['keymap_showinventory'] = 'zobrazit inventar',

  -- Salary related
  ['received_salary'] = 'obdrzeli jste vyplatu: ~g~$%s~s~',
  ['received_help'] = 'obdrzeli jste socialni davku: ~g~$%s~s~',
  ['company_nomoney'] = 'spolecnost u ktere jste zamestanani nema penize na vas plat',
  ['received_paycheck'] = 'obdrzena vyplata',
  ['bank'] = 'bankovni ucet',
  ['account_bank'] = 'banka',
  ['account_black_money'] = 'spinave penize',
  ['account_money'] = 'kapesne',

  ['act_imp'] = 'akce neni mozna',
  ['in_vehicle'] = 'nemuzete nic dat osobe ve vozidle',

  -- Commands
  ['command_car'] = 'spawnout vozidlo',
  ['command_car_car'] = 'spawnovaci nazev vozidla nebo hash',
  ['command_cardel'] = 'vymazat vozidlo v blizkosti',
  ['command_cardel_radius'] = 'volitelne, vymazat kazde vozidlo v danem radiusu',
  ['command_clear'] = 'smazat chat',
  ['command_clearall'] = 'smazat chat pro vsechny hrace',
  ['command_clearinventory'] = 'vymazat inventar hrace',
  ['command_clearloadout'] = 'vymazat vyzbroj hrace',
  ['command_giveaccountmoney'] = 'dat penize na ucet',
  ['command_giveaccountmoney_account'] = 'platny nazev uctu',
  ['command_giveaccountmoney_amount'] = 'mnozstvi pro pridani',
  ['command_giveaccountmoney_invalid'] = 'nepltany nazev uctu',
  ['command_giveitem'] = 'dat hraci predmet',
  ['command_giveitem_item'] = 'nazev predmetu',
  ['command_giveitem_count'] = 'mnozstvi predmetu',
  ['command_giveweapon'] = 'dat zbran hraci',
  ['command_giveweapon_weapon'] = 'nazev zbrane',
  ['command_giveweapon_ammo'] = 'pocet munice',
  ['command_giveweapon_hasalready'] = 'hrac jiz ma tuto zbran',
  ['command_giveweaponcomponent'] = 'dat doplnek zbrane',
  ['command_giveweaponcomponent_component'] = 'nazev doplnku',
  ['command_giveweaponcomponent_invalid'] = 'neplatny doplnek zbrane',
  ['command_giveweaponcomponent_hasalready'] = 'hrac jiz ma tento doplnek zbrane',
  ['command_giveweaponcomponent_missingweapon'] = 'hrac nema tuto zbran',
  ['command_save'] = 'ulozeni hrace do databaze',
  ['command_saveall'] = 'ulozeni vsech hracu do databaze',
  ['command_setaccountmoney'] = 'nastaveni penez uctu hrace',
  ['command_setaccountmoney_amount'] = 'mnozstvi penez k nastaveni',
  ['command_setcoords'] = 'teleport na souradnice',
  ['command_setcoords_x'] = 'osa x',
  ['command_setcoords_y'] = 'osa y',
  ['command_setcoords_z'] = 'osa z',
  ['command_setjob'] = 'nastavit praci hrace',
  ['command_setjob_job'] = 'nazev prace',
  ['command_setjob_grade'] = 'pracovni pozice',
  ['command_setjob_invalid'] = 'nazev prace, pracovni pozice nebo oboje jsou neplatne',
  ['command_setgroup'] = 'nastavit skupinu hrace',
  ['command_setgroup_group'] = 'nazev skupiny',
  ['commanderror_argumentmismatch'] = 'neplatny pocet argumentu (zadano %s, pozadovano %s)',
  ['commanderror_argumentmismatch_number'] = 'argument #%s ma nespravny typ (zadan string, pozadovano cislo)',
  ['commanderror_invaliditem'] = 'neplatny nazev predmetu',
  ['commanderror_invalidweapon'] = 'neplatna zbran',
  ['commanderror_console'] = 'tento prikaz nemuze byt spusten z konzole',
  ['commanderror_invalidcommand'] = '^3%s^0 neni platny prikaz!',
  ['commanderror_invalidplayerid'] = 'hrac s timto id neni online',
  ['commandgeneric_playerid'] = 'id hrace',

  -- Locale settings
  ['locale_digit_grouping_symbol'] = ' ',
  ['locale_currency'] = '$%s',

  -- Weapons
  ['weapon_knife'] = 'nuz',
  ['weapon_nightstick'] = 'policejni obusek',
  ['weapon_hammer'] = 'kladivo',
  ['weapon_bat'] = 'baseballova palka',
  ['weapon_golfclub'] = 'golfova hul',
  ['weapon_crowbar'] = 'pacidlo',
  ['weapon_pistol'] = 'pistole',
  ['weapon_combatpistol'] = 'utocna pistole',
  ['weapon_appistol'] = 'ap pistole',
  ['weapon_pistol50'] = 'pistole .50',
  ['weapon_microsmg'] = 'micro smg',
  ['weapon_smg'] = 'smg',
  ['weapon_assaultsmg'] = 'utocne smg',
  ['weapon_assaultrifle'] = 'utocna puska',
  ['weapon_carbinerifle'] = 'karabina',
  ['weapon_advancedrifle'] = 'pokrocily puska',
  ['weapon_mg'] = 'mg',
  ['weapon_combatmg'] = 'utocne mg',
  ['weapon_pumpshotgun'] = 'pumpovana brokovnice',
  ['weapon_sawnoffshotgun'] = 'upilovana brokovnice',
  ['weapon_assaultshotgun'] = 'utocna brokovnice',
  ['weapon_bullpupshotgun'] = 'bullpup brokovnice',
  ['weapon_stungun'] = 'tazer',
  ['weapon_sniperrifle'] = 'odstrelovaci puska',
  ['weapon_heavysniper'] = 'tezka odstrelovaci puska',
  ['weapon_grenadelauncher'] = 'granatomet',
  ['weapon_rpg'] = 'raketomet',
  ['weapon_minigun'] = 'minigun',
  ['weapon_grenade'] = 'granat',
  ['weapon_stickybomb'] = 'prilnava bomba',
  ['weapon_smokegrenade'] = 'kourovy granat',
  ['weapon_bzgas'] = 'bz gas',
  ['weapon_molotov'] = 'molotovuv koktejl',
  ['weapon_fireextinguisher'] = 'hasici pristroj',
  ['weapon_petrolcan'] = 'kanystr',
  ['weapon_ball'] = 'koule',
  ['weapon_snspistol'] = 'sns pistole',
  ['weapon_bottle'] = 'lahev',
  ['weapon_gusenberg'] = 'gusenberguv zametac',
  ['weapon_specialcarbine'] = 'specialni karabina',
  ['weapon_heavypistol'] = 'tezka pistole',
  ['weapon_bullpuprifle'] = 'bullpup puska',
  ['weapon_dagger'] = 'dyka',
  ['weapon_vintagepistol'] = 'historicka pistole',
  ['weapon_firework'] = 'ohnostroj',
  ['weapon_musket'] = 'musketa',
  ['weapon_heavyshotgun'] = 'tezka brokovnice',
  ['weapon_marksmanrifle'] = 'puska strelce',
  ['weapon_hominglauncher'] = 'navadeny raketomet',
  ['weapon_proxmine'] = 'mina na blizko',
  ['weapon_snowball'] = 'snehova koule',
  ['weapon_flaregun'] = 'svetlice',
  ['weapon_combatpdw'] = 'utocne pdw',
  ['weapon_marksmanpistol'] = 'pistole ostrostrelce',
  ['weapon_knuckle'] = 'boxer',
  ['weapon_hatchet'] = 'sekerka',
  ['weapon_railgun'] = 'elektromagneticke delo',
  ['weapon_machete'] = 'maceta',
  ['weapon_machinepistol'] = 'kulomet',
  ['weapon_switchblade'] = 'vystrelovaci nuz',
  ['weapon_revolver'] = 'tezky revolver',
  ['weapon_dbshotgun'] = 'dvouhlavnova brokovnice',
  ['weapon_compactrifle'] = 'kompaktni puska',
  ['weapon_autoshotgun'] = 'automaticka brokovnice',
  ['weapon_battleaxe'] = 'bojova sekera',
  ['weapon_compactlauncher'] = 'kompaktni launcher',
  ['weapon_minismg'] = 'mini smg',
  ['weapon_pipebomb'] = 'trubkova bomba',
  ['weapon_poolcue'] = 'kulecnikove tago',
  ['weapon_wrench'] = 'klic na trubky',
  ['weapon_flashlight'] = 'baterka',
  ['gadget_parachute'] = 'padak',
  ['weapon_flare'] = 'svetlice',
  ['weapon_doubleaction'] = 'dvojhlavnovy revolver',

  -- Weapon Components
  ['component_clip_default'] = 'zakladni rukojet',
  ['component_clip_extended'] = 'prodloucena rukojet',
  ['component_clip_drum'] = 'bubnovy zasobnik',
  ['component_clip_box'] = 'krabicovy zasobnik',
  ['component_flashlight'] = 'baterka',
  ['component_scope'] = 'zamerovac',
  ['component_scope_advanced'] = 'pokrocily zamerovac',
  ['component_suppressor'] = 'tlumic',
  ['component_grip'] = 'rukojet',
  ['component_luxary_finish'] = 'luxusni vzhled zbrane',

  -- Weapon Ammo
  ['ammo_rounds'] = 'naboj(e)',
  ['ammo_shells'] = 'patrona(y)',
  ['ammo_charge'] = 'naboj(e)',
  ['ammo_petrol'] = 'galonu paliva',
  ['ammo_firework'] = 'ohnostroj(e)',
  ['ammo_rockets'] = 'raketa(y)',
  ['ammo_grenadelauncher'] = 'granat(y)',
  ['ammo_grenade'] = 'granat(y)',
  ['ammo_stickybomb'] = 'bomba(y)',
  ['ammo_pipebomb'] = 'bomba(y)',
  ['ammo_smokebomb'] = 'bomba(y)',
  ['ammo_molotov'] = 'koktejl(y)',
  ['ammo_proxmine'] = 'mina(y)',
  ['ammo_bzgas'] = 'kanystr(y)',
  ['ammo_ball'] = 'koule',
  ['ammo_snowball'] = 'snehova(e) koule',
  ['ammo_flare'] = 'svetlice',
  ['ammo_flaregun'] = 'svetlice',

  -- Weapon Tints
  ['tint_default'] = 'zakladni skin',
  ['tint_green'] = 'zeleny skin',
  ['tint_gold'] = 'zlaty skin',
  ['tint_pink'] = 'ruzovy skin',
  ['tint_army'] = 'armadni skin',
  ['tint_lspd'] = 'modry skin',
  ['tint_orange'] = 'oranzovy skin',
  ['tint_platinum'] = 'platinovy skin',

  -- Identity
  ['identity_create'] = 'Vytvoreni identity',
  ['identity_register'] = 'Zaregistrujte svou postavu.',
  ['identity_welcome'] = 'Vitejte, ~b~%s %s',
  ['identity_fill_in'] = 'Pred odeslanim vyplnte vsechna pole!',
  ['identity_firstname'] = 'Krestni jmeno',
  ['identity_lastname'] = 'Prijmeni',
  ['identity_birthdate'] = 'Datum narozeni',
  ['identity_sex'] = "Pohlavi",
  ['identity_male'] = "Muz",
  ['identity_female'] = "Zena",

}
