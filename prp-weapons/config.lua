Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Config = Config or {}

Config.DurabilityBlockedWeapons = {
    "weapon_pistol_mk2",
    "weapon_carbinerifle_mk2",
    "weapon_stungun",
    "weapon_pumpshotgun_mk2",
    "weapon_smg",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
}

Config.DurabilityMultiplier = {
    [GetHashKey("weapon_unarmed")] 				 = 0.03,
    [GetHashKey("weapon_knife")] 				 = 0.03,
    [GetHashKey("weapon_nightstick")] 			 = 0.03,
    [GetHashKey("weapon_hammer")] 				 = 0.03,
    [GetHashKey("weapon_bat")] 					 = 0.03,
    [GetHashKey("weapon_golfclub")] 			 = 0.03,
    [GetHashKey("weapon_crowbar")] 				 = 0.03,
    [GetHashKey("weapon_pistol")] 				 = 0.03,
    [GetHashKey("weapon_pistol_mk2")] 			 = 0.00,
    [GetHashKey("weapon_combatpistol")] 		 = 0.03,
    [GetHashKey("weapon_appistol")] 			 = 0.03,
    [GetHashKey("weapon_pistol50")] 			 = 0.03,
    [GetHashKey("weapon_microsmg")] 			 = 0.03,
    [GetHashKey("weapon_smg")] 				 	 = 0.03,
    [GetHashKey("weapon_assaultsmg")] 			 = 0.03,
    [GetHashKey("weapon_assaultrifle")] 		 = 0.03,
    [GetHashKey("weapon_carbinerifle")] 		 = 0.03,
    [GetHashKey("weapon_advancedrifle")] 		 = 0.03,
    [GetHashKey("weapon_mg")] 					 = 0.03,
    [GetHashKey("weapon_combatmg")] 			 = 0.03,
    [GetHashKey("weapon_pumpshotgun")] 			 = 0.03,
    [GetHashKey("weapon_sawnoffshotgun")] 		 = 0.03,
    [GetHashKey("weapon_assaultshotgun")] 		 = 0.03,
    [GetHashKey("weapon_bullpupshotgun")] 		 = 0.03,
    [GetHashKey("weapon_stungun")] 				 = 0.03,
    [GetHashKey("weapon_sniperrifle")] 			 = 0.03,
    [GetHashKey("weapon_heavysniper")] 			 = 0.03,
    [GetHashKey("weapon_remotesniper")] 		 = 0.03,
    [GetHashKey("weapon_grenadelauncher")] 		 = 0.03,
    [GetHashKey("weapon_grenadelauncher_smoke")] = 0.03,
    [GetHashKey("weapon_rpg")] 					 = 0.03,
    [GetHashKey("weapon_minigun")] 				 = 0.03,
    [GetHashKey("weapon_grenade")] 				 = 0.03,
    [GetHashKey("weapon_stickybomb")] 			 = 0.03,
    [GetHashKey("weapon_smokegrenade")] 		 = 0.03,
    [GetHashKey("weapon_bzgas")] 				 = 0.03,
    [GetHashKey("weapon_molotov")] 				 = 0.03,
    [GetHashKey("weapon_fireextinguisher")] 	 = 0.03,
    [GetHashKey("weapon_petrolcan")] 			 = 0.03,
    [GetHashKey("weapon_briefcase")] 			 = 0.03,
    [GetHashKey("weapon_briefcase_02")] 		 = 0.03,
    [GetHashKey("weapon_ball")] 				 = 0.03,
    [GetHashKey("weapon_flare")] 				 = 0.03,
    [GetHashKey("weapon_snspistol")] 			 = 0.03,
    [GetHashKey("weapon_bottle")] 				 = 0.03,
    [GetHashKey("weapon_gusenberg")] 			 = 0.03,
    [GetHashKey("weapon_specialcarbine")] 		 = 0.03,
    [GetHashKey("weapon_heavypistol")] 			 = 0.03,
    [GetHashKey("weapon_bullpuprifle")] 		 = 0.03,
    [GetHashKey("weapon_dagger")] 				 = 0.03,
    [GetHashKey("weapon_vintagepistol")] 		 = 0.03,
    [GetHashKey("weapon_firework")] 			 = 0.03,
    [GetHashKey("weapon_musket")] 			     = 0.03,
    [GetHashKey("weapon_heavyshotgun")] 		 = 0.03,
    [GetHashKey("weapon_marksmanrifle")] 		 = 0.03,
    [GetHashKey("weapon_hominglauncher")] 		 = 0.03,
    [GetHashKey("weapon_proxmine")] 			 = 0.03,
    [GetHashKey("weapon_snowball")] 		     = 0.03,
    [GetHashKey("weapon_flaregun")] 			 = 0.03,
    [GetHashKey("weapon_garbagebag")] 			 = 0.03,
    [GetHashKey("weapon_handcuffs")] 			 = 0.03,
    [GetHashKey("weapon_combatpdw")] 			 = 0.03,
    [GetHashKey("weapon_marksmanpistol")] 		 = 0.03,
    [GetHashKey("weapon_knuckle")] 				 = 0.03,
    [GetHashKey("weapon_hatchet")] 				 = 0.03,
    [GetHashKey("weapon_railgun")] 				 = 0.03,
    [GetHashKey("weapon_machete")] 				 = 0.03,
    [GetHashKey("weapon_machinepistol")] 		 = 0.03,
    [GetHashKey("weapon_switchblade")] 			 = 0.03,
    [GetHashKey("weapon_revolver")] 			 = 0.03,
    [GetHashKey("weapon_dbshotgun")] 			 = 0.03,
    [GetHashKey("weapon_compactrifle")] 		 = 0.03,
    [GetHashKey("weapon_autoshotgun")] 			 = 0.03,
    [GetHashKey("weapon_battleaxe")] 			 = 0.03,
    [GetHashKey("weapon_compactlauncher")] 		 = 0.03,
    [GetHashKey("weapon_minismg")] 				 = 0.03,
    [GetHashKey("weapon_pipebomb")] 			 = 0.03,
    [GetHashKey("weapon_poolcue")] 				 = 0.03,
    [GetHashKey("weapon_wrench")] 				 = 0.03,
    [GetHashKey("weapon_autoshotgun")] 		 	 = 0.03,
    [GetHashKey("weapon_bread")] 				 = 0.03,
    [GetHashKey("weapon_carbinerifle_mk2")] 	 = 0.00,
    [GetHashKey("weapon_pumpshotgun_mk2")] 		 = 0.00,
}

Config.WeaponRepairPoints = {
    [1] = {
        coords = {x = 480.74, y = -636.04, z = 25.02, h = 8.5, r = 1.0},
        IsRepairing = false,
        RepairingData = {},
    },
    [2] = {
    coords = {x = 487.23, y = -996.93, z = 30.68, h = 8.5, r = 1.0},
    IsRepairing = false,
    RepairingData = {},
    }
}

Config.WeaponRepairCotsts = {
    ["pistol"] = 1500,
    ["smg"] = 3000,
    ["rifle"] = 5000,
}

Config.WeaponAttachments = {
    ["WEAPON_APPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_APPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_MACHINEPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MACHINEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_PISTOL50"] = {
        ["extendedclip"] = {
            component = "COMPONENT_PISTOL50_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
    },
    ["WEAPON_HEAVYPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_HEAVYPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["etchedwoodgripfinish"] = {
            component = "COMPONENT_HEAVYPISTOL_VARMOD_LUXE",
            label = "Etched Wood Grip Finish",
            item = "pistol_skin",
        },
        ["Flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight",
        },
    },
    ["WEAPON_COMBATPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_COMBATPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_CARBINERIFLE"] = {
        ["yusufamirluxuryfinish"] = {
            component = "COMPONENT_CARBINERIFLE_VARMOD_LUXE",
            label = "Yusuf Amir Luxury Finish",
            item = "rifle_skin",
        },
    },
    ["WEAPON_SNSPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_SNSPISTOL_CLIP_02",
            label = "Extended Magazine",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_VINTAGEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_PISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        }, 
        ["extendedclip"] = {
            component = "COMPONENT_PISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },                                                    
    },
    ["WEAPON_MICROSMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MICROSMG_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "smg_flashlight",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Scope",
            item = "smg_scope",
        },
    },
    ["WEAPON_MINISMG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_MINISMG_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
    },
    ["WEAPON_COMBATPDW"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMBATPDW_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_SMALL",
            label = "Scope",
            item = "smg_scope",
        },
    },
    ["WEAPON_ASSAULTSMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTSMG_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Scope",
            item = "smg_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Scope",
            item = "smg_flashlight",
        },
    },
    ["WEAPON_COMPACTRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_03",
            label = "Drum Mag",
            item = "rifle_drummag",
        },
    },
    ["WEAPON_BULLPUPRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_BULLPUPRIFLE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
    },
    ["WEAPON_BULLPUPRIFLE_MK2"] = {
            ["extendedclip"] = {
                component = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_02",
                label = "Extended Magazine",
                item = "rifle_extendedclip",
            },
            ["suppressor"] = {
                component = "COMPONENT_AT_AR_SUPP",
                label = "Suppressor",
                item = "rifle_suppressor",
            },
    },
    ["WEAPON_SPECIALCARBINE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_SPECIALCARBINE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_SPECIALCARBINE_CLIP_03",
            label = "Drum Mag",
            item = "rifle_drummag",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
    },
    ["WEAPON_ADVANCEDRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_ADVANCEDRIFLE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
    },
    ["WEAPON_ASSAULTRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTRIFLE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
        ["drummag"] = {
            component = "COMPONENT_ASSAULTRIFLE_CLIP_03",
            label = "Drum Mag",
            item = "rifle_drummag",
        },
    },
    ["WEAPON_ASSAULTRIFLE_mk2"] = {
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
        
    },
    ["WEAPON_CARBINERIFLE_mk2"] = {
        ["extendedclip"] = {
            component = "COMPONENT_CARBINERIFLE_MK2_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
        
    },
    ["WEAPON_GUSENBERG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_GUSENBERG_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
    },    
}