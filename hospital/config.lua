Config = {}

Config.Locations = {
    ["checking"] = {x = 309.08, y = -592.91, z = 43.28, h = 0.0},
    ["duty"] = {
        [1] = {x = 304.27, y = -600.33, z = 43.28, h = 0.0},
        [2] = {x = -254.88, y = 6324.5, z = 32.58, h = 0.0},
    },    
    ["vehicle"] = {
        [1] = {x = 335.20, y = -570.22, z = 28.60, h = 340.52}, 
        [2] = {x = -234.28, y = 6329.16, z = 32.15, h = 222.5},
        [3] = {x = 1843.29, y = 3706.46, z = 33.60, h = 28.83}, -- Sandy
    },
    ["helicopter"] = {
        [1] = {x = 351.58, y = -587.45, z = 74.16, h = 160.5},
        [2] = {x = -475.43, y = 5988.35, z = 31.716, h = 31.34},
        [3] = {x = 1770.16, y = 3239.82, z = 42.12, h = 102.76}, -- Sandy
    },
    ["stash"] = {
        [1] = {x = 306.76, y = -601.81, z = 43.29, h = 163.35},
        [2] = {x = 1824.97, y = 3674.41, z = 34.78, h = 118.29}, -- Sandy
    },
    ["armory"] = {
        [1] = {x = 311.79, y = -564.11, z = 43.29, h = 69.82},
        [2] = {x = -245.13, y = 6315.71, z = 32.82, h = 90.654},
        [3] = {x = 1836.61, y = 3685.34, z = 34.27, h = 29.43}, -- Sandy
    },
    ["roof"] = {
        [1] = {x = 338.5, y = -583.85, z = 74.16, h = 245.5},
    },
    ["main"] = {
        [1] = {x = 332.51, y = -595.74, z = 43.28, h = 76.0},
    },     
    ["tobay"] = {
        [1] = {x = 329.81, y = -600.82, z = 43.28, h = 76.0},
    },   
    ["bay"] = {
        [1] = {x = 319.48, y = -559.97, z = 28.74, h = 76.0},
    },     
    ["beds"] = {
        [1] = {x = 311.13, y = -582.89, z = 43.53, h = 335.65, taken = false, sandy = false, model = 1631638868},
        [2] = {x = 313.96, y = -579.05, z = 43.53, h = 164.5, taken = false, sandy = false, model = 1631638868},
        [3] = {x = 314.58, y = -584.09, z = 43.53, h = 335.65, taken = false, sandy = false, model = 1631638868},
        [4] = {x = 317.74, y = -585.29, z = 43.53, h = 335.65, taken = false, sandy = false, model = 1631638868},
        [5] = {x = 319.47, y = -581.04, z = 43.53, h = 164.5, taken = false, sandy = false, model = 1631638868}, 
        [6] = {x = 366.43, y = -581.54, z = 43.28, h = 66.5, taken = false, sandy = false, model = 1631638868}, 
        [7] = {x = 364.93, y = -585.86, z = 43.28, h = 67.5, taken = false, sandy = false, model = 1631638868}, 
        [8] = {x = 363.82, y = -589.09, z = 43.28, h = 68.5, taken = false, sandy = false, model = 1631638868},
        [9] = {x = 1818.27100, y = 3677.85400, z = 33.83718, h = 210.00, taken = false, sandy = true, model = 2117668672}, -- Sandy beds
        [10] = {x = 1821.66600, y = 3679.814000, z = 33.83718, h = 210.00, taken = false, sandy = true, model = 2117668672},
        [11] = {x = 1817.131000, y = 3674.69500, z = 33.83718, h = 295.00, taken = false, sandy = true, model = 2117668672},
        [12] = {x = 1819.09200, y = 3671.29900, z = 33.83718, h = 295.00, taken = false, sandy = true, model = 2117668672},
        [13] = {x = 1823.29100, y = 3672.22400, z = 33.83718, h = 115.00, taken = false, sandy = true, model = 2117668672},
    },
    ["labs"] = {
        [1] = {x = 312.12, y = -562.31, z = 43.28, h = 261.01},
        [2] = {x = 1824.86, y = 3687.44, z = 34.27, h = 29.70}, -- Sandy
    },
}

Config.Vehicles = {
--dont put repeat entries, causes issues for some unknown reason :/
    ["e18charger"] = {label = "EMS Charger", minGrade = 1, job = 'doctor'},
    ["emsnspeedo"] = {label = "EMS Ambulance", minGrade = 0, job = 'ambulance'},
    ["etahoe"] = {label = "EMS Tahoe", minGrade = 1, job = 'ambulance'},
    ["ecla45"] = {label = "FRU CLA45", minGrade = 1, job = 'ambulance'},
    ["blazer2"] = {label = "Quad Bike", minGrade = 1, job = 'ambulance'},
}

Config.Whitelist = {
    "OBX71816",
    "DQH25042",
    "YZS14515",
    "MDF77776",
    "IQW67015",
    "JUJ13746",
    "PYG40714",
    "XLZ70098",
    "OLN08368",
    "ACU22504",
    "ICN22568",
    "BJO84328",
    "JBI04281",
    "YUT08213",
    "YVU66415",
    "KCX51785",
    "EPU10263",
}

Config.Helicopter = "eheli"

Config.Items = {
    label = "Hospital Safe",
    slots = 30,
    items = {
        [1] = {
            name = "radio",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "bandage",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "painkillers",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_flashlight",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_fireextinguisher",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_stungun",
            price = 0,
            amount = 2,
            info = {},
            type = "weapon",
            slot = 6,
        },
        [7] = {
            name = "tazer_ammo",
            price = 0,
            amount = 2,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "hospitalkeycard",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "morphine",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "localanesthetic",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "bloodsamplekit",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
    }
}

Config.BillCost = 500
Config.DeathTime = 300
Config.CheckTime = 10

Config.PainkillerInterval = 60 -- seconds

--[[
    GENERAL SETTINGS | THESE WILL AFFECT YOUR ENTIRE SERVER SO BE SURE TO SET THESE CORRECTLY
    MaxHp : Maximum HP Allowed, set to -1 if you want to disable mythic_hospital from setting this
        NOTE: Anything under 100 and you are dead
    RegenRate : 
]]
Config.MaxHp = 200
Config.RegenRate = 0.0

--[[
    HealthDamage : How Much Damage To Direct HP Must Be Applied Before Checks For Damage Happens
    ArmorDamage : How Much Damage To Armor Must Be Applied Before Checks For Damage Happens | NOTE: This will in turn make stagger effect with armor happen only after that damage occurs
]]
Config.HealthDamage = 5
Config.ArmorDamage = 5

--[[
    MaxInjuryChanceMulti : How many times the HealthDamage value above can divide into damage taken before damage is forced to be applied
    ForceInjury : Maximum amount of damage a player can take before limb damage & effects are forced to occur
]]
Config.MaxInjuryChanceMulti = 2
Config.ForceInjury = 50
Config.AlwaysBleedChance = 35

--[[
    Message Timer : How long it will take to display limb/bleed message
]]
Config.MessageTimer = 12

--[[
    AIHealTimer : How long it will take to be healed after checking in, in seconds
]]
Config.AIHealTimer = 120

--[[ 
    BleedTickRate : How much time, in seconds, between bleed ticks
]]
Config.BleedTickRate = 60

--[[
    BleedMovementTick : How many seconds is taken away from the bleed tick rate if the player is walking, jogging, or sprinting
    BleedMovementAdvance : How Much Time Moving While Bleeding Adds (This Adds This Value To The Tick Count, Meaing The Above BleedTickRate Will Be Reached Faster)
]]
Config.BleedMovementTick = 10
Config.BleedMovementAdvance = 6

--[[
    The Base Damage That Is Multiplied By Bleed Level Every Time A Bleed Tick Occurs
]]
Config.BleedTickDamage = 3

--[[
    FadeOutTimer : How many bleed ticks occur before fadeout happens
    BlackoutTimer : How many bleed ticks occur before blacking out
    AdvanceBleedTimer : How many bleed ticks occur before bleed level increases
]]
Config.FadeOutTimer = 5
Config.BlackoutTimer = 40
Config.AdvanceBleedTimer = 40

--[[
    HeadInjuryTimer : How much time, in seconds, do head injury effects chance occur
    ArmInjuryTimer : How much time, in seconds, do arm injury effects chance occur
    LegInjuryTimer : How much time, in seconds, do leg injury effects chance occur
]]
Config.HeadInjuryTimer = 80
Config.ArmInjuryTimer = 80
Config.LegInjuryTimer = 80

--[[
    The Chance, In Percent, That Certain Injury Side-Effects Get Applied
]]
Config.HeadInjuryChance = 15
Config.ArmInjuryChance = 15
Config.LegInjuryChance = {
    Running = 5,
    Walking = 2
}

--[[
    MajorArmoredBleedChance : The % Chance Someone Gets A Bleed Effect Applied When Taking Major Damage With Armor
    MajorDoubleBleed : % Chance You Have To Receive Double Bleed Effect From Major Damage, This % is halved if the player has armor
]]
Config.MajorArmoredBleedChance = 35

--[[
    DamgeMinorToMajor : How much damage would have to be applied for a minor weapon to be considered a major damage event. Put this at 100 if you want to disable it
]]
Config.DamageMinorToMajor = 35

--[[
    AlertShowInfo : 
]]
Config.AlertShowInfo = 2


Config.MorphineTimer = 150 --Time until morphine screen effects go away (In Seconds)
Config.MorphineStress = 100 -- How much stress is relieved

Config.LAStress = 70 -- How much stress is relieved
Config.LATimer = 150 --In seconds until it wears off

--[[
    These following lists uses tables defined in definitions.lua, you can technically use the hardcoded values but for sake
    of ensuring future updates doesn't break it I'd highly suggest you check that file for the index you're wanting to use.

    MinorInjurWeapons : Damage From These Weapons Will Apply Only Minor Injuries
    MajorInjurWeapons : Damage From These Weapons Will Apply Only Major Injuries
    AlwaysBleedChanceWeapons : Weapons that're in the included weapon classes will roll for a chance to apply a bleed effect if the damage wasn't enough to trigger an injury chance
    CriticalAreas : 
    StaggerAreas : These are the body areas that would cause a stagger is hit by firearms,
        Table Values: Armored = Can This Cause Stagger If Wearing Armor, Major = % Chance You Get Staggered By Major Damage, Minor = % Chance You Get Staggered By Minor Damage
]]

Config.WeaponClasses = {
    ['SMALL_CALIBER'] = 1,
    ['MEDIUM_CALIBER'] = 2,
    ['HIGH_CALIBER'] = 3,
    ['SHOTGUN'] = 4,
    ['CUTTING'] = 5,
    ['LIGHT_IMPACT'] = 6,
    ['HEAVY_IMPACT'] = 7,
    ['EXPLOSIVE'] = 8,
    ['FIRE'] = 9,
    ['SUFFOCATING'] = 10,
    ['OTHER'] = 11,
    ['WILDLIFE'] = 12,
    ['NOTHING'] = 13
}

Config.MinorInjurWeapons = {
    [Config.WeaponClasses['SMALL_CALIBER']] = true,
    [Config.WeaponClasses['MEDIUM_CALIBER']] = true,
    [Config.WeaponClasses['CUTTING']] = true,
    [Config.WeaponClasses['WILDLIFE']] = true,
    [Config.WeaponClasses['OTHER']] = true,
    [Config.WeaponClasses['LIGHT_IMPACT']] = true,
}

Config.MajorInjurWeapons = {
    [Config.WeaponClasses['HIGH_CALIBER']] = true,
    [Config.WeaponClasses['HEAVY_IMPACT']] = true,
    [Config.WeaponClasses['SHOTGUN']] = true,
    [Config.WeaponClasses['EXPLOSIVE']] = true,
}

Config.AlwaysBleedChanceWeapons = {
    [Config.WeaponClasses['SMALL_CALIBER']] = true,
    [Config.WeaponClasses['MEDIUM_CALIBER']] = true,
    [Config.WeaponClasses['CUTTING']] = true,
    [Config.WeaponClasses['WILDLIFE']] = false,
}

Config.ForceInjuryWeapons = {
    [Config.WeaponClasses['HIGH_CALIBER']] = true,
    [Config.WeaponClasses['HEAVY_IMPACT']] = true,
    [Config.WeaponClasses['EXPLOSIVE']] = true,
}

Config.CriticalAreas = {
    ['UPPER_BODY'] = { armored = false },
    ['LOWER_BODY'] = { armored = true },
    ['SPINE'] = { armored = false },
}

Config.StaggerAreas = {
    ['SPINE'] = { armored = true, major = 30, minor = 20 },
    ['UPPER_BODY'] = { armored = false, major = 30, minor = 20 },
    ['LLEG'] = { armored = true, major = 55, minor = 40 },
    ['RLEG'] = { armored = true, major = 55, minor = 50 },
    ['LFOOT'] = { armored = true, major = 55, minor = 40 },
    ['RFOOT'] = { armored = true, major = 55, minor = 40 },
}

Config.WoundStates = {
    'irritated',
    'pretty painful',
    'pain',
    'really hurting',
}

Config.BleedingStates = {
    [1] = {label = 'Bleeding a little..', damage = 10, chance = 40},
    [2] = {label = 'Bleeding ..', damage = 10, chance = 40},
    [3] = {label = 'Bleeding quite a bit..', damage = 15, chance = 40},
    [4] = {label = 'Bleeding a lot..', damage = 20, chance = 40},
}

Config.MovementRate = {
    0.98,
    0.96,
    0.94,
    0.92,
}

Config.Bones = {
    [0]     = 'NONE',
    [31085] = 'HEAD',
    [31086] = 'HEAD',
    [39317] = 'NECK',
    [57597] = 'SPINE',
    [23553] = 'SPINE',
    [24816] = 'SPINE',
    [24817] = 'SPINE',
    [24818] = 'SPINE',
    [10706] = 'UPPER_BODY',
    [64729] = 'UPPER_BODY',
    [11816] = 'LOWER_BODY',
    [45509] = 'LARM',
    [61163] = 'LARM',
    [18905] = 'LHAND',
    [4089] = 'LFINGER',
    [4090] = 'LFINGER',
    [4137] = 'LFINGER',
    [4138] = 'LFINGER',
    [4153] = 'LFINGER',
    [4154] = 'LFINGER',
    [4169] = 'LFINGER',
    [4170] = 'LFINGER',
    [4185] = 'LFINGER',
    [4186] = 'LFINGER',
    [26610] = 'LFINGER',
    [26611] = 'LFINGER',
    [26612] = 'LFINGER',
    [26613] = 'LFINGER',
    [26614] = 'LFINGER',
    [58271] = 'LLEG',
    [63931] = 'LLEG',
    [2108] = 'LFOOT',
    [14201] = 'LFOOT',
    [40269] = 'RARM',
    [28252] = 'RARM',
    [57005] = 'RHAND',
    [58866] = 'RFINGER',
    [58867] = 'RFINGER',
    [58868] = 'RFINGER',
    [58869] = 'RFINGER',
    [58870] = 'RFINGER',
    [64016] = 'RFINGER',
    [64017] = 'RFINGER',
    [64064] = 'RFINGER',
    [64065] = 'RFINGER',
    [64080] = 'RFINGER',
    [64081] = 'RFINGER',
    [64096] = 'RFINGER',
    [64097] = 'RFINGER',
    [64112] = 'RFINGER',
    [64113] = 'RFINGER',
    [36864] = 'RLEG',
    [51826] = 'RLEG',
    [20781] = 'RFOOT',
    [52301] = 'RFOOT',
}

Config.BoneIndexes = {
    ['NONE'] = 0,
    ['HEAD'] = 31085,
    ['HEAD'] = 31086,
    ['NECK'] = 39317, 
    ['SPINE'] = 57597,
    ['SPINE'] = 23553,
    ['SPINE'] = 24816,
    ['SPINE'] = 24817,
    ['SPINE'] = 24818,
    ['UPPER_BODY'] = 10706,
    ['UPPER_BODY'] = 64729,
    ['LOWER_BODY'] = 11816,
    ['LARM'] = 45509,
    ['LARM'] = 61163,
    ['LHAND'] = 18905,
    ['LFINGER'] = 4089,
    ['LFINGER'] = 4090,
    ['LFINGER'] = 4137,
    ['LFINGER'] = 4138,
    ['LFINGER'] = 4153,
    ['LFINGER'] = 4154,
    ['LFINGER'] = 4169,
    ['LFINGER'] = 4170,
    ['LFINGER'] = 4185,
    ['LFINGER'] = 4186,
    ['LFINGER'] = 26610,
    ['LFINGER'] = 26611,
    ['LFINGER'] = 26612,
    ['LFINGER'] = 26613,
    ['LFINGER'] = 26614,
    ['LLEG'] = 58271,
    ['LLEG'] = 63931,
    ['LFOOT'] = 2108,
    ['LFOOT'] = 14201,
    ['RARM'] = 40269,
    ['RARM'] = 28252,
    ['RHAND'] = 57005,
    ['RFINGER'] = 58866,
    ['RFINGER'] = 58867,
    ['RFINGER'] = 58868,
    ['RFINGER'] = 58869,
    ['RFINGER'] = 58870,
    ['RFINGER'] = 64016,
    ['RFINGER'] = 64017,
    ['RFINGER'] = 64064,
    ['RFINGER'] = 64065,
    ['RFINGER'] = 64080,
    ['RFINGER'] = 64081,
    ['RFINGER'] = 64096,
    ['RFINGER'] = 64097,
    ['RFINGER'] = 64112,
    ['RFINGER'] = 64113,
    ['RLEG'] = 36864,
    ['RLEG'] = 51826,
    ['RFOOT'] = 20781,
    ['RFOOT'] = 52301,
}

Config.Weapons = {
    [`WEAPON_STUNGUN`] = Config.WeaponClasses['NONE'],
    --[[ Small Caliber ]]--
    [`WEAPON_PISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_COMBATPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_APPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_COMBATPDW`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MACHINEPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MICROSMG`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_MINISMG`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_PISTOL_MK2`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_SNSPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_SNSPISTOL_MK2`] = Config.WeaponClasses['SMALL_CALIBER'],
    [`WEAPON_VINTAGEPISTOL`] = Config.WeaponClasses['SMALL_CALIBER'],

    --[[ Medium Caliber ]]--
    [`WEAPON_ADVANCEDRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_ASSAULTSMG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_BULLPUPRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_BULLPUPRIFLE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_CARBINERIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_CARBINERIFLE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_COMPACTRIFLE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_DOUBLEACTION`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_GUSENBERG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_HEAVYPISTOL`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_MARKSMANPISTOL`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_PISTOL50`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REVOLVER`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_REVOLVER_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SMG`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SMG_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SPECIALCARBINE`] = Config.WeaponClasses['MEDIUM_CALIBER'],
    [`WEAPON_SPECIALCARBINE_MK2`] = Config.WeaponClasses['MEDIUM_CALIBER'],

    --[[ High Caliber ]]--
    [`WEAPON_ASSAULTRIFLE`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_ASSAULTRIFLE_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_COMBATMG`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_COMBATMG_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_HEAVYSNIPER`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_HEAVYSNIPER_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MARKSMANRIFLE`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MARKSMANRIFLE_MK2`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MG`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MINIGUN`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_MUSKET`] = Config.WeaponClasses['HIGH_CALIBER'],
    [`WEAPON_RAILGUN`] = Config.WeaponClasses['HIGH_CALIBER'],

    --[[ Shotguns ]]--
    [`WEAPON_ASSAULTSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_BULLUPSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_DBSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_HEAVYSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_PUMPSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_PUMPSHOTGUN_MK2`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SAWNOFFSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],
    [`WEAPON_SWEEPERSHOTGUN`] = Config.WeaponClasses['SHOTGUN'],

    --[[ Animals ]]--
    [`WEAPON_ANIMAL`] = Config.WeaponClasses['WILDLIFE'], -- Animal
    [`WEAPON_COUGAR`] = Config.WeaponClasses['WILDLIFE'], -- Cougar
    [`WEAPON_BARBED_WIRE`] = Config.WeaponClasses['WILDLIFE'], -- Barbed Wire
    
    --[[ Cutting Weapons ]]--
    [`WEAPON_BATTLEAXE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_BOTTLE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_DAGGER`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_HATCHET`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_KNIFE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_MACHETE`] = Config.WeaponClasses['CUTTING'],
    [`WEAPON_SWITCHBLADE`] = Config.WeaponClasses['CUTTING'],

    --[[ Light Impact ]]--
    [`WEAPON_KNUCKLE`] = Config.WeaponClasses['LIGHT_IMPACT'],
    
    --[[ Heavy Impact ]]--
    [`WEAPON_BAT`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_CROWBAR`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_FIREEXTINGUISHER`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_FIRWORK`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_GOLFLCUB`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_HAMMER`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_PETROLCAN`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_POOLCUE`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_WRENCH`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_RAMMED_BY_CAR`] = Config.WeaponClasses['HEAVY_IMPACT'],
    [`WEAPON_RUN_OVER_BY_CAR`] = Config.WeaponClasses['HEAVY_IMPACT'],
    
    --[[ Explosives ]]--
    [`WEAPON_EXPLOSION`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_GRENADE`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_COMPACTLAUNCHER`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_HOMINGLAUNCHER`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_PIPEBOMB`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_PROXMINE`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_RPG`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_STICKYBOMB`] = Config.WeaponClasses['EXPLOSIVE'],
    [`WEAPON_HELI_CRASH`] = Config.WeaponClasses['EXPLOSIVE'],
    
    --[[ Other ]]--
    [`WEAPON_FALL`] = Config.WeaponClasses['OTHER'], -- Fall
    [`WEAPON_HIT_BY_WATER_CANNON`] = Config.WeaponClasses['OTHER'], -- Water Cannon
    
    --[[ Fire ]]--
    [`WEAPON_ELECTRIC_FENCE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FIRE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_MOLOTOV`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FLARE`] = Config.WeaponClasses['FIRE'],
    [`WEAPON_FLAREGUN`] = Config.WeaponClasses['FIRE'],

    --[[ Suffocate ]]--
    [`WEAPON_DROWNING`] = Config.WeaponClasses['SUFFOCATING'], -- Drowning
    [`WEAPON_DROWNING_IN_VEHICLE`] = Config.WeaponClasses['SUFFOCATING'], -- Drowning Veh
    [`WEAPON_EXHAUSTION`] = Config.WeaponClasses['SUFFOCATING'], -- Exhaust
    [`WEAPON_BZGAS`] = Config.WeaponClasses['SUFFOCATING'],
    [`WEAPON_SMOKEGRENADE`] = Config.WeaponClasses['SUFFOCATING'],
}