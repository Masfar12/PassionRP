Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)    
        Citizen.Wait(200)
    end
end)



--- CODE

local uiOpen            = false
local currentRegister   = 0
local currentSafe = 0
local copsCalled = false
local CurrentCops = 0
local PlayerJob = {}
local onDuty = false
local usingAdvanced = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000 * 60)
        if copsCalled then
            copsCalled = false
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    setupRegister()
    setupSafes()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inRange = false
        for k, v in pairs(Config.Registers) do
            local dist = GetDistanceBetweenCoords(pos, Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z)

            if dist <= 1 and Config.Registers[k].robbed then
                inRange = true
                DrawText3Ds(Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z, 'Cash registery is empty...')
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
        Citizen.Wait(1)
        local inRange = false
        if PRPCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            for safe,_ in pairs(Config.Safes) do
                local dist = GetDistanceBetweenCoords(pos, Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z)
                if dist < 3 then
                    inRange = true
                    if dist < 1.0 then
                        if not Config.Safes[safe].robbed then
                            DrawText3Ds(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z, '~g~E~w~ - Crack combination')
                            if IsControlJustPressed(0, 38) then
                                if CurrentCops >= Config.MinimumStoreRobberyPolice then
                                    currentSafe = safe
                                    TriggerServerEvent('prp-hud:Server:GainStress', 1)
                                    if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
                                        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                                    end
                                    if Config.Safes[safe].type == "keypad" then
                                        SendNUIMessage({
                                            action = "openKeypad",
                                        })
                                        SetNuiFocus(true, true)
                                    else
                                        PRPCore.Functions.TriggerCallback('prp-storerobbery:server:getPadlockCombination', function(combination)
                                            TriggerEvent("SafeCracker:StartMinigame", combination)
                                        end, safe)
                                    end
                                else
                                    PRPCore.Functions.Notify("Not enough Police..", "error")
                                end
                            end
                        else
                            DrawText3Ds(Config.Safes[safe].x, Config.Safes[safe].y, Config.Safes[safe].z, 'Safe opened..')
                        end
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(2000)
        end
    end
end)

RegisterNetEvent('PRPCore:Client:SetDuty')
AddEventHandler('PRPCore:Client:SetDuty', function(duty)
    onDuty = duty
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

RegisterNetEvent('police:SetCopAlert')
AddEventHandler('police:SetCopAlert', function()
    if not copsCalled then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        local streetLabel = street1
        if street2 ~= nil then 
            streetLabel = streetLabel .. " " .. street2
        end
        TriggerServerEvent("prp-storerobbery:server:callCops", "safe", currentSafe, streetLabel, pos)
        copsCalled = true
    end
end)

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function(isAdvanced)
    usingAdvanced = isAdvanced
    TriggerServerEvent('prp-hud:Server:GainStress', 1)
    for k, v in pairs(Config.Registers) do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local dist = GetDistanceBetweenCoords(pos, Config.Registers[k].x, Config.Registers[k].y, Config.Registers[k].z)
        if dist <= 1 and not Config.Registers[k].robbed then
            if CurrentCops >= Config.MinimumStoreRobberyPolice then
                if usingAdvanced then
                    lockpick(true)
                    currentRegister = k
                    if not IsWearingHandshoes() then
                        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                    end
                    if not copsCalled then
                        local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                        local street1 = GetStreetNameFromHashKey(s1)
                        local street2 = GetStreetNameFromHashKey(s2)
                        local streetLabel = street1
                        if street2 ~= nil then 
                            streetLabel = streetLabel .. " " .. street2
                        end
                        TriggerServerEvent("prp-storerobbery:server:callCops", "cashier", currentRegister, streetLabel, pos)
                        copsCalled = true
                    end
                else
                    PRPCore.Functions.TriggerCallback('PRPCore:HasItem', function(result)
                        if result then
                            lockpick(true)
                            currentRegister = k
                            if not IsWearingHandshoes() then
                                TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                            end
                            if not copsCalled then
                                local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                                local street1 = GetStreetNameFromHashKey(s1)
                                local street2 = GetStreetNameFromHashKey(s2)
                                local streetLabel = street1
                                if street2 ~= nil then 
                                    streetLabel = streetLabel .. " " .. street2
                                end
                                TriggerServerEvent("prp-storerobbery:server:callCops", "cashier", currentRegister, streetLabel, pos)
                                copsCalled = true
                            end
                        else
                            PRPCore.Functions.Notify("Youre missing a tool ..", "error")
                        end
                    end, "screwdriverset")
                end
                
            else
                PRPCore.Functions.Notify("Not enough Police..", "error")
            end
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

function setupRegister()
    PRPCore.Functions.TriggerCallback('prp-storerobbery:server:getRegisterStatus', function(Registers)
        for k, v in pairs(Registers) do
            Config.Registers[k].robbed = Registers[k].robbed
        end
    end)
end

function setupSafes()
    PRPCore.Functions.TriggerCallback('prp-storerobbery:server:getSafeStatus', function(Safes)
        for k, v in pairs(Safes) do
            Config.Safes[k].robbed = Safes[k].robbed
        end
    end)
end

DrawText3Ds = function(x, y, z, text)
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

function lockpick(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool,
    })
    SetCursorLocation(0.5, 0.2)
    uiOpen = bool
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
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

local openingDoor = false
RegisterNUICallback('success', function()
    if currentRegister ~= 0 then
        lockpick(false)
        TriggerServerEvent('prp-storerobbery:server:setRegisterStatus', currentRegister)
        local lockpickTime = 120000
        LockpickDoorAnim(lockpickTime)
        PRPCore.Functions.Progressbar("search_register", "Emptying registry..", lockpickTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "veh@break_in@0h@p_m_one@",
            anim = "low_force_entry_ds",
            flags = 16,
        }, {}, {}, function() -- Done
            openingDoor = false
            ClearPedTasks(GetPlayerPed(-1))
            TriggerServerEvent('prp-storerobbery:server:takeMoney', currentRegister, true)            
            currentRegister = 0
        end, function() -- Cancel
            openingDoor = false
            ClearPedTasks(GetPlayerPed(-1))
            PRPCore.Functions.Notify("Process Cancelled..", "error")
            currentRegister = 0
        end)
    else
        SendNUIMessage({
            action = "kekw",
        })
    end
end)

function LockpickDoorAnim(time)
    time = time / 1000
    loadAnimDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
            time = time - 2
            TriggerServerEvent('prp-storerobbery:server:takeMoney', currentRegister, false)
            if time <= 0 then
                openingDoor = false
                StopAnimTask(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            end
        end
    end)
end

RegisterNUICallback('callcops', function()
    TriggerEvent("police:SetCopAlert")
end)

RegisterNetEvent('SafeCracker:EndMinigame')
AddEventHandler('SafeCracker:EndMinigame', function(won)
    if currentSafe ~= 0 then
        if won then
            if currentSafe ~= 0 then
                if not Config.Safes[currentSafe].robbed then
                    SetNuiFocus(false, false)
                    TriggerServerEvent("prp-storerobbery:server:SafeReward", currentSafe)
                    TriggerServerEvent("prp-storerobbery:server:setSafeStatus", currentSafe)
                    currentSafe = 0
                    takeAnim()
                end
            else
                SendNUIMessage({
                    action = "kekw",
                })
            end
        end
    end
end)

RegisterNUICallback('PadLockSuccess', function()
    if currentSafe ~= 0 then
        if not Config.Safes[currentSafe].robbed then
            SendNUIMessage({
                action = "kekw",
            })
        end
    else
        SendNUIMessage({
            action = "kekw",
        })
    end
end)

RegisterNUICallback('PadLockClose', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("CombinationFail", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('fail', function()
    if usingAdvanced then
        if math.random(1, 100) < 10 then
            TriggerServerEvent("PRPCore:Server:RemoveItem", "advancedlockpick", 1)
            TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items["advancedlockpick"], "remove")
        end
    else
        if math.random(1, 100) < 40 then
            TriggerServerEvent("PRPCore:Server:RemoveItem", "lockpick", 1)
            TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items["lockpick"], "remove")
        end
    end
    if (IsWearingHandshoes() and math.random(1, 100) <= 25) then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
        PRPCore.Functions.Notify("You ripped your gloves..")
    end
    lockpick(false)
end)

RegisterNUICallback('exit', function()
    lockpick(false)
end)

RegisterNUICallback('TryCombination', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-storerobbery:server:isCombinationRight', function(combination)
        if tonumber(data.combination) == combination then
            TriggerServerEvent("prp-storerobbery:server:SafeReward", currentSafe)
            TriggerServerEvent("prp-storerobbery:server:setSafeStatus", currentSafe)
            SetNuiFocus(false, false)
            SendNUIMessage({
                action = "closeKeypad",
                error = false,
            })
            currentSafe = 0
            takeAnim()
        else
            TriggerEvent("police:SetCopAlert")
            SetNuiFocus(false, false)
            SendNUIMessage({
                action = "closeKeypad",
                error = true,
            })
            currentSafe = 0
        end
    end, currentSafe)
end)

RegisterNetEvent('prp-storerobbery:client:setRegisterStatus')
AddEventHandler('prp-storerobbery:client:setRegisterStatus', function(register, bool)
    Config.Registers[register].robbed = bool
end)

RegisterNetEvent('prp-storerobbery:client:setSafeStatus')
AddEventHandler('prp-storerobbery:client:setSafeStatus', function(safe, bool)
    Config.Safes[safe].robbed = bool
end)

RegisterNetEvent('prp-storerobbery:client:robberyCall')
AddEventHandler('prp-storerobbery:client:robberyCall', function(type, key, streetLabel, coords)
    local job = nil
    if PlayerJob.name == nil then
        job = PRPCore.Functions.GetPlayerData().job.name
    else
        job = PlayerJob.name
    end

    if job == "police" then
        local cameraId = 4
        if type == "safe" then
            cameraId = Config.Safes[key].camId
        else
            cameraId = Config.Registers[key].camId
        end
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
            timeOut = 10000,
            alertTitle = "Store Robbery",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = {
                [1] = {
                    icon = '<i class="fas fa-video"></i>',
                    detail = cameraId,
                },
                [2] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
        })

        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 458)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911: Store Robbery")
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