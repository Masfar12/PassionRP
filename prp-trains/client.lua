RegisterNetEvent("curTrains")
RegisterNetEvent("StartTrain")
RegisterNetEvent("StartTrain2")
RegisterNetEvent("AskForTrain")
RegisterNetEvent("AskForTrainConfirmed")
RegisterNetEvent("CanIHost")
imhost = false
local trailer = nil

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

local isForcedStopped = false

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function getVehicleInDirection()
	playerped = PlayerPedId()
    coordFrom = GetEntityCoords(playerped, 1)
    coordTo = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)

	local offset = 0
	local rayHandle
	local vehicle

	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		offset = offset - 1

		if vehicle ~= 0 then
			break
		end
	end

	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))

	if distance > 25 then
		vehicle = nil
	end
	return vehicle ~= nil and vehicle or 0
end

RegisterCommand(Config.CommandName, function()
	if Config.ChatCommand then
	  TriggerEvent("AskForTrain")
	end
end, false)

Citizen.CreateThread(function()

	while true do

		if not imhost2 then
			Citizen.Wait(1000)
		else
			Citizen.Wait(0)
			
			if stopsrunning2 and Train ~= nil then
				curDistance1 = math.ceil(runStop2()) 
				
				if curDistance1 < 250  then
					maxSpeed2 = curDistance1 * 0.7
				else
					if nextStop2 == 2 then
						maxSpeed2 = 45.0
					else
						maxSpeed2 = 100.0
					end
				end
				--	stringmsg = "Distance to stop = " .. curDistance1 .. " Current Speed Setting = " .. maxSpeed2 .. " Travelling @ = " .. TrainSpeed2 .. ""
				--	drawTxt(0.513, 1.170, 1.0,1.0,0.40, stringmsg, 255, 255, 255, 255)

				if not isForcedStopped then
					FreezeEntityPosition(Train, false)
					
					if TrainSpeed2 > maxSpeed2 then
						TrainSpeed2 = TrainSpeed2 - 1.0
						SetTrainSpeed(Train,TrainSpeed2)
						SetTrainCruiseSpeed(Train,TrainSpeed2)
					end

					if TrainSpeed2 < maxSpeed2 then
						TrainSpeed2 = TrainSpeed2 + 1.0
						SetTrainSpeed(Train,TrainSpeed2)
						SetTrainCruiseSpeed(Train,TrainSpeed2)
					end

					if curDistance1 < 5 then
						maxSpeed2 = 0.0
						SetTrainSpeed(Train,0.0)
						SetTrainCruiseSpeed(Train,0.0)
						Citizen.Wait(10000)
						checkKillcountry()
						nextStop2 = nextStop2 + 1

						if nextStop2 > #Config.TrainStations2 then
							nextStop2 = 1
						end
						--TriggerServerEvent("TrainStation:addblipCountry",Config.TrainStations2[nextStop2][1],Config.TrainStations2[nextStop2][2],Config.TrainStations2[nextStop2][3])
					end
				else
					maxSpeed2 = 0.0
					TrainSpeed2 = 0.0
					FreezeEntityPosition(Train, true)
					SetTrainSpeed(Train,0.0)
					SetTrainCruiseSpeed(Train,0.0)	
					Citizen.Wait(10000)
				end
			else
				stopsrunning2=false
				imhost2=false
			end
		end
	end
end)

Citizen.CreateThread(function()

	while true do

		if imhost or imhost2 then
			if MetroTrain ~= nil or Train ~= nil then
				
				local veh = checkForVehicle()

				if veh then
		        	local deleteAfterPoint = 50
					isForcedStopped = true

		        	while true do
		        		Citizen.Wait(1000)
						local veh = checkForVehicle()
						
		        		if not veh then
		        			isForcedStopped = false
		        			break
		        		end

		        		if deleteAfterPoint <= 0 then
							local vehCur = nil
							
							if Train then
								vehCur = Train
							else
								vehCur = MetroTrain
							end

		        			local currentVeh = GetVehiclePedIsUsing(PlayerPedId())
		        			TaskLeaveVehicle(PlayerPedId(), currentVeh, 1)
		        			Wait(2000)
		        			FreezeEntityPosition(PlayerPedId(), false)
		        			Wait(4000)
		        			FreezeEntityPosition(PlayerPedId(), false)
		        			trailer = GetTrainCarriage(vehCur, 1)
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(trailer))
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehCur))
							stopsrunning2 = false
							imhost2 = false
							stopsrunning=false
							imhost=false
							intrain = false
		        		end

		        		deleteAfterPoint = deleteAfterPoint - 1

		        	end	
		        end
			end
		end
		Citizen.Wait(5)
	end
end)

function checkForVehicle()
	local vehCur = nil

	if Train then
		vehCur = Train
	else
		vehCur = MetroTrain
	end

	local coordA = GetOffsetFromEntityInWorldCoords(vehCur, 0.0, 9.0, 1.0)
	local coordB = GetOffsetFromEntityInWorldCoords(vehCur, 0.0, 30.0, -0.6)
    local rayHandle
    local entity

    rayHandle = CastRayPointToPoint(coordA.x, coordA.y, coordA.z, coordB.x, coordB.y, coordB.z, 10, PlayerPedId(), -1)	
    a, b, c, d, entity = GetRaycastResult(rayHandle)

    if entity ~= 0 then 
		local model = GetEntityModel(entity)
		
    	if IsThisModelACar(model) or IsThisModelABike(model) or IsThisModelAQuadbike(model) then
	    	return entity
	    end
    else
    	return false
    end
end

Citizen.CreateThread(function()

	while true do

		if not imhost then
			Citizen.Wait(1000)
		else
			Citizen.Wait(0)

			if stopsrunning and MetroTrain ~= nil then
				curDistance = math.ceil(runStop1()) 

				if curDistance < 80  then
					maxSpeed1 = curDistance * 0.5
				else
				--	Citizen.Trace(maxSpeed1)
				--	Citizen.Trace(TrainSpeed1)
				--	Citizen.Trace(curDistance)
					maxSpeed1 = 45.0
				end

			--	stringmsg = "Distance to stop = " .. curDistance .. " Current Speed Setting = " .. maxSpeed1 .. " Travelling @ = " .. TrainSpeed1 .. ""
			--	drawTxt(0.63, 1.230, 1.0,1.0,0.40, stringmsg, 255, 255, 255, 255)

				if not isForcedStopped then
					FreezeEntityPosition(MetroTrain, false)

					if TrainSpeed1 > maxSpeed1 then
						TrainSpeed1 = TrainSpeed1 - 2.0
						SetTrainSpeed(MetroTrain,TrainSpeed1)
						SetTrainCruiseSpeed(MetroTrain,TrainSpeed1)
					end

					if TrainSpeed1 < maxSpeed1 then
						TrainSpeed1 = TrainSpeed1 + 2.0
						SetTrainSpeed(MetroTrain,TrainSpeed1)
						SetTrainCruiseSpeed(MetroTrain,TrainSpeed1)
					end

					if curDistance < 5 then
						maxSpeed1 = 0.0
						SetTrainSpeed(MetroTrain,0.0)
						SetTrainCruiseSpeed(MetroTrain,0.0)	
						checkKillmetro()
						Citizen.Wait(10000)
						nextStop1 = nextStop1 + 1

						if nextStop1 > #Config.TrainStations2 then
							nextStop1 = 1
						end
						--TriggerServerEvent("TrainStation:addblipMetro",Config.TrainStations[nextStop1][1],Config.TrainStations[nextStop1][2],Config.TrainStations[nextStop1][3])
					end
				else
					maxSpeed1 = 0.0
					TrainSpeed1 = 0.0
					FreezeEntityPosition(MetroTrain, true)
					SetTrainSpeed(MetroTrain,0.0)
					SetTrainCruiseSpeed(MetroTrain,0.0)	
					Citizen.Wait(10000)
				end
			else
				stopsrunning=false
				imhost=false
			end
		end
	end
end)

function checkKillcountry()

	dontdeletec = false

	for i = 1, 2 do

		if not IsVehicleSeatFree(Train, i) then
			dontdeletec = true
		end
	end

	local targetVehicle = GetTrainCarriage(Train, 1)

	for i = 1, 2 do

		if not IsVehicleSeatFree(targetVehicle, i) then
			dontdeletec = true
		end
	end

	if not dontdeletec then

		trailer = GetTrainCarriage(Train, 1)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(trailer))
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(Train))
		stopsrunning2=false
		imhost2=false	
	end
end

function checkKillmetro()

	dontdelete = false

	for i = 1, 2 do

		if not IsVehicleSeatFree(MetroTrain, i) then
			dontdelete = true
		end
	end



	local targetVehicle = GetTrainCarriage(MetroTrain, 1)

	for i = 1, 2 do

		if not IsVehicleSeatFree(targetVehicle, i) then
			dontdelete = true
		end
	end

	if not dontdelete then

		trailer = GetTrainCarriage(MetroTrain, 1)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(trailer))
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(MetroTrain))
		stopsrunning=false
		imhost=false
	end
end

nextStop1 = 1

function runStop1()

	if MetroTrain ~= nil then
		CoordCheck1 = GetEntityCoords(MetroTrain)
		closestDist1 = #(vector3(Config.TrainStations[nextStop1][1],Config.TrainStations[nextStop1][2],Config.TrainStations[nextStop1][3]) - CoordCheck1)
		return closestDist1
	end
end

nextStop2 = 1

function runStop2()

	if Train ~= nil then
		CoordCheck2 = GetEntityCoords(Train)
		closestDist2 = #(vector3(Config.TrainStations2[nextStop2][1],Config.TrainStations2[nextStop2][2],Config.TrainStations2[nextStop2][3]) - CoordCheck2)
		return closestDist2
	end
end

function getClosestCountrySpawn()

	prevClosest2 = 99999.9

	for i = 1, #Config.TrainStations2 do
		CoordC = GetEntityCoords(PlayerPedId())
		closestDist2 = #(vector3(Config.TrainStations2[i][1],Config.TrainStations2[i][2],Config.TrainStations2[i][3]) - CoordC)

		if closestDist2 < prevClosest2 then 
			prevClosest2 = closestDist2
			returninfo = Config.TrainStations2[i]
			nextStop2 = i + 1

			if nextStop2 > #Config.TrainStations2 then
				nextStop2 = 1
			end
		end		
	end
	return returninfo
end

function getClosestMetroSpawn()

	prevClosest = 99999.9

	for i = 1, #Config.TrainStations do
		CoordC = GetEntityCoords(PlayerPedId())
		closestDist = #(vector3(Config.TrainStations[i][1],Config.TrainStations[i][2],Config.TrainStations[i][3]) - CoordC)
		--Citizen.Trace(closestDist .. " | " .. prevClosest)

		if closestDist < prevClosest then 
			--Citizen.Trace(closestDist .. " | " .. i)
			prevClosest = closestDist
			returninfo = Config.TrainStations[i]
			nextStop1 = i+1

			if nextStop1 > #Config.TrainStations then
				nextStop1 = 1
			end
		end		
	end
	return returninfo
end

function getClosestMetroStop()

	prevClosest = 99999.9

	for i = 1, #Config.TrainPlatforms do
		CoordC = GetEntityCoords(PlayerPedId())
		closestDist2 = #(vector3(Config.TrainPlatforms[i][1],Config.TrainPlatforms[i][2],Config.TrainPlatforms[i][3]) - CoordC)

		if closestDist2 < prevClosest then 
			prevClosest = closestDist2
			returninfo = Config.TrainPlatforms[i]
		end		
	end
	return returninfo
end

RegisterNetEvent("AskForTrain")
AddEventHandler("AskForTrain", function()

	TriggerServerEvent("RequestTrain")

end)

RegisterNetEvent("AskForTrainConfirmed")
AddEventHandler("AskForTrainConfirmed", function()

	local closestMetro = getClosestMetroSpawn()
	local closestCountry = getClosestCountrySpawn()
	local countryDist = #(vector3(closestCountry[1],closestCountry[2],closestCountry[3]) - GetEntityCoords(PlayerPedId()))
	local metroDist = #(vector3(closestMetro[1],closestMetro[2],closestMetro[3]) - GetEntityCoords(PlayerPedId()))

	if metroDist < countryDist then

		if metroDist < Config.RequestDistance then
			--exports["progressBars"]:startUI(Config.WaitingTime * 1000, 'Waiting for train')
			print("waiting"..Config.WaitingTime * 1000)
			Citizen.Wait(Config.WaitingTime * 100)
			StartMetro(closestMetro)
			--TriggerEvent('notification', 'The train is leaving the station, hold on')
			PRPCore.Functions.Notify("Thomas the announcer : The train is leaving the station", "success")
		else
			--TriggerEvent('notification', 'You are not near the train station', 2)
			PRPCore.Functions.Notify("You are not near the train station", "error")
		end
	else
		if countryDist < Config.RequestDistance then 
			--exports["progressBars"]:startUI(Config.WaitingTime * 1000, 'Waiting for train')
			Citizen.Wait(Config.WaitingTime * 100)
			StartCountry(closestCountry)
			--TriggerEvent('notification', 'The train is leaving the station, hold on')
			PRPCore.Functions.Notify("Thomas the announcer : The train is leaving the station", "success")
		else
			--TriggerEvent('notification', 'You are not near the train station', 2)
			PRPCore.Functions.Notify("You are not near the train station", "error")
		end
	end
end)

local showTrainStations = false

RegisterNetEvent('Trains:ToggleTainsBlip')
AddEventHandler('Trains:ToggleTainsBlip', function()

    showTrainStations = not showTrainStations

   for _, item in pairs(Config.TrainStations) do

        if not showTrainStations then

            if item.blip ~= nil then
                RemoveBlip(item.blip)
            end
        else
            item.blip = AddBlipForCoord(item[1], item[2], item[3])
            SetBlipSprite(item.blip, 36)
		    SetBlipColour(item.blip, 2)
			SetBlipScale(item.blip, 0.75)
			SetBlipAsShortRange(item.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Metro Train Station")
			EndTextCommandSetBlipName(item.blip)
        end
    end

    for _, item in pairs(Config.TrainStations2) do

        if not showTrainStations then

            if item.blip ~= nil then
                RemoveBlip(item.blip)
            end
        else
            item.blip = AddBlipForCoord(item[1], item[2], item[3])
            SetBlipSprite(item.blip, 36)
		    SetBlipColour(item.blip, 12)
			SetBlipScale(item.blip, 0.75)
			SetBlipAsShortRange(item.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Country Train Station")
			EndTextCommandSetBlipName(item.blip)
        end
    end
end)

Citizen.CreateThread(function()
	showTrainStations = true
	TriggerEvent('Trains:ToggleTainsBlip')
end)

intrain = false
justborded = false

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		if targetVehicle ~= nil and IsThisModelATrain(GetEntityModel(targetVehicle)) then
			SetVehicleDoorsShut(targetVehicle,true)
		end

		if MetroTrain ~= nil then
			SetVehicleDoorsShut(MetroTrain,true)

		end

		if trailer ~= nil then
			SetVehicleDoorsShut(trailer,true)
		end

		if intrain then
			DisableControlAction(0, 185, true)
		else
			EnableControlAction(0, 185, true)
		end

		if IsControlJustReleased(1,  38) then

			playerped = PlayerPedId()
			targetVehicle = getVehicleInDirection()
			seats = GetVehicleModelNumberOfSeats(GetEntityModel(targetVehicle))


			if IsThisModelATrain( GetEntityModel(targetVehicle) ) and not intrain then

				for i = 1, 2 do

					if IsVehicleSeatFree(targetVehicle, i) then

						if not IsPedInAnyTrain(playerped) then
							SetPedIntoVehicle(playerped, targetVehicle, i)
							 FreezeEntityPosition(PlayerPedId(), true)
							 justborded = true
						end
					end
				end

				local targetVehicle = GetTrainCarriage(targetVehicle, 1)

				for i = 1, 2 do

					if IsVehicleSeatFree(targetVehicle, i) then

						if not IsPedInAnyTrain(playerped) then
							SetPedIntoVehicle(playerped, targetVehicle, i)	
							FreezeEntityPosition(PlayerPedId(), true)		
							justborded = true			
						end
					end
				end

				if IsPedInAnyTrain(playerped) then
					intrain = true
					--TriggerEvent('notification', 'You boarded the train')
					PRPCore.Functions.Notify("You boarded the train", "success")
				else
					--TriggerEvent('notification', 'The carriage is full', 2)
					PRPCore.Functions.Notify("The carriage is full", "error")
				end
				Citizen.Wait(1500)
				justborded = false
			else
				if (intrain or IsPedInAnyTrain(PlayerPedId())) and GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 3.6 then

					--local speeds = GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId()))

					if not justborded then
						nearestStop = getClosestMetroStop()
						CoordC = GetEntityCoords(PlayerPedId())

						if #(vector3(nearestStop[1],nearestStop[2],nearestStop[3]) - CoordC) < 20 then
							SetEntityCoords(playerped,nearestStop[1],nearestStop[2],nearestStop[3])
							FreezeEntityPosition(PlayerPedId(), false)
						else
							coordTo = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 3.0, 0.0)
							SetEntityCoords(playerped,coordTo)
							FreezeEntityPosition(PlayerPedId(), false)
						end

						intrain = false

					end
				end
			end
		end
	end
end)

function StartMetro(coords)

	stopsrunning = false
	imhost = false

	if MetroTrain ~= nil then

		trailer = GetTrainCarriage(MetroTrain, 1)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(trailer))
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(MetroTrain))
	end

	TrainSpeed1 = 0.0
	maxSpeed1 = 0.0
	
	for  _,model in ipairs(Config.Models) do
		tempmodel = GetHashKey(model)
		RequestModel(tempmodel)

		while not HasModelLoaded(tempmodel) do
			RequestModel(tempmodel)
			Citizen.Wait(0)
		end
	end

	MetroTrain = CreateMissionTrain(24,coords[1],coords[2],coords[3],true) -- these ones have pre-defined spawns since they are a pain to set up
	SetTrainSpeed(MetroTrain,0.0)	
	SetTrainCruiseSpeed(MetroTrain,0.0)

	trailer = GetTrainCarriage(MetroTrain, 1)
	SetVehicleHasBeenOwnedByPlayer(MetroTrain,true)
	local id = NetworkGetNetworkIdFromEntity(MetroTrain)
	SetNetworkIdCanMigrate(id, false)
	SetVehicleHasBeenOwnedByPlayer(trailer,true)
	local id = NetworkGetNetworkIdFromEntity(trailer)
	SetNetworkIdCanMigrate(id, false)
	--TriggerEvent('notification', 'Train will depart in ' ..Config.TimeToBoard.. ' seconds', 2)
	PRPCore.Functions.Notify("Thomas the announcer : The train will depart in " ..Config.TimeToBoard.. " seconds")
	Citizen.Wait((Config.TimeToBoard * 1000) - Config.TimeToBoard * 500)
	PRPCore.Functions.Notify("Thomas the announcer : The train will depart in "..  math.ceil(Config.TimeToBoard/2) .." seconds")
	Citizen.Wait((Config.TimeToBoard * 1000) - Config.TimeToBoard * 500)
	--TriggerEvent('notification', 'The train is leaving the station in ' ..Config.TimeWarning.. ' seconds', 2)
	stopsrunning = true
	imhost = true
end

function StartCountry(coords)

	stopsrunning2 = false
	imhost2 = false

	if Train ~= nil then

		trailer = GetTrainCarriage(Train, 1)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(trailer))
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(Train))
	end

	TrainSpeed2 = 0.0
	maxSpeed2 = 0.0

	for  _,model in ipairs(Config.Models) do
		tempmodel = GetHashKey(model)
		RequestModel(tempmodel)

		while not HasModelLoaded(tempmodel) do
			RequestModel(tempmodel)
			Citizen.Wait(0)
		end
	end

	Train = CreateMissionTrain(24,coords[1],coords[2],coords[3],false)
	SetTrainSpeed(Train,0.0)
	SetTrainCruiseSpeed(Train,0.0)
	SetVehicleHasBeenOwnedByPlayer(Train,true)
	local id = NetworkGetNetworkIdFromEntity(Train)
	SetNetworkIdCanMigrate(id, false)
	trailer = GetTrainCarriage(Train, 1)
	SetVehicleHasBeenOwnedByPlayer(trailer,true)
	local id = NetworkGetNetworkIdFromEntity(trailer)
	SetNetworkIdCanMigrate(id, false)
	--TriggerEvent('notification', 'Train will depart in ' ..Config.TimeToBoard.. ' seconds', 2)
	PRPCore.Functions.Notify("Thomas the announcer : The train will depart in " ..Config.TimeToBoard.. " seconds", "info")
	Citizen.Wait((Config.TimeToBoard * 1000) - Config.TimeToBoard * 500)
	PRPCore.Functions.Notify("Thomas the announcer : The train will depart in ".. math.ceil(Config.TimeToBoard/2) .." seconds")
	Citizen.Wait((Config.TimeToBoard * 1000) - Config.TimeToBoard * 500)
	--TriggerEvent('notification', 'The train is leaving the station in ' ..Config.TimeWarning.. ' seconds', 2)
	stopsrunning2 = true
	imhost2 = true
end