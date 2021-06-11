_PRPCrafting = {
    Config = {}
}

-----------------------------------------------------------
------Crafting List--2/3-----------------------------------
-----------------------------------------------------------
_PRPCrafting.Config.CraftingItems = {
    {
        name = "lockpick",
        amount = 50,
        info = {},
        costs = {
            ["iron"] = 30,
            ["steel"] = 30,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "screwdriverset",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 30,
            ["plastic"] = 30,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "electronickit",
        amount = 50,
        info = {},
        costs = {
            ["steel"] = 25,
            ["copper"] = 25,
            ["plastic"] = 25,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "advancedlockpick",
        amount = 50,
        info = {},
        costs = {
            lockpick = 1,
            screwdriverset = 1,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "gatecrack",
        amount = 50,
        info = {},
        costs = {
            ["copper"] = 10,
            ["plastic"] = 20,
            ["aluminum"] = 20,
            ["iron"] = 15,
            ["electronickit"] = 2,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "handcuffs",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 100,
            ["steel"] = 100,
            ["temperedsteel"] = 10,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "repairkit",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 30,
            ["steel"] = 40,
            ["copper"] = 60,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "pocketknife_blade",
        amount = 50,
        info = {},
        costs = {
            ["temperedsteel"] = 5,
            ["metalscrap"] = 20,
            ["copper"] = 20,
            ["weapon_hammer"] = 1,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "pocketknife",
        amount = 50,
        info = {},
        costs = {
            ["copper"] = 150,
            ["metalscrap"] = 150,
            ["steel"] = 150,
            ["pocketknife_blade"] = 5,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "ironoxide",
        amount = 50,
        info = {},
        costs = {
            iron = 60,
            glass = 30,
        },
        threshold = 0,
        points = 0,
    },
    {
        name = "aluminumoxide",
        amount = 50,
        info = {},
        costs = {
            aluminum = 60,
            glass = 30,
        },
        threshold = 0,
        points = 0,
    },
    {
        name = "thermite",
        amount = 50,
        info = {},
        costs = {
            aluminumoxide = 2,
            ironoxide = 2,
        },
        threshold = 0,
        points = 0,
    },
    {
        name = "radioscanner",
        amount = 50,
        info = {},
        costs = {
            ["electronickit"] = 10,
            ["plastic"] = 50,
            ["steel"] = 50,
            ["copper"] = 25,
            ["aluminum"] = 25,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "clippers",
        amount = 50,
        info = {},
        costs = {
            ["temperedsteel"] = 50,
            ["screwdriverset"] = 1,
            ["metalscrap"] = 50,
            ["electronickit"] = 15,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "cleaningkit",
        amount = 50,
        info = {},
        costs = {
            ["plastic"] = 10,
            ["cloth"] = 1,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
}

_PRPCrafting.Config.FirearmItems = {
    {
        name   = "weapon_heavypistol",
        amount = 50,
        info   = {},
        costs  = {
            ["steel"]            = 250,
            ["plastic"]          = 250,
            ["metalscrap"]       = 250,
            ["temperedsteel"]    = 50,
            ["springs"]          = 3,
            ["packaged_plank"]   = 1,
            ["heavy_pistol_mag"] = 1,
        },
    },
}

-----------------------------------------------------------
----Temple Crafting List 2/3-------------------------------
-----------------------------------------------------------
_PRPCrafting.Config.TempleItems = {
    {
        name = "advancedrepairkit",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 20,
            ["plastic"] = 20,
            ["steel"] = 20,
            ["copper"] = 20,
            ["glass"] = 20,
            ["aluminum"] = 20,
            ["iron"] = 20,
            ["repairkit"] = 1,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "harness",
        amount = 50,
        info = {},
        costs = {
            ["boltofpolyester"] = 5,
            ["seatbeltbuckle"] = 1,
            ["springs"] = 5,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "fakeplate",
        amount = 50,
        info = {},
        costs = {
            ["expiredplate"] = 1,
            ["screwdriverset"] = 1,
            ["temperedsteel"] = 20,
            ["tapanddie"] = 4,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "tunerlaptop",
        amount = 50,
        info = {},
        costs = {
            ["friedecu"] = 1,
            ["tablet"] = 1,
            ["electronickit"] = 5,
            ["hackingsoftware"] = 1,
            ["templecoin"] = 1,
            ["lens"] = 4,
            ["springs"] = 10,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
}

-----------------------------------------------------------
----ammunation Crafting List 1/3-------------------------------
-----------------------------------------------------------
_PRPCrafting.Config.AmmunationItems = {
    {
        name = "weapon_pistol",
        amount = 15,
        info = {},
        costs = {
            ["steel"] = 25,
            ["copper"] = 25,
            ["iron"] = 25,
        },
        type = "item",
        threshold = 0,
        points = 2,
    },
    {
        name = "weapon_combatpistol",
        amount = 15,
        info = {},
        costs = {
            ["steel"] = 30,
            ["copper"] = 30,
            ["iron"] = 30,
        },
        type = "item",
        threshold = 0,
        points = 2,
    },
    {
        name = "handcuffs",
        amount = 5,
        info = {},
        costs = {
            ["metalscrap"] = 10,
            ["steel"] = 10,
            ["aluminum"] = 10,
        },
        type = "item",
        threshold = 0,
        points = 1,
    },    
    {
        name = "armor",
        amount = 5,
        info = {},
        costs = {
            ["iron"] = 10,
            ["steel"] = 25,
            ["plastic"] = 10,
            ["aluminum"] = 15,
        },
        type = "item",
        threshold = 0,
        points = 2,
    },
    {
        name = "speedloader",
        amount = 5,
        info = {},
        costs = {
            ["steel"] = 75,
            ["copper"] = 75,
            ["aluminum"] = 75,
            ["springs"] = 2,
        },
        type = "item",
        threshold = 0,
        points = 5,
    },
    {
        name = "pistol_ammo",
        amount = 100,
        info = {},
        costs = {
            ["metalscrap"] = 3,
            ["steel"] = 3,
            ["copper"] = 3,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "shotgun_ammo",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 10,
            ["steel"] = 10,
            ["copper"] = 10,
        },
        type = "item",
        threshold = 0,
        points = 1,
    },
    {
        name = "smg_ammo",
        amount = 15,
        info = {},
        costs = {
            ["metalscrap"] = 15,
            ["steel"] = 15,
            ["copper"] = 10,
        },
        type = "item",
        threshold = 0,
        points = 1,
    },
    {
        name = "rifle_ammo",
        amount = 10,
        info = {},
        costs = {
            ["metalscrap"] = 20,
            ["steel"] = 20,
            ["copper"] = 15,
        },
        type = "item",
        threshold = 0,
        points = 1,
    },
    {
        name = "weapon_knife",
        amount = 5,
        info = {},
        costs = {
            ["metalscrap"] = 3,
            ["steel"] = 3,
            ["copper"] = 3,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "weapon_switchblade",
        amount = 5,
        info = {},
        costs = {
            ["metalscrap"] = 5,
            ["steel"] = 5,
            ["copper"] = 5,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "weapon_hatchet",
        amount = 5,
        info = {},
        costs = {
            ["metalscrap"] = 5,
            ["steel"] = 5,
            ["copper"] = 5,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "weapon_revolver",
        amount = 5,
        info = {},
        costs = {
            ["steel"]            = 250,
            ["plastic"]          = 250,
            ["metalscrap"]       = 250,
            ["temperedsteel"]    = 50,
            ["springs"]          = 3,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
    {
        name = "weapon_vintagepistol",
        amount = 5,
        info = {},
        costs = {
            ["steel"]            = 225,
            ["plastic"]          = 225,
            ["metalscrap"]       = 225,
            ["temperedsteel"]    = 60,
            ["springs"]          = 3,
        },
        type = "item",
        threshold = 0,
        points = 0,
    },
}



_PRPCrafting.Config.Locations = {
    {
        id       = "templeCrafting",
        label    = "Temple Workbench",
        coords   = vector3(-1394.64, -466.84, 78.20),
        items    = "TempleItems", -- _PRPCrafting.Config.TempleItems,
        showHint = false,
    },
    {
        id       = "ammunationCrafting",
        label    = "Ammunation Workbench",
        coords   = vector3(1170.4686279297, -3195.9709472656, -40.007968902588),
        items    = "AmmunationItems", -- _PRPCrafting.Config.AmmunationItems,
        showHint = true,
    },
    {
        id       = "firearmCrafting",
        label    = "Firearm Crafting",
        coords   = vector3(-1520.303, 109.522, 50.027),
        items    = "FirearmItems", -- _PRPCrafting.Config.GunItems,
        showHint = true,
    },
}
