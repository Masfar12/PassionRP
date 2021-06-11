Config = {
    Items = {
    'diamond',
    'emerald',
    'goldore',
    'metalscrap',
    'aluminum'},
    PickupCoords = vector3(2953.1809082031, 2742.7822265625, 43.618045806885),
    GetMetal = vector3(1713.0804443359, -1555.5579833984, 113.9421081543),
    WashCoords = vector3(3842.9516601562, 4445.056640625, 0.34231993556023),
    Objects = {
        ['drill'] = 'prop_tool_jackham',
        ['stone'] = 2139496847,
    },
    MiningPositions = {
        {coords = vector3(2998.25, 2756.17, 43.06), heading = 297.50},
        {coords = vector3(2945.63, 2734.22, 45.15), heading = 140.11},
        {coords = vector3(2937.58, 2756.15, 43.97), heading = 10.95},
        {coords = vector3(2927.77, 2787.89, 39.83), heading = 350.78},
        {coords = vector3(2936.83, 2813.20, 43.15), heading = 283.80},
        {coords = vector3(2971.18, 2798.37, 41.27), heading = 290.57},
        {coords = vector3(2980.79, 2786.79, 40.34), heading = 261.77},
        {coords = vector3(2968.97, 2776.59, 38.39), heading = 161.93},
        {coords = vector3(3002.10, 2772.79, 42.94), heading = 315.11},
    },
}

Strings = {
    ['press_mine'] = 'Press ~INPUT_CONTEXT~ to mine.',
    ['mining_info'] = 'Press ~INPUT_FRONTEND_RDOWN~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.',
    ['you_sold'] = 'You sold %sx %s for %s',
    ['e_sell'] = 'Press ~INPUT_CONTEXT~ to sell all your mined items.',
    ['someone_close'] = 'There is a player too close to you!',
    ['mining'] = 'Mine',
    ['sell_mine'] = 'Ore Selling',
    ['afterexplosion'] = 'Explosion Complete. Collect Stones!',
    
}
-- -96.984, -1013.646, 27.275
Config.SellLocations = {
    [1] = {
        ["coords"] = {
            ["x"] = 287.23, 
            ["y"] = 2843.63, 
            ["z"] = 44.70,
        }
    }
}