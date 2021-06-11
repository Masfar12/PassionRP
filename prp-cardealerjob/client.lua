PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

local isLoggedIn = false
local PlayerData = {}

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = PRPCore.Functions.GetPlayerData()
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

function DrawText3Ds(xPos, yPos, zPos, Text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(Text)
    SetDrawOrigin(xPos, yPos, zPos, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(Text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local timeout = false

function RandomCars()
  return Config.cars[math.random(#Config.cars)]
end

function RandomPos(variable)
  return variable[math.random(1, #variable)]
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
			local coords = GetEntityCoords(PlayerPedId())
			local modelName = RandomCars()
			local sellpos = RandomPos(Config.sellveh)
			local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))
			local cooords = GetBlipInfoIdCoord(blip)
			if PlayerData.job ~= nil and (PlayerData.job.name == Config.Job) then
				if GetDistanceBetweenCoords(coords, Config.Startpoint.x, Config.Startpoint.y, Config.Startpoint.z, true) < Config.Startpoint.d and not timeout then
					DrawText3Ds(Config.Startpoint.x, Config.Startpoint.y, Config.Startpoint.z + 0.3, "~g~E~w~ - Start car delivery job")
					if IsControlJustPressed(1, 38) then
						blip = AddBlipForCoord(sellpos.x, sellpos.y, sellpos.z)
						SetBlipSprite(blip, 478)
						SetBlipRoute(blip,  true)
						SetBlipRouteColour(blip,  2)
						Citizen.CreateThread(function()
							RequestModel(model)

							while not HasModelLoaded(model) do
								Citizen.Wait(0)
							end

							local vehicle = CreateVehicle(model, Config.spawnveh.x, Config.spawnveh.y, Config.spawnveh.z, Config.spawnveh.h, true, false)
							local id      = NetworkGetNetworkIdFromEntity(vehicle)

							SetNetworkIdCanMigrate(id, true)
							SetEntityAsMissionEntity(vehicle, true, false)
							SetVehicleHasBeenOwnedByPlayer(vehicle, true)
							SetVehicleNeedsToBeHotwired(vehicle, false)
							SetModelAsNoLongerNeeded(model)
							TaskWarpPedIntoVehicle(PlayerPedId(),  vehicle, -1)
							TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))

							RequestCollisionAtCoord(Config.spawnveh.x, Config.spawnveh.y, Config.spawnveh.z)

							while not HasCollisionLoadedAroundEntity(vehicle) do
								RequestCollisionAtCoord(Config.spawnveh.x, Config.spawnveh.y, Config.spawnveh.z)
								Citizen.Wait(0)
							end

							SetVehRadioStation(vehicle, 'OFF')	
							PRPCore.Functions.Notify("Start the delivery of the car, bring it whole or you might upset the customer.", "success", 7000)
							timeout = true
							Wait(Config.Holdup * 60000)
							timeout = false
						end)
					end
				elseif GetDistanceBetweenCoords(coords, Config.Startpoint.x, Config.Startpoint.y, Config.Startpoint.z, true) < Config.Startpoint.d and timeout then
					DrawText3Ds(Config.Startpoint.x, Config.Startpoint.y, Config.Startpoint.z + 0.3, "No job available yet, come back later.")
				elseif GetDistanceBetweenCoords(coords, cooords.x, cooords.y, cooords.z, true) < 5.0 and IsPedInAnyVehicle(GetPlayerPed(-1)) then
					DrawText3Ds(cooords.x, cooords.y, cooords.z + 0.2, "~g~E~w~ - Deliver vehicle")
					if IsControlJustPressed(1, 38) then
						if (IsVehicleModel(GetVehiclePedIsUsing(GetPlayerPed(-1)), model)) then
						TriggerEvent('prp_cardealerjob:sellveh')
						Wait(0)
						TriggerEvent('PRPCore:Command:DeleteVehicle', PlayerPedId())
						RemoveBlip(blip)
						end
					end
				else
					Wait(850)
				end
			else
				Wait(2500)
			end
		end
end)


RegisterNetEvent('prp_cardealerjob:sellveh')
AddEventHandler('prp_cardealerjob:sellveh', function()
    local health = tonumber(GetVehicleBodyHealth(GetVehiclePedIsUsing(GetPlayerPed(-1)), PlayerPedId()))
    -- print(health) works.
    if health >= 950.0 then
        local type = 'mintcondition'
        PRPCore.Functions.Notify("The vehicle looks mint, thanks! Take this 💰", "success", 2500)
        TriggerServerEvent('prp_cardealerjob:pay', type)
    elseif health >= 750.0 then
        local type = 'decentcondition'
        PRPCore.Functions.Notify("Whats good, thanks for the delivery. Have some 💸", "success", 2500)
        TriggerServerEvent('prp_cardealerjob:pay', type)
    elseif health >= 600.0 then
        local type = 'shitcondition'
        PRPCore.Functions.Notify("What the fuck did you do to my car? Get out of here. 😡", "success", 2500)
        TriggerServerEvent('prp_cardealerjob:pay', type)
    elseif health >= 400.0 then
        local type = 'wtfcondition'
    elseif health == 0.0 then
        PRPCore.Functions.Notify("What the actual fuck, who hired you? Why are you even trying? 😡", "success", 2500)
        TriggerServerEvent('prp_cardealerjob:pay', type)
    end
end)