PRPCore = nil
local isLoggedIn = false
local CurrentCops = 0

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)    
        Citizen.Wait(200)
    end
end)

local requiredItemsShowed = false
local requiredItemsShowed2 = false
local requiredItems = {}
local currentSpot = 0
local usingSafe = false

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["thermite"].x, Config.Locations["thermite"].y,Config.Locations["thermite"].z, true) < 3.0 and not Config.Locations["thermite"].isDone then
                DrawMarker(2, Config.Locations["thermite"].x, Config.Locations["thermite"].y,Config.Locations["thermite"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.1, 255, 255, 255, 100, 0, 0, 0, 1, 0, 0, 0)
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["thermite"].x, Config.Locations["thermite"].y,Config.Locations["thermite"].z, true) < 1.0 then
                    if not Config.Locations["thermite"].isDone then 
                        if not requiredItemsShowed then
                            requiredItems = {
                                [1] = {name = PRPCore.Shared.Items["thermite"]["name"], image = PRPCore.Shared.Items["thermite"]["image"]},
                            }
                            requiredItemsShowed = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        end
                    end
                end
            else
                if requiredItemsShowed then
                    requiredItems = {
                        [1] = {name = PRPCore.Shared.Items["thermite"]["name"], image = PRPCore.Shared.Items["thermite"]["image"]},
                    }
                    requiredItemsShowed = false
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                end
            end
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["safe"].x, Config.Locations["safe"].y,Config.Locations["safe"].z, true) < 1.0 then
                DrawText3Ds(Config.Locations["safe"].x, Config.Locations["safe"].y,Config.Locations["safe"].z, '~g~E~w~ To crack safe')
                if IsControlJustPressed(0, 38) then
                    if Config.Locations["thermite"].isDone then 
                        PRPCore.Functions.TriggerCallback('prp-ifruitstore:server:CanRobSafe', function(retvalue)
                            if retvalue then
                                PRPCore.Functions.TriggerCallback('prp-storerobbery:server:getPadlockCombination', function(combination)
                                    TriggerServerEvent("prp-ifruitstore:server:SetSafeStatus", "isBusy", true)
                                    TriggerEvent("SafeCracker:StartMinigame", combination)
                                    usingSafe = true
                                end, 2)
                                TriggerServerEvent('prp-hud:Server:GainStress', 40)
                            else
                                PRPCore.Functions.Notify("Cannot rob safe..", "error", 10000)
                            end
                        end)
                    else
                        PRPCore.Functions.Notify("Security is still active..", "error")
                    end
                end
            end
        else
            Citizen.Wait(3000)
        end
    end
end)

Citizen.CreateThread(function()
    local inRange = false
    while true do
        Citizen.Wait(1)
        --if isLoggedIn then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            for spot, location in pairs(Config.Locations["takeables"]) do
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["takeables"][spot].x, Config.Locations["takeables"][spot].y,Config.Locations["takeables"][spot].z, true)
                if dist < 1.0 then
                    inRange = true
                    if dist < 0.6 then
                        if not requiredItemsShowed2 then
                            requiredItems = {
                                [1] = {name = PRPCore.Shared.Items["advancedlockpick"]["name"], image = PRPCore.Shared.Items["advancedlockpick"]["image"]},
                            }
                            requiredItemsShowed2 = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        end
                        if not Config.Locations["takeables"][spot].isBusy and not Config.Locations["takeables"][spot].isDone then
                            DrawText3Ds(Config.Locations["takeables"][spot].x, Config.Locations["takeables"][spot].y,Config.Locations["takeables"][spot].z, '~g~E~w~ To grab Items')
                            if IsControlJustPressed(0, 38) then
                                if CurrentCops >= 3 then
                                    if Config.Locations["thermite"].isDone then 
                                        PRPCore.Functions.TriggerCallback('prp-radio:server:GetItem', function(hasItem)
                                            if hasItem then
                                                currentSpot = spot
                                                if requiredItemsShowed2 then
                                                    requiredItems = {
                                                        [1] = {name = PRPCore.Shared.Items["advancedlockpick"]["name"], image = PRPCore.Shared.Items["advancedlockpick"]["image"]},
                                                    }
                                                    requiredItemsShowed2 = false
                                                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                                                end
                                                TriggerEvent("prp-lockpick:client:openLockpick", lockpickDone)
                                            else
                                                PRPCore.Functions.Notify("Youre missing a big lockpick..", "error")
                                            end
                                        end, "advancedlockpick")
                                    else
                                        PRPCore.Functions.Notify("Security is still active..", "error")
                                    end
                                else
                                    PRPCore.Functions.Notify("Not enough police..", "error")
                                end
                            end
                        end
                    end
                end
            end
            if not inRange then
                if requiredItemsShowed2 then
                    requiredItems = {
                        [1] = {name = PRPCore.Shared.Items["advancedlockpick"]["name"], image = PRPCore.Shared.Items["advancedlockpick"]["image"]},
                    }
                    requiredItemsShowed2 = false
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                end
                Citizen.Wait(2000)
            end
        --end
    end
end)

function lockpickDone(success)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    if math.random(1, 100) <= 80 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    if success then
        GrabItem(currentSpot)
    else
        if math.random(1, 100) <= 40 and IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
            PRPCore.Functions.Notify("You ripped your gloves..")
        end
        if math.random(1, 100) <= 10 then
            TriggerServerEvent("PRPCore:Server:RemoveItem", "advancedlockpick", 1)
            TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items["advancedlockpick"], "remove")
        end
    end
end

function GrabItem(spot)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    if requiredItemsShowed2 then
        requiredItemsShowed2 = false
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    end
    PRPCore.Functions.Progressbar("grab_ifruititem", "Stealing item..", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@gangops@facility@servers@",
        anim = "hotwire",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
        TriggerServerEvent('prp-ifruitstore:server:setSpotState', "isDone", true, spot)
        TriggerServerEvent('prp-ifruitstore:server:setSpotState', "isBusy", false, spot)
        TriggerServerEvent('prp-ifruitstore:server:itemReward', spot)
        TriggerServerEvent('prp-ifruitstore:server:PoliceAlertMessage', 'Civilians caught stealing from iFruit store', pos, true)
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
        TriggerServerEvent('prp-jewellery:server:setSpotState', "isBusy", false, spot)
        PRPCore.Functions.Notify("Canceled..", "error")
    end)
end

RegisterNetEvent('SafeCracker:EndMinigame')
AddEventHandler('SafeCracker:EndMinigame', function(won)
    if usingSafe then
        if won then
            if not Config.Locations["safe"].isDone then
                SetNuiFocus(false, false)
                TriggerServerEvent("prp-ifruitstore:server:SafeReward")
                TriggerServerEvent("prp-ifruitstore:server:SetSafeStatus", "isBusy", false)
                TriggerServerEvent("prp-ifruitstore:server:SetSafeStatus", "isDone", true)
                takeAnim()
            end
        end
    end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    TriggerServerEvent("prp-ifruitstore:server:LoadLocationList")
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('prp-ifruitstore:client:LoadList')
AddEventHandler('prp-ifruitstore:client:LoadList', function(list)
    Config.Locations = list
end)

RegisterNetEvent('thermite:UseThermite')
AddEventHandler('thermite:UseThermite', function()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["thermite"].x, Config.Locations["thermite"].y,Config.Locations["thermite"].z, true) < 1.0 then
        if CurrentCops >= 4 then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if math.random(1, 100) <= 80 and not IsWearingHandshoes() then
                TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
            end
            if requiredItemsShowed then
                requiredItems = {
                    [1] = {name = PRPCore.Shared.Items["thermite"]["name"], image = PRPCore.Shared.Items["thermite"]["image"]},
                }
                requiredItemsShowed = false
                TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                TriggerServerEvent("prp-ifruitstore:server:SetThermiteStatus", "isBusy", true)
                SetNuiFocus(true, true)
                SendNUIMessage({
                    action = "openThermite",
                    amount = math.random(5, 10),
                })
            end
        else
            PRPCore.Functions.Notify("Not enough Police..", "error")
        end
    end
end)

RegisterNetEvent('prp-ifruitstore:client:setSpotState')
AddEventHandler('prp-ifruitstore:client:setSpotState', function(stateType, state, spot)
    if stateType == "isBusy" then
        Config.Locations["takeables"][spot].isBusy = state
    elseif stateType == "isDone" then
        Config.Locations["takeables"][spot].isDone = state
    end
end)

RegisterNetEvent('prp-ifruitstore:client:SetThermiteStatus')
AddEventHandler('prp-ifruitstore:client:SetThermiteStatus', function(stateType, state)
    if stateType == "isBusy" then
        Config.Locations["thermite"].isBusy = state
    elseif stateType == "isDone" then
        Config.Locations["thermite"].isDone = state
    end
end)

RegisterNetEvent('prp-ifruitstore:client:PoliceAlertMessage')
AddEventHandler('prp-ifruitstore:client:PoliceAlertMessage', function(msg, coords, blip)
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
        AddTextComponentString("911 - Suspicious activity iFruit store")
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

RegisterNUICallback('thermiteclick', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('thermitefailed', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
    TriggerServerEvent("prp-ifruitstore:server:SetThermiteStatus", "isBusy", false)
    TriggerServerEvent("PRPCore:Server:RemoveItem", "thermite", 1)
    TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items["thermite"], "remove")
end)

RegisterNUICallback('thermitesuccess', function()
    PRPCore.Functions.Notify("Security system now disabled", "success")
    local pos = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["thermite"].x, Config.Locations["thermite"].y,Config.Locations["thermite"].z, true) < 1.0 then
        TriggerServerEvent("prp-ifruitstore:server:SetThermiteStatus", "isDone", true)
        TriggerServerEvent("prp-ifruitstore:server:SetThermiteStatus", "isBusy", false)
    end
end)

RegisterNUICallback('closethermite', function()
    SetNuiFocus(false, false)
end)

function DrawText3Ds(x, y, z, text)
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

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(GetPlayerPed(-1), 3)
    local model = GetEntityModel(GetPlayerPed(-1))
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

function takeAnim()
    local ped = GetPlayerPed(-1)
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Citizen.Wait(100)
    end
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 50, 0, false, false, false)
    Citizen.Wait(2500)
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "exit", 8.0, 8.0, -1, 50, 0, false, false, false)
end