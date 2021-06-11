----------------
-- Core Stuff --
----------------
PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)



---------------
-- Variables --
---------------
local isLoggedIn = true
PlayerJob = {}
local alreadyGasing = false
local alreadyTaking = false
local Debug = false

local TrollyCoordsX = 2524.6923828125
local TrollyCoordsY = -236.91571044922
local TrollyCoordsZ = -70.737106323242

local requiredRoomLocksShowed = false
local requiredRoomSecurityShowed = false
local Security = {
    ["Gas"] = true
}

local createdCamera = 0

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

local CamerasConfig = {
    hideradar = false,
    cameras = {
        [1] = {label = "Casino Vault", x = 2506.4282226563, y = -238.39817810059, z = -69.637130737305, r = {x = -25.0, y = 0.0, z = 269.342}, canRotate = false, isOnline = true, ip = 1},
        [2] = {label = "Casino Management Door", x = 1129.34, y = 264.24, z = -49.34, r = {x = -25.0, y = 0.0, z = -269.342}, canRotate = false, isOnline = true, ip = 2},
        [3] = {label = "Casino Lounge", x = 1135.27, y = 232.72, z = -49.35, r = {x = -25.0, y = 0.0, z = 15.342}, canRotate = false, isOnline = true, ip = 3},
        [4] = {label = "Casino Floor", x = 1117.83, y = 235.56, z = -47.35, r = {x = -25.0, y = 0.0, z = 134.51}, canRotate = false, isOnline = true, ip = 4},
        [5] = {label = "Casino Floor 2", x = 1103.51, y = 234.14, z = -47.45, r = {x = -25.0, y = 0.0, z = 219.68}, canRotate = false, isOnline = true, ip = 5},
    }
}

---------------
-- Polyzones --
---------------
AddEventHandler("prp-polyzone:enter", function(name)
    if name ~= "Casino:GasChamberEnter" then return end
    if Security.Gas then
        TriggerServerEvent('prp-casino:server:SendCasinoEmergencyAlert')
        TriggerServerEvent('prp-casino:server:makeGas')
        PRPCore.Functions.Notify("You smell gas!", "error", 10000)
    end

end)
AddEventHandler("prp-polyzone:exit", function(name)
    if name ~= "Casino:GasChamberEnter" then return end
    print("exiting hallway")
end)

AddEventHandler("prp-polyzone:enter", function(name)
    if name ~= "Casino:GasChamberDie" then return end
    if Security.Gas then
        print("killing")
        TriggerServerEvent('prp-casino:server:kill')
        PRPCore.Functions.Notify("Everything is going white!", "error", 10000)
    end
end)
AddEventHandler("prp-polyzone:exit", function(name)
    if name ~= "Casino:GasChamberDie" then return end
    print("exit hallway dead")
end)


------------
-- Events --
------------
RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = PRPCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('prp-casino:client:emergencyAlert')
AddEventHandler('prp-casino:client:emergencyAlert', function()

    PlayerJob = PRPCore.Functions.GetPlayerData().job

    if (PlayerJob.name == 'casino') and PlayerJob.grade.level >= 3 then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        TriggerEvent("chatMessage", "CASINO SECURITY", "error", "SECURITY BREACH IN CASINO!!!")
    end
end)

RegisterNetEvent('prp-casino:client:makeGas')
AddEventHandler('prp-casino:client:makeGas', function()
    if alreadyGasing then
        print("Alreadying Gasing")
    else
        alreadyGasing = true
        if not HasNamedPtfxAssetLoaded("core") then
            RequestNamedPtfxAsset("core")
            while not HasNamedPtfxAssetLoaded("core") do
                Wait(1)
            end
        end
    
        UseParticleFxAssetNextCall("core")
        local part = StartParticleFxLoopedAtCoord("ent_amb_fbi_smoke_stair_gather", 2456.3208007813, -279.31597900391, -70.806526184082-0.5, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
        Citizen.Wait(20000)
        StopParticleFxLooped(part)
    end
end)

RegisterNetEvent('prp-casino:client:ActiveCamera')
AddEventHandler('prp-casino:client:ActiveCamera', function(cameraId)
    if tonumber(cameraId) ~= nil then
        cameraId = tonumber(cameraId)
    end

    if CamerasConfig.cameras[cameraId] ~= nil then
        local cam = CamerasConfig.cameras[cameraId]

        DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
            Citizen.Wait(0)
        end
        SendNUIMessage({
            type = "enablecam",
            label = cam.label,
            id = cameraId,
            connected = cam.isOnline,
            time = GetCurrentTime(),
            ip = cam.ip,
        })
        local firstCamx = cam.x
        local firstCamy = cam.y
        local firstCamz = cam.z
        local firstCamr = cam.r
        SetFocusArea(firstCamx, firstCamy, firstCamz, firstCamx, firstCamy, firstCamz)
        ChangeSecurityCamera(firstCamx, firstCamy, firstCamz, firstCamr)
        currentCameraIndex = a
        currentCameraIndexIndex = 1
        DoScreenFadeIn(250)
    elseif cameraId == 0 then
        DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
            Citizen.Wait(0)
        end
        CloseSecurityCamera()
        SendNUIMessage({
            type = "disablecam",
        })
        DoScreenFadeIn(250)
    else
        PRPCore.Functions.Notify("Camera does not exist..", "error")
    end
end)


---------------------
-- Citizen Threads --
---------------------

-- This citizen thread controls some markers
Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)
        local dist = GetDistanceBetweenCoords(PlayerPos, 1116.1802978516, 221.87390136719, -49.435108184814)
        if dist < 10 then
            InRange = true
            DrawMarker(2, 1116.1802978516, 221.87390136719, -49.435108184814, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
            if dist < 1 then
                DrawText3Ds(1116.1802978516, 221.87390136719, -49.435108184814 + 0.15, '~g~E~w~ - Exchange Casino Chips')
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('prp-casino:sell')
                end
            end
        end

        if not InRange then
            Citizen.Wait(5000)
        end
        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)
        local dist = GetDistanceBetweenCoords(PlayerPos, 1116.0843505859, 217.99923706055, -49.435153961182)
        if dist < 10 then
            InRange = true
            DrawMarker(2, 1116.0843505859, 217.99923706055, -49.435153961182, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
            if dist < 1 then
                DrawText3Ds(1116.0843505859, 217.99923706055, -49.435153961182 + 0.15, '~g~E~w~ - Buy Bulk Chips')
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('prp-casino:buy')
                end
            end
        end

        if not InRange then
            Citizen.Wait(5000)
        end
        Citizen.Wait(5)
    end
end)


-- This citizen thread controls 3D Text
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn and PRPCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))

            -- Teleporter down to the vault
            if (GetDistanceBetweenCoords(pos, 1107.0654296875, 243.19664001465, -45.840976715088, true) < 1.5) then
                DrawText3Ds(1107.0654296875, 243.19664001465, -45.840976715088, "~g~E~w~ - Take elevator to vault")
                if IsControlJustReleased(0, 38) then
                    DoScreenFadeOut(500)
                    while not IsScreenFadedOut() do
                        Citizen.Wait(10)
                    end

                    SetEntityCoords(PlayerPedId(), 2520.5817871094, -279.25064086914, -70.715637207031, 0, 0, 0, false)
                    SetEntityHeading(PlayerPedId(), 270.2)

                    Citizen.Wait(100)

                    DoScreenFadeIn(1000)
                end
            end

            -- Teleporter up from the vault
            if (GetDistanceBetweenCoords(pos, 2521.0656738281, -279.00033569336, -70.722785949707, true) < 1.5) then
                DrawText3Ds(2521.0656738281, -279.00033569336, -70.722785949707, "~g~E~w~ - Take elevator up")
                if IsControlJustReleased(0, 38) then
                    DoScreenFadeOut(500)
                    while not IsScreenFadedOut() do
                        Citizen.Wait(10)
                    end

                    SetEntityCoords(PlayerPedId(), 1107.0654296875, 243.19664001465, -45.840976715088, 0, 0, 0, false)
                    SetEntityHeading(PlayerPedId(), 273.0)

                    Citizen.Wait(100)

                    DoScreenFadeIn(1000)
                end
            end

            -- Go to Penthouse
            if (GetDistanceBetweenCoords(pos, 1121.8518066406, 264.48358154297, -45.84103012085, true) < 1.5) then
                DrawText3Ds(1121.8518066406, 264.48358154297, -45.84103012085, "~g~E~w~ - Walk into Penthouse")
                if IsControlJustReleased(0, 38) then
                    DoScreenFadeOut(500)
                    while not IsScreenFadedOut() do
                        Citizen.Wait(10)
                    end

                    SetEntityCoords(PlayerPedId(), 980.95745849609, 56.522644042969, 116.16416931152, 0, 0, 0, false)
                    SetEntityHeading(PlayerPedId(), 58.09)

                    Citizen.Wait(100)

                    DoScreenFadeIn(1000)
                end
            end

            
            -- Go to Casino from Penthouse
            if (GetDistanceBetweenCoords(pos, 980.95745849609, 56.522644042969, 116.16416931152, true) < 1.5) then
                DrawText3Ds(980.95745849609, 56.522644042969, 116.16416931152, "~g~E~w~ - Walk into Casino")
                if IsControlJustReleased(0, 38) then
                    DoScreenFadeOut(500)
                    while not IsScreenFadedOut() do
                        Citizen.Wait(10)
                    end

                    SetEntityCoords(PlayerPedId(), 1121.8518066406, 264.48358154297, -45.84103012085, 0, 0, 0, false)
                    SetEntityHeading(PlayerPedId(), 58.09)

                    Citizen.Wait(100)

                    DoScreenFadeIn(1000)
                end
            end

            -- Computer to check casino balance.
            if (GetDistanceBetweenCoords(pos, 1111.7453613281, 243.04351806641, -45.92312316895, true) < 1.5) then
                DrawText3Ds(1111.7453613281, 243.04351806641, -45.962312316895, "~g~E~w~ - Check Vault Balance")
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('prp-casino:server:getvaultbalance')
                end
            end

            -- Roulette
            if (GetDistanceBetweenCoords(pos, 1130.429, 267.00, -51.03, true) < 2.5) then
                DrawText3Ds(1130.429, 267.00, -51.03, "~g~E~w~ - Play Roulette")
                if IsControlJustReleased(0, 38) then
					TriggerEvent('route68_ruletka:start')
                end
            end

            -- Withdraw cash
            if (GetDistanceBetweenCoords(pos, 2524.6923828125, -236.91571044922, -70.737106323242, true) < 1.5) then
                DrawText3Ds(2524.6923828125, -236.91571044922, -70.737106323242, "~g~E~w~ - Take Vault Cash")
                if IsControlJustPressed(0, 38) then
                    
                    if alreadyTaking == false then
                        alreadyTaking = true

                        -- This callback brings back the current vault balance
                        PRPCore.Functions.TriggerCallback('prp-casino:server:getbalance', function(amount)

                            -- If we return false, something went wrong
                            if amount == false then
                                PRPCore.Functions.Notify("Cannot get vault balance!", "error", 15000)
                            elseif amount == 0 then
                                PRPCore.Functions.Notify("Vault balance is 0!", "error", 15000)
                            else

                                -- This callback brings back the number of seconds since the last withdraw was
                                PRPCore.Functions.TriggerCallback('prp-casino:server:getlastwithdraw', function(last)
                                    if Debug then print("last before", last) end

                                    local job = PRPCore.Functions.GetPlayerData().job.name
                                    if Debug then print(job) end

                                    if job ~= "casino" then
                                        last = 99999999
                                    end

                                    if Debug then print("last after", last) end
                                    if last > 86400 then

                                        local ped = PlayerPedId()
                                        TaskGoStraightToCoord(ped, 2524.6923828125, -236.91571044922, -70.737182617188, 10.0, 10, 258.84, 0.5)
                                        Citizen.Wait(2000)
                                        SetEntityHeading(ped, 208.06)

                                        local animDict = "anim@heists@ornate_bank@grab_cash"
                                        RequestAnimDict(animDict)
                                        while not HasAnimDictLoaded(animDict) do
                                            Citizen.Wait(50)
                                        end

                                        RequestModel(GetHashKey("hei_p_m_bag_var22_arm_s"))
                                        while not HasModelLoaded(GetHashKey("hei_p_m_bag_var22_arm_s")) do
                                            Citizen.Wait(100)
                                        end

                                        bagProp = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(ped), true, false, false)
                                        SetPedComponentVariation(ped, 5, 0, 0, 0)

                                        scene1 = NetworkCreateSynchronisedScene(TrollyCoordsX, TrollyCoordsY, TrollyCoordsZ-0.5, vector3(0, -0, 104.287), 2, false, false, 1065353216, 0, 1.3)
                                        NetworkAddPedToSynchronisedScene(ped, scene1, animDict, "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
                                        NetworkAddEntityToSynchronisedScene(bagProp, scene1, animDict, "bag_intro", 4.0, -8.0, 1)
                                        NetworkStartSynchronisedScene(scene1)
                                        Citizen.Wait(1500)


                                        scene2 = NetworkCreateSynchronisedScene(TrollyCoordsX, TrollyCoordsY, TrollyCoordsZ-0.5, vector3(0, -0, 104.287), 2, false, false, 1065353216, 0, 1.3)
                                        NetworkAddPedToSynchronisedScene(ped, scene2, animDict, "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
                                        NetworkAddEntityToSynchronisedScene(bagProp, scene2, animDict, "bag_grab", 4.0, -8.0, 1)
                                        NetworkAddEntityToSynchronisedScene(trolleyObject, scene2, animDict, "cart_cash_dissapear", 4.0, -8.0, 1)
                                        NetworkStartSynchronisedScene(scene2)

                                        if Debug then
                                            Citizen.Wait(0)
                                        else
                                            Citizen.Wait(60000)
                                        end

                                        scene3 = NetworkCreateSynchronisedScene(2524.453125, -236.61911010742, -70.737167358398, vector3(0, -0, -104.287), 2, false, false, 1065353216, 0, 1.3)
                                        NetworkAddPedToSynchronisedScene(ped, scene3, animDict, "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
                                        NetworkAddEntityToSynchronisedScene(bagProp, scene3, animDict, "bag_exit", 4.0, -8.0, 1)
                                        NetworkStartSynchronisedScene(scene3)

                                        -- local emptyTrolleyProp = GetHashKey("hei_prop_hei_cash_trolly_03")
                                        -- RequestModel(emptyTrolleyProp)
                                        -- while not HasModelLoaded(emptyTrolleyProp) do
                                        --     Citizen.Wait(100)
                                        -- end
                                        -- DeleteObject(trolleyObject)
                                        -- Wait(100)
                                        -- local emptyTrolley = CreateObject(emptyTrolleyProp, TrollyCoordsX, TrollyCoordsY, TrollyCoordsZ + vector3(0.0, 0.0, - 0.985), true)
                                        -- SetEntityRotation(emptyTrolley, vector3(0, -0, -104.287))
                                        -- PlaceObjectOnGroundProperly(emptyTrolley)

                                        TriggerServerEvent('prp-casino:server:withdrawvaultbalance', pos)
                                        alreadyTaking = false
                                        Citizen.Wait(1900)


                                        DeleteEntity(bagProp)
                                        SetPedComponentVariation(ped, 5, 45, 0, 2)
                                        RemoveAnimDict(animDict)
                                        SetModelAsNoLongerNeeded(emptyTrolleyProp)
                                        SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
                                        FreezeEntityPosition(ped, false)
                                    else
                                        local minutes = round(((86400 - last)/60), 0)
                                        PRPCore.Functions.Notify("You cannot withdraw yet. You need to wait "..minutes.." more minutes!", "error", 15000)
                                    end
                                end)
                            end
                        end)
                    else
                        PRPCore.Functions.Notify("Vault busy try again!", "error", 5000)
                        alreadyTaking = false
                    end
                end
            end

            if (GetDistanceBetweenCoords(pos, 2480.7575683594, -274.98358154297, -70.694236755371, true) < 1.0) then
                DrawText3Ds(2480.7575683594, -274.98358154297, -70.694236755371, "~g~E~w~ - Disable Security Room Locks")
                
                if IsControlJustReleased(0, 38) then
                    PRPCore.Functions.TriggerCallback('PRPCore:HasItem', function(result)

                    if result then
                        TriggerEvent("mhacking:show")
                        TriggerEvent("mhacking:start", math.random(2, 2), math.random(5, 15), OnHackDone)

                        local breakChance = math.random(1,2)
                        if breakChance == 2 then
                            PRPCore.Functions.Notify("Electronics fried from hacking attempt!", "error", 15000)
                            TriggerServerEvent("PRPCore:Server:RemoveItem", "trojan_usb", 1)
                        end

                    else
                        PRPCore.Functions.Notify("Do not have the right electronics device!", "error", 15000)
                    end
                    end, "trojan_usb")
                end
            end

            if (GetDistanceBetweenCoords(pos, 2468.2722167969, -266.74700927734, -70.694152832031, true) < 1.0) then
                if Security.Gas then
                    DrawText3Ds(2468.2722167969, -266.74700927734, -70.694152832031, "~g~E~w~ - Disable Vault Security")
                else
                    DrawText3Ds(2468.2722167969, -266.74700927734, -70.694152832031, "~g~E~w~ - Enable Vault Security") 
                end

                if IsControlJustReleased(0, 38) then
                    PlayerJob = PRPCore.Functions.GetPlayerData().job

                    if (PlayerJob.name == 'casino') and PlayerJob.grade.level >= 5 then
                        if Security.Gas then
                            Security.Gas = false
                            TriggerServerEvent('prp-casino:server:syncsecurity')
                        else
                            TriggerServerEvent('prp-casino:server:syncsecurity')
                            Security.Gas = true
                        end
                    else
                        PRPCore.Functions.TriggerCallback('PRPCore:HasItem', function(result)
                            if result then
                                TriggerEvent("utk_fingerprint:Start", 4, 2, 2, function(outcome, reason)
                                if outcome == true then -- reason will be nil if outcome is true
                                    if Security.Gas then
                                        TriggerServerEvent('prp-casino:server:syncsecurity')
                                        Security.Gas = false
                                    else
                                        TriggerServerEvent('prp-casino:server:syncsecurity')
                                        Security.Gas = true
                                    end
                                elseif outcome == false then
                                    PRPCore.Functions.Notify("You failed the hack!", "error", 10000)
                                    TriggerServerEvent('prp-casino:server:SendCasinoEmergencyAlert')
                                end
                            end)

                            local breakChance = math.random(1,2)
                            if breakChance < 3 then -- always do
                                PRPCore.Functions.Notify("Electronics fried from hacking attempt!", "error", 15000)
                                TriggerServerEvent("PRPCore:Server:RemoveItem", "hackermanlaptop", 1)
                            end
                        else
                            PRPCore.Functions.Notify("You do not have the right type of laptop!", "error", 15000)
                        end

                        end, "hackermanlaptop")
                    end
                end
            end
        else
            Citizen.Wait(2000)
        end
    end
end)

-- This citizen thread updates the client on the status of config locks
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local InRangeSec = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)
        local dist = GetDistanceBetweenCoords(PlayerPos, 2468.2722167969, -266.74700927734, -70.694152832031)
        if dist < 100 then
            InRangeSec = true
            PRPCore.Functions.TriggerCallback('prp-casino:server:getsecurity', function(config)
                Security.Gas = config
            end)
        end

        if not InRangeSec then
            Citizen.Wait(30000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(PlayerId())
        local pedPos = GetEntityCoords(ped, false)
        local pedHead = GetEntityRotation(ped, 2)
        if IsControlJustReleased(0, Keys["H"]) then
            print("Rotation: " ..GetEntityRotation(GetPlayerPed(-1)))
        end
        if createdCamera ~= 0 then
            local instructions = CreateInstuctionScaleform("instructional_buttons")
            DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
            SetTimecycleModifier("scanline_cam_cheap")
            SetTimecycleModifierStrength(1.0)

            -- CLOSE CAMERAS
            if IsControlJustPressed(1, 177) then
                DoScreenFadeOut(250)
                while not IsScreenFadedOut() do
                    Citizen.Wait(0)
                end
                CloseSecurityCamera()
                SendNUIMessage({
                    type = "disablecam",
                })
                DoScreenFadeIn(250)
            end
        else
            --Citizen.Wait(2000)
        end
        Citizen.Wait(0)
    end
end)

---------------
-- Functions --
---------------

function OnHackDone(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        local dCoords = vector3(2475.4599609375, -264.45538330078, -70.694160461426)
        TriggerServerEvent('nui_doorlock:server:UnlockDoorByCoords', dCoords)
        PRPCore.Functions.Notify("Unlocked door to security room!", "success", 15000)
    else
		TriggerEvent('mhacking:hide')
        TriggerServerEvent('prp-casino:server:SendCasinoEmergencyAlert')
	end
end


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

function GrabCashFromTrolley()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local cashProp = GetHashKey("hei_prop_heist_cash_pile")
	RequestModel(cashProp)
	while not HasModelLoaded(cashProp) do
		Citizen.Wait(100)
	end
	local cashPile = CreateObject(cashProp, coords-vector3(0,0,1), true)
	FreezeEntityPosition(cashPile, true)
	SetEntityInvincible(cashPile, true)
	SetEntityNoCollisionEntity(cashPile, ped)
	SetEntityVisible(cashPile, false, false)
	AttachEntityToEntity(cashPile, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
	local takingCashTime = GetGameTimer()
	Citizen.CreateThread(function()
		while GetGameTimer() - takingCashTime < 37000 do
			Citizen.Wait(0)
								
			if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
				if not IsEntityVisible(cashPile) then
					SetEntityVisible(cashPile, true, false)
				end
			end		
			if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
				if IsEntityVisible(cashPile) then
					SetEntityVisible(cashPile, false, false)

				end
			end
		end
		DeleteObject(cashPile)
	end)
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
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

 function GetCurrentTime()
    local hours = GetClockHours()
    local minutes = GetClockMinutes()
    if hours < 10 then
        hours = tostring(0 .. GetClockHours())
    end
    if minutes < 10 then
        minutes = tostring(0 .. GetClockMinutes())
    end
    return tostring(hours .. ":" .. minutes)
end

function ChangeSecurityCamera(x, y, z, r)
    if createdCamera ~= 0 then
        DestroyCam(createdCamera, 0)
        createdCamera = 0
    end

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, x, y, z)
    SetCamRot(cam, r.x, r.y, r.z, 2)
    RenderScriptCams(1, 0, 0, 1, 1)
    Citizen.Wait(250)
    createdCamera = cam
end

function CloseSecurityCamera()
    DestroyCam(createdCamera, 0)
    RenderScriptCams(0, 0, 1, 1, 1)
    createdCamera = 0
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFocusEntity(GetPlayerPed(PlayerId()))
    FreezeEntityPosition(GetPlayerPed(PlayerId()), false)
end

function CreateInstuctionScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    InstructionButton(GetControlInstructionalButton(1, 194, true))
    InstructionButtonMessage("Close camera")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end

function InstructionButton(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function InstructionButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end
