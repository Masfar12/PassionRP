Consumeables = {
    ["sandwich"] = math.random(35, 54),
    ["water_bottle"] = math.random(35, 54),
    ["water_bottle_acid"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["kurkakola"] = math.random(35, 54),
    ["taco"] = math.random(30, 60),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["coffee"] = math.random(40, 50),
    ["coldcoffee"] = math.random(20, 25),
    ["latte"] = math.random(5, 10),
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["blueberry"] = math.random(20, 40),
    ["strawberry"] = math.random(20, 40),
    ["watermelon"] = math.random(20, 40),
    ["banana"] = math.random(20, 40),
    ["baconburger"] = math.random(20, 40),
    ["fries"] = math.random(20, 40),
    ["cheesesteak"] = math.random(20, 40),
    ["slicepizza"] = math.random(20, 40),
    ["brisket"] = math.random(20, 40),
    ["cheesecake"] = math.random(20, 40),
    ["milkshake"] = math.random(20, 40),
    ["icecreamcone"] = math.random(20, 40),
    ["redpopsicle"] = math.random(20, 40),
    ["redpopsicle_acid"] = math.random(20, 40),
    ["applepie"] = math.random(20, 40),
    ["veggienugget"] = math.random(20, 40),
    ["veggieburger"] = math.random(20, 40),
    ["salad"] = math.random(20, 40),
    ["hfries"] = math.random(20, 40),
    ["wangsushi"] = math.random(20, 40),
    ["spaghettimeatballs"] = math.random(40, 60),
    ["fettuccine"] = math.random(40, 60),
    ["lasagne"] = math.random(40, 60),
    ["margheritapizza"] = math.random(40, 60),
    ["raviolli"] = math.random(40, 60),
    ["toastie"] = math.random(40, 60),
    ["chedcrackers"] = math.random(40, 60),
    ["donut"] = math.random(40, 60),
    ["muffin"] = math.random(40, 60),
}

Config = {}

Config.Buttons = {
    {index = 0,name = 'Discord',url = 'https://discord.gg/passionrp'},
    {index = 1,name = 'Connect',url = 'fivem://connect/fivem.passionrp.com'},
    {index = 2,name = 'TeamSpeak',url = 'ts3server://ts.passionrp.com'}
}

Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25

Config.JointEffectTime = 120

Config.JointData = {
    ["joint"] = {
        ["stress"] = 30,                --How much stress is relieved
        ["armor"] = 10,                 --How much armor is recieved
        ["smoking"] = 5000,             --Time spent smoking, before effects in MilliSeconds
        ["tolerance"] = 4,              --Numbers (in grps of 10's) of Joints needed before seeing Visual Effects
        ["comedown"] = 600000,          --Time before tolerance is reset, after Player smokes a Joint
        ["highTime"] = 100,             --Time spent with Visual Effects in seconds
    },
    ["ak47blunt"] = {
        ["stress"] = 10,
        ["armor"] = 25,
        ["smoking"] = 5000,
        ["tolerance"] = 2,
        ["comedown"] = 240000,
        ["highTime"] = 20,
    },
    ["mhjoint"] = {
        ["stress"] = 100,
        ["armor"] = 25,
        ["smoking"] = 4000,
        ["tolerance"] = 4,
        ["comedown"] = 420000,
        ["highTime"] = 120,
    },
    ["amnesiajoint"] = {
        ["stress"] = 60,
        ["armor"] = 10,
        ["smoking"] = 5000,
        ["tolerance"] = 4,
        ["comedown"] = 600000,
        ["highTime"] = 30,
    },
    ["pocolocowrap"] = {
        ["stress"] = 1,
        ["armor"] = 34,
        ["smoking"] = 5000,
        ["tolerance"] = 3,
        ["comedown"] = 400000,
        ["highTime"] = 180,
    },
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`POLICE`] = true,
    [`POLICE2`] = true,
    [`POLICE3`] = true,
    [`POLICE4`] = true,
    [`POLICEB`] = true,
    [`POLICET`] = true,
    [`SHERIFF`] = true,
    [`SHERIFF2`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config['PoleDance'] = { -- allows you to pole dance at the strip club, you can of course add more locations if you want.
    ['Enabled'] = true,
    ['Locations'] = {
        {['Position'] = vector3(108.78, -1289.0, 29.24), ['Number'] = '3'},
        {['Position'] = vector3(104.80, -1294.16, 29.26), ['Number'] = '1'},
        {['Position'] = vector3(102.23, -1289.84, 29.26), ['Number'] = '2'}
    }
}

Strings = {
    ['Pole_Dance'] = '[~r~E~w~] Poledance',
}

Config.objects = {
	ButtonToSitOnChair = 58, -- // Default: G -- // https://docs.fivem.net/game-references/controls/
	ButtonToStandUp = 23, -- // Default: F -- // https://docs.fivem.net/game-references/controls/
	SitAnimation = {anim='PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'},
	locations = {
		{object="prop_skid_chair_02", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=180.0},
		{object="prop_cs_office_chair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0},
		{object="ba_prop_battle_club_chair_01", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.1, direction=180.0},
		-- {object="v_res_m_dinechair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=180.0}, doesnt work lol
		-- {object="gabz_mrpd_cell_bench", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=180.0},
		{object="v_ilev_leath_chr", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=180.0}
	}
}

-- // YOU WILL FIND ALL BUTTONS HERE FOR CODE BELOW;P
-- [[ https://docs.fivem.net/game-references/controls/ ]]

Config.Text = {
	SitOnChair = 'Press ~g~G~w~ to sit.',
	Standup = 'Press ~r~F~w~ to stand up.',
}

-- Admin Whitelist
Config.AdminNames = {
    "sudokill9",
    "PwnCake",
    "Onesource",
    "Steady",
    "T-Caster",
    "WellFed",
    "Zomba_Wamba",
    "iPazal",
    "pseud",
    "Giralii",
    "MrFinsGayming",
    "CGoodchild92",
    "TrIIpY",
    "Pinecone",
    "Rustbin",
    "Twitchqqdeluca",
    "Lil_Inconvenience",
    "Adamm",
    "witch",
    "stickerz",
    "Just Egg.",
    "B2B havOkz",
    "Slade",
    "SNACKBARXX",
    "EdreesDrillings",
    "Dappy Dapz",
    "pepproni",
    "Wifu",
    "Daddy",
    "rena",
    "DEXY",
    "Aurify",
    "AdamB",
    "benny",
}

Config.Weapons = {
    [`WEAPON_STUNGUN`] = "WEAPON_STUNGUN",

    --[[ Small Caliber ]]--
    [`WEAPON_PISTOL`] = "WEAPON_PISTOL",
    [`WEAPON_COMBATPISTOL`] = "WEAPON_COMBATPISTOL",
    [`WEAPON_APPISTOL`] = "WEAPON_APPISTOL",
    [`WEAPON_COMBATPDW`] = "WEAPON_COMBATPDW",
    [`WEAPON_MACHINEPISTOL`] = "WEAPON_MACHINEPISTOL",
    [`WEAPON_MICROSMG`] = "WEAPON_MICROSMG",
    [`WEAPON_MINISMG`] = "WEAPON_MINISMG",
    [`WEAPON_PISTOL_MK2`] = "WEAPON_PISTOL_MK2",
    [`WEAPON_SNSPISTOL`] = "WEAPON_SNSPISTOL",
    [`WEAPON_SNSPISTOL_MK2`] = "WEAPON_SNSPISTOL_MK2",
    [`WEAPON_VINTAGEPISTOL`] = "WEAPON_VINTAGEPISTOL",

    --[[ Medium Caliber ]]--
    [`WEAPON_ADVANCEDRIFLE`] = "WEAPON_ADVANCEDRIFLE",
    [`WEAPON_ASSAULTSMG`] = "WEAPON_ASSAULTSMG",
    [`WEAPON_BULLPUPRIFLE`] = "WEAPON_BULLPUPRIFLE",
    [`WEAPON_BULLPUPRIFLE_MK2`] = "WEAPON_BULLPUPRIFLE_MK2",
    [`WEAPON_CARBINERIFLE`] = "WEAPON_CARBINERIFLE",
    [`WEAPON_CARBINERIFLE_MK2`] = "WEAPON_CARBINERIFLE_MK2",
    [`WEAPON_COMPACTRIFLE`] = "WEAPON_COMPACTRIFLE",
    [`WEAPON_DOUBLEACTION`] = "WEAPON_DOUBLEACTION",
    [`WEAPON_GUSENBERG`] = "WEAPON_GUSENBERG",
    [`WEAPON_HEAVYPISTOL`] = "WEAPON_HEAVYPISTOL",
    [`WEAPON_MARKSMANPISTOL`] = "WEAPON_MARKSMANPISTOL",
    [`WEAPON_PISTOL50`] = "WEAPON_PISTOL50",
    [`WEAPON_REVOLVER`] = "WEAPON_REVOLVER",
    [`WEAPON_REVOLVER_MK2`] = "WEAPON_REVOLVER_MK2",
    [`WEAPON_SMG`] = "WEAPON_SMG",
    [`WEAPON_SMG_MK2`] = "WEAPON_SMG_MK2",
    [`WEAPON_SPECIALCARBINE`] = "WEAPON_SPECIALCARBINE",
    [`WEAPON_SPECIALCARBINE_MK2`] = "WEAPON_SPECIALCARBINE_MK2",

    --[[ High Caliber ]]--
    [`WEAPON_ASSAULTRIFLE`] = "WEAPON_ASSAULTRIFLE",
    [`WEAPON_ASSAULTRIFLE_MK2`] = "WEAPON_ASSAULTRIFLE_MK2",
    [`WEAPON_COMBATMG`] = "WEAPON_COMBATMG",
    [`WEAPON_COMBATMG_MK2`] = "WEAPON_COMBATMG_MK2",
    [`WEAPON_HEAVYSNIPER`] = "WEAPON_HEAVYSNIPER",
    [`WEAPON_HEAVYSNIPER_MK2`] = "WEAPON_HEAVYSNIPER_MK2",
    [`WEAPON_MARKSMANRIFLE`] = "WEAPON_MARKSMANRIFLE",
    [`WEAPON_MARKSMANRIFLE_MK2`] = "WEAPON_MARKSMANRIFLE_MK2",
    [`WEAPON_MG`] = "WEAPON_MG",
    [`WEAPON_MINIGUN`] = "WEAPON_MINIGUN",
    [`WEAPON_MUSKET`] = "WEAPON_MUSKET",
    [`WEAPON_RAILGUN`] = "WEAPON_RAILGUN",

    --[[ Shotguns ]]--
    [`WEAPON_ASSAULTSHOTGUN`] = "WEAPON_ASSAULTSHOTGUN",
    [`WEAPON_BULLUPSHOTGUN`] = "WEAPON_BULLUPSHOTGUN",
    [`WEAPON_DBSHOTGUN`] = "WEAPON_DBSHOTGUN",
    [`WEAPON_HEAVYSHOTGUN`] = "WEAPON_HEAVYSHOTGUN",
    [`WEAPON_PUMPSHOTGUN`] = "WEAPON_PUMPSHOTGUN",
    [`WEAPON_PUMPSHOTGUN_MK2`] = "WEAPON_PUMPSHOTGUN_MK2",
    [`WEAPON_SAWNOFFSHOTGUN`] = "WEAPON_SAWNOFFSHOTGUN",
    [`WEAPON_SWEEPERSHOTGUN`] = "WEAPON_SWEEPERSHOTGUN",
    
    --[[ Cutting Weapons ]]--
    -- [`WEAPON_BATTLEAXE`] = "WEAPON_BATTLEAXE",
    -- [`WEAPON_BOTTLE`] = "WEAPON_BOTTLE",
    -- [`WEAPON_DAGGER`] = "WEAPON_DAGGER",
    -- [`WEAPON_HATCHET`] = "WEAPON_HATCHET",
    -- [`WEAPON_KNIFE`] = "WEAPON_KNIFE",
    -- [`WEAPON_MACHETE`] = "WEAPON_MACHETE",
    -- [`WEAPON_SWITCHBLADE`] = "WEAPON_SWITCHBLADE",

    --[[ Heavy Impact ]]--
    -- [`WEAPON_BAT`] = "WEAPON_BAT",
    -- [`WEAPON_CROWBAR`] = "WEAPON_CROWBAR",
    -- [`WEAPON_FIREEXTINGUISHER`] = "WEAPON_FIREEXTINGUISHER",
    -- [`WEAPON_FIRWORK`] = "WEAPON_FIRWORK",
    -- [`WEAPON_GOLFLCUB`] = "WEAPON_GOLFLCUB",
    -- [`WEAPON_HAMMER`] = "WEAPON_HAMMER",
    -- [`WEAPON_PETROLCAN`] = "WEAPON_PETROLCAN",
    -- [`WEAPON_POOLCUE`] = "WEAPON_POOLCUE",
    -- [`WEAPON_WRENCH`] = "WEAPON_WRENCH",
    [`WEAPON_RAMMED_BY_CAR`] = "WEAPON_RAMMED_BY_CAR",
    [`WEAPON_RUN_OVER_BY_CAR`] = "WEAPON_RUN_OVER_BY_CAR",
    
    --[[ Explosives ]]--
    [`WEAPON_EXPLOSION`] = "WEAPON_EXPLOSION",
    [`WEAPON_GRENADE`] = "WEAPON_GRENADE",
    [`WEAPON_COMPACTLAUNCHER`] = "WEAPON_COMPACTLAUNCHER",
    [`WEAPON_PIPEBOMB`] = "WEAPON_PIPEBOMB",
    [`WEAPON_PROXMINE`] = "WEAPON_PROXMINE",
    [`WEAPON_RPG`] = "WEAPON_RPG",
    [`WEAPON_STICKYBOMB`] = "WEAPON_STICKYBOMB",
    
    --[[ Other ]]--
    [`WEAPON_FALL`] = "WEAPON_FALL", -- Fall
}