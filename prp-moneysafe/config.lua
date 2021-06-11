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

Config.MinimumSafeDistance = 0.5

Config.Safes = {
    ["police"] = {
        money = 0,
        coords = {x = 459.97, y = -984.84, z = 31.0, h = 134.5, r = 1.0},
        transactions = {},
    },
    ["doctor"] = {
        money = 0,
        coords = {x = 341.92, y = -589.06, z = 43.28, h = 339.88, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Chief",
            "Assistant Chief",
        },
    },
    ["whiskeyjim"] = {
        money = 0,
        coords = {x = 1987.58, y = 3046.43, z = 50.5, h = 134.5, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Owner",
        },
    },
    ["bennys"] = {
        money = 0,
        coords = {x = -206.6238861084, y = -1341.6508789063, z = 34.894542694092, h = 268.3782043457, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Owner",
        },
        depositJobRestrictions = {
            "Head Mechanic",
            "Mechanic",
        },
    },
    ["mechanic1"] = {
        money = 0,
        coords = {x = -1172.38, y = -1698.69, z = 4.42, h = 170.28, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Owner",
            "Head Mechanic",
            "Head Salesman",
            "Drift King",
        },
    },
    ["mechanic2"] = {
        money = 0,
        coords = {x = 954.49591064453, y = -962.92150878906, z = 39.506778717041, h = 88.134582519531, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Owner",
        },
        depositJobRestrictions = {
            "Scrapper",
            "Apprentice",
            "Mechanic",
            "Fabricator and Body Mechanic",
            "Head Mechanic",
        }
    },
    ["bestbuds"] = {
        money = 0,
        coords = {x = 377.47, y = -824.08, z = 29.3, h = 130.21, r = 1.0},
        transactions = {},
    },
    ["drkush"] = {
        money = 0,
        coords = {x = -180.67, y = 6386.82, z = 31.5, h = 130.21, r = 1.0},
        transactions = {},
    },
    ["theranch"] = {
        money = 0,
        coords = {x = 1391.49, y = 1158.88, z = 114.33, h = 130.21, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "High Table",
        },
    },
    ["blackbarrelllc"] = {
        money = 0,
        coords = {x = 983.69458007812, y = -125.76126861572, z = 78.889976501465, h = 49.283847808838, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "LLC Owner",
        },
    },
    ["reapers"] = {
        money = 0,
        coords = {x = 983.45, y = -125.63, z = 78.89, h = 41.76, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Reaper",
        },
    },
    ["cardealer"] = {
        money = 0,
        coords = {x = -810.71, y = -204.79, z = 37.12, h = 255.48, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Jr. Salesman",
            "Senior Salesman",
            "Store Manager",
            "PDM Co Owner",
            "PDM Owner",
        },
    },
    ["esballas"] = {
        money = 0,
        coords = {x = 1060.22, y = -3182.07, z = -39.16, h = 351.92, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "setleader",
            "leader",
        },
    },
    ["grove"] = {
        money = 0,
        coords = {x = 1017.14, y = -3194.35, z = -39.99, h = 351.92, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "OG",
            "OG Boss",
        },
    },
    ["vagos"] = {
        money = 0,
        coords = {x = 1087.19, y = -3194.13, z = -38.99, h = 351.92, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Prince Vago",
            "EL Jefe",
        },
    },
    ["ssballas"] = {
        money = 0,
        coords = {x = 1116.67, y = -3196.32, z = -40.4, h = 351.92, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Double OG",
            "Shot Calla",
        },
    },
    ["havocmc"] = {
        money = 0,
        coords = {x = 206.07, y = -994.69, z = -99.0, h = 351.92, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "VP",
            "President",
        },
    },
    ["thefirm"] = {
        money = 0,
        coords = {x = 1396.77, y = 3604.79, z = 39.94, h = 351.92, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "COO",
            "CEO",
        },
    },
    ["aztecas"] = {
        money = 0,
        coords = {x = 1088.401, y = -3101.28, z = -38.99996, h = 351.92, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Gang Shottaz",
            "War Command",
            "OGs Right Hand",
            "OGs",
        },
    },
    ["unemployed"] = {
        money = 0,
        coords = {x = 169.34, y = -1006.16, z = -99.0, h = 351.92, r = 1.0},
        transactions = {},
    },
    ["blackrose"] = {
        money = 0,
        coords = {x = -125.82270050049, y = -642.85577392578, z = 168.82052612305, h = 351.92, r = 1.0},
        transactions = {},
        jobRestrictions = {
            "Owner",
        },
    },
    ["realestateagent"] = {
        money           = 0,
        coords          = { x = -1553.3938, y = -575.5849, z = 108.5271, h = 305.0449, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Chief Executive Officer",
        },
        depositJobRestrictions = {
            "Manager",
            "Chief Executive Officer",
        },
    },
    ["house"] = {
        money           = 0,
        coords          = { x = -1510.74109, y = 102.51886, z = 52.24067, h = 136.56687, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Consigliere",
            "Underboss",
            "Boss",
        },
    },
    ["crownclub"] = { 
        money           = 0,
        coords          = { x = 765.634, y = -1318.49, z = 22.00, h = 172.28, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Owner",
        },
    },
    ["tequila"] = {
        money           = 0,
        coords          = { x = -571.67, y = 289.02, z =79.17, h = 265.95, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Management",
        },
    },
    ["drift"] = {
        money           = 0,
        coords          = { x = 54.482452392578, y = -2573.3317871094, z = 6.2639322280884, h = 0.76713865995407, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Overboost Manager",
        },
    },
    ["casino"] = {
        money           = 0,
        coords          = { x = 1120.21, y =  218.06, z = -49.43, h = 311.74, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Management",
            "Owner",
        },
    },
    ["arcade"] = {
        money           = 0,
        coords          = { x = 2728.28, y = -374.38, z = -47.38, h = 311.74, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Management",
            "Owner",
        },
    },
    ["ammunation"] = {
        money           = 0,
        coords          = { x = 1164.19, y = -3199.26, z = -39.00, h = 311.74, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Management",
            "Owner",
        },
    },
    ["pizza"] = {
        money           = 0,
        coords          = { x = 291.67, y = -990.72, z = 29.43, h = 88.64, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Manager",
            "Owner",
        },
    },
    ["taco"] = {
        money           = 0,
        coords          = { x = 428.75, y = -1914.27, z = 25.47, h = 315.37, r = 1.0 },
        transactions    = {},
        jobRestrictions = {
            "Manager",
        },
    },
}