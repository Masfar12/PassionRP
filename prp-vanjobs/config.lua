Config = {}

Config.Debug = true

-- Police Settings
Config.RequiredPoliceOnline = 5			-- required police online for players to do missions

-- Location where get mission from NPC:
Config.MissionNPC = {
	{  
		Pos = {x = -106.67, y = -2234.64, z = 7.81},
		Heading = 101.61,
		Ped = 'u_m_o_taphillbilly'
    },
} 

Config.RewardsLevel1 = {
	{
		Type = "Money",
		Amount = math.random(1500,2500)
	}
}

Config.RewardsLevel2 = {
	{
		Type = "Money",
		Amount = math.random(3000,8000)
	},
	{
		Type = "Money",
		Amount = math.random(3000,8000)
	},
	{
		Type = "Money",
		Amount = math.random(3000,8000)
	},
	{
		Type = "Money",
		Amount = math.random(3000,8000)
	},
	{
		Type = "Item",
		Item = "goldbar",
		Amount = math.random(5,10)
	},
	{
		Type = "Item",
		Item = "rolex",
		Amount = math.random(14,30)
	},
	{
		Type = "Item",
		Item = "goldchain",
		Amount = math.random(10,40)
	},
	{
		Type = "Item",
		Item = "rolex",
		Amount = math.random(7,25)
	},
	{
		Type = "Item",
		Item = "goldchain",
		Amount = math.random(25,60)
	},
}

Config.RewardsLevel3 = {
	{
		Type = "Money",
		Amount = math.random(5000,9000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Money",
		Amount = math.random(7000,13000)
	},
	{
		Type = "Item",
		Item = "WEAPON_MOLOTOV",
		Amount = math.random(1,4)
	},
	{
		Type = "Item",
		Item = "snspistol_part_1",
		Amount = math.random(1,2)
	},
	{
		Type = "Item",
		Item = "snspistol_part_2",
		Amount = math.random(1,2)
	},
	{
		Type = "Item",
		Item = "snspistol_part_3",
		Amount = math.random(1,2)
	},
	{
		Type = "Item",
		Item = "snspistol_stage_1",
		Amount = math.random(1,2)
	},
	{
		Type = "Item",
		Item = "WEAPON_MOLOTOV",
		Amount = math.random(1,2)
	},
	{
		Type = "Item",
		Item = "security_card_01",
		Amount = math.random(1,1)
	},
	{
		Type = "Item",
		Item = "security_card_02",
		Amount = math.random(1,1)
	},
}

Config.RewardsLevel4 = {
	{
		Type = "Money",
		Amount = math.random(10000,15000)
	},
	{
		Type = "Money",
		Amount = math.random(10000,15000)
	},
	{
		Type = "Money",
		Amount = math.random(10000,15000)
	},
	{
		Type = "Money",
		Amount = math.random(10000,15000)
	},
	{
		Type = "Item",
		Item = "weapon_stickybomb",
		Amount = math.random(1,1)
	},
	{
		Type = "Item",
		Item = "weapon_proxmine",
		Amount = math.random(1,1)
	},
}

Config.RewardsLevel5 = {
	{
		Type = "Money",
		Amount = math.random(13000,19000)
	},
	{
		Type = "Money",
		Amount = math.random(13000,19000)
	},
	{
		Type = "Money",
		Amount = math.random(13000,19000)
	},
	{
		Type = "Money",
		Amount = math.random(13000,19000)
	},
	{
		Type = "Money",
		Amount = math.random(13000,19000)
	},
	{
		Type = "Money",
		Amount = math.random(13000,19000)
	},
	{
		Type = "Item",
		Item = "assmeth",
		Amount = math.random(50,150)
	},
	{
		Type = "Item",
		Item = "refined_xtc_brick",
		Amount = math.random(5,10)
	},
	{
		Type = "Item",
		Item = "weapon_appistol",
		Amount = math.random(1,1)
	},
	{
		Type = "Item",
		Item = "weapon_sawnoffshotgun",
		Amount = math.random(1,1)
	},
	{
		Type = "Item",
		Item = "weapon_bullpupshotgun",
		Amount = math.random(1,1)
	},
}

Config.MissionPosition = 
{
	{
		Level = 2,
		Location = vector3(2196.13,5608.19,53.51),
		InUse = false,
		Heading = 342.84,
		GoonSpawns = {
			NPC1 = {
				x = 2201.42,
				y = 5610.36,
				z = 53.53,
				h = 339.79,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC2 = {
				x = 2194.21,
				y = 5614.47,
				z = 54.17,
				h = 271.37,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_MICROSMG',
			},
			NPC3 = {
				x = 2194.11,
				y = 5608.79,
				z = 53.64,
				h = 332.48,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINISMG',
			},
			NPC4 = {
				x = 2194.11,
				y = 5606.79,
				z = 53.64,
				h = 332.48,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_AUTOSHOTGUN',
			},
			NPC5 = {
				x = 2194.11,
				y = 5604.79,
				z = 53.64,
				h = 332.48,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC6 = {
				x = 2194.11,
				y = 5602.79,
				z = 53.64,
				h = 332.48,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_appistol',
			}
		}
	},
	{
		Level = 2,
		Location = vector3(2553.55,4673.64,33.92),
		InUse = false,
		Heading = 17.77,
		GoonSpawns = {
			NPC1 = {
				x = 2549.01,
				y = 4669.23,
				z = 34.08,
				h = 4.96,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC2 = {
				x = 2558.2,
				y = 4673.08,
				z = 34.08,
				h = 48.73,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_MINISMG',
			},
			NPC3 = {
				x = 2545.5776367188,
				y = 4675.0551757813,
				z = 34.009281158447,
				h = 331.84777832032,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINISMG',
			},
			NPC4 = {
				x = 2545.5776367188,
				y = 4673.0551757813,
				z = 34.009281158447,
				h = 331.84777832032,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINISMG',
			},
			NPC5 = {
				x = 2545.5776367188,
				y = 4671.0551757813,
				z = 34.009281158447,
				h = 331.84777832032,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINISMG',
			},
			NPC6 = {
				x = 2545.5776367188,
				y = 4669.0551757813,
				z = 34.009281158447,
				h = 331.84777832032,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINISMG',
			}
		}
	},
	{
		Level = 2,
		Location = vector3(1461.0035400391,6549.5546875,14.42578792572),
		InUse = false,
		Heading = 178.32929992676,
		GoonSpawns = {
			NPC1 = {
				x = 1465.4285888672,
				y = 6541.6909179688,
				z = 14.275111198425,
				h = 64.84741973877,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC2 = {
				x = 1466.6131591797,
				y = 6553.9331054688,
				z = 13.999475479126,
				h = 131.08628845214,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_MINISMG',
			},
			NPC3 = {
				x = 1458.552734375,
				y = 6559.8950195313,
				z = 14.043141365051,
				h = 172.92164611816,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC4 = {
				x = 1460.552734375,
				y = 6559.8950195313,
				z = 14.043141365051,
				h = 172.92164611816,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINISMG',
			},
			NPC5 = {
				x = 1462.552734375,
				y = 6559.8950195313,
				z = 14.043141365051,
				h = 172.92164611816,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_autoshotgun',
			},
			NPC6 = {
				x = 1463.552734375,
				y = 6559.8950195313,
				z = 14.043141365051,
				h = 172.92164611816,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			}
		}
	},
	{
		Level = 4,
		Location = vector3(1261.9155273438, -2564.9985351563, 42.718070983887), -- new
		InUse = false,
		Heading = 281.19357299805,
		GoonSpawns = {
			NPC1 = {
				x = 1259.4074707031,
				y = -2561.2724609375,
				z = 42.716934204102,
				h = 181.1067199707,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_MICROSMG',
			},
			NPC2 = {
				x = 1251.0943603516,
				y = -2568.1916503906,
				z = 42.715923309326,
				h = 285.62423706055,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_ADVANCEDRIFLE',
			},
			NPC3 = {
				x =1259.8828125,
				y = -2571.146484375,
				z = 42.764656066895,
				h = 352.33865356445,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC4 = {
				x = 1248.0546875,
				y = -2578.5710449219,
				z = 45.411605834961,
				h = 303.88589477539,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_ADVANCEDRIFLE',
			},
			NPC5 = {
				x = 1245.3768310547,
				y = -2570.8881835938,
				z = 43.059829711914,
				h = 288.03530883789,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC6 = {
				x = 1247.3564453125,
				y = -2565.6235351563,
				z =  42.714172363281,
				h = 284.12686157227,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
			NPC7 = {
				x = 1273.0615234375,
				y = -2567.3444824219,
				z =  43.42419052124,
				h = 305.78094482422,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
			NPC8 = {
				x = 1247.78, y = -2566.12, z = 42.71, h = 274.53,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
		}
	},
	{
		Level = 2,
		Location = vector3(1527.2032470703, 1718.6899414063, 109.95385742188), -- new
		InUse = false,
		Heading = 25.805246353149,
		GoonSpawns = {
			NPC1 = {
				x = 1535.7685546875,
				y = 1719.4942626953,
				z = 109.70241546631,
				h = 88.287879943848,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_MICROSMG',
			},
			NPC2 = {
				x = 1525.5168457031,
				y = 1710.9213867188,
				z = 109.99111938477,
				h = 346.89251708984,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_MICROSMG',
			},
			NPC3 = {
				x = 1531.1019287109,
				y = 1720.3985595703,
				z = 110.1390838623,
				h = 47.460628509521,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC4 = {
				x = 1534.5111083984,
				y = 1712.4643554688,
				z = 109.91903686523,
				h = 7.2774186134338,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC5 = {
				x = 1539.9975585938,
				y = 1709.0718994141,
				z = 112.51155090332,
				h = 46.605373382568,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_MICROSMG',
			},
			NPC6 = {
				x =  1539.2258300781,
				y = 1705.5477294922,
				z =  114.82328033447,
				h = 43.002788543701,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC7 = {
				x = 1529.4187011719,
				y = 1708.7666015625,
				z = 109.95012664795,
				h = 355.8547668457,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
		}
	},
	{
		Level = 3,
		Location = vector3(-580.72448730469, -1639.734375, 19.514644622803), -- new
		InUse = false,
		Heading = 234.6824798584,
		GoonSpawns = {
			NPC1 = {
				x = -569.70501708984,
				y = -1632.9753417969,
				z = 19.412420272827,
				h = 126.27658843994,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_MICROSMG',
			},
			NPC2 = {
				x = -581.45837402344,
				y = -1647.98828125,
				z = 22.22056388855,
				h = 300.681640625,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_MINISMG',
			},
			NPC3 = {
				x = -592.65570068359,
				y = -1639.0361328125,
				z = 19.965841293335,
				h = 328.33544921875,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'weapon_dbshotgun',
			},
			NPC4 = {
				x = -590.54077148438,
				y = -1631.1505126953,
				z = 19.986782073975,
				h = 237.11547851563,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_heavyshotgun',
			},
			NPC5 = {
				x = -595.03936767578,
				y = -1634.2292480469,
				z = 19.983247756958,
				h = 216.80317687988,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_dbshotgun',
			},
			NPC6 = {
				x = -564.81805419922,
				y = -1637.6254882813,
				z = 19.241283416748,
				h = 98.926261901855,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC7 = {
				x = -567.85827636719,
				y = -1640.591796875,
				z = 19.309392929077,
				h = 163.41784667969,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			}
		}
	},
	{
		Level = 2,
		Location = vector3(-1078.3391113281, -1660.5759277344, 4.3984241485596), -- new
		InUse = false,
		Heading = 32.514999389648,
		GoonSpawns = {
			NPC1 = {
				x = -1069.7874755859, y = -1663.2589111328, z = 4.5660438537598, h = 56.178337097168,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC2 = {
				x = -1077.3601074219, y = -1671.8488769531, z = 4.5304851531982, h = 1.3493340015411,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_microsmg',
			},
			NPC3 = {
				x = -1083.8231201172, y = -1666.7098388672, z = 4.7049689292908, h = 322.53424072266,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_microsmg',
			},
			NPC4 = {
				x = -1073.0476074219, y = -1659.1596679688, z = 4.3838019371033, h = 111.45928192139,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_microsmg',
			},
			NPC5 = {
				x = -1085.1287841797, y = -1656.068359375, z = 4.3984298706055, h = 214.48919677734,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_smg',
			},
			NPC6 = {
				x = -1084.6177978516, y = -1663.8686523438, z = 4.7049689292908, h = 324.13201904297,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_advancedrifle',
			},
			NPC7 = {
				x = -1075.0245361328, y = -1649.2442626953, z = 4.5012054443359, h = 177.77044677734,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_stungun',
			}
		}
	},
	{
		Level = 2,
		Location = vector3(928.97326660156, -2534.2473144531, 28.302661895752), -- new
		InUse = false,
		Heading = 176.60430908203,
		GoonSpawns = {
			NPC1 = {
				x = 923.76068115234, y = -2534.3637695313, z = 28.302661895752, h = 261.53826904297,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC2 = {
				x = 922.22253417969, y = -2530.8024902344, z = 28.302661895752, h = 240.40336608887,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_stungun',
			},
			NPC3 = {
				x = 934.70812988281, y = -2527.7434082031, z = 28.302661895752, h = 192.19319152832,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC4 = {
				x = 938.21466064453, y = -2528.3896484375, z = 28.302661895752, h = 170.70359802246,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_minismg',
			},
			NPC5 = {
				x = 940.67163085938, y = -2533.3034667969, z = 28.302661895752, h = 89.303939819336,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_microsmg',
			},
			NPC6 = {
				x = 924.92010498047, y = -2546.119140625, z = 28.302677154541, h = 265.20642089844,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_smg',
			},
			NPC7 = {
				x = 927.65197753906, y = -2548.0407714844, z = 28.302677154541, h = 269.68310546875,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_dbshotgun',
			}
		}
	},
	{
		Level = 3,
		Location = vector3(873.13995361328, -958.48278808594, 26.283700942993), -- new
		InUse = false,
		Heading = 1.5253974199295,
		GoonSpawns = {
			NPC1 = {
				x = 880.08117675781, y = -956.77874755859, z = 27.857223510742, h = 89.332069396973,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC2 = {
				x = 879.9462890625, y = -960.78491210938, z = 27.857223510742, h = 48.459938049316,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_dbshotgun',
			},
			NPC3 = {
				x = 880.06256103516, y = -965.58099365234, z = 27.858011245728, h = 32.698905944824,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_stungun',
			},
			NPC4 = {
				x = 875.12866210938, y = -962.75842285156, z = 26.28569984436, h = 31.392904281616,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC5 = {
				x = 868.65466308594, y = -962.44561767578, z = 26.283555984497, h = 328.72076416016,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_microsmg',
			},
			NPC6 = {
				x = 869.13458251953, y = -958.20886230469, z = 26.282346725464, h = 347.66455078125,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC7 = {
				x = 865.41668701172, y = -945.02490234375, z = 26.282205581665, h = 349.58819580078,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			}
		}
	},
	{
		Level = 4,
		Location = vector3(-2170.3891601563, 4274.9599609375, 48.954620361328), -- new
		InUse = false,
		Heading = 137.5343170166,
		GoonSpawns = {
			NPC1 = {
				x = -2161.5959472656, y = 4270.4809570313, z = 49.386077880859, h = 86.092826843262,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC2 = {
				x = -2161.8366699219, y = 4268.4931640625, z = 49.437213897705, h = 90.758689880371,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_minigun',
			},
			NPC3 = {
				x = -2166.6345214844, y = 4265.7529296875, z = 49.098808288574, h = 49.9309425354,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_advancedrifle',
			},
			NPC4 = {
				x = -2176.619140625, y = 4276.7768554688, z = 49.112510681152, h = 170.34559631348,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_advancedrifle',
			},
			NPC5 = {
				x = -2178.0168457031, y = 4273.591796875, z = 49.100814819336, h = 149.74884033203,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_advancedrifle',
			},
			NPC6 = {
				x = -2174.1101074219, y = 4259.2290039063, z = 48.956928253174, h = 23.666910171509,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_advancedrifle',
			},
			NPC7 = {
				x = -2168.7021484375, y = 4272.2685546875, z = 48.94987487793, h = 127.14915466309,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_advancedrifle',
			},
			NPC8 = {
				x = -2174.65, y = 4283.9, z = 52.4, h = 157.59,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			}
		}
	},
	{
		Level = 2,
		Location = vector3(-2170.3891601563, 4274.9599609375, 48.954620361328), -- new
		InUse = false,
		Heading = 137.5343170166,
		GoonSpawns = {
			NPC1 = {
				x = -2161.5959472656, y = 4270.4809570313, z = 49.386077880859, h = 86.092826843262,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pistol50',
			},
			NPC2 = {
				x = -2161.8366699219, y = 4268.4931640625, z = 49.437213897705, h = 90.758689880371,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'weapon_appistol',
			},
			NPC3 = {
				x = -2166.6345214844, y = 4265.7529296875, z = 49.098808288574, h = 49.9309425354,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'weapon_microsmg',
			},
			NPC4 = {
				x = -2176.619140625, y = 4276.7768554688, z = 49.112510681152, h = 170.34559631348,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_pumpshotgun',
			},
			NPC5 = {
				x = -2178.0168457031, y = 4273.591796875, z = 49.100814819336, h = 149.74884033203,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_stungun',
			},
			NPC6 = {
				x = -2174.1101074219, y = 4259.2290039063, z = 48.956928253174, h = 23.666910171509,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC7 = {
				x = -2168.7021484375, y = 4272.2685546875, z = 48.94987487793, h = 127.14915466309,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			}
		}
	},
	{
		Level = 4,
		Location = vector3(686.18408203125, 578.01721191406, 130.46131896973),
		InUse = false,
		Heading = 158.1330871582,
		GoonSpawns = {
			NPC1 = {
				x = 679.06, y = 581.42, z = 130.46, h = 154.23,
				ped = 'G_M_Y_Lost_02',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC2 = {
				x = 697.08, y = 577.45, z = 130.46, h = 140.11,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'weapon_assaultrifle',
			},
			NPC3 = {
				x = 682.88, y = 587.22, z = 130.46, h = 159.53,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC4 = {
				x = 691.03, y = 584.28, z = 130.46, h = 142.64,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC5 = {
				x = 690.44, y = 588.44, z = 131.06, h = 152.64,
				ped = 'G_M_Y_MexGang_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
			NPC6 = {
				x = 688.61, y = 585.38, z = 139.11, h = 130.94,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
			NPC7 = {
				x = 683.26, y = 567.89, z = 141.0, h = 60.47,
				ped = 'G_M_Y_SalvaBoss_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			}
		}
	},
	{
		Level = 5,
		Location = vector3(-2128.369140625, 3270.6247558594, 32.810329437256),
		InUse = false,
		Heading = 148.37368774414,
		GoonSpawns = {
			NPC1 = {
				x = -2119.51, y = 3266.9, z = 32.81, h = 126.95,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC2 = {
				x = -2117.05, y = 3270.65, z = 32.81, h = 133.61,
				ped = 's_m_y_blackops_03',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'weapon_assaultrifle',
			},
			NPC3 = {
				x = -2131.41, y = 3279.11, z = 32.81, h = 145.35,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC4 = {
				x = -2134.92, y = 3274.49, z = 32.81, h = 142.91,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC5 = {
				x = -2167.32, y = 3246.29, z = 32.81, h = 237.53,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
			NPC6 = {
				x = -2132.64, y = 3226.73, z = 32.81, h = 85.84,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
			NPC7 = {
				x = -2110.32, y = 3282.24, z = 38.73, h = 111.66,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC8 = {
				x = -2114.77, y = 3275.59, z = 38.73, h = 144.22,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC9 = {
				x = -2128.81, y = 3283.04, z = 38.73, h = 153.2,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC10 = {
				x = -2132.46, y = 3285.07, z = 38.73, h = 159.79,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC11 = {
				x = -2151.12, y = 3284.06, z = 38.73, h = 176.0,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC12 = {
				x = -2164.72, y = 3274.16, z = 38.73, h = 206.46,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
		}
	},
	{
		Level = 5,
		Location = vector3(538.76031494141, -459.77243041992, 24.781860351563),
		InUse = false,
		Heading = 169.24890136719,
		GoonSpawns = {
			NPC1 = {
				x = 533.2, y = -450.66, z = 24.74, h = 177.14,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC2 = {
				x = 550.52, y = -454.83, z = 24.96, h = 155.07,
				ped = 's_m_y_blackops_03',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'weapon_assaultrifle',
			},
			NPC3 = {
				x = 550.18, y = -461.75, z = 24.79, h = 161.53,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC4 = {
				x = 533.42, y = -460.4, z = 24.73, h = 175.27,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC5 = {
				x = 529.3, y = -457.3, z = 29.09, h = 172.93,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
			NPC6 = {
				x = 528.47, y = -462.44, z = 29.07, h = 187.86,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
			NPC7 = {
				x = 545.43, y = -487.16, z = 24.79, h = 30.76,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC8 = {
				x = 547.38, y = -486.22, z = 24.79, h = 15.0,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC9 = {
				x = 539.05, y = -483.36, z = 24.78, h = 144.26,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC10 = {
				x = 541.26, y = -486.03, z = 26.21, h = 120.38,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC11 = {
				x = 520.16, y = -466.28, z = 34.76, h = 223.55,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'weapon_assaultrifle',
			},
			NPC12 = {
				x = 524.0, y = -467.48, z = 32.66, h = 186.77,
				ped = 's_m_y_blackops_03',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SPECIALCARBINE',
			},
		}
	},
}