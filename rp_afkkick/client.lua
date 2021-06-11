PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

local kicktime = 1800 --(IN SECONDS)
local voice = false
local deadAnimDict = "dead"
local deadAnim = "dead_a"
local inBedDict = "misslamar1dead_body"
local inBedAnim = "dead_idle"


Citizen.CreateThread(function()	
	while true do
		Wait(1000)
		playerPed = GetPlayerPed(-1)
		if playerPed then

			local inVehicle = IsPedInAnyVehicle(GetPlayerPed(-1))
			local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
			local model = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
			
			currentPos = GetEntityCoords(playerPed, true)
			if currentPos == prevPos and not IsEntityPlayingAnim(PlayerPedId(), deadAnimDict, deadAnim, 3) and not IsEntityPlayingAnim(PlayerPedId(), inBedDict, inBedAnim, 3) and not isEmergencyVehicle(model) and not inVehicle then
				if time > 0 then
					if time == math.ceil(kicktime / 2) then
						PRPCore.Functions.Notify("You will be kicked in " .. math.modf(time/60) .. " minute/s")
					end
					if time == math.ceil(kicktime / 3) then
						PRPCore.Functions.Notify("You will be kicked in " .. math.modf(time/60) .. " minute/s")
					end
					if time == math.ceil(kicktime / 5) then
						PRPCore.Functions.Notify("You will be kicked in " .. math.modf(time/60) .. " minute/s")
						if voice == true then 
						TriggerServerEvent('InteractSound_SV:PlayOnSource', 'afk', 0.8)
						end
					end
					if time == math.ceil(kicktime / 15) then
						PRPCore.Functions.Notify("You will be kicked in " .. math.modf(time) .. " seconds")
					end
					time = time - 1
				else
					TriggerServerEvent("afk:kick")
				end
			else
				time = kicktime
			end
			prevPos = currentPos
		end
	end
end)

-- function afkinfo(text)
--     SetNotificationTextEntry("STRING");
--     AddTextComponentString(text);
--     SetNotificationMessage('CHAR_FLOYD', 'AFK', true, 1, '[PRP] AFK KICK');
--     DrawNotification(false, false)
-- end 

function isEmergencyVehicle(model)
	local tbl = {
		"pd1", "pd9", "pd2", "pd3", "pd4", "pd5", "pd7", "pd8", "pd10", "pd11", "pd12", "pd13",
		"pd14", "pd15", "2018 Mustan", "polchal", "17silverado", "doatahoe", "sspres", "e18charger", 
		"X1", "emsa", "etahoe", "ecla45", "blazer2", "firetruk", "AMBULAN"
	}

	if has_value(tbl, model) then
		return true
	else
		return false
	end

	return false
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end