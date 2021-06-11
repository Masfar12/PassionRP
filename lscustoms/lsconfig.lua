--[[
Los Santos Customs V1.1 
Credits - MythicalBro
/////License/////
Do not reupload/re release any part of this script without my permission
]]
local colors              = {
    { name = "Black", colorindex = 0 }, { name = "Carbon Black", colorindex = 147 },
    { name = "Hraphite", colorindex = 1 }, { name = "Anhracite Black", colorindex = 11 },
    { name = "Black Steel", colorindex = 2 }, { name = "Dark Steel", colorindex = 3 },
    { name = "Silver", colorindex = 4 }, { name = "Bluish Silver", colorindex = 5 },
    { name = "Rolled Steel", colorindex = 6 }, { name = "Shadow Silver", colorindex = 7 },
    { name = "Stone Silver", colorindex = 8 }, { name = "Midnight Silver", colorindex = 9 },
    { name = "Cast Iron Silver", colorindex = 10 }, { name = "Red", colorindex = 27 },
    { name = "Torino Red", colorindex = 28 }, { name = "Formula Red", colorindex = 29 },
    { name = "Lava Red", colorindex = 150 }, { name = "Blaze Red", colorindex = 30 },
    { name = "Grace Red", colorindex = 31 }, { name = "Garnet Red", colorindex = 32 },
    { name = "Sunset Red", colorindex = 33 }, { name = "Cabernet Red", colorindex = 34 },
    { name = "Wine Red", colorindex = 143 }, { name = "Candy Red", colorindex = 35 },
    { name = "Hot Pink", colorindex = 135 }, { name = "Pfsiter Pink", colorindex = 137 },
    { name = "Salmon Pink", colorindex = 136 }, { name = "Sunrise Orange", colorindex = 36 },
    { name = "Orange", colorindex = 38 }, { name = "Bright Orange", colorindex = 138 },
    { name = "Gold", colorindex = 99 }, { name = "Bronze", colorindex = 90 },
    { name = "Yellow", colorindex = 88 }, { name = "Race Yellow", colorindex = 89 },
    { name = "Dew Yellow", colorindex = 91 }, { name = "Dark Green", colorindex = 49 },
    { name = "Racing Green", colorindex = 50 }, { name = "Sea Green", colorindex = 51 },
    { name = "Olive Green", colorindex = 52 }, { name = "Bright Green", colorindex = 53 },
    { name = "Gasoline Green", colorindex = 54 }, { name = "Lime Green", colorindex = 92 },
    { name = "Midnight Blue", colorindex = 141 },
    { name = "Galaxy Blue", colorindex = 61 }, { name = "Dark Blue", colorindex = 62 },
    { name = "Saxon Blue", colorindex = 63 }, { name = "Blue", colorindex = 64 },
    { name = "Mariner Blue", colorindex = 65 }, { name = "Harbor Blue", colorindex = 66 },
    { name = "Diamond Blue", colorindex = 67 }, { name = "Surf Blue", colorindex = 68 },
    { name = "Nautical Blue", colorindex = 69 }, { name = "Racing Blue", colorindex = 73 },
    { name = "Ultra Blue", colorindex = 70 }, { name = "Light Blue", colorindex = 74 },
    { name = "Chocolate Brown", colorindex = 96 }, { name = "Bison Brown", colorindex = 101 },
    { name = "Creeen Brown", colorindex = 95 }, { name = "Feltzer Brown", colorindex = 94 },
    { name = "Maple Brown", colorindex = 97 }, { name = "Beechwood Brown", colorindex = 103 },
    { name = "Sienna Brown", colorindex = 104 }, { name = "Saddle Brown", colorindex = 98 },
    { name = "Moss Brown", colorindex = 100 }, { name = "Woodbeech Brown", colorindex = 102 },
    { name = "Straw Brown", colorindex = 99 }, { name = "Sandy Brown", colorindex = 105 },
    { name = "Bleached Brown", colorindex = 106 }, { name = "Schafter Purple", colorindex = 71 },
    { name = "Spinnaker Purple", colorindex = 72 }, { name = "Midnight Purple", colorindex = 142 },
    { name = "Bright Purple", colorindex = 145 }, { name = "Cream", colorindex = 107 },
    { name = "Ice White", colorindex = 111 }, { name = "Frost White", colorindex = 112 } }
local metalcolors         = {
    { name = "Brushed Steel", colorindex = 117 },
    { name = "Brushed Black Steel", colorindex = 118 },
    { name = "Brushed Aluminum", colorindex = 119 },
    { name = "Pure Gold", colorindex = 158 },
    { name = "Brushed Gold", colorindex = 159 }
}
local mattecolors         = {
    { name = "Black", colorindex = 12 },
    { name = "Gray", colorindex = 13 },
    { name = "Light Gray", colorindex = 14 },
    { name = "Ice White", colorindex = 131 },
    { name = "Blue", colorindex = 83 },
    { name = "Dark Blue", colorindex = 82 },
    { name = "Midnight Blue", colorindex = 84 },
    { name = "Midnight Purple", colorindex = 149 },
    { name = "Schafter Purple", colorindex = 148 },
    { name = "Red", colorindex = 39 },
    { name = "Dark Red", colorindex = 40 },
    { name = "Orange", colorindex = 41 },
    { name = "Yellow", colorindex = 42 },
    { name = "Lime Green", colorindex = 55 },
    { name = "Green", colorindex = 128 },
    { name = "Frost Green", colorindex = 151 },
    { name = "Foliage Green", colorindex = 155 },
    { name = "Olive Darb", colorindex = 152 },
    { name = "Dark Earth", colorindex = 153 },
    { name = "Desert Tan", colorindex = 154 }
}

LSC_Config                = {}

LSC_Config.NoRoofAllowed  = {
    "revolter",
}

--------Prices---------
LSC_Config.prices         = {

    ------Window tint------
    windowtint       = {
        { name = "Pure Black", tint = 1, price = 500, DefaultPrice = 500 },
        { name = "Darksmoke", tint = 2, price = 500, DefaultPrice = 500 },
        { name = "Lightsmoke", tint = 3, price = 500, DefaultPrice = 500 },
        { name = "Limo", tint = 4, price = 500, DefaultPrice = 500 },
        { name = "Green", tint = 5, price = 500, DefaultPrice = 500 },
    },

    -------Respray--------
    ----Primary color---
    --Chrome
    chrome           = {
        colors = {
            { name = "Chrome", colorindex = 120 }
        },
        price  = 500, DefaultPrice = 500
    },
    --Classic
    classic          = {
        colors = colors,
        price  = 200, DefaultPrice = 200
    },
    --Matte
    matte            = {
        colors = mattecolors,
        price  = 300, DefaultPrice = 300
    },
    --Metallic
    metallic         = {
        colors = colors,
        price  = 250, DefaultPrice = 250
    },
    --Metals
    metal            = {
        colors = metalcolors,
        price  = 250, DefaultPrice = 250
    },

    ----Secondary color---
    --Chrome
    chrome2          = {
        colors = {
            { name = "Chrome", colorindex = 120 }
        },
        price  = 500, DefaultPrice = 500
    },
    --Classic
    classic2         = {
        colors = colors,
        price  = 200, DefaultPrice = 200
    },
    --Matte
    matte2           = {
        colors = mattecolors,
        price  = 300, DefaultPrice = 300
    },
    --Metallic
    metallic2        = {
        colors = colors,
        price  = 250, DefaultPrice = 250
    },
    --Metals
    metal2           = {
        colors = metalcolors,
        price  = 250, DefaultPrice = 250
    },

    ------Neon layout------
    neonlayout       = {
        { name = "Front,Back and Sides", price = 5000, DefaultPrice = 5000 },
    },
    --Neon color
    neoncolor        = {
        { name = "White", neon = { 255, 255, 255 }, price = 1000, DefaultPrice = 1000 },
        { name = "Blue", neon = { 0, 0, 255 }, price = 1000, DefaultPrice = 1000 },
        { name = "Electric Blue", neon = { 0, 150, 255 }, price = 1000, DefaultPrice = 1000 },
        { name = "Mint Green", neon = { 50, 255, 155 }, price = 1000, DefaultPrice = 1000 },
        { name = "Lime Green", neon = { 0, 255, 0 }, price = 1000, DefaultPrice = 1000 },
        { name = "Yellow", neon = { 255, 255, 0 }, price = 1000, DefaultPrice = 1000 },
        { name = "Golden Shower", neon = { 204, 204, 0 }, price = 1000, DefaultPrice = 1000 },
        { name = "Orange", neon = { 255, 128, 0 }, price = 1000, DefaultPrice = 1000 },
        { name = "Red", neon = { 255, 0, 0 }, price = 1000, DefaultPrice = 1000 },
        { name = "Pony Pink", neon = { 255, 102, 255 }, price = 1000, DefaultPrice = 1000 },
        { name = "Hot Pink", neon = { 255, 0, 255 }, price = 1000, DefaultPrice = 1000 },
        { name = "Purple", neon = { 153, 0, 153 }, price = 1000, DefaultPrice = 1000 },
        { name = "Brown", neon = { 139, 69, 19 }, price = 1000, DefaultPrice = 1000 },
    },

    --------Plates---------
    plates           = {
        { name = "Blue on White 1", plateindex = 0, price = 200, DefaultPrice = 200 },
        { name = "Blue On White 2", plateindex = 3, price = 200, DefaultPrice = 200 },
        { name = "Blue On White 3", plateindex = 4, price = 200, DefaultPrice = 200 },
        { name = "Yellow on Blue", plateindex = 2, price = 300, DefaultPrice = 300 },
        { name = "Yellow on Black", plateindex = 1, price = 400, DefaultPrice = 400 },
    },

    --------Wheels--------
    ----Wheel accessories----
    wheelaccessories = {
        -- { name = "Stock Tires", price = 1000, DefaultPrice = 1000},
        -- { name = "Custom Tires", price = 1250, DefaultPrice = 1250},
        --{ name = "Bulletproof Tires", price = 5000, DefaultPrice = 5000},
        { name = "White Tire Smoke", smokecolor = { 254, 254, 254 }, price = 1500, DefaultPrice = 1500 },
        { name = "Black Tire Smoke", smokecolor = { 1, 1, 1 }, price = 1500, DefaultPrice = 1500 },
        { name = "Blue Tire Smoke", smokecolor = { 0, 150, 255 }, price = 1500, DefaultPrice = 1500 },
        { name = "Yellow Tire Smoke", smokecolor = { 255, 255, 50 }, price = 1500, DefaultPrice = 1500 },
        { name = "Orange Tire Smoke", smokecolor = { 255, 153, 51 }, price = 1500, DefaultPrice = 1500 },
        { name = "Red Tire Smoke", smokecolor = { 255, 10, 10 }, price = 1500, DefaultPrice = 1500 },
        { name = "Green Tire Smoke", smokecolor = { 10, 255, 10 }, price = 1500, DefaultPrice = 1500 },
        { name = "Purple Tire Smoke", smokecolor = { 153, 10, 153 }, price = 1500, DefaultPrice = 1500 },
        { name = "Pink Tire Smoke", smokecolor = { 255, 102, 178 }, price = 1500, DefaultPrice = 1500 },
        { name = "Gray Tire Smoke", smokecolor = { 128, 128, 128 }, price = 1500, DefaultPrice = 1500 },
    },

    ----Wheel color----
    wheelcolor       = {
        colors = colors,
        price  = 500, DefaultPrice = 500,
    },

    ----Front wheel (Bikes)----
    frontwheel       = {
        { name = "Stock", wtype = 6, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Speedway", wtype = 6, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Streetspecial", wtype = 6, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Racer", wtype = 6, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Trackstar", wtype = 6, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Overlord", wtype = 6, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Trident", wtype = 6, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Triplethreat", wtype = 6, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Stilleto", wtype = 6, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Wires", wtype = 6, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Bobber", wtype = 6, mod = 9, price = 500, DefaultPrice = 500 },
        { name = "Solidus", wtype = 6, mod = 10, price = 500, DefaultPrice = 500 },
        { name = "Iceshield", wtype = 6, mod = 11, price = 500, DefaultPrice = 500 },
        { name = "Loops", wtype = 6, mod = 12, price = 500, DefaultPrice = 500 },
    },

    ----Back wheel (Bikes)-----
    backwheel        = {
        { name = "Stock", wtype = 6, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Speedway", wtype = 6, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Streetspecial", wtype = 6, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Racer", wtype = 6, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Trackstar", wtype = 6, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Overlord", wtype = 6, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Trident", wtype = 6, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Triplethreat", wtype = 6, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Stilleto", wtype = 6, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Wires", wtype = 6, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Bobber", wtype = 6, mod = 9, price = 500, DefaultPrice = 500 },
        { name = "Solidus", wtype = 6, mod = 10, price = 500, DefaultPrice = 500 },
        { name = "Iceshield", wtype = 6, mod = 11, price = 500, DefaultPrice = 500 },
        { name = "Loops", wtype = 6, mod = 12, price = 500, DefaultPrice = 500 },
    },

    ----Sport wheels-----
    sportwheels      = {
        { name = "Stock", wtype = 0, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Inferno", wtype = 0, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Deepfive", wtype = 0, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Lozspeed", wtype = 0, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Diamondcut", wtype = 0, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Chrono", wtype = 0, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Feroccirr", wtype = 0, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Fiftynine", wtype = 0, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Mercie", wtype = 0, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Syntheticz", wtype = 0, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Organictyped", wtype = 0, mod = 9, price = 500, DefaultPrice = 500 },
        { name = "Endov1", wtype = 0, mod = 10, price = 500, DefaultPrice = 500 },
        { name = "Duper7", wtype = 0, mod = 11, price = 500, DefaultPrice = 500 },
        { name = "Uzer", wtype = 0, mod = 12, price = 500, DefaultPrice = 500 },
        { name = "Groundride", wtype = 0, mod = 13, price = 500, DefaultPrice = 500 },
        { name = "Spacer", wtype = 0, mod = 14, price = 500, DefaultPrice = 500 },
        { name = "Venum", wtype = 0, mod = 15, price = 500, DefaultPrice = 500 },
        { name = "Cosmo", wtype = 0, mod = 16, price = 500, DefaultPrice = 500 },
        { name = "Dashvip", wtype = 0, mod = 17, price = 500, DefaultPrice = 500 },
        { name = "Icekid", wtype = 0, mod = 18, price = 500, DefaultPrice = 500 },
        { name = "Ruffeld", wtype = 0, mod = 19, price = 500, DefaultPrice = 500 },
        { name = "Wangenmaster", wtype = 0, mod = 20, price = 500, DefaultPrice = 500 },
        { name = "Superfive", wtype = 0, mod = 21, price = 500, DefaultPrice = 500 },
        { name = "Endov2", wtype = 0, mod = 22, price = 500, DefaultPrice = 500 },
        { name = "Slitsix", wtype = 0, mod = 23, price = 500, DefaultPrice = 500 },
    },
    -----Suv wheels------
    suvwheels        = {
        { name = "Stock", wtype = 3, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Vip", wtype = 3, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Benefactor", wtype = 3, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Cosmo", wtype = 3, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Bippu", wtype = 3, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Royalsix", wtype = 3, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Fagorme", wtype = 3, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Deluxe", wtype = 3, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Icedout", wtype = 3, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Cognscenti", wtype = 3, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Lozspeedten", wtype = 3, mod = 9, price = 500, DefaultPrice = 500 },
        { name = "Supernova", wtype = 3, mod = 10, price = 500, DefaultPrice = 500 },
        { name = "Obeyrs", wtype = 3, mod = 11, price = 500, DefaultPrice = 500 },
        { name = "Lozspeedballer", wtype = 3, mod = 12, price = 500, DefaultPrice = 500 },
        { name = "Extra vaganzo", wtype = 3, mod = 13, price = 500, DefaultPrice = 500 },
        { name = "Splitsix", wtype = 3, mod = 14, price = 500, DefaultPrice = 500 },
        { name = "Empowered", wtype = 3, mod = 15, price = 500, DefaultPrice = 500 },
        { name = "Sunrise", wtype = 3, mod = 16, price = 500, DefaultPrice = 500 },
        { name = "Dashvip", wtype = 3, mod = 17, price = 500, DefaultPrice = 500 },
        { name = "Cutter", wtype = 3, mod = 18, price = 500, DefaultPrice = 500 },
    },
    -----Offroad wheels-----
    offroadwheels    = {
        { name = "Stock", wtype = 4, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Raider", wtype = 4, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Mudslinger", wtype = 4, modtype = 23, wtype = 4, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Nevis", wtype = 4, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Cairngorm", wtype = 4, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Amazon", wtype = 4, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Challenger", wtype = 4, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Dunebasher", wtype = 4, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Fivestar", wtype = 4, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Rockcrawler", wtype = 4, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Milspecsteelie", wtype = 4, mod = 9, price = 500, DefaultPrice = 500 },
    },
    -----Tuner wheels------
    tunerwheels      = {
        { name = "Stock", wtype = 5, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Cosmo", wtype = 5, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Supermesh", wtype = 5, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Outsider", wtype = 5, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Rollas", wtype = 5, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Driffmeister", wtype = 5, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Slicer", wtype = 5, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Elquatro", wtype = 5, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Dubbed", wtype = 5, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Fivestar", wtype = 5, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Slideways", wtype = 5, mod = 9, price = 500, DefaultPrice = 500 },
        { name = "Apex", wtype = 5, mod = 10, price = 500, DefaultPrice = 500 },
        { name = "Stancedeg", wtype = 5, mod = 11, price = 500, DefaultPrice = 500 },
        { name = "Countersteer", wtype = 5, mod = 12, price = 500, DefaultPrice = 500 },
        { name = "Endov1", wtype = 5, mod = 13, price = 500, DefaultPrice = 500 },
        { name = "Endov2dish", wtype = 5, mod = 14, price = 500, DefaultPrice = 500 },
        { name = "Guppez", wtype = 5, mod = 15, price = 500, DefaultPrice = 500 },
        { name = "Chokadori", wtype = 5, mod = 16, price = 500, DefaultPrice = 500 },
        { name = "Chicane", wtype = 5, mod = 17, price = 500, DefaultPrice = 500 },
        { name = "Saisoku", wtype = 5, mod = 18, price = 500, DefaultPrice = 500 },
        { name = "Dishedeight", wtype = 5, mod = 19, price = 500, DefaultPrice = 500 },
        { name = "Fujiwara", wtype = 5, mod = 20, price = 500, DefaultPrice = 500 },
        { name = "Zokusha", wtype = 5, mod = 21, price = 500, DefaultPrice = 500 },
        { name = "Battlevill", wtype = 5, mod = 22, price = 500, DefaultPrice = 500 },
        { name = "Rallymaster", wtype = 5, mod = 23, price = 500, DefaultPrice = 500 },
    },
    -----Highend wheels------
    highendwheels    = {
        { name = "Stock", wtype = 7, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Shadow", wtype = 7, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Hyper", wtype = 7, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Blade", wtype = 7, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Diamond", wtype = 7, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Supagee", wtype = 7, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Chromaticz", wtype = 7, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Merciechlip", wtype = 7, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Obeyrs", wtype = 7, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Gtchrome", wtype = 7, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Cheetahr", wtype = 7, mod = 9, price = 500, DefaultPrice = 500 },
        { name = "Solar", wtype = 7, mod = 10, price = 500, DefaultPrice = 500 },
        { name = "Splitten", wtype = 7, mod = 11, price = 500, DefaultPrice = 500 },
        { name = "Dashvip", wtype = 7, mod = 12, price = 500, DefaultPrice = 500 },
        { name = "Lozspeedten", wtype = 7, mod = 13, price = 500, DefaultPrice = 500 },
        { name = "Carboninferno", wtype = 7, mod = 14, price = 500, DefaultPrice = 500 },
        { name = "Carbonshadow", wtype = 7, mod = 15, price = 500, DefaultPrice = 500 },
        { name = "Carbonz", wtype = 7, mod = 16, price = 500, DefaultPrice = 500 },
        { name = "Carbonsolar", wtype = 7, mod = 17, price = 500, DefaultPrice = 500 },
        { name = "Carboncheetahr", wtype = 7, mod = 18, price = 500, DefaultPrice = 500 },
        { name = "Carbonsracer", wtype = 7, mod = 19, price = 500, DefaultPrice = 500 },
    },
    -----Lowrider wheels------
    lowriderwheels   = {
        { name = "Stock", wtype = 2, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Flare", wtype = 2, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Wired", wtype = 2, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Triplegolds", wtype = 2, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Bigworm", wtype = 2, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Sevenfives", wtype = 2, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Splitsix", wtype = 2, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Freshmesh", wtype = 2, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Leadsled", wtype = 2, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Turbine", wtype = 2, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Superfin", wtype = 2, mod = 9, price = 500, DefaultPrice = 500 },
        { name = "Classicrod", wtype = 2, mod = 10, price = 500, DefaultPrice = 500 },
        { name = "Dollar", wtype = 2, mod = 11, price = 500, DefaultPrice = 500 },
        { name = "Dukes", wtype = 2, mod = 12, price = 500, DefaultPrice = 500 },
        { name = "Lowfive", wtype = 2, mod = 13, price = 500, DefaultPrice = 500 },
        { name = "Gooch", wtype = 2, mod = 14, price = 500, DefaultPrice = 500 },
    },
    -----Muscle wheels-----
    musclewheels     = {
        { name = "Stock", wtype = 1, mod = -1, price = 500, DefaultPrice = 500 },
        { name = "Classicfive", wtype = 1, mod = 0, price = 500, DefaultPrice = 500 },
        { name = "Dukes", wtype = 1, mod = 1, price = 500, DefaultPrice = 500 },
        { name = "Musclefreak", wtype = 1, mod = 2, price = 500, DefaultPrice = 500 },
        { name = "Kracka", wtype = 1, mod = 3, price = 500, DefaultPrice = 500 },
        { name = "Azrea", wtype = 1, mod = 4, price = 500, DefaultPrice = 500 },
        { name = "Mecha", wtype = 1, mod = 5, price = 500, DefaultPrice = 500 },
        { name = "Blacktop", wtype = 1, mod = 6, price = 500, DefaultPrice = 500 },
        { name = "Dragspl", wtype = 1, mod = 7, price = 500, DefaultPrice = 500 },
        { name = "Revolver", wtype = 1, mod = 8, price = 500, DefaultPrice = 500 },
        { name = "Classicrod", wtype = 1, mod = 9, price = 500, DefaultPrice = 500 },
        { name = "Spooner", wtype = 1, mod = 10, price = 500, DefaultPrice = 500 },
        { name = "Fivestar", wtype = 1, mod = 11, price = 500, DefaultPrice = 500 },
        { name = "Oldschool", wtype = 1, mod = 12, price = 500, DefaultPrice = 500 },
        { name = "Eljefe", wtype = 1, mod = 13, price = 500, DefaultPrice = 500 },
        { name = "Dodman", wtype = 1, mod = 14, price = 500, DefaultPrice = 500 },
        { name = "Sixgun", wtype = 1, mod = 15, price = 500, DefaultPrice = 500 },
        { name = "Mercenary", wtype = 1, mod = 16, price = 500, DefaultPrice = 500 },
    },

    ---------Trim color--------
    trim             = {
        colors = colors,
        price  = 500, DefaultPrice = 500,
    },

    ----------Mods-----------
    mods             = {

        ----------Liveries--------
        [48] = {
            startprice = 700, DefaultPrice = 700,
            increaseby = 50,
        },

        ----------Windows--------
        [46] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50,
        },

        ----------Tank--------
        [45] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50,
        },

        ----------Trim--------
        [44] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Aerials--------
        [43] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Arch cover--------
        [42] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Struts--------
        [41] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Air filter--------
        [40] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Engine block--------
        [39] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Hydraulics--------
        [38] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Trunk--------
        [37] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Speakers--------
        [36] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Plaques--------
        [35] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Shift leavers--------
        [34] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Steeringwheel--------
        [33] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Seats--------
        [32] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Door speaker--------
        [31] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Dial--------
        [30] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },
        ----------Dashboard--------
        [29] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Ornaments--------
        [28] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Trim--------
        [27] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Vanity plates--------
        [26] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Plate holder--------
        [25] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ---------Headlights---------
        [22] = {
            { name = "Stock Lights", mod = 0, price = 0, DefaultPrice = 0 },
            { name = "Xenon Lights", mod = 1, price = 800, DefaultPrice = 800 },
        },

        ----------Turbo---------
        [18] = {
            { name = "None", mod = 0, price = 0, DefaultPrice = 0 },
            { name = "Turbo Tuning", mod = 1, price = 7500, DefaultPrice = 7500, m = .2 },
        },

        -----------Armor-------------
        [16] = {
            { name = "Armor Upgrade 20%", modtype = 16, mod = 0, price = 1000, DefaultPrice = 1000, m = .1 },
            { name = "Armor Upgrade 40%", modtype = 16, mod = 1, price = 2500, DefaultPrice = 2500, m = .15 },
            { name = "Armor Upgrade 60%", modtype = 16, mod = 2, price = 4000, DefaultPrice = 4000, m = .2 },
            { name = "Armor Upgrade 80%", modtype = 16, mod = 3, price = 5500, DefaultPrice = 5500, m = .25 },
            { name = "Armor Upgrade 100%", modtype = 16, mod = 4, price = 8000, DefaultPrice = 8000, m = .3 },
        },

        ---------Suspension-----------
        [15] = {
            { name = "Lowered Suspension", mod = 0, price = 1000, DefaultPrice = 1000, m = .05 },
            { name = "Street Suspension", mod = 1, price = 2000, DefaultPrice = 2000, m = .1 },
            { name = "Sport Suspension", mod = 2, price = 3500, DefaultPrice = 3500, m = .15 },
            { name = "Competition Suspension", mod = 3, price = 4000, DefaultPrice = 4000, m = .2 },
        },

        -----------Horn----------
        [14] = {
            { name = "Truck Horn", mod = 0, price = 800, DefaultPrice = 800 },
            { name = "Police Horn", mod = 1, price = 800, DefaultPrice = 800 },
            { name = "Clown Horn", mod = 2, price = 800, DefaultPrice = 800 },
            { name = "Musical Horn 1", mod = 3, price = 800, DefaultPrice = 800 },
            { name = "Musical Horn 2", mod = 4, price = 800, DefaultPrice = 800 },
            { name = "Musical Horn 3", mod = 5, price = 800, DefaultPrice = 800 },
            { name = "Musical Horn 4", mod = 6, price = 800, DefaultPrice = 800 },
            { name = "Musical Horn 5", mod = 7, price = 800, DefaultPrice = 800 },
            { name = "Sad Trombone Horn", mod = 8, price = 800, DefaultPrice = 800 },
            { name = "Classical Horn 1", mod = 9, price = 800, DefaultPrice = 800 },
            { name = "Classical Horn 2", mod = 10, price = 800, DefaultPrice = 800 },
            { name = "Classical Horn 3", mod = 11, price = 800, DefaultPrice = 800 },
            { name = "Classical Horn 4", mod = 12, price = 800, DefaultPrice = 800 },
            { name = "Classical Horn 5", mod = 13, price = 800, DefaultPrice = 800 },
            { name = "Classical Horn 6", mod = 14, price = 800, DefaultPrice = 800 },
            { name = "Classical Horn 7", mod = 15, price = 800, DefaultPrice = 800 },
            { name = "Scale Do Horn", mod = 16, price = 800, DefaultPrice = 800 },
            { name = "Scale Re Horn", mod = 17, price = 800, DefaultPrice = 800 },
            { name = "Scale Mi Horn", mod = 18, price = 800, DefaultPrice = 800 },
            { name = "Scale Fa Horn", mod = 19, price = 800, DefaultPrice = 800 },
            { name = "Scale So Horn", mod = 20, price = 800, DefaultPrice = 800 },
            { name = "Scale La Horn", mod = 21, price = 800, DefaultPrice = 800 },
            { name = "Scale Ti Horn", mod = 22, price = 800, DefaultPrice = 800 },
            { name = "Scale Do High Horn", mod = 23, price = 800, DefaultPrice = 800 },
            { name = "Jazz Horn 1", mod = 25, price = 800, DefaultPrice = 800 },
            { name = "Jazz Horn 2", mod = 26, price = 800, DefaultPrice = 800 },
            { name = "Jazz Horn 3", mod = 27, price = 800, DefaultPrice = 800 },
            { name = "Jazz Loop Horn", mod = 28, price = 800, DefaultPrice = 800 },
            { name = "Star Spangled Banner Horn 1", mod = 29, price = 800, DefaultPrice = 800 },
            { name = "Star Spangled Banner Horn 2", mod = 30, price = 800, DefaultPrice = 800 },
            { name = "Star Spangled Banner Horn 3", mod = 31, price = 800, DefaultPrice = 800 },
            { name = "Star Spangled Banner Horn 4", mod = 32, price = 800, DefaultPrice = 800 },
            { name = "Classical Loop Horn 1", mod = 33, price = 800, DefaultPrice = 800 },
            { name = "Classical Loop Horn 2", mod = 34, price = 800, DefaultPrice = 800 },
            { name = "Classical Loop Horn 3", mod = 35, price = 800, DefaultPrice = 800 },
        },

        ----------Transmission---------
        [13] = {
            { name = "Street Transmission", mod = 0, price = 10000, DefaultPrice = 10000, m = .1 },
            { name = "Sports Transmission", mod = 1, price = 12500, DefaultPrice = 12500, m = .15 },
            { name = "Race Transmission", mod = 2, price = 15000, DefaultPrice = 15000, m = .2 },
        },

        -----------Brakes-------------
        [12] = {
            { name = "Street Brakes", mod = 0, price = 6500, DefaultPrice = 6500, m = .1 },
            { name = "Sport Brakes", mod = 1, price = 8775, DefaultPrice = 8775, m = .15 },
            { name = "Race Brakes", mod = 2, price = 11375, DefaultPrice = 11375, m = .20 },
        },

        ------------Engine----------
        [11] = {
            { name = "EMS Upgrade, Level 2", mod = 0, price = 4500, DefaultPrice = 4500, m = .1 },
            { name = "EMS Upgrade, Level 3", mod = 1, price = 8000, DefaultPrice = 8000, m = .15 },
            { name = "EMS Upgrade, Level 4", mod = 2, price = 10500, DefaultPrice = 10500, m = .2 },
        },

        -------------Roof----------
        [10] = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ------------Fenders---------
        [8]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ------------Hood----------
        [7]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Grille----------
        [6]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Roll cage----------
        [5]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Exhaust----------
        [4]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Skirts----------
        [3]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        -----------Rear bumpers----------
        [2]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Front bumpers----------
        [1]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },

        ----------Spoiler----------
        [0]  = {
            startprice = 500, DefaultPrice = 500,
            increaseby = 50
        },
    }

}

------Model Blacklist--------
--Does'nt allow specific vehicles to be upgraded
LSC_Config.ModelBlacklist = {
    "police",
}

--Sets if garage will be locked if someone is inside it already
LSC_Config.lock           = false

--Enable/disable old entering way
LSC_Config.oldenter       = true

--Menu settings
LSC_Config.menu           = {

    -------Controls--------
    controls   = {
        menu_up     = 27,
        menu_down   = 173,
        menu_left   = 174,
        menu_right  = 175,
        menu_select = 201,
        menu_back   = 177
    },

    -------Menu position-----
    --Possible positions:
    --Left
    --Right
    --Custom position, example: position = {x = 0.2, y = 0.2}
    position   = "left",

    -------Menu theme--------
    --Possible themes: light, darkred, bluish, greenish
    --Custom example:
    --[[theme = {
        text_color = { r = 255,g = 255, b = 255, a = 255},
        bg_color = { r = 0,g = 0, b = 0, a = 155},
        --Colors when button is selected
        stext_color = { r = 0,g = 0, b = 0, a = 255},
        sbg_color = { r = 255,g = 255, b = 0, a = 200},
    },]]
    theme      = "light",

    --------Max buttons------
    --Default: 10
    maxbuttons = 10,

    -------Size---------
    --[[
    Default:
    width = 0.24
    height = 0.36
    ]]
    width      = 0.24,
    height     = 0.36

}

LSC_Config.Garages        = {
    [1]  = {
        isBusy   = false, locked = false,
        camera   = { x = -330.945, y = -135.471, z = 39.01, heading = 102.213 },
        driveout = { x = -350.376, y = -136.76, z = 38.294, heading = 70.226 },
        drivein  = { x = -350.655, y = -136.55, z = 38.295, heading = 249.532 },
        outside  = { x = -362.7962, y = -132.4005, z = 38.25239, heading = 71.187133 },
        inside   = { x = -337.3863, y = -136.9247, z = 38.5737, heading = 269.455 }
    },
    [2]  = {
        isBusy   = false, locked = false,
        camera   = { x = 734.91, y = -1080.66, z = 21.7, heading = 326.49 },
        driveout = { x = 734.91, y = -1080.66, z = 21.7, heading = 326.49 },
        drivein  = { x = 734.91, y = -1080.66, z = 21.7, heading = 326.49 },
        outside  = { x = 734.91, y = -1080.66, z = 21.7, heading = 326.49 },
        inside   = { x = 734.91, y = -1080.66, z = 21.7, heading = 326.49 }
    },
    [3]  = {
        isBusy   = false, locked = false,
        camera   = { x = -1154.902, y = -2011.438, z = 13.18, heading = 95.49 },
        driveout = { x = -1150.379, y = -1995.845, z = 12.465, heading = 313.594 },
        drivein  = { x = -1150.26, y = -1995.642, z = 12.466, heading = 136.859 },
        outside  = { x = -1140.352, y = -1985.89, z = 12.45, heading = 314.406 },
        inside   = { x = -1155.077, y = -2006.61, z = 12.465, heading = 162.58 }
    },
    [4]  = {
        isBusy   = false, locked = false,
        camera   = { x = 1177.98, y = 2636.059, z = 37.754, heading = 37.082 },
        driveout = { x = 1174.003, y = 2641.175, z = 37.045, heading = 0.759 },
        drivein  = { x = 1174.701, y = 2641.764, z = 37.048, heading = 178.119 },
        outside  = { x = 1174.565, y = 2641.819, z = 37.941, heading = 359.64 },
        inside   = { x = 1174.58, y = 2640.99, z = 37.09, heading = 181.19 },
    },
    [5]  = {
        isBusy   = false, locked = false,
        camera   = { x = 105.825, y = 6627.562, z = 31.787, heading = 266.692 },
        driveout = { x = 112.326, y = 6625.148, z = 31.073, heading = 224.641 },
        drivein  = { x = 112.738, y = 6624.644, z = 31.072, heading = 44.262 },
        outside  = { x = 118.493, y = 6618.897, z = 31.13, heading = 224.701 },
        inside   = { x = 111.37, y = 6626.51, z = 31.072, heading = 45.504 },
        custom   = {
            displayText = "~g~ENTER~w~ - To use Beeker's",
            rgba        = { r = 61, g = 155, b = 255, a = 155 },
            blipName    = "Beeker's Garage",
        }
    },
    [6]  = {
        isBusy       = false, locked = false,
        camera       = { x = 933.86, y = -966.36, z = 41, heading = 313.68 },
        driveout     = { x = 945.45, y = -977.76, z = 39.5, heading = 176.41 },
        drivein      = { x = 945.45, y = -977.76, z = 39.5, heading = 17.38 },
        outside      = { x = 935.13, y = -990.52, z = 38.17, heading = 185.0 },
        inside       = { x = 925.08, y = -961.51, z = 39.06, heading = 182.24 },
        restrictions = {
            jobName            = "mechanic2",
            allowedRoles       = { "Fabricator and Body Mechanic", "Head Mechanic", "Owner" },
            discountPercentage = 50,
            safePercentage     = 34,
            safeName           = "mechanic2",
            hideBlip           = true,
        },
        custom       = {
            displayText = "~g~ENTER~w~ - To use RAC's",
        },
    },
    -- [7]  = {
    --     isBusy   = false, locked = false,
    --     camera   = { x = -215.518, y = -1329.135, z = 30.893, heading = 329.092 },
    --     driveout = { x = -205.935, y = -1316.642, z = 30.176, heading = 356.495 },
    --     drivein  = { x = -205.626, y = -1314.993, z = 30.247, heading = 179.395 },
    --     outside  = { x = -205.594, y = -1304.085, z = 30.614, heading = 359.792 },
    --     inside   = { x = -212.368, y = -1325.486, z = 30.176, heading = 141.107 },
    --     custom   = {
    --         displayText = "~g~ENTER~w~ - To use Benny's",
    --         blipName    = "Benny's Motorworks",
    --     },
    -- },
    [7] = {
        isBusy       = false, locked = false,
        camera       = { x = 59.061527252197, y = -2579.3884277344, z = 6.3278713226318, heading = 181.39576721191 },
        driveout     = { x = 59.061527252197, y = -2579.3884277344, z = 6.3278713226318, heading = 181.39576721191 },
        drivein      = { x = 59.061527252197, y = -2579.3884277344, z = 6.3278713226318, heading = 181.39576721191 },
        outside      = { x = 59.061527252197, y = -2579.3884277344, z = 6.3278713226318, heading = 181.39576721191 },
        inside       = { x = 59.061527252197, y = -2579.3884277344, z = 6.3278713226318, heading = 181.39576721191 },
        restrictions = {
            jobName            = "drift",
            allowedRoles       = {"Mechanic", "Instructor", "Head Technician", "Overboost Manager"},
            discountPercentage = 50,
            hideBlip           = true,
        },
        custom       = {
            displayText = "~g~ENTER~w~ - Drift Car Customization",
        },
    },
    [8]  = {
        isBusy       = false, locked = false,
        camera       = { x = 937.31, y = -956.53, z = 39.06, heading = 359.79 },
        driveout     = { x = 937.31, y = -956.53, z = 39.06, heading = 359.79 },
        drivein      = { x = 937.31, y = -956.53, z = 39.06, heading = 359.79 },
        outside      = { x = 937.31, y = -956.53, z = 39.06, heading = 359.79 },
        inside       = { x = 937.31, y = -956.53, z = 39.06, heading = 359.79 },
        restrictions = {
            jobName            = "mechanic2",
            allowedRoles       = { "Fabricator and Body Mechanic", "Head Mechanic", "Owner" },
            discountPercentage = 50,
            safePercentage     = 34,
            safeName           = "mechanic2",
            hideBlip           = true,
        },
        custom       = {
            displayText = "~g~ENTER~w~ - To use RAC's",
        },
    },
    [9]  = {
        isBusy   = false, locked = false,
        camera   = { x = -773.35, y = -234.19, z = 37.08, heading = 201.30 },
        driveout = { x = -773.35, y = -234.19, z = 37.08, heading = 201.30 },
        drivein  = { x = -773.35, y = -234.19, z = 37.08, heading = 201.30 },
        outside  = { x = -773.35, y = -234.19, z = 37.08, heading = 201.30 },
        inside   = { x = -773.35, y = -234.19, z = 37.08, heading = 201.30 },
        custom   = {
            displayText = "~g~ENTER~w~ - To use Import's",
        }
    },
    [10] = {
        isBusy   = false, locked = false,
        camera   = { x = 996.06, y = -126.41, z = 73.59, heading = 67.82, },
        driveout = { x = 996.06, y = -126.41, z = 73.59, heading = 67.82, },
        drivein  = { x = 996.06, y = -126.41, z = 73.59, heading = 67.82, },
        outside  = { x = 996.06, y = -126.41, z = 73.59, heading = 67.82, },
        inside   = { x = 996.06, y = -126.41, z = 73.59, heading = 67.82, },
        custom   = {
            displayText = "~g~ENTER~w~ - Bike Shop",
        },
    },
    [11] = {
        isBusy       = false, locked = false,
        camera       = { x = 394.48, y = -964.76, z = -99.01, heading = 88.23 },
        driveout     = { x = 394.48, y = -964.76, z = -99.01, heading = 88.23 },
        drivein      = { x = 394.48, y = -964.76, z = -99.01, heading = 88.23 },
        outside      = { x = 394.48, y = -964.76, z = -99.01, heading = 88.23 },
        inside       = { x = 394.48, y = -964.76, z = -99.01, heading = 88.23 },
        restrictions = {
            jobName            = "police",
            allowedRoles       = { "CIU", "Commissioner" },
            discountPercentage = 100,
            hideBlip           = true,
        },
    },
    [12] = {
        isBusy       = false, locked = false,
        camera       = { x = 936.88250732422, y = -970.71612548828, z = 39.105491638184, heading = 272.96215820313 },
        driveout     = { x = 936.88250732422, y = -970.71612548828, z = 39.105491638184, heading = 272.96215820313 },
        drivein      = { x = 936.88250732422, y = -970.71612548828, z = 39.105491638184, heading = 272.96215820313 },
        outside      = { x = 936.88250732422, y = -970.71612548828, z = 39.105491638184, heading = 272.96215820313 },
        inside       = { x = 936.88250732422, y = -970.71612548828, z = 39.105491638184, heading = 272.96215820313 },
        restrictions = {
            jobName            = "mechanic2",
            allowedRoles       = { "Fabricator and Body Mechanic", "Head Mechanic", "Owner" },
            discountPercentage = 50,
            safePercentage     = 34,
            safeName           = "mechanic2",
            hideBlip           = true,
        },
        custom       = {
            displayText = "~g~ENTER~w~ - To use RAC's",
        },
    },
    -- [13] = {
    --     isBusy       = false, locked = false,
    --     camera       = { x = 913.32928466797, y = -966.33636474609, z = 39.062408447266, heading = 92.468528747559 },
    --     driveout     = { x = 913.32928466797, y = -966.33636474609, z = 39.062408447266, heading = 92.468528747559 },
    --     drivein      = { x = 913.32928466797, y = -966.33636474609, z = 39.062408447266, heading = 92.468528747559 },
    --     outside      = { x = 913.32928466797, y = -966.33636474609, z = 39.062408447266, heading = 92.468528747559 },
    --     inside       = { x = 913.32928466797, y = -966.33636474609, z = 39.062408447266, heading = 92.468528747559 },
    --     restrictions = {
    --         jobName            = "mechanic2",
    --         allowedRoles       = { "Fabricator and Body Mechanic", "Head Mechanic", "Owner" },
    --         discountPercentage = 50,
    --         safePercentage     = 34,
    --         safeName           = "mechanic2",
    --         hideBlip           = true,
    --     },
    --     custom       = {
    --         displayText = "~g~ENTER~w~ - To use RAC's",
    --     },
    -- },
    [13] = {
        isBusy       = false, locked = false,
        camera       = { x = -222.05191040039, y = -1330.8720703125, z = 30.479175567627, heading = 89.965202331543 },
        driveout     = { x = -222.05191040039, y = -1330.8720703125, z = 30.479175567627, heading = 89.965202331543 },
        drivein      = { x = -222.05191040039, y = -1330.8720703125, z = 30.479175567627, heading = 89.965202331543 },
        outside      = { x = -222.05191040039, y = -1330.8720703125, z = 30.479175567627, heading = 89.965202331543 },
        inside       = { x = -222.05191040039, y = -1330.8720703125, z = 30.479175567627, heading = 89.965202331543 },
        restrictions = {
            jobName            = "bennys",
            allowedRoles       = { "Apprentice", "Mechanic", "Technician", "Head Mechanic", "Head Technician", "Owner" },
            discountPercentage = 50,
            safePercentage     = 10,
            safeName           = "bennys",
            blipName    = "Benny's Motorworks",
        },
        custom       = {
            displayText = "~g~ENTER~w~ - Mechanic Shop",
        },
    },
    [14] = {
        isBusy       = false, locked = false,
        camera       = { x = -1383.9333496094, y = -475.37573242188, z = 77.799339294434, heading = 104.89877319336 },
        driveout     = { x = -1383.9333496094, y = -475.37573242188, z = 77.799339294434, heading = 104.89877319336 },
        drivein      = { x = -1383.9333496094, y = -475.37573242188, z = 77.799339294434, heading = 104.89877319336 },
        outside      = { x = -1383.9333496094, y = -475.37573242188, z = 77.799339294434, heading = 104.89877319336 },
        inside       = { x = -1383.9333496094, y = -475.37573242188, z = 77.799339294434, heading = 104.89877319336 },
        restrictions = {
            jobName  = nil,
            hideBlip = true,
        },
        custom       = {
            displayText = "~r~Temple Repairs~w~",
            rgba        = { r = 109, g = 98, b = 0, a = 255 },
        },
    },
    
}