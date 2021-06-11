---------------
-- Variables --
---------------
PRPCore = nil
local enableField = false

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}





-------------------
-- PRP Core Stuff --
-------------------
Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)







---------------------
-- Client Handlers --
---------------------
AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	
	toggleField(false)
  end)





---------------------
-- NUI   Callbacks --
---------------------
RegisterNUICallback('escape', function(data, cb)

    toggleField(false)
    SetNuiFocus(false, false)


    cb('ok')
end)

RegisterNUICallback('try', function(data, cb)

	print("IN NUI")
	toggleField(false)
    
	local code = data.code
	
	local playerCoords = GetEntityCoords(GetPlayerPed(-1))

	for i=1, #Config.Teleporters do
	
		local tp   = Config.Teleporters[i]
		local distance = GetDistanceBetweenCoords(playerCoords, tp.coords.x, tp.coords.y, tp.coords.z, true)
		local maxDistance = 1.25
		
		if tp.distance then
			maxDistance = tp.distance
		end

		if distance < maxDistance then
			for i=1, #tp.authorizedCodes do
				if tp.authorizedCodes[i] == code then

					if tp.name ~= "arena" then
						DoScreenFadeOut(500)
						while not IsScreenFadedOut() do
							Citizen.Wait(10)
						end
					end

					if IsPedInAnyVehicle(PlayerPedId(), false) then
						print("In vehicle")

						if tp.name ~= "arena" then
							Citizen.Wait(500)
							entity = GetVehiclePedIsUsing(PlayerPedId())
							SetEntityCoordsNoOffset(entity, tp.landed.x, tp.landed.y, tp.landed.z, false, false, true)
							SetGameplayCamRelativeHeading(0)
							if IsPedSittingInAnyVehicle(PlayerPedId()) then
								if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
									SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
									Citizen.Wait(100)
									DoScreenFadeIn(1000)
								end
							end
							Citizen.Wait(100)
						end

					else
						Citizen.Wait(500)
						if tp.name == "arena" or tp.name == "arenaoffice" then
							print("Not in vehicle, arena.")
							SetEntityCoords(PlayerPedId(), tp.landed.x, tp.landed.y, tp.landed.z, 0, 0, 0, false)
							SetEntityHeading(PlayerPedId(), 200.0)
							FreezeEntityPosition(PlayerPedId(), true)
							Citizen.Wait(5000)
							FreezeEntityPosition(PlayerPedId(), false)
							DoScreenFadeIn(1000)
						else
							print("Not in vehicle")
							SetEntityCoords(PlayerPedId(), tp.landed.x, tp.landed.y, tp.landed.z, 0, 0, 0, false)
							SetEntityHeading(PlayerPedId(), 200.0)
							Citizen.Wait(100)
							DoScreenFadeIn(1000)
						end

					end
				end				
			end
		
		end
			
	end		
	
    cb('ok')
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

function toggleField(enable)

	SetNuiFocus(enable, enable)
	enableField = enable
  
	SendNUIMessage({
  
	  type = "enableui",
	  enable = enable
  
	})
  
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




---------------------
-- Citizen Threads --
---------------------
Citizen.CreateThread(function()
	while true do
		local playerCoords = GetEntityCoords(GetPlayerPed(-1))
		nearDoor = false

		for i=1, #Config.Teleporters do
			local tp = Config.Teleporters[i]
			local distance = GetDistanceBetweenCoords(playerCoords, tp.coords.x, tp.coords.y, tp.coords.z, true)

			local maxDistance = 1.25
			if tp.distance then
				maxDistance = tp.distance
			end

			if distance < maxDistance then
				if tp.name == "arena" then
					DrawText3Ds(tp.coords.x, tp.coords.y, tp.coords.z + 0.15, '~g~E~w~ - Enter Arena Passcode')
				end
				if tp.name == "TempleWarehouse" then
					DrawText3Ds(tp.coords.x, tp.coords.y, tp.coords.z + 0.15, '~g~E~w~ - Warehouse Elevator')
				end
				nearDoor = true
				if IsControlJustReleased(0, 38) then
					TriggerServerEvent("prp-log:server:CreateLog", "passcodes", "Used Passcode", "red", "**"..GetPlayerName(PlayerId()).."** entered ".. tp.name)
					toggleField(true)
				end
			end
		end

		if not nearDoor then
			Citizen.Wait(2000)
		end

		Citizen.Wait(3)
	end
end)




Citizen.CreateThread(function()
	while true do
		local playerCoords = GetEntityCoords(GetPlayerPed(-1))
		nearStash = false

		for i=1, #Config.Stashes do
			local stash = Config.Stashes[i]
			local distance = GetDistanceBetweenCoords(playerCoords, stash.coords.x, stash.coords.y, stash.coords.z, true)
			local marker = stash.marker

			local maxDistance = 1.25
			if stash.distance then
				maxDistance = stash.distance
			end

			if distance < maxDistance then
				nearStash = true
				if marker then
					DrawMarker(27, stash.coords.x, stash.coords.y, stash.coords.z-0.98, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(1.5, 1.5, 1), 0, 128, 255, 150, false, true, 2, false, false, false)
				end
				if IsControlJustReleased(0, 38) then
					TriggerServerEvent("prp-log:server:CreateLog", "passcodes", "Entered Stash", "red", "**"..GetPlayerName(PlayerId()).."** accessed stash ".. stash.name)
					TriggerEvent("inventory:client:SetCurrentStash", stash.name)
					TriggerServerEvent("inventory:server:OpenInventory", "stash", stash.name, {
						maxweight = 20000000,
						slots = 500,
					})
				end
			end
		end

		local near = IsNearObject()
		if near ~= false then
			nearStash = true
			if IsControlJustReleased(0, 38) then
				TriggerServerEvent("prp-log:server:CreateLog", "passcodes", "Entered Stash", "red", "**"..GetPlayerName(PlayerId()).."** accessed stash ".. near)
				TriggerEvent("inventory:client:SetCurrentStash", near)
				TriggerServerEvent("inventory:server:OpenInventory", "stash", near, {
					maxweight = 20000000,
					slots = 500,
				})
			end
		end

		if not nearStash then
			Citizen.Wait(2000)
		end

		Citizen.Wait(3)
	end
end)


-- Check if player is near an atm
function IsNearObject()
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	for k, v in pairs(Config.Objects) do
	  local closestObj = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 3.0, v.obj, false, 0, 0)
	  local objCoords = GetEntityCoords(closestObj)
	  if closestObj ~= 0 then
		local dist = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, objCoords.x, objCoords.y, objCoords.z, true)
		if dist <= 2 then
			local crunch = math.floor((objCoords.x / objCoords.y) + objCoords.z)
			local text = v.name.."_"..crunch
			local text = v.name.."_"..round(math.floor(math.abs(objCoords.x))).."_"..round(math.floor(math.abs(objCoords.y))).."_"..round(math.floor(math.abs(objCoords.z)))
		  	return text
		end
	  end
	end
	return false
  end


  function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
  end