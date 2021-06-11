local closestStation = 0
local currentStation = 0
CurrentCops = 0
local currentFires = {}
local currentGate = 0

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local dist

        if PRPCore ~= nil then
            local inRange = false
            for k, v in pairs(Config.PowerStations) do
                dist = GetDistanceBetweenCoords(pos, Config.PowerStations[k].coords.x, Config.PowerStations[k].coords.y, Config.PowerStations[k].coords.z)
                if dist < 5 then
                    closestStation = k
                    inRange = true
                end
            end

            if not inRange then
                Citizen.Wait(1000)
                closestStation = 0
            end
        end
        Citizen.Wait(3)
    end
end)
local requiredItemsShowed = false
local requiredItems = {}
Citizen.CreateThread(function()
    Citizen.Wait(2000)
    requiredItems = {
        [1] = {name = PRPCore.Shared.Items["thermite"]["name"], image = PRPCore.Shared.Items["thermite"]["image"]},
    }
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        if PRPCore ~= nil then
            if closestStation ~= 0 then
                if not Config.PowerStations[closestStation].hit then
                    DrawMarker(2, Config.PowerStations[closestStation].coords.x, Config.PowerStations[closestStation].coords.y, Config.PowerStations[closestStation].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.1, 255, 255, 255, 155, 0, 0, 0, 1, 0, 0, 0)
                    local dist = GetDistanceBetweenCoords(pos, Config.PowerStations[closestStation].coords.x, Config.PowerStations[closestStation].coords.y, Config.PowerStations[closestStation].coords.z)
                    if dist < 1 then
                        if not requiredItemsShowed then
                            requiredItemsShowed = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        end
                    else
                        if requiredItemsShowed then
                            requiredItemsShowed = false
                            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                        end
                    end
                end
            else
                Citizen.Wait(1500)
            end
        end

        Citizen.Wait(1)
    end
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent("thermite:StartFire")
AddEventHandler("thermite:StartFire", function(coords, maxChildren, isGasFire)
    if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, GetEntityCoords(GetPlayerPed(-1))) < 100 then
        local pos = {
            x = coords.x, 
            y = coords.y,
            z = coords.z,
        }
        pos.z = pos.z - 0.9
        local fire = StartScriptFire(pos.x, pos.y, pos.z, maxChildren, isGasFire)
        table.insert(currentFires, fire)
    end
end)

RegisterNetEvent("thermite:StopFires")
AddEventHandler("thermite:StopFires", function()
    for k, v in ipairs(currentFires) do
        RemoveScriptFire(v)
    end
end)

RegisterNetEvent('thermite:UseThermite')
AddEventHandler('thermite:UseThermite', function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    if closestStation ~= 0 then
        if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
        end
        local dist = GetDistanceBetweenCoords(pos, Config.PowerStations[closestStation].coords.x, Config.PowerStations[closestStation].coords.y, Config.PowerStations[closestStation].coords.z)
        if dist < 1.5 then
            if CurrentCops >= Config.MinThermite then
                if not Config.PowerStations[closestStation].hit then
                    TriggerServerEvent('prp-bankrobbery:server:PoliceAlertMessage', 'Power Outage Detected!!', pos, true)
                    loadAnimDict("weapon@w_sp_jerrycan")
                    TaskPlayAnim(GetPlayerPed(-1), "weapon@w_sp_jerrycan", "fire", 3.0, 3.9, 180, 49, 0, 0, 0, 0)
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        action = "openThermite",
                        amount = math.random(1, 1),
                    })
                    currentStation = closestStation
                else
                    PRPCore.Functions.Notify("Fuses have been lit..", "error")
                end
            else
                PRPCore.Functions.Notify("Not enough Police (2 req)", "error")
            end
        end
    elseif currentThermiteGate ~= 0 then
        if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
        end
        if CurrentCops >= Config.MinThermite then
            currentGate = currentThermiteGate
            loadAnimDict("weapon@w_sp_jerrycan")
            TaskPlayAnim(GetPlayerPed(-1), "weapon@w_sp_jerrycan", "fire", 3.0, 3.9, -1, 49, 0, 0, 0, 0)
            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = "openThermite",
                amount = math.random(1, 1),
            })
        else
            PRPCore.Functions.Notify("Not enough Police (2 req)", "error")
        end
    end
end)

RegisterNetEvent('prp-bankrobbery:client:SetStationStatus')
AddEventHandler('prp-bankrobbery:client:SetStationStatus', function(key, isHit)
    Config.PowerStations[key].hit = isHit
end)

RegisterNUICallback('thermiteclick', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('thermitefailed', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
    TriggerServerEvent("PRPCore:Server:RemoveItem", "thermite", 1)
    TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items["thermite"], "remove")
    ClearPedTasks(GetPlayerPed(-1))
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local randTime = math.random(10000, 15000)
    CreateFire(coords, randTime)
end)

RegisterNUICallback('thermitesuccess', function()
    ClearPedTasks(GetPlayerPed(-1))
    local time = 3
    local coords = GetEntityCoords(GetPlayerPed(-1))
    while time > 0 do 
        PRPCore.Functions.Notify("Thermite detonating in " .. time .. "..")
        Citizen.Wait(1000)
        time = time - 1
    end
    local randTime = math.random(10000, 15000)
    CreateFire(coords, randTime)
    if currentStation ~= 0 then
        PRPCore.Functions.Notify("The fuses are broken", "success")
        TriggerServerEvent("prp-bankrobbery:server:SetStationStatus", currentStation, true)
    elseif currentGate ~= 0 then
        PRPCore.Functions.Notify("The door has been breached with thermite", "success")
        TriggerServerEvent('prp-doorlock:server:updateState', currentGate, false)

        if currentGate == 1 then
            dCoords = vector3(-106.26, 6476.01, 31.98)
            TriggerServerEvent('nui_doorlock:server:UnlockDoorByCoords', dCoords)
        end

        if currentGate == 2 then
            dCoords = vector3(251.8576, 221.0655, 101.8324)
            TriggerServerEvent('nui_doorlock:server:UnlockDoorByCoords', dCoords)
        end

        if currentGate == 3 then
            dCoords = vector3(261.3004, 214.5051, 101.8324)
            TriggerServerEvent('nui_doorlock:server:UnlockDoorByCoords', dCoords)
        end

        currentGate = 0
    end
end)

RegisterNUICallback('closethermite', function()
    SetNuiFocus(false, false)
end)

function CreateFire(coords, time)
    for i = 1, math.random(1, 7), 1 do
        TriggerServerEvent("thermite:StartServerFire", coords, 24, false)
    end
    Citizen.Wait(time)
    TriggerServerEvent("thermite:StopFires")
end

RegisterNetEvent('prp-bankrobbery:client:PoliceAlertMessage')
AddEventHandler('prp-bankrobbery:client:PoliceAlertMessage', function(msg, coords, blip)
    if blip then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent("chatMessage", "911-DISPATCH", "error", msg)
        local transG = 100
        local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 100.0)
        SetBlipSprite(blip, 9)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, transG)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911 - Power Outage Alert!!!")
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
    else
        if not robberyAlert then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent("chatMessage", "911-DISPATCH", "error", msg)
            robberyAlert = true
        end
    end
end)
