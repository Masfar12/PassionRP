Config = {}

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 6
Config.TimerBeforeNewRob    = 36000 -- The cooldown timer on a store after robbery was completed / canceled, in seconds
Config.MaxDistance          = 50   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.Debug                = false

Stores = {
	["south_merryweather"] = {
		position = { x = 569.34, y = -3126.35, z = 18.77 }, -- /tp 567.87 -3123.92 18.77
		nameOfStore = "Merryweather",
		secondsRemaining = 1000, -- seconds
		lastRobbed = 0
	},
}

Config.Rewards = {
	[1] = {
		position = { x = 846.31, y = 2990.94, z = 45.42 }, -- /tp 846.31 2990.94 45.42
	},
	[2] = {
		position = { x = -395.43, y = 4371.44, z = 58.02 } -- /tp -395.43 4371.44 58.02
	},
	[3] = {
		position = { x = -3189.38, y = 1371.78, z = 19.48 } -- /tp -3189.38 1371.78 19.48
	},
}
