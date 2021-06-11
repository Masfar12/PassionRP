Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

PRPCore = nil
local PlayerJob = {}

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

local isLoggedIn = false

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
	isLoggedIn = true
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


---------------
-- Variables --
---------------
Config.Vehicles = {
    ["winery"] = {
        ["coords"] = { x = -1928.78, y = 2059.94, z = 140.83 },
        ["vehicle"] = "pounder2",
        ["spawn"] = { x = -1909.9608154297, y = 2052.6789550781, z = 140.73709106445, h = 166.55654907227 },
        ["despawn"] =  { x = -1921.89, y = 2035.89, z = 140.83 },
        ["job"] =  "wine",
    }
} 

Config.Vehicles = {
    ["taco"] = {
        ["coords"] = { x = 404.89, y = -1923.23, z = 24.75 },
        ["vehicle"] = "taco",
        ["spawn"] = { x = 395.38659667969, y = -1920.2622070312, z = 24.678033828735, h = 339.56359863281 },
        ["despawn"] =  { x = 395.38, y = -1920.26, z = 24.67 },
        ["job"] =  "taco",
    }
} 



-------------
-- Threads --
-------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn and PRPCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            for k, v in pairs(Config.Vehicles) do
                local coords = v.coords
                local vehicle = v.vehicle
                local job = v.job
                if (GetDistanceBetweenCoords(pos, coords.x, coords.y, coords.z, true) < 2.0) then
                    DrawText3Ds(coords.x, coords.y, coords.z, "~g~E~w~ - Vehicle")
                    if IsControlJustReleased(0, 38) then
                        local spawn = v.spawn
                        if PlayerJob.name == job then
                            PRPCore.Functions.SpawnVehicle(vehicle, function(veh)
                                SetVehicleNumberPlateText(veh, "TGIF"..tostring(math.random(1000, 9999)))
                                SetEntityHeading(veh, spawn.h)
                                exports['LegacyFuel']:SetFuel(veh, 100.0)
                                TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                SetVehicleEngineOn(veh, true, true)
                            end, spawn, true)
                        end
                    end
                else
                    Citizen.Wait(2000)
                end

                local despawn = v.despawn
                if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                    if (GetDistanceBetweenCoords(pos, despawn.x, despawn.y, despawn.z, true) < 5.0) then
                        DrawText3Ds(despawn.x, despawn.y, despawn.z, "~g~E~w~ - Despawn")
                        if IsControlJustReleased(0, 38) then
                            PRPCore.Functions.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                        end
                    else
                        Citizen.Wait(2000)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn and PRPCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            for k, v in pairs(Config.Vehicles) do
                local despawn = v.despawn
                if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                    if (GetDistanceBetweenCoords(pos, despawn.x, despawn.y, despawn.z, true) < 5.0) then
                        DrawText3Ds(despawn.x, despawn.y, despawn.z, "~g~E~w~ - Despawn")
                        if IsControlJustReleased(0, 38) then
                            PRPCore.Functions.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                        end
                    else
                        Citizen.Wait(2000)
                    end
                end
            end
        end
    end
end)


---------------------
-- Local Functions --
---------------------

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