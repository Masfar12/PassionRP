Config = {}

-- Get code from server, and set the model hash (86753091337 is the model hash for the teleporter)
local mcstash     = GetConvar("mcstash", 86753091337)
local mcgun       = GetConvar("mcgun",   86753091337)
local gunbunk     = GetConvar("gunbunk", 86753091337)
local ballas      = GetConvar("ballas",  86753091337)
local grove       = GetConvar("grove",   86753091337)
local vagos       = GetConvar("vagos",   86753091337)
local gunware     = GetConvar("gunware", 86753091337)
local temple      = GetConvar("temple", 86753091337)
local templeTower = GetConvar("templeTower", 86753091337)
local mazebank    = GetConvar("mazebank", 86753091337)
local cargarage1  = GetConvar("cargarage1", 86753091337)
local cargarage2  = GetConvar("cargarage2", 86753091337)
local barn 		  = GetConvar("barn", 86753091337)
local underground = GetConvar("underground", 86753091337)
local illegalgun  = GetConvar("illegalgun", 86753091337)
local vanilla     = GetConvar("vanilla", 86753091337)
local ssballas    = GetConvar("ssballas", 86753091337)
local arena    	  = GetConvar("arena", 1)
local hobos 	  = GetConvar("hobos", 1)
local bunk    	  = GetConvar("bunk", 1)
local blood    	  = GetConvar("blood", 1)
local reddington  = GetConvar("reddington", 1)
local casino  	  = GetConvar("casino", 1)
local bahamas  	  = GetConvar("bahamas", 1)
local ammunation  = GetConvar("ammunation", 1)

Config.Teleporters = {
	-- To MC Hideout
	{
		coords  = { x = 1983.02, y = 3026.25,  z = 47.91},
		landed  = { x = 1121.19,  y = -3151.35, z = -37.06},
		authorizedCodes = {mcstash},
		distance = 1.0,
		name = "MC"
	},
	{
		coords  = { x = 1120.98,  y = -3152.74, z = -37.06},
		landed  = { x = 1983.02, y = 3026.25,  z = 47.91},
		authorizedCodes = {mcstash},
		distance = 1.0,
		name = "MC"
	},

	-- MC Gun
	{
		coords  = { x = -906.45, y = -451.61, z = 39.61},
		landed  = { x = -890.83, y = -436.39, z = 121.61},
		authorizedCodes = {mcgun},
		distance = 1.0,
		name = "Gun 1"
	},
	{
		coords  = { x = -890.83, y = -436.39, z = 121.61},
		landed  = { x = -906.45, y = -451.61, z = 39.61},
		authorizedCodes = {mcgun},
		distance = 1.0,
		name = "Gun 1"
	},

	-- To Gun Bunker
	{
		coords  = { x = 1573.4, y = 2255.07,  z = 78.61},
		landed  = { x = 857.2,  y = -3248.56, z = -98.38},
		authorizedCodes = {gunbunk},
		distance = 1.0,
		name = "Gun 2"
	},
	{
		coords  = { x = 857.19,  y = -3249.98, z = -98.33},
		landed  = { x = 1573.4, y = 2255.07,  z = 78.61},
		authorizedCodes = {gunbunk},
		distance = 1.0,
		name = "Gun 2"
	},

	-- To Bunker
	{
		coords  = {x = -3064.5090332031, y = 3326.9775390625, z = 11.931428909302},
		landed  = {x = 514.36761474609, y = 4888.3701171875, z = -62.589500427246},
		authorizedCodes = {bunk},
		distance = 1.0,
		name = "Bunker"
	},
	{
		coords  = {x = 514.36761474609, y = 4888.3701171875, z = -62.589500427246},
		landed  = {x = -3064.5090332031, y = 3326.9775390625, z = 11.931428909302},
		authorizedCodes = {bunk},
		distance = 1.0,
		name = "Bunker"
	},
	{
		coords  = { x = 844.78643798828, y = -2365.1520996094, z = 30.34624671936},
		landed  = { x = 1065.16,  y = -3183.38, z = -39.16},
		authorizedCodes = {ballas},
		distance = 1.0,
		name = "Ballas"
	},
	{
		coords  = { x = 1066.36,  y = -3183.52, z = -39.16},
		landed  = { x = 844.78643798828, y = -2365.1520996094, z = 30.34624671936},
		authorizedCodes = {ballas},
		distance = 1.0,
		name = "Ballas"
	},

	-- Grove
	{
		coords  = { x = -147.76036071777, y= -1596.420532226, z = 34.831348419189},
		landed  = { x = 1003.7,   y = -3201.1,  z = -38.99},
		authorizedCodes = {grove},
		distance = 1.0,
		name = "Grove"
	},
	{
		coords  = { x = 1003.49,  y = -3202.59, z = -38.99},
		landed  = { x = -147.76036071777, y= -1596.420532226, z = 34.831348419189},
		authorizedCodes = {grove},
		distance = 1.0,
		name = "Grove"
	},

	-- Vagos
	{
		coords  = { x = 420.78,   y = -2057.81, z = 22.28},
		landed  = { x = 1088.63,  y = -3189.11, z = -38.99},
		authorizedCodes = {vagos},
		distance = 1.0,
		name = "Vagos"
	},
	{
		coords  = { x = 1088.67,  y = -3187.56, z = -38.99},
		landed  = { x = 420.78,   y = -2057.81, z = 22.28},
		authorizedCodes = {vagos},
		distance = 1.0,
		name = "Vagos"
	},

	-- Gun Warehouse
	{
		coords  = { x = 870.51,   y = -2313.22, z = 30.57},
		landed  = { x = 993.22,   y = -3097.87, z = -39.0},
		authorizedCodes = {gunware},
		distance = 1.0,
		name = "Gun 3"
	},
	{
		coords  = { x = 992.3,    y = -3097.92, z = -39.0},
		landed  = { x = 870.67,    y = -2312.36, z = 30.57},
		authorizedCodes = {gunware},
		distance = 1.0,
		name = "Gun 3"
	},

		-- Temple-
	{
		coords  = { x = -1152.8950195312, y = -2171.7663574219, z = 13.265480995178 },
		landed  = { x = -1388.60,   y = -481.36, z = 77.80 },
		authorizedCodes = {temple},
		distance = 5.0,
		name = "Temple"
	},
	{
		coords  = { x = -1388.46,   y = -482.71, z = 77.80 },
		landed  = { x = -1152.8950195312, y = -2171.7663574219, z = 13.265480995178 },
		authorizedCodes = {temple},
		distance = 5.0,
		name = "Temple"
	},
		-- Temple Warehouse -
	{
		coords  = { x = -1397.96,   y = -470.39,  z = 78.20},
		landed  = { x = -1389.57,   y = -475.72, z = 72.04},
		authorizedCodes = {templeTower},
		distance = 1.0,
		name = "TempleTower"
	},
	{
		coords  = { x = -1389.57,   y = -475.72, z = 72.04},
		landed  = { x = -1397.96,   y = -470.39,  z = 78.20},
		authorizedCodes = {templeTower},
		distance = 1.0,
		name = "TempleTower"
	},
	{
		coords  = { x = -1392.23,   y = -483.97,  z = 78.20},
		landed  = { x = -1396.22,   y = -480.89, z = 49.10},
		authorizedCodes = {temple},
		distance = 1.0,
		name = "TempleWarehouse"
	},
	{
		coords  = { x = -1396.22,   y = -480.89, z = 49.10},
		landed  = { x = -1392.23,   y = -483.97,  z = 78.20},
		authorizedCodes = {temple},
		distance = 1.0,
		name = "TempleWarehouse"
	},
		-- Maze Bank Taxing -
	{
		coords  = { x = -1370.62,   y = -503.50,  z = 33.15},
		landed  = { x = -1399.16,   y = -482.00, z = 72.04},
		authorizedCodes = {mazebank},
		distance = 1.0,
		name = "MazeBank"
	},
	{
		coords  = { x = -1399.16,   y = -482.00, z = 72.04},
		landed  = { x = -1370.62,   y = -503.50,  z = 33.15},
		authorizedCodes = {mazebank},
		distance = 1.0,
		name = "MazeBank"
	},
		-- Car Garage
	{
		coords  = { x = 1569.7, y = -2129.63, z = 78.33},
		landed  = { x = 179.0,   y = -1000.04, z = -99.0},
		authorizedCodes = {cargarage1},
		distance = 1.0,
		name = "Car Garage 1"
	},
	{
		coords  = { x = 179.0,   y = -1000.04, z = -99.0},
		landed  = { x = 1569.7, y = -2129.63, z = 78.33},
		authorizedCodes = {cargarage1},
		distance = 1.0,
		name = "Car Garage 1"
	},
		-- Car Garage 2
	{
		coords  = { x = -419.07, y = -2176.07, z = 10.32},
		landed  = { x = 202.13,   y = -1007.18, z = -99.0},
		authorizedCodes = {cargarage2},
		distance = 1.0,
		name = "Car Garage 2"
	},
	{
		coords  = { x = 202.13,   y = -1007.18, z = -99.0},
		landed  = { x = -419.07, y = -2176.07, z = 10.32},
		authorizedCodes = {cargarage2},
		distance = 1.0,
		name = "Car Garage 2"
	},
		-- Barn
	{
		coords  = { x = 1929.85,   y = 4634.96,  z = 40.41},
		landed  = { x = 1929.94,   y = 4633.04,  z = 40.47},
		authorizedCodes = {barn},
		distance = 1.0,
		name = "Barn"
	},
	{
		coords  = { x = 1929.94,   y = 4633.04,  z = 40.47},
		landed  = { x = 1929.85,   y = 4634.96,  z = 40.41},
		authorizedCodes = {barn},
		distance = 1.0,
		name = "Barn"
	},
	{
		coords  = { x = 133.13,  y = -1293.63, z = 29.27},
		landed  = { x = 132.54, y = -1287.21, z = 29.27},
		authorizedCodes = {vanilla},
		distance = 1.0,
		name = "vanilla"
	},
	{
		coords  = { x = 132.54, y = -1287.21, z = 29.27},
		landed  = { x = 133.13,  y = -1293.63, z = 29.27},
		authorizedCodes = {vanilla},
		distance = 1.0,
		name = "vanilla"
	},
	{
		coords  = { x = 210.2,  y = -1989.64, z = 19.72},
		landed  = { x = 1138.11, y = -3198.88, z = -39.67},
		authorizedCodes = {ssballas},
		distance = 1.0,
		name = "ssballas"
	},
	{
		coords  = { x = 1138.11, y = -3198.88, z = -39.67},
		landed  = { x = 210.2,  y = -1989.64, z = 19.72},
		authorizedCodes = {ssballas},
		distance = 1.0,
		name = "ssballas"
	},
	-- illegalgun
    {
   		coords  = { x = 1242.53, y = -3113.64, z = 5.51},
    	landed  = { x = 1207.29, y = -3122.09, z = 5.54},
    	authorizedCodes = {illegalgun},
    	distance = 1.0,
    	name = "illegalgun"
    },
    {
    	coords  = { x = 1207.29, y = -3122.09, z = 5.54},
    	landed  = { x = 1242.53, y = -3113.64, z = 5.51},
    	authorizedCodes = {illegalgun},
    	distance = 1.0,
		name = "illegalgun"
	},
		-- misc
	{
		coords  = {x = 0.0, y = 0.0, z = 0.0},
		landed  = {x = 2960.88, y = -3802.41, z = 141.03},
		authorizedCodes = {arena},
		distance = 5.0,
		name = "arena"
	 },
	 {
		 coords  = {x = 2960.88, y = -3802.41, z = 140.03},
		 landed  = {x = 2133.79, y = 4782.87, z = 40.97},
		 authorizedCodes = {arena},
		 distance = 5.0,
		 name = "arena"
	 },
	 { 
		coords  = {x = 343.95666503906, y = -1927.3282470703, z = 17.899574279785},
		landed  = {x = 1087.34, y = -3099.4, z = -39.0},
		authorizedCodes = {hobos},
		distance = 1.0,
		name = "hobos"
	 },
	 {
		 coords  = {x = 1087.34, y = -3099.4, z = -39.0},
		 landed  = {x = 343.95666503906, y = -1927.3282470703, z = 17.899574279785},
		 authorizedCodes = {hobos},
		 distance = 1.0,
		 name = "hobos"
	 },
	 --Temporary for Event
	 {
		coords  = {x = 232.48, y = -1360.92, z = 28.65},
		landed  = {x = 275.60, y = -1361.31, z = 24.54},
		authorizedCodes = {'5575445085'},
		distance = 5.0,
		name = "EventRoom"
	 },
	 {
		 coords  = {x = 275.60, y = -1361.31, z = 24.54},
		 landed  = {x = 232.48, y = -1360.92, z = 28.65},
		 authorizedCodes = {'5575445085'},
		 distance = 5.0,
		 name = "EventRoom"
	 },
	-- Bloods
	 {
		coords  = {x = 367.56, y = -1802.27, z = 29.06},
		landed  = {x = 151.4, y = -1007.3, z = -99.01},
		authorizedCodes = {blood},
		distance = 5.0,
		name = "blood"
	 },
	 {
		 coords  = {x = 151.4, y = -1007.3, z = -99.01},
		 landed  = {x = 367.56, y = -1802.27, z = 29.06},
		 authorizedCodes = {blood},
		 distance = 5.0,
		 name = "blood"
	 },
	-- Arcadia
	 {
		coords  = {x = -144.08, y = -576.32, z = 32.42},
		landed  = {x = -141.52, y = -620.86, z = 168.82},
		authorizedCodes = {reddington},
		distance = 5.0,
		name = "reddington"
	 },
	 {
		 coords  = {x = -141.52, y = -620.86, z = 168.82},
		 landed  = {x = -144.08, y = -576.32, z = 32.42},
		 authorizedCodes = {reddington},
		 distance = 2.0,
		 name = "reddington"
	 },
	-- Casino
	{
		coords  = {x = 1121.26, y =  214.82, z = -49.44},
		landed  = {x = 1121.20, y = 221.81, z = -49.43},
		authorizedCodes = {casino},
		distance = 5.0,
		name = "casino"
	},
	{
		coords  = {x = 1121.20, y = 221.81, z = -49.43},
		landed  = {x = 1121.26, y =  214.82, z = -49.44},
		authorizedCodes = {casino},
		distance = 2.0,
		name = "casino"
	},
	-- Bahamas
	{
		coords  = {x = -1386.21, y = -627.57, z = 30.81},
		landed  = {x = -1902.07, y = -572.43, z = 19.09},
		authorizedCodes = {bahamas},
		distance = 1.0,
		name = "bahamas"
	},
	{
		coords  = {x = -1902.07, y = -572.43, z = 19.09},
		landed  = {x = -1386.21, y = -627.57, z = 30.81},
		authorizedCodes = {bahamas},
		distance = 1.0,
		name = "bahamas"
	},
	-- Ammunation to Doc Forgery 1173.6900634766, -3196.6208496094, -39.007991790771, 264.84075927734
	{
		coords  = {x = 1689.39, y = 3757.75, z = 34.70},
		landed  = {x = 1173.69, y = -3196.62, z = -39.00},
		authorizedCodes = {ammunation},
		distance = 1.0,
		name = "ammunation"
	},
	{
		coords  = {x = 1173.69, y = -3196.62, z = -39.00},
		landed  = {x = 1689.39, y = 3757.75, z = 34.70},
		authorizedCodes = {ammunation},
		distance = 1.0,
		name = "ammunation"
	},
}

Config.Objects = {
	{
		obj = 666561306,
		name = "dumpster"
	},
	{
		obj = 218085040,
		name = "dumpster2"
	}
}

Config.Stashes = {
	-- MC
	{
		coords  = { x = 1115.23, y = -3161.47, z = -36.87},
		name    = "mcstash"
	},

	-- MC Gun
	{
		coords  = { x = -906.97, y = -445.76, z = 115.4},
		name    = "gunsone"
	},
	-- Other Gun
	{
		coords  = { x = 903.71, y = -3199.28, z = -97.19},
		name    = "gunstwo"
	},
	-- Bunker
	{
		coords  = {x = 511.25289916992, y = 4886.2705078125, z = -62.592441558838},
		name    = "bunker"
		},
	-- Ballas
	{
		coords  = { x = 1031.18, y = -3203.14, z = -38.19},
		name    = "ballas"
	},
	-- Grove
	{
		coords  = { x = 997.5, y = -3199.54, z = -38.99},
		name    = "grove"
	},
	-- Vagos
	{
		coords  = { x = 1096.79, y = -3192.9, z = -38.99},
		name    = "vagos"
	},
	-- Warehouse
	{
		coords  = { x = 1020.83, y = -3112.28, z = -39.0},
		name    = "warehouse"
	},
	-- Hidden 1, island
	{
		coords  = { x = -2170.19, y = 5196.55, z = 17.07},
		name    = "shack"
	},
	-- Hidden 2, Humane Labs
	{
		coords  = { x = 3627.12, y = 3734.03, z = 31.73},
		name    = "humane"
	},
	-- Hidden 3, Construction
	{
		coords  = { x = -151.59, y = -968.47, z = 269.34},
		name    = "construction"
	},
		-- Car Garage 1
	{
		coords  = { x = 177.45, y = -999.78, z = -99.0},
		name    = "cargarage1"
	},
		-- Car Garage 2
	{
		coords  = { x = 190.78, y = -1002.27, z = -99.0},
		name    = "cargarage2"
	},
	{
		coords  = { x = 2436.01, y = 4964.74, z = 46.81},
		name    = "grapehouse"
	},
	{
		coords  = { x = 977.24, y = -104.14, z = 74.85},
		name    = "BBLLC SAFE"
	},
	{
		coords  = { x = -568.46, y = 291.11, z = 79.18},
		name    = "tequila"
	},
	{
		coords  = { x = -1878.06, y = 2063.96, z = 135.91},
		name    = "sandyalcohol",
	},
	{
		coords  = { x = 1932.82, y = 4617.23, z = 40.47},
		name    = "barn",
	},

	{
		coords  = { x = 383.12, y = 257.07, z = 92.05},
		name    = "nightclub",
	},
	{
		coords  = { x = -1876.0, y = 2063.06, z = 145.57},
		name    = "wine",
	},
	{
		coords  = { x = 1138.3, y = -3193.8, z = -40.39},
		name    = "ssballas",
	},
	{
		coords  = { x = 1928.9201660156, y = 4619.0048828125, z = 40.471633911133},
		name    = "illegalgun",
	},
	-- AMMUNATION
	{
		coords  = { x = 18.98, y = -1099.12, z = 29.83},
		name    = "Ammunation"
	},
	-- Havoc churchroom
	{
		coords  = { x = 760.60, y = -1306.39, z = 22.01},
		name    = "Havoc MC"
	},
	{ 
		coords = {x = 1622.43, y = 2507.62, z = 45.56},
		name    = "Prison 1"
	},
	{ 
		coords = {x = 1644.14, y = 2490.84, z = 45.56},
		name    = "Prison 2"
	},
	{ 
		coords = {x = 1679.76, y = 2480.17, z = 45.56},
		name    = "Prison 3"
	},
	{
		coords = {x = 1706.91, y = 2481.1, z = 45.56},
		name    = "Prison 4"
	},
	{ 
		coords = {x = 1760.61, y = 2519.04, z = 45.56},
		name    = "Prison 5"
	},
	{ 
		coords = {x = 1766.57, y = 2484.65, z = 55.14},
		name    = "Prison 6"
	},
	{ 
		coords = {x = 1714.07, y = 2474.42, z = 55.16},
		name    = "Prison 7"
	},
	{ 
		coords = {x = 1630.1, y = 2458.04, z = 55.19},
		name    = "Prison 8"
	},
	{ 
		coords = {x = 1597.19, y = 2535.65, z = 55.15},
		name    = "Prison 9"
	},
	{ 
		coords = {x = 1773.56, y = 2544.54, z = 45.58},
		name    = "Prison 10"
	},
	{ 
		coords = {x = 1756.87, y = 2587.81, z = 45.72},
		name    = "Prison 11"
	},
	{ 
		coords = {x = 1775.23, y = 2593.2, z = 45.72},
		name    = "Prison 12"
	},
	{ 
		coords = {x = 1758.14, y = 2646.44, z = 45.56},
		name    = "Prison 13"
	},
	{ 
		coords = {x = 1692.04, y = 2632.02, z = 45.56},
		name    = "Prison 14"
	},
	{ 
		coords = {x = 1689.33, y = 2551.56, z = 45.56},
		name    = "Prison 15"
	},
	{ 
		coords = {x = 1829.14, y = 2580.23, z = 45.89},--
		name    = "Prison 16"
	},
	{ 
		coords = {x = 1787.59, y = 2569.97, z = 45.71},
		name    = "Prison 17"
	},
	{ 
		coords = {x = 1768.87, y = 2588.89, z = 45.91},
		name    = "Prison 18"
	},
	{ 
		coords = {x = 1657.4, y = 2488.25, z = 45.56},
		name    = "Prison 19"
	},
	{ 
		coords = {x = 1758.39, y = 2507.47, z = 45.56},
		name    = "Prison 20"
	},
	{ 
		coords = {x = 1101.03, y = -3102.34, z = -39.0},
		name    = "Hobos"
	},
	{
		coords = {x = 151.26, y = -1002.93, z = -99.00},
		name    = "Blood"
	},
	{
		coords = {x = 2526.91, y = -237.44, z = -70.74},
		name    = "CasinoGold",
		marker = true
	},
	{
		coords = {x = -1375.84, y = -628.75, z = 30.81},
		name    = "bahamasdrinks1",
		marker = true
	},
	{
		coords = {x = -1391.249, y = -605.58, z = 30.31},
		name    = "bahamasdrinks2",
		marker = true
	},
}
