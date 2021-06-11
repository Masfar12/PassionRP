Config = {}

Config.Jobs = {
    ["electrician"] = "electrician",
}

-- Location where get mission from NPC
Config.MissionNPC = {
	{  
		Pos = {x = 1653.9434814453, y = 2546.0424804688, z = 45.564907073975},
		Heading = 61.960876464844,
        Ped = 's_m_y_prismuscl_01',
        Item = 'asscig',
        Label = "Prison Cigarette",
        Cost = 2,
    },
    {  
		Pos = {x = 1651.3277587891, y = 2545.7395019531, z = 45.564891815186},
		Heading = 276.29348754883,
        Ped = 's_m_y_prismuscl_01',
        Item = 'lockpick',
        Label = "Prison Lockpick",
        Cost = 20,
    },
    { 
		Pos = {x = 1648.5074462891, y = 2539.4660644531, z = 45.564849853516},
		Heading = 51.152545928955,
        Ped = 'u_m_y_prisoner_01',
        Item = 'phone',
        Label = "Phone",
        Cost = 40,
    },
    {
		Pos = {x = 1643.0258789063, y = 2528.0900878906, z = 45.564910888672},
		Heading = 233.13006591797,
        Ped = 's_m_y_prisoner_01',
        Item = 'radio',
        Label = "Radio",
        Cost = 60,
    },
    {
		Pos = {x = 1619.4243164063, y = 2519.9487304688, z = 45.8564453125},
		Heading = 326.89852905273,
        Ped = 's_m_m_prisguard_01',
        Item = 'weapon_switchblade',
        Label = "Shank",
        Cost = 80,
    },
    {
		Pos = {x = 1566.8471679688, y = 2539.7114257813, z = 55.192916870117},
		Heading = 88.263557434082,
        Ped = 'mp_m_securoguard_01',
        Item = 'weapon_molotov',
        Label = "Molotov",
        Cost = 100,
    },
    {
		Pos = {x = 1773.4549560547, y = 2578.9836425781, z = 45.119463348389},
		Heading = 261.960876464844,
        Ped = 'csb_rashcosvki',
        Item = 'taco',
        Label = "Prison Taco",
        Cost = 1,
    },
    {
		Pos = {x = 1787.5512695313, y = 2582.3908691406, z = 49.712825775146},
		Heading = 261.960876464844,
        Ped = 'ig_rashcosvki',
        Item = 'moonshine',
        Label = "Prison Moonshine",
        Cost = 1,
    },
    {
		Pos = {x = 1767.0118408203, y = 2589.1823730469, z = 45.860023498535},
		Heading = 81.823318481445,
        Ped = 'u_m_y_babyd',
        Item = 'screwdriverset',
        Label = "rusted screwdriver set",
        Cost = 1,
    },
}

Config.Locations = {
    meth = {
        ["cells"] = {
            [1] = {
                coords = {x = 1786.52, y = 2568.38, z = 45.71, h = 182.18},
            },
            [2] = {
                coords = {x = 1765.29, y = 2570.22, z = 45.73, h = 346.48},
            },
            [3] = {
                coords = {x = 1765.22, y = 2578.46, z = 45.72, h = 352.54},
            },
            [4] = {
                coords = {x = 1769.48, y = 2593.88, z = 45.72, h = 352.73},
            },
            [5] = {
                coords = {x = 1786.62, y = 2568.37, z = 49.71, h = 262.31},
            },
            [6] = {
                coords = {x = 1774.93, y = 2591.9, z = 45.72, h = 89.83},
            },
        }
    },
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = {x = 1761.46, y = 2540.41, z = 45.56, h = 272.249},
            },
            [2] = {
                coords = {x = 1718.54, y = 2527.802, z = 45.56, h = 272.249},
            },
            [3] = {
                coords = {x = 1700.199, y = 2474.811, z = 45.56, h = 272.249},
            },
            [4] = {
                coords = {x = 1664.827, y = 2501.58, z = 45.56, h = 272.249},
            },
            [5] = {
                coords = {x = 1621.622, y = 2509.302, z = 45.56, h = 272.249},
            },
            [6] = {
                coords = {x = 1627.936, y = 2538.393, z = 45.56, h = 272.249},
            },
            [7] = {
                coords = {x = 1625.1, y = 2575.988, z = 45.56, h = 272.249},
            },
        },
    },
    ["freedom"] = {
        coords = {x = 1781.73, y = 2567.38, z = 45.71, h = 174.82},
    },
    ["outside"] = {
        coords = {x = 1843.06, y = 2590.65, z = 45.89, h = 184.5},
    },
    ["yard"] = {
        coords = {x = 1773.85, y = 2677.7, z = 45.61, h = 179.685},
    },
    ["middle"] = {
        coords = {x = 1693.33, y = 2569.51, z = 45.55, h = 123.5},
    },
    spawns = {
        [1] = {
            animation = "bumsleep",
            coords = {x = 1661.046, y = 2524.681, z = 45.564, h = 260.545},
        },
        [2] = {
            animation = "lean",
            coords = {x = 1782.32, y = 2583.73, z = 45.7, h = 84.77},
        },
        [3] = {
            animation = "lean",
            coords = {x = 1773.3, y = 2567.01, z = 45.72, h = 1.7},
        },
        [4] = {
            animation = "lean",
            coords = {x = 1697.106, y = 2525.558, z = 45.564, h = 187.208},
        },
        [5] = {
            animation = "chair4",
            coords = {x = 1673.084, y = 2519.823, z = 45.564, h = 229.542},
        },
        [6] = {
            animation = "chair",
            coords = {x = 1666.029, y = 2511.367, z = 45.564, h = 233.888},
        },
        [7] = {
            animation = "chair4",
            coords = {x = 1691.229, y = 2509.635, z = 45.564, h = 52.432},
        },
        [8] = {
            animation = "finger2",
            coords = {x = 1770.59, y = 2536.064, z = 45.564, h = 258.113},
        },
    }
}