local keys = exports.libs:Keys()

-- UID must be free from special characters it appears. This includes hyphens.
PRPStashes = {
    keys    = keys,
    stashes = {
        {
            uid          = "pdmcoffee",
            label        = "PDM Coffee Stash",
            kg           = 1000,
            slots        = 10,
            seeDist      = 2.0,
            useDist      = 1.0,
            coords       = vector3(-28.89021, -1103.410767, 26.422353),
            useKey       = 'E',
            restrictions = {
                jobs = {
                    {
                        name     = "cardealer",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid          = "thehouseone",
            label        = "The House Stash",
            kg           = 10000,
            slots        = 200,
            seeDist      = 2.0,
            useDist      = 1.0,
            coords       = vector3(-1519.22291, 122.64009, 50.05247),
            useKey       = 'E',
            restrictions = {
                jobs = {
                    {
                        name     = "house",
                        minGrade = 0,
                    }
                }
            }
        },
        {
            uid          = "thehousetwo",
            label        = "The House Stash",
            kg           = 10000,
            slots        = 200,
            seeDist      = 2.0,
            useDist      = 1.0,
            coords       = vector3(-1522.43824, 117.43277, 50.05225),
            useKey       = 'E',
            restrictions = {
                jobs = {
                    {
                        name     = "house",
                        minGrade = 0,
                    }
                }
            }
        },
        {
            uid          = "drift",
            label        = "Drift School",
            kg           = 10000,
            slots        = 200,
            seeDist      = 2.0,
            useDist      = 1.0,
            coords       = vector3(51.538623809814, -2582.400390625, 6.2639355659485),
            useKey       = 'E',
            restrictions = {
                jobs = {
                    {
                        name     = "drift",
                        minGrade = 2,
                    }
                }
            }
        },
        {
            uid          = "bennystrash",
            label        = "Benny's Trash",
            kg           = 10000,
            slots        = 200,
            seeDist      = 2.0,
            useDist      = 1.0,
            coords       = vector3(-228.26528930664, -1333.998046875, 30.890588760376),
            useKey       = 'E',
            restrictions = {
                jobs = {
                    {
                        name     = "bennys",
                        minGrade = 0,
                    }
                }
            },
        },
        {
            uid          = "pearls",
            label        = "Pearls Stash",
            kg           = 10000,
            slots        = 200,
            seeDist      = 2.0,
            useDist      = 1.0,
            coords       = vector3(-1842.013, -1190.515, 14.309),
            useKey       = 'E',
            restrictions = {
                jobs = {
                    {
                        name     = "pearls",
                        minGrade = 1,
                    }
                }
            }
        },
        {
            uid          = "irishpub",
            label        = "Irish Pub",
            kg           = 10000,
            slots        = 200,
            seeDist      = 2.0,
            useDist      = 1.0,
            coords       = vector3(830.50762939453, -119.72854614258, 80.42849731445),
            useKey       = 'E',
            restrictions = {
                jobs = {
                    {
                        name     = "north",
                        minGrade = 2,
                    }
                }
            }
        },
        {
            uid = "realestate",
            label = "Real Estate Stash",
            kg = 10000,
            slots = 200,
            seeDist = 2.0,
            useDist = 1.0,
            coords = vector3(-1555.43, -572.411, 108.527),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "realestateagent",
                        minGrade = 2,
                    },
                },
            },
        },
        {
            uid = "blackrose",
            label = "BlackRose Inc. Stash",
            kg = 10000,
            slots = 200,
            seeDist = 2.0,
            useDist = 1.0,
            coords = vector3(-124.443, -639.568, 168.82),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "blackrose",
                        minGrade = 3,
                    },
                },
            },
        },
        {
            uid = "bloodsbeans",
            label = "Bloods Beans Stash",
            kg = 10000,
            slots = 200,
            seeDist = 2.0,
            useDist = 1.0,
            coords = vector3(-634.487, 225.862, 81.88),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "bloodsbeans",
                        minGrade = 2,
                    },
                },
            },
        },
        {
            uid = "casinodrinks",
            label = "Casino Drinks",
            kg = 10000,
            slots = 200,
            seeDist = 2.0,
            useDist = 1.0,
            coords = vector3(1110.6971435547, 207.57258605957, -49.440074920654),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "casino",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "bahamas",
            label = "Bahamas Stash",
            kg = 10000,
            slots = 200,
            seeDist = 2.0,
            useDist = 1.0,
            coords = vector3(-1911.0673828125, -569.83251953125, 19.097215652466),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "bahamas",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "arcade",
            label = "Arcade Stash",
            kg = 10000,
            slots = 200,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(2719.427734375, -358.51770019531, -53.586727142334),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "arcade",
                        minGrade = 4,
                    },
                    {
                        name     = "house",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid          = "arcadedrinks",
            label        = "Arcade Drinks",
            kg           = 10000,
            slots        = 200,
            seeDist      = 3.0,
            useDist      = 1.0,
            coords       = vector3(2726.39, -389.446, -48.994),
            useKey       = 'E',
            restrictions = {
                jobs = {
                    {
                        name     = "arcade",
                        minGrade = 2,
                    },
                    {
                        name     = "house",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "cardealer1",
            label = "Cardealer Stash",
            kg = 10000,
            slots = 200,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(-780.50439453125, -231.18673706055, 37.147666931152),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "cardealer",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "ammunation",
            label = "Ammunation",
            kg = 10000,
            slots = 200,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(1157.7836914062, -3191.3205566406, -39.007972717285),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "ammunation",
                        minGrade = 3,
                    },
                },
            },
        },
        {
            uid = "vanilla",
            label = "Vanilla stash",
            kg = 20000,
            slots = 200,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(129.33024597168, -1283.9788818359, 29.269334793091),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "vanilla",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "emstrash",
            label = "EMS Trash",
            kg = 20000,
            slots = 200,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(304.26376342773, -600.89526367188, 43.284049987793),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "doctor",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "pizza",
            label = "Pizza",
            kg = 10000,
            slots = 100,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(292.09606933594, -985.00775146484, 29.432357788086),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "pizza",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "northdrinks",
            label = "Drinks Fridge",
            kg = 10000,
            slots = 100,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(836.05322265625, -115.96181488037, 79.774711608887),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "north",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "tacoshop",
            label = "Warehouse Storage",
            kg = 10000,
            slots = 100,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(425.79846191406, -1911.0930175781, 25.471235275269),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "taco",
                        minGrade = 0,
                    },
                },
            },
        },
        {
            uid = "theranch",
            label = "The Ranch",
            kg = 10000,
            slots = 100,
            seeDist = 1.0,
            useDist = 1.0,
            coords = vector3(1405.6317138672, 1139.0727539063, 109.74559783936),
            useKey = 'E',
            restrictions = {
                jobs = {
                    {
                        name = "theranch",
                        minGrade = 1,
                    },
                },
            },
        },
    },

}