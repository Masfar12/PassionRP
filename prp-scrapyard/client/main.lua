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
local closestScrapyard = 0
local emailSend = false
local isBusy = false

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("PRPCore:Client:OnPlayerLoaded")
AddEventHandler("PRPCore:Client:OnPlayerLoaded", function()
    TriggerServerEvent("prp-scrapyard:server:LoadVehicleList")
end)

Citizen.CreateThread(function()
    while true do
        SetClosestScrapyard()
        Citizen.Wait(10000)
    end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		if closestScrapyard ~= 0 then
			local pos = GetEntityCoords(GetPlayerPed(-1))
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations[closestScrapyard]["deliver"].x, Config.Locations[closestScrapyard]["deliver"].y, Config.Locations[closestScrapyard]["deliver"].z, true) < 10.0 then
				if IsPedInAnyVehicle(GetPlayerPed(-1)) == 1 then
					local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
					if vehicle ~= 0 and vehicle ~= nil then 
						local vehpos = GetEntityCoords(vehicle)
						if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 2.5 and not isBusy then
							DrawText3Ds(vehpos.x, vehpos.y, vehpos.z, "~g~F~w~ - Chop Vehicle")
							if IsControlJustReleased(0, Keys["F"]) then
								if AnyPassengers(vehicle) == false then
									if IsVehicleValid(GetEntityModel(vehicle)) then 
										ScrapVehicle(vehicle)
									else
										PRPCore.Functions.Notify("This vehicle cannot be chopped..", "error")
									end
								else
									PRPCore.Functions.Notify("You cannot scrap a car with a passenger.. sudo is not impressed.", "error")
								end
							end
						end
					end
				end
			end
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations[closestScrapyard]["list"].x, Config.Locations[closestScrapyard]["list"].y, Config.Locations[closestScrapyard]["list"].z, true) < 1.5 then
				if not IsPedInAnyVehicle(GetPlayerPed(-1)) and not emailSend then
					DrawText3Ds(Config.Locations[closestScrapyard]["list"].x, Config.Locations[closestScrapyard]["list"].y, Config.Locations[closestScrapyard]["list"].z, "~g~E~w~ - E-mail vehicle list")
					if IsControlJustReleased(0, 38) then
						CreateListEmail()
					end
				end
			end
		end
	end
end)

RegisterNetEvent('prp-scapyard:client:setNewVehicles')
AddEventHandler('prp-scapyard:client:setNewVehicles', function(vehicleList)
	Config.CurrentVehicles = vehicleList
end)

function CreateListEmail()
	if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then 
		emailSend = true
		local vehicleList = ""
		for k, v in pairs(Config.CurrentVehicles) do
			if Config.CurrentVehicles[k] ~= nil then 
				local vehicleInfo = PRPCore.Shared.Vehicles[v]
				if vehicleInfo ~= nil then 
					vehicleList = vehicleList  .. vehicleInfo["brand"] .. " " .. vehicleInfo["name"] .. "<br />"
				end
			end
		end
		SetTimeout(math.random(15000, 20000), function()
			emailSend = false
			TriggerServerEvent('prp-phone:server:sendNewMail', {
				sender = "Slippery Steve",
				subject = "Vehicle List",
				message = "You can chop a number of vehicles from me. I will let you continue to chop the vehicles, as long as you do not bother me.<br /><br /><strong>Vehicle List:</strong><br />".. vehicleList,
				button = {}
			})
		end)
	else
		PRPCore.Functions.Notify("You are not allowed to chop vehicles now..", "error")
	end
end

function AnyPassengers(vehicle)
	if GetPedInVehicleSeat(vehicle,0) ~= 0 then
		return true
	end

	if GetPedInVehicleSeat(vehicle,1) ~= 0 then
		return true
	end

	if GetPedInVehicleSeat(vehicle,2) ~= 0 then
		return true
	end

	if GetPedInVehicleSeat(vehicle,3) ~= 0 then
		return true
	end

	if GetPedInVehicleSeat(vehicle,4) ~= 0 then
		return true
	end

	return false

end

function ScrapVehicle(vehicle)
	isBusy = true
	local scrapTime = math.random(30000, 40000)
	ScrapVehicleAnim(scrapTime)
	PRPCore.Functions.Progressbar("scrap_vehicle", "Chop Vehicle..", scrapTime, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		StopAnimTask(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic", 1.0)
		TriggerServerEvent("prp-scrapyard:server:ScrapVehicle", GetVehicleKey(GetEntityModel(vehicle)))
		SetEntityAsMissionEntity(vehicle, true, true)
		Citizen.Wait(500)
		DeleteVehicle(vehicle)
		isBusy = false
	end, function() -- Cancel
		StopAnimTask(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic", 1.0)
		isBusy = false
		PRPCore.Functions.Notify("Cancelled..", "error")
	end)
end

function IsVehicleValid(vehicleModel)
	local retval = false
	if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then 
		for k, v in pairs(Config.CurrentVehicles) do
			if Config.CurrentVehicles[k] ~= nil and GetHashKey(Config.CurrentVehicles[k]) == vehicleModel then 
				retval = true
			end
		end
	end
	return retval
end

function GetVehicleKey(vehicleModel)
	local retval = 0
	if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then 
		for k, v in pairs(Config.CurrentVehicles) do
			if GetHashKey(Config.CurrentVehicles[k]) == vehicleModel then 
				retval = k
			end
		end
	end
	return retval
end

function SetClosestScrapyard()
	local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil
	for id, scrapyard in pairs(Config.Locations) do
		if current ~= nil then
			if(GetDistanceBetweenCoords(pos, Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z, true) < dist)then
				current = id
				dist = GetDistanceBetweenCoords(pos, Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z, true)
			end
		else
			dist = GetDistanceBetweenCoords(pos, Config.Locations[id]["main"].x, Config.Locations[id]["main"].y, Config.Locations[id]["main"].z, true)
			current = id
		end
	end
	closestScrapyard = current
end

function ScrapVehicleAnim(time)
    time = (time / 1000)
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
			time = time - 2
            if time <= 0 then
                openingDoor = false
                StopAnimTask(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
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

