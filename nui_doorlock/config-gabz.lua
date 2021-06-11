Config = {}
Config.ShowUnlockedText = false
Config.CheckVersion = true
Config.CheckVersionDelay = 60 -- Minutes


Config.DoorList = {
	------------------------
	-- Special Snowflakes --
	------------------------
	-- These doors are controlled by key through thermite usage, and you cannot add any before this, or it'll screw it up.
	-- Anything other than thermite, use "nui_doorlock:server:UnlockDoorByCoords"

	-- Paleto second Door, ID = 1
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 1309269072,
		objHeading = 90.00003051758,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(-106.26, 6476.01, 31.98),
		authorizedJobs = { ['police']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-- Pacific BankFirst safe Door, ID = 2
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -1508355822,
		objHeading = 160.00001525879,
		fixText = false,
		audioRemote = false,
		objCoords = vector3(251.8576, 221.0655, 101.8324),
		authorizedJobs = { ['pacific']=0, ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},


	-- Pacific Bank second safe Door, ID = 3
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -1508355822,
		objHeading = 250.00003051758,
		fixText = false,
		audioRemote = false,
		objCoords = vector3(261.3004, 214.5051, 101.8324),
		authorizedJobs = { ['pacific']=0, ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

------------------------------------------
--	MISSION ROW POLICE DEPARTMENT		--
------------------------------------------
	-- gabz_mrpd	FRONT DOORS
	{
		authorizedJobs = { ['police']=0},
		locked = false,
		maxDistance = 2.0,
		doors = {
			{objHash = -1547307588, objHeading = 90.0, objCoords = vector3(434.7444, -983.0781, 30.8153)},
			{objHash = -1547307588, objHeading = 270.0, objCoords = vector3(434.7444, -980.7556, 30.8153)}
		},
		lockpick = true
	},
	
	-- gabz_mrpd	NORTH DOORS
	{
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -1547307588, objHeading = 180.0, objCoords = vector3(458.2087, -972.2543, 30.8153)},
			{objHash = -1547307588, objHeading = 0.0, objCoords = vector3(455.8862, -972.2543, 30.8153)}
		},
		
	},

	-- gabz_mrpd	SOUTH DOORS
	{
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -1547307588, objHeading = 0.0, objCoords = vector3(440.7392, -998.7462, 30.8153)},
			{objHash = -1547307588, objHeading = 180.0, objCoords = vector3(443.0618, -998.7462, 30.8153)}
		},
		
	},

	-- gabz_mrpd	LOBBY LEFT


	{
		objHash = -1406685646,
		fixText = true,
		authorizedJobs = { ['police']=0 },
		objCoords = vector3(440.5201, -977.6011, 30.82319),
		slides = false,
		garage = false,
		locked = true,
		lockpick = false,
		audioRemote = false,
		objHeading = 0.0,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-- gabz_mrpd	LOBBY RIGHT
	{
		objHash = -96679321,
		fixText = false,
		authorizedJobs = { ['police']=0 },
		objCoords = vector3(440.5201, -986.2335, 30.82319),
		slides = false,
		garage = false,
		locked = true,
		lockpick = false,
		audioRemote = false,
		objHeading = 180.00001525879,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-- gabz_mrpd	GARAGE ENTRANCE 1
	{
		objHash = 1830360419,
		objHeading = 269.78,
		objCoords = vector3(464.1591, -974.6656, 26.3707),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	--mrpd locker room
	{
		objHash = 149284793,
		objHeading = 234.0,
		objCoords = vector3(458.0894, -995.5247, 30.82319),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- Archives Room
	{
		objHash = -96679321,
		objHeading = 135.0,
		objCoords = vector3(452.2663, -995.5254, 30.82319),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 2.0,
		fixText = false
	},

	-- gabz_mrpd	GARAGE ENTRANCE 2
	{
		objHash = 1830360419,
		objHeading = 89.87,
		objCoords = vector3(464.1566, -997.5093, 26.3707),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},
	
	-- gabz_mrpd	GARAGE ROLLER DOOR 1
	{
		objHash = 2130672747,
		objHeading = 0.0,
		objCoords = vector3(431.4119, -1000.772, 26.69661),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 6,
		garage = true,
		slides = true,
		audioRemote = true
	},
	
	-- gabz_mrpd	GARAGE ROLLER DOOR 2
	{
		objHash = 2130672747,
		objHeading = 0.0,
		objCoords = vector3(452.3005, -1000.772, 26.69661),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 6,
		garage = true,
		slides = true,
		audioRemote = true
	},
	
	-- gabz_mrpd	BACK GATE
	{
		objHash = -1603817716,
		objHeading = 90.0,
		objCoords = vector3(488.8948, -1017.212, 27.14935),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 6,
		slides = true,
		audioRemote = true
	},

	-- gabz_mrpd	BACK DOORS
	{
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -692649124, objHeading = 0.0, objCoords = vector3(467.3686, -1014.406, 26.48382)},
			{objHash = -692649124, objHeading = 180.0, objCoords = vector3(469.7743, -1014.406, 26.48382)}
		},
		
	},

	-- gabz_mrpd	MUGSHOT
	{
		objHash = -1406685646,
		objHeading = 180.0,
		objCoords = vector3(475.9539, -1010.819, 26.40639),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true,
	},

	-- gabz_mrpd	CELL ENTRANCE 1
	{
		objHash = -53345114,
		objHeading = 270.0,
		objCoords = vector3(476.6157, -1008.875, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL ENTRANCE 2
	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(481.0084, -1004.118, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 1
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(477.9126, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 2
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(480.9128, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 3
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(483.9127, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 4
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(486.9131, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 5
	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(484.1764, -1007.734, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	LINEUP
	{
		objHash = -288803980,
		objHeading = 90.0,
		objCoords = vector3(479.06, -1003.173, 26.4065),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	OBSERVATION I
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6694, -983.9868, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	INTERROGATION I
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6701, -987.5792, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	OBSERVATION II
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6699, -992.2991, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	INTERROGATION II
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6703, -995.7285, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	EVIDENCE
	{
		objHash = -692649124,
		objHeading = 134.7,
		objCoords = vector3(475.8323, -990.4839, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	ARMOURY 1
	{
		objHash = -692649124,
		objHeading = 90.0,
		objCoords = vector3(479.7507, -999.629, 30.78927),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	ARMOURY 2
	{
		objHash = -692649124,
		objHeading = 181.28,
		objCoords = vector3(487.4378, -1000.189, 30.78697),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	SHOOTING RANGE
	{
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -692649124, objHeading = 0.0, objCoords = vector3(485.6133, -1002.902, 30.78697)},
			{objHash = -692649124, objHeading = 180.0, objCoords = vector3(488.0184, -1002.902, 30.78697)}
		},
		
	},

	-- gabz_mrpd	ROOFTOP
	{
		objCoords = vector3(464.3086, -984.5284, 43.77124),
		authorizedJobs = { ['police']=0 },
		objHeading = 90.000465393066,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = -692649124,
		locked = true,
		fixText = true,
	},

------------------------------------------
--	PRISON		--
------------------------------------------
	{
		objHash = 741314661,
		objHeading = 90.0,
		objCoords = vector3(1844.9, 2604.8, 44.6),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 8,
		slides = true,
		audioRemote = true,
		fixText = true,
	},
	{
		objHash = 741314661,
		objHeading = 90.0,
		objCoords = vector3(1818.5, 2604.8, 44.6),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 8,
		slides = true,
		audioRemote = true,
		fixText = true,
	},
	{
		objHash = 741314661,
		objHeading = 90.0,
		objCoords = vector3(1799.237, 2616.303, 44.6),
		authorizedJobs = { ['police']=0},
		locked = true,
		maxDistance = 8,
		slides = true,
		audioRemote = true,
		fixText = true,
	},
	{
		objHeading = 359.95935058594,
		lockpick = false,
		objCoords = vector3(1775.008, 2597.116, 45.83894),
		fixText = false,
		audioRemote = false,
		authorizedJobs = { ['police']=0 },
		objHash = -688867873,
		maxDistance = 2.0,
		locked = true,
		garage = false,
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHeading = 359.95935058594,
		lockpick = false,
		objCoords = vector3(1777.96, 2597.123, 45.83838),
		fixText = false,
		audioRemote = false,
		authorizedJobs = { ['police']=0 },
		objHash = -688867873,
		maxDistance = 2.0,
		locked = true,
		garage = false,
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHeading = 359.95935058594,
		lockpick = false,
		objCoords = vector3(1780.898, 2597.126, 45.83871),
		fixText = false,
		audioRemote = false,
		authorizedJobs = { ['police']=0 },
		objHash = -688867873,
		maxDistance = 2.0,
		locked = true,
		garage = false,
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	----------------
	-- Pacific Bank
	----------------
	{
		garage = false,
		lockpick = true,
		locked = true,
		slides = false,
		objHash = -222270721,
		objHeading = 340.00003051758,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(256.3116, 220.6579, 106.4296),
		authorizedJobs = { ['pacific']=0, ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Pacific Bank second door
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 746855201,
		objHeading = 250.00003051758,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(262.1981, 222.5188, 106.4296),
		authorizedJobs = { ['pacific']=0, ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Pacific Bank Office to gate door
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 1956494919,
		objHeading = 340.00003051758,
		fixText = false,
		audioRemote = false,
		objCoords = vector3(266.3624, 217.5697, 110.4328),
		authorizedJobs = { ['pacific']=0, ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHeading = 340.00003051758,
		locked = true,
		maxDistance = 2.0,
		lockpick = false,
		fixText = false,
		authorizedJobs = { ['pacific']=0, ['police']=0 },
		slides = false,
		objCoords = vector3(237.7704, 227.87, 106.426),
		audioRemote = false,
		objHash = 1956494919,
		garage = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	----------------
	-- Fleeca
	----------------
	-- fleeca bank 1
	{
		garage = false,
		lockpick = true,
		locked = true,
		slides = false,
		objHash = -1591004109,
		objHeading = 159.86595153809,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(314.6239, -285.9945, 54.46301),
		authorizedJobs = { ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	--fleeca bank 2
	{
		garage = false,
		lockpick = true,
		locked = true,
		slides = false,
		objHash = -1591004109,
		objHeading = 159.84617614746,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(150.2913, -1047.629, 29.6663),
		authorizedJobs = { ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	--fleeca bank 3
	{
		garage = false,
		lockpick = true,
		locked = true,
		slides = false,
		objHash = -1591004109,
		objHeading = 160.85981750488,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(-350.4144, -56.79705, 49.3348),
		authorizedJobs = { ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- fleeca bank 4
	{
		garage = false,
		lockpick = true,
		locked = true,
		slides = false,
		objHash = -1591004109,
		objHeading = 267.54205322266,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(-2956.116, 485.4206, 15.99531),
		authorizedJobs = { ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	----------------
	-- Paleto both need fixing
	----------------

	-- paleto door 1
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -1185205679,
		objHeading = 130.00003051758,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(-104.6049, 6473.444, 31.79532),
		authorizedJobs = { ['police']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	
	---------------
	-- Lost Barn --
	---------------
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 747286790,
		objHeading = 90.00003051758,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(1929.97, 4634.42, 40.47),		
		authorizedJobs = { ['xx']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	---------------
	-- Best Buds --
	---------------
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -538477509,
		objHeading = 180.0,
		fixText = false,
		audioRemote = false,
		objCoords = vector3(382.11630249023, -825.56677246094, 29.317266464233),
		authorizedJobs = { ['bestbuds']=0 },
		maxDistance = 2.0,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-------------
	-- Pillbox --
	-------------
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 854291622,
		objHeading = 159.97,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(308.58, -597.38, 43.28),
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 854291622,
		objHeading = 339.79,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(307.74, -569.89, 43.28),
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 854291622,
		objHeading = 339.79,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(339.65, -586.84, 43.28),
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 854291622,
		objHeading = 339.79,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(359.42, -594.01, 43.28),
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 854291622,
		objHeading = 249.98,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(351.92, -594.72, 43.36),
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 854291622,
		objHeading = 249.98,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(351.92, -594.72, 43.36),
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash = -434783486, objHeading = 339.711, objCoords = vector3(312.52, -571.63, 43.29)},
			{objHash = -1700911976, objHeading = 340.066, objCoords = vector3(313.75, -572.16, 43.35)}
		},
	},
	{
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash = -434783486, objHeading = 339.711, objCoords = vector3(318.44, -573.8, 43.29)},
			{objHash = -1700911976, objHeading = 340.066, objCoords = vector3(319.57, -574.22, 43.35)}
		},
	},
	{
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash = -434783486, objHeading = 339.711, objCoords = vector3(323.79, -575.81, 43.28)},
			{objHash = -1700911976, objHeading = 340.066, objCoords = vector3(324.96, -576.23, 43.35)}
		},
	},

	{
		maxDistance = 2.5,
		audioRemote = false,
		slides = false,
		lockpick = false,
		locked = false,
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		doors = {
			{objHash = -434783486, objHeading = 340.00003051758, objCoords = vector3(302.8031, -581.4246, 43.43391)},
			{objHash = -1700911976, objHeading = 340.00003051758, objCoords = vector3(305.2219, -582.3056, 43.43391)}
	 	},		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		audioRemote = false,
		doors = {
			{objHash = -434783486, objHeading = 249.98275756836, objCoords = vector3(326.5499, -578.0406, 43.43391)},
			{objHash = -1700911976, objHeading = 249.98275756836, objCoords = vector3(325.6695, -580.4596, 43.43391)}
	 },
		maxDistance = 2.5,
		slides = false,
		lockpick = false,
		locked = false,
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-----------------
	-- Whiskey Jim --
	-----------------
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -547305886,
		objHeading = 328.32,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(1980.44, 3049.81, 50.44),
		authorizedJobs = { ['whiskeyjim']=1 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 1287245314,
		objHeading = 327.77,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(1998.363, 3039.102, 48.41),
		authorizedJobs = { ['whiskeyjim']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 479144380,
		objHeading = 57.78,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(1988.37, 3053.57, 47.22),
		authorizedJobs = { ['whiskeyjim']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	--------
	-- VU --
	--------
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -1116041313,
		objHeading = 29.77,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(128.81, -1298.5, 29.23),
		authorizedJobs = { ['vanilla']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 390840000,
		objHeading = 300.29,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(113.4101, -1296.26, 29.43599),
		authorizedJobs = { ['vanilla']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 1695461688,
		objHeading = 209.79,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(96.09197, -1284.854, 29.43878),
		authorizedJobs = { ['vanilla']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	------------
	-- Winery --
	------------
	{
		authorizedJobs = { ['wine']=0 },
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash = 988364535, objHeading = 270.39, objCoords = vector3(-1864.32, 2060.84, 140.9)},
			{objHash = -1141522158, objHeading = 270.39, objCoords = vector3(-1864.3, 2060.22, 140.9)}
		},
	},
	{ -- not working
		authorizedJobs = { ['wine']=0 },
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash = 534758478, objHeading = -20.0, objCoords = vector3(-1883.94, 2060.09, 145.59)},
			{objHash = 534758478, objHeading = 160.0, objCoords = vector3(-1885.0, 2060.52, 145.59)}
		},
	},
	{
		authorizedJobs = { ['wine']=0 },
		objCoords = vector3(-1879.153, 2056.406, 141.1341),
		audioRemote = false,
		maxDistance = 2.0,
		objHash = 534758478,
		lockpick = false,
		fixText = false,
		objHeading = 250.02233886719,
		locked = true,
		slides = false,
		garage = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	----------------------
	-- Lost MC Compound --
	----------------------
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -710818483,
		objHeading = 148.87,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(991.65, -132.83, 74.06),
		authorizedJobs = { ['blackbarrelllc']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	------------------
	-- Cartel House --
	------------------ 

	-- Need to get stickerz to weld all doors shut - other than the two here
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 262671971,
		objHeading = 180.21,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(1406.9503173828, 1127.8760986328, 114.33435821533),
		authorizedJobs = { ['theranch']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		locked = true,
		doors = {
			{objHash = 262671971, objHeading = 89.999961853027, objCoords = vector3(1395.92, 1140.705, 114.7902)},
			{objHash = 1504256620, objHeading = 270.00003051758, objCoords = vector3(1395.92, 1142.904, 114.7902)}
		},
		maxDistance = 2.5,
		lockpick = false,
		audioRemote = false,
		authorizedJobs = { ['theranch']=0 },
		slides = false,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},


	---------
	-- FBI --
	---------
	{
		authorizedJobs = { ['police']=6 },
		locked = true,
		maxDistance = 1.5,
		lockpick = true,
		doors = {
			{objHash = -90456267, objHeading = 84.0, objCoords = vector3(105.73755645752, -746.01470947266, 45.754753112793)},
			{objHash = -1517873911, objHeading = 78.2, objCoords = vector3(106.19940185547, -743.22637939453, 45.754753112793)}
		}, 
		autoLock = 30000,
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -1821777087,
		objHeading = 160.0,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(118.3177, -733.7009, 242.3022),
		authorizedJobs = { ['police']=6 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	},
	{
		garage = true,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 1652829067,
		objHeading = 70.455,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(-33.79, -621.64, 36.105),
		authorizedJobs = { ['police']=6 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	------------------------
	-- Havoc MC Clubhouse --
	------------------------
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = 964838196,
		objHeading = 0.03,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(759.1075, -1319.342, 22.12),
		authorizedJobs = { ['crownclub']=2 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -1116041313,
		objHeading = 0.0,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(757.3916, -1331.834, 27.38),
		authorizedJobs = { ['crownclub']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = false,
		objHash = -1116041313,
		objHeading = 89.71,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(766.03, -1317.62, 27.00),
		authorizedJobs = { ['crownclub']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = true,
		objHash = -1116041313,
		objHeading = 89.71,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(766.03, -1317.62, 27.00),
		authorizedJobs = { ['crownclub']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-------------
	-- Prisons --
	-------------
	{
		garage = false,
		lockpick = false,
		locked = true,
		slides = true,
		objHash = -1612152164,
		objHeading = 90.08,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(1836.558, 2594.45, 44.95),
		authorizedJobs = { ['police']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = true,
		locked = true,
		slides = true,
		objHash = -1612152164,
		objHeading = 269.95,
		fixText = false,
		audioRemote = false,
		objCoords = vector3(1782.9969482422, 2591.6577148438, 45.717197418213),
		authorizedJobs = { ['police']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = true,
		locked = true,
		slides = true,
		objHash = -1033001619,
		objHeading = 269.95,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(1783.1522216797, 2598.4365234375, 45.717208862305),
		authorizedJobs = { ['police']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = true,
		locked = true,
		slides = true,
		objHash = -1033001619,
		objHeading = 179.86,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(1785.7349853516, 2599.6806640625, 45.840545654297),
		authorizedJobs = { ['police']=0 },
		maxDistance = 1.5,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		locked = true,
		objCoords = vector3(1797.761, 2596.565, 46.38731),
		objHash = -1156020871,
		authorizedJobs = { ['police']=0 },
		slides = false,
		maxDistance = 2.0,
		lockpick = true,
		audioRemote = false,
		objHeading = 179.99987792969,
		fixText = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHash = -1156020871,
		garage = false,
		locked = true,
		fixText = true,
		lockpick = true,
		objHeading = 179.99987792969,
		audioRemote = false,
		maxDistance = 2.0,
		authorizedJobs = { ['police']=0 },
		slides = false,
		objCoords = vector3(1798.09, 2591.687, 46.41784),		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		authorizedJobs = { ['police']=0 },
		garage = false,
		audioRemote = false,
		slides = false,
		locked = true,
		objCoords = vector3(1776.556, 2588.413, 49.86404),
		objHeading = 179.95936584473,
		objHash = -1033001619,
		fixText = true,
		lockpick = false,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = false,
		authorizedJobs = { ['police']=0 },
		maxDistance = 2.0,
		lockpick = false,
		audioRemote = false,
		locked = true,
		objHash = -688867873,
		objHeading = 269.95935058594,
		fixText = false,
		objCoords = vector3(1772.604, 2597.686, 45.8366),
		garage = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		locked = true,
		objHeading = 29.999992370605,
		slides = false,
		maxDistance = 2.0,
		authorizedJobs = { ['police']=0 },
		audioRemote = false,
		lockpick = false,
		objCoords = vector3(1861.455, 3692.459, 34.42121),
		fixText = false,
		objHash = 1196497453,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		lockpick = false,
		audioRemote = false,
		slides = false,
		authorizedJobs = { ['police']=0 },
		locked = true,
		objCoords = vector3(1860.672, 3695.978, 30.42393),
		objHeading = 119.99995422363,
		fixText = false,
		maxDistance = 2.0,
		objHash = -1486622150,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		fixText = false,
		authorizedJobs = { ['police']=0 },
		objHash = -1486622150,
		maxDistance = 2.0,
		locked = true,
		audioRemote = false,
		garage = false,
		lockpick = false,
		objCoords = vector3(1863.026, 3691.902, 30.42393),
		slides = false,
		objHeading = 119.99995422363,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objCoords = vector3(1864.683, 3689.031, 30.42393),
		slides = false,
		audioRemote = false,
		lockpick = false,
		locked = true,
		objHeading = 119.99995422363,
		maxDistance = 2.0,
		objHash = -1486622150,
		garage = false,
		fixText = false,
		authorizedJobs = { ['police']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHeading = 29.999992370605,
		audioRemote = false,
		slides = false,
		garage = false,
		objCoords = vector3(1856.628, 3685.281, 30.42789),
		lockpick = false,
		fixText = false,
		locked = true,
		authorizedJobs = { ['police']=0 },
		maxDistance = 2.0,
		objHash = 1196497453,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		fixText = true,
		locked = true,
		objHash = 2028677873,
		audioRemote = false,
		lockpick = false,
		authorizedJobs = { ['police']=0 },
		slides = false,
		objCoords = vector3(1856.071, 3701.286, 34.59323),
		objHeading = 210.0,
		garage = false,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		maxDistance = 2.0,
		objHash = -1486622150,
		locked = true,
		fixText = false,
		slides = false,
		objHeading = 209.99998474121,
		audioRemote = false,
		garage = false,
		authorizedJobs = { ['police']=0 },
		objCoords = vector3(1857.538, 3697.323, 30.42789),
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		authorizedJobs = { ['police']=0 },
		objHash = 1196497453,
		audioRemote = false,
		fixText = false,
		maxDistance = 2.0,
		objHeading = 30.000001907349,
		garage = false,
		objCoords = vector3(1855.669, 3701.032, 30.42789),
		lockpick = false,
		slides = false,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		fixText = false,
		authorizedJobs = { ['police']=0 },
		objHeading = 29.999992370605,
		maxDistance = 2.0,
		lockpick = false,
		objCoords = vector3(1851.186, 3682.832, 30.42789),
		audioRemote = false,
		slides = false,
		garage = false,
		locked = true,
		objHash = 1196497453,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		fixText = false,
		authorizedJobs = { ['police']=0 },
		objHeading = 119.99996948242,
		maxDistance = 2.0,
		lockpick = false,
		objCoords = vector3(1852.669, 3682.093, 30.42017),
		audioRemote = false,
		slides = false,
		garage = false,
		locked = true,
		objHash = -1486622150,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHash = -1425448544,
		locked = true,
		fixText = false,
		audioRemote = false,
		lockpick = false,
		objCoords = vector3(1849.517, 3681.392, 34.42121),
		garage = false,
		objHeading = 300.0,
		maxDistance = 2.0,
		slides = false,
		authorizedJobs = { ['police']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		audioRemote = false,
		slides = false,
		authorizedJobs = { ['police']=0 },
		objCoords = vector3(1849.949, 3688.95, 34.42121),
		lockpick = false,
		fixText = false,
		locked = true,
		maxDistance = 2.0,
		objHash = -1425448544,
		objHeading = 29.999992370605,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		locked = true,
		fixText = false,
		objCoords = vector3(1856.371, 3688.958, 34.42121),
		objHeading = 345.00003051758,
		authorizedJobs = { ['police']=0 },
		lockpick = false,
		garage = false,
		objHash = -1425448544,
		slides = false,
		audioRemote = false,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	------------------------------
	-- Grove Hangout by Carwash --
	------------------------------
	{
		slides = false,
		authorizedJobs = { ['grove']=0 },
		fixText = true,
		audioRemote = false,
		objHash = -2003105485,
		garage = false,
		objCoords = vector3(-21.71276, -1392.778, 29.63847),
		objHeading = 180.49087524414,
		maxDistance = 2.0,
		locked = true,
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHeading = 89.626678466797,
		objHash = -190780785,
		locked = true,
		garage = true,
		audioRemote = false,
		objCoords = vector3(-21.04025, -1410.734, 30.51094),
		slides = false,
		fixText = false,
		authorizedJobs = { ['grove']=0 },
		lockpick = false,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = false,
		objHash = -2003105485,
		authorizedJobs = { ['grove']=0 },
		garage = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		objCoords = vector3(-21.27107, -1406.845, 29.63847),
		fixText = true,
		objHeading = 89.626678466797,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objCoords = vector3(-32.67987, -1392.064, 29.63847),
		objHash = -2003105485,
		fixText = true,
		maxDistance = 2.0,
		audioRemote = false,
		lockpick = false,
		locked = true,
		objHeading = 0.0,
		slides = false,
		garage = false,
		authorizedJobs = { ['grove']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		audioRemote = false,
		maxDistance = 15.0,
		doors = {
			{objHash = -1483471451, objHeading = 258.7712097168, objCoords = vector3(381.667, -550.1557, 27.88432)},
			{objHash = -1483471451, objHeading = 79.374877929688, objCoords = vector3(384.0354, -538.3895, 27.88081)}
	 },
		authorizedJobs = { ['police']=0, ['ambulance']=0, ['doctor']=0 },
		locked = true,
		lockpick = false,
		slides = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objCoords = vector3(-629.7998, 228.9898, 82.0489),
		garage = false,
		lockpick = false,
		locked = true,
		fixText = true,
		audioRemote = false,
		maxDistance = 2.0,
		slides = false,
		objHash = 736699661,
		authorizedJobs = { ['bloodsbeans']=0 },
		objHeading = 0.2654080092907,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	---------------
	-- Taco shop --
	---------------

	{
		locked = true,
		slides = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		authorizedJobs = { ['taco']=0 },
		objCoords = vector3(423.2346, -1914.183, 25.61443),
		objHash = -1687047623,
		lockpick = false,
		fixText = false,
		objHeading = 43.686401367188,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHeading = 314.34478759766,
		authorizedJobs = { ['taco']=0 },
		maxDistance = 1.0,
		objHash = -1635579193,
		audioRemote = false,
		garage = false,
		slides = false,
		fixText = false,
		lockpick = false,
		objCoords = vector3(421.2457, -1923.877, 25.66854),
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		doors = {
			{objHash = 220394186, objHeading = 5.9999690055847, objCoords = vector3(-139.0563, -626.0358, 168.9756)},
			{objHash = 220394186, objHeading = 185.99998474121, objCoords = vector3(-140.6973, -626.2083, 168.9756)}
	 	},
		lockpick = false,
		authorizedJobs = { ['blackrose']=0 },
		locked = true,
		maxDistance = 2.5,
		slides = false,
		audioRemote = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = false,
		authorizedJobs = { ['house']=0 },
		maxDistance = 2.0,
		objCoords = vector3(-1500.401, 104.144, 55.80867),
		lockpick = false,
		audioRemote = false,
		objHash = -1563640173,
		locked = true,
		fixText = true,
		objHeading = 227.32369995117,
		garage = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		fixText = true,
		maxDistance = 2.0,
		objHeading = 316.63739013672,
		garage = false,
		objCoords = vector3(-1523.062, 143.6533, 55.80905),
		objHash = -1563640173,
		authorizedJobs = { ['house']=0 },
		slides = false,
		lockpick = false,
		locked = true,
		audioRemote = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHeading = 137.45500183105,
		objHash = 1033441082,
		maxDistance = 2.0,
		garage = false,
		locked = true,
		audioRemote = false,
		fixText = true,
		authorizedJobs = { ['house']=0 },
		slides = false,
		objCoords = vector3(-1535.985, 130.4704, 57.75053),
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		authorizedJobs = { ['house']=0 },
		locked = true,
		maxDistance = 2.5,
		lockpick = false,
		doors = {
			{objHash = 988364535, objHeading = 137.30728149414, objCoords = vector3(-1526.287, 118.156, 55.73633)},
			{objHash = -1141522158, objHeading = 137.01460266113, objCoords = vector3(-1527.282, 119.0815, 55.74234)}
	 },
		audioRemote = false,
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		audioRemote = false,
		slides = true,
		objCoords = vector3(-1474.129, 68.38937, 52.52709),
		objHeading = 4.9999694824219,
		fixText = true,
		lockpick = false,
		objHash = -2125423493,
		garage = false,
		authorizedJobs = { ['house']=0 },
		locked = true,
		maxDistance = 10.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = true,
		objHeading = 328.9284362793,
		fixText = true,
		locked = true,
		lockpick = false,
		authorizedJobs = { ['house']=0 },
		garage = false,
		maxDistance = 10.0,
		objCoords = vector3(-1616.232, 79.7792, 60.7787),
		audioRemote = false,
		objHash = -2125423493,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		authorizedJobs = { ['pearls']=0 },
		maxDistance = 2.0,
		locked = true,
		objHeading = 150.01554870605,
		slides = false,
		objHash = 1289778077,
		garage = false,
		lockpick = false,
		fixText = true,
		audioRemote = false,
		objCoords = vector3(-1846.096, -1190.649, 14.48367),		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		objCoords = vector3(-1825.819, -1200.974, 19.56953),
		slides = false,
		maxDistance = 2.0,
		authorizedJobs = { ['pearls']=0 },
		objHeading = 149.96984863281,
		locked = true,
		objHash = -952356348,
		audioRemote = false,
		lockpick = false,
		fixText = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		locked = true,
		authorizedJobs = { ['pearls']=0 },
		doors = {
			{objHash = 1417577297, objHeading = 60.134773254395, objCoords = vector3(-1822.692, -1200.29, 19.71876)},
			{objHash = 2059227086, objHeading = 60.134773254395, objCoords = vector3(-1823.643, -1201.945, 19.71388)}
	 },
		audioRemote = false,
		slides = false,
		maxDistance = 2.5,
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		authorizedJobs = { ['pearls']=0 },
		objCoords = vector3(-1845.387, -1194.845, 19.37041),
		maxDistance = 2.0,
		audioRemote = false,
		objHash = 964838196,
		lockpick = false,
		fixText = false,
		locked = true,
		objHeading = 149.96984863281,
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		authorizedJobs = { ['pearls']=0 },
		objCoords = vector3(-1830.377, -1181.635, 19.41224),
		garage = false,
		slides = false,
		lockpick = false,
		objHeading = 329.87033081055,
		fixText = false,
		audioRemote = false,
		locked = true,
		objHash = 964838196,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	---------------
	-- North Bar --
	---------------

	{
		authorizedJobs = { ['north']=0 },
		lockpick = false,
		slides = false,
		objHash = -212601398,
		maxDistance = 2.0,
		objCoords = vector3(830.3626, -111.5591, 79.92501),
		objHeading = 240.00001525879,
		garage = false,
		fixText = true,
		audioRemote = false,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		locked = true,
		objHash = 90939006,
		maxDistance = 5.0,
		objCoords = vector3(823.026, -118.9631, 80.93332),
		objHeading = 330.0,
		slides = 6.0,
		lockpick = false,
		audioRemote = false,
		authorizedJobs = { ['north']=0 },
		fixText = false,
		garage = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = false,
		objHash = -1169882195,
		fixText = true,
		objCoords = vector3(828.3351, -116.5749, 80.5844),
		lockpick = false,
		audioRemote = false,
		garage = false,
		locked = true,
		authorizedJobs = { ['north']=0 },
		maxDistance = 2.0,
		objHeading = 240.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		authorizedJobs = { ['casino']=2 },
		slides = false,
		locked = true,
		doors = {
			{objHash = 680601509, objHeading = 89.999992370605, objCoords = vector3(1122.351, 263.5161, -50.89093)},
			{objHash = 680601509, objHeading = 270.0, objCoords = vector3(1122.351, 265.5158, -50.89093)}
	 },
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.5,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = false,
		lockpick = false,
		authorizedJobs = { ['casino']=0 },
		audioRemote = false,
		maxDistance = 2.5,
		doors = {
			{objHash = 187642590, objHeading = 270.0, objCoords = vector3(2494.676, -280.9896, -70.56742)},
			{objHash = 187642590, objHeading = 89.999992370605, objCoords = vector3(2494.714, -283.0744, -70.56742)}
	 },
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		garage = false,
		authorizedJobs = { ['casino']=0 },
		locked = true,
		fixText = true,
		slides = false,
		objHash = 1243560448,
		objHeading = 0.0,
		lockpick = false,
		maxDistance = 2.0,
		audioRemote = false,
		objCoords = vector3(2467.545, -272.2359, -70.54587),		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		maxDistance = 2.0,
		authorizedJobs = { ['casino']=0 },
		objCoords = vector3(2475.1, -263.8017, -70.54587),
		garage = false,
		slides = false,
		lockpick = false,
		audioRemote = false,
		objHeading = 270.0,
		objHash = 1243560448,
		fixText = true,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		lockpick = false,
		locked = false,
		authorizedJobs = { ['realestateagent']=0 },
		maxDistance = 2.5,
		audioRemote = false,
		slides = false,
		doors = {
			{objHash = 220394186, objHeading = 35.999919891357, objCoords = vector3(-1574.951, -568.1512, 108.6781)},
			{objHash = 220394186, objHeading = 215.99992370605, objCoords = vector3(-1576.286, -569.121, 108.6781)}
	 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	{
		doors = {
			{objHash = 21324050, objHeading = 238.00001525879, objCoords = vector3(924.75, 44.83086, 81.54192)},
			{objHash = 558771340, objHeading = 238.00001525879, objCoords = vector3(923.4196, 42.70175, 81.54192)}
	 },
		lockpick = false,
		audioRemote = false,
		slides = false,
		locked = false,
		maxDistance = 2.5,
		authorizedJobs = { ['casino']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		doors = {
			{objHash = 21324050, objHeading = 238.00001525879, objCoords = vector3(926.2393, 47.21412, 81.54192)},
			{objHash = 558771340, objHeading = 238.00001525879, objCoords = vector3(924.9089, 45.085, 81.54192)}
	 },
		lockpick = false,
		audioRemote = false,
		slides = false,
		locked = false,
		maxDistance = 2.5,
		authorizedJobs = { ['casino']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		doors = {
			{objHash = 21324050, objHeading = 238.00001525879, objCoords = vector3(927.7387, 49.60353, 81.54192)},
			{objHash = 558771340, objHeading = 238.00001525879, objCoords = vector3(926.4083, 47.47442, 81.54192)}
	 },
		lockpick = false,
		audioRemote = false,
		slides = false,
		locked = false,
		maxDistance = 2.5,
		authorizedJobs = { ['casino']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},


	-------------------
	-- Bahamas Mamas --
	-------------------
	{
		locked = true,
		lockpick = false,
		maxDistance = 2.5,
		audioRemote = false,
		doors = {
			{objHash = 702589573, objHeading = 33.137897491455, objCoords = vector3(-1387.025, -586.6187, 30.46926)},
			{objHash = -105166269, objHeading = 213.19209289551, objCoords = vector3(-1389.205, -588.04, 30.46926)}
	 },
		authorizedJobs = { ['bahamas']=0 },
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-------------
	-- Tequila --
	-------------
	{
		objHeading = 265.00006103516,
		maxDistance = 2.0,
		locked = true,
		objHash = -626684119,
		authorizedJobs = { ['tequila']=0 },
		garage = false,
		slides = false,
		audioRemote = false,
		fixText = true,
		lockpick = false,
		objCoords = vector3(-560.2373, 293.0106, 82.32609),		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	------------
	-- Arcade --
	------------
	{
		audioRemote    = false,
		lockpick       = false,
		objHash        = -1977830166,
		garage         = false,
		fixText        = true,
		slides         = false,
		locked         = false,
		objHeading     = 89.999992370605,
		maxDistance    = 2.0,
		objCoords      = vector3(2736.766, -377.5468, -49.0),
		authorizedJobs = {
			arcade = 0,
			house  = 0,
		},
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		authorizedJobs = {
			arcade = 0,
			house  = 0
		},
		objCoords      = vector3(2724.825, -373.7135, -48.37),
		fixText        = true,
		audioRemote    = false,
		maxDistance    = 2.0,
		slides         = false,
		locked         = true,
		lockpick       = false,
		objHeading     = 270.0,
		garage         = false,
		objHash        = 855881614,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		maxDistance    = 2.0,
		locked         = true,
		authorizedJobs = {
			['arcade'] = 3,
			house      = 0,
		},
		objHash        = -2023754432,
		garage         = false,
		slides         = false,
		fixText        = true,
		lockpick       = false,
		objCoords      = vector3(2727.845, -360.9655, -51.84995),
		audioRemote    = false,
		objHeading     = 179.99998474121,
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	----------------
	-- Car Dealer --
	----------------
	{
		authorizedJobs = { ['cardealer']=0 },
		maxDistance = 2.5,
		lockpick = false,
		locked = false,
		audioRemote = false,
		doors = {
			{objHash = 1718041838, objHeading = 300.07666015625, objCoords = vector3(-801.9141, -224.5258, 37.92628)},
			{objHash = 1718041838, objHeading = 120.07666015625, objCoords = vector3(-803.0355, -222.6251, 37.92628)}
	 },
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		lockpick = false,
		maxDistance = 2.0,
		fixText = false,
		objCoords = vector3(-802.9248, -206.944, 37.25646),
		locked = true,
		garage = false,
		authorizedJobs = { ['cardealer']=0 },
		objHash = 2008932251,
		objHeading = 30.076644897461,
		audioRemote = false,
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	
	-----------
	-- Drift --
	-----------
	{
		objHeading = 325.0,
		objCoords = vector3(-63.31039, -2519.129, 7.545235),
		slides = false,
		garage = false,
		objHash = -684382235,
		lockpick = false,
		authorizedJobs = { ['drift']=0 },
		audioRemote = false,
		fixText = true,
		maxDistance = 2.0,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-----------------
	-- Tattoo Shop --
	-----------------
	{
		objHash = 328152547,
		locked = false,
		slides = false,
		fixText = false,
		maxDistance = 2.0,
		objHeading = 340.00003051758,
		lockpick = false,
		objCoords = vector3(321.8085, 178.3599, 103.6783),
		audioRemote = false,
		garage = false,
		authorizedJobs = { ['tattooshop']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHash = -691724289,
		locked = true,
		slides = false,
		fixText = false,
		maxDistance = 2.0,
		objHeading = 160.00003051758,
		lockpick = false,
		objCoords = vector3(320.5102, 184.7164, 103.7365),
		audioRemote = false,
		garage = false,
		authorizedJobs = { ['tattooshop']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	----------------
	-- Ammunation --
	----------------
	{
		maxDistance = 2.5,
		doors = {
			{objHash = -8873588, objHeading = 340.00003051758, objCoords = vector3(18.572, -1115.495, 29.94694)},
			{objHash = 97297972, objHeading = 160.00001525879, objCoords = vector3(16.12787, -1114.606, 29.94694)}
	 },
		authorizedJobs = { ['ammunation']=0 },
		slides = false,
		audioRemote = false,
		locked = false,
		lockpick = false,	
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	{
		maxDistance = 2.5,
		doors = {
			{objHash = 97297972, objHeading = 360.0, objCoords = vector3(845.3694, -1024.539, 28.34478)},
			{objHash = -8873588, objHeading = 179.99998474121, objCoords = vector3(842.7685, -1024.539, 28.34478)}
	 },
		authorizedJobs = { ['ammunation']=0 },
		slides = false,
		audioRemote = false,
		locked = false,
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		maxDistance = 2.5,
		doors = {
			{objHash = 97297972, objHeading = 360.0, objCoords = vector3(2570.905, 303.3556, 108.8848)},
			{objHash = -8873588, objHeading = 179.99998474121, objCoords = vector3(2568.304, 303.3556, 108.8848)}
	 },
		authorizedJobs = { ['ammunation']=0 },
		slides = false,
		audioRemote = false,
		locked = false,
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		maxDistance = 2.5,
		doors = {
			{objHash = 97297972, objHeading = 227.39189147949, objCoords = vector3(1698.176, 3751.506, 34.85526)},
			{objHash = -8873588, objHeading = 47.391891479492, objCoords = vector3(1699.937, 3753.42, 34.85526)}
	 	},
		authorizedJobs = { ['ammunation']=0 },
		slides = false,
		audioRemote = false,
		locked = true,
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- vanilla
	{
		audioRemote = false,
		objHash = 1695461688,
		slides = false,
		garage = false,
		authorizedJobs = { ['vanilla']=0 },
		objHeading = 210.0,
		maxDistance = 2.0,
		objCoords = vector3(128.0708, -1279.347, 29.43697),
		fixText = true,
		locked = true,
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Sandy Med Lockers
	{
		garage = false,
		objCoords = vector3(1826.888, 3676.395, 34.29776),
		maxDistance = 2.0,
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		lockpick = false,
		audioRemote = false,
		slides = false,
		objHash = -770740285,
		objHeading = 120.00021362305,
		fixText = false,
		locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Sandy Med Chief Room
	{
		garage = false,
		objCoords = vector3(1840.715, 3681.749, 34.29562),
		maxDistance = 2.0,
		authorizedJobs = { ['ambulance']=0, ['doctor']=0 },
		lockpick = false,
		audioRemote = false,
		slides = false,
		objHash = -770740285,
		objHeading = 209.9253692627,
		fixText = false,
		locked = true,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Overboost Backdoor
	{
		objHeading = 89.999977111816,
		audioRemote = false,
		objHash = 458025182,
		lockpick = false,
		authorizedJobs = { ['drift']=0 },
		objCoords = vector3(41.77607, -2578.195, 6.345184),
		garage = false,
		fixText = false,
		slides = false,
		maxDistance = 2.0,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Overboost Office Front Door
	{
		objHeading = 179.99998474121,
		audioRemote = false,
		objHash = -1720238398,
		lockpick = false,
		authorizedJobs = { ['drift']=0 },
		objCoords = vector3(50.64433, -2571.946, 6.346945),
		garage = false,
		fixText = false,
		slides = false,
		maxDistance = 2.0,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Overboost Office Inside Door
	{
		objHeading = 180.00001525879,
		audioRemote = false,
		objHash = -952356348,
		lockpick = false,
		authorizedJobs = { ['drift']=0 },
		objCoords = vector3(50.65311, -2574.881, 6.410142),
		garage = false,
		fixText = false,
		slides = false,
		maxDistance = 2.0,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Overboost Garage Door
	{
		objHeading = 179.99998474121,
		audioRemote = false,
		objHash = 1939484582,
		lockpick = false,
		authorizedJobs = { ['drift']=0 },
		objCoords = vector3(58.24935, -2567.089, 7.343883),
		garage = true,
		fixText = false,
		slides = 6.0,
		maxDistance = 6.0,
		locked = true,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	}, 
	-- Overboost Side Door
	{
		objHeading = 89.999977111816,
		slides = false,
		lockpick = false,
		audioRemote = false,
		objHash = 458025182,
		locked = true,
		authorizedJobs = { ['drift']=0 },
		fixText = true,
		garage = false,
		objCoords = vector3(55.20639, -2569.899, 6.345777),
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Lostmc compound front Door
	{
		objCoords = vector3(981.1505, -103.2552, 74.99358),
		locked = true,
		authorizedJobs = { ['blackbarrelllc']=0 },
		garage = false,
		fixText = true,
		lockpick = false,
		slides = false,
		maxDistance = 2.0,
		audioRemote = false,
		objHeading = 42.65185546875,
		objHash = 190770132,	
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	----------
	-- SASP --
	----------
	{
		maxDistance = 2.5,
		lockpick = false,
		locked = false,
		slides = false,
		authorizedJobs = { ['police']=0 },
		audioRemote = false,
		doors = {
			{objHash = -1501157055, objHeading = 27.745290756226, objCoords = vector3(-442.6569, 6015.222, 31.86523)},
			{objHash = -1501157055, objHeading = 135.00007629395, objCoords = vector3(-444.5057, 6017.056, 31.86523)}
	 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	{
		maxDistance = 2.0,
		lockpick = false,
		locked = true,
		slides = false,
		authorizedJobs = { ['police']=0 },
		fixText = false,
		objHeading = 135.00007629395,
		objCoords = vector3(-437.0416, 6003.705, 31.86815),
		audioRemote = false,
		objHash = 749848321,
		garage = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	{
		maxDistance = 2.0,
		lockpick = false,
		locked = true,
		slides = false,
		authorizedJobs = { ['police']=0 },
		fixText = false,
		objHeading = 314.99996948242,
		objCoords = vector3(-440.4216, 5998.603, 31.86815),
		audioRemote = false,
		objHash = 749848321,
		garage = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	{
		maxDistance = 2.0,
		lockpick = false,
		locked = true,
		slides = false,
		authorizedJobs = { ['police']=0 },
		fixText = true,
		objHeading = 314.99993896484,
		objCoords = vector3(-447.2363, 6002.317, 31.84003),
		audioRemote = false,
		objHash = -2023754432,
		garage = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	{
		maxDistance = 2.0,
		lockpick = false,
		locked = true,
		slides = false,
		authorizedJobs = { ['police']=0 },
		fixText = true,
		objHeading = 135.00007629395,
		objCoords = vector3(-450.9664, 6006.086, 31.99004),
		audioRemote = false,
		objHash = -2023754432,
		garage = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = false,
		audioRemote = false,
		doors = {
			{objHash = -2023754432, objHeading = 135.00007629395, objCoords = vector3(-440.8152, 6007.46, 31.87136)},
			{objHash = -2023754432, objHeading = 314.99981689453, objCoords = vector3(-442.6553, 6009.3, 31.87136)}
	 },
		locked = true,
		maxDistance = 2.5,
		lockpick = false,
		authorizedJobs = { ['police']=0 },		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = false,
		objCoords = vector3(-444.3682, 6012.223, 28.13558),
		lockpick = false,
		garage = false,
		objHeading = 44.999965667725,
		audioRemote = false,
		maxDistance = 2.0,
		fixText = false,
		authorizedJobs = { ['police']=0 },
		locked = true,
		objHash = -1927754726,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		objHeading = 45.000022888184,
		lockpick = false,
		garage = false,
		slides = false,
		objHash = 749848321,
		objCoords = vector3(-436.6276, 6002.548, 28.14062),
		authorizedJobs = { ['police']=0 },
		audioRemote = false,
		fixText = false,
		locked = true,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		audioRemote = false,
		maxDistance = 2.5,
		authorizedJobs = { ['police']=0 },
		doors = {
			{objHash = -1320876379, objHeading = 225.0001373291, objCoords = vector3(-436.5157, 6007.844, 28.13839)},
			{objHash = -1320876379, objHeading = 45.000022888184, objCoords = vector3(-434.6776, 6009.68, 28.13839)}
	 },
		lockpick = false,
		locked = true,
		slides = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		locked = true,
		objHash = -2023754432,
		objCoords = vector3(-450.7136, 6016.371, 31.86523),
		fixText = true,
		lockpick = false,
		audioRemote = false,
		slides = false,
		authorizedJobs = { ['police']=0 },
		garage = false,
		objHeading = 315.22174072266,
		maxDistance = 2.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		maxDistance = 2.5,
		slides = false,
		authorizedJobs = { ['police']=0 },
		audioRemote = false,
		doors = {
			{objHash = -2023754432, objHeading = 135.00007629395, objCoords = vector3(-447.7283, 6006.702, 31.86523)},
			{objHash = -2023754432, objHeading = 315.01037597656, objCoords = vector3(-449.5656, 6008.538, 31.86523)}
	 },
		locked = true,
		lockpick = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	---------------
	--- AZTECAS ---
	---------------

	-- Garage Door
	{
		slides = 6.0,
		fixText = true,
		authorizedJobs = { ['aztecas']=0 },
		audioRemote = false,
		garage = true,
		lockpick = false,
		objHeading = 230.00215148926,
		locked = true,
		objHash = -1652821467,
		objCoords = vector3(450.0099, -1787.496, 29.03865),
		maxDistance = 6.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Double Doors
	{
		lockpick = false,
		authorizedJobs = { ['aztecas']=0 },
		slides = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1627599682, objHeading = 49.999992370605, objCoords = vector3(468.5975, -1801.395, 28.94203)},
			{objHash = 1099436502, objHeading = 50.0, objCoords = vector3(466.9256, -1803.387, 28.94116)}
		},
		locked = true,
		audioRemote = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	---------------
	-- SALIERI'S --
	---------------

	-- Saleiri's Back Door
	{
		objCoords = vector3(428.1859, -1514.622, 29.44621),
		objHash = 1388116908,
		-- authorizedJobs = { ['house']=0, ['pearls']=0 },
		authorizedJobs = {},
		locked = true,
		objHeading = 29.999984741211,
		slides = false,
		maxDistance = 2.0,
		fixText = false,
		garage = false,
		lockpick = false,
		audioRemote = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Salieri's Door To Stairs
	{
		fixText = false,
		garage = false,
		audioRemote = false,
		-- authorizedJobs = { ['house']=0, ['pearls']=0 },
		authorizedJobs = {},
		locked = true,
		lockpick = false,
		objCoords = vector3(423.6866, -1501.412, 30.3019),
		maxDistance = 2.0,
		objHeading = 210.0,
		slides = false,
		objHash = 964838196,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Salieri's Kitchen Door
	{
		maxDistance = 2.0,
		locked = true,
		authorizedJobs = { ['house']=0, ['pearls']=0 },
		-- authorizedJobs = {},
		objHash = 964838196,
		objHeading = 210.00001525879,
		objCoords = vector3(411.9574, -1502.112, 30.30422),
		lockpick = false,
		fixText = false,
		audioRemote = false,
		garage = false,
		slides = false,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Salieri's Office
	{
		maxDistance = 2.5,
		authorizedJobs = { ['house']=0, ['pearls']=0 },
		-- authorizedJobs = {},
		locked = true,
		lockpick = false,
		doors = {
			{objHash = 964838196, objHeading = 300.0, objCoords = vector3(417.2393, -1498.444, 33.95724)},
			{objHash = 964838196, objHeading = 120.00000762939, objCoords = vector3(415.9398, -1496.193, 33.95724)}
		},
		audioRemote = false,
		slides = false,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	-- Salieri's Balcony
	{
		slides = true,
		objHash = 2000998394,
		authorizedJobs = { ['house']=0, ['pearls']=0 },
		-- authorizedJobs = {},
		lockpick = false,
		objCoords = vector3(413.5118, -1487.519, 32.85129),
		garage = false,
		objHeading = 300.0,
		audioRemote = false,
		fixText = false,
		locked = true,
		maxDistance = 6.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = true,
		objHash = 2000998394,
		authorizedJobs = { ['house']=0, ['pearls']=0 },
		-- authorizedJobs = {},
		lockpick = false,
		objCoords = vector3(410.3181, -1499.079, 32.85129),
		garage = false,
		objHeading = 30.000005722046,
		audioRemote = false,
		fixText = false,
		locked = true,
		maxDistance = 6.0,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	---------------------
	--- Sandy Medical ---
	---------------------

	{
		locked = true,
		audioRemote = false,
		authorizedJobs = { ['ambulance']=0, ['doctor']=0, ['police']=0 },
		slides = false,
		doors = {
			{objHash = -1143010057, objHeading = 300.31909179688, objCoords = vector3(1829.163, 3670.042, 34.42281)},
			{objHash = -1143010057, objHeading = 120.00021362305, objCoords = vector3(1827.859, 3672.288, 34.42281)}
	 	},
		lockpick = false,
		maxDistance = 2.5,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	----------------------
	--- Sandy Medical2 ---
	----------------------

	{
		maxDistance = 2.5,
		slides = false,
		authorizedJobs = { ['ambulance']=0, ['doctor']=0, ['police']=0 },
		lockpick = false,
		locked = true,
		doors = {
			{objHash = -1143010057, objHeading = 300.31909179688, objCoords = vector3(1825.971, 3677.981, 34.42281)},
			{objHash = -1143010057, objHeading = 120.00021362305, objCoords = vector3(1824.669, 3680.234, 34.42281)}
	 },
		audioRemote = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},

	-----------------
	--- PizzaShop ---
	-----------------

	{
		locked = false,
		fixText = true,
		objHeading = 269.82647705078,
		objHash = 1289778077,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		objCoords = vector3(285.4366, -977.4257, 29.58215),
		authorizedJobs = { ['pizza']=0 },
		garage = false,	
		audioRemote = false,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		slides = false,
		locked = true,
		objCoords = vector3(297.0608, -993.7029, 29.58215),
		lockpick = false,
		maxDistance = 2.0,
		authorizedJobs = { ['pizza']=0 },
		objHash = 757543979,
		fixText = false,
		audioRemote = false,
		garage = false,
		objHeading = 359.73797607422,		
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
	{
		audioRemote = false,
		lockpick = false,
		objHash = 2035930085,
		locked = true,
		slides = false,
		fixText = true,
		objCoords = vector3(297.4373, -985.8253, 29.6866),
		objHeading = 89.826454162598,
		maxDistance = 2.0,
		authorizedJobs = { ['pizza']=4 },
		garage = false,			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
	},
}