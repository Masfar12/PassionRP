PRPCore = nil
local currentGarage = nil
PlayerJob = {}
isLoggedIn = false

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

--- CODE

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "drift" then
                TriggerServerEvent("PRPCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

Citizen.CreateThread(function()
	AddTextEntry("Drift School", "Drift School")
	for k, v in pairs(Config.Shops) do
		local blip = AddBlipForCoord(v)
		SetBlipSprite(blip, 545)
		SetBlipColour(blip, 0)
		SetBlipScale(blip, 0.75)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("Drift School")
		EndTextCommandSetBlipName(blip)
	end
end)

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

function MenuGarage()
    ped = GetPlayerPed(-1);
    MenuTitle = "Drift Garage"
    ClearMenu()
    Menu.addButton("Drift Garage", "DriftGarage", nil)
    Menu.addButton("Close Menu", "close", nil)
    TriggerEvent("inmenu",true)
end

function yeet(label)
    -- print(label)
end

function DriftGarage()
    ped = GetPlayerPed(-1);
    MenuTitle = "My Vehicles :"
    ClearMenu()

    for k, v in pairs(DriftCars) do
        curGarage = DriftSpots.label
        local label = PRPCore.Shared.Vehicles[v.vehicle]["name"]
        if PRPCore.Shared.Vehicles[v.vehicle]["brand"] ~= nil then
            label = PRPCore.Shared.Vehicles[v.vehicle]["name"]
        end

        Menu.addButton(label, "TakeOutVehicle", v, "", " Motor: 100%", " Body: 100%", " Fuel: 100%")
    end
        
    Menu.addButton("Back", "MenuGarage", nil)
    TriggerEvent("inmenu",true)
end

function TakeOutVehicle(vehicle)
    PRPCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
        local properties = {
            modEngine       = 2,
            modBrakes       = 2,
            modTransmission = 2,
            modSuspension   = 2,
            modTurbo        = true,
        }
        if vehicle.vehicle == "yosemite6str" then
            SetVehicleExtra(veh, 1, false)
            SetVehicleExtra(veh, 2, true)
        end
        PRPCore.Functions.SetVehicleProperties(veh, properties)
        SetVehicleNumberPlateText(veh, PRPCore.Shared.RandomStr(3)..math.random(11111,99999))
        SetEntityHeading(veh, DriftSpots[currentGarage].vehicle.h)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetEntityAsMissionEntity(veh, true, true)
        PRPCore.Functions.Notify("Vehicle Info: Motor: 100% Body: 100% Fuel: 100%", "primary", 4500)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, DriftSpots[currentGarage].vehicle, true)
end

function close()
    Menu.hidden = true
    TriggerEvent("inmenu",false)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
    TriggerEvent("inmenu",false)
end

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
    Menu.selection = 0
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(5)
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inGarageRange = false

        if isLoggedIn == true then
            if PlayerJob.name == "drift" and PlayerJob.grade.level > 0 then
                for k, v in pairs(DriftSpots) do
                    local takeDist = GetDistanceBetweenCoords(pos, DriftSpots[k].vehicle.x, DriftSpots[k].vehicle.y, DriftSpots[k].vehicle.z)
                    if takeDist <= 5 then
                        inGarageRange = true
                        DrawMarker(2, DriftSpots[k].vehicle.x, DriftSpots[k].vehicle.y, DriftSpots[k].vehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 156, 136, 255, 222, false, false, false, true, false, false, false)
                        if takeDist <= 1.5 then
                            if not IsPedInAnyVehicle(ped) then
                                DrawText3Ds(DriftSpots[k].vehicle.x, DriftSpots[k].vehicle.y, DriftSpots[k].vehicle.z, '~g~E~w~ - Garage')
                                if IsControlJustPressed(1, 177) and not Menu.hidden then
                                    close()
                                    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                end
                                if IsControlJustPressed(0, 38) then
                                    MenuGarage()
                                    Menu.hidden = not Menu.hidden
                                    currentGarage = k
                                end
                            else
                                --DrawText3Ds(DriftSpots.vehicle.x, DriftSpots.vehicle.y, DriftSpots.vehicle.z, Garages[k].label)
                                DrawText3Ds(DriftSpots[k].vehicle.x, DriftSpots[k].vehicle.y, DriftSpots[k].vehicle.z, '~g~E~w~ - Park Vehicle')
                                local curVeh = GetVehiclePedIsIn(ped)
                                local plate = GetVehicleNumberPlateText(curVeh)
                                if IsControlJustPressed(0, 38) then
                                    PRPCore.Functions.DeleteVehicle(curVeh)
                                    PRPCore.Functions.Notify("Vehicle parked in "..DriftSpots[k].label, "primary", 4500)
                                end
                            end
                        end

                        Menu.renderGUI()

                        if takeDist >= 4 and not Menu.hidden then
                            closeMenuFull()
                        end
                    end
                end
                if not inGarageRange then
                    Citizen.Wait(1000)
                end
            end
            --for k, v in pairs(DriftSpots) do
            --    local dutyDist = GetDistanceBetweenCoords(pos, DriftSpots[k].duty.x, DriftSpots[k].duty.y, DriftSpots[k].duty.z)
            --    if dutyDist <= 2.5 then
            --        if not onDuty then
            --            DrawText3Ds(DriftSpots[k].duty.x, DriftSpots[k].duty.y, DriftSpots[k].duty.z, "~g~E~w~ - Enter service")
            --        else
            --            DrawText3Ds(DriftSpots[k].duty.x, DriftSpots[k].duty.y, DriftSpots[k].duty.z, "~r~E~w~ - Out of service")
            --        end
            --        if IsControlJustReleased(0, 38) then
            --            onDuty = not onDuty
            --            TriggerServerEvent("PRPCore:ToggleDuty")
            --        end
            --    end
            --end
        else
            Citizen.Wait(1500)
        end
    end
end)

function round(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces>0 then
      local mult = 10^numDecimalPlaces
      return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
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