Config = {}

Config.Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config.Products = {
    ["normal"] = {
        [1] = {
            name = "tosti",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "kurkakola",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "twerks_candy",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "snikkel_candy",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "sandwich",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "beer",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "whiskey",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "vodka",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "bandage",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "pet_food",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "jerry_can",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
    },
    ["hardware"] = {
        {
            name = "weapon_wrench",
            price = 100,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        {
            name = "weapon_hammer",
            price = 100,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        {
            name = "repairkit",
            price = 800,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        {
            name = "screwdriverset",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        {
            name = "phone",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        {
            name = "radio",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        {
            name = "binoculars",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        --[9] = {
        --    name = "firework2",
        --    price = 3000,
        --    amount = 50,
        --    info = {},
        --    type = "item",
        --    slot = 9,
        --},
        --[10] = {
        --    name = "firework3",
        --    price = 3000,
        --    amount = 50,
        --    info = {},
        --    type = "item",
        --    slot = 10,
        --},
        --[11] = {
        --    name = "firework4",
        --    price = 3000,
        --    amount = 50,
        --    info = {},
        --    type = "item",
        --    slot = 11,
        --},
        {
            name = "cleaningkit",
            price = 150,
            amount = 150,
            info = {},
            type = "item",
            slot = 8,
        },
        {
            name = "weapon_hatchet",
            price = 100,
            amount = 10,
            info = {},
            type = "item",
            slot = 9,
        },
        {
            name = "boltofpolyester",
            price = 2000,
            amount = 10,
            info = {},
            type = "item",
            slot = 10,
        },
        {
            name = "boltofnylon",
            price = 2000,
            amount = 10,
            info = {},
            type = "item",
            slot = 11,
        },
        {
            name = "tapanddie",
            price = 5000,
            amount = 3,
            info = {},
            type = "item",
            slot = 12,
        },
        {
            name = "springs",
            price = 1000,
            amount = 15,
            info = {},
            type = "item",
            slot = 13,
        },
        {
            name = "lens",
            price = 2500,
            amount = 6,
            info = {},
            type = "item",
            slot = 14,
        },
        {
            name = "hackingsoftware",
            price = 15000,
            amount = 5,
            info = {},
            type = "item",
            slot = 15,
        },
        --[20] = {
        --    name = "snowboard",
        --    price = 30,
        --    amount = 50,
        --    info = {},
        --    type = "item",
        --    slot = 20,
        --},
        {
            name = "skateboard",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
        },
        {
            name = "cloth",
            price = 50,
            amount = 1000,
            info = {},
            type = "item",
            slot = 17,
        },
        {
            name = "bag",
            price = 20000,
            amount = 50,
            info = {},
            type = "item",
            slot = 18,
        },
        {
            name = "weapon_bat",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 19,
        },
    },
    ["bestbuds"] = {
        [1] = {
            name = "rolling_paper",
            price = 2,
            amount = 5000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "parachute",
            price = 500,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 5,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "empty_weed_bag",
            price = 0.5,
            amount = 5000,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "mbrownie",
            price = 50,
            amount = 1000,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "bong",
            price = 75,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weedroller",
            price = 1000,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
        }
    },
    ["coffeeshop"] = {
        [1] = {
            name = "rolling_paper",
            price = 40,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_poolcue",
            price = 100,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "empty_weed_bag",
            price = 10,
            amount = 5000,
            info = {},
            type = "item",
            slot = 4,
        }
    },
    ["bahamas"] = {
        [1] = {
            name = "water_bottle",
            price = 20,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
    },
    ["gearshop"] = {
        [1] = {
            name = "diving_gear",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "jerry_can",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["casinoshop"] = {
        [1] = {
            name = "scratchticket",
            price = 5000,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
			name = "casino_chips",
			price = 1,
			amount = 10000000,
			info = {},
			type = "item",
			slot = 2,
		},
    },
    ["secretshop"] = {
        [1] = {
            name = "weapon_proxmine",
            price = 10000,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_stickybomb",
            price = 10000,
            amount = 10,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_molotov",
            price = 10000,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_smokegrenade",
            price = 10000,
            amount = 10,
            info = {},
            type = "item",
            slot = 4,
        },
    },
    ["leisureshop"] = {
        [1] = {
            name = "parachute",
            price = 500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },    
        [3] = {
            name = "diving_gear",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "fishingrod",
            price = 250,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "fishingbait",
            price = 2,
            amount = 10000,
            info = {},
            type = "item",
            slot = 5,
        },
    },   
    ["newtshop"] = {
        [1] = {
            name = "parachute",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 500,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },    
        [3] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    ["temple"] = {
        [1] = {
            name = "repairkit",
            price = 250,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "fakeplate",
            price = 10000,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cleaningkit",
            price = 10,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "harness",
            price = 10000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "tunerlaptop",
            price = 30000,
            amount = 3,
            info = {},
            type = "item",
            slot = 5,
        },    
    },    
    ["weapons"] = {
        [1] = {
            name = "weapon_knife",
            price = 100,
            amount = 25,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_switchblade",
            price = 300,
            amount = 25,
            info = {},
            type = "item",
            slot = 2,
        },
        -- TODO: CONTINUE FROM HERE
        [3] = {
            name = "weapon_hatchet",
            price = 100,
            amount = 25,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_pistol",
            price = 2000,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_combatpistol",
            price = 3000,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "pistol_ammo",
            price = 75,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "armor",
            price = 750,
            amount = 15,
            info = {},
            type = "item",
            slot = 7,
        },
    },
    ["coffeeplace"] = {
        [1] = {
            name = "coffee",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["customcoffee"] = {
        [1] = {
            name = "coffee",
            price = 5,
            amount = 10000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "latte",
            price = 25,
            amount = 10000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "coffeebeans",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "toastie",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "chedcrackers",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "donut",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "muffin",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 7,
        },
    },
    ["pearls"] = {
        [1] = {
            name = "spaghettimeatballs",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "fettuccine",
            price = 25,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "lasagne",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "margheritapizza",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "raviolli",
            price = 30,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
    },
    ["fruitstand"] = {
        [1] = {
            name = "blueberry",
            price = 2,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "strawberry",
            price = 2,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "watermelon",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "banana",
            price = 2,
            amount = 250,
            info = {},
            type = "item",
            slot = 4,
        },
    },
    ["bbqstand"] = {
        [1] = {
            name = "baconburger",
            price = 10,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "fries",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cheesesteak",
            price = 10,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "slicepizza",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "brisket",
            price = 10,
            amount = 250,
            info = {},
            type = "item",
            slot = 5,
        },
    },
    ["desertstand"] = {
        [1] = {
            name = "cheesecake",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "icecreamcone",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "redpopsicle",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "applepie",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 4,
        },
    },
    ["veggiestand"] = {
        [1] = {
            name = "veggienugget",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "veggieburger",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "salad",
            price = 5,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "hfries",
            price = 10,
            amount = 250,
            info = {},
            type = "item",
            slot = 4,
        },
    },
    ["gundoor"] = {
        [1] = {
            name = "weapon_appistol",
            price = 25000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },    
    },
    ["paletotable"] = {
        [1] = {
            name = "money_roll",
            price = 0,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },    
    },     
    ["whiskeyjim"] = {
		[1] = {
			name = "housebeer",
			price = 5,
			amount = 1000,
			info = {},
			type = "item",
			slot = 1,
        },
        [2] = {
			name = "housevodka",
			price = 5,
			amount = 1000,
			info = {},
			type = "item",
			slot = 2,
        },
        [3] = {
			name = "housewine",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 3,
        },
        [4] = {
			name = "whiskey_jim",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 4,
        },
        [5] = {
			name = "wangsushi",
			price = 10,
			amount = 1000,
			info = {},
			type = "item",
			slot = 5,
        },
    },
    ["havocbar"] = {
		[1] = {
			name = "whiskey_jack",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 1,
        },
        [2] = {
			name = "whiskey_johnny",
			price = 20,
			amount = 1000,
			info = {},
			type = "item",
			slot = 2,
        },
        [3] = {
			name = "housewine",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 3,
        },
        [4] = {
			name = "beer_corona",
			price = 5,
			amount = 1000,
			info = {},
			type = "item",
			slot = 4,
        },
        [5] = {
			name = "beer_bud",
			price = 5,
			amount = 1000,
			info = {},
			type = "item",
			slot = 5,
        },
        [6] = {
			name = "water_bottle",
			price = 2,
			amount = 1000,
			info = {},
			type = "item",
			slot = 6,
        },
        [7] = {
			name = "kurkakola",
			price = 2,
			amount = 1000,
			info = {},
			type = "item",
			slot = 7,
        },
        [8] = {
            name = "coffee",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 8,
        },
    }, 
    ["alcohol"] = {
		[1] = {
			name = "housebeer",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 1,
        },
        [2] = {
			name = "housevodka",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 2,
        },
        [3] = {
			name = "housewine",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 3,
        },
        [4] = {
			name = "beer_stella",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 4,
        },
        [5] = {
			name = "beer_bud",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 5,
        },
        [6] = {
			name = "beer_corona",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 6,
        },
        [7] = {
			name = "whiskey_jack",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 7,
        },
        [8] = {
			name = "whiskey_johnny",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 8,
        },
        [9] = {
			name = "whiskey_bells",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 9,
        },
        [10] = {
			name = "vodka_smirnoff",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 10,
        },
        [11] = {
			name = "vodka_ciroc",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 11,
        },
        [12] = {
			name = "vodka_goose",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 12,
        },
        [13] = {
			name = "gin_beefeater",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 13,
        },
        [14] = {
			name = "gin_gordons",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 14,
        },
        [15] = {
			name = "gin_hendricks",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 15,
        },
        [16] = {
			name = "wine_jacobs",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 16,
        },
        [17] = {
			name = "wine_yellow",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 17,
        },
        [18] = {
			name = "wine_dom",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 18,
        },
        [19] = {
			name = "tequila_sierra",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 19,
        },
        [20] = {
			name = "tequila_tesoro",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 20,
        },
        [21] = {
			name = "tequila_patron",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 21,
        },
        [22] = {
			name = "blowjobshot",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 22,
        },
        [23] = {
			name = "sexbeach",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 23,
        },
        [24] = {
			name = "cocktail",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 24,
        },
        [25] = {
			name = "butterynippleshot",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 25,
        },
        [26] = {
			name = "bloodymary",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 26,
        },
        [27] = {
			name = "cosmopolitancocktail",
			price = 1,
			amount = 1000,
			info = {},
			type = "item",
			slot = 27,
        },
    },     
    ["tequila"] = {
		[1] = {
			name = "housebeer",
			price = 5,
			amount = 1000,
			info = {},
			type = "item",
			slot = 1,
        },
        [2] = {
			name = "housevodka",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 2,
        },
        [3] = {
			name = "housewine",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 3,
        },
        [4] = {
			name = "moonshine",
			price = 20,
			amount = 1000,
			info = {},
			type = "item",
			slot = 4,
        },
    },     
    ["passion"] = {
		[1] = {
			name = "housebeer",
			price = 50,
			amount = 1000,
			info = {},
			type = "item",
			slot = 1,
        },
    },     
    ["vanilla"] = {
		[1] = {
			name = "housebeer",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 1,
        },
        [2] = {
			name = "housevodka",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 2,
        },
        [3] = {
			name = "housewine",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 3,
        },
    },    
    ["nightclub"] = {
		[1] = {
			name = "housebeer",
			price = 5,
			amount = 1000,
			info = {},
			type = "item",
			slot = 1,
        },
        [2] = {
			name = "housevodka",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 2,
        },
        [3] = {
			name = "housewine",
			price = 15,
			amount = 1000,
			info = {},
			type = "item",
			slot = 3,
        },
    },    
    ["materials"] = {
        [1] = {
            name = "metalscrap",
            price = 10,
            amount = 10000000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "plastic",
            price = 10,
            amount = 10000000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "copper",
            price = 10,
            amount = 10000000,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "iron",
            price = 10,
            amount = 10000000,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "aluminum",
            price = 10,
            amount = 10000000,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "steel",
            price = 10,
            amount = 10000000,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "glass",
            price = 10,
            amount = 10000000,
            info = {},
            type = "item",
            slot = 7,
        },
    },
    ["black"] = {
        [1] = {
            name = "lockpick",
            price = 250,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "gatecrack",
            price = 2000,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "handcuffs",
            price = 2000,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "radioscanner",
            price = 4500,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "drill",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "armor",
            price = 550,
            amount = 15,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "tic",
            price = 150000,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "drug_scale",
            price = 3000,
            amount = 5,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "banktruckusb",
            price = 2000,
            amount = 5,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "weapon_pistol",
            price = 2000,
            amount = 20,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_combatpistol",
            price = 3000,
            amount = 20,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "hackermanlaptop",
            price = 20000,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
        },
    },
    ["burger"] = {
        [1] = {
            name = "baconburger",
            price = 5,
            amount = 15,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "fries",
            price = 2,
            amount = 15,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cheesesteak",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "slicepizza",
            price = 2,
            amount = 500,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "brisket",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "milkshake",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "veggienugget",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "hfries",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "veggieburger",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "salad",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 10,
        },
       
        
    },
    ["irishpub"] = {
        [1] = {
            name = "tosti",
            price = 10,
            amount = 150,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "sandwich",
            price = 12,
            amount = 150,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "hfries",
            price = 8,
            amount = 150,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "cheesesteak",
            price = 18,
            amount = 150,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "baconburger",
            price = 20,
            amount = 150,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "fries",
            price = 5,
            amount = 150,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "veggienugget",
            price = 14,
            amount = 150,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "veggieburger",
            price = 16,
            amount = 150,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "salad",
            price = 13,
            amount = 150,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "blueberry",
            price = 5,
            amount = 150,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "strawberry",
            price = 5,
            amount = 150,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "watermelon",
            price = 5,
            amount = 150,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "banana",
            price = 5,
            amount = 150,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "cheesecake",
            price = 20,
            amount = 150,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "icecreamcone",
            price = 17,
            amount = 150,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "applepie",
            price = 18,
            amount = 150,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "redpopsicle",
            price = 9,
            amount = 150,
            info = {},
            type = "item",
            slot = 17,
        },
    },
}

Config.Locations = {
    ["ltdgasoline"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -48.44,
                ["y"] = -1757.86,
                ["z"] = 29.42,
            },
            [2] = {
                ["x"] = -47.23,
                ["y"] = -1756.58,
                ["z"] = 29.42,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 25.7,
                ["y"] = -1347.3,
                ["z"] = 29.49,
            },
            [2] = {
                ["x"] = 25.7,
                ["y"] = -1344.99,
                ["z"] = 29.49,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -1222.77,
                ["y"] = -907.19,
                ["z"] = 12.32,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["ltdgasoline2"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -707.41,
                ["y"] = -912.83,
                ["z"] = 19.21,
            },
            [2] = {
                ["x"] = -707.32,
                ["y"] = -914.65,
                ["z"] = 19.21,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor2"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -1487.7,
                ["y"] = -378.53,
                ["z"] = 40.16,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["ltdgasoline3"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -1820.33,
                ["y"] = 792.66,
                ["z"] = 138.1,
            },
            [2] = {
                ["x"] = -1821.55,
                ["y"] = 793.98,
                ["z"] = 138.1,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor3"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -2967.79,
                ["y"] = 391.64,
                ["z"] = 15.04,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket2"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -3038.71,
                ["y"] = 585.9,
                ["z"] = 7.9,
            },
            [2] = {
                ["x"] = -3041.04,
                ["y"] = 585.11,
                ["z"] = 7.9,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket3"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -3241.47,
                ["y"] = 1001.14,
                ["z"] = 12.83,
            },
            [2] = {
                ["x"] = -3243.98,
                ["y"] = 1001.35,
                ["z"] = 12.83,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket4"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1728.66,
                ["y"] = 6414.16,
                ["z"] = 35.03,
            },
            [2] = {
                ["x"] = 1729.72,
                ["y"] = 6416.27,
                ["z"] = 35.03,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket5"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1697.99,
                ["y"] = 4924.4,
                ["z"] = 42.06,
            },
            [2] = {
                ["x"] = 1699.44,
                ["y"] = 4923.47,
                ["z"] = 42.06,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket6"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1961.48,
                ["y"] = 3739.96,
                ["z"] = 32.34,
            },
            [2] = {
                ["x"] = 1960.22,
                ["y"] = 3742.12,
                ["z"] = 32.34,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor4"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1165.28,
                ["y"] = 2709.4,
                ["z"] = 38.15,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket7"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 547.79,
                ["y"] = 2671.79,
                ["z"] = 42.15,
            },
            [2] = {
                ["x"] = 548.1,
                ["y"] = 2669.38,
                ["z"] = 42.15,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket8"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 2679.25,
                ["y"] = 3280.12,
                ["z"] = 55.24,
            },
            [2] = {
                ["x"] = 2677.13,
                ["y"] = 3281.38,
                ["z"] = 55.24,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket9"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 2557.94,
                ["y"] = 382.05,
                ["z"] = 108.62,
            },
            [2] = {
                ["x"] = 2555.53,
                ["y"] = 382.18,
                ["z"] = 108.62,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["delvecchioliquor"] = {
        ["label"] = "Del Vecchio Liquor",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -159.36,
                ["y"] = 6321.59,
                ["z"] = 31.58,
            },
            [2] = {
                ["x"] = -160.66,
                ["y"] = 6322.85,
                ["z"] = 31.58,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["donscountrystore"] = {
        ["label"] = "Don's Country Store",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 161.41,
                ["y"] = 6640.78,
                ["z"] = 31.69,
            },
            [2] = {
                ["x"] = 163.04,
                ["y"] = 6642.45,
                ["z"] = 31.70,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["ltdgasoline4"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1163.7,
                ["y"] = -323.92,
                ["z"] = 69.2,
            },
            [2] = {
                ["x"] = 1163.4,
                ["y"] = -322.24,
                ["z"] = 69.2,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor5"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1135.66,
                ["y"] = -982.76,
                ["z"] = 46.41,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket9"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 373.55,
                ["y"] = 325.56,
                ["z"] = 103.56,
            },
            [2] = {
                ["x"] = 374.29,
                ["y"] = 327.9,
                ["z"] = 103.56,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["muriettaheights"] = {
        label = "Murietta Heights Gas Station",
        type = "normal",
        coords = {
            {
                x = 1211.223,
                y = -1389.474,
                z = 35.376,
            },
        },
        products = Config.Products.normal,
    },
    ["hardware"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = 45.55,
                ["y"] = -1749.01,
                ["z"] = 29.6,
            }
        },
        ["products"] = Config.Products["hardware"],
    },
    ["hardware2"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = 2747.8,
                ["y"] = 3472.86,
                ["z"] = 55.67,
            },
        },
        ["products"] = Config.Products["hardware"],
    },
    ["hardware3"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = -421.84,
                ["y"] = 6136.09,
                ["z"] = 31.78,
            },
        },
        ["products"] = Config.Products["hardware"],
    },   
    ["coffeeshop"] = {
        ["label"] = "Superfly",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = -1172.43,
                ["y"] = -1572.24,
                ["z"] = 4.66,
            }
        },
        ["products"] = Config.Products["coffeeshop"],
    },
    ["bestbuds"] = {
        ["label"] = "Best Buds",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = 380.09,
                ["y"] = -817.48,
                ["z"] = 29.3,
            }
        },
        ["products"] = Config.Products["bestbuds"],
    },
    ["drkush"] = {
        ["label"] = "Dr. Kush",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = -178.98,
                ["y"] = 6387.45,
                ["z"] = 31.5,
            }
        },
        ["products"] = Config.Products["bestbuds"],
    },
    ["temple"] = {
        ["label"] = "Temple Exchange",
        ["type"] = "temple",
        ["coords"] = {
            [1] = {
                ["x"] = -1393.62,
                ["y"] = -478.98,
                ["z"] = 78.20,
            }
        },
        ["products"] = Config.Products["temple"],
        hideMarker = true,
        hideText = true,
        hideBlip = true,
    },
    ["ammunation1"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = -662.1, 
                ["y"] = -935.3, 
                ["z"] = 21.8
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation2"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 810.2, 
                ["y"] = -2157.3, 
                ["z"] = 29.6
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation3"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 1693.4, 
                ["y"] = 3759.5, 
                ["z"] = 34.7
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation4"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = -330.2, 
                ["y"] = 6083.8, 
                ["z"] = 31.4
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation5"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 252.3, 
                ["y"] = -50.0, 
                ["z"] = 69.9
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation6"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 22.3, 
                ["y"] = -1105.17, 
                ["z"] = 29.8
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation7"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 2567.6, 
                ["y"] = 294.3, 
                ["z"] = 108.7
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation8"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = -1117.5, 
                ["y"] = 2698.6, 
                ["z"] = 18.5
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation9"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 842.4, 
                ["y"] = -1033.4, 
                ["z"] = 28.1
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["seaword1"] = {
        ["label"] = "Sea World",
        ["type"] = "sea",
        ["coords"] = {
            [1] = {
                ["x"] = -1686.9, 
                ["y"] = -1072.23, 
                ["z"] = 13.15
            }
        },
        ["products"] = Config.Products["gearshop"],
    },
    ["casino"] = {
        ["label"] = "Casino",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1115.6900634766, 
                ["y"] = 219.94306945801, 
                ["z"] = -49.43514251709
            }
        },
        ["products"] = Config.Products["casinoshop"],
    },
    ["leisureshop"] = {
        ["label"] = "Gear Shop",
        ["type"] = "leisure",
        ["coords"] = {
            [1] = {
                ["x"] = -1507.5643310547, 
                ["y"] = 1505.2073974609, 
                ["z"] = 115.28849029541
            },
        },
        ["products"] = Config.Products["leisureshop"],
    },   
    ["starsbucks"] = {
        ["label"] = "Bloods Beans",
        ["type"] = "coffeeshop",
        ["coords"] = {  
            [1] = {
                ["x"] = -627.63, 
                ["y"] = 223.82, 
                ["z"] = 81.88
            }
        },
        ["products"] = Config.Products["customcoffee"],
        hideMarker = true,
        hideText = true,
        hideBlip = false,
    },
    ["pearls"] = {
        ["label"] = "Pearls Seafood",
        ["type"] = "food",
        ["coords"] = {  
            [1] = {
                ["x"] = -1843.53, 
                ["y"] = -1186.32, 
                ["z"] = 14.31
            }
        },
        ["products"] = Config.Products["pearls"],
        hideBlip = true,
        jobRestrictions = {
            {
                name = "pearls",
                minGrade = 0,
            },
        },
    },
    ["veggiestand"] = {
        ["label"] = "Veggie Stand",
        ["type"] = "normal",
        ["coords"] = {  
            [1] = {
                ["x"] = 407.48, 
                ["y"] = -357.49, 
                ["z"] = 46.85
            }
        },
        ["products"] = Config.Products["veggiestand"],
        hideBlip = true,
    },
    ["fruitstand"] = {
        ["label"] = "Fruit Stand",
        ["type"] = "normal",
        ["coords"] = {  
            [1] = {
                ["x"] = 406.63, 
                ["y"] = -349.56, 
                ["z"] = 46.84
            }
        },
        ["products"] = Config.Products["fruitstand"],
        hideBlip = true,
    },
    ["bbqstand"] = {
        ["label"] = "BBQ Stand",
        ["type"] = "normal",
        ["coords"] = {  
            [1] = {
                ["x"] = 397.11, 
                ["y"] = -345.26, 
                ["z"] = 46.85
            }
        },
        ["products"] = Config.Products["bbqstand"],
        hideBlip = true,
    },   
    ["desertstand"] = {
        ["label"] = "Desert Stand",
        ["type"] = "normal",
        ["coords"] = {  
            [1] = {
                ["x"] = 386.89, 
                ["y"] = -342.22, 
                ["z"] = 46.81
            }
        },
        ["products"] = Config.Products["desertstand"],
        hideBlip = true,
    },    
    ["whiskeyjim"] = {
        ["label"] = "Whiskey Jims",
        ["type"] = "whiskeyjim",
        ["coords"] = {
            [1] = {
                ["x"] = 1982.34, 
                ["y"] = 3053.21, 
                ["z"] = 47.22
            }
        },
        ["products"] = Config.Products["whiskeyjim"],
        hideMarker = true,
        hideText = true,
    },
    ["havocbar"] = {
        ["label"] = "Havoc Bar",
        ["type"] = "havocbar",
        ["coords"] = {
            [1] = {
                ["x"] = 756.24, 
                ["y"] = -1315.06, 
                ["z"] = 27.00
            }
        },
        ["products"] = Config.Products["havocbar"],
        hideMarker = true,
        hideText = true,
        hideBlip = true,
    },
    --["gundoor"] = {
    --    ["label"] = "Gun Dealer",
    --    ["type"] = "gundoor",
    --   ["coords"] = {
    --        [1] = {
    --            ["x"] = 526.308, 
    --            ["y"] = -1781.760, 
    --            ["z"] = 28.913
    --        }
    --    },
    --    ["products"] = Config.Products["gundoor"],
    --},
    ["paletotable"] = {
        ["label"] = "Paleto Table",
        ["type"] = "paletotable",
        ["coords"] = {
            [1] = {
                ["x"] = -104.85, 
                ["y"] = 6476.55, 
                ["z"] = 31.63
            }
        },
        ["products"] = Config.Products["paletotable"],
        hideMarker = true,
        hideText = true,
        hideBlip = true,
    },    
    ["tequila"] = {
        ["label"] = "Tequi-la-la",
        ["type"] = "tequila",
        ["coords"] = {
            [1] = {
                ["x"] = -562.27, 
                ["y"] = 287.57, 
                ["z"] = 82.18
            }
        },
        ["products"] = Config.Products["tequila"],
        hideMarker = true,
        hideText = true,
    },    
    ["passion"] = {
        ["label"] = "Passion",
        ["type"] = "passion",
        ["coords"] = {
            [1] = {
                ["x"] = -979.02, 
                ["y"] = -2995.28, 
                ["z"] = 13.95
            }
        },
        ["products"] = Config.Products["passion"],
        hideMarker = true,
        hideText = true,
    },    
    ["alcohol"] = {
        ["label"] = "Winery",
        ["type"] = "alcohol",
        ["coords"] = {
            [1] = {
                ["x"] = -1881.8, 
                ["y"] = 2063.8, 
                ["z"] = 135.9
            }
        },
        ["products"] = Config.Products["alcohol"],
        hideMarker = true,
        hideText = true,
    },    
    ["vanilla"] = {
        ["label"] = "Vanilla Unicorn",
        ["type"] = "vanilla",
        ["coords"] = {
            [1] = {
                ["x"] = 122.25393676758,
                ["y"] = -1280.3382568359,
                ["z"] = 29.480466842651
            }
        },
        ["products"] = Config.Products["vanilla"],
    },    
    ["nightclub"] = {
        ["label"] = "Galaxy Nightclub",
        ["type"] = "nightclub",
        ["coords"] = {
            [1] = {
                ["x"] = 356.1, 
                ["y"] = 282.21, 
                ["z"] = 94.19
            }
        },
        ["products"] = Config.Products["nightclub"],
    },    
    ["materials"] = {
        ["label"] = "Junkyard",
        ["type"] = "materials",
        ["coords"] = {
            [1] = {
                ["x"] = -512.16, 
                ["y"] = -1747.31, 
                ["z"] = 19.25
            }
        },
        ["products"] = Config.Products["materials"],
    },  
    ["black"] = {
        ["label"] = "Black Market",
        ["type"] = "black",
        ["coords"] = {
            [1] = {
                ["x"] = -341.82, 
                ["y"] = 3745.31, 
                ["z"] = 69.97
            }
        },
        ["products"] = Config.Products["black"],
        hideMarker = true,
        hideBlip = true,
    },  
    ["burger"] = {
        ["label"] = "Mimi Burgers",
        ["type"] = "burger",
        ["coords"] = {  
            [1] = {
                ["x"] = 88.72, 
                ["y"] = -234.42, 
                ["z"] = 54.7
            }
        },
        ["products"] = Config.Products["burger"],
        hideMarker = true,
        hideText = true,
    },    
    ["secretshop"] = {
        ["label"] = "Secret Shop",
        ["type"] = "secretshop",
        ["coords"] = {  
            [1] = {
                ["x"] = 355.92, 
                ["y"] = -930.2, 
                ["z"] = 59.44
            }
        },
        ["products"] = Config.Products["secretshop"],
        hideMarker = true,
        hideText = true,
        hideBlip = true,
    },
    ["irishpub"] = {
        ["label"] = "Irish Pub",
        ["type"] = "irishpub",
        ["coords"] = {  
            [1] = {
                ["x"] = 822.45,
                ["y"] = -114.61,
                ["z"] = 80.43
            }
        },
        ["products"] = Config.Products["irishpub"],
    },
    ["bahamas"] = {
        ["label"] = "Bahamas",
        ["type"] = "bahamas",
        ["coords"] = {  
            [1] = {
                ["x"] = -1390.39,
                ["y"] = -600.50,
                ["z"] = 30.31
            }
        },
        ["products"] = Config.Products["bahamas"],
    },
}