PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

local closestBank = nil
local inRange
local requiredItemsShowed = false
local copsCalled = false
local PlayerJob = {}

currentThermiteGate = 0

CurrentCops = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000 * 60 * 5)
        if copsCalled then
            copsCalled = false
        end
    end
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent("PRPCore:Client:OnPlayerLoaded")
AddEventHandler("PRPCore:Client:OnPlayerLoaded", function()
    PlayerJob = PRPCore.Functions.GetPlayerData().job
    PRPCore.Functions.TriggerCallback('prp-bankrobbery:server:GetConfig', function(config)
        Config = config
    end)
    onDuty = true
    ResetBankDoors()
end)

RegisterNetEvent('PRPCore:Client:SetDuty')
AddEventHandler('PRPCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local dist

        if PRPCore ~= nil then
            inRange = false

            for k, v in pairs(Config.SmallBanks) do
                dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[k]["coords"]["x"], Config.SmallBanks[k]["coords"]["y"], Config.SmallBanks[k]["coords"]["z"])
                if dist < 15 then
                    closestBank = k
                    inRange = true
                end
            end

            if not inRange then
                Citizen.Wait(2000)
                closestBank = nil
            end
        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    local requiredItems = {
        [1] = {name = PRPCore.Shared.Items["electronickit"]["name"], image = PRPCore.Shared.Items["electronickit"]["image"]},
        [2] = {name = PRPCore.Shared.Items["trojan_usb"]["name"], image = PRPCore.Shared.Items["trojan_usb"]["image"]},
    }
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        if PRPCore ~= nil then
            if closestBank ~= nil then
                if not Config.SmallBanks[closestBank]["isOpened"] then
                    local dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[closestBank]["coords"]["x"], Config.SmallBanks[closestBank]["coords"]["y"], Config.SmallBanks[closestBank]["coords"]["z"])
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
                if Config.SmallBanks[closestBank]["isOpened"] then
                    for k, v in pairs(Config.SmallBanks[closestBank]["lockers"]) do
                        local lockerDist = GetDistanceBetweenCoords(pos, Config.SmallBanks[closestBank]["lockers"][k].x, Config.SmallBanks[closestBank]["lockers"][k].y, Config.SmallBanks[closestBank]["lockers"][k].z)
                        if not Config.SmallBanks[closestBank]["lockers"][k]["isBusy"] then
                            if not Config.SmallBanks[closestBank]["lockers"][k]["isOpened"] then
                                if lockerDist < 5 then
                                    DrawMarker(2, Config.SmallBanks[closestBank]["lockers"][k].x, Config.SmallBanks[closestBank]["lockers"][k].y, Config.SmallBanks[closestBank]["lockers"][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
                                    if lockerDist < 0.5 then
                                        DrawText3Ds(Config.SmallBanks[closestBank]["lockers"][k].x, Config.SmallBanks[closestBank]["lockers"][k].y, Config.SmallBanks[closestBank]["lockers"][k].z + 0.3, '[E] Break locker')
                                        if IsControlJustPressed(0, 38) then
                                            if CurrentCops >= Config.MinFleeca then
                                                TriggerServerEvent('prp-hud:Server:GainStress', 10)
                                                openLocker(closestBank, k)
                                            else
                                                PRPCore.Functions.Notify("Not enough police!", "error")
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                Citizen.Wait(2500)
            end
        end

        Citizen.Wait(1)
    end
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

RegisterNetEvent('electronickit:UseElectronickit')
AddEventHandler('electronickit:UseElectronickit', function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    if closestBank ~= nil then
        PRPCore.Functions.TriggerCallback('prp-bankrobbery:server:isRobberyActive', function(isBusy)
            if not isBusy then
                if closestBank ~= nil then
                    local dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[closestBank]["coords"]["x"], Config.SmallBanks[closestBank]["coords"]["y"], Config.SmallBanks[closestBank]["coords"]["z"])
                    if dist < 1.5 then
                        print(Config.MinimumPaletoPolice)
                        print(Config.MinFleeca)
                        if CurrentCops >= Config.MinFleeca then
                            if not Config.SmallBanks[closestBank]["isOpened"] then 
                                PRPCore.Functions.TriggerCallback('PRPCore:HasItem', function(result)
                                    if result then 
                                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                                        PRPCore.Functions.Progressbar("hack_gate", "Install electronic device", math.random(5000, 10000), false, true, {
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
                                            TriggerEvent("mhacking:show")
                                            TriggerEvent("mhacking:start", math.random(5, 9), math.random(10, 18), OnHackDone)
                                            
                                            local breakChance = math.random(1,2)
                                            if breakChance == 2 then
                                                PRPCore.Functions.Notify("Electronics fried from hacking attempt!", "error", 15000)
                                                TriggerServerEvent("PRPCore:Server:RemoveItem", "electronickit", 1)
                                                TriggerServerEvent("PRPCore:Server:RemoveItem", "trojan_usb", 1)
                                            end

                                            if not copsCalled then
                                                local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                                                local street1 = GetStreetNameFromHashKey(s1)
                                                local street2 = GetStreetNameFromHashKey(s2)
                                                local streetLabel = street1
                                                if street2 ~= nil then 
                                                    streetLabel = streetLabel .. " " .. street2
                                                end
                                                if Config.SmallBanks[closestBank]["alarm"] then
                                                    TriggerServerEvent("prp-bankrobbery:server:callCops", "small", closestBank, streetLabel, pos)
                                                    copsCalled = true
                                                end
                                            end
                                        end, function() -- Cancel
                                            StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                            PRPCore.Functions.Notify("Cancelled..", "error")
                                        end)
                                    else
                                        PRPCore.Functions.Notify("You're missing an item..", "error")
                                    end
                                end, "trojan_usb")
                            else
                                PRPCore.Functions.Notify("Looks like the bank is already open..", "error")
                            end
                        else
                            PRPCore.Functions.Notify("Not enough Police ..", "error")
                        end
                    end
                end
            else
                PRPCore.Functions.Notify("Security lock is active..", "error", 5500)
            end
        end)
    end
end)

RegisterNetEvent('prp-bankrobbery:client:setBankState')
AddEventHandler('prp-bankrobbery:client:setBankState', function(bankId, state)
    if bankId == "paleto" then
        Config.BigBanks["paleto"]["isOpened"] = state
        TriggerServerEvent('prp-bankrobbery:server:setTimeout')
        if state then
            OpenPaletoDoor(bankId)
        end
    elseif bankId == "pacific" then
        Config.BigBanks["pacific"]["isOpened"] = state
        TriggerServerEvent('prp-bankrobbery:server:setTimeout')
        if state then
            OpenPacificDoor()
        end
    else
        Config.SmallBanks[bankId]["isOpened"] = state
        TriggerServerEvent('prp-bankrobbery:server:setTimeout')
        if state then
            OpenBankDoor(bankId)
        end
    end
end)

RegisterNetEvent('prp-bankrobbery:client:enableAllBankSecurity')
AddEventHandler('prp-bankrobbery:client:enableAllBankSecurity', function()
    for k, v in pairs(Config.SmallBanks) do
        Config.SmallBanks[k]["alarm"] = true
    end
end)

RegisterNetEvent('prp-bankrobbery:client:disableAllBankSecurity')
AddEventHandler('prp-bankrobbery:client:disableAllBankSecurity', function()
    for k, v in pairs(Config.SmallBanks) do
        Config.SmallBanks[k]["alarm"] = false
    end
end)

RegisterNetEvent('prp-bankrobbery:client:BankSecurity')
AddEventHandler('prp-bankrobbery:client:BankSecurity', function(key, status)
    Config.SmallBanks[key]["alarm"] = status
end)

function OpenBankDoor(bankId)
    local object = GetClosestObjectOfType(Config.SmallBanks[bankId]["coords"]["x"], Config.SmallBanks[bankId]["coords"]["y"], Config.SmallBanks[bankId]["coords"]["z"], 5.0, Config.SmallBanks[bankId]["object"], false, false, false)
    local timeOut = 10
    local entHeading = Config.SmallBanks[bankId]["heading"].closed

    if object ~= 0 then
        Citizen.CreateThread(function()
            while true do

                if entHeading ~= Config.SmallBanks[bankId]["heading"].open then
                    SetEntityHeading(object, entHeading - 10)
                    entHeading = entHeading - 0.5
                else
                    break
                end

                Citizen.Wait(10)
            end
        end)
    end
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

function ResetBankDoors()
    for k, v in pairs(Config.SmallBanks) do
        if not Config.SmallBanks[k]["isOpened"] then
            local object = GetClosestObjectOfType(Config.SmallBanks[k]["coords"]["x"], Config.SmallBanks[k]["coords"]["y"], Config.SmallBanks[k]["coords"]["z"], 5.0, Config.SmallBanks[k]["object"], false, false, false)
            SetEntityHeading(object, Config.SmallBanks[k]["heading"].closed)
        end
    end
    if not Config.BigBanks["paleto"]["isOpened"] then
        local paletoObject = GetClosestObjectOfType(Config.BigBanks["paleto"]["coords"]["x"], Config.BigBanks["paleto"]["coords"]["y"], Config.BigBanks["paleto"]["coords"]["z"], 5.0, Config.BigBanks["paleto"]["object"], false, false, false)
        SetEntityHeading(paletoObject, Config.BigBanks["paleto"]["heading"].closed)
    end

    if not Config.BigBanks["pacific"]["isOpened"] then
        local pacificObject = GetClosestObjectOfType(Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"], 20.0, Config.BigBanks["pacific"]["object"], false, false, false)
        SetEntityHeading(pacificObject, Config.BigBanks["pacific"]["heading"].closed)
    end
end

function openLocker(bankId, lockerId)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', true)
    if bankId == "paleto" then
        PRPCore.Functions.TriggerCallback('prp-radio:server:GetItem', function(hasItem)
            if hasItem then
                loadAnimDict("anim@heists@fleeca_bank@drilling")
                TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle' , 3.0, 3.0, -1, 1, 0, false, false, false)
                local pos = GetEntityCoords(GetPlayerPed(-1), true)
                local DrillObject = CreateObject(GetHashKey("hei_prop_heist_drill"), pos.x, pos.y, pos.z, true, true, true)
                AttachEntityToEntity(DrillObject, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
                PRPCore.Functions.Progressbar("open_locker_drill", "Drilling into the safe..", math.random(40000, 60000), false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    StopAnimTask(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                    DetachEntity(DrillObject, true, true)
                    DeleteObject(DrillObject)
                    TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isOpened', true)
                    TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                    TriggerServerEvent('prp-bankrobbery:server:recieveItem', 'paleto')
                    PRPCore.Functions.Notify("Success!", "success")
                end, function() -- Cancel
                    StopAnimTask(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                    TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                    DetachEntity(DrillObject, true, true)
                    DeleteObject(DrillObject)
                    PRPCore.Functions.Notify("Cancelled..", "error")
                end)
            else
                PRPCore.Functions.Notify("Safe lock is too strong..", "error")
                TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
            end
        end, "drill")
    elseif bankId == "pacific" then
        PRPCore.Functions.TriggerCallback('prp-radio:server:GetItem', function(hasItem)
            if hasItem then
                loadAnimDict("anim@heists@fleeca_bank@drilling")
                TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle' , 3.0, 3.0, -1, 1, 0, false, false, false)
                local pos = GetEntityCoords(GetPlayerPed(-1), true)
                local DrillObject = CreateObject(GetHashKey("hei_prop_heist_drill"), pos.x, pos.y, pos.z, true, true, true)
                AttachEntityToEntity(DrillObject, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
                PRPCore.Functions.Progressbar("open_locker_drill", "Drilling into safe..", math.random(40000, 60000), false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    StopAnimTask(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                    DetachEntity(DrillObject, true, true)
                    DeleteObject(DrillObject)
                    TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isOpened', true)
                    TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                    TriggerServerEvent('prp-bankrobbery:server:recieveItem', 'pacific')
                    PRPCore.Functions.Notify("Success!", "success")
                end, function() -- Cancel
                    StopAnimTask(GetPlayerPed(-1), "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                    TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                    DetachEntity(DrillObject, true, true)
                    DeleteObject(DrillObject)
                    PRPCore.Functions.Notify("Cancelled..", "error")
                end)
            else
                PRPCore.Functions.Notify("Safe lock is too strong..", "error")
                TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
            end
        end, "drill")
    else
        PRPCore.Functions.Progressbar("open_locker", "Ripping box off wall..", math.random(15000, 30000), false, true, {
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
            TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isOpened', true)
            TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
            TriggerServerEvent('prp-bankrobbery:server:recieveItem', 'small')
            PRPCore.Functions.Notify("Success!", "success")
        end, function() -- Cancel
            StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
            TriggerServerEvent('prp-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
            PRPCore.Functions.Notify("Cancelled..", "error")
        end)
    end
end

RegisterNetEvent('prp-bankrobbery:client:setLockerState')
AddEventHandler('prp-bankrobbery:client:setLockerState', function(bankId, lockerId, state, bool)
    if bankId == "paleto" then
        Config.BigBanks["paleto"]["lockers"][lockerId][state] = bool
    elseif bankId == "pacific" then
        Config.BigBanks["pacific"]["lockers"][lockerId][state] = bool
    else
        Config.SmallBanks[bankId]["lockers"][lockerId][state] = bool
    end
end)

RegisterNetEvent('prp-bankrobbery:client:robberyCall')
AddEventHandler('prp-bankrobbery:client:robberyCall', function(type, key, streetLabel, coords)

    local job = nil
    if PlayerJob.name == nil then
        job = PRPCore.Functions.GetPlayerData().job.name
    else
        job = PlayerJob.name
    end

    if job == "police" then 
        print("HERE")
        local cameraId = 4
        local bank = "Fleeca"
        if type == "small" then
            cameraId = Config.SmallBanks[key]["camId"]
            bank = "Fleeca"
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
                timeOut = 10000,
                alertTitle = "Bank Robbery Attempt",
                coords = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z,
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-university"></i>',
                        detail = bank,
                    },
                    [2] = {
                        icon = '<i class="fas fa-video"></i>',
                        detail = cameraId,
                    },
                    [3] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = streetLabel,
                    },
                },
                callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
            })
        elseif type == "paleto" then
            cameraId = Config.BigBanks["paleto"]["camId"]
            bank = "Blaine County Savings"
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            Citizen.Wait(100)
            PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
            Citizen.Wait(100)
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            Citizen.Wait(100)
            PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
            TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
                timeOut = 10000,
                alertTitle = "Bank Robbery Attempt",
                coords = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z,
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-university"></i>',
                        detail = bank,
                    },
                    [2] = {
                        icon = '<i class="fas fa-video"></i>',
                        detail = cameraId,
                    },
                },
                callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
            })
        elseif type == "pacific" then
            bank = "Pacific Standard Bank"
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            Citizen.Wait(100)
            PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
            Citizen.Wait(100)
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            Citizen.Wait(100)
            PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
            TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
                timeOut = 10000,
                alertTitle = "Bank Robbery Attempt",
                coords = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z,
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-university"></i>',
                        detail = bank,
                    },
                    [2] = {
                        icon = '<i class="fas fa-video"></i>',
                        detail = "1 | 2 | 3",
                    },
                    [3] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = "Alta St",
                    },
                },
                callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
            })
        end
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911: Federal Bank Robbery")
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
end)

function OnHackDone(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        TriggerServerEvent('prp-bankrobbery:server:setBankState', closestBank, true)
    else
		TriggerEvent('mhacking:hide')
	end
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        ResetBankDoors()
    end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function searchPockets()
    if ( DoesEntityExist( GetPlayerPed(-1) ) and not IsEntityDead( GetPlayerPed(-1) ) ) then 
        loadAnimDict( "random@mugging4" )
        TaskPlayAnim( GetPlayerPed(-1), "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    end
end

function giveAnim()
    if ( DoesEntityExist( GetPlayerPed(-1) ) and not IsEntityDead( GetPlayerPed(-1) ) ) then 
        loadAnimDict( "mp_safehouselost@" )
        if ( IsEntityPlayingAnim( GetPlayerPed(-1), "mp_safehouselost@", "package_dropoff", 3 ) ) then 
            TaskPlayAnim( GetPlayerPed(-1), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        else
            TaskPlayAnim( GetPlayerPed(-1), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        end     
    end
end