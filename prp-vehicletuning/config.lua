Config = {}

Config.AttachedVehicle = nil

Config.Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = "Motor",
    ["body"] = "Body",
    ["radiator"] = "Radiator",
    ["axle"] = "Axle",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}

Config.RepairCost = {
    ["body"] = "glass",
    ["radiator"] = "aluminum",
    ["axle"] = "steel",
    ["brakes"] = "copper",
    ["clutch"] = "iron",
    ["fuel"] = "plastic",
    ["engine"] = "metalscrap",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 15,
    },
    ["body"] = {
        item = "glass",
        costs = 15,
    },
    ["radiator"] = {
        item = "aluminum",
        costs = 15,
    },
    ["axle"] = {
        item = "steel",
        costs = 15,
    },
    ["brakes"] = {
        item = "copper",
        costs = 15,
    },
    ["clutch"] = {
        item = "iron",
        costs = 15,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 15,
    },
}

Config.Businesses = {
    "RAC",
}

Config.Plates = {
    [1] = {
        coords = {x = -210.55, y = -1314.45, z = 30.89, h = 355.55, r = 1.0},
        AttachedVehicle = nil, 
    },
    [2] = {
        coords = {x = -223.92, y = -1323.55, z = 30.89, h = 83.25, r = 1.0}, 
        AttachedVehicle = nil,
    },
}

Config.SimonPlates = {
    [1] = {
        coords = {x = -1163.65, y = -1696.17, z = 3.77, h = 215.73, r = 1.0},
        AttachedVehicle = nil,
    },
    [2] = {
        coords = {x = -1159.1, y = -1692.97, z = 3.77, h = 215.83, r = 1.0},
        AttachedVehicle = nil,
    },
}

Config.BaduPlates = {
    [1] = {
        coords = {x = 915.35, y = -979.66, z = 39.5, h = 1.53, r = 1.0},
        AttachedVehicle = nil,
    },
    [2] = {
        coords = {x = 927.91, y = -980.44, z = 39.5, h = 6.59, r = 1.0},
        AttachedVehicle = nil,
    },
    [3] = {
        coords = {x = 913.32, y = -966.33, z = 39.06, h = 275.35, r = 1.0},
        AttachedVehicle = nil,
    },
}

Config.Locations = {
    -- Bennys
    ["exit"]    = {x = -211.45, y = -1299.39, z = 31.29, h = 38.07, r = 1.0},
    ["stash"]   = {x = -224.28, y = -1319.9, z = 30.89, h = 4.37, r = 1.0},
    ["duty"]    = {x = 0.0, y = 0.0, z = 0.0, h = 0.0, r = 1.0},
    ["vehicle"] = {x = -191.79, y = -1306.28, z = 31.32, h = 265.51, r = 1.0}, 

    -- Mosleys
    ["exit1"] = {x = -1123.07, y = -1691.54, z = 4.35, h = 215.12, r = 1.0},
    ["stash1"] = {x = -1165.99, y = -1693.18, z = 4.45},
    ["duty1"] = {x = 0.0, y = 0.0, z = 0.0, h = 0.0, r = 1.0},
    ["vehicle1"] = {x = -1130.0, y = -1695.49, z = 4.4, h = 125.69, r = 1.0},

    -- RAC
    ["exit2"] = {x = 945.35589599609, y = -978.81799316406, z = 39.499855041504, h = 180.17715454102, r = 1.0},
    ["stash2"] = {x = 955.46649169922, y = -955.05902099609, z = 39.499855041504},
    ["duty2"] = {x = 0.0, y = 0.0, z = 0.0, h = 0.0, r = 1.0},
    ["vehicle2"] = {x = 936.33892822266, y = -990.19451904297, z = 38.277847290039, h = 93.889205932617, r = 1.0}, 
}

Config.Vehicles = {
    ["flatbed"] = "Flatbed",
    ["youga2"] = "Mech Van",
    ["utillitruck3"] = "Utility Truck",
}

Config.SimonVehicles = {
    ["flatbed"] = "Flatbed",
    ["youga2"] = "Mech Van",
    ["utillitruck3"] = "Utility Truck",
}

Config.BaduVehicles = {
    ["flatbed"] = "Flatbed",
    ["youga2"] = "Mech Van",
    ["utillitruck3"] = "Utility Truck",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Axle",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}

Config.StashList = {
    ["stash"] = {
        [1] = {x = -216.39, y = -1319.05, z = 30.89},
    },
    ["simon"] = {
        [1] = {x = -1160.96, y = -1689.63, z = 4.45},
    },
    ["badu"] = {
        [1] = {x = 947.90161132813, y = -972.46960449219, z = 39.499851226807},
    }
}

Config.ShopLocations = {
    ["mechanicshop"] = {
        [1] = {x = -227.83, y = -1327.9, z = 30.89, h = 91.33, requiresOnDuty = false},
    },   
}

Config.Items = {
    label = "Part Shop",
    slots = 30,
    items = {
        [1] = {
            name = "repairkit",
            price = 500,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "advancedrepairkit",
            price = 1000,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
    }
}