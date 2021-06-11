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
local ClosestCustomVehicle = 1
local testritveh = 0
local isLoggedIn = false

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

PlayerJob = {}

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

-- Code

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
    local factor = (string.len(text) / 400)
    DrawRect(0.0, 0.0+0.0125, factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        local ped = GetPlayerPed(-1)
        local bringcoords = Config.VehicleDeliverLocation
        local pos = GetEntityCoords(ped, false)
        local dist = GetDistanceBetweenCoords(pos, bringcoords.x, bringcoords.y, bringcoords.z)

        if IsPedInAnyVehicle(ped, false) then
            if dist < 15 then
                local veh = GetVehiclePedIsIn(ped)
                DrawMarker(2, bringcoords.x, bringcoords.y, bringcoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.1, 255, 255, 255, 155, false, false, false, false, false, false, false)

                if dist < 2 then
                    DrawText3Ds(bringcoords.x, bringcoords.y, bringcoords.z, '~g~E~w~ - Deliver Vehicle')
                    if IsControlJustPressed(0, 38) then
                        testritveh = 0
                        PRPCore.Functions.DeleteVehicle(veh)
                    end
                end
            end
        end

        if testritveh == 0 then
            Citizen.Wait(2000)
        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    for i = 1, #Config.ShowroomPositions, 1 do
        local oldVehicle = GetClosestVehicle(Config.ShowroomPositions[i].coords.x, Config.ShowroomPositions[i].coords.y, Config.ShowroomPositions[i].coords.z, 3.0, 0, 70)
        if oldVehicle ~= 0 then
            PRPCore.Functions.DeleteVehicle(oldVehicle)
        end

		local model = GetHashKey(Config.ShowroomPositions[i].vehicle)
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model, Config.ShowroomPositions[i].coords.x, Config.ShowroomPositions[i].coords.y, Config.ShowroomPositions[i].coords.z, false, false)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)
		SetEntityInvincible(veh,true)
        SetEntityHeading(veh, Config.ShowroomPositions[i].coords.h)
        SetVehicleDoorsLocked(veh, 3)

		FreezeEntityPosition(veh,true)
		SetVehicleNumberPlateText(veh, i .. "CARSALE")
		SetVehicleOnGroundProperly(veh)
    end
end)

function SetClosestCustomVehicle()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil

    for id, veh in pairs(Config.ShowroomPositions) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.ShowroomPositions[id].coords.x, Config.ShowroomPositions[id].coords.y, Config.ShowroomPositions[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Config.ShowroomPositions[id].coords.x, Config.ShowroomPositions[id].coords.y, Config.ShowroomPositions[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Config.ShowroomPositions[id].coords.x, Config.ShowroomPositions[id].coords.y, Config.ShowroomPositions[id].coords.z, true)
            current = id
        end
    end
    if current ~= ClosestCustomVehicle then
        ClosestCustomVehicle = current
    end
end

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local ShopDistance = GetDistanceBetweenCoords(pos, Config.ShowroomPositions[1].coords.x, Config.ShowroomPositions[1].coords.y, Config.ShowroomPositions[1].coords.z, false)

        if isLoggedIn then
            if ShopDistance <= 100 then
                SetClosestCustomVehicle()
            end
        end
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped, false)
        local dist = GetDistanceBetweenCoords(pos, Config.ShowroomPositions[ClosestCustomVehicle].coords.x, Config.ShowroomPositions[ClosestCustomVehicle].coords.y, Config.ShowroomPositions[ClosestCustomVehicle].coords.z, false)

        if isLoggedIn then
            if dist < 2 then
                if PlayerJob ~= nil then
                    if PlayerJob.name == "blackbarrelllc" and PlayerJob.grade.level >= 2 then
                        DrawText3Ds(Config.ShowroomPositions[ClosestCustomVehicle].coords.x, Config.ShowroomPositions[ClosestCustomVehicle].coords.y, Config.ShowroomPositions[ClosestCustomVehicle].coords.z + 0.5, '~b~/sellbike [id]~w~ - Sell vehicle    ~b~/testbike~w~ - Test Drive Vehicle')   
                    end
                    if Config.ShowroomPositions[ClosestCustomVehicle].buying then
                        DrawText3Ds(Config.ShowroomPositions[ClosestCustomVehicle].coords.x, Config.ShowroomPositions[ClosestCustomVehicle].coords.y, Config.ShowroomPositions[ClosestCustomVehicle].coords.z + 0.2, '~g~7~w~ - Purchase / ~r~8~w~ - Cancel - ~g~($'..PRPCore.Shared.Vehicles[Config.ShowroomPositions[ClosestCustomVehicle].vehicle].price..',-)')
                        
                        if IsDisabledControlJustPressed(0, Keys["7"]) then
                            TriggerServerEvent('prp-bikeshop:server:ConfirmVehicle', Config.ShowroomPositions[ClosestCustomVehicle])
                            Config.ShowroomPositions[ClosestCustomVehicle].buying = false
                        end

                        if IsDisabledControlJustPressed(0, Keys["8"]) then
                            PRPCore.Functions.Notify('You did NOT purchase the vehicle!')
                            Config.ShowroomPositions[ClosestCustomVehicle].buying = false
                        end
                    end                 
                end
            end
        end

        Citizen.Wait(3)
    end
end)

RegisterNetEvent('prp-bikeshop:client:SellCustomVehicle')
AddEventHandler('prp-bikeshop:client:SellCustomVehicle', function(TargetId)
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local player, distance = GetClosestPlayer()

    if distance < 2.5 then
        local VehicleDist = GetDistanceBetweenCoords(pos, Config.ShowroomPositions[ClosestCustomVehicle].coords.x, Config.ShowroomPositions[ClosestCustomVehicle].coords.y, Config.ShowroomPositions[ClosestCustomVehicle].coords.z)

        if VehicleDist < 2.5 then
            TriggerServerEvent('prp-bikeshop:server:SellCustomVehicle', TargetId, ClosestCustomVehicle)
        else
            PRPCore.Functions.Notify("You are not close to the vehicle!", "error")
        end
    else
        PRPCore.Functions.Notify("No one is around!", "error")
    end
end)

RegisterNetEvent('prp-bikeshop:client:DoTestDrive')
AddEventHandler('prp-bikeshop:client:DoTestDrive', function(plate)
    if ClosestCustomVehicle ~= 0 then
        PRPCore.Functions.SpawnVehicle(Config.ShowroomPositions[ClosestCustomVehicle].vehicle, function(veh)
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            exports['LegacyFuel']:SetFuel(veh, 100)
            SetVehicleNumberPlateText(veh, plate)
            SetEntityAsMissionEntity(veh, true, true)
            SetEntityHeading(veh, Config.VehicleBuyLocation.h)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            TriggerServerEvent("vehicletuning:server:SaveVehicleProps", PRPCore.Functions.GetVehicleProperties(veh))
            testritveh = veh
        end, Config.VehicleBuyLocation, false)

        Wait(500)
        TriggerEvent('prp-svmod:client:FullyUpgradeCar')
    end
end)

RegisterNetEvent('prp-bikeshop:client:SetVehicleBuying')
AddEventHandler('prp-bikeshop:client:SetVehicleBuying', function(slot)
    Config.ShowroomPositions[slot].buying = true
    SetTimeout((60 * 1000) * 5, function()
        Config.ShowroomPositions[slot].buying = false
    end)
end)

function GetClosestPlayer()
    local closestPlayers = PRPCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

RegisterNetEvent('prp-bikeshop:client:ConfirmVehicle')
AddEventHandler('prp-bikeshop:client:ConfirmVehicle', function(Showroom, plate)
    PRPCore.Functions.SpawnVehicle(Showroom.vehicle, function(veh)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityAsMissionEntity(veh, true, true)
        SetEntityHeading(veh, Config.VehicleBuyLocation.h)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        TriggerServerEvent("vehicletuning:server:SaveVehicleProps", PRPCore.Functions.GetVehicleProperties(veh))
    end, Config.VehicleBuyLocation, false)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            local jName = PlayerJob.name
            local jGrade = PlayerJob.grade.level
                      
            if jName == "blackbarrelllc" then
                local stash = Config.Stash

                if (GetDistanceBetweenCoords(pos, stash.x, stash.y, stash.z, true) < 2) then
                    if jGrade >= 2 then
                        if (GetDistanceBetweenCoords(pos, stash.x, stash.y, stash.z, true) < 1.0) then
                            DrawText3Ds(stash.x, stash.y, stash.z, "~g~E~w~ - Bike Shop Stash")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("prp-log:server:CreateLog", "passcodes", "Opened Stash", "red", "**"..GetPlayerName(PlayerId()).."** opened Bike Shop Stash")
                                TriggerEvent("inventory:client:SetCurrentStash", "BikeShop")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "BikeShop", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, stash.x, stash.y, stash.z, true) < 1.0) then
                            DrawText3Ds(stash.x, stash.y, stash.z, "Bike Shop Stash")
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, stash.x, stash.y, stash.z, true) < 1.0) then
                        DrawText3Ds(stash.x, stash.y, stash.z, "Bike Shop Stash")
                    end
                else
                    Citizen.Wait(1000)
                end
            else
                Citizen.Wait(10000)
            end
        end
    end
end)