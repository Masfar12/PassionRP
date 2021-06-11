---------------
-- Variables --
---------------
PRPCore = nil
cachedData = {}


-----------------------
-- Core Initializing --
-----------------------
Citizen.CreateThread(function()
	while not PRPCore do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)

		Citizen.Wait(0)
	end
end)

-----------------------------
-- Blips for fishing spots --
-- -----------------------------
-- Citizen.CreateThread(function()
-- 	for i, zone in ipairs(Config.FishingZones) do
-- 		local coords = zone.secret and ((zone.coords / 1.5) - 133.37) or zone.coords
-- 		local name = zone.name
-- 		if not zone.secret then
-- 			local x = AddBlipForCoord(coords)
-- 			SetBlipSprite (x, 405)
-- 			SetBlipDisplay(x, 4)
-- 			SetBlipScale  (x, 0.35)
-- 			SetBlipAsShortRange(x, true)
-- 			SetBlipColour(x, 69)
-- 			BeginTextCommandSetBlipName("STRING")
-- 			AddTextComponentSubstringPlayerName(name)
-- 			EndTextCommandSetBlipName(x)
-- 		end
-- 	end
-- end)

--------------------
-- Event Handlers --
--------------------
RegisterNetEvent("prp_fishing:tryToFish")
AddEventHandler("prp_fishing:tryToFish", function()
	TryToFish() 
end)

RegisterNetEvent("prp_fishing:calculatedistances")
AddEventHandler("prp_fishing:calculatedistances", pos, function()

end)



---------------------------------------------------------------------------------
-- This citizen thread is to handle when a player walks up to sell their fish. --
---------------------------------------------------------------------------------
Citizen.CreateThread(function()
	Citizen.Wait(500) -- Init time.

	HandleStore()

	while true do
		local sleepThread = 500

		local ped = cachedData["ped"]
		
		if DoesEntityExist(cachedData["storeOwner"]) then
			local pedCoords = GetEntityCoords(ped)

			local dstCheck = #(pedCoords - GetEntityCoords(cachedData["storeOwner"]))

			if dstCheck < 3.0 then
				sleepThread = 5

				local displayText = not IsEntityDead(cachedData["storeOwner"]) and "Press ~INPUT_CONTEXT~ to sell your fish to the owner." or "The owner is dead, and therefore can not speak."
	
				if IsControlJustPressed(0, 38) then
					SellFish()
				end

				ShowHelpNotification(displayText)
			end
		end
		
		Citizen.Wait(sleepThread)
	end
end)

------------------------
-- Updates Ped States --
------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)

		local ped = PlayerPedId()

		if cachedData["ped"] ~= ped then
			cachedData["ped"] = ped
		end
	end
end)


---------------
-- Functions --
---------------
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