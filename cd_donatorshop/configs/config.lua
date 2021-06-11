Config = {}
------------------------------------------------------------------------------------------------------
----------------------------------------------- MAIN -------------------------------------------------
------------------------------------------------------------------------------------------------------

Config.Database = 'ghmattimysql' --[ 'mysql' / 'ghmattimysql' ] Choose your sql database script.
Config.Language = 'EN' --[ 'EN' / 'FR' / 'ES' / 'CZ' / 'PT' ] You can add your own locales to the Locales.lua. But make sure to add it here.

Config.UseESX = false --Do you use es_extended?
Config.ESXTriggers = { --You can change the esx events (IF NEEDED).
    main = 'esx:getSharedObject',
    load = 'esx:playerLoaded',
    job = 'esx:setJob',
}
Config.ESX_allowedperms = { --FOR ESX ONLY. You decide which permission groups can use the staff commands to add/remove coins.
  	['superadmin'] = true,
    ['admin'] = true,
    ['mod'] = false,
    ['helper'] = false,
}

Config.Using_cdgarage = false --Do you use te Codesign garage?
Config.Using_cdmultichar = false --Are you the using Codesign Multicharacter script?
Config.MaxCharacterSlots = 5 --If you are using the using Codesign Multicharacter script ^^, what is the maximum amount of character slots you allow players to have?
Config.PlateUpperCaps = true --When purchasing a vehicle do you want the letters of the plate to be saved in the databsase in upper case? If set to false the plate will be saved in lower case.
Config.PurchaseCommand = 'tebex_purchase' --DONT CHANGE IF YOU DONT KNOW WHAT YOU ARE DOING. This is the command for the tebex transactions.

Config.BlacklistedWords = {'CHANGE_ME', 'CHANGE_ME'} --These words are blacklisted from plate changes. If a plate change contains any of these words the transaction will be canceled.

Config.NotificationType = { --[ 'chat' / 'mythic_old' / 'mythic_new' / 'esx' / 'custom' ]
    server = 'custom',
    client = 'custom',
}

------------------------------------------------------------------------------------------------------
------------------------------------------- CHAT COMMANDS --------------------------------------------
------------------------------------------------------------------------------------------------------

Config.RedeemCommand = 'redeemtebex' --The command players who have purchased items on tebex can use to redeem their purchase in game.
Config.StaffCommands = {
    Add_Balance = 'add_balance', --The command for staff to manually add coins to a players balance in the database.
    Remove_Balance = 'remove_balance', --The command for staff to manually remove coins to from a players balance database.
}

------------------------------------------------------------------------------------------------------
---------------------------------------- TEBEX WEBSITE PRODUCTS --------------------------------------
------------------------------------------------------------------------------------------------------

Config.TebexListings = { --These are the products that you will list for sale on your tebex website.
    [1] = {
        ProductName = 'Bronze', --You can change this, but this ProductName must be identical to the name of the product on your tebex website.
        Amount = 0, --This is the amount of coins the player will recieve when he purchases this product.
    },

    [2] = {
        ProductName = 'Silver',
        Amount = 0,
    },

    [3] = {
        ProductName = 'Gold',
        Amount = 15,
    },

    [4] = {
        ProductName = 'Platinum',
        Amount = 25,
    },

    [5] = {
        ProductName = 'Diamond',
        Amount = 40,
    },

    [6] = {
        ProductName = 'Demi God',
        Amount = 60,
    },

    [7] = {
        ProductName = 'God',
        Amount = 75,
    },

    [8] = {
        ProductName = 'God King',
        Amount = 100,
    },
}

------------------------------------------------------------------------------------------------------
-------------------------------------------- MAIN LOCATIONS ------------------------------------------
------------------------------------------------------------------------------------------------------

Config.Locations = {
    [1] = {x = -1394.81, y = -3265.03, z = 13.93, h = 339.85,   Distance = 10.0, EventName = 'cd_donatorshop:Enter', Text = Locales[Config.Language]['enter']},--The entrance to the donator shop.
    [2] = {x = -1266.89, y = -2965.47, z = -48.48, h = 179.08,  Distance = 10.0, EventName = 'cd_donatorshop:Exit', Text = Locales[Config.Language]['exit']},--The exit to the donator shop.
    [3] = {x = -1246.55, y = -2984.19, z = -48.49, h = 0.0,     Distance = 10.0, EventName = 'cd_donatorshop:Menu', Text = Locales[Config.Language]['menu']},--The donator shop main shop UI.
}

------------------------------------------------------------------------------------------------------
----------------------------------------------- VEHICLES ---------------------------------------------
------------------------------------------------------------------------------------------------------

Config.ManuallyPlaceVehicles = false --Do you want to manually enter the coords for each vehicles location? (If disabled the script will automatically choose the location of each vehicle, circled around the Config.StartCoords below.)
Config.AutomaticStartCoords = vector4(-1266.83, -3013.54, -48.49, 180.0) --(THIS WILL ONLY BE USED IF Config.ManuallyPlaceVehicles ABOVE^^ IS DISABLED). You can change the coords for where the vehicles will spawn. This is the centre, the vehicles will spawn around this location.
Config.VehiclePurchaseCoords = vector4(-1394.81, -3265.03, 13.93, 339.85) --This is the location where your vehicle will spawn after you make a purchase.

Config.Vehicles = {
    --Cost = This is how much the vehicle will cost.
    --Model = This is the spawn name of the vehicle.
    --Description = This is the description which will be displayed on the vehicles UI.
    --Coords = (THIS WILL ONLY BE USED IF Config.ManuallyPlaceVehicles ABOVE^^ IS ENABLED). You can manually set the location of each vehicle.
    [1] = {Cost = 2, Model = 'bmx', Name = 'BMX', Description = 'Go shred some jumps!'},
}

------------------------------------------------------------------------------------------------------
------------------------------------------ IN GAME PRODUCT MENU --------------------------------------
------------------------------------------------------------------------------------------------------

Config.Prop = { --The prop to mark the location where players can access the main shop UI.
    Model = 'xm_prop_base_staff_desk_01',
    Coords = vector4(-1242.32, -2988.77, -48.49, 180.0),
}

-- Plate change 3,


Config.Shop = {
    [1] = {
        Title = 'Boombox',
        Description = 'x1 boombox - listen to music with your friends!',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'equipo.png',
        Cost = 5,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'stereo',
    },

    [2] = {
        Title = 'Flaregun',
        Description = 'x1 flaregun',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'flaregun.png',
        Cost = 2,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'weapon_flaregun',
    },

    [3] = {
        Title = 'Hand Flare',
        Description = 'x5 handflare',
        Input_Type = 'number',
        Input_Description = '1 = x5 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'handflare.png',
        Cost = 2,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'weapon_flare',
    },

    [4] = {
        Title = 'Snowballs',
        Description = 'x50 Snowballs',
        Input_Type = 'number',
        Input_Description = '1 = x50 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'snowball.png',
        Cost = 5,
        RewardType = 'item',
        Quantity = 50,
        ItemName = 'weapon_snowball',
    },

    [5] = {
        Title = 'Katana',
        Description = 'x1 Katana',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'katana.png',
        Cost = 10,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'weapon_katana',
    },

    [6] = {
        Title = 'Rambo Knife',
        Description = 'x1 Rambo Knife',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'weapon_rambknife.png',
        Cost = 10,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'weapon_rambknife',
    },

    [7] = {
        Title = 'Kiketsu Sword',
        Description = 'x1 Kiketsu Sword',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'weapon_kiketsusword.png',
        Cost = 10,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'weapon_kiketsusword',
    },

    [8] = {
        Title = 'Kirito Sword',
        Description = 'x1 Kirito Sword',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'weapon_ksword.png',
        Cost = 10,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'weapon_ksword',
    },

    [9] = {
        Title = 'Battle Axe',
        Description = 'x1 Battle Axe',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'battleaxe.png',
        Cost = 5,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'weapon_battleaxe',
    },

    [10] = {
        Title = 'Knuckle Dusters',
        Description = 'x1 Knuckle Dusters',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'knuckle.png',
        Cost = 5,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'weapon_knuckle',
    },
    [11] = {
        Title = 'Plate Change, MUST BE EXACTLY 8 CHARACTERS.',                                             -- Title.
        Description = 'Buy a custom plate. IF IT IS NOT 8 CHARACTERS IT WILL BREAK YOUR CAR.',                                 -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '8 characters long (including whitespaces)',    -- The help text inside the input box.
        Pattern = '[^a-zA-Z0-9]',                                           -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        MaxLength = 8,                                                      -- The max amount of characters allowed.
        Image = 'license-plate.png',                                        -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 3,                                                          -- The cost to purchase 1 of these.
        RewardType = 'plate_change',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },
    [12] = {
        Title = 'Clothing Bag',
        Description = 'A bag of clothing. You can change clothes anywhere!',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'clothingbag.png',
        Cost = 1,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'clothingbag',                                                 -- DONT change this.
    },
    [13] = {
        Title = 'Night Vision Goggles',
        Description = 'Premium NVG head equipment!',
        Input_Type = 'number',
        Input_Description = '1 = x1 item',
        MaxLength = nil,
        Pattern = nil,
        Image = 'nightvision.png',
        Cost = 10,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'nightvision',                                                 -- DONT change this.
    },
}


--[[
VEHICLE PLATE CHANGE EXAMPLE.

    [1] = {
        Title = 'Plate Change',                                             -- Title.
        Description = 'Buy a custom plate',                                 -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '8 characters long (including whitespaces)',    -- The help text inside the input box.
        Pattern = '[^a-zA-Z0-9]',                                           -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        MaxLength = 8,                                                      -- The max amount of characters allowed.
        Image = 'license-plate.png',                                        -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 10,                                                          -- The cost to purchase 1 of these.
        RewardType = 'plate_change',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },


PHONE NUMBER CHANGE EXAMPLE.

    [2] = {
        Title = 'Phone Number',                                             -- Title.
        Description = 'Buy a custom phone number',                          -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = 'Enter a number between 1-8 characters',        -- The help text inside the input box.
        MaxLength = 8,                                                      -- The max amount of characters allowed.
        Pattern = '[^0-9\\-]',                                              -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'phone_change.png',                                         -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 15,                                                          -- The cost to purchase 1 of these.
        RewardType = 'phone_number',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },


GIVE WEAPON EXAMPLE.

    [3] = {
        Title = 'Assault Rifle',                                            -- Title.
        Description = 'Carbine Rifle with 250 rounds of ammunition',        -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 weapon with x250 ammo',                 -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'weapon.png',                                               -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'weapon',                                              -- DONT change this.
        Quantity = 250,                                                     -- If the RewardType is 'weapon', then this is the amount of ammo to add. (players will only recieve 1 weapon).
        ItemName = 'WEAPON_CARBNIERIFLE',                                   -- The spawn name of this weapon.
    },


GIVE MONEY EXAMPLE.

    [4] = {
        Title = 'Money',                                                    -- Title.
        Description = 'A briefcase with $10,000 cash inside',               -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = $10000',                                   -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'money.png',                                                -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'money',                                               -- DONT change this.
        Quantity = 10000,                                                   -- If the RewardType is 'money', then this is the amount of money to add. (10000 would give the player $10,000 to their bank).
        ItemName = nil,                                                     -- DONT change this.
    },


GIVE ITEM EXAMPLE.

    [5] = {
        Title = 'Gold Bars',                                                -- Title.
        Description = 'x5 24 carat gold bars',                              -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x5 items',                                 -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'goldbar.png',                                              -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'item',                                                -- DONT change this.
        Quantity = 5,                                                       -- If the RewardType is 'item', then this is the amount of items add. (1 would give the player x1 item).
        ItemName = 'water',                                                 -- The spawn name of this item.
    },

CHANGE CHARACTER NAME EXAMPLE.
    [6] = {
        Title = 'Character Name',                                           -- Title.
        Description = 'Change your character name',                         -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = 'eg., John Smith',                              -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = '[^a-zA-Z\\s]',                                           -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'character_name.png',                                       -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 15,                                                          -- The cost to purchase 1 of these.
        RewardType = 'character_name',                                      -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },

FULL VEHICLE PACKS EXAMPLE. (by "packs" we mean you can sell multiple vehicles in this 1 product)
    [7] = {
        Title = 'Vehicle Pack',                                             -- Title.
        Description = 'Contains x1 adder, x1 golf cart and x1 jetski',      -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 FULL car pack',                         -- The help text inside the input box.
        MaxLength = 1,                                                      -- The max amount of characters allowed.
        Pattern = '[^0-9\\-]',                                              -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'vehicle_pack.png',                                         -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 50,                                                          -- The cost to purchase 1 of these.
        RewardType = 'vehicle_pack',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = {'adder', 'seashark', 'caddy'},                          -- Add the spawn name of the vehicles included in this vehicle pack to this table. Use the same format as the example.
    },


ADD CHARACTER SLOT EXAMPLE. (this comes pre-configured to work with cd_multicharacter. It will not work on other multichar scripts unless you edit the code).

    [8] = {
        Title = 'Character Slot',                                           -- Title.
        Description = 'Add 1 extra character slot',                         -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 extra character slot',                  -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'character_slot.png',                                       -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 10,                                                          -- The cost to purchase 1 of these.
        RewardType = 'character_slot',                                      -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },
]]