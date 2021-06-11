PRPCore = nil

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)

-- Code

local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

local currentVeh = nil

RegisterNetEvent('prp-fakeplate:SetPlate')
AddEventHandler('prp-fakeplate:SetPlate', function(plate2, itemslot)
    local fakeplate = plate2
    local slot = itemslot
    currentVeh = PRPCore.Functions.GetClosestVehicle()
    if currentVeh ~= nil and currentVeh ~= 0 then
        local plate = GetVehicleNumberPlateText(currentVeh)
        PRPCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
            if result then
                TriggerServerEvent('prp-fakeplate:CreateFakePlate', plate, fakeplate, slot)
            else
                PRPCore.Functions.Notify('You need the keys to the vehicle!', 'error', 3500)
            end
        end, plate)
    end
end)

RegisterNetEvent('prp-fakeplate:SetFakePlate')
AddEventHandler('prp-fakeplate:SetFakePlate', function(fakePlate, slot)
    local itemslot = slot
    currentVeh = PRPCore.Functions.GetClosestVehicle()
    if currentVeh ~= nil and currentVeh ~= 0 then
        local pos = GetEntityCoords(GetPlayerPed(-1))
		local vehpos = GetEntityCoords(currentVeh)
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) then
            if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                local drawpos = GetOffsetFromEntityInWorldCoords(currentVeh, 0, 2.5, 0)
                local drawpos2 = GetOffsetFromEntityInWorldCoords(currentVeh, 0, -2.5, 0)
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, drawpos) < 2.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) or (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, drawpos2) < 2.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                    PlateVehicle(currentVeh, fakePlate, itemslot)
                else 
                    PRPCore.Functions.Notify('Stand at the front/back of your vehicle', 'error', 2500)
                end
            else
                PRPCore.Functions.Notify('You have to be outside of the vehicle', 'error', 2500)
            end
        else
            PRPCore.Functions.Notify('You have to be close to your vehicle', 'error', 2500)
		end
    end
end)

RegisterNetEvent('prp-fakeplate:RemovePlate')
AddEventHandler('prp-fakeplate:RemovePlate', function()
    currentVeh = PRPCore.Functions.GetClosestVehicle()
    if currentVeh ~= nil and currentVeh ~= 0 then
        local plate = GetVehicleNumberPlateText(currentVeh)
        PRPCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
            if result then
                TriggerServerEvent("prp-fakeplate:RemoveFakePlate", plate)
            else
                PRPCore.Functions.Notify("You need the keys to the vehicle", "error", 3500)
            end
        end, plate)
    end
end)

RegisterNetEvent('prp-fakeplate:RemoveFakePlate')
AddEventHandler('prp-fakeplate:RemoveFakePlate', function(orginalPlate)
    currentVeh = PRPCore.Functions.GetClosestVehicle()
    if currentVeh ~= nil and currentVeh ~= 0 then
        local pos = GetEntityCoords(GetPlayerPed(-1))
		local vehpos = GetEntityCoords(currentVeh)
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) then
            if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                local drawpos = GetOffsetFromEntityInWorldCoords(currentVeh, 0, 2.5, 0)
                local drawpos2 = GetOffsetFromEntityInWorldCoords(currentVeh, 0, -2.5, 0)
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, drawpos) < 2.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) or (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, drawpos2) < 2.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                    local plate = GetVehicleNumberPlateText(currentVeh)
                    UnplateVehicle(currentVeh, plate, orginalPlate)
                else 
                    PRPCore.Functions.Notify('You have to stand in the front/back of the vehicle.', 'error', 2500)
                end
            else
                PRPCore.Functions.Notify('You have to be outside of the vehicle', 'error', 2500)
            end
        else
            PRPCore.Functions.Notify('You have to be near the vehicle', 'error', 2500)
		end
    end
end)


-- Functions

function PlateVehicle(vehicle, fakePlate, slot)
	PRPCore.Functions.Progressbar("repair_vehicle", "Installing license plate..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
		anim = "machinic_loop_mechandplayer",
		flags = 1,
	}, {}, {}, function() -- Done
		StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
        SetVehicleNumberPlateText(vehicle, fakePlate)
        TriggerEvent("vehiclekeys:client:SetOwner", fakePlate)
        PRPCore.Functions.Notify('Fake license plate installed: '..fakePlate, 'success', 2500)
        TriggerServerEvent('prp-fakeplate:removeItem', 'fakeplate', slot)
        currentVeh = nil
	end, function() -- Cancel
		StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
		PRPCore.Functions.Notify("Failed!", "error")
	end)
end

function UnplateVehicle(vehicle, fakePlate, orginalPlate )
	PRPCore.Functions.Progressbar("repair_vehicle", "Removing fake license plate..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
		anim = "machinic_loop_mechandplayer",
		flags = 1,
	}, {}, {}, function() -- Done
		StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
        SetVehicleNumberPlateText(currentVeh, orginalPlate)
        TriggerEvent("vehiclekeys:client:SetOwner", orginalPlate)
        PRPCore.Functions.Notify('Placing original license plate: '..orginalPlate, 'success', 2500)
        currentVeh = nil
		TriggerServerEvent('prp-fakeplate:addItem', 'fakeplate', fakePlate)
	end, function() -- Cancel
		StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
		PRPCore.Functions.Notify("Failed!", "error")
	end)
end