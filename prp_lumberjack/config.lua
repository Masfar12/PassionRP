Config = {
    VehicleFee           = 500,

    MarkerColor          = { r = 204, g = 102, b = 0 },
    Depot                = vector3(1200.38, -1275.76, 34.22),
    ChanceToGetWood      = 50,
    MinPalletPrice       = 600,

    Trucks               = {
        { model = "Bodhi2", reputation = 0 },
        { model = "BobcatXL", reputation = 15 },
        { model = "Bison", reputation = 25 },
    },

    VehicleSpawner       = {
        menu      = vector3(1212.99, -1279.79, 35.22),
        spawnPos  = { x = 1217.25, y = -1228.80, z = 35.43, h = 270.00 },
        returnVeh = vector3(1202.27, -1229.99, 35.22),
    },

    WoodProcessor        = vector3(-552.95, 5326.59, 72.59),
    WoodPacker           = vector3(-502.99, 5276.05, 79.61),
    BuyerLocation        = vector3(1176.42, -3169.73, 4.72),

    ChoppingBlipLocation = vector3(-1537.01, 4687.52, 42.03),

    ChoppingPositions    = {
        { coords = vector3(-1536.29, 4678.96, 41.17), heading = 47.41 },
        { coords = vector3(-1541.54, 4674.72, 41.29), heading = 337.98 },
        { coords = vector3(-1530.07, 4678.60, 40.21), heading = 286.20 },
        { coords = vector3(-1535.22, 4667.73, 37.05), heading = 341.29 },
        { coords = vector3(-1523.31, 4665.95, 35.41), heading = 74.86 },
        { coords = vector3(-1526.87, 4661.71, 33.85), heading = 335.22 },
        { coords = vector3(-1553.08, 4686.62, 46.79), heading = 103.47 },
        { coords = vector3(-1561.32, 4684.78, 47.45), heading = 343.80 },
        { coords = vector3(-1560.48, 4692.35, 49.50), heading = 240.91 },
    },

    RequiredJobName      = "lumberjack",
}
