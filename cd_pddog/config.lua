Config = {}

------------------------------
---------- ESX SHIT ----------
------------------------------

-- Config.UseEsxperms = true
-- Config.Esxperms = {
-- 	{'superadmin'},
-- 	{'admin'},
-- }

-- Config.UseEsxJobs = false
-- Config.EsxJobs = {
-- 	{job = 'police', grade = '5'},
-- 	{job = 'police', grade = '5'},
-- }

-- Config.UseDiscordPerms = false
-- Config.DiscordRoles = {
-- 	{'changeme'},
-- 	{'changeme'},
-- }

------------------------------
---------- THE REST ----------
------------------------------

Config.CommandName = 'pddog'
Config.DogPed = 'a_c_shepherd'
Config.MaxPedHealth = 600
Config.RefillHealthTimer = 10

Config.Keys = {
	MoveNorth = 172,
	MoveSouth = 173,
	MoveWest = 174,
	MoveEast = 175,
	Raise = 208,
	Lower = 207,
	Rotate = 121,
	PlaceDown = 191,
	Exit = 194,
	Delete = 214,
}

Config.Text = {
	MoveMode = {
		MoveNorth = '⬆️ Move North',
		MoveSouth = '⬇️ Move South',
		MoveWest = '⬅️ Move West',
		MoveEast = '➡️ Move East',
		Raise = '🔼 Raise',
		Lower = '🔽 Lower',
		Rotate = '🔄 Rotate',
		PlaceDown = '📍 Place Prop',
		Delete = '❌ Delete Mode',
		Exit = '🔙 Exit',
	},
	
	DeleteMode = {
		DelModeActive = '~b~Delete Mode Active~w~',
		PropsRemaining = 'Props Remaining:',
		CycleLeft = '⬅️ Cycle Left',
		CycleRight = '➡️ Cycle Right',
		Delete = '❌ Delete Prop',
		Exit = '🔙 Go Back',
	},
}

-- Config.AllowedJobs = { --If Config.UsingESX is true then only these jobs can grab props from the trunk of an emergency vehicle.
--     ['police'] = true,
--     ['ambulance'] = true,
-- }

Config.Drugs = {
	'weed_poco-loco',
	'weed_white-widow',
	'weed_skunk',
	'weed_purple-haze',
	'weed_og-kush',
	'weed_amnesia',
	'weed_ak47',
	'weed_mh',
	'weed_brick',
	'coke_brick',
	'coke_small_brick',
	'joint',
	'pocolocowrap',
	'ak47blunt',
	'mhjoint',
	'amnesiajoint',
	'refined_crack_brick',
	'refined_meth_brick',
	'refined_xtc_brick',
	'refined_acid_brick',
	'cokebaggy',
	'meth',
	'crack_baggy',
	'xtcbaggy',
}