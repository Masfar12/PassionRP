local alcoholCount = 0
jointTolerance = Config.JointData["joint"]["tolerance"]
ak47BluntTolerance = Config.JointData["ak47blunt"]["tolerance"]
pocolocoWrapTolerance = Config.JointData["pocolocowrap"]["tolerance"]
mhJointTolerance = Config.JointData["mhjoint"]["tolerance"]
amnesiaJointTolerance = Config.JointData["amnesiajoint"]["tolerance"]

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if alcoholCount > 0 then
            Citizen.Wait(1000 * 60 * 15)
            alcoholCount = alcoholCount - 1
        else
            Citizen.Wait(2000)
        end
    end
end)
RegisterNetEvent("consumables:client:UseJoint")
AddEventHandler("consumables:client:UseJoint", function()
    local time = Config.JointData["joint"]["smoking"]
    if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    end
    PRPCore.Functions.Progressbar("smoke_joint", "Smokin a joint..", time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["joint"], "remove")
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        JointTolerance()
    end)
end)

RegisterNetEvent("consumables:client:UseAk47Blunt")
AddEventHandler("consumables:client:UseAk47Blunt", function()
    local time = Config.JointData["ak47blunt"]["smoking"]
    if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    end
    PRPCore.Functions.Progressbar("smoke_joint", "Smokin a Blunt..", time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["ak47blunt"], "remove")
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 400)
        Ak47BluntTolerance()
    end)
end)
RegisterNetEvent("consumables:client:UsePocoLocoWrap")
AddEventHandler("consumables:client:UsePocoLocoWrap", function()
    local time = Config.JointData["pocolocowrap"]["smoking"]
    if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    end
    PRPCore.Functions.Progressbar("smoke_joint", "Smokin a wrap..", time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["pocolocowrap"], "remove")
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 400)
        PocoLocoWrapTolerance()
    end)
end)
RegisterNetEvent("consumables:client:UseMhJoint")
AddEventHandler("consumables:client:UseMhJoint", function()
    local time = Config.JointData["mhjoint"]["smoking"]
    if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    end
    PRPCore.Functions.Progressbar("smoke_joint", "Smokin that hydro..", time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["mhjoint"], "remove")
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 100)
        MhJointTolerance()
        TriggerEvent('hspt:ClearLimp')
    end)
end)

RegisterNetEvent("consumables:client:UseAmnesiaJoint")
AddEventHandler("consumables:client:UseAmnesiaJoint", function()
    local time = Config.JointData["amnesiajoint"]["smoking"]
    if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
    end
    PRPCore.Functions.Progressbar("smoke_joint", "Smokin Amnesia..", time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["amnesiajoint"], "remove")
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 100)
        AmnesiaJointTolerance()
    end)
end)

RegisterNetEvent("consumables:client:UseBong")
AddEventHandler("consumables:client:UseBong", function()
    TriggerEvent('animations:client:EmoteCommandStart', {"bong"})
    PRPCore.Functions.Progressbar("smoke_joint", "dabbin..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items['mwax'], "remove")
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('prp-hud:Server:RelieveStress', 100)

        local onWeed = true
        local weedTime = 900

        while onWeed do
            StartScreenEffect("PeyoteOut")
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            StartScreenEffect("DrugsTrevorClownsFightIn")
            StartScreenEffect("DrugsTrevorClownsFight")
            Citizen.Wait(29500)
            StopScreenEffect("PeyoteOut")
            Citizen.Wait(1000)
            StartScreenEffect("PeyoteOut")
            Citizen.Wait(29500)
            weedTime = weedTime - 60
            if weedTime <= 0 then
                onWeed = false
                SetTimecycleModifier("default")
                SetPedMotionBlur(playerPed, false)
                StopScreenEffect("DrugsTrevorClownsFightIn")
                StopScreenEffect("DrugsTrevorClownsFight")
                StopScreenEffect("PeyoteOut")
            end
        end
    end)
end)

RegisterNetEvent("consumables:client:UseBrownie")
AddEventHandler("consumables:client:UseBrownie", function()
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    PRPCore.Functions.Progressbar("eat_something", "Munchin nom nom..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items['mbrownie'], "remove")
        TriggerServerEvent('prp-hud:Server:RelieveStress', 70)
        local onWeed = true
        local weedTime = 300

        while onWeed do
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            Citizen.Wait(10000)
            weedTime = weedTime - 10
            if weedTime <= 0 then
                onWeed = false
                SetTimecycleModifier("default")
                SetPedMotionBlur(playerPed, false)
            end
        end
    end)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function EquipParachuteAnim()
    loadAnimDict("clothingshirt")
    TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

local ParachuteEquiped = false

RegisterNetEvent("consumables:client:UseParachute")
AddEventHandler("consumables:client:UseParachute", function()
    EquipParachuteAnim()
    PRPCore.Functions.Progressbar("use_parachute", "Equipping parachute..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local ped = GetPlayerPed(-1)
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["parachute"], "remove")
        GiveWeaponToPed(ped, GetHashKey("GADGET_PARACHUTE"), 1, false)
        local ParachuteData = {
            outfitData = {
                ["bag"]   = { item = 7, texture = 0},  -- Nek / Das
            }
        }
        TriggerEvent('prp-clothing:client:loadOutfit', ParachuteData)
        ParachuteEquiped = true
        TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    end)
end)

RegisterNetEvent("consumables:client:ResetParachute")
AddEventHandler("consumables:client:ResetParachute", function()
    if ParachuteEquiped then
        EquipParachuteAnim()
        PRPCore.Functions.Progressbar("reset_parachute", "Repacking Parachute..", 40000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local ped = GetPlayerPed(-1)
            TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["parachute"], "add")
            local ParachuteRemoveData = {
                outfitData = {
                    ["bag"] = { item = -1, texture = 0} -- Nek / Das
                }
            }
            TriggerEvent('prp-clothing:client:loadOutfit', ParachuteRemoveData)
            TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
            TriggerServerEvent("prp-smallpenis:server:AddParachute")
            ParachuteEquiped = false
        end)
    else
        PRPCore.Functions.Notify("You dont have a parachute!", "error")
    end
end)

UsingArmor = false
currentVest = nil
currentVestTexture = nil
RegisterNetEvent("consumables:client:UseArmor")
AddEventHandler("consumables:client:UseArmor", function()
    local ped = GetPlayerPed(-1)
    UsingArmor = true
    SetPlayerCanDoDriveBy(ped, false)
    PRPCore.Functions.Progressbar("use_armor", "Equipping vest..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@franklin@getting_ready",
        anim = "002334_02_fras_v2_11_getting_dressed_exit",
        flags = 49,
    }, {}, {}, function()
        UsingArmor = false
        SetPlayerCanDoDriveBy(ped, true)
        currentVest = GetPedDrawableVariation(ped, 9)
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["armor"], "remove")
        TriggerServerEvent('hospital:server:SetArmor', 75)
        TriggerServerEvent('prp_smallresources:removeItem',"armor")
        SetPedArmour(ped, 75)
    end,function()
        UsingArmor = false
        SetPlayerCanDoDriveBy(ped, true)
    end)
end)

RegisterNetEvent("consumables:client:UseHeavyArmor")
AddEventHandler("consumables:client:UseHeavyArmor", function()
    local ped = GetPlayerPed(-1)
    UsingArmor = true
    SetPlayerCanDoDriveBy(ped, false)
    PRPCore.Functions.Progressbar("use_heavyarmor", "Equipping vest..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@franklin@getting_ready",
        anim = "002334_02_fras_v2_11_getting_dressed_exit",
        flags = 49,
    }, {}, {}, function()
        UsingArmor = false
        SetPlayerCanDoDriveBy(ped, true)
        currentVest = GetPedDrawableVariation(ped, 9)
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["heavyarmor"], "remove")
        TriggerServerEvent('hospital:server:SetArmor', 100)
        TriggerServerEvent('prp_smallresources:removeItem',"heavyarmor")
        SetPedArmour(ped, 100)
    end,function()
        UsingArmor = false
        SetPlayerCanDoDriveBy(ped, true)
    end)
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 250
        if UsingArmor then
            if IsPedInAnyVehicle(PlayerPedId()) then
                sleep = 0
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 92, true)
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent("consumables:client:ResetArmor")
AddEventHandler("consumables:client:ResetArmor", function()
    local ped = GetPlayerPed(-1)
    if currentVest ~= nil then
        PRPCore.Functions.Progressbar("remove_armor", "Removing vest..", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            currentVest = nil -- Reset to nil so we can't keep removing it.
            SetPedArmour(ped, 0)
            TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["heavyarmor"], "add")
            TriggerServerEvent("PRPCore:Server:AddItem", "heavyarmor", 1)
        end)
    else
        PRPCore.Functions.Notify("You dont have an armor vest..", "error")
    end
end)

RegisterNetEvent("consumables:client:DrinkAlcohol")
AddEventHandler("consumables:client:DrinkAlcohol", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    PRPCore.Functions.Progressbar("snort_coke", "Drinking..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("PRPCore:Server:RemoveItem", itemName, 1)
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            GetDrunk("kinda")
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
            GetDrunk("very")
        end

        TriggerServerEvent('prp-hud:Server:RelieveStress', 5)

    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        PRPCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Cokebaggy")
AddEventHandler("consumables:client:Cokebaggy", function()
    PRPCore.Functions.Progressbar("snort_coke", "Sorting..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("PRPCore:Server:RemoveItem", "cokebaggy", 1)
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["cokebaggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        CokeBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        PRPCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Crackbaggy")
AddEventHandler("consumables:client:Crackbaggy", function()
    PRPCore.Functions.Progressbar("snort_coke", "Smokin crack..", math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("PRPCore:Server:RemoveItem", "crack_baggy", 1)
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["crack_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        CrackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        PRPCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Acid")
AddEventHandler("consumables:client:Acid", function()
    PRPCore.Functions.Progressbar("snort_coke", "Taking a hit of acid..", math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("PRPCore:Server:RemoveItem", "acid", 1)
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["acid"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        exports["acidtrip"]:DoAcid(120000)
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        PRPCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:meth")
AddEventHandler("consumables:client:meth", function()
    PRPCore.Functions.Progressbar("snort_meth", "Smokin meth..", math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("PRPCore:Server:RemoveItem", "meth", 1)
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["meth"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1)) + 25)
        CrackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        PRPCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:EcstasyBaggy')
AddEventHandler('consumables:client:EcstasyBaggy', function()
    TaskPlayAnim(GetPlayerPed(-1), "mp_suicide", "pill", 8.0, 1.0, 3000, 49, 0, 0, 0, 0)
    PRPCore.Functions.Progressbar("use_ecstasy", "Popping X", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("PRPCore:Server:RemoveItem", "xtcbaggy", 1)
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["xtcbaggy"], "remove")
        local newArmor = tonumber(GetPedArmour(GetPlayerPed(-1))) + 10
        AddArmourToPed(GetPlayerPed(-1), newArmor)
        TriggerServerEvent('hospital:server:SetArmor', newArmor)
        EcstasyEffect()
    end, function() -- Cancel
        PRPCore.Functions.Notify("Failed", "error")
    end)
end)

RegisterNetEvent("consumables:client:Eat")
AddEventHandler("consumables:client:Eat", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    PRPCore.Functions.Progressbar("eat_something", "Munchin nom nom..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("PRPCore:Server:SetMetaData", "hunger", PRPCore.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
        if itemName == "coffeebeans" or itemName == "wangsushi" then TriggerServerEvent('prp-hud:Server:RelieveStress', 2) end
        if itemName == "redpopsicle_acid" then
            PRPCore.Functions.Notify("Uh oh.. this isn't what it seems...", "success", 10000)
            exports["acidtrip"]:DoAcid(120000)
        end
    end)
end)

RegisterNetEvent("consumables:client:UseShavers")
AddEventHandler("consumables:client:UseShavers", function()

    local pos = GetEntityCoords(GetPlayerPed(-1))
    local ClosestPlayer, Distance = PRPCore.Functions.GetClosestPlayer()
    local ClosestPlayerID = GetPlayerServerId(ClosestPlayer)

    if Distance < 1.0 then
        PRPCore.Functions.TriggerCallback('police:server:isPlayerHandcuffed', function(result)
            retval = result

            local DrillObject = CreateObject(GetHashKey("prop_clippers_01"), pos.x, pos.y, pos.z, true, true, true)
            AttachEntityToEntity(DrillObject, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.14, 0, -0.01, 90.0, 90.0, 180.0, true, true, false, true, 1, true)

            PRPCore.Functions.Progressbar("xx", "Shaving..", math.random(1000, 3000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@heists@fleeca_bank@drilling",
                anim = "drill_straight_idle",
                flags = 0,
            }, {}, {}, function() -- Done
                StopAnimTask(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                DetachEntity(DrillObject, true, true)
                DeleteObject(DrillObject)

                local StillClosestPlayer, StillDistance = PRPCore.Functions.GetClosestPlayer()
                if StillClosestPlayer == ClosestPlayer and StillDistance < 1.0 then
                    TriggerServerEvent("consumables:server:RemoveHair", ClosestPlayerID)
                    PRPCore.Functions.Notify("Shaved!")
                else
                    PRPCore.Functions.Notify("person moved!", "error")
                end

            end, function() -- Cancel
                StopAnimTask(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                DetachEntity(DrillObject, true, true)
                DeleteObject(DrillObject)
                PRPCore.Functions.Notify("Failed!", "error")
            end)

        end, ClosestPlayerID)
    end

end)

RegisterNetEvent("consumables:client:RemoveHair")
AddEventHandler("consumables:client:RemoveHair",function(PlayerID)
    SetPedComponentVariation(GetPlayerPed(-1), 2, 0, 1, 2)
end)

RegisterNetEvent("smallresources:remove")
AddEventHandler("smallresources:remove",function()
    PlayerJob = PRPCore.Functions.GetPlayerData().job

    if PlayerJob.name == "police" then
        local obj, dist = PRPCore.Functions.GetClosestObject('prop_cs_heist_bag_02', GetEntityCoords(GetPlayerPed(-1)))
        DeleteObject(obj)
    end
end)

RegisterNetEvent("consumables:client:Drink")
AddEventHandler("consumables:client:Drink", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    PRPCore.Functions.Progressbar("drink_something", "Drinkin..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("PRPCore:Server:SetMetaData", "thirst", PRPCore.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])

        if itemName == "latte" then
            PRPCore.Functions.Notify("Your hands start to tremble, you feel like you can run a marathon!", "success", 10000)
            local timer = 0
            while timer < 300 do
                -- ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.01)
                ResetPlayerStamina(PlayerId())
                Citizen.Wait(2000)
                timer = timer + 2
            end
        end
        if itemName == "water_bottle_acid" then
            PRPCore.Functions.Notify("Uh oh.. this isn't what it seems...", "success", 10000)
            exports["acidtrip"]:DoAcid(120000)
        end
    end)
end)

function EcstasyEffect()
    local startStamina = 30
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
        Citizen.Wait(1000)
        startStamina = startStamina - 1
        --RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if math.random(1, 100) < 6 and IsPedRunning(GetPlayerPed(-1)) then
        SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    --RevertToStressMultiplier()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if jointTolerance <= Config.JointData["joint"]["tolerance"] then
            Citizen.Wait(Config.JointData["joint"]["comedown"])
            jointTolerance = Config.JointData["joint"]["tolerance"]
        else
            Citizen.Wait(2000)
        end
    end
end)

function JointTolerance()
    local armor = Config.JointData["joint"]["armor"]
    local stress = Config.JointData["joint"]["stress"]

    AddArmourToPed(GetPlayerPed(-1), armor)
    TriggerServerEvent('prp-hud:Server:RelieveStress', stress)
    TriggerServerEvent('hospital:server:SetArmor', GetPedArmour(GetPlayerPed(-1)))
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    jointTolerance = jointTolerance - 1
    if jointTolerance <= 0 then
        JointEffect()
    end
end

function JointEffect()
    local onWeed = true
    local weedTime = Config.JointData["joint"]["highTime"]
    local id = PRPCore.Functions.GetPlayerData().citizenid
    local IsHigh = {}

    IsHigh[id] = true
    TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)

    Citizen.CreateThread(function()
        while onWeed do
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            Citizen.Wait(10000)
            SetTimecycleModifier("default")
            SetPedMotionBlur(playerPed, false)
            Citizen.Wait(5000)
            StartScreenEffect("DrugsMichaelAliensFightIn", 2.5, 0)
            StartScreenEffect("DrugsMichaelAliensFight", 2.5, 0)
            Citizen.Wait(2500)
            StartScreenEffect("DrugsMichaelAliensFightOut", 2.5, 0)
            Citizen.Wait(2500)
            StopScreenEffect("DrugsMichaelAliensFightIn")
            StopScreenEffect("DrugsMichaelAliensFight")
            StopScreenEffect("DrugsMichaelAliensFightOut")
            weedTime = weedTime - 20
            if weedTime <= 0 then
                onWeed = false
                IsHigh[id] = nil
                TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if ak47BluntTolerance <= Config.JointData["ak47blunt"]["tolerance"] then
            Citizen.Wait(Config.JointData["ak47blunt"]["comedown"])
            ak47BluntTolerance = Config.JointData["ak47blunt"]["tolerance"]
        else
            Citizen.Wait(2000)
        end
    end
end)

function Ak47BluntTolerance()
    local armor = Config.JointData["ak47blunt"]["armor"]
    local stress = Config.JointData["ak47blunt"]["stress"]

    AddArmourToPed(GetPlayerPed(-1), armor)
    TriggerServerEvent('prp-hud:Server:RelieveStress', stress)
    TriggerServerEvent('hospital:server:SetArmor', GetPedArmour(GetPlayerPed(-1)))
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    ak47BluntTolerance = ak47BluntTolerance - 1
    if ak47BluntTolerance <= 0 then
        Ak47BluntEffect()
    end
end

function Ak47BluntEffect()
    local onWeed = true
    local weedTime = Config.JointData["ak47blunt"]["highTime"]
    local id = PRPCore.Functions.GetPlayerData().citizenid
    local IsHigh = {}

    IsHigh[id] = true
    TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)

    Citizen.CreateThread(function()
        while onWeed do
            StartScreenEffect("DrugsMichaelAliensFightIn", 2.5, 0)
            StartScreenEffect("DrugsMichaelAliensFight", 2.5, 0)
            Citizen.Wait(2500)
            StartScreenEffect("DrugsMichaelAliensFightOut", 2.5, 0)
            Citizen.Wait(6500)
            StopScreenEffect("DrugsMichaelAliensFightIn")
            StopScreenEffect("DrugsMichaelAliensFight")
            StopScreenEffect("DrugsMichaelAliensFightOut")
            Citizen.Wait(1000)
            weedTime = weedTime - 10
            if weedTime <= 0 then
                onWeed = false
                IsHigh[id] = nil
                TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)
            end
        end
    end)
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if pocolocoWrapTolerance <= Config.JointData["pocolocowrap"]["tolerance"] then
            Citizen.Wait(Config.JointData["pocolocowrap"]["comedown"])
            pololocoWrapTolerance = Config.JointData["pocolocowrap"]["tolerance"]
        else
            Citizen.Wait(2000)
        end
    end
end)

function PocoLocoWrapTolerance()
    local armor = Config.JointData["pocolocowrap"]["armor"]
    local stress = Config.JointData["pocolocowrap"]["stress"]

    AddArmourToPed(GetPlayerPed(-1), armor)
    TriggerServerEvent('prp-hud:Server:RelieveStress', stress)
    TriggerServerEvent('hospital:server:SetArmor', GetPedArmour(GetPlayerPed(-1)))
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    pocolocoWrapTolerance = pocolocoWrapTolerance - 1
    if pocolocoWrapTolerance <= 0 then
        PocoLocoWrapEffect()
    end
end

function PocoLocoWrapEffect()
    local onWeed = true
    local weedTime = Config.JointData["pocolocowrap"]["highTime"]
    local id = PRPCore.Functions.GetPlayerData().citizenid
    local IsHigh = {}

    IsHigh[id] = true
    TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)

    Citizen.CreateThread(function()
        while onWeed do
            StartScreenEffect("DrugsMichaelAliensFightIn", 2.5, 0)
            StartScreenEffect("DrugsMichaelAliensFight", 2.5, 0)
            Citizen.Wait(2500)
            StartScreenEffect("DrugsMichaelAliensFightOut", 2.5, 0)
            Citizen.Wait(6500)
            StopScreenEffect("DrugsMichaelAliensFightIn")
            StopScreenEffect("DrugsMichaelAliensFight")
            StopScreenEffect("DrugsMichaelAliensFightOut")
            Citizen.Wait(1000)
            weedTime = weedTime - 10
            if weedTime <= 0 then
                onWeed = false
                IsHigh[id] = nil
                TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if mhJointTolerance <= Config.JointData["mhjoint"]["tolerance"] then
            Citizen.Wait(Config.JointData["mhjoint"]["comedown"])
            mhJointTolerance = Config.JointData["mhjoint"]["tolerance"]
        else
            Citizen.Wait(2000)
        end
    end
end)

function MhJointTolerance()
    local armor = Config.JointData["mhjoint"]["armor"]
    local stress = Config.JointData["mhjoint"]["stress"]

    AddArmourToPed(GetPlayerPed(-1), armor)
    TriggerServerEvent('prp-hud:Server:RelieveStress', stress)
    TriggerServerEvent('hospital:server:SetArmor', GetPedArmour(GetPlayerPed(-1)))
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})

    mhJointTolerance = mhJointTolerance - 1

    if mhJointTolerance <= 0 then
        MhJointEffect()
    end

end

function MhJointEffect()
    local onWeed = true
    local weedTime = Config.JointData["mhjoint"]["highTime"]
    local id = PRPCore.Functions.GetPlayerData().citizenid
    local IsHigh = {}

    IsHigh[id] = true
    TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)

    Citizen.CreateThread(function()
        while onWeed do
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            Citizen.Wait(10000)
            weedTime = weedTime - 10
            if weedTime <= 0 then
                SetTimecycleModifier("default")
                SetPedMotionBlur(playerPed, false)
                onWeed = false
                IsHigh[id] = nil
                TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if amnesiaJointTolerance <= Config.JointData["amnesiajoint"]["tolerance"] then
            Citizen.Wait(Config.JointData["amnesiajoint"]["comedown"])
            amnesiaJointTolerance = Config.JointData["amnesiajoint"]["tolerance"]
        else
            Citizen.Wait(2000)
        end
    end
end)

function AmnesiaJointTolerance()
    local armor = Config.JointData["amnesiajoint"]["armor"]
    local stress = Config.JointData["amnesiajoint"]["stress"]

    AddArmourToPed(GetPlayerPed(-1), armor)
    TriggerServerEvent('prp-hud:Server:RelieveStress', stress)
    TriggerServerEvent('hospital:server:SetArmor', GetPedArmour(GetPlayerPed(-1)))
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    amnesiaJointTolerance = amnesiaJointTolerance - 1
    if amnesiaJointTolerance <= 0 then
        AmnesiaJointEffect()
    end
end

function AmnesiaJointEffect()
    local onWeed = true
    local weedTime = Config.JointData["amnesiajoint"]["highTime"]
    local id = PRPCore.Functions.GetPlayerData().citizenid
    local IsHigh = {}

    IsHigh[id] = true
    TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)

    Citizen.CreateThread(function()
        while onWeed do
            StartScreenEffect("PeyoteOut")
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            StartScreenEffect("DrugsTrevorClownsFightIn")
            StartScreenEffect("DrugsTrevorClownsFight")
            Citizen.Wait(14500)
            StopScreenEffect("PeyoteOut")
            Citizen.Wait(1000)
            StartScreenEffect("PeyoteOut")
            Citizen.Wait(14500)
            weedTime = weedTime - 30
            if weedTime <= 0 then
                onWeed = false
                IsHigh[id] = nil
                TriggerServerEvent('prp-consumables:server:UpdateIsHigh', IsHigh)
                SetTimecycleModifier("default")
                SetPedMotionBlur(playerPed, false)
                StopScreenEffect("DrugsTrevorClownsFightIn")
                StopScreenEffect("DrugsTrevorClownsFight")
                StopScreenEffect("PeyoteOut")
            end
        end
    end)
end

function CrackBaggyEffect()
    local startStamina = 15
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.2)
    while startStamina > 0 do
        print(startStamina)
        Citizen.Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 0.5
        if math.random(1, 100) < 6 and IsPedRunning(GetPlayerPed(-1)) then
            SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
        end
        if math.random(1, 100) < 51 then
            AlienEffect()
        end
    end
    if math.random(1, 100) < 6 and IsPedRunning(GetPlayerPed(-1)) then
        SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function CokeBaggyEffect()
    local startStamina = 10
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    while startStamina > 0 do
        print(startStamina)
        Citizen.Wait(1000)
        if math.random(1, 100) < 20 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 6 and IsPedRunning(GetPlayerPed(-1)) then
            SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
        end
        if math.random(1, 300) < 10 then
            AlienEffect()
            Citizen.Wait(math.random(3000, 6000))
        end
    end
    if math.random(1, 100) < 6 and IsPedRunning(GetPlayerPed(-1)) then
        SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Citizen.Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Citizen.Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

function GetDrunk(drunklevel)

	-- Let's set some initial nils incase someone didn't pass things in properly.
	local drunkanim = nil
	local duration  = nil
	local message   = nil

	-- Let's determine how drunk to be
	if drunklevel == "very" then
		drunkanim = "move_m@drunk@moderatedrunk"
		duration  = 300000
		message   = 'alcohol_very_drunk'
	end

	if drunklevel == "kinda" then
		drunkanim = "move_m@drunk@slightlydrunk"
		duration  = 150000
		message   = 'alcohol_kinda_drunk'
	end

	if drunklevel == nil then
		drunkanim = "move_m@drunk@slightlydrunk"
		duration  = 150000
		message   = 'alcohol_kinda_drunk'
	end


	-- Set the scene to be drunk
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), drunkanim, true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	SetPedAccuracy(GetPlayerPed(-1), 0)
	DoScreenFadeIn(1000)
	Citizen.Wait(duration)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end
