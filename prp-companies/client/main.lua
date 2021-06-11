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
local Debug = false
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
    }
}

-- This is where people can withdraw company money
local PacificWithdraw = vector3(253.36219787598, 220.67625427246, 106.28659820557)


---------------
-- Polyzones --
---------------
AddEventHandler("prp-polyzone:enter", function(name)

    if name == "Arcade:TP:Outside" then 
        SetEntityCoords(PlayerPedId(), 2738.0576171875, -377.06069946289, -47.993015289307, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 84.91)
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.Wait(500)
        FreezeEntityPosition(PlayerPedId(), false)
        Citizen.Wait(100)
        DoScreenFadeIn(1000)
    end

    if name == "Arcade:TP:Inside" then
        SetEntityCoords(PlayerPedId(), 762.17, -816.23, 26.00, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 268.84)
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.Wait(500)
        FreezeEntityPosition(PlayerPedId(), false)
        Citizen.Wait(100)
        DoScreenFadeIn(1000)
    end

end)


-----------
-- Blips --
-----------
Citizen.CreateThread(function()
    for x, y in pairs(Config.Blips) do

        local coords = y.coords[1]
        local sprite = y.sprite
        local color = y.color
        local label = y.label

        local Blip = AddBlipForCoord(coords["x"], coords["y"], coords["z"])
        SetBlipSprite(Blip, sprite)
        SetBlipScale(Blip, 0.75)
        SetBlipColour(Blip, 14)

        SetBlipDisplay(Blip, 4)
        SetBlipAsShortRange(Blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(label)
        EndTextCommandSetBlipName(Blip)
    end
end)

------------
-- Events --
------------
RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('prp-companies:client:ActiveCamera')
AddEventHandler('prp-companies:client:ActiveCamera', function(cameraId)
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

-- Pacific Bank Withdrawl
Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)

        if GetDistanceBetweenCoords(PlayerPos, PacificWithdraw) < 10 then
            InRange = true
            DrawMarker(2, PacificWithdraw.x, PacificWithdraw.y, PacificWithdraw.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
            if GetDistanceBetweenCoords(PlayerPos, PacificWithdraw) < 1 then
                DrawText3Ds(PacificWithdraw.x, PacificWithdraw.y, PacificWithdraw.z + 0.15, '~g~E~w~ - Withdraw Company Money')
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('prp-companies:server:withdraw')
                end
            end
        end

        for k, v in pairs(Config.Deeds) do
            if GetDistanceBetweenCoords(PlayerPos, v.coords) < 5 then
                InRange = true
                DrawText3Ds(v.coords.x, v.coords.y, v.coords.z + 0.15, '~g~E~w~ - View Deed')
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('prp-companies:server:viewdeed', k)
                end
            end
        end

        if not InRange then
            Citizen.Wait(5000)
        end
        Citizen.Wait(5)
    end
end)

-- Cameras
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
