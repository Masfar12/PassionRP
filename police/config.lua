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

Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = false},
    ["barier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["schotten"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}

Config.Locations = {

    CadetArmoury = {Coords = vector3(-1492.69, 4971.49, 63.9)},

    ["duty"] = {
        [1] = {x = 468.496, y = -974.9340, z = 25.273, h = 90.654},
        [2] = {x = 453.021, y = -985.3269, z = 30.689, h = 90.654},
        [3] = {x = 1853.059204, y = 3688.8442, z = 34.27010, h = 252.228}, -- Sandy
        [4] = {x = 126.13, y = -767.45, z = 242.69, h = 144.67},
        [5] = {x = 1834.72, y = 2570.84, z = 45.89, h = 247.35},
        [6] = {x = -913.243, y = -3021.766, z = 13.945, h = 238.517},
        [7] = {x = 4427.85, y = -4451.83, z = 7.23, h = 185.54},
        [8] = {x = -449.27, y = 6012.63, z = 31.72, h = 244.36}, -- Paleto
    },
   ["vehicle"] = {
       [1] = {x = 457.87, y = -991.426, z = 25.38, h = 90.654},
       [2] = {x = 471.13, y = -1024.05, z = 28.17, h = 274.5},
       [3] = {x = -455.39, y = 6002.02, z = 31.34, h = 87.93},
       [4] = {x = 1853.6, y = 3676.29, z = 33.52, h = 209.67}, -- Sandy
       [5] = {x = 537.58, y = -39.5, z = 70.77, h = 210.96},
       [6] = {x = -1070.4, y = -858.76, z = 4.87, h = 200.84},
       [7] = {x = 1833.43, y = 2542.18, z = 45.88, h = 275.69},
       [8] = {x = 4467.48, y = -4469.50, z = 4.24, h = 211.88},
       [9] = {x = -2343.55, y = 3248.89, z = 32.83, h = 330.44}, -- Paleto
    },
   ["stash"] = {
       [1] = {x = 462.361, y = -999.62, z = 30.689, h = 90.654, requiresOnDuty = true},
       [2] = {x = 446.888, y = -996.77, z = 30.689, h = 316.5, r = 1.0, requiresOnDuty = true},
       [3] = {x = 1842.8521, y = 3688.2587, z = 30.26853, h = 172.62683, r = 1.0, requiresOnDuty = true}, -- Sandy
       [4] = {x = 143.413, y = -764.410, z = 242.152, h = 246.609, r = 1.0, requiresOnDuty = false},
       [5] = {x = 1764.1, y = 2589.6, z = 49.71, h = 172.09, r = 1.0, requiresOnDuty = true},
       [6] = {x = -434.31, y = 6002.06, z = 31.72, h = 341.96, r = 1.0, requiresOnDuty = true}, -- Paleto
   },
   ["impound"] = {
       [1] = {x = 435.09, y = -976.61, z = 24.95, h = 180.0},
       [2] = {x = -436.14, y = 5982.63, z = 31.34, h = 136.0, r = 1.0},
   },
   ["helicopter"] = {
       [1] = {x = 449.168, y = -981.325, z = 43.691, h = 87.234, requiresOnDuty = true, isCiu = false},
       [2] = {x = -475.43, y = 5988.353, z = 31.716, h = 31.34, requiresOnDuty = true, isCiu = false},
       [3] = {x = 122.156, y = -741.844, z = 262.846, h = 340.374, requiresOnDuty = false, isCiu = true},
       [4] = {x = 4491.80, y = -4460.66, z = 4.22, h = 291.95, requiresOnDuty = false, isCiu = true},
       [5] = {x = 1770.0089111328, y = 3239.4819335938, z = 42.130783081055, h = 261.0901184082, requiresOnDuty = false, isCiu = false},
   },
   ["armory"] = { -- Standard Armourys
        [1] = {x = 482.52, y = -995.45, z = 30.68, h = 90.654, requiresOnDuty = true}, -- MRPD
        [2] = {x = 156.23, y = -740.85, z = 242.15, h = 160.34, requiresOnDuty = false}, -- FBI
        [3] = {x = 1763.84, y = 2592.85, z = 49.71, h = 92.98, requiresOnDuty = false}, -- DOC
        [4] = {x = 1861.328, y = 3689.3405, z = 34.2700, h = 123.0585, requiresOnDuty = true}, -- Sandy
        [5] = {x = -434.98, y = 5998.83, z = 31.72, h = 64.10, requiresOnDuty = true}, -- Paleto
   },
   ["armory2"] = { -- Command Armourys
        [1] = {x = 485.68, y = -995.71, z =  30.68, h = 90.654, requiresOnDuty = true}, -- MRPD
        [2] = {x = 1841.48, y = 3689.56, z = 33.79, h = 2.16, requiresOnDuty = true}, -- Sandy PD Toilet??
        [3] = {x = 156.23, y = -740.85, z = 242.15, h = 160.34, requiresOnDuty = false}, -- FBI
        [4] = {x = -2352.81, y = 3257.74, z = 32.81, h = 29.34, requiresOnDuty = true}, -- Paleto
    },
   ["trash"] = {
        [1] = {x = 472.14, y = -992.58, z = 26.27, h = 299.5},
        [2] = {x = 1839.291992, y =  3694.2739, z = 30.268527, h = 219.2518}, -- Sandy
        [3] = {x = -437.17, y = 6012.50, z = 27.99, h = 41.87}, -- Paleto

   },
   ["fingerprint"] = {
       [1] = {x = 474.74, y = -1014.25, z = 25.27, h = 358.5},
       [2] = {x = -442.38, y = 6011.9, z = 27.98, h = 311.5},
       [3] = {x = 1858.43896, y = 3686.9506, z = 30.26851, h = 29.57863044}, -- Sandy
   },
   ["stations"] = {
       [1] = {label = "LSPD", coords = {x = 428.23, y = -984.28, z = 29.76, h = 3.5}},
       [2] = {label = "Jail", coords = {x = 1845.903, y = 2585.873, z = 45.672, h = 272.249}},
       [3] = {label = "Paleto PD", coords = {x = -451.55, y = 6014.25, z = 31.716, h = 223.81}},
       [4] = {label = "Sandy PD", coords = {x = 1856.36, y = 3681.74, z = 34.27, h = 205.01}},
    },
    ["donuts"] = {
        [1] = {x = 461.862, y = -977.841, z = 31.27, h = 90.170},
        [2] = {x = 1847.896118, y = 3685.406, z = 34.27, h = 236.513}, -- Sandy
        [3] = {x = -449.331, y = 6012.538, z = 36.507, h = 83.056}, -- Paleto
        [4] = {x = 150.843, y = -749.544, z = 242.151, h = 160.197},
    },
    ciu = {
        gradeLock = 6,
        entrances = {
            {
                outside = {x = 138.939, y = -762.816, z = 45.752, h = 161.048, txt = "Enter"},
                inside = {x = 136.247, y = -761.745, z = 242.152, h = 156.899, txt = "Leave"},
            },
            {
                outside = {x = 405.02697753906, y = -978.34826660156, z = -99.004188537598, h = 89.671, txt = "Enter"},
                inside = {x = 135.574, y = -744.249, z = 42.152, h = 248.565, txt = "Parking"},
            },
            {
                outside = {x = 127.188, y = -729.112, z = 242.152, h = 69.795, txt = "Top Floor"},
                inside = {x = 156.772, y = -757.437, z = 258.151, h = 155.959, txt = "Office"},
            },
            {
                outside = {x = 115.027, y = -741.936, z = 258.152, h = 338.403, txt = "The Roof"},
                inside = {x = 115.058, y = -733.843, z = 250.166, h = 69.169, txt = "Top Floor"},
            },
        },
        evidence = {
            {x = 118.67, y = -729.19, z = 242.15, h = 66.78},
        },
        vehicleLocations = {
            {x = 405.46380615234, y = -952.75421142578, z = -99.004081726074, h = 92.933},
        },
        vehicles = {
            ["asea"] = {label = "Asea", minGrade = 6},
            ["rapidgt"] = {label = "Rapid GT", minGrade = 6},
            ["trophytruck"] = {label = "Trophy Truck", minGrade = 6},
            ["alpha"] = {label = "Alpha", minGrade = 6},
            ["futo"] = {label = "Futo", minGrade = 6},
            ["ninef2"] = {label = "9F Cabrio", minGrade = 6},
            ["zion2"] = {label = "Zion Cabrio", minGrade = 6},
            ["sabregt"] = {label = "Sabre GT", minGrade = 6},
            ["revolter"] = {label = "Revolter", minGrade = 6},
            ["raiden"] = {label = "Raiden", minGrade = 6},
            ["rover"] = {label = "Range Rover", minGrade = 7},
            ["polschafter3"] = {label = "UC Schafter", minGrade = 7},
        },
    },
}

Config.ArmoryWhitelist = {
    "PXS38978", -- newton
    "FUU07010", -- sak
    "JPL21680", -- midge
    "HKG28808", -- hammy
    "MAR30437", -- vasquez
    "USU38124", -- teknik/andrew
    "SHM67498", -- dean
    "MZN93839", -- Sudo
    "FYB51095", -- L4zy
    "MYS03805", -- DirtyDangus
    "KRJ72588", -- Archerrem
    "JMI19602", -- Tyler Grey
    "TJL63690", -- KJL
    "YDW60192", -- Vinny Calora
    "DTU24997", -- Sami
    "GVR71955", -- Bon
    "HSI29831", -- Lauren
    "MSJ20341", -- TCaster
    "PYN94903", -- Pig
    "HKN69215", -- XL Frodo Feet
    "TSA17299", -- Corrupted Badger
    "OKP99605", -- Bishop
    "USX70201", -- Chevy
    "OZN68643", -- Sponge
    "AHQ00556", -- Gudthehood
    "BCL14498", -- Jammy
    "RQK86940", -- 0130
    "SUZ11807", -- Joejack
    "TDB41124", -- Lexii
    "CMQ92752", -- Dicko
    "RVV44315", -- Mayankb
    "FOK16164", -- Revan
    "ATD41736", -- Ethan Mcgregor
    "LYS31302", -- Deluca
    "ECN87740", -- Acexmaiden
    "NRT56490", -- Road to Silver
    "UJQ98223", -- Big Poppa
    "NPA63367", -- pig2
    "SMP60781", -- Wex
    "WDR94106", -- Cavo
    "NOO68756", -- StaleMemeLord
    "CQT47860", -- Liam
    "ZWY89448", -- Tudy
    "VJN10378", -- JustinYummerz
    "XQY13082", -- Skylar Gray
    "JJU04035", -- Adam Hill
    "CNE76385", -- Luke Jones
    "YZB85402", -- Don Nut
    "UGO38439", -- Josh Brady
    "YUT08213", -- Matty
    "RVV44315", -- Mayank
    "NJA97537", -- Atlas
    "PJH83513", -- Ghost Spider
    "FXE84502", -- Sami
}

Config.Helicopter = "eheli"
Config.CIUHelicopter = "supervolito"

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Pacific Bank CAM#1", x = 257.45, y = 210.07, z = 109.08, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = false, isOnline = true, ip = 1},
        [2] = {label = "Pacific Bank CAM#2", x = 232.86, y = 221.46, z = 107.83, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = false, isOnline = true, ip = 2},
        [3] = {label = "Pacific Bank CAM#3", x = 252.27, y = 225.52, z = 103.99, r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = false, isOnline = true, ip = 3},
        [4] = {label = "Limited Ltd Grove St. CAM#1", x = -53.1433, y = -1746.714, z = 31.546, r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true, ip = 4},
        [5] = {label = "Rob's Liqour Prosperity St. CAM#1", x = -1482.9, y = -380.463, z = 42.363, r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true, ip = 5},
        [6] = {label = "Rob's Liqour San Andreas Ave. CAM#1", x = -1224.874, y = -911.094, z = 14.401, r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true, ip = 6},
        [7] = {label = "Limited Ltd Ginger St. CAM#1", x = -718.153, y = -909.211, z = 21.49, r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true, ip = 7},
        [8] = {label = "24/7 Supermarket Innocence Blvd. CAM#1", x = 23.885, y = -1342.441, z = 31.672, r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true, ip = 8},
        [9] = {label = "Rob's Liqour El Rancho Blvd. CAM#1", x = 1133.024, y = -978.712, z = 48.515, r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true, ip = 9},
        [10] = {label = "Limited Ltd West Mirror Drive CAM#1", x = 1151.93, y = -320.389, z = 71.33, r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true, ip = 10},
        [11] = {label = "24/7 Supermarket Clinton Ave CAM#1", x = 383.402, y = 328.915, z = 105.541, r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true, ip = 11},
        [12] = {label = "Limited Ltd Banham Canyon Dr CAM#1", x = -1832.057, y = 789.389, z = 140.436, r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true, ip = 12},
        [13] = {label = "Rob's Liqour Great Ocean Hwy CAM#1", x = -2966.15, y = 387.067, z = 17.393, r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true, ip = 13},
        [14] = {label = "24/7 Supermarket Ineseno Road CAM#1", x = -3046.749, y = 592.491, z = 9.808, r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true, ip = 14},
        [15] = {label = "24/7 Supermarket Barbareno Rd. CAM#1", x = -3246.489, y = 1010.408, z = 14.705, r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true, ip = 15},
        [16] = {label = "24/7 Supermarket Route 68 CAM#1", x = 539.773, y = 2664.904, z = 44.056, r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true, ip = 16},
        [17] = {label = "Rob's Liqour Route 68 CAM#1", x = 1169.855, y = 2711.493, z = 40.432, r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true, ip = 17},
        [18] = {label = "24/7 Supermarket Senora Fwy CAM#1", x = 2673.579, y = 3281.265, z = 57.541, r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true, ip = 18},
        [19] = {label = "24/7 Supermarket Alhambra Dr. CAM#1", x = 1966.24, y = 3749.545, z = 34.143, r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true, ip = 19},
        [20] = {label = "24/7 Supermarket Senora Fwy CAM#2", x = 1729.522, y = 6419.87, z = 37.262, r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true, ip = 20},
        [21] = {label = "Fleeca Bank Hawick Ave CAM#1", x = 309.341, y = -281.439, z = 55.88, r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true, ip = 21},
        [22] = {label = "Fleeca Bank Legion Square CAM#1", x = 144.871, y = -1043.044, z = 31.017, r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true, ip = 22},
        [23] = {label = "Fleeca Bank Hawick Ave CAM#2", x = -355.7643, y = -52.506, z = 50.746, r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true, ip = 23},
        [24] = {label = "Fleeca Bank Del Perro Blvd CAM#1", x = -1214.226, y = -335.86, z = 39.515, r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true, ip = 24},
        [25] = {label = "Fleeca Bank Great Ocean Hwy CAM#1", x = -2958.885, y = 478.983, z = 17.406, r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true, ip = 25},
        [26] = {label = "Paleto Bank CAM#1", x = -102.939, y = 6467.668, z = 33.424, r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = false, isOnline = true, ip = 26},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", x = -163.75, y = 6323.45, z = 33.424, r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true, ip = 27},
        [28] = {label = "Don's Country Store Paleto Bay CAM#1", x = 166.42, y = 6634.4, z = 33.69, r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true, ip = 28},
        [29] = {label = "Don's Country Store Paleto Bay CAM#2", x = 163.74, y = 6644.34, z = 33.69, r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true, ip = 29},
        [30] = {label = "Don's Country Store Paleto Bay CAM#3", x = 169.54, y = 6640.89, z = 33.69, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true, ip = 30},
        ["pbox1"] = {label = "Pillbox Reception Area CAM#1", x = 301.39, y = -581.6, z = 45.5, r = {x = -35.0, y = 0.0, z = 198.5}, canRotate = false, isOnline = true, ip = 31},
        ["pbox2"] = {label = "Pillbox Reception Area CAM#2", x = 328.0, y = -591.15, z = 45.5, r = {x = -35.0, y = 0.0, z = 112.31}, canRotate = false, isOnline = true, ip = 32},
        ["pbox3"] = {label = "Pillbox Corridor CAM#1", x = 306.1, y = -569.7, z = 45.5, r = {x = -35.0, y = 0.0, z = 208.82}, canRotate = false, isOnline = true, ip = 33},
        ["pbox4"] = {label = "Pillbox Corridor CAM#2", x = 348.78, y = -585.19, z = 45.5, r = {x = -35.0, y = 0.0, z = 110.0}, canRotate = false, isOnline = true, ip = 34},
        ["pbox5"] = {label = "Pillbox Corridor CAM#3", x = 364.5, y = -594.9, z = 45.5, r = {x = -35.0, y = 0.0, z = 43.3}, canRotate = false, isOnline = true, ip = 35},
        ["pbox6"] = {label = "Pillbox Outer CAM#1", x = 301.95, y = -576.01, z = 45.5, r = {x = -35.0, y = 0.0, z = 107.94}, canRotate = false, isOnline = true, ip = 36},
        ["jail1"] = {label = "Jail Gates CAM#1", x = 1828.4, y = 2605.27, z = 47.8, r = {x = -25.0, y = 0.0, z = 75.81}, canRotate = false, isOnline = true, ip = 37},
        ["jail2"] = {label = "Jail Gates CAM#2", x = 1828.4, y = 2605.27, z = 47.8, r = {x = -25.0, y = 0.0, z = 283.76}, canRotate = false, isOnline = true, ip = 38},
        ["jail3"] = {label = "Jail Indoors CAM#1", x = 1787.13, y = 2580.35, z = 47.8, r = {x = -25.0, y = 0.0, z = 194.88}, canRotate = false, isOnline = true, ip = 39},
        ["jail4"] = {label = "Jail Indoors CAM#2", x = 1787.13, y = 2580.35, z = 47.8, r = {x = -25.0, y = 0.0, z = 349.11}, canRotate = false, isOnline = true, ip = 40},
        ["mrpd1"] = {label = "MRPD Outdoors CAM#1", x = 433.12, y = -978.43, z = 32.5, r = {x = -25.0, y = 0.0, z = 117.1}, canRotate = false, isOnline = true, ip = 41},
        ["mrpd2"] = {label = "MRPD Outdoors CAM#2", x = 424.09, y = -996.76, z = 33.5, r = {x = -25.0, y = 0.0, z = 127.36}, canRotate = false, isOnline = true, ip = 42},
        -- ["mrpd3"] = {label = "MRPD PERIMETER CAM#1", x = 439.9045, y = -986.8246, z = 33.6687, r = {x = 0.0, y = 0.0, z = 129.84}, canRotate = true, isOnline = true, ip = 43},
        -- ["mrpd4"] = {label = "MRPD Reception CAM#2", x = 444.56, y = -974.96, z = 32.5, r = {x = -25.0, y = 0.0, z = 145.12}, canRotate = false, isOnline = true, ip = 44},
        -- ["cells1"] = {label = "MRPD Cells CAM#1", x = 465.22, y = -985.24, z = 27.5, r = {x = -25.0, y = 0.0, z = 159.46}, canRotate = false, isOnline = true, ip = 45},
        -- ["cells2"] = {label = "MRPD Cells CAM#2", x = 465.38, y = -995.69, z = 26.8, r = {x = -25.0, y = 0.0, z = 127.72}, canRotate = false, isOnline = true, ip = 46},
        -- ["cells3"] = {label = "MRPD Cells CAM#3", x = 469.33, y = -995.07, z = 26.8, r = {x = -25.0, y = 0.0, z = 226.06}, canRotate = false, isOnline = true, ip = 47},
        -- ["cells4"] = {label = "MRPD Cells CAM#4", x = 478.24, y = -996.34, z = 25.8, r = {x = -25.0, y = 0.0, z = 157.5}, canRotate = false, isOnline = true, ip = 48},
        ["p1hostage"] = {label = "LSIA Hostage Training room", x = -939.401, y = -2932.351, z = 15.928, r = {x = -25.0, y = 0.0, z = 269.342}, canRotate = false, isOnline = true, ip = 49},
    },
}

Config.Vehicles = {
    ["pdbicycle"] = {label = "PD Bicycle", minGrade = 0},
    ["pd1"] = {label = "CVPI", minGrade = 0},
    ["pd3"] = {label = "18 Charger", minGrade = 1},
    ["pd4"] = {label = "Ford Explorer", minGrade = 2},
    ["pd10"] = {label = "Chevrolet Silverado K9 Unit", minGrade = 3},
    ["pdsanchez"] = {label = "MBU Sanchez Bike", minGrade = 1},
    ["pbike2"] = {label = "MBU BMW Bike", minGrade = 1},
    ["pdbike"] = {label = "MBU Harley Bike", minGrade = 1},
    ["polchal"] = {label = "VSU Challenger", minGrade = 1},
    ["riot"] = {label = "SWAT Riot", minGrade = 3},
    ["2015wbpolstang"] = {label = "Ford Mustang", minGrade = 2},
    ["polcoquette"] = {label = "UC Coquette", minGrade = 5},
    ["polschafter3"] = {label = "UC Schafter", minGrade = 5},
    ["c8cop"] = {label = "Corvette C8 (HC+ Only)", minGrade = 7},
}

Config.AmmoLabels = {
    ["AMMO_PISTOL"] = "9x19mm Parabellum bullet",
    ["AMMO_SMG"] = "9x19mm Parabellum bullet",
    ["AMMO_RIFLE"] = "7.62x39mm bullet",
    ["AMMO_MG"] = "7.92x57mm Mauser bullet",
    ["AMMO_SHOTGUN"] = "12-gauge bullet",
    ["AMMO_SNIPER"] = "Big caliber bullet",
    ["AMMO_TAZER"] = "Tazer Cartrage for shocking"
}

Config.Radars = {
    {x = 408.5068, y = -572.304, z = 28.75586, h = 145.0 }, -- Nieuw
    {x = 46.4281, y = -962.6339, z = 29.35756, h = 145.0 }, -- Nieuw
    {x = -467.3134, y = -233.0852, z = 35.54746, h = 145.0 }, -- Nieuw
    {x = 1026.519, y = 476.3182, z = 95.04628, h = 145.0 }, -- Nieuw
    {x = 1655.263, y = 1230.564, z = 85.10913, h = 145.0 }, -- Nieuw
    {x = 2113.008, y = 2669.981, z = 50.49562, h = 145.0 }, -- Nieuw
    {x = 2847.678, y = 4246.202, z = 50.09562, h = 145.0 }, -- Nieuw
    {x = 2436.754, y = 5693.491, z = 45.18037, h = 145.0 }, -- Nieuw
    {x = 1031.556, y = 6485.532, z = 20.98927, h = 145.0 }, -- Nieuw
    {x = -818.2272, y = 5463.573, z = 33.83815, h = 145.0 }, -- Nieuw
    {x = -2451.949, y = 3780.624, z = 19.7901, h = 145.0 }, -- Nieuw
    {x = -2732.733, y = 2265.176, z = 20.49533, h = 145.0 }, -- Nieuw
    {x = -2990.164, y = 411.7597, z = 14.93312, h = 145.0 }, -- Nieuw
    {x = -2166.38, y = -349.4147, z = 13.18054, h = 145.0 }, -- Nieuw
    {x = -993.9926, y = -573.6013, z = 18.21967, h = 145.0 }, -- Nieuw
    {x = 211.0621, y = -509.8677, z = 35.01291, h = 145.0 }, -- Nieuw
    {x = 312.4433, y = -1204.583, z = 38.89259, h = 145.0 }, -- Nieuw
    {x = 1453.691, y = -1050.835, z = 55.41991, h = 145.0 }, -- Nieuw
    {x = 2610.602, y = 212.5458, z = 98.69263, h = 145.0 }, -- Nieuw
    {x = 743.6249, y = -2635.759, z = 52.11548, h = 145.0 }, -- Nieuw
    {x = 1201.906, y = -1958.109, z = 40.41339, h = 145.0 }, -- Nieuw
    {x = 406.89505004883, y = -969.06286621094, z = 29.436267852783, h = 33.0 },
    {x = -910.4824, y = -1832.847, z = 34.7788, h = 145.0 }, -- Nieuw
    {x = 1294.694, y = 1451.519, z = 99.503, h = 145.0 }, -- Nieuw
}

Config.CarItems = {
    [1] = {
        name = "empty_evidence_bag",
        amount = 10,
        info = {},
        type = "item",
        slot = 2,
    },
    [2] = {
        name = "diving_gear",
        amount = 1,
        info = {},
        type = "item",
        slot = 3,
    },
    [3] = {
        name = "parachute",
        amount = 1,
        info = {},
        type = "item",
        slot = 4,
    },
}

Config.Items = {
    label = "Police Armory",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_nightstick",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 1,
        },
        [2] = {
            name = "pistol_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "smg_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "shotgun_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "rifle_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "handcuffs",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_flashlight",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 7,
        },
        [8] = {
            name = "empty_evidence_bag",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "armor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "radio",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "heavyarmor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "tazer_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "spikestrips",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "ifak",
            price = 100,
            amount = 100,
            info = {},
            type = "item",
            slot = 14,
        },
    }
}

Config.Items2 = {
    label = "Police Armory Command",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_pistol_mk2",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH_02", label = "Flashlight"},
                    {component = "COMPONENT_PISTOL_MK2_CLIP_02", label = "Extended Clip"},
                }
            },
            type = "weapon",
            slot = 1,
        },
        [2] = {
            name = "weapon_stungun",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 2,
        },
        [3] = {
            name = "weapon_pumpshotgun_mk2",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_AT_SIGHTS", label = "Holographic Sight"}, 
                }
            },
            type = "weapon",
            slot = 3,
        },
        [4] = {
            name = "weapon_smg",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO_02", label = "1x Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 4,
        },
        [5] = {
            name = "weapon_carbinerifle",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_CARBINERIFLE_VARMOD_LUXE", label = "Skin"},
                    {component = "COMPONENT_CARBINERIFLE_CLIP_03", label = "Extended Clip"},
                    {component = "COMPONENT_AT_SCOPE_MEDIUM", label = "Scope"},
                    {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                }
            },
            type = "weapon",
            slot = 5,
        },
        [6] = {
            name = "shield",
            price = 0,
            amount = 25,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_flashbang",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "police_stormram",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
    }
}