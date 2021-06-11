local enablePickup = false
local openingDoor = false
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local inRange = false
		local pos = GetEntityCoords(GetPlayerPed(-1))
		if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MeltLocation.x, Config.MeltLocation.y, Config.MeltLocation.z, true) < 3.0 then
			inRange = true
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MeltLocation.x, Config.MeltLocation.y, Config.MeltLocation.z, true) < 1.5 then
                if not Config.IsMelting then
                    if enablePickup then
                        DrawText3D(Config.MeltLocation.x, Config.MeltLocation.y, Config.MeltLocation.z, "~g~E~w~ - Grab Gold bars")
                        if IsControlJustReleased(0, 38) then
                            TriggerServerEvent("prp-pawnshop:server:getGoldBars")
                        end
                    else
                        DrawText3D(Config.MeltLocation.x, Config.MeltLocation.y, Config.MeltLocation.z, "~g~E~w~ - Smelt gold items")
                        if IsControlJustReleased(0, 38) then 
                            local waitTime = math.random(10000, 15000)
                            ScrapAnim(waitTime)
                            PRPCore.Functions.Progressbar("drop_golden_stuff", "Smelting gold..", waitTime, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                StopAnimTask(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                TriggerServerEvent("prp-pawnshop:server:meltItems")
                            end)
                        end
                    end
                elseif Config.IsMelting and Config.MeltTime > 0 then
                    DrawText3D(Config.MeltLocation.x, Config.MeltLocation.y, Config.MeltLocation.z, "Smelting...: " .. Config.MeltTime)
                end
			end
		end
		if not inRange then
			Citizen.Wait(2500)
		end
	end
end)
local sellItemsSet = false
local hasGold = false
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local inRange = false
		local pos = GetEntityCoords(GetPlayerPed(-1))
		if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.SellGold.x, Config.SellGold.y, Config.SellGold.z, true) < 3.0 then
			inRange = true
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.SellGold.x, Config.SellGold.y, Config.SellGold.z, true) < 1.5 then
                if GetClockHours() >= 9 and GetClockHours() <= 18 then
                    if not sellItemsSet then 
						hasGold = HasPlayerGold()
						sellItemsSet = true
                    elseif sellItemsSet and hasGold then
                        DrawText3D(Config.SellGold.x, Config.SellGold.y, Config.SellGold.z, "~g~E~w~ - Sell Goldbars")
                        if IsControlJustReleased(0, 38) then
                            local lockpickTime = 20000
                            ScrapAnim(lockpickTime)
                            PRPCore.Functions.Progressbar("sell_gold", "Sell gold..", lockpickTime, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "veh@break_in@0h@p_m_one@",
                                anim = "low_force_entry_ds",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                openingDoor = false
                                ClearPedTasks(GetPlayerPed(-1))
                                TriggerServerEvent('prp-pawnshop:server:sellGold')
                            end, function() -- Cancel
                                openingDoor = false
                                ClearPedTasks(GetPlayerPed(-1))
                                PRPCore.Functions.Notify("Process cancelled..", "error")
                            end)
                        end
                    else
                        DrawText3D(Config.SellGold.x, Config.SellGold.y, Config.SellGold.z, "You don't have gold on you..")
                    end
                    
                else
                    DrawText3D(Config.SellGold.x, Config.SellGold.y, Config.SellGold.z, "Pawnshop closed..")
                end
			end
		end
        if not inRange then
            sellItemsSet = false
			Citizen.Wait(2500)
		end
	end
end)

function ScrapAnim(time)
    local time = time / 1000
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

function HasPlayerGold()
	local retval = false
	PRPCore.Functions.TriggerCallback('prp-pawnshop:server:hasGold', function(result)
		retval = result
	end)
    Citizen.Wait(500)
	return retval
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent('prp-pawnshop:client:pickedUp')
AddEventHandler('prp-pawnshop:client:pickedUp', function()
    enablePickup = false
end)


RegisterNetEvent('prp-pawnshop:client:startMelting')
AddEventHandler('prp-pawnshop:client:startMelting', function()
    Config.IsMelting = true
    Config.MeltTime = 300
    Citizen.CreateThread(function()
        while Config.IsMelting do
            Config.MeltTime = Config.MeltTime - 1
            if Config.MeltTime <= 0 then
                enablePickup = true
                Config.IsMelting = false
            end
            Citizen.Wait(1000)
        end
    end)
end)