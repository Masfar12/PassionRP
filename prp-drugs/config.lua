Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = Config or {}

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

Config.MinimumCornerSellingPolice = 0

Config.Dealers = {
    [1] = {
        ["name"] = "Tony",
        ["coords"] = {
            ["x"] = 52.948902130127, 
            ["y"] = -1440.1127929688, 
            ["z"] = 29.311729431152, 
        },
        ["time"] = {
            ["min"] = 22,
            ["max"] = 4,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weed_og-kush",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 2,
                minrep = 60,
            },
            [3] = {
                name = "weed_white-widow_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 3,
                minrep = 100,
            },
            [4] = {
                name = "weed_og-kush_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 4,
                minrep = 160,
            },
            [5] = {
                name = "kno3",
                price = 10000,
                amount = 5,
                info = {},
                type = "item",
                slot = 5,
                minrep = 250,
            },
        },
    },
    [2] = {
        ["name"] = "Garry",
        ["coords"] = {
            ["x"] = 420.37503051758, 
            ["y"] = -2064.2670898438, 
            ["z"] = 22.137754440308, 
        },
        ["time"] = {
            ["min"] = 1,
            ["max"] = 4,
        },
        ["products"] = {
            [1] = {
                name = "weed_skunk",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weed_amnesia",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 2,
                minrep = 80,
            },
            [3] = {
                name = "weed_skunk_seed",
                price = 15,
                amount = 25,
                info = {},
                type = "item",
                slot = 3,
                minrep = 120,
            },
            [4] = {
                name = "weed_amnesia_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 4,
                minrep = 180,
            },
            [5] = {
                name = "snspistol_part_2",
                price = 1500,
                amount = 1,
                info = {},
                type = "item",
                slot = 5,
                minrep = 650,
            },
        },
    },
    [3] = {
        ["name"] = "Fred",
        ["coords"] = {
            ["x"] = -1121.2225341797, 
            ["y"] = 2712.59765625, 
            ["z"] = 18.800411224365, 
        },
        ["time"] = {
            ["min"] = 22,
            ["max"] = 10,
        },
        ["products"] = {
            [1] = {
                name = "weed_skunk",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weed_purple-haze",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 2,
                minrep = 40,
            },
            [3] = {
                name = "weed_skunk_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 3,
                minrep = 120,
            },
            [4] = {
                name = "weed_purple-haze_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 4,
                minrep = 140,
            },
            [5] = {
                name = "fakeplate",
                price = 30000,
                amount = 1,
                info = {},
                type = "item",
                slot = 5,
                minrep = 650,
            },
            [6] = {
                name = "snspistol_part_1",
                price = 1500,
                amount = 1,
                info = {},
                type = "item",
                slot = 6,
                minrep = 650,
            },
        },
    },
    [4] = {
        ["name"] = "Viktor",
        ["coords"] = {
            ["x"] = -3169.337890625, 
            ["y"] = 1093.5737304688, 
            ["z"] = 20.858015060425, 
        },
        ["time"] = {
            ["min"] = 22,
            ["max"] = 10,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weed_skunk",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 2,
                minrep = 20,
            },
            [3] = {
                name = "weed_purple-haze",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 3,
                minrep = 40,
            },
            [4] = {
                name = "weed_og-kush",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 4,
                minrep = 60,
            },
            [5] = {
                name = "weed_amnesia",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 5,
                minrep = 80,
            },
            [6] = {
                name = "weed_white-widow_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 6,
                minrep = 100,
            },
            [7] = {
                name = "weed_skunk_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 7,
                minrep = 120,
            },
            [8] = {
                name = "weed_purple-haze_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 8,
                minrep = 140,
            },
            [9] = {
                name = "weed_og-kush_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 9,
                minrep = 160,
            },
            [10] = {
                name = "weed_amnesia_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 10,
                minrep = 180,
            },
            [11] = {
                name = "weedroller",
                price = 3000,
                amount = 1,
                info = {},
                type = "item",
                slot = 11,
                minrep = 420,
            },
        },
    },
    [5] = {
        ["name"] = "Julio",
        ["coords"] = {
            ["x"] = 470.80715942383, 
            ["y"] = 3552.8920898438, 
            ["z"] = 33.238548278809, 
        },
        ["time"] = {
            ["min"] = 15,
            ["max"] = 22,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weed_skunk",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 2,
                minrep = 20,
            },
            [3] = {
                name = "weed_purple-haze",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 3,
                minrep = 40,
            },
            [4] = {
                name = "weed_og-kush",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 4,
                minrep = 60,
            },
            [5] = {
                name = "weed_amnesia",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 5,
                minrep = 80,
            },
            [6] = {
                name = "weed_white-widow_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 6,
                minrep = 100,
            },
            [7] = {
                name = "weed_skunk_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 7,
                minrep = 120,
            },
            [8] = {
                name = "weed_purple-haze_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 8,
                minrep = 140,
            },
            [9] = {
                name = "weed_og-kush_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 9,
                minrep = 160,
            },
            [10] = {
                name = "weed_amnesia_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 10,
                minrep = 180,
            },
            [11] = {
                name = "rifle_ammo",
                price = 750,
                amount = 10,
                info = {},
                type = "item",
                slot = 11,
                minrep = 10,
            },
            [12] = {
                name = "rifle_extendedclip",
                price = 15000,
                amount = 1,
                info = {},
                type = "item",
                slot = 12,
                minrep = 1000,
            },
            
        },
    },
    [6] = {
        ["name"] = "Ricardo",
        ["coords"] = {
            ["x"] = -1320.2625732422, 
            ["y"] = -1169.3742675781, 
            ["z"] = 4.8487086296082, 
        },
        ["time"] = {
            ["min"] = 16,
            ["max"] = 18,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weed_skunk",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 2,
                minrep = 20,
            },
            [3] = {
                name = "weed_ak47_seed",
                price = 100,
                amount = 25,
                info = {},
                type = "item",
                slot = 3,
                minrep = 100,
            },
            [4] = {
                name = "smg_ammo",
                price = 500,
                amount = 10,
                info = {},
                type = "item",
                slot = 4,
                minrep = 10,
            },
            [5] = {
                name = "weedroller",
                price = 5000,
                amount = 1,
                info = {},
                type = "item",
                slot = 5,
                minrep = 420,
            },
            [6] = {
                name = "smg_extendedclip",
                price = 10000,
                amount = 1,
                info = {},
                type = "item",
                slot = 6,
                minrep = 1000,
            },
        },
    },
    [7] = {
        ["name"] = "Oldman",
        ["coords"] = {
            ["x"] = 1577.6394042969, 
            ["y"] = 3606.9106445312, 
            ["z"] = 38.759452819824,
        },
        ["time"] = {
            ["min"] = 5,
            ["max"] = 15,
        },
        ["products"] = {
            [1] = {
                name = "bandage",
                price = 100,
                amount = 50,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "painkillers",
                price = 400,
                amount = 2,
                info = {},
                type = "item",
                slot = 2,
                minrep = 0,
            },
            [3] = {
                name = "snspistol_part_3",
                price = 1500,
                amount = 1,
                info = {},
                type = "item",
                slot = 3,
                minrep = 650,
            },
            [4] = {
                name = "shotgun_ammo",
                price = 300,
                amount = 10,
                info = {},
                type = "item",
                slot = 4,
                minrep = 10,
            },
            [5] = {
                name = "pistol_extendedclip",
                price = 5000,
                amount = 1,
                info = {},
                type = "item",
                slot = 5,
                minrep = 1000,
            },
            [6] = {
                name = "kno3",
                price = 5000,
                amount = 5,
                info = {},
                type = "item",
                slot = 6,
                minrep = 250,
            },
            [7] = {
                name = "grenade_ammo",
                price = 10000,
                amount = 1,
                info = {},
                type = "item",
                slot = 7,
                minrep = 300,
            },
        },
    },
}

Config.CornerSellingDrugsList = {
    "weed_white-widow",
    "weed_skunk",
    "weed_purple-haze",
    "weed_og-kush",
    "weed_amnesia",
    "weed_ak47",
    "weed_poco-loco",
    "cokebaggy",
    "crack_baggy",
    "xtcbaggy",
    "meth",
    "acid",
}

Config.DrugsPrice = {
    ["weed_white-widow"] = 60,  -- rep 0
    ["weed_skunk"]       = 60,  -- rep 0
    ["weed_purple-haze"] = 60,  -- rep 40
    ["weed_og-kush"]     = 60,  -- rep 60
    ["weed_amnesia"]     = 60,  -- rep 80
    ["weed_ak47"]        = 70,
    ["weed_poco-loco"]   = 65,  -- Only gotta grow
    ["acid"]             = 85,
    ["cokebaggy"]        = 95,
    ["crack_baggy"]      = 90,
    ["xtcbaggy"]         = 85,
    ["meth"]             = 85,
}

Config.CornerSelling = {
    successChance        = 80,  -- % chance to sell to each local who passes
    callPoliceChance     = 15,  -- % chance that the police will be called on each sale
    scamChance           = 20,  -- % chance that a local will offer a very low amount
    getRobbedChance      = 10,  -- % chance that a local will steal drugs and run
    idealMinSell         = 8,   -- minimum amount you can sell per sale (assuming you have at least this amount)
    idealMaxSell         = 12,  -- maximum amount you can sell per sale (""                                  "")
    minPricePadding      = 2,   -- minimum $ that are added to the price of each drug, per sale
    maxPricePadding      = 4,   -- maximum $ that are added to the price of each drug, per sale
    scamPriceReduction   = 90,  -- % that will be removed from each offer when a local tries to scam
    distanceToSell       = 1.5, -- distance the player needs to be from a local in order to complete a sale
    attackChanceOnReject = 20,  -- % chance a ped will attack the player when they reject an offer
}

Config.DeliveryLocations = {
    [1] = {
        ["label"] = "Stripclub",
        ["coords"] = {
            ["x"] = 106.24,
            ["y"] = -1280.32,
            ["z"] = 29.24,
        }
    },
    [2] = {
        ["label"] = "Vinewood Video",
        ["coords"] = {
            ["x"] = 223.98,
            ["y"] = 121.53,
            ["z"] = 102.76,
        }
    },
    [3] = {
        ["label"] = "Vinewood Video",
        ["coords"] = {
            ["x"] = 223.98,
            ["y"] = 121.53,
            ["z"] = 102.76,
        }
    },
    [4] = {
        ["label"] = "Resort",
        ["coords"] = {
            ["x"] = -1245.63,
            ["y"] = 376.21,
            ["z"] = 75.34,
        }
    },
    [5] = {
        ["label"] = "Bahama Mamas",
        ["coords"] = {
            ["x"] = -1383.1,
            ["y"] = -639.99,
            ["z"] = 28.67,
        }
    },
    [6] = {
        ["label"] = "Pet Store",
        ["coords"] = {
            ["x"] = 568.99,
            ["y"] = 2796.74,
            ["z"] = 42.02,
        }
    },
    [7] = {
        ["label"] = "Grapeseed General Store",
        ["coords"] = {
            ["x"] = 1794.9,
            ["y"] = 4603.05,
            ["z"] = 37.68,
        }
    },
}

Config.CornerSellingZones = {
    [1] = {
        ["coords"] = {
            ["x"] = -1415.53,
            ["y"] = -1041.51,
            ["z"] = 4.62,
        },
        ["time"] = {
            ["min"] = 12,
            ["max"] = 18,
        },
    },
}

Config.DeliveryItems = {
    [1] = {
        ["item"] = "weed_brick",
        ["minrep"] = 0,
    },
}

Config.ServerRoomSpawn = {
    ["coords"] = {
        ["x"] = 2154.57,
        ["y"] = 2921.21,
        ["z"] = -81.08,
    }
}

Config.ServerRoomDoor = {
    ["coords"] = {
        ["x"] = 131.10,
        ["y"] = -762.06,
        ["z"] = 45.75,
    }
}

Config.ServerRoomComputer = {
    ["coords"] = {
        ["x"] = 2168.29,
        ["y"] = 2925.31,
        ["z"] = -81.08,
    } -- /tp 2168.29 2925.31 -81.08
}
