_Config = {
    --[[
        MAKE SURE EACH REGION HAS THE SAME NUMBER OF COLLECTION POINTS
    ]]
    collectionCoords = {
        north = {
            { x = 436.170, y = 6463.770, z = 28.746 },
            { x = 42.382, y = 6295.466, z = 31.238 },
            { x = -781.703, y = 5401.099, z = 34.248 },
            { x = 1684.836, y = 6436.5, z = 32.307 },
        },
        east  = {
            { x = 558.716, y = 2807.972, z = 42.258 },
            { x = 1717.596, y = 3676.797, z = 34.664 },
            { x = 2738.700, y = 2787.004, z = 35.672 },
            { x = 2672.114, y = 3515.444, z = 52.712 },
        },
        south = {
            { x = -893.063, y = -2740.364, z = 13.828 },
            { x = 160.453, y = -2641.311, z = 5.995 },
            { x = -187.771, y = -1035.950, z = 27.125 },
            { x = -970.056, y = 396.100, z = 75.503 },
        },
        west  = {
            { x = -2168.132, y = 4280.560, z = 48.955 },
            { x = -3245.030, y = 992.879, z = 12.476 },
            { x = -286.580, y = 2522.045, z = 74.619 },
            { x = -1134.229, y = 2696.401, z = 18.800 },
        },
    },
    regionOrder      = {
        "east", "north", "west", "south",
    },
    startLocation    = {
        label              = "Begin collection contract",
        coords             = { x = -355.114, y = -1514.676, z = 27.717 },
        visibilityDistance = 5,
        useDistance        = 2,
    },
    endLocation      = {
        label              = "End collection contract",
        coords             = { x = -351.246, y = -1531.117, z = 27.707 },
        visibilityDistance = 15,
        useDistance        = 10,
    },
    vehicle          = {
        modelName = "ratloader",
        deposit   = 500,
        coords    = {
            { x = -341.876, y = -1555.478, z = 25.228, h = 176.929 },
            { x = -334.962, y = -1564.589, z = 25.231, h = 58.053 },
            { x = -345.125, y = -1571.862, z = 25.228, h = 14.103 },
        },
    },
    reward           = {
        name    = "metalbox",
        amounts = { min = 18, max = 22 },
    },
    keys = exports.libs:Keys(),
}