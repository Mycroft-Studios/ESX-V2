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

-- module.Interiors = run('data/interiors.lua', {vector3 = vector3})['Interiors']
Config = {}

Config.Locale = 'en'
 
Config.DrawDistance              = 6.0
Config.Debug                     = true

Interiors = {
	['Modern1'] = {
       Ipl = 'apa_v_mp_h_01_a',
       coords = vector3(-786.8663, 315.7642, 217.6385)
	},
	['Modern2'] = {
		Ipl = 'apa_v_mp_h_01_c',
		coords = vector3(-786.9563, 315.6229, 187.9136)
	},
	['Modern3'] = {
		Ipl = 'apa_v_mp_h_01_b',
		coords = vector3(-774.0126, 342.0428, 196.6864)
	},
	['Mody1'] = {
		Ipl = '	apa_v_mp_h_02_a',
		coords = vector3(-787.0749, 315.8198, 217.6386)
	},
	['Mody2'] = {
		Ipl = '	apa_v_mp_h_02_c',
		coords = vector3(-786.8195, 315.5634, 187.9137)
	},
	['Mody3'] = {
	    Ipl = '	apa_v_mp_h_02_b',
		coords = vector3(-774.1382, 342.0316, 196.6864)
	},
	['Vibrant1'] = {
		Ipl = '	apa_v_mp_h_03_a',
		coords = vector3(-786.6245, 315.6175, 217.6385)
	},
	['Vibrant2'] = {
		Ipl = 'apa_v_mp_h_03_c',
		coords = vector3(-786.9584, 315.7974, 187.9135)
	},
	['Vibrant3']  = {
		Ipl = 'apa_v_mp_h_03_b',
		coords = vector3(-774.0223, 342.1718, 196.6863)
	},
	['Sharp1'] = {
		Ipl = 'apa_v_mp_h_04_a',
		coords = vector3(-787.0902, 315.7039, 217.6384)
	},
	['Sharp2'] = {
		Ipl = 'apa_v_mp_h_04_c',
		coords = vector3(-787.0155, 315.7071, 187.9135)
	},
	['Sharp3'] = {
		Ipl = 'apa_v_mp_h_04_b',
		coords = vector3(-773.8976, 342.1525, 196.6863)
	},
	['Mono1'] = {
		Ipl = 'apa_v_mp_h_05_a',
		coords = vector3(-786.9887, 315.7393, 217.6386)
	},
	['Mono2'] = {
		Ipl = 'apa_v_mp_h_05_c',
		coords = vector3(-786.8809, 315.6634, 187.9136)
	},
	['Mono3'] = {
		Ipl = 'apa_v_mp_h_05_b',
		coords = vector3(-774.0675, 342.0773, 196.6864)
	},
	['Seductive1'] = {
		Ipl = 'apa_v_mp_h_06_a',
		coords = vector3(-787.1423, 315.6943, 217.6384)
	},
	['Seductive2'] = {
		Ipl = 'apa_v_mp_h_06_c',
		coords = vector3(-787.0961, 315.815, 187.9135)
	},
	['Seductive3'] = {
		Ipl = '	apa_v_mp_h_02_b',
		coords = vector3(-773.9552, 341.9892, 196.6862)
	},
	['Regal1'] = {
		Ipl = 'apa_v_mp_h_07_a',
		 coords = vector3(-787.029, 315.7113, 217.6385)
	  },
	['Regal2'] = {
		Ipl = 'apa_v_mp_h_07_c',
		coords = vector3(-787.0574, 315.6567, 187.9135)
	},
	['Regal3'] = {
		Ipl = 'apa_v_mp_h_07_b',
		coords = vector3(-774.0109, 342.0965, 196.6863)
	},
	['Aqua1'] = {
		Ipl = 'apa_v_mp_h_08_a',
		coords = vector3(-786.9469, 315.5655, 217.6383)
	},
	['Aqua2'] = {
		Ipl = 'apa_v_mp_h_08_c',
		coords = vector3(-786.9756, 315.723, 187.9134)
	},
	['Aqua3'] = {
		Ipl = 'apa_v_mp_h_08_b',
		coords = vector3(-774.0349, 342.0296, 196.6862)
	},

	---------------
	 -- Non IPL
	---------------
	
	['Lowend1'] = {
		Ipl = '',
		coords = vector3(261.4586, -998.8196, -99.00863)
	},
	['Highend1'] = { -- 4 Integrity Way (Apt 28)
		Ipl = '',
		coords = vector3(-18.07856, -583.6725, 79.46569)
	},
	['Highend2'] = { -- 4 Integrity Way (Apt 30)
		Ipl = '',
		coords = vector3(-35.31277, -580.4199, 88.71221)
	},
	['Highend3'] = { -- Dell Perro Heights (Apt 4)
		Ipl = '',
		coords = vector3(-1468.14, -541.815, 73.4442)
	},
	['Highend4'] = { -- Dell Perro Heights (Apt 7)
		Ipl = '',
		coords = vector3(-1477.14, -538.7499, 55.5264)
	},
	['Highend5'] = { -- Richard Majestic (Apt 2)
		Ipl = '',
		coords = vector3(-915.811, -379.432, 113.6748)
	},
	['Highend6'] = { -- Tinsle Towers (apt 42)
		Ipl = '',
		coords = vector3(-614.86, 40.6783, 97.60007)
	},
	['Highend7'] = { -- Eclipse Towers (Apt3)
		Ipl = '',
		coords = vector3(-773.407, 341.766, 211.397)
	},
	['Highend8'] = { -- 3655 Wild Oats Drive
		Ipl = '',
		coords = vector3(-169.286, 486.4938, 137.4436)
	},
	['Highend9'] = { -- 2044 North Conker Avenue
		Ipl = '',
		coords = vector3(340.9412, 437.1798, 149.3925)
	},
	['Highend10'] = { -- 2045 North Conker Avenue
		Ipl = '',
		coords = vector3(373.023, 416.105, 145.7006)
	},
	['Highend11'] = { -- 2862 Hillcrest Avenue
		Ipl = '',
		coords = vector3(-676.127, 588.612, 145.1698)
	},
	['Highend12'] = { -- 2868 Hillcrest Avenue	
		Ipl = '',
		coords = vector3(-763.107, 615.906, 144.1401)
	},
	['Highend13'] = { -- 2874 Hillcrest Avenue	
		Ipl = '',
		coords = vector3(-857.798, 682.563, 152.6529)
	},
	['Highend14'] = { -- 2677 Whispymound Drive	
		Ipl = '',
		coords = vector3(120.5, 549.952, 184.097)
	}, 
	['Highend15'] = { -- 2133 Mad Wayne Thunder	
		Ipl = '',
		coords = vector3(-1288, 440.748, 97.69459)
	}
}

Config.Properties = {
	{
		name = "Appartment1",
		Entry   = vector3(118.3, -1921.1, 21.3),
		Exit    = Interiors.Modern1.coords,
		Garage  = vector3(58.77, -1881.73, 22.50),
		Interior   = Interiors.Modern1.Ipl,
		Price   = 42069,
		NoIpl = false,
		Size  = {x = 1.1, y = 1.1, z = 0.9},
		Type  = 21,
		Color = {r = 102, g = 102, b = 204, a = 255}
	},
	{
		name = "Appartment2",
		Entry   = vector3(125.64, -1929.429, 21.4),
		Exit    = Interiors.Highend10.coords, -- To Change interior: do Interiors.(name).coords Needs to be the same as Interior
		Garage  = vector3(127.94, -1940.45, 20.66),
		Interior   = nil, -- To Change interior: do Interiors.(name).Ipl Needs to be the same as Exit
		Price   = 10,
		NoIpl = true,
		Size  = {x = 1.1, y = 1.1, z = 0.9},
		Type  = 21,
		Color = {r = 102, g = 102, b = 204, a = 255}
	},
	{
		name = "Appartment3",
		Entry   = vector3(114.66, -1961.029, 21.3),
		Exit    = Interiors.Aqua3.coords, -- To Change interior: do Interiors.(name).coords Needs to be the same as Interior
		Garage  = vector3(58.77, -1881.73, 22.50),
		Interior   = Interiors.Aqua3.Ipl, -- To Change interior: do Interiors.(name).Ipl Needs to be the same as Exit
		Price   = 10,
		NoIpl = false,
		Size  = {x = 1.1, y = 1.1, z = 0.9},
		Type  = 21,
		Color = {r = 102, g = 102, b = 204, a = 255}
	},
	{
		name = "Appartment4",
		Entry   = vector3(85.8, -1959.46, 21.12),
		Exit    =  Interiors.Highend1.coords, -- To Change interior: do Interiors.(name).coords Needs to be the same as Interior
		Garage  = vector3(58.77, -1881.73, 22.50),
		Interior   = nil, -- To Change interior: do Interiors.(name).Ipl Needs to be the same as Exit
		Price   = 10,
		NoIpl = true,
		Size  = {x = 1.1, y = 1.1, z = 0.9},
		Type  = 21,
		Color = {r = 102, g = 102, b = 204, a = 255}
	},
	{
		name = "Appartment5",
		Entry   = vector3(218.66, -809.029, 31.1),
		Exit    =  Interiors.Highend13.coords, -- To Change interior: do Interiors.(name).coords Needs to be the same as Interior
		Garage  = vector3(58.77, -1881.73, 22.50),
		Interior   = nil, -- To Change interior: do Interiors.(name).Ipl Needs to be the same as Exit
		Price   = 10,
		NoIpl = true,
		Size  = {x = 1.1, y = 1.1, z = 0.9},
		Type  = 21,
		Color = {r = 102, g = 102, b = 204, a = 255}
	},
	{
		name = "Appartment6",
		Entry   = vector3(218.66, -809.029, 31.1),
		Exit    =  Interiors.Lowend1.coords, -- To Change interior: do Interiors.(name).coords Needs to be the same as Interior
		Garage  = vector3(58.77, -1881.73, 22.50),
		Interior   = nil, -- To Change interior: do Interiors.(name).Ipl Needs to be the same as Exit
		Price   = 10,
		NoIpl = true,
		Size  = {x = 1.1, y = 1.1, z = 0.9},
		Type  = 21,
		Color = {r = 102, g = 102, b = 204, a = 255}
	},
	{
		name = "Appartment7",
		Entry   = vector3(218.66, -809.029, 31.1),
		Exit    =  Interiors.Highend8.coords, -- To Change interior: do Interiors.(name).coords Needs to be the same as Interior
		Garage  = vector3(58.77, -1881.73, 22.50),
		Interior   = nil, -- To Change interior: do Interiors.(name).Ipl Needs to be the same as Exit
		Price   = 10,
		NoIpl = true,
		Size  = {x = 1.1, y = 1.1, z = 0.9},
		Type  = 21,
		Color = {r = 102, g = 102, b = 204, a = 255}
	},
	{
		name = "Appartment8",
		Entry   = vector3(218.66, -809.029, 31.1),
		Exit    =  Interiors.Seductive2.coords, -- To Change interior: do Interiors.(name).coords Needs to be the same as Interior
		Garage  = vector3(58.77, -1881.73, 22.50),
		Interior   = Interiors.Seductive2.Ipl, -- To Change interior: do Interiors.(name).Ipl Needs to be the same as Exit
		Price   = 10,
		NoIpl = false,
		Size  = {x = 1.1, y = 1.1, z = 0.9},
		Type  = 21,
		Color = {r = 102, g = 102, b = 204, a = 255}
	}
}
