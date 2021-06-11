Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config = {}

Config.MinZOffset = 45

Config.MinimumHouseRobberyPolice = 3

Config.Rewards = {
    ["cabin"] = {
        "plastic",
        "diamond_ring",
        "goldchain",
        "plastic",
        "diamond_ring",
        "weed_brick",
        "plastic",
        "diamond_ring",
        "weed_brick",
        "plastic",
        "rolex",
        "goldchain",
        "plastic",
        "rolex",
        "diamond_ring",
        "weed_brick",
        "plastic",
        "weapon_pistol",
        "xtcbaggy",
        "cokebaggy",
        "money_bands",
    },
    ["kitchen"] = {
        "tosti",
        "sandwich",
        "goldchain",
        "weed_brick",
        "sandwich",
        "goldchain",
        "plastic",
        "diamond_ring",
        "plastic",
        "rolex",
        "diamond_ring",
        "goldchain",
        "plastic",
        "rolex",
        "diamond_ring",
        "goldchain",
        "plastic",
        "money_bands",
        "money_bands",
        "money_bands",
    },
    ["chest"] = {
        "plastic",
        "rolex",
        "diamond_ring",
        "goldchain",
        "weed_brick",
        "rolex",
        "diamond_ring",
        "goldchain",
        "plastic",
        "weed_brick",
        "plastic",
        "rolex",
        "diamond_ring",
        "goldchain",
        "weed_brick",
        "rolex",
        "diamond_ring",
        "goldchain",
        "plastic",
        "weapon_pistol",
        "xtcbaggy",
        "cokebaggy",
        "smg_ammo",
        "rifle_ammo",
        "money_bands",
        "plastic",
        "rolex",
        "diamond_ring",
        "goldchain",
        "weed_brick",
        "rolex",
        "diamond_ring",
        "goldchain",
        "plastic",
        "weed_brick",
        "plastic",
        "rolex",
        "diamond_ring",
        "goldchain",
        "weed_brick",
        "rolex",
        "diamond_ring",
        "goldchain",
        "plastic",
        "weapon_pistol",
        "xtcbaggy",
        "cokebaggy",
        "smg_ammo",
        "rifle_ammo",
        "money_bands",
        "security_card_00",
    },
}

Config.Houses = {
    ["grovestreet1"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 252.7,
            ["y"] = -1670.96,
            ["z"] = 29.66,
            ["h"] = 135.19,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["grovestreet2"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 281.67,
            ["y"] = -1694.39,
            ["z"] = 29.65,
            ["h"] = 52.96,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["grovestreet3"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 269.54,
            ["y"] = -1712.82,
            ["z"] = 29.67,
            ["h"] = 142.91,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["grovestreet4"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 257.53,
            ["y"] = -1723.13,
            ["z"] = 29.65,
            ["h"] = 323.87,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["grovestreet5"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 222.91,
            ["y"] = -1702.71,
            ["z"] = 29.70,
            ["h"] = 39.36,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["grovestreet6"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 249.79,
            ["y"] = -1730.76,
            ["z"] = 29.67,
            ["h"] = 227.19,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["grovestreet7"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 216.73,
            ["y"] = -1717.13,
            ["z"] = 29.48,
            ["h"] = 211.11,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vagoshouse1"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 282.70,
            ["y"] = -1899.00,
            ["z"] = 27.27,
            ["h"] = 142.91,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vagoshouse2"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 270.27,
            ["y"] = -1917.17,
            ["z"] = 26.18,
            ["h"] = 136.83,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vagoshouse3"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 258.14,
            ["y"] = -1927.35,
            ["z"] = 25.44,
            ["h"] = 318.12,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vagoshouse4"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 250.33,
            ["y"] = -1934.90,
            ["z"] = 24.70,
            ["h"] = 247.74,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["shop1"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 87.0,
            ["y"] = -1670.27,
            ["z"] = 29.17,
            ["h"] = 142.91,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["shop2"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 95.88,
            ["y"] = -1682.45,
            ["z"] = 29.26,
            ["h"] = 140.91,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["shop3"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 104.78,
            ["y"] = -1690.30,
            ["z"] = 29.28,
            ["h"] = 325.67,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["shop4"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 143.42,
            ["y"] = -1722.05,
            ["z"] = 29.29,
            ["h"] = 137.60,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["shop5"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 131.3,
            ["y"] = -1771.93,
            ["z"] = 29.70,
            ["h"] = 321.27,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["shop6"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 98.58,
            ["y"] = -1308.76,
            ["z"] = 29.28,
            ["h"] = 116.58,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["shop7"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 122.70,
            ["y"] = -1348.34,
            ["z"] = 29.29,
            ["h"] = 126.67,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["shop8"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 65.99,
            ["y"] = -1467.42,
            ["z"] = 29.29,
            ["h"] = 191.05,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vinewood1"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = -595.41,
            ["y"] = 529.9,
            ["z"] = 107.76,
            ["h"] = 18.81,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vinewood2"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = -580.44,
            ["y"] = 491.49,
            ["z"] = 108.90,
            ["h"] = 190.16,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vinewood3"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = -622.92,
            ["y"] = 488.95,
            ["z"] = 107.76,
            ["h"] = 18.81,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vinewood4"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = -640.88,
            ["y"] = 520.06,
            ["z"] = 109.69,
            ["h"] = 11.03,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vinewood5"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = -667.34,
            ["y"] = 472.32,
            ["z"] = 114.14,
            ["h"] = 193.86,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["vinewood6"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = -678.98,
            ["y"] = 511.98,
            ["z"] = 113.53,
            ["h"] = 20.79,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Searching Kitchen Cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightstand"
            },
        }
    },
    ["geilhuisje"] = {
        ["coords"] = {
            ["x"] = 996.83,
            ["y"] = -729.51,
            ["z"] = 57.82,
            ["h"] = 229.5,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinets"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night closet"
            },
        }
    },
    ["kechie"] = {
        ["coords"] = {
            ["x"] = -1100.48,
            ["y"] = 797.94,
            ["z"] = 167.26,
            ["h"] = 229.5,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabinets"
            },
        }
    },
    ["needasniks"] = {
        ["coords"] = {
            ["x"] = -3205.72,
            ["y"] = 1152.32,
            ["z"] = 9.66,
            ["h"] = 229.5,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Nightcabinet"
            },
        }
    },
    ["12345"] = {
        ["coords"] = {
            ["x"] = -1063.74, 
            ["y"] = -1054.91, 
            ["z"] = 2.15, 
            ["h"] = 97.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
        }
    },
    ["12sdgsd345"] = {
        ["coords"] = {
            ["x"] = -1057.69, 
            ["y"] = -1540.68, 
            ["z"] = 5.06, 
            ["h"] = 331.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night cabinet"
            },
        }
    },
    ["house1"] = {
        ["coords"] = {
            ["x"] = -1951.45, 
            ["y"] = -543.34, 
            ["z"] = 14.73, 
            ["h"] = 159.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
        }
    },
    ["house2"] = { -- Moved 28-1-20
        ["coords"] = {
            ["x"] = 1673.64, 
            ["y"] = 4658.19, 
            ["z"] = 43.41, 
            ["h"] = 133.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house3"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 2556.78, 
            ["y"] = 4273.85, 
            ["z"] = 41.99, 
            ["h"] = 18.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house4"] = {
        ["coords"] = {
            ["x"] = -272.73, 
            ["y"] = 6400.81, 
            ["z"] = 31.5, 
            ["h"] = 172.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house5"] = {
        ["coords"] = {
            ["x"] = 1522.75, 
            ["y"] = 6329.13, 
            ["z"] = 24.61, 
            ["h"] = 164.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house6"] = {
        ["coords"] = {
            ["x"] = -761.91, 
            ["y"] = 430.95, 
            ["z"] = 100.2, 
            ["h"] = 85.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house7"] = {
        ["coords"] = {
            ["x"] = -533.19, 
            ["y"] = 709.62, 
            ["z"] = 153.15, 
            ["h"] = 236.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house8"] = {
        ["coords"] = {
            ["x"] = 1251.58, 
            ["y"] = -424.02, 
            ["z"] = 69.91, 
            ["h"] = 49.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house9"] = {
        ["coords"] = {
            ["x"] = 312.35, 
            ["y"] = -1764.27, 
            ["z"] = 29.16, 
            ["h"] = 11.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house10"] = {
        ["coords"] = {
            ["x"] = -805.72, 
            ["y"] = -959.17, 
            ["z"] = 18.21, 
            ["h"] = 30.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house11"] = {
        ["coords"] = {
            ["x"] = 222.78, 
            ["y"] = -1702.41, 
            ["z"] = 29.7, 
            ["h"] = 310.5
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house12"] = {
        ["coords"] = {
            ["x"] = 1060.49, 
            ["y"] = -378.22, 
            ["z"] = 68.23, 
            ["h"] = 41.5,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house18"] = {
        ["coords"] = {
            ["x"] = 405.54, 
            ["y"] = -1751.36, 
            ["z"] = 29.71, 
            ["h"] = 319.04,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house19"] = {
        ["coords"] = {
            ["x"] = 419.04, 
            ["y"] = -1735.44, 
            ["z"] = 29.60, 
            ["h"] = 327.08,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house20"] = {
        ["coords"] = {
            ["x"] = 431.18, 
            ["y"] = -1725.39, 
            ["z"] = 29.60, 
            ["h"] = 318.02,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house21"] = {
        ["coords"] = {
            ["x"] = 443.39, 
            ["y"] = -1707.26, 
            ["z"] = 29.70, 
            ["h"] = 243.17,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house22"] = {
        ["coords"] = {
            ["x"] = 500.63, 
            ["y"] = -1697.17, 
            ["z"] = 29.78, 
            ["h"] = 332.14,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house23"] = {
        ["coords"] = {
            ["x"] = 489.61, 
            ["y"] = -1714.15, 
            ["z"] = 29.70, 
            ["h"] = 69.39,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house24"] = {
        ["coords"] = {
            ["x"] = 479.37, 
            ["y"] = -1735.66, 
            ["z"] = 29.15, 
            ["h"] = 327.56,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },
    ["house25"] = {
        ["coords"] = {
            ["x"] = 474.76, 
            ["y"] = -1757.72, 
            ["z"] =  29.09, 
            ["h"] = 73.49,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Cabinet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search closet"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Kitchen Cabinet"
            },
        }
    },         
}

Config.MaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [18] = true,
    [26] = true,
    [52] = true,
    [53] = true,
    [54] = true,
    [55] = true,
    [56] = true,
    [57] = true,
    [58] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [112] = true,
    [113] = true,
    [114] = true,
    [118] = true,
    [125] = true,
    [132] = true,
}

Config.FemaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [19] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [63] = true,
    [64] = true,
    [65] = true,
    [66] = true,
    [67] = true,
    [68] = true,
    [69] = true,
    [70] = true,
    [71] = true,
    [129] = true,
    [130] = true,
    [131] = true,
    [135] = true,
    [142] = true,
    [149] = true,
    [153] = true,
    [157] = true,
    [161] = true,
    [165] = true,
}