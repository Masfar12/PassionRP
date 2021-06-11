Config = {}

--[[
    This enables/disables the post-loading animation where camera starts in the clouds,
    above the city like when switching characters in GTA V Story Mode.
--]]
Config.EnterCityAnimation = true

-- Setting these to false will enable all colors available in the game.
Config.UseNaturalHairColors = false
Config.UseNaturalEyeColors = false

-- Map Locations
Config.EnableClothingShops = true
Config.ClothingShops = {
    vector3(72.3, -1399.1, 28.4),
    vector3(-703.8, -152.3, 36.4),
    vector3(-167.9, -299.0, 38.7),
    vector3(428.7, -800.1, 28.5),
    vector3(-829.4, -1073.7, 10.3),
    vector3(-1447.8, -242.5, 48.8),
    vector3(11.6, 6514.2, 30.9),
    vector3(123.6, -219.4, 53.6),
    vector3(1696.3, 4829.3, 41.1),
    vector3(618.1, 2759.6, 41.1),
    vector3(1190.6, 2713.4, 37.2),
    vector3(-1193.4, -772.3, 16.3),
    vector3(-3172.5, 1048.1, 19.9),
    vector3(-1108.4, 2708.9, 18.1),
    vector3(-214.9, -1313.8, 34.6),
	vector3(107.50207519531, -1305.0997314453, 27.793016433716),
	vector3(105.51679229736, -1303.1218261719, 28.793018341064),
    vector3(1104.1235351563, 196.11608886719, -49.440086364746),
	vector3(1846.1890869141, 3693.0422363281, 34.270099639893),
    vector3(47.408603668213, -2572.9274902344, 6.283127784729),
}

Config.ClothingShopsBlips = {
    vector3(72.3, -1399.1, 28.4),
    vector3(-703.8, -152.3, 36.4),
    vector3(-167.9, -299.0, 38.7),
    vector3(428.7, -800.1, 28.5),
    vector3(-829.4, -1073.7, 10.3),
    vector3(-1447.8, -242.5, 48.8),
    vector3(11.6, 6514.2, 30.9),
    vector3(123.6, -219.4, 53.6),
    vector3(1696.3, 4829.3, 41.1),
    vector3(618.1, 2759.6, 41.1),
    vector3(1190.6, 2713.4, 37.2),
    vector3(-1193.4, -772.3, 16.3),
    vector3(-3172.5, 1048.1, 19.9),
    vector3(-1108.4, 2708.9, 18.1),
}

Config.EnableBarberShops = true
Config.BarberShops = {
    vector3(-814.3, -183.8, 36.6),
    vector3(136.8, -1708.4, 28.3),
    vector3(-1282.6, -1116.8, 6.0),
    vector3(1931.5, 3729.7, 31.8),
    vector3(1212.8, -472.9, 65.2),
    vector3(-32.9, -152.3, 56.1),
    vector3(-278.1, 6228.5, 30.7)
}

--[[
    Hospital and City Hall coordinates are all outside,
    because those buildings don't have interiors by default.
    They should be replaced with proper interior coordinates.
--]]
Config.EnablePlasticSurgeryUnits = true
Config.PlasticSurgeryUnits = {
    --vector3(338.8, -1394.5, 31.5),      -- Central Los Santos Medical Center
    -- vector3(240.2, -1380.0, 33.7),   -- Los Santos General Hospital (Coroner)
    -- vector3(1152.2, -1528.0, 34.8),  -- St Fiacre Hospital for East Los Santos
    --vector3(-874.7, -307.5, 38.5),      -- Portola Trinity Medical Center
    --vector3(-676.7, 311.5, 82.5),       -- Eclipse Medical Tower
    --vector3(-449.8, -341.0, 33.7),      -- Mount Zonah Medical Center
    vector3(354.53, -596.034, 43.2),   -- Pillbox Hill Medical Center 354.533203125, -596.03460693359, 43.289527893066, 257.34490966797
    -- vector3(1839.5, 3672.5, 33.2),   -- Sandy Shores Medical Center
    -- vector3(-246.9, 6330.5, 31.4)    -- The Bay Care Center (Paleto)
}

Config.EnableNewIdentityProviders = false
Config.NewIdentityProviders = {
    -- vector3(233.2, -410.1, 47.3),    -- Los Santos City Hall
    vector3(-544.9, -204.4, 37.5),      -- Rockford Hills City Hall
    -- vector3(328.5, -1581.8, 31.9),   -- Davis City Hall
    -- vector3(-1283.4, -565.1, 31.0)   -- Del Perro City Hall
}

--[[    ESX identity integration

        Follow these instructions if you plan to set Config.EnableESXIdentityIntegration to true:
        1) Uncomment '@esx_identity/server/main.lua', in this resource's fxmanifest.lua

        2) Edit esx_identity/client/main.lua:

            Replace (around line 50):
                EnableGui(true)
            with
                TriggerEvent('cui_character:open', { 'identity', 'features', 'style', 'apparel' }, false)

            Replace (start around line 54):
                RegisterNUICallback('register', function(data, cb)
                    ESX.TriggerServerCallback('esx_identity:registerIdentity', function(callback)
                        if callback then
                            ESX.ShowNotification(_U('thank_you_for_registering'))
                            EnableGui(false)
                            TriggerEvent('esx_skin:playerRegistered')
                        else
                            ESX.ShowNotification(_U('registration_error'))
                        end
                    end, data)
                end)
            with
                RegisterNUICallback('register', function(data, cb)
                    ESX.TriggerServerCallback('cui_character:updateIdentity', function(callback)
                        if callback then
                            ESX.ShowNotification(_U('thank_you_for_registering'))
                            TriggerEvent('cui_character:setCurrentIdentity', data)
                            TriggerEvent('cui_character:close', true)
                        else
                            ESX.ShowNotification(_U('registration_error'))
                        end
                    end, data)
                end)
]]--
Config.EnableESXIdentityIntegration = false

if Config.EnableESXIdentityIntegration then
    -- To avoid errors, make sure these equal the respective values in your in esx_identity config
    Config.MaxNameLength    = 16
    Config.MinHeight        = 48
    Config.MaxHeight        = 96
    Config.LowestYear       = 1900
    Config.HighestYear      = 2020
end

Config.ClothingRooms = {
    {requiredJob = "police", x = 461.24, y = -996.62, z = 30.69, cameraLocation = {x = 454.51, y = -990.36, z = 30.68, h = 3.5}},
    {requiredJob = "doctor", x = 300.16, y = -598.93, z = 43.28, cameraLocation = {x = 301.09, y = -596.09, z = 43.28, h = 157.5}}, -- Pillbox
    {requiredJob = "ambulance", x = 300.16, y = -598.93, z = 43.28, cameraLocation = {x = 301.09, y = -596.09, z = 43.28, h = 157.5}}, -- Pillbox
    {requiredJob = "doctor", x = 1821.95, y = 3665.84, z = 34.27, cameraLocation = {x = 301.09, y = -596.09, z = 43.28, h = 157.5}}, -- Sandy
    {requiredJob = "ambulance", x = 1821.95, y = 3665.84, z = 34.27, cameraLocation = {x = 301.09, y = -596.09, z = 43.28, h = 157.5}}, -- Sandy
    {requiredJob = "police", x = -451.46, y = 6014.25, z = 31.72, cameraLocation = {x = -451.46, y = 6014.25, z = 31.72}},
    {requiredJob = "ambulance", x = -250.5, y = 6323.98, z = 32.32, cameraLocation = {x = -250.5, y = 6323.98, z = 32.32, h = 315.5}},
    {requiredJob = "doctor", x = -250.5, y = 6323.98, z = 32.32, cameraLocation = {x = -250.5, y = 6323.98, z = 32.32, h = 315.5}},
    {requiredJob = "police", x = 1852.08, y = 3697.76, z = 34.27, cameraLocation = {x = 1852.08, y = 3697.76, z = 34.27, h = 126.22}},
    {requiredJob = "police", x = 124.53, y = -757.14, z = 242.15, cameraLocation = {x = 124.53, y = -757.14, z = 242.15, h = 250.00}},
	{requiredJob = "mechanic2", x =  956.781, y = -966.34, z = 39.506, cameraLocation = {x =  956.781, y = -966.34, z = 39.506}},
	{requiredJob = nil, x = -1831.545, y = -1190.091, z = 19.42, cameraLocation = {x = -1831.545, y = -1190.091, z = 19.42}},
	{requiredJob = nil, x = -1565.523, y = -570.426, z = 108.522, cameraLocation = {x = -1565.523, y = -570.426, z = 108.522}},
	{requiredJob = nil, x = -131.509, y = -633.206, z = 168.82, cameraLocation = {x = -131.509, y = -633.206, z = 168.82}},
	{requiredJob = nil, x = 2721.862, y = -370.781, z = -55.380, cameraLocation = vector3(2721.862, -370.782, -55.381)},
}

Config.Outfits = {
    ["police"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "Cadet Trooper",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 35, texture = 0},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 55, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 10, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 190, texture = 16},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
             --       ["decals"]      = { item = 0, texture = 0},  -- Decals
             --       ["accessory"]   = { item = 0, texture = 0},  -- accessory
            --      ["bag"]         = { item = 0, texture = 0},  -- bag
            --        ["hat"]         = { item = -1, texture = -1},  -- hat
            --      ["glass"]       = { item = 0, texture = 0},  -- glasses
            --      ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
            --        ["mask"]         = { item = 0, texture = 0},  -- Mask
                },
            },
            [2] = {
                outfitLabel = "LSPD Long Sleeve",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 35, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 55, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 27, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 200, texture = 16},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
             --       ["decals"]      = { item = 0, texture = 0},  -- Decals
             --       ["accessory"]   = { item = 0, texture = 0},  -- accessory
            --      ["bag"]         = { item = 0, texture = 0},  -- bag
            --        ["hat"]         = { item = -1, texture = -1},  -- hat
            --      ["glass"]       = { item = 0, texture = 0},  -- glasses
            --      ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
            --        ["mask"]         = { item = 0, texture = 0},  -- Mask
                },
            },
            [3] = {
                outfitLabel = "LSPD Short Sleeve",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 35, texture = 0},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 55, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 27, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 190, texture = 16},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
             --       ["decals"]      = { item = 0, texture = 0},  -- Decals
             --       ["accessory"]   = { item = 0, texture = 0},  -- accessory
            --      ["bag"]         = { item = 0, texture = 0},  -- bag
            --        ["hat"]         = { item = -1, texture = -1},  -- hat
            --      ["glass"]       = { item = 0, texture = 0},  -- glasses
            --      ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
            --        ["mask"]         = { item = 0, texture = 0},  -- Mask
                },
            },
            [4] = {
                outfitLabel = "LSPD Senior Outfit",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 9, texture = 1},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 55, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 27, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 98, texture = 0},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
            --       ["decals"]      = { item = 7, texture = 0},  -- Decals
            --       ["accessory"]   = { item = 8, texture = 0},  -- accessory
            --      ["bag"]         = { item = 0, texture = 0},  -- bag
            --        ["hat"]         = { item = -1, texture = -1},  -- hat
            --      ["glass"]       = { item = 0, texture = 0},  -- glasses
            --      ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
            --        ["mask"]         = { item = 0, texture = 0},  -- Mask
                },
            },
            [5] = {
                outfitLabel = "LSPD Bike Outfit",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 32, texture = 1},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 55, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 27, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 200, texture = 16},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
            --       ["decals"]      = { item = 7, texture = 0},  -- Decals
            --       ["accessory"]   = { item = 8, texture = 0},  -- accessory
            --      ["bag"]         = { item = 0, texture = 0},  -- bag
                   ["hat"]         = { item = 17, texture = 1},  -- hat
            --      ["glass"]       = { item = 0, texture = 0},  -- glasses
            --      ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
            --        ["mask"]         = { item = 0, texture = 0},  -- Mask
                },
            },
            [6] = {
                outfitLabel = "LSPD SWAT",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 9, texture = 0},  -- Pants
                    ["arms"]        = { item = 17, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 58, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 27, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 63, texture = 0},  -- Torso
                    ["shoes"]       = { item = 24, texture = 0},  -- shoes
              --      ["decals"]      = { item = 7, texture = 0},  -- Decals
              --      ["accessory"]   = { item = 1, texture = 0},  -- accessory
              --      ["bag"]         = { item = 2, texture = 0},  -- bag
                    ["hat"]         = { item = 119, texture = 0},  -- hat
            --      ["glass"]       = { item = 0, texture = 0},  -- glasses
            --      ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]         = { item = 56, texture = 1},  -- Mask
                },
            },
        },
        ["female"] = {
            [1] = {
                outfitLabel = "Test",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 0, texture = 0},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 0, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 0, texture = 0},  -- Torso
                    ["shoes"]       = { item = 0, texture = 0},  -- shoes
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- accessory
                    ["bag"]         = { item = 0, texture = 0},  -- bag
                    ["hat"]         = { item = 0, texture = 0},  -- hat
            --      ["glass"]       = { item = 0, texture = 0},  -- glasses
            --      ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
            },
        }
    },
    ["ambulance"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "Mens scrubs",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 104,texture = 0},  -- Pants
                    ["arms"]        = { item = 85, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
           --         ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 146, texture = 0},  -- Torso
                    ["shoes"]       = { item = 42, texture = 0},  -- shoes
            --        ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 149, texture = 0},  -- accessory
            --        ["bag"]         = { item = 0, texture = 0},  -- bag
           --         ["hat"]         = { item = -1, texture = -1},  -- hat
             --       ["glass"]       = { item = 0, texture = 0},  -- glasses
             --       ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 200, texture = 0},  -- Mask
                },
            },
            [2] = {
                outfitLabel = "Mens Uniform",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 31,texture = 0},  -- Pants
                    ["arms"]        = { item = 85, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 129, texture = 0},  -- T Shirt
           --         ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 425, texture = 5},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
            --        ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 149, texture = 0},  -- accessory
                    ["bag"]         = { item = 82, texture = 0},  -- bag
           --         ["hat"]         = { item = -1, texture = -1},  -- hat
             --       ["glass"]       = { item = 0, texture = 0},  -- glasses
             --       ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Mask
                },
            },
        },
        ["female"] = {},
    },
    ["doctor"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "Doctor",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 35,texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
           --         ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 75, texture = 0},  -- Torso
                    ["shoes"]       = { item = 24, texture = 0},  -- shoes
            --        ["decals"]      = { item = 0, texture = 0},  -- Decals
            --        ["accessory"]   = { item = 0, texture = 0},  -- accessory
            --        ["bag"]         = { item = 0, texture = 0},  -- bag
           --         ["hat"]         = { item = -1, texture = -1},  -- hat
             --       ["glass"]       = { item = 0, texture = 0},  -- glasses
             --       ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
             --       ["mask"]        = { item = 121, texture = 0},  -- Mask
				},
			},
			[2] = {
                outfitLabel = "Test",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 49,texture = 0},  -- Pants
                    ["arms"]        = { item = 85, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 88, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 18, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 32, texture = 6},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- accessory
                    ["bag"]         = { item = 0, texture = 0},  -- bag
                    ["hat"]         = { item = -1, texture = -1},  -- hat
                    ["glass"]       = { item = 0, texture = 0},  -- glasses
                    ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Mask
				},
			},
			[3] = {
                outfitLabel = "Test",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 49,texture = 4},  -- Pants
                    ["arms"]        = { item = 86, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 51, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 151, texture = 2},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- accessory
                    ["bag"]         = { item = 0, texture = 0},  -- bag
                    ["hat"]         = { item = -1, texture = -1},  -- hat
                    ["glass"]       = { item = 0, texture = 0},  -- glasses
                    ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Mask
				},
			},
			[4] = {
                outfitLabel = "Test",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 59,texture = 5},  -- Pants
                    ["arms"]        = { item = 86, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 135, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 151, texture = 3},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- accessory
                    ["bag"]         = { item = 0, texture = 0},  -- bag
                    ["hat"]         = { item = 79, texture = 0},  -- hat
                    ["glass"]       = { item = 0, texture = 0},  -- glasses
                    ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Mask
				},
			},
			[5] = {
                outfitLabel = "Test",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 59,texture = 5},  -- Pants
                    ["arms"]        = { item = 86, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 135, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 151, texture = 5},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- accessory
                    ["bag"]         = { item = 0, texture = 0},  -- bag
                    ["hat"]         = { item = 79, texture = 0},  -- hat
                    ["glass"]       = { item = 0, texture = 0},  -- glasses
                    ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Mask
				},
			},
			[6] = {
                outfitLabel = "Test",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 59,texture = 5},  -- Pants
                    ["arms"]        = { item = 86, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 135, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 151, texture = 4},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- accessory
                    ["bag"]         = { item = 0, texture = 0},  -- bag
                    ["hat"]         = { item = 79, texture = 0},  -- hat
                    ["glass"]       = { item = 0, texture = 0},  -- glasses
                    ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Mask
				},
			},
		},
        ["female"] = {
            [1] = {
                outfitLabel = "Test",
                new = false,
                outfitData = {
                    ["pants"]       = { item = 3,texture = 1},  -- Pants
                    ["arms"]        = { item = 14, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 14, texture = 1},  -- Torso
                    ["shoes"]       = { item = 25, texture = 0},  -- shoes
                    ["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 0, texture = 0},  -- accessory
                    ["bag"]         = { item = 0, texture = 0},  -- bag
                    ["hat"]         = { item = -1, texture = 0},  -- hat
                    ["glass"]       = { item = 0, texture = 0},  -- glasses
                    ["ear"]         = { item = 0, texture = 0},  -- Ear accessoires
                    ["mask"]        = { item = 121, texture = 0},  -- Mask
				},
            },
        },
    },
}
