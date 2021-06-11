-- PRPCore Command Events


RegisterNetEvent('PRPCore:Command:TeleportToPlayer')
AddEventHandler('PRPCore:Command:TeleportToPlayer', function(othersource)
	local coords = PRPCore.Functions.GetCoords(GetPlayerPed(GetPlayerFromServerId(othersource)))
	local entity = GetPlayerPed(-1)
	if IsPedInAnyVehicle(entity, false) then
		entity = GetVehiclePedIsUsing(entity)
	end
	SetEntityCoords(entity, coords.x, coords.y, coords.z)
	SetEntityHeading(entity, coords.a)
end)

RegisterNetEvent('PRPCore:Command:TeleportToCoords')
AddEventHandler('PRPCore:Command:TeleportToCoords', function(x, y, z)
	local entity = GetPlayerPed(-1)
	if IsPedInAnyVehicle(entity, false) then
		entity = GetVehiclePedIsUsing(entity)
	end
	SetEntityCoords(entity, x, y, z)
end)

RegisterNetEvent('PRPCore:Command:ListItems')
AddEventHandler('PRPCore:Command:ListItems', function(str)
    for k, v in next, PRPShared.Items do
		if string.lower(k):find(str) then
			print(k)
		end
	end
end)

RegisterNetEvent('PRPCore:Command:SpawnVehicle')
AddEventHandler('PRPCore:Command:SpawnVehicle', function(model)
	PRPCore.Functions.SpawnVehicle(model, function(vehicle)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
		TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
	end)
end)

RegisterNetEvent('PRPCore:Command:EventVehicle')
AddEventHandler('PRPCore:Command:EventVehicle', function(model)
	PRPCore.Functions.SpawnVehicle(model, function(vehicle)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
		SetVehicleNumberPlateText(vehicle, 'EVENTCAR')

		
	end)
	Wait(500)
	TriggerEvent('prp-svmod:client:FullyUpgradeCar')
	--TriggerEvent("vehiclekeys:client:SetEventOwner", GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
end)

RegisterNetEvent('PRPCore:Command:DeleteVehicle')
AddEventHandler('PRPCore:Command:DeleteVehicle', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1)) then
		PRPCore.Functions.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
	else
		local vehicle = PRPCore.Functions.GetClosestVehicle()
		PRPCore.Functions.DeleteVehicle(vehicle)
	end
end)

RegisterNetEvent('PRPCore:Command:Revive')
AddEventHandler('PRPCore:Command:Revive', function()
	local coords = PRPCore.Functions.GetCoords(GetPlayerPed(-1))
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z+0.2, coords.a, true, false)
	SetPlayerInvincible(GetPlayerPed(-1), false)
	ClearPedBloodDamage(GetPlayerPed(-1))
	TriggerEvent('hspt:ClearLimp')
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
end)

RegisterNetEvent('PRPCore:Command:GoToMarker')
AddEventHandler('PRPCore:Command:GoToMarker', function()
	Citizen.CreateThread(function()
		local entity = PlayerPedId()
		if IsPedInAnyVehicle(entity, false) then
			entity = GetVehiclePedIsUsing(entity)
		end
		local success = false
		local blipFound = false
		local blipIterator = GetBlipInfoIdIterator()
		local blip = GetFirstBlipInfoId(8)

		while DoesBlipExist(blip) do
			if GetBlipInfoIdType(blip) == 4 then
				cx, cy, cz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector())) --GetBlipInfoIdCoord(blip)
				blipFound = true
				break
			end
			blip = GetNextBlipInfoId(blipIterator)
		end

		if blipFound then
			DoScreenFadeOut(250)
			while IsScreenFadedOut() do
				Citizen.Wait(250)
			end
			local groundFound = false
			local yaw = GetEntityHeading(entity)

			for i = 0, 1000, 1 do
				SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), false, false, false)
				SetEntityRotation(entity, 0, 0, 0, 0 ,0)
				SetEntityHeading(entity, yaw)
				SetGameplayCamRelativeHeading(0)
				Citizen.Wait(0)
				--groundFound = true
				if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, false) then --GetGroundZFor3dCoord(cx, cy, i, 0, 0) GetGroundZFor_3dCoord(cx, cy, i)
					cz = ToFloat(i)
					groundFound = true
					break
				end
			end
			if not groundFound then
				cz = -300.0
			end
			success = true
		else
			TriggerEvent('esx:showNotification', "~w~ Choose location ~y~to ~w~teleport!")
		end

		if success then
			SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, true)
			SetGameplayCamRelativeHeading(0)
			if IsPedSittingInAnyVehicle(PlayerPedId()) then
				if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
					SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
				end
			end
			--HideLoadingPromt()
			DoScreenFadeIn(250)
		end
	end)
end)

-- Other stuff
RegisterNetEvent('PRPCore:Player:SetPlayerData')
AddEventHandler('PRPCore:Player:SetPlayerData', function(val)
	PRPCore.PlayerData = val
end)

RegisterNetEvent('PRPCore:Player:UpdatePlayerData')
AddEventHandler('PRPCore:Player:UpdatePlayerData', function()
	local data = {}
	data.position = PRPCore.Functions.GetCoords(GetPlayerPed(-1))
	TriggerServerEvent('PRPCore:UpdatePlayer', data)
end)

RegisterNetEvent('PRPCore:Player:UpdatePlayerPosition')
AddEventHandler('PRPCore:Player:UpdatePlayerPosition', function()
	local position = PRPCore.Functions.GetCoords(GetPlayerPed(-1))
	TriggerServerEvent('PRPCore:UpdatePlayerPosition', position)
end)

RegisterNetEvent('PRPCore:Client:LocalOutOfCharacter')
AddEventHandler('PRPCore:Client:LocalOutOfCharacter', function(playerId, playerName, message)
	local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerId)), false)
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 20.0) then
		TriggerEvent("chatMessage", "OOC | " .. playerName, "normal", message)
    end
end)

RegisterNetEvent('PRPCore:Notify')
AddEventHandler('PRPCore:Notify', function(text, type, length)
	PRPCore.Functions.Notify(text, type, length)
end)

RegisterNetEvent('PRPCore:Client:TriggerCallback')
AddEventHandler('PRPCore:Client:TriggerCallback', function(name, ...)
	if PRPCore.ServerCallbacks[name] ~= nil then
		PRPCore.ServerCallbacks[name](...)
		PRPCore.ServerCallbacks[name] = nil
	end
end)

RegisterNetEvent("PRPCore:Client:UseItem")
AddEventHandler('PRPCore:Client:UseItem', function(item)
	TriggerServerEvent("PRPCore:Server:UseItem", item)
end)

RegisterNetEvent("PRPCore:Client:UpdatePlayerOnLogout")
AddEventHandler("PRPCore:Client:UpdatePlayerOnLogout", function()
	local data = {}
	data.position = PRPCore.Functions.GetCoords(GetPlayerPed(-1))
	TriggerServerEvent('PRPCore:UpdatePlayerOnLogout', data)
end)
