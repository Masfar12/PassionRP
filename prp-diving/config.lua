PRPBoatshop = PRPBoatshop or {}
PRPDiving = PRPDiving or {}

PRPBoatshop.PoliceBoat = {
    x = -800.67, 
    y = -1494.54, 
    z = 1.59,
}

PRPBoatshop.PoliceBoatSpawn = {
    x = -793.58, 
    y = -1501.4, 
    z = 0.12,
    h = 111.5,
}

PRPBoatshop.PoliceBoat2 = {
    x = -279.41, 
    y = 6635.09, 
    z = 7.51,
}

PRPBoatshop.PoliceBoatSpawn2 = {
    x = -293.10, 
    y = 6642.69, 
    z = 0.15,
    h = 65.5,
}

PRPBoatshop.Docks = {
    ["lsymc"] = {
        label = "LSYMC Docks",
        coords = {
            take = {
                x = -806.33, 
                y = -1496.77, 
                z = 1.6,
            },
            put = {
                x = -814.51, 
                y = -1497.43, 
                z = 0.5,
                h = 197.1,
            }
        }
    },
    ["paletto"] = {
        label = "Paleto Docks",
        coords = {
            take = {
                x = -277.46, 
                y = 6637.2, 
                z = 7.48,
            },
            put = {
                x = -295.81, 
                y = 6639.6, 
                z = 0.4,
                h = 132.34,
            }
        }
    },    
    ["millars"] = {
        label = "Millars Docks",
        coords = {
            take = {
                x = 1299.24, 
                y = 4216.69, 
                z = 33.9, 
            },
            put = {
                x = 1297.82, 
                y = 4209.61, 
                z = 30.12, 
                h = 253.5,
            }
        }
    },
    chumash = {
        label  = "Chumash Docks",
        coords = {
            take = { x = -3427.27, y = 953.25, z = 8.34 },
            put  = { x = -3447.12, y = 963.76, z = 0.39, h = 6.74 },
        },
    },
    paletocove = {
        label = "Paleto Cove",
        coords = {
            take = {x = -1604.77, y = 5256.87, z = 2.07},
            put = {x = -1617.89, y = 5273.41, z = 0.12, h = 112.06},
        },
    },
    sanchianski = {
        label = "San Chianski Docks",
        coords = {
            take = {x = 3866.68, y = 4463.65, z = 2.72},
            put = {x = 3883.49, y = 4483.62, z = -0.36, h = 18.93},
        },
    },

}

PRPBoatshop.Depots = {
    [1] = {
        label = "LSYMC Depot",
        coords = {
            take = {
                x = -772.98, 
                y = -1430.76, 
                z = 1.59, 
            },
            put = {
                x = -729.77, 
                y = -1355.49, 
                z = 1.19, 
                h = 142.5,
            }
        }
    },
}

PRPBoatshop.Locations = {
    ["berths"] = {
        [1] = {
            ["boatModel"] = "seashark",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -727.05,
                    ["y"] = -1326.59,
                    ["z"] = 1.06,
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -723.3,
                    ["y"] = -1323.61,
                    ["z"] = 1.59,
                }
            },
            ["inUse"] = false
        },
        [2] = {
            ["boatModel"] = "dinghy4",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -732.84, 
                    ["y"] = -1333.5, 
                    ["z"] = 1.59, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -729.19, 
                    ["y"] = -1330.58, 
                    ["z"] = 1.67, 
                },
            },
            ["inUse"] = false
        },
        [3] = {
            ["boatModel"] = "squalo",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -737.84, 
                    ["y"] = -1340.83, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -734.98, 
                    ["y"] = -1337.42, 
                    ["z"] = 1.67, 
                },
            },
            ["inUse"] = false
        },
        [4] = {
            ["boatModel"] = "suntrap",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -743.53, 
                    ["y"] = -1347.7, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -740.62, 
                    ["y"] = -1344.28, 
                    ["z"] = 1.67, 
                },
            },
            ["inUse"] = false
        },
        [5] = {
            ["boatModel"] = "tropic",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -749.59, 
                    ["y"] = -1354.88, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -746.6, 
                    ["y"] = -1351.36, 
                    ["z"] = 1.59, 
                },
            },
            ["inUse"] = false
        },
        [6] = {
            ["boatModel"] = "jetmax",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -755.39, 
                    ["y"] = -1361.76, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -752.49,
                    ["y"] = -1358.28,
                    ["z"] = 1.59,
                },
            },
            ["inUse"] = false
        },
        [7] = {
            ["boatModel"] = "speeder",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -769.06, 
                    ["y"] = -1377.97, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -765.84,
                    ["y"] = -1374.7,
                    ["z"] = 1.6,
                }
            },
            ["inUse"] = false
        },
        [8] = {
            ["boatModel"] = "toro",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -774.99, 
                    ["y"] = -1385.0, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -772.29,
                    ["y"] = -1381.59,
                    ["z"] = 1.6,
                }
            },
            ["inUse"] = false
        },
        [9] = {
            ["boatModel"] = "marquis",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -779.61, 
                    ["y"] = -1392.91, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -777.75,
                    ["y"] = -1388.31,
                    ["z"] = 1.6,
                }
            },
            ["inUse"] = false
        },
        [10] = {
            ["boatModel"] = "submersible",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -786.47, 
                    ["y"] = -1398.6, 
                    ["z"] = -0.5, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -783.5,
                    ["y"] = -1395.25,
                    ["z"] = 1.6,
                }
            },
            ["inUse"] = false
        },
        [11] = {
            ["boatModel"] = "tug",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -805.81, 
                    ["y"] = -1421.89, 
                    ["z"] = 0.0, 
                    ["h"] = 229.0
                },
                ["buy"] = {
                    ["x"] = -801.22,
                    ["y"] = -1416.62,
                    ["z"] = 1.6,
                }
            },
            ["inUse"] = false
        },
         --[12] = {
         --    ["boatModel"] = "sr650fly",
         --    ["coords"] = {
         --        ["boat"] = {
         --            ["x"] = -790.62,
         --            ["y"] = -1406.99,
         --            ["z"] = 0.29,
         --            ["h"] = 229.85
         --        },
         --        ["buy"] = {
         --            ["x"] = -789.25,
         --            ["y"] = -1402.51,
         --            ["z"] = 1.6,
         --        }
         --    },
         --    ["inUse"] = false
         --},
    }
}

PRPBoatshop.ShopBoats = {
    ["dinghy4"] = {
        ["model"] = "dinghy4",
        ["label"] = "Nagasaki Dinghy",
        ["price"] = 40000
    },
    ["speeder"] = {
        ["model"] = "speeder",
        ["label"] = "Pegassi Speeder",
        ["price"] = 60000
    },
    ["jetmax"] = {
        ["model"] = "jetmax",
        ["label"] = "Jetmax",
        ["price"] = 50000
    },
    ["squalo"] = {
        ["model"] = "squalo",
        ["label"] = "Squalo",
        ["price"] = 35000
    },
    ["suntrap"] = {
        ["model"] = "suntrap",
        ["label"] = "Suntrap",
        ["price"] = 35000
    },
    ["tropic"] = {
        ["model"] = "tropic",
        ["label"] = "Tropic",
        ["price"] = 35000
    },
    ["seashark"] = {
        ["model"] = "seashark",
        ["label"] = "Seashark",
        ["price"] = 15000
    },
    ["toro"] = {
        ["model"] = "toro",
        ["label"] = "Lampadati Toro",
        ["price"] = 250000
    },
    ["marquis"] = {
        ["model"] = "marquis",
        ["label"] = "Grand Marquis Sailboat",
        ["price"] = 500000
    },
    ["submersible"] = {
        ["model"] = "submersible",
        ["label"] = "Submarine",
        ["price"] = 1000000
    },
    ["tug"] = {
        ["model"] = "tug",
        ["label"] = "Buckingham Tug",
        ["price"] = 500000
    },
    --["sr650fly"] = {
    --    ["model"] = "sr650fly",
    --    ["label"] = "SeaRay 650 Fly",
    --    ["price"] = 1000000
    --},
}

PRPBoatshop.SpawnVehicle = {
    x = -729.77, 
    y = -1355.49, 
    z = 1.19, 
    h = 142.5,
}

PRPDiving.Locations = {
    [1] = {
        label = "Diving 1",
        coords = {
            Area = {
                x = -2838.8, 
                y = -376.1, 
                z = 3.55
            },
            Coral = {
                [1] = {
                    coords = {
                        x = -2849.25, 
                        y = -377.58, 
                        z = -40.23
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = -2838.43, 
                        y = -363.63, 
                        z = -39.45
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = -2887.04, 
                        y = -394.87, 
                        z = -40.91
                    },
                    PickedUp = false
                },
                [4] = {
                    coords = {
                        x = -2808.99, 
                        y = -385.56, 
                        z = -39.32
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 4,
        TotalCoral = 4,
    },
    [2] = {
        label = "Diving 2",
        coords = {
            Area = {
                x = -3288.2, 
                y = -67.58,
                z = 2.79,
            },
            Coral = {
                [1] = {
                    coords = {
                        x = -3275.03, 
                        y = -38.58, 
                        z = -19.21,
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = -3273.73, 
                        y = -76.0, 
                        z = -26.81,
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = -3346.53, 
                        y = -50.4, 
                        z = -35.84
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 3,
        TotalCoral = 3,
    },
    [3] = {
        label = "Diving 3",
        coords = {
            Area = {
                x = -3367.24, 
                y = 1617.89, 
                z = 1.39,
            },
            Coral = {
                [1] = {
                    coords = {
                        x = -3388.01, 
                        y = 1635.88, 
                        z = -39.41,
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = -3354.19, 
                        y = 1549.3, 
                        z = -38.21,
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = -3326.04, 
                        y = 1636.43, 
                        z = -40.98
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 3,
        TotalCoral = 3,
    },
    [4] = {
        label = "Diving 4",
        coords = {
            Area = {
                x = 3002.5, 
                y = -1538.28, 
                z = -27.36, 
            },
            Coral = {
                [1] = {
                    coords = {
                        x = 2978.05, 
                        y = -1509.07, 
                        z = -24.96, 
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = 3004.42, 
                        y = -1576.95, 
                        z = -29.36, 
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = 2951.65, 
                        y = -1560.69, 
                        z = -28.36, 
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 3,
        TotalCoral = 3,
    },
    [5] = {
        label = "Diving 5",
        coords = {
            Area = {
                x = 3421.58, 
                y = 1975.68, 
                z = 0.86, 
            },
            Coral = {
                [1] = {
                    coords = {
                        x = 3421.69, 
                        y = 1976.54, 
                        z = -50.64, 
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = 3424.07, 
                        y = 1957.46, 
                        z = -53.04, 
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = 3434.65, 
                        y = 1993.73, 
                        z = -49.84, 
                    },
                    PickedUp = false
                },
                [4] = {
                    coords = {
                        x = 3415.42, 
                        y = 1965.25, 
                        z = -52.04,
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 4,
        TotalCoral = 4,
    },
    [6] = {
        label = "Diving 6",
        coords = {
            Area = {
                x = 2720.14, 
                y = -2136.28, 
                z = 0.74, 
            },
            Coral = {
                [1] = {
                    coords = {
                        x = 2724.0, 
                        y = -2134.95, 
                        z = -19.33, 
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = 2710.68, 
                        y = -2156.06, 
                        z = -18.63, 
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = 2702.84, 
                        y = -2139.29, 
                        z = -18.51, 
                    },
                    PickedUp = false
                },
                [4] = {
                    coords = {
                        x = 2736.27, 
                        y = -2153.91, 
                        z = -20.88, 
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 4,
        TotalCoral = 4,
    },
    [7] = {
        label = "Diving 7",
        coords = {
            Area = {
                x = 536.69, 
                y = 7253.75, 
                z = 1.69, 
            },
            Coral = {
                [1] = {
                    coords = {
                        x = 542.31, 
                        y = 7245.37, 
                        z = -30.01, 
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = 528.21, 
                        y = 7223.26, 
                        z = -29.51, 
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = 510.36, 
                        y = 7254.97, 
                        z = -32.11, 
                    },
                    PickedUp = false
                },
                [4] = {
                    coords = {
                        x = 525.37, 
                        y = 7259.12, 
                        z = -30.51, 
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 4,
        TotalCoral = 4,
    },
}

PRPDiving.CoralTypes = {
    [1] = {
        item = "dendrogyra_coral",
        maxAmount = math.random(2, 7),
        price = math.random(350, 450),
    },
    [2] = {
        item = "antipatharia_coral",
        maxAmount = math.random(2, 7),
        price = math.random(250, 350),
    }
}

PRPDiving.SellLocations = {
    [1] = {
        ["coords"] = {
            ["x"] = -1686.9, 
            ["y"] = -1072.23, 
            ["z"] = 13.15
        }
    }
}