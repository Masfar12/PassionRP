Config                 = {}

Config.Hangars         = {
    LSIA  = {
        mainCoords    = vector3(-1274.99, -3387.44, 13.94), heading = 329.10,
        helipadCoords = vector3(-1112.08, -2884.06, 13.94),
        stash         = vector3(-1299.47, -3407.30, 13.94),
    },
    sandy = {
        mainCoords    = vector3(1732.03, 3308.81, 41.22), heading = 138.53,
        helipadCoords = vector3(1770.27, 3239.78, 42.12), planeSpawnPos = vector3(1589.14, 3187.11, 40.53),
        stash         = vector3(1721.26, 3320.08, 41.22),
    },
}

Config.ContainerCoords = vector3(1186.18, -2997.47, 5.90)

Config.MarkerColor     = { r = 0, g = 128, b = 255 }                                       --3d marker colors

Config.Aircrafts       = {
    Helicopters = {
        { model = 'Cargobob2' },
        { model = 'Havok' },
        { model = 'Frogger' },
        { model = 'microlight' },
        { model = 'buzzard2' }, --not the attack chopper
        { model = 'seasparrow' },
        { model = 'supervolito2' }

    },

    Planes      = {
        { model = 'cuban800' },
        { model = 'Velum2' },
        { model = 'Mammatus' },
        { model = 'Dodo' },
        { model = 'Stunt' },
        { model = 'vestra' },
        { model = 'Luxor' },
    },
}

Config.Items           = {
    label = "Edmund’s Air Transport/Rental Services",
    slots = 30,
    items = {
        [1] = {
            name   = "parachute",
            price  = 250,
            amount = 50000,
            info   = {},
            type   = "item",
            slot   = 1,
        },
        [2] = {
            name   = "aviation_fuel",
            price  = 500,
            amount = 50000,
            info   = {},
            type   = "item",
            slot   = 2,
        },
    }
}

Config.Stashes         = {
    label     = "Edmund's Air Storage Container",
    slots     = 30,
    maxweight = 1500000
}