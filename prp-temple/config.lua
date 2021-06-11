Temple = {}
--Where the Player Lands after Purchasing a Vehicle
Temple.TemplePurchaseSpawn = {x = -1388.60,   y = -481.36, z = 77.80, h = 15.44}

--Temple Stash Location to Store/Recieve Parts
Temple.TemplePartStash = {x = -1379.42, y = -471.577, z = 78.20}

--Install Location -- Required to be HERE to Install non-Tyre Parts
Temple.TemplePartInstall = {x = -1383.83, y = -469.25, z = 78.20}

--Install Mech Location and Type
Temple.TempleMechPed = {
    ["ped"] = `mp_m_waremech_01`,
    ["coords"] = {x = -1380.96, y = -469.12, z = 78.20, h = 89.34}
}

--Temple Computer Location to Access Computer
Temple.TempleComputer = {x = -1379.75, y = -477.57, z = 72.04}

--Temple Council.. Certain Features are locked to Council Members
Temple.TempleCouncil = {

    "TFM23794", -- big ben
    "OZE14090", -- tommy ross
    "IRF57268", -- callum Macaulay
    "XHC58717", --tj rohodes
    "DMK08411", -- Sami
    "ZPP43603", -- diego clark



}

--Vehicle Spawn/Display Table for cars available to purchase via Temple Coins
Temple.TempleVehicles = {
    [1] = {
        coords = {x = -1390.51, y = -478.23, z = 48.15, h = 312.97},
        inUse = false,
        car = "ZR350TA",
        price = 10,
    },
    [2] = {
        coords = {x = -1384.45, y = -472.48, z = 48.15, h = 207.78},
        inUse = false,
        car = "elegyrh5",
        price = 10,
    },
    [3] = {
        coords = {x = -1377.61, y = -471.58, z = 48.15, h = 164.31},
        inUse = false,
        car = "SCHWARZER2",
        price = 10,
    },
    [4] = {
        coords = {x = -1370.00, y = -479.08, z = 48.15, h = 58.43},
        inUse = false,
        car = "revolutionw",
        price = 10,
    },
    [5] = {
        coords = {x = -1390.40, y = -476.04, z = 53.45, h = 270.10},
        inUse = false,
        car = "aston",
        price = 15,
    },
    [6] = {
        coords = {x = -1379.36, y = -471.61, z = 53.45, h = 93.09},
        inUse = false,
        car = "RCFGT3",
        price = 15,
    },
    [7] = {
        coords = {x = -1370.14, y = -477.88, z = 53.45, h = 170.68},
        inUse = false,
        car = "c7r",
        price = 15,
    },
    [8] = {
        coords = {x = -1390.45, y = -475.67, z = 58.76, h = 172.67},
        inUse = false,
        car = "gtrgt3",
        price = 15,
    },
    [9] = {
        coords = {x = -1379.51, y = -471.20, z = 58.76, h = 261.15},
        inUse = false,
        car = "gt3",
        price = 15,
    },
    [10] = {
        coords = {x = -1369.92, y = -478.93, z = 58.76, h = 59.61},
        inUse = false,
        car = "rmodp1gtr",
        price = 15,
    }
}

--[[script.js will use this table to Create Divs and Click functions for Temple Computer Usage.
    parts.lua will use this table to apply changes to the vehicle. MULTYPLYING the ["effect"] attritube of the cars handling file by the ["multp"]..]]--
Temple.TempleParts = {
    {
        ["id"] = "ecu_1",
        ["part"] = "ecu_1",
        ["multp"] = 1.25,
        ["effect"] = "fInitialDriveForce",
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "ECU Stg. 1",
        ["img"] = "nui://prp-inventory/html/images/ecu_1.png",
    },{
        ["id"] = "engine_1",
        ["part"] = "engine_1",
        ["multp"] = 1.05,
        ["effect"] = "fInitialDriveMaxFlatVel",
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "Engine Stg. 1",
        ["img"] = "nui://prp-inventory/html/images/engine_1.png",
    },{
        ["id"] = "brakes_1",
        ["part"] = "brakes_1",
        ["multp"] = 1.15,
        ["effect"] = "fBrakeForce",
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "Brakes Stg. 1",
        ["img"] = "nui://prp-inventory/html/images/brakes_1.png",
    },{
        ["id"] = "transmission_1",
        ["part"] = "transmission_1",
        ["multp"] = 1.15,
        ["effect"] = "fDriveInertia",
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "Transmission Stg. 1",
        ["img"] = "nui://prp-inventory/html/images/transmission_1.png",
    },{
        ["id"] = "stage_1_kit",
        ["part"] = 1,
        ["price"] = 20000,
        ["amount"] = 1,
        ["label"] = "Full Stg. 1 Kit",
        ["img"] = "nui://prp-inventory/html/images/stage_1_kit.png",
    },{
        ["id"] = "ecu_2",
        ["part"] = "ecu_2",
        ["multp"] = 1.5,
        ["effect"] = "fInitialDriveForce",
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "ECU Stg. 2",
        ["img"] = "nui://prp-inventory/html/images/ecu_2.png",
    },{
        ["id"] = "engine_2",
        ["part"] = "engine_2",
        ["multp"] = 1.1,
        ["effect"] = "fInitialDriveMaxFlatVel",
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "Engine Stg. 2",
        ["img"] = "nui://prp-inventory/html/images/engine_2.png",
    },{
        ["id"] = "brakes_2",
        ["part"] = "brakes_2",
        ["multp"] = 1.30,
        ["effect"] = "fBrakeForce",
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "Brakes Stg. 2",
        ["img"] = "nui://prp-inventory/html/images/brakes_2.png",
    },{
        ["id"] = "transmission_2",
        ["part"] = "transmission_2",
        ["multp"] = 1.3,
        ["effect"] = "fDriveInertia",
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "Transmission Stg. 2",
        ["img"] = "nui://prp-inventory/html/images/transmission_2.png",
    },{
        ["id"] = "stage_2_kit",
        ["part"] = 2,
        ["price"] = 20000,
        ["amount"] = 1,
        ["label"] = "Full Stg. 2 Kit",
        ["img"] = "nui://prp-inventory/html/images/stage_2_kit.png",
    },{
        ["id"] = "nitrous_kit",
        ["part"] = "nitrous_kit",
        ["price"] = 10000,
        ["amount"] = 1,
        ["label"] = "Nitrous Kit",
        ["img"] = "nui://prp-inventory/html/images/nitrous_kit.png",
    },{
        ["id"] = "tyres_h",
        ["part"] = "tyres_h",
        ["price"] = 2500,
        ["amount"] = 1,
        ["label"] = "Hard Tyres",
        ["img"] = "nui://prp-inventory/html/images/tyres_h.png",
    },{
        ["id"] = "tyres_m",
        ["part"] = "tyres_m",
        ["multp"] = 1.1,
        ["effect"] = "fTractionCurveMax",
        ["price"] = 2500,
        ["amount"] = 1,
        ["label"] = "Medium Tyres",
        ["img"] = "nui://prp-inventory/html/images/tyres_m.png",
    },{
        ["id"] = "tyres_s",
        ["part"] = "tyres_s",
        ["multp"] = 1.25,
        ["effect"] = "fTractionCurveMin",
        ["price"] = 2500,
        ["amount"] = 1,
        ["label"] = "Soft Tyres",
        ["img"] = "nui://prp-inventory/html/images/tyres_s.png",
    },{
        ["id"] = "tyres_kit",
        ["part"] = 3,
        ["price"] = 5000,
        ["amount"] = 1,
        ["label"] = "Set of Tyres",
        ["img"] = "nui://prp-inventory/html/images/tyres_kit.png",
    },
}

--script.js will use this table to Create Divs and Click functions for Temple Computer Store/shop.
Temple.TempleStorePage = {
    {
        ["id"] = "redkey",
        ["part"] = "redkey",
        ["label"] = "Red Key",
        ["price"] = 2500,
        ["amount"] = 1,
        ["img"] = "nui://prp-inventory/html/images/redkey.png",
    },{
        ["id"] = "car_scanner",
        ["part"] = "car_scanner",
        ["label"] = "Vehicle<br>Scanner",
        ["price"] = 5000,
        ["amount"] = 1,
        ["img"] = "nui://prp-inventory/html/images/car_scanner.png",
    },{
        ["id"] = "harness",
        ["part"] = "harness",
        ["label"] = "Harness",
        ["price"] = 10000,
        ["amount"] = 1,
        ["img"] = "nui://prp-inventory/html/images/harness.png",
    },{
        ["id"] = "advancedrepairkit",
        ["part"] = "advancedrepairkit",
        ["label"] = "Advanced<br> Repair Kit",
        ["price"] = 1000,
        ["amount"] = 1,
        ["img"] = "nui://prp-inventory/html/images/advancedkit.png",
    },{
        ["id"] = "nitrous",
        ["part"] = "nitrous",
        ["label"] = "Nitrous",
        ["price"] = 1000,
        ["amount"] = 1,
        ["img"] = "nui://prp-inventory/html/images/nitrous.png",
    },{
        ["id"] = "fakeplate",
        ["part"] = "fakeplate",
        ["label"] = "Fake Plate",
        ["price"] = 20000,
        ["amount"] = 1,
        ["img"] = "nui://prp-inventory/html/images/fakeplate.png",
    },{
        ["id"] = "tunerlaptop",
        ["part"] = "tunerlaptop",
        ["label"] = "Tuner Chip",
        ["price"] = 50000,
        ["amount"] = 1,
        ["img"] = "nui://prp-inventory/html/images/tunerlaptop.png",
    },{
        ["id"] = "templecoin",
        ["part"] = "templecoin",
        ["label"] = "Temple Coin",
        ["price"] = 10,
        ["amount"] = 1,
        ["img"] = "nui://prp-inventory/html/images/templecoin.png",
    },{
        ["id"] = "advancedrepairkit10",
        ["part"] = "advancedrepairkit",
        ["label"] = "10x Advanced<br> Repair Kits",
        ["price"] = 10000,
        ["amount"] = 10,
        ["img"] = "nui://prp-inventory/html/images/advancedkit.png",
    },{
        ["id"] = "nitrous10",
        ["part"] = "nitrous",
        ["label"] = "10x Nitrous<br>Tanks",
        ["price"] = 10000,
        ["amount"] = 10,
        ["img"] = "nui://prp-inventory/html/images/nitrous.png",
    },
}

--This is used for the Part Install -- In order to open the proper hood, if vehicle is rearEngined
BackEngineVehicles = {
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
    'tempesta2'
}

--[[
    Steps to Create a WHOLE new Part.

    1. Add a column to the `tmeple_parts` table within the Database
        Set the Column name as the SAME name you plan to name the part.

    2. Add the new part to the Shared.lua with the same name as the column name
        Don't forget to add an image!

    3. Create a new entry in the Temple.TempleParts Dictionary found above.
        Reference Example
            id: div class ID for script.js
            part: Part Name
            multp: Number to be multyplied by vehs Original Values
            effect: The handling class to change within vehs Handling.meta
            price: Dollar price to be purchased via Temple Computer
            amount: Amount of items to give when purchasing from Temple Computer
            labal: Div Class <p> label for Computer Buttons
            img: Part image for computer buttons


]]--