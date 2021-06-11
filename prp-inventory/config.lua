Config = {}

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

Config.RandomStr = function(length)
	if length > 0 then
		return Config.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

Config.RandomInt = function(length)
	if length > 0 then
		return Config.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

Config.VendingObjects = {
    "v_68_broeknvend",
    "prop_vend_soda_01",
    "prop_vend_soda_02",
    "prop_vend_fridge01",

    "prop_vend_water_01",
    "ch_chint02_watercooler",
    "prop_watercooler",
    "prop_watercooler_dark",

    "prop_vend_snak_01",
    "prop_vend_snak_01_tu",

    "prop_vend_coffe_01",
    "p_ld_coffee_vend_01",
}

Config.BinObjects = {
    "prop_bin_05a",
}

Config.VendingItems = {
    ["drinks"] = {
        [1] = {
            machine = 'drinks',
            name = "kurkakola",
            price = 4,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            machine = 'drinks',
            name = "water_bottle",
            price = 4,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["coffee"] = {
        [1] = {
            machine = 'coffee',
            name = "coldcoffee",
            price = 4,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
    },
    ["food"] = {
        [1] = {
            machine = 'food',
            name = "twerks_candy",
            price = 4,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            machine = 'food',
            name = "snikkel_candy",
            price = 4,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3]= {
            machine = 'food',
            name = "sandwich",
            price = 4,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
    },
}

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

MaxInventorySlots = 40

BackEngineVehicles = {
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
}

Config.MaximumAmmoValues = {
    ["pistol"] = 250,
    ["smg"] = 250,
    ["shotgun"] = 200,
    ["rifle"] = 250,
}

Config.VehicleTypes = {
    Compacts = 0,
    Sedans = 1,
    SUVs = 2,
    Coupes = 3,
    Muscle = 4,
    SportsClassics = 5,
    Sports = 6,
    Super = 7,
    Motorcycles = 8,
    OffRoad = 9,
    Industrial = 10,
    Utility = 11,
    Vans = 12,
    Cycles = 13,
    Boats = 14,
    Helicopters = 15,
    Planes = 16,
    Service = 17,
    Emergency = 18,
    Military = 19,
    Commercial = 20,
    Trains = 21,
}

Config.VehicleConfig = {
    -- Custom weights
    Trunks = {
        -- Sports
        ["flashgt"] = {
            weight = 180000,
        },
        ["streiter"] = {
            weight = 200000,
        },

        -- Compacts

        -- Vans / Trucks
        ["journey"] = {
            weight = 300000,
        },
        ["pounder2"] = {
            weight = 500000,
            slots = 40,
        },

        -- Sedans
        ["regina"] = {
            weight = 200000,
        },

        -- Super

        -- Coupes

        -- Motorbikes

        -- Muscle
        ["picador"] = {
            weight = 200000,
        },
        ["yosemite"] = {
            weight = 200000,
        },
        ["slamvan"] = {
            weight = 200000,
        },

        -- SUVs
        ["cavalcade"] = {
            weight = 240000,
        },
        ["seminole"] = {
            weight = 220000,
        },
        ["dubsta"] = {
            weight = 240000,
        },
        ["gresley"] = {
            weight = 240000,
        },
        ["baller3"] = {
            weight = 240000,
        },
        ["landstalker"] = {
            weight = 240000,
        },
        ["baller"] = {
            weight = 220000,
        },
        ["baller2"] = {
            weight = 240000,
        },
        ["granger"] = {
            weight = 260000,
        },

        -- OffRoad
        ["dubsta3"] = {
            weight = 280000,
        },
        ["bfinjection"] = {
            weight = 140000,
        },
        ["kamacho"] = {
            weight = 280000,
        },
        ["blazer4"] = {
            weight = 80000,
        },
        ["sandking"] = {
            weight = 280000,
        },
        ["dune"] = {
            weight = 100000,
        },
        ["guardian"] = {
            weight = 280000,
        },
        ["bifta"] = {
            weight = 100000,
        },
        ["blazer"] = {
            weight = 80000,
        },

        -- SportsClassics

        -- Boats
        ["tug"] = {
            weight = 2000000,
            slots = 40,
        },

        -- Imports
        ["navigator"] = {
            weight = 280000,
        },
        ["rrst"] = {
            weight = 220000,
        },
        ["16m5"] = {
            weight = 180000,
        },
        ["f150"] = {
            weight = 280000,
        },
        ["velar"] = {
            weight = 240000,
        },
        ["pwncake"] = {
            weight = 280000,
        },
    },

    DefaultTrunks = {
        slots = 20,
        [Config.VehicleTypes.Compacts] = {
            weight = 120000,
        },
        [Config.VehicleTypes.Sedans] = {
            weight = 140000,
        },
        [Config.VehicleTypes.SUVs] = {
            weight = 200000,
        },
        [Config.VehicleTypes.Coupes] = {
            weight = 140000,
        },
        [Config.VehicleTypes.Muscle] = {
            weight = 140000,
        },
        [Config.VehicleTypes.SportsClassics] = {
            weight = 140000,
        },
        [Config.VehicleTypes.Sports] = {
            weight = 140000,
        },
        [Config.VehicleTypes.Super] = {
            weight = 120000,
        },
        [Config.VehicleTypes.Motorcycles] = {
            weight = 80000,
        },
        [Config.VehicleTypes.OffRoad] = {
            weight = 180000,
        },
        [Config.VehicleTypes.Vans] = {
            weight = 240000,
        },
    },
}