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
        if isLoggedIn then
            if PlayerJob.name == "police" then
                local player = GetPlayerPed(-1)
                local pos = GetEntityCoords(player)
                local isCiu = PlayerJob.grade.level >= Config.Locations.ciu.gradeLock
                
                -- CIU doors
                if isCiu then
                    for _, v in ipairs(Config.Locations.ciu.entrances) do
                        for k, x in pairs(v) do
                            local dist = GetDistanceBetweenCoords(pos, x.x, x.y, x.z, true)

                            if dist < 1 then
                                DrawText3D(x.x, x.y, x.z, string.format("~g~E~w~ - %s", x.txt))
                                
                                if IsControlJustReleased(0, 38) then
                                    if k == "inside" then
                                        SetEntityCoords(player, v.outside.x, v.outside.y, v.outside.z)
                                        SetEntityHeading(player, v.outside.h)
                                    else
                                        SetEntityCoords(player, v.inside.x, v.inside.y, v.inside.z)
                                        SetEntityHeading(player, v.inside.h)
                                    end

                                    Citizen.Wait(50)
                                end
                            end
                        end
                    end
                end

                --for k, v in pairs(Config.Locations["duty"]) do
                --    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 5) then
                --        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                --            if not onDuty then
                --                DrawText3D(v.x,v.y,v.z, "~g~E~w~ - Go on duty")
                --            else
                --                DrawText3D(v.x,v.y,v.z, "~r~E~w~ - Go off duty")
                --            end
                --            if IsControlJustReleased(0, 38) then
                --                onDuty = not onDuty
                --                TriggerServerEvent("police:server:UpdateCurrentCops")
                --                TriggerServerEvent("PRPCore:ToggleDuty")
                --                -- TriggerServerEvent("police:server:UpdateBlips")
                --
                --                TriggerServerEvent(
                --                    "prp-log:server:CreateLog", "leologs", "On / Off Duty", onDuty and "green" or "red",
                --                    string.format("**%s** went **%s** duty", GetPlayerName(PlayerId()), onDuty and "on" or "off")
                --                )
                --            end
                --        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                --            DrawText3D(v.x, v.y, v.z, "On/Off Duty")
                --        end
                --    end
                --end

                for k, v in pairs(Config.Locations["donuts"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                        DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Consume coffee and donuts")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("animations:client:EmoteCommandStart", {"coffee"})
                            PRPCore.Functions.Progressbar(
                                "drink_coffee", "Drink Skeve's Sumatran Coffee", 15000, false, false,
                                {
                                    disableMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {}, {}, {},
                                function() -- On Finish
                                    TriggerEvent("animations:client:EmoteCommandStart", {'c'})
                                    TriggerServerEvent("PRPCore:Server:SetMetaData", "thirst", 100)
                                end,
                                function() -- On cancel
                                end
                            )

                            Citizen.Wait(16000)

                            TriggerEvent('animations:client:EmoteCommandStart', {"donut"})
                            PRPCore.Functions.Progressbar(
                                "eat_donut", "Eat Skeve's Donut", 5000, false, false,
                                {
                                    disableMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {}, {}, {}, 
                                function() -- Done
                                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                                    TriggerServerEvent('prp-hud:Server:RelieveStress', 100)
                                    TriggerServerEvent("PRPCore:Server:SetMetaData", "hunger", 100)
                                end,
                                function () -- Cancel
                                end
                            )
                        end
                    end
                end

                if isCiu then
                    for k, v in ipairs(Config.Locations.ciu.evidence) do
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - CIU Evidence")
                                if IsControlJustReleased(0, 38) then
                                    TriggerServerEvent("prp-log:server:CreateLog", "leologs", "Evidence", "orange", "**"..GetPlayerName(PlayerId()).."** Accessed Evidence 4")
                                    TriggerEvent("inventory:client:SetCurrentStash", "policeevidence4")
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "policeevidence4", {
                                        maxweight = 4000000,
                                        slots = 500,
                                    })
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3D(v.x, v.y, v.z, "CIU Evidence")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["trash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Trash")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("prp-log:server:CreateLog", "leologs", "Evidence", "orange", "**"..GetPlayerName(PlayerId()).."** Accessed Trashed")
                                TriggerEvent("inventory:client:SetCurrentStash", "policetrash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "policetrash", {
                                    maxweight = 4000000,
                                    slots = 300,
                                })
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "Trash")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["vehicle"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                         if onDuty then
                             DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                             if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                 if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store Vehicle")
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
                end

                if isCiu then
                    for i, v in ipairs(Config.Locations.ciu.vehicleLocations) do
                        local dist = GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true)
                        if dist < 7.5 then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if dist < 1.5 then
                                if IsPedInAnyVehicle(player, false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store CIU Vehicle")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - CIU Vehicles")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(player, false) then
                                        PRPCore.Functions.DeleteVehicle(GetVehiclePedIsIn(player))
                                    else
                                        CIUMenuGarage()
                                        currentGarage = i
                                        Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["impound"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                        if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store Vehicle")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehicles")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        PRPCore.Functions.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                    else
                                        MenuImpound()
                                        currentGarage = k
                                        Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["helicopter"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                        if (v.requiresOnDuty and onDuty) or not v.requiresOnDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store Air one")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Deploy Air one")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        PRPCore.Functions.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                    else
                                        local coords = Config.Locations["helicopter"][k]
                                        if v.isCiu and isCiu then
                                            PRPCore.Functions.SpawnVehicle(Config.CIUHelicopter, function(veh)
                                                SetVehicleNumberPlateText(veh, "CIUZ" .. tostring(math.random(1000, 9999)))
                                                SetEntityHeading(veh, coords.h)
                                                exports['LegacyFuel']:SetFuel(veh, 100.0)
                                                closeMenuFull()
                                                TaskWarpPedIntoVehicle(player, veh, -1)
                                                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                            end, coords, true)
                                        else
                                            PRPCore.Functions.SpawnVehicle(Config.Helicopter, function(veh)
                                                SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                                                SetEntityHeading(veh, coords.h)
                                                exports['LegacyFuel']:SetFuel(veh, 100.0)
                                                closeMenuFull()
                                                TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                                                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                                SetVehicleEngineOn(veh, true, true)
                                                SetVehicleLivery(veh, 2)
                                            end, coords, true)
                                        end
                                    end
                                end
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["armory"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) and PlayerJob.grade.level > 0 then
                        if (v.requiresOnDuty and onDuty) or not v.requiresOnDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Armory")
                                if IsControlJustReleased(0, 38) then
                                    SetWeaponSeries()
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "police", Config.Items)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Armory")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["armory2"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) and PlayerJob.grade.level > 4 then
                        if (v.requiresOnDuty and onDuty) or not v.requiresOnDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Armory")
                                if IsControlJustReleased(0, 38) then
                                    SetWeaponSeries()
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "police", Config.Items2)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Armory")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["stash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        if (v.requiresOnDuty and onDuty) or not v.requiresOnDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Personal Locker")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("inventory:client:SetCurrentStash", "policestash_"..PRPCore.Functions.GetPlayerData().citizenid)
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "policestash_"..PRPCore.Functions.GetPlayerData().citizenid)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Personal Locker")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["fingerprint"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        if onDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Scan Finger print")
                                if IsControlJustReleased(0, 38) then
                                    local player, distance = GetClosestPlayer()
                                    if player ~= -1 and distance < 2.5 then
                                        local playerId = GetPlayerServerId(player)
                                        TriggerServerEvent("police:server:showFingerprint", playerId)
                                    else
                                        PRPCore.Functions.Notify("Nobody around!", "error")
                                    end
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Finger Print")
                            end  
                        end
                    end
                end
            else
                Citizen.Wait(2000)
            end
        end
    end
end)

local inFingerprint = false
local FingerPrintSessionId = nil

RegisterNetEvent('police:client:showFingerprint')
AddEventHandler('police:client:showFingerprint', function(playerId)
    openFingerprintUI()
    FingerPrintSessionId = playerId
end)

RegisterNetEvent('police:client:showFingerprintId')
AddEventHandler('police:client:showFingerprintId', function(fid)
    SendNUIMessage({
        type = "updateFingerprintId",
        fingerprintId = fid
    })
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNUICallback('doFingerScan', function(data)
    TriggerServerEvent('police:server:showFingerprintId', FingerPrintSessionId)
end)

function openFingerprintUI()
    SendNUIMessage({
        type = "fingerprintOpen"
    })
    inFingerprint = true
    SetNuiFocus(true, true)
end

RegisterNUICallback('closeFingerprint', function()
    SetNuiFocus(false, false)
    inFingerprint = false
end)

RegisterNetEvent('police:client:SendEmergencyMessage')
AddEventHandler('police:client:SendEmergencyMessage', function(message)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    
    TriggerServerEvent("police:server:SendEmergencyMessage", coords, message)
    TriggerEvent("police:client:CallAnim")
end)

RegisterNetEvent('police:client:EmergencySound')
AddEventHandler('police:client:EmergencySound', function()
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent('police:client:CallAnim')
AddEventHandler('police:client:CallAnim', function()
    local isCalling = true
    local callCount = 5
    loadAnimDict("cellphone@")   
    TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 3.0, -1, -1, 49, 0, false, false, false)
    Citizen.Wait(1000)
    Citizen.CreateThread(function()
        while isCalling do
            Citizen.Wait(1000)
            callCount = callCount - 1
            if callCount <= 0 then
                isCalling = false
                StopAnimTask(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 1.0)
            end
        end
    end)
end)

RegisterNetEvent('police:client:ImpoundVehicle')
AddEventHandler('police:client:ImpoundVehicle', function(fullImpound, price)
    local vehicle = PRPCore.Functions.GetClosestVehicle()
    if vehicle ~= 0 and vehicle ~= nil then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local vehpos = GetEntityCoords(vehicle)
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent("police:server:Impound", plate, fullImpound, price)
            PRPCore.Functions.DeleteVehicle(vehicle)
        end
    end
end)

RegisterNetEvent('police:client:ImpoundVehicle2')
AddEventHandler('police:client:ImpoundVehicle2', function(args, vehicle)
    local fullImpound, price = args[1], args[2]
    --local vehicle = PRPCore.Functions.GetClosestVehicle()
    if vehicle ~= 0 and vehicle ~= nil then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local vehpos = GetEntityCoords(vehicle)
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent("police:server:Impound", plate, fullImpound, price)
            if not NetworkHasControlOfEntity(vehicle) then
                local vehicleOwnerId = NetworkGetEntityOwner(vehicle)

                TriggerServerEvent("vehicle:server:impound", GetPlayerServerId(vehicleOwnerId), VehToNet(vehicle))
            else
                PRPCore.Functions.DeleteVehicle(vehicle)
            end

        end
    end
end)

RegisterNetEvent('police:client:CheckStatus')
AddEventHandler('police:client:CheckStatus', function()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "police" then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                PRPCore.Functions.TriggerCallback('police:GetPlayerStatus', function(result)
                    if result ~= nil then

                        for k, v in pairs(result) do
                            TriggerEvent("chatMessage", "STATUS", "warning", v)
                        end
                    end
                end, player)
            end
        end
    end)
end)

RegisterCommand("evidence", function(source, args)

    local name = args[1]

    if string.find(name, "caseid") then
        PRPCore.Functions.GetPlayerData(function(PlayerData)
            if PlayerData.job.name == "police" then
                local plyPed = PlayerPedId()
                local coord = GetPedBoneCoords(plyPed, 0x796e)
                local dist = GetDistanceBetweenCoords(coord, 474.64, -995.22, 26.27, true)
                local dist2 = GetDistanceBetweenCoords(coord, 1847.66, 3693.24, 30.26, true)
                local dist3 = GetDistanceBetweenCoords(coord, 1841.77, 3691.40, 30.26, true)
                local dist4 = GetDistanceBetweenCoords(coord, -439.60, 6010.09, 27.99, true)

                if dist < 2.5 then
                    TriggerServerEvent("prp-log:server:CreateLog", "leologs", "Entered Files", "red", "**"..GetPlayerName(PlayerId()).."** accessed evidence ".. name)
                    TriggerEvent("inventory:client:SetCurrentStash", name)
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", name, {
                        maxweight = 20000000,
                        slots = 500,
                    })
                end

                if dist2 < 3.0 then
                    TriggerServerEvent("prp-log:server:CreateLog", "leologs", "Entered Files", "red", "**"..GetPlayerName(PlayerId()).."** accessed evidence ".. name)
                    TriggerEvent("inventory:client:SetCurrentStash", name)
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", name, {
                        maxweight = 20000000,
                        slots = 500,
                    })
                end

                if dist3 < 3.0 then
                    TriggerServerEvent("prp-log:server:CreateLog", "leologs", "Entered Files", "red", "**"..GetPlayerName(PlayerId()).."** accessed evidence ".. name)
                    TriggerEvent("inventory:client:SetCurrentStash", name)
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", name, {
                        maxweight = 20000000,
                        slots = 500,
                    })
                end

                if dist4 < 3.0 then
                    TriggerServerEvent("prp-log:server:CreateLog", "leologs", "Entered Files", "red", "**"..GetPlayerName(PlayerId()).."** accessed evidence ".. name)
                    TriggerEvent("inventory:client:SetCurrentStash", name)
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", name, {
                        maxweight = 20000000,
                        slots = 500,
                    })
                end
            end
        end)
      else
        PRPCore.Functions.Notify("Evidence must be like caseid_1.12", "error", 5000)
    end
end)

function MenuImpound()
    ped = GetPlayerPed(-1);
    MenuTitle = "Seizure"
    ClearMenu()
    Menu.addButton("Vehicles", "ImpoundVehicleList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
end

function ImpoundVehicleList()
    PRPCore.Functions.TriggerCallback("police:GetImpoundedVehicles", function(result)
        ped = GetPlayerPed(-1);
        MenuTitle = "Vehicles:"
        ClearMenu()

        if result == nil then
            PRPCore.Functions.Notify("There are no impounded vehicles", "error", 5000)
            closeMenuFull()
        else
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel

                Menu.addButton(PRPCore.Shared.Vehicles[v.vehicle]["name"], "TakeOutImpound", v, "Impounded", " Motor: " .. enginePercent .. "%", " Body: " .. bodyPercent.. "%", " Fuel: "..currentFuel.. "%")
            end
        end
            
        Menu.addButton("Back", "MenuImpound",nil)
    end)
end

function TakeOutImpound(vehicle)
    enginePercent = round(vehicle.engine / 10, 0)
    bodyPercent = round(vehicle.body / 10, 0)
    currentFuel = vehicle.fuel
    local coords = Config.Locations["impound"][currentGarage]
    PRPCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
        PRPCore.Functions.TriggerCallback('prp-garage:server:GetVehicleProperties', function(properties)
            PRPCore.Functions.SetVehicleProperties(veh, properties)
            SetVehicleNumberPlateText(veh, vehicle.plate)
            SetEntityHeading(veh, coords.h)
            exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
            doCarDamage(veh, vehicle)
            closeMenuFull()
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
        end, vehicle.plate)
    end, coords, true)
end

function MenuOutfits()
    ped = GetPlayerPed(-1);
    MenuTitle = "Outfits"
    ClearMenu()
    Menu.addButton("My outfits", "OutfitsLijst", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
end

function changeOutfit()
	Wait(200)
    loadAnimDict("clothingshirt")    	
	TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	Wait(3100)
	TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function OutfitsLijst()
    PRPCore.Functions.TriggerCallback('apartments:GetOutfits', function(outfits)
        ped = GetPlayerPed(-1);
        MenuTitle = "My Outfits :"
        ClearMenu()

        if outfits == nil then
            PRPCore.Functions.Notify("You have no saved outfits...", "error", 3500)
            closeMenuFull()
        else
            for k, v in pairs(outfits) do
                Menu.addButton(outfits[k].outfitname, "optionMenu", outfits[k]) 
            end
        end
        Menu.addButton("Back", "MenuOutfits",nil)
    end)
end

function optionMenu(outfitData)
    ped = GetPlayerPed(-1);
    MenuTitle = "What now?"
    ClearMenu()

    Menu.addButton("Choose Outfit", "selectOutfit", outfitData) 
    Menu.addButton("Delete Outfit", "removeOutfit", outfitData) 
    Menu.addButton("Back", "OutfitsLijst",nil)
end

function selectOutfit(oData)
    TriggerServerEvent('clothes:selectOutfit', oData.model, oData.skin)
    PRPCore.Functions.Notify(oData.outfitname.." chosen", "success", 2500)
    closeMenuFull()
    changeOutfit()
end

function removeOutfit(oData)
    TriggerServerEvent('clothes:removeOutfit', oData.outfitname)
    PRPCore.Functions.Notify(oData.outfitname.." is Deleted", "success", 2500)
    closeMenuFull()
end

function MenuGarage()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "VehicleList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
end

function CIUMenuGarage()
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "CIUVehicleList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil)
end

function VehicleList(isDown)
    ped = GetPlayerPed(-1);
    local PlayerData =  PRPCore.Functions.GetPlayerData()
    MenuTitle = "Vehicles:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        if v.minGrade <= PlayerData.job.grade.level then
            Menu.addButton(Config.Vehicles[k].label, "TakeOutVehicle", k, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
        end
    end
    Menu.addButton("Back", "MenuGarage",nil)
end

function CIUVehicleList(isDown)
    ped = GetPlayerPed(-1)
    local playerData = PRPCore.Functions.GetPlayerData()
    MenuTitle = "Vehicles:"
    ClearMenu()
    for k, v in pairs(Config.Locations.ciu.vehicles) do
        if v.minGrade <= playerData.job.grade.level then
            Menu.addButton(v.label, "TakeOutCIUVehicle", k, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
        end
    end
    Menu.addButton("Back", "MenuGarage", nil)
end

function TakeOutCIUVehicle(vehicleInfo)
    TakeOutVehicle(vehicleInfo, true)
end

function TakeOutVehicle(vehicleInfo, ciu)
    ciu = ciu or false
    local coords = ciu
        and Config.Locations.ciu.vehicleLocations[currentGarage]
        or Config.Locations["vehicle"][currentGarage]

    PRPCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        -- SetVehicleNumberPlateText(veh, "LSPD"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        TriggerServerEvent("inventory:server:addTrunkItems", GetVehicleNumberPlateText(veh), Config.CarItems)
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

function doCarDamage(currentVehicle, veh)
	smash = false
	damageOutside = false
	damageOutside2 = false 
	local engine = veh.engine + 0.0
	local body = veh.body + 0.0
	if engine < 200.0 then
		engine = 200.0
    end
    
    if engine  > 1000.0 then
        engine = 950.0
    end

	if body < 150.0 then
		body = 150.0
	end
	if body < 950.0 then
		smash = true
	end

	if body < 920.0 then
		damageOutside = true
	end

	if body < 920.0 then
		damageOutside2 = true
	end

    Citizen.Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)
	if smash then
		SmashVehicleWindow(currentVehicle, 0)
		SmashVehicleWindow(currentVehicle, 1)
		SmashVehicleWindow(currentVehicle, 2)
		SmashVehicleWindow(currentVehicle, 3)
		SmashVehicleWindow(currentVehicle, 4)
	end
	if damageOutside then
		SetVehicleDoorBroken(currentVehicle, 1, true)
		SetVehicleDoorBroken(currentVehicle, 6, true)
		SetVehicleDoorBroken(currentVehicle, 4, true)
	end
	if damageOutside2 then
		SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
	end
	if body < 1000 then
		SetVehicleBodyHealth(currentVehicle, 985.1)
	end
end

function SetCarItemsInfo()
	local items = {}
	for k, item in pairs(Config.CarItems) do
		local itemInfo = PRPCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = item.info,
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
		}
	end
	Config.CarItems = items
end

function IsArmoryWhitelist()
    local retval = false
    local citizenid = PRPCore.Functions.GetPlayerData().citizenid
    for k, v in pairs(Config.ArmoryWhitelist) do
        if v == citizenid then
            retval = true
        end
    end
    return retval
end

function SetWeaponSeries()
    for k, v in pairs(Config.Items.items) do
        if k < 6 then
            Config.Items.items[k].info.serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
        end
    end
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end