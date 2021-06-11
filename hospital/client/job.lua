function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local currentGarage = 1
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn and PRPCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerJob.name == "doctor" or PlayerJob.name == "ambulance" then

                --for k, v in pairs(Config.Locations["duty"]) do
                --    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 5) then
                --        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                --            if onDuty then
                --                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Retire")
                --            else
                --                DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Enter Service")
                --            end
                --            if IsControlJustReleased(0, 38) then
                --                onDuty = not onDuty
                --                TriggerServerEvent("PRPCore:ToggleDuty")
                --                -- TriggerServerEvent("police:server:UpdateBlips")
                --
                --                TriggerServerEvent(
                --                    "prp-log:server:CreateLog", "emslogs", "On / Off Duty", onDuty and "green" or "red",
                --                    string.format("**%s** went **%s** duty", GetPlayerName(PlayerId()), onDuty and "on" or "off")
                --                )
                --            end
                --        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                --            DrawText3D(v.x, v.y, v.z, "In / Out Service")
                --        end
                --    end
                --end

                for k, v in pairs(Config.Locations["stash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        if (v.requiresOnDuty and onDuty) or not v.requiresOnDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Personal Locker")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("inventory:client:SetCurrentStash", "emsstash_"..PRPCore.Functions.GetPlayerData().citizenid)
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "emsstash_"..PRPCore.Functions.GetPlayerData().citizenid)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Personal Locker")
                            end  
                        end
                    end
                end

                if PlayerJob.name == "doctor" then
                    for k, v in pairs(Config.Locations["armory"]) do
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                            if onDuty then
                                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Safe")
                                    if IsControlJustReleased(0, 38) then
                                        TriggerServerEvent("inventory:server:OpenInventory", "shop", "hospital", Config.Items)
                                    end
                                elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                    DrawText3D(v.x, v.y, v.z, "Safe")
                                end
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["vehicle"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 5.5) then
                        DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 3.5) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store the vehicle")
                            else
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehicles")
                            end
                            if IsControlJustReleased(0, 38) then
                                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                    PRPCore.Functions.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                else
                                    MenuGarage()
                                    currentGarage = k
                                    Menu.hidden = not Menu.hidden
                                end
                            end
                            Menu.renderGUI()
                        end
                    end
                end

                for k, v in pairs(Config.Locations["helicopter"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                        if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store the helicopter")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the helicopter")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        PRPCore.Functions.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                    else
                                        local coords = Config.Locations["helicopter"][k]
                                        PRPCore.Functions.SpawnVehicle(Config.Helicopter, function(veh)
                                            SetVehicleNumberPlateText(veh, "LIFE"..tostring(math.random(1000, 9999)))
                                            SetEntityHeading(veh, coords.h)
                                            exports['LegacyFuel']:SetFuel(veh, 100.0)
                                            closeMenuFull()
                                            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                            SetVehicleEngineOn(veh, true, true)
                                        end, coords, true)
                                    end
                                end
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["labs"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                        if onDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Test Blood Sample")
                                if IsControlJustReleased(0, 38) then
                                    local bloodtube = nil
                                    for slot, item in pairs(PRPCore.Functions.GetPlayerData().items) do
                                        if item.name == "bloodtube" then
                                            bloodtube = item
                                            break
                                        end
                                    end
                                    if bloodtube ~= nil then
                                        if bloodtube.info["bloodtype"] ~= nil then
                                            PRPCore.Functions.Notify("Blood tube in slot "..bloodtube.slot.." has "..bloodtube.info["bloodtype"].. " blood", 10000)
                                        else
                                            PRPCore.Functions.Notify("Try to take another sample!", "error")
                                        end
                                        TriggerServerEvent("PRPCore:Server:RemoveItem", "bloodtube", 1, bloodtube.slot)
                                        TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items["bloodtube"], "remove")
                                    else
                                        PRPCore.Functions.Notify("You don't have any blood tubes!", "error")
                                    end
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Test Blood Sample")
                            end
                        end
                    end
                end
            end

            local currentHospital = 1
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isStatusChecking then
            for k, v in pairs(statusChecks) do
                local x,y,z = table.unpack(GetPedBoneCoords(statusCheckPed, v.bone))
                DrawText3D(x, y, z, v.label)
            end
        end

        if isHealingPerson then
            if not IsEntityPlayingAnim(GetPlayerPed(-1), healAnimDict, healAnim, 3) then
                loadAnimDict(healAnimDict)
                TaskPlayAnim(GetPlayerPed(-1), healAnimDict, healAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
            end
        end
    end
end)

RegisterNetEvent('hospital:client:SendAlert')
AddEventHandler('hospital:client:SendAlert', function(msg)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    TriggerEvent("chatMessage", "PAGER", "error", msg)
end)

RegisterNetEvent('911:client:SendAlert')
AddEventHandler('911:client:SendAlert', function(msg, blipSettings)
    if (PlayerJob.name == "police" or PlayerJob.name == "ambulance" or PlayerJob.name == "doctor") and onDuty then
        PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent("chatMessage", "911-DISPATCH", "error", msg)

        if blipSettings ~= nil then
            local transG = 250
            local blip = AddBlipForCoord(blipSettings.x, blipSettings.y, blipSettings.z)
            SetBlipSprite(blip, blipSettings.sprite)
            SetBlipColour(blip, blipSettings.color)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, blipSettings.scale)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(blipSettings.text)
            EndTextCommandSetBlipName(blip)
            while transG ~= 0 do
                Wait(180 * 4)
                transG = transG - 1
                SetBlipAlpha(blip, transG)
                if transG == 0 then
                    SetBlipSprite(blip, 2)
                    RemoveBlip(blip)
                    return
                end
            end
        end
    end
end)

RegisterNetEvent('hospital:client:AiCall')
AddEventHandler('hospital:client:AiCall', function()
    print("AI Call")
    local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
    local closestPed, closestDistance = PRPCore.Functions.GetClosestPed(coords, PlayerPeds)
    local gender = PRPCore.Functions.GetPlayerData().gender
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    if closestDistance < 50.0 and closestPed ~= 0 then
        MakeCall(closestPed, gender, street1, street2)
    end
end)

function MakeCall(ped, male, street1, street2)
    local callAnimDict = "cellphone@"
    local callAnim = "cellphone_call_listen_base"
    local rand = (math.random(6,9) / 100) + 0.3
    local rand2 = (math.random(6,9) / 100) + 0.3
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local blipsettings = {
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sprite = 280,
        color = 4,
        scale = 1.5,
        text = "Downed Person"
    }

    if math.random(10) > 5 then
        rand = 0.0 - rand
    end

    if math.random(10) > 5 then
        rand2 = 0.0 - rand2
    end

    local moveto = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), rand, rand2, 0.0)

    TaskGoStraightToCoord(ped, moveto, 2.5, -1, 0.0, 0.0)
    SetPedKeepTask(ped, true)

    local dist = GetDistanceBetweenCoords(moveto, GetEntityCoords(ped), false)

    while dist > 3.5 and isDead do
        TaskGoStraightToCoord(ped, moveto, 2.5, -1, 0.0, 0.0)
        dist = GetDistanceBetweenCoords(moveto, GetEntityCoords(ped), false)
        Citizen.Wait(100)
    end

    ClearPedTasksImmediately(ped)
    TaskLookAtEntity(ped, GetPlayerPed(-1), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, GetPlayerPed(-1), 5500)

    Citizen.Wait(3000)

    --TaskStartScenarioInPlace(ped,"WORLD_HUMAN_STAND_MOBILE", 0, 1)
    loadAnimDict(callAnimDict)
    TaskPlayAnim(ped, callAnimDict, callAnim, 1.0, 1.0, -1, 49, 0, 0, 0, 0)

    SetPedKeepTask(ped, true)

    Citizen.Wait(5000)

    TriggerServerEvent("hospital:server:MakeDeadCall", blipsettings, male, street1, street2)

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)
end

RegisterNetEvent('hospital:client:RevivePlayer')
AddEventHandler('hospital:client:RevivePlayer', function()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "doctor" or PlayerData.job.name == "ambulance" then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                isHealingPerson = true
                PRPCore.Functions.Progressbar("hospital_revive", "Help person up", 5000, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = healAnimDict,
                    anim = healAnim,
                    flags = 16,
                }, {}, {}, function() -- Done
                    isHealingPerson = false
                    StopAnimTask(GetPlayerPed(-1), healAnimDict, "exit", 1.0)
                    PRPCore.Functions.Notify("You've helped the person, and got paid $250!")
                    TriggerServerEvent("hospital:server:RevivePlayer", playerId)
                    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
                    TriggerServerEvent("hospital:server:GetPaid")
                end, function() -- Cancel
                    isHealingPerson = false
                    StopAnimTask(GetPlayerPed(-1), healAnimDict, "exit", 1.0)
                    PRPCore.Functions.Notify("Failed!", "error")
                    TriggerEvent('hspt:ClearLimp')
                end)
            end
        end
    end)
end)


RegisterNetEvent('hospital:client:CheckStatus')
AddEventHandler('hospital:client:CheckStatus', function()
    if PRPCore.Functions.GetPlayerData().job.name == "doctor" or PRPCore.Functions.GetPlayerData().job.name == "ambulance" or PRPCore.Functions.GetPlayerData().job.name == "police" then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 5.0 then
            local playerId = GetPlayerServerId(player)
            statusCheckPed = GetPlayerPed(player)
            PRPCore.Functions.TriggerCallback('hospital:GetPlayerStatus', function(result)
                if result ~= nil then
                    for k, v in pairs(result) do
                        if k ~= "BLEED" and k ~= "WEAPONWOUNDS" then
                            table.insert(statusChecks, {bone = Config.BoneIndexes[k], label = v.label .." (".. Config.WoundStates[v.severity] ..")"})
                        elseif result["WEAPONWOUNDS"] ~= nil then
                            for k, v in pairs(result["WEAPONWOUNDS"]) do
                                TriggerEvent("chatMessage", "STATUS CHECK", "error", WeaponDamageList[v])
                            end
                        elseif result["BLEED"] > 0 then
                            TriggerEvent("chatMessage", "STATUS CHECK", "error", "Is "..Config.BleedingStates[v].label)
                        end
                    end
                    isStatusChecking = true
                    statusCheckTime = Config.CheckTime
                end
            end, playerId)
        end
    end
end)

RegisterNetEvent('hospital:client:CheckHealth')
AddEventHandler('hospital:client:CheckHealth', function()
    if PRPCore.Functions.GetPlayerData().job.name == "doctor" or PRPCore.Functions.GetPlayerData().job.name == "ambulance" or PRPCore.Functions.GetPlayerData().job.name == "police" then
        local player, distance = PRPCore.Functions.GetClosestPlayer()
        local targetped = GetPlayerPed(player)
        if player ~= -1 and distance < 5.0 then
            PRPCore.Functions.Notify("Health of patient: ".. GetEntityHealth(targetped).." Max Health: "..GetEntityMaxHealth(targetped), "error", 10000)
        end
    end
end)

RegisterNetEvent('hospital:client:TreatWounds')
AddEventHandler('hospital:client:TreatWounds', function()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        if PRPCore.Functions.GetPlayerData().job.name == "doctor" or PRPCore.Functions.GetPlayerData().job.name == "ambulance" then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                isHealingPerson = true
                PRPCore.Functions.Progressbar("hospital_healwounds", "Heal wounds..", 5000, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = healAnimDict,
                    anim = healAnim,
                    flags = 16,
                }, {}, {}, function() -- Done
                    isHealingPerson = false
                    StopAnimTask(GetPlayerPed(-1), healAnimDict, "exit", 1.0)
                    PRPCore.Functions.Notify("You helped the person!")
                    TriggerServerEvent("hospital:server:TreatWounds", playerId)
                end, function() -- Cancel
                    isHealingPerson = false
                    StopAnimTask(GetPlayerPed(-1), healAnimDict, "exit", 1.0)
                    PRPCore.Functions.Notify("Failed!", "error")
                end)
            end
        end
    end)
end)

function MenuGarage(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("My vehicles", "VehicleList", isDown)
    Menu.addButton("Close menu", "closeMenuFull", nil)
end

function VehicleList(isDown)
    ped = GetPlayerPed(-1);
    local PlayerData = PRPCore.Functions.GetPlayerData()
    MenuTitle = "Vehicles:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        if (v.minGrade <= PlayerData.job.grade.level and v.job == 'ambulance') or (v.job == 'ammbulance' and PlayerData.job.name == 'doctor') or (PlayerData.job.name == 'doctor' and v.job =='doctor' and v.minGrade <= PlayerData.job.grade.level) then
            Menu.addButton(Config.Vehicles[k].label, "TakeOutVehicle", {k, isDown}, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
        end
    end

    Menu.addButton("Back", "MenuGarage",nil)
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"][currentGarage]
    PRPCore.Functions.SpawnVehicle(vehicleInfo[1], function(veh)
        SetVehicleNumberPlateText(veh, "AMBU"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end
