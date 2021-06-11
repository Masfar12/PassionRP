PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

local onlinePolice = {}
local onDuty = false
local nuiState = false
local trackingOfficer = nil

Citizen.CreateThread(function()
    while nuiState do
        Citizen.Wait(0)
        DisableControlAction(0, 1, nuiState) -- LookLeftRight
        DisableControlAction(0, 2, nuiState) -- LookUpDown
        DisableControlAction(0, 142, nuiState) -- MeleeAttackAlternate
        DisableControlAction(0, 18, nuiState) -- Enter
        DisableControlAction(0, 322, nuiState) -- ESC
        DisableControlAction(0, 106, nuiState) -- VehicleMouseControlOverride
    end
end)

RegisterNUICallback('track', function(data)
    trackingOfficer = data.id
    TrackOfficer(data.id)
    SetNuiFocus(false, false)
    nuiState = false
end)

RegisterNUICallback('ping', function(data)
    TriggerServerEvent('dutyTracker:server:SetWaypointOnSrc', data.id)
    SetNuiFocus(false, false)
    nuiState = false
end)

RegisterNUICallback('exit', function(data)
    SetNuiFocus(false, false)
    nuiState = false
    if data.message ~= nil then
        PRPCore.Functions.Notify(data.message, data.type)
    end
end)

function TrackOfficer(targetSrc)
    while trackingOfficer ~= nil do
        TriggerServerEvent('dutyTracker:server:SetWaypointOnSrc', targetSrc)
        Wait(5000)
    end
end

RegisterNetEvent('dutyTracker:client:ToggleDutyTracker')
AddEventHandler('dutyTracker:client:ToggleDutyTracker', function()
    PRPCore.Functions.TriggerCallback('dutyTracker:GetDutyPlayers', function(dutyPlayers)
        SetNuiFocus(nuiState, nuiState)
        SendNUIMessage({
            type = 'trackerUi',
            dutyPlayers = dutyPlayers,
            tracking = trackingOfficer,
            player = GetPlayerServerId(PlayerId()),
            state = nuiState
        })
    end)
    nuiState = not nuiState
end)

RegisterNetEvent('dutyTracker:client:SetWaypointOnCoords')
AddEventHandler('dutyTracker:client:SetWaypointOnCoords', function(coords)
    if coords ~= nil then
        SetNewWaypoint(coords.x, coords.y)
    end
end)

RegisterNetEvent('dutyTracker:client:DisableTracker')
AddEventHandler('dutyTracker:client:DisableTracker', function()
    trackingOfficer = nil
    DeleteWaypoint()
end)
