PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

local isLoggedIn = false
local AlertActive = false
PlayerData = {}
PlayerJob = {}
onDuty = false

-- Code

Citizen.CreateThread(function()
    Wait(100)
    if PRPCore.Functions.GetPlayerData() ~= nil then
        PlayerData = PRPCore.Functions.GetPlayerData()
        PlayerJob = PlayerData.job
    end
end)

Citizen.CreateThread(function()
    while true do
        if isLoggedIn then
            local playerData = PRPCore.Functions.GetPlayerData()
            onDuty = playerData.job.onduty
        end
        Citizen.Wait(10000)
    end
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    if JobInfo.name == "police" then
        if PlayerJob.onduty then
            PlayerJob.onduty = false
        end
    end
    PlayerJob.onduty = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData =  PRPCore.Functions.GetPlayerData()
    PlayerJob = PRPCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('prp-policealerts:ToggleDuty')
AddEventHandler('prp-policealerts:ToggleDuty', function(Duty)
    PlayerJob.onduty = Duty
end)

RegisterNetEvent('prp-policealerts:client:AddPoliceAlert')
AddEventHandler('prp-policealerts:client:AddPoliceAlert', function(data, forBoth)
    local found = false
    local x = PRPCore.Functions.GetPlayerData().items
    local len = tablelength(x)
    local found = false
    for i=1,len do
        if PRPCore.Functions.GetPlayerData().items[i] ~= nil and PRPCore.Functions.GetPlayerData().items[i]["name"] == "radioscanner" then
            found = true
        end
    end

    if forBoth then
        if (PlayerJob.name == "police" or PlayerJob.name == "doctor" or PlayerJob.name == "ambulance") and onDuty or found then
            if data.alertTitle == "Officer 10-13" or data.alertTitle == "EMS Assistance" or data.alertTitle == "Doctor Assistance" then
                TriggerServerEvent("InteractSound_SV:PlayOnSource", "emergency", 0.7)
            else
                PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
            end
            data.callSign = data.callSign ~= nil and data.callSign or PlayerData.metadata["callsign"]
            data.alertId = math.random(11111, 99999)
            SendNUIMessage({
                action = "add",
                data = data,
            })
        end
    else
        if (PlayerJob.name == "police" and onDuty ) or found then
            if data.alertTitle == "Officer 10-13" or data.alertTitle == "EMS Assistance" or data.alertTitle == "Doctor Assistance" then

                TriggerServerEvent("InteractSound_SV:PlayOnSource", "emergency", 0.7)
            else
                PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
            end
            data.callSign = data.callSign ~= nil and data.callSign or PlayerData.metadata["callsign"]
            data.alertId = math.random(11111, 99999)
            SendNUIMessage({
                action = "add",
                data = data,
            })
        end 
    end

    AlertActive = true
    SetTimeout(data.timeOut, function()
        AlertActive = false
    end)
end)

-- Citizen.CreateThread(function()
--     while true do
--         if AlertActive then
--             if IsControlJustPressed(0, 19) then
--                 SetNuiFocus(true, true)
--                 SetNuiFocusKeepInput(true, false)
--                 SetCursorLocation(0.965, 0.12)
--                 MouseActive = true
--             end
--         end

--         if MouseActive then
--             if IsControlJustReleased(0, 19) then
--                 SetNuiFocus(false, false)
--                 SetNuiFocusKeepInput(false, false)
--                 MouseActive = false
--             end
--         end

--         Citizen.Wait(6)
--     end
-- end)

RegisterNUICallback('SetWaypoint', function(data)
    local coords = data.coords

    SetNewWaypoint(coords.x, coords.y)
    PRPCore.Functions.Notify('GPS ingesteld!')
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false, false)
    MouseActive = false
end)

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
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

-- Citizen.CreateThread(function()
--     Wait(500)
--     local ped = GetPlayerPed(-1)
--     local veh = GetVehiclePedIsIn(ped)

--     exports["vstancer"]:SetVstancerPreset(veh, -0.8, 0.0, -0.8, 0.0)
-- end)


-- #The max value you can increase or decrease the front Track Width
-- frontMaxOffset=0.25

-- #The max value you can increase or decrease the front Camber
-- frontMaxCamber=0.20

-- #The max value you can increase or decrease the rear Track Width
-- rearMaxOffset=0.25

-- #The max value you can increase or decrease the rear Camber
-- rearMaxCamber=0.20