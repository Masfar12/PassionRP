PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

local robberyAlert = false

local isLoggedIn = false

local firstAlarm = false

local cardActivated = false

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

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('prp-jewellery:client:useCard')
AddEventHandler('prp-jewellery:client:useCard', function()


    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, Config.JewelleryLocationCard["coords"].x, Config.JewelleryLocationCard["coords"].y, Config.JewelleryLocationCard["coords"].z)
    if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end

    if dist < 1.5 then
        local requiredItems = {
            [1] = {name = PRPCore.Shared.Items["security_card_00"]["name"], image = PRPCore.Shared.Items["security_card_00"]["image"]},
        }
        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        PRPCore.Functions.Progressbar("security_pass", "Validating keycards..", math.random(5000, 10000), false, true, {
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
            TriggerServerEvent("PRPCore:Server:RemoveItem", "security_card_00", 1)
            cardActivated = true
        end, function() -- Cancel
            StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
            PRPCore.Functions.Notify("Cancelled..", "error")
        end)
    end

end)

Citizen.CreateThread(function()
    while true do

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        inRange = false

        if PRPCore ~= nil then
            if isLoggedIn then
                PlayerData = PRPCore.Functions.GetPlayerData()

                local dist = GetDistanceBetweenCoords(pos, Config.JewelleryLocationCard["coords"]["x"], Config.JewelleryLocationCard["coords"]["y"], Config.JewelleryLocationCard["coords"]["z"])
                if dist < 3.0 then
                    inRange = true

                    DrawText3Ds(Config.JewelleryLocationCard["coords"]["x"], Config.JewelleryLocationCard["coords"]["y"], Config.JewelleryLocationCard["coords"]["z"], 'Insert Keycard')
                    local requiredItems = {
                        [1] = {name = PRPCore.Shared.Items["security_card_00"]["name"], image = PRPCore.Shared.Items["security_card_00"]["image"]},
                    }            
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
            end
        end


        if not inRange then
            Citizen.Wait(2000)
        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        inRange = false

        if PRPCore ~= nil then
            if isLoggedIn then
                PlayerData = PRPCore.Functions.GetPlayerData()
                for case,_ in pairs(Config.Locations) do
                    -- if PlayerData.job.name ~= "police" then
                        local dist = GetDistanceBetweenCoords(pos, Config.Locations[case]["coords"]["x"], Config.Locations[case]["coords"]["y"], Config.Locations[case]["coords"]["z"])
                        local storeDist = GetDistanceBetweenCoords(pos, Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])
                        if dist < 30 then
                            inRange = true

                            if dist < 0.6 then
                                if not Config.Locations[case]["isBusy"] and not Config.Locations[case]["isOpened"] then
                                    DrawText3Ds(Config.Locations[case]["coords"]["x"], Config.Locations[case]["coords"]["y"], Config.Locations[case]["coords"]["z"], '[E] Break the glass')
                                    if IsControlJustPressed(0, 38) then
                                        PRPCore.Functions.TriggerCallback('prp-jewellery:server:getCops', function(cops)
                                            if cops >= Config.RequiredCops then
                                                if validWeapon() then
                                                    TriggerServerEvent('prp-hud:Server:GainStress', 10)
                                                    smashVitrine(case)
                                                else
                                                    PRPCore.Functions.Notify('You need to unlock the security!', 'error', 10000)
                                                end
                                            else
                                                PRPCore.Functions.Notify('There are not enough cops on duty...', 'error', 10000)
                                            end                
                                        end)
                                    end
                                end
                            end

                            if storeDist < 2 then
                                if not firstAlarm then
                                    if validWeapon() then
                                        TriggerServerEvent('prp-jewellery:server:PoliceAlertMessage', 'There is suspicious activity at Vangelico Jewellery', pos, true)
                                        firstAlarm = true
                                    end
                                end
                            end
                        end
                    -- end
                end
            end
        end

        if not inRange then
            Citizen.Wait(2000)
        end

        Citizen.Wait(3)
    end
end)

function loadParticle()
	if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
    RequestNamedPtfxAsset("scr_jewelheist")
    end
    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
    Citizen.Wait(0)
    end
    SetPtfxAssetNextCall("scr_jewelheist")
end

function loadAnimDict(dict)  
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(3)
    end
end

function validWeapon()
    if cardActivated == true then
        return true
    else
        return false
    end
    return false
end

function smashVitrine(k)
    local animDict = "missheist_jewel"
    local animName = "smash_case"
    local ped = GetPlayerPed(-1)
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)
    local pedWeapon = GetSelectedPedWeapon(ped)

    if math.random(1, 100) <= 80 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
    elseif math.random(1, 100) <= 5 and IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
        PRPCore.Functions.Notify("A broken piece of glass has torn your gloves..", "error")
    end

    PRPCore.Functions.Progressbar("smash_vitrine", "Smashing the display cabinet..", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('prp-jewellery:server:setVitrineState', "isOpened", true, k)
        TriggerServerEvent('prp-jewellery:server:setVitrineState', "isBusy", false, k)
        TriggerServerEvent('prp-jewellery:server:vitrineReward')
        TriggerServerEvent('prp-jewellery:server:setTimeout')
        TriggerServerEvent('prp-jewellery:server:PoliceAlertMessage', "There is a robbery in progress at Vangelico Jewellery Store", plyCoords, false)
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end, function() -- Cancel
        TriggerServerEvent('prp-jewellery:server:setVitrineState', "isBusy", false, k)
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end)
    TriggerServerEvent('prp-jewellery:server:setVitrineState', "isBusy", true, k)
    loadAnimDict(animDict)
    TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
    Citizen.Wait(500)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "breaking_vitrine_glass", 0.25)
    loadParticle()
    StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", plyCoords.x, plyCoords.y, plyCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
end

RegisterNetEvent('prp-jewellery:client:setCardActivated')
AddEventHandler('prp-jewellery:client:setCardActivated', function(bool)
    cardActivated = bool
end)

RegisterNetEvent('prp-jewellery:client:setVitrineState')
AddEventHandler('prp-jewellery:client:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
end)


RegisterNetEvent('prp-jewellery:client:setAlertState')
AddEventHandler('prp-jewellery:client:setAlertState', function(bool)
    robberyAlert = bool
end)

RegisterNetEvent('prp-jewellery:client:PoliceAlertMessage')
AddEventHandler('prp-jewellery:client:PoliceAlertMessage', function(msg, coords, blip)
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
        AddTextComponentString("Suspect Situation")
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

Citizen.CreateThread(function()
    Dealer = AddBlipForCoord(Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])

    SetBlipSprite (Dealer, 617)
    SetBlipDisplay(Dealer, 4)
    SetBlipScale  (Dealer, 0.50)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Vangelico Jewellery")
    EndTextCommandSetBlipName(Dealer)
end)
