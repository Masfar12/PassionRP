Config = {
    delivery   = {
        outsideLocation  = { x = 55.576, y = 6472.12, z = 31.42, a = 230.732 },
        insideLocation   = { x = 65.128288269043, y = 6456.119140625, z = -2.1399328708649 },
        --insideLocation = {x=1072.72,y=-3102.51,z=-40.0,a=82.95}, ORIGINAL

        pickupLocations  = {
            [1]  = { x = 67.61, y = 6464.56, z = -2.13, h = 222.30 },
            [2]  = { x = 66.10, y = 6466.42, z = -2.13, h = 218.65 },
            [3]  = { x = 64.43, y = 6468.23, z = -2.13, h = 213.78 },
            [4]  = { x = 62.94, y = 6470.28, z = -2.13, h = 215.41 },
            [5]  = { x = 61.41, y = 6472.23, z = -2.13, h = 215.19 },
            [6]  = { x = 60.13, y = 6474.02, z = -2.13, h = 211.99 },
            [7]  = { x = 58.42, y = 6476.13, z = -2.13, h = 217.69 },
            [8]  = { x = 52.95, y = 6471.24, z = -2.13, h = 33.799 },
            [9]  = { x = 54.26, y = 6469.25, z = -2.13, h = 221.61 },
            [10] = { x = 55.78, y = 6467.58, z = -2.13, h = 135.70 },
            [11] = { x = 57.18, y = 6465.34, z = -2.13, h = 312.02 },
            [12] = { x = 58.66, y = 6463.61, z = -2.13, h = 221.18 },
            [13] = { x = 60.19, y = 6462.01, z = -2.13, h = 219.43 },
            [14] = { x = 61.54, y = 6460.20, z = -2.13, h = 220.61 },
            [15] = { x = 56.00, y = 6455.38, z = -2.13, h = 225.97 },
            [16] = { x = 54.69, y = 6457.41, z = -2.13, h = 33.96 },
            [17] = { x = 53.32, y = 6459.14, z = -2.13, h = 36.78 },
            [18] = { x = 51.76, y = 6460.92, z = -2.13, h = 37.64 },
            [19] = { x = 50.19, y = 6462.74, z = -2.13, h = 41.84 },
            [20] = { x = 48.68, y = 6464.76, z = -2.13, h = 39.36 },
            [21] = { x = 47.21, y = 6466.51, z = -2.13, h = 32.18 },
        },

        --[[pickupLocations = {
            [1] = {x=1067.68,y=-3095.43,z=-39.9,a=342.39},
            [2] = {x=1065.2,y=-3095.56,z=-39.9,a=356.53},
            [3] = {x=1062.73,y=-3095.15,z=-39.9,a=184.81},
            [4] = {x=1060.37,y=-3095.06,z=-39.9,a=190.3},
            [5] = {x=1057.95,y=-3095.51,z=-39.9,a=359.02},
            [6] = {x=1055.58,y=-3095.53,z=-39.9,a=0.95},
            [7] = {x=1053.09,y=-3095.57,z=-39.9,a=347.64},
            [8] = {x=1053.07,y=-3102.46,z=-39.9,a=180.26},
            [9] = {x=1055.49,y=-3102.45,z=-39.9,a=180.46},
            [10] = {x=1057.93,y=-3102.55,z=-39.9,a=174.22},
            [11] = {x=1060.19,y=-3102.38,z=-39.9,a=189.44},
            [12] = {x=1062.71,y=-3102.53,z=-39.9,a=182.11},
            [13] = {x=1065.19,y=-3102.48,z=-39.9,a=176.23},
            [14] = {x=1067.46,y=-3102.62,z=-39.9,a=188.28},
            [15] = {x=1067.69,y=-3110.01,z=-39.9,a=173.63},
            [16] = {x=1065.13,y=-3109.88,z=-39.9,a=179.46},
            [17] = {x=1062.7,y=-3110.07,z=-39.9,a=174.32},
            [18] = {x=1060.24,y=-3110.26,z=-39.9,a=177.77},
            [19] = {x=1057.76,y=-3109.82,z=-39.9,a=183.88},
            [20] = {x=1055.52,y=-3109.76,z=-39.9,a=181.36},
            [21] = {x=1053.16,y=-3109.71,z=-39.9,a=177.0},
        }, ORIGINAL ]]
        dropLocation     = { x = 53.94, y = 6478.58, z = -2.13 },
        --dropLocation = {x = 1048.224, y = -3097.071, z = -38.999, a = 274.810}, ORIGINAL
        warehouseObjects = {
            "prop_boxpile_05a",
            "prop_boxpile_04a",
            "prop_boxpile_06b",
            "prop_boxpile_02c",
            "prop_boxpile_02b",
            "prop_boxpile_01a",
            "prop_boxpile_08a",
        },
    },
    sorting    = {
        sortItem             = "metalbox",
        timePerItem          = 1000,
        sortLocation         = {
            coords      = { x = 1335.039, y = 4306.623, z = 38.09 },
            seeDistance = 10,
            useDistance = 2.5,
            label       = "Process scrap",
        },
        rewardsTable         = {
            {
                name    = "metalscrap",
                amounts = { min = 22, max = 26 },
            }, {
                name    = "plastic",
                amounts = { min = 22, max = 26 },
            }, {
                name    = "copper",
                amounts = { min = 22, max = 26 },
            }, {
                name    = "iron",
                amounts = { min = 22, max = 26 },
            }, {
                name    = "aluminum",
                amounts = { min = 22, max = 26 },
            }, {
                name    = "steel",
                amounts = { min = 26, max = 26 }, -- higher minimum for metallurgy
            }, {
                name    = "glass",
                amounts = { min = 22, max = 26 },
            },
        },
        rewardSpecialItem    = false,
        specialRewardsTable  = {
            {
                name    = "temperedsteel",
                amounts = { min = 2, max = 3 },
            },
        },
        specialRewardChance  = 40, -- % chance of getting a roll on the special rewards table
        minimumMaterialTypes = 1,
        maximumMaterialTypes = 1,
        cashPerDelivery      = 100,
    },
    metallurgy = {
        door  = {
            coords      = vector3(2744.442, 1487.367, 30.791),
            seeDistance = 10,
            useDistance = 2.5,
            label       = "Temper Steel (Metallurgy) - 20 steel = 10 tempered steel",
        },
        swaps = {
            from             = "steel",
            to               = "temperedsteel",
            inputAmount      = 20,
            outputAmount     = 10,
            timeSeconds      = 10,
            maxActionsAtOnce = 5,
        },
    },
    keys       = {
        ["E"] = 38,
    },
}
