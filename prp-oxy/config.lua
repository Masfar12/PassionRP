Config = {}

-- Oxy runs.
Config.StartOxyPayment = 1600 -- How much you pay at the start to start the run

Config.RunAmount = math.random(8,12) -- How many drop offs the player does before it automatically stops.

Config.Payment = math.random(200, 275) -- How much you get paid when RNGsus doesnt give you oxy, divided by 2 for when it does.

Config.Item = "oxy" -- The item you receive from the oxy run. Should be oxy right??
Config.OxyChance = 950 -- Percentage chance of getting oxy on the run. Multiplied by 100. 10% = 100, 20% = 200, 50% = 500, etc. Default 55%.
Config.OxyAmount = 1 -- How much oxy you get when RNGsus gives you oxy. Default: 1.

Config.BigRewarditemChance = 90 -- Percentage of getting rare item on oxy run. Multiplied by 100. 0.1% = 1, 1% = 10, 20% = 200, 50% = 500, etc. Default 0.1%.
Config.BigRewarditem = "weapon_appistol" -- Put a rare item here which will have 0.1% chance of being given on the run.
Config.BigRewardOxyAmount = 10

Config.Launder = 'money_roll'
Config.RewardLaunder = {
	Min = 800,
	Max = 1300
}

Config.PillWorker = { ['x'] = 347.654, ['y'] = -1255.667, ['z'] = 32.471,['h'] = 323.748, ['info'] = 'boop bap' }

Config.OxyCars = { -- Cars
    [1] = "jackal",
    [2] = "sultanrs",
    [3] = "Felon",
    [4] = "sultanrs",
	[5] = "surge",
	[6] = "sultanrs",
    [7] = "superd",
    [8] = "avarus",
    [9] = "Cavalcade2",
	[10] = "20r1",
	[11] = "windsor",
    [12] = "diablous2",
    [13] = "Baller3",
    [14] = "sultanrs",
	[15] = "Feltzer2",
	[16] = "Carbonizzare",
    [17] = "kuruma",
    [18] = "cheburek",
    [19] = "Infernus2",
    [20] = "Turismo2",
}

Config.CarSpawns = {
	[1] =  { ['x'] = 381.069, ['y'] = -1253.882, ['z'] = 32.509, ['h'] = 228.818, ['info'] = ' car 1' },
	[2] =  { ['x'] = 385.044, ['y'] = -1262.839, ['z'] = 32.326, ['h'] = 320.996, ['info'] = ' car 2' },
	--[3] =  { ['x'] = 137.68, ['y'] = -1676.78,['z'] = 29.12,['h'] = 133.49, ['info'] = ' car 3' },
	--[4] =  { ['x'] = 394.88,['y'] = -1445.93,['z'] = 29.36,['h'] = 26.63, ['info'] = ' car 4' },
	--[5] =  { ['x'] = 398.57,['y'] = -1443.90,['z'] = 29.36,['h'] = 30.25, ['info'] = ' car 5' },
	--[6] =  { ['x'] = 402.31,['y'] = -1441.69,['z'] = 29.36,['h'] = 17.43, ['info'] = ' car 6' },
	--[7] =  { ['x'] = 405.68,['y'] = -1439.60,['z'] = 29.36,['h'] = 23.51, ['info'] = ' car 7' },
	--[8] =  { ['x'] = 409.33,['y'] = -1437.27,['z'] = 29.37,['h'] = 22.00, ['info'] = ' car 8' },
}

Config.DropOffs = {-- Drop off spots
	[1]  =  { ['x'] = 706.88,  ['y'] = -302.14,   ['z'] = 59.24,  ['h'] = 303.51, ['info'] = ' 1' },                --GOOD
	[2]  =  { ['x'] = -116.56, ['y'] = -644.24,   ['z'] = 36.12,  ['h'] = 240.63, ['info'] = ' 2' },                --GOOD
	[3]  =  { ['x'] = -324.91, ['y'] = -1110.14,  ['z'] = 22.97,  ['h'] = 343.92, ['info'] = ' 3' },               --GOOD
	[4]  =  { ['x'] = -577.36, ['y'] = -1124.93,  ['z'] = 22.38,  ['h'] = 306.14, ['info'] = ' 4' },               --GOOD
	[5]  =  { ['x'] = 371.84,  ['y'] = -1910.39,  ['z'] = 24.69,  ['h'] = 224.54, ['info'] = ' 5' },                --GOOD
	[6]  =  { ['x'] = 81.05,   ['y'] = -1891.95,  ['z'] = 22.39,  ['h'] = 46.86,  ['info'] = ' 6' },                  --GOOD
	[7]  =  { ['x'] = -165.1,  ['y'] = -1673.49,  ['z'] = 33.22,  ['h'] = 34.67,  ['info'] = ' 7' },                 --GOOD
	[8]  =  { ['x'] = -255.15, ['y'] = -318.12,   ['z'] = 30.1,   ['h'] = 105.57, ['info'] = ' 8' },                 --GOOD
	[9]  =  { ['x'] = -355.91, ['y'] = 35.58,     ['z'] = 47.93,  ['h'] = 176.05, ['info'] = ' chewy1' },             --GOOD
	[10] =  { ['x'] = -1333.28,['y'] = -934.69,   ['z'] = 11.35,  ['h'] = 317.51, ['info'] = ' biscuts2' },       --GOOD
	[11] =  { ['x'] = -1234.0, ['y'] = -1406.87,  ['z'] = 4.26,   ['h'] = 34.96,  ['info'] = ' are3' },             --GOOD
	[12] =  { ['x'] = 36.24,   ['y'] = -1026.67,  ['z'] = 29.48,  ['h'] = 53.04,  ['info'] = ' only4' },             --GOOD
	[13] =  { ['x'] = 188.98,  ['y'] = 307.61,    ['z'] = 105.39, ['h'] = 178.24, ['info'] = ' nice5' },            --GOOD
	[14] =  { ['x'] = 969.69,  ['y'] = -196.3,    ['z'] = 73.21,  ['h'] = 55.13,  ['info'] = ' ifthey6' },            --GOOD
	[15] =  { ['x'] = 1120.74, ['y'] = -782.88,   ['z'] = 57.7,   ['h'] = 351.42, ['info'] = ' contain7' },         --GOOD
	[16] =  { ['x'] = 1151.88, ['y'] = -1527.41,  ['z'] = 34.84,  ['h'] = 337.32, ['info'] = ' chocolate' },
	[17] =  { ['x'] = 181.7,   ['y'] = -1677.25,  ['z'] = 29.77,  ['h'] = 305.98, ['info'] = ' 9' },
	[18] =  { ['x'] = 156.97,  ['y'] = -1654.03,  ['z'] = 29.29,  ['h'] = 351.81, ['info'] = ' 10' },
	[19] =  { ['x'] = 80.82,   ['y'] = -1616.99,  ['z'] = 29.59,  ['h'] = 283.86, ['info'] = ' 11' },
	[20] =  { ['x'] = 71.03,   ['y'] = -1719.65,  ['z'] = 29.31,  ['h'] = 52.74,  ['info'] = ' 12' },
	[21] =  { ['x'] = 17.68,   ['y'] = -1820.85,  ['z'] = 24.95,  ['h'] = 80.32,  ['info'] = ' 13' },
	[22] =  { ['x'] = 152.48,  ['y'] = -1724.1,   ['z'] = 29.29,  ['h'] = 266.77, ['info'] = ' 14' },
	[23] =  { ['x'] = 270.06,  ['y'] = -1727.14,  ['z'] = 29.27,  ['h'] = 24.29,  ['info'] = ' 15' },
	[24] =  { ['x'] = 271.34,  ['y'] = -1508.79,  ['z'] = 29.18,  ['h'] = 143.8,  ['info'] = ' 16' },
	[25] =  { ['x'] = 386.27,  ['y'] = -1884.19,  ['z'] = 25.68,  ['h'] = 252.66, ['info'] = ' 17' },
	[26] =  { ['x'] = 405.82,  ['y'] = -1795.0,   ['z'] = 29.04,  ['h'] = 290.45, ['info'] = ' 18' },
    [27] =  { ['x'] = 449.1,   ['y'] = -1786.68,  ['z'] = 28.59,  ['h'] = 86.04,  ['info'] = ' 19' },
	[28] =  { ['x'] = 416.92,  ['y'] = -1735.51,  ['z'] = 29.61,  ['h'] = 44.9,   ['info'] = ' 20' },
	[29] =  { ['x'] = 464.97,  ['y'] = -1672.6,   ['z'] = 29.29,  ['h'] = 66.82,  ['info'] = ' 21' },
	[30] =  { ['x'] = 503.76,  ['y'] = -1623.2,   ['z'] = 29.37,  ['h'] = 29.5,   ['info'] = ' 22' },
} 