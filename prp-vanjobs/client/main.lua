PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

---------------
-- Variables --
---------------
local PlayerData = nil
local CurrentMission = nil
local StopMission = false
local Goons = {}
local JobVan

local DeliveryBlip
local blip
local DeliveryBlipCreated = false

local talkingWithNPC = false
local JobInProgress = false

local JobVanSpawned = false
local GoonsSpawned = false
local JobPlayer = false

local isVehicleLockPicked = false
local JobVanPlate = ''
local DeliveryInProgress = false
local InsideJobVan = false
local vanIsDelivered = false
CurrentCops = 0

--------------------
-- Event Handlers --
--------------------

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
	PlayerJob = PRPCore.Functions.GetPlayerData().job
	TriggerEvent("prp-vanjobs:spawnNPC",-1)
end)

-- Sync mission data
RegisterNetEvent("prp-vanjobs:syncMissionData")
AddEventHandler("prp-vanjobs:syncMissionData",function(data)
	Config.MissionPostion = data
end)

-- NPC Mission spawn event
RegisterNetEvent("prp-vanjobs:spawnNPC")
AddEventHandler("prp-vanjobs:spawnNPC",function()
	NPC = Config.MissionNPC[1]
	local LocationNPC = NPC.Pos
    local heading = NPC.Heading
	RequestModel(GetHashKey(NPC.Ped))
	while not HasModelLoaded(GetHashKey(NPC.Ped)) do
		Citizen.Wait(100)
	end
	MissionPED = CreatePed(7,GetHashKey(NPC.Ped),LocationNPC.x,LocationNPC.y,LocationNPC.z-1,heading,0,true,true)
	FreezeEntityPosition(MissionPED,true)
	SetBlockingOfNonTemporaryEvents(MissionPED, true)
	TaskStartScenarioInPlace(MissionPED, "WORLD_HUMAN_AA_SMOKE", 0, false)
	SetEntityInvincible(MissionPED,true)
end)


RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

-- trigger correct mission:
RegisterNetEvent("prp-vanjobs:startMission")
AddEventHandler("prp-vanjobs:startMission",function(spot)

    local missionList = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}
    local missionsAvailable = 0
    
	-- Loop over list to see if any vehicles exist
	for i in pairs(missionList) do

        local vehinloc = getVehiclesInArea(Config.MissionPosition[i].Location, 5.0)

        if #vehinloc > 0 then
            Config.MissionPosition[i].InUse = true
		end
    end

	-- Loop over list to see if mission is in progress
	for i in pairs(missionList) do

		if Config.MissionPosition[i].InUse then
			missionList[i] = nil
        end
        
        if missionList[i] ~= nil then
            missionsAvailable = missionsAvailable + 1
        end
	end

    if Config.Debug == true then
        listState()
        print(missionsAvailable.." jobs available")
    end
    
	if missionsAvailable == 0 then
        PRPCore.Functions.Notify("No Jobs Available! Try again later..", "error")
    else
        found = nil
        randomList = shuffle(missionList)

        for i,e in pairs(randomList) do
            if randomList[e] ~= nil then
                found = e
                break
            end
        end

        num = found
        TriggerEvent("prp-vanjobs:startTheEvent",num)
		PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
	end
	talkingWithNPC = false
end)

RegisterNetEvent('prp-vanjobs:startTheEvent')
AddEventHandler('prp-vanjobs:startTheEvent', function(num)
	local Goons = {}
	local loc = Config.MissionPosition[num]
	Config.MissionPosition[num].InUse = true
	local playerped = GetPlayerPed(-1)
	
	TriggerServerEvent("prp-vanjobs:syncMissionData",Config.MissionPosition)
    local JobCompleted = false
    
	if Config.Debug == true then
		print("Creating mission blip")
    end
    
	local blip = CreateMissionBlip(loc.Location)
	JobInProgress = true
	
	while not JobCompleted and not StopMission do
		Citizen.Wait(0)
		
		if JobInProgress == true then
		
			local coords = GetEntityCoords(GetPlayerPed(-1))
			
            if (GetDistanceBetweenCoords(coords, loc.Location.x, loc.Location.y, loc.Location.z, true) > 60) and DeliveryInProgress == false then
				DrawMissionText("Follow the ~y~location~s~ on your map")
			end

			if (GetDistanceBetweenCoords(coords, loc.Location.x, loc.Location.y, loc.Location.z, true) < 150) and not JobVanSpawned then
				ClearAreaOfVehicles(loc.Location.x, loc.Location.y, loc.Location.z, 15.0, false, false, false, false, false) 
				local missionCoords = {loc.Location.x, loc.Location.y, loc.Location.z, Config.MissionPosition[num].Heading}
				JobVanSpawned = true

				PRPCore.Functions.SpawnVehicle('rumpo', function(vehicle)
					SetEntityCoordsNoOffset(vehicle,loc.Location.x, loc.Location.y, loc.Location.z)
					SetEntityHeading(vehicle,loc.Heading)
					FreezeEntityPosition(vehicle, true)
					SetVehicleOnGroundProperly(vehicle)
					FreezeEntityPosition(vehicle, false)
					JobVan = vehicle
					SetEntityAsMissionEntity(JobVan, true, true)
					SetVehicleDoorsLockedForAllPlayers(JobVan, true)
				end, missionCoords, true)
			end	
			
			if (GetDistanceBetweenCoords(coords, loc.Location.x, loc.Location.y, loc.Location.z, true) < 150) and not GoonsSpawned then
				ClearAreaOfPeds(loc.Location.x, loc.Location.y, loc.Location.z, 50, 1)
				GoonsSpawned = true
				SetPedRelationshipGroupHash(GetPlayerPed(-1), GetHashKey("PLAYER"))
				AddRelationshipGroup('MissionNPCs')
				local i = 0
				for k,v in pairs(loc.GoonSpawns) do
					RequestModel(GetHashKey(v.ped))
					while not HasModelLoaded(GetHashKey(v.ped)) do
						Wait(1)
					end
					Goons[i] = CreatePed(4, GetHashKey(v.ped), v.x, v.y, v.z, v.h, false, true)
					NetworkRegisterEntityAsNetworked(Goons[i])
					SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(Goons[i]), true)
					SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(Goons[i]), true)
					SetPedCanSwitchWeapon(Goons[i], true)
					SetPedArmour(Goons[i], 100)
					SetPedAccuracy(Goons[i], 100)
					SetPedSuffersCriticalHits(Goons[i], false)
					SetPedSeeingRange(Goons[i], 500.0)
					SetPedHearingRange(Goons[i], 500.0)
					SetPedAlertness(Goons[i],3)
					SetPedCombatMovement(Goons[i],3)
					SetEntityInvincible(Goons[i], false)
					SetEntityVisible(Goons[i], true)
					SetEntityAsMissionEntity(Goons[i])
					RequestAnimDict(v.animDict) 
					while not HasAnimDictLoaded(v.animDict) do
						Citizen.Wait(0) 
					end 
					TaskPlayAnim(Goons[i], v.animDict, v.anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
					GiveWeaponToPed(Goons[i], GetHashKey(v.weapon), 255, false, false)
					SetPedDropsWeaponsWhenDead(Goons[i], false)
					SetPedFleeAttributes(Goons[i], 0, false)	
					SetPedRelationshipGroupHash(Goons[i], GetHashKey("MissionNPCs"))	
					TaskGuardCurrentPosition(Goons[i], 5.0, 5.0, 1)
					i = i +1
				end
            end
			
			if DeliveryInProgress == false and (GetDistanceBetweenCoords(coords, loc.Location.x, loc.Location.y, loc.Location.z, true) < 60) and (GetDistanceBetweenCoords(coords, loc.Location.x, loc.Location.y, loc.Location.z, true) > 10) then
				DrawMissionText("~r~Kill~s~ the goons that guard the ~y~Van~s~")
			end
			
			if (GetDistanceBetweenCoords(coords, loc.Location.x, loc.Location.y, loc.Location.z, true) < 40) and (not JobPlayer and JobVanSpawned) then
				JobPlayer = true
				SetPedRelationshipGroupHash(GetPlayerPed(-1), GetHashKey("PLAYER"))
				AddRelationshipGroup('MissionNPCs')
				local i = 0
                for k,v in pairs(loc.GoonSpawns) do
                    ClearPedTasksImmediately(Goons[i])
                    i = i +1
                end
                SetRelationshipBetweenGroups(0, GetHashKey("MissionNPCs"), GetHashKey("MissionNPCs"))
                SetRelationshipBetweenGroups(5, GetHashKey("MissionNPCs"), GetHashKey("PLAYER"))
                SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("MissionNPCs"))
            end
			
			if isVehicleLockPicked == false and (GetDistanceBetweenCoords(coords, loc.Location.x, loc.Location.y, loc.Location.z, true) < 10) then
				DrawMissionText("Blow the doors off the ~y~Van~s~")
			end
			
			local VanPosition = GetEntityCoords(JobVan) 
			
			if (GetDistanceBetweenCoords(coords, VanPosition.x, VanPosition.y, VanPosition.z, true) <= 2) and isVehicleLockPicked == false then
				DrawText3Ds(VanPosition.x, VanPosition.y, VanPosition.z, "Press ~g~[G]~s~ to ~y~arm the C4~s~")
				if IsControlJustPressed(1, 47) then 

					-- Blow up the van
					ArmVanDoor(VanPosition,JobVan)
					isVehicleLockPicked = true
					Citizen.Wait(500)

				end
			end

			if isVehicleLockPicked == true and (GetDistanceBetweenCoords(coords, loc.Location.x, loc.Location.y, loc.Location.z, true) < 10) then
				DrawMissionText("Rob the ~y~Van~s~")
			end

			if (GetDistanceBetweenCoords(coords, VanPosition.x, VanPosition.y, VanPosition.z, true) <= 4) and isVehicleLockPicked == true then
				DrawText3Ds(VanPosition.x, VanPosition.y, VanPosition.z, "Press ~g~[G]~s~ to ~y~rob the van~s~")
				if IsControlJustPressed(1, 47) then 
					RobbingTheMoney()
					Citizen.Wait(500)

					
					-- Rob the van

					TriggerServerEvent("prp-vanjobs:reward",Config.MissionPosition[num].Level)

					Citizen.Wait(60000)

					Config.MissionPosition[num].InUse = false
					TriggerServerEvent("prp-vanjobs:syncMissionData",Config.MissionPosition)

					local i = 0
					for k,v in pairs(loc.GoonSpawns) do
						if DoesEntityExist(Goons[i]) then
							if Config.Debug == true then
								print("Deleting Goon")
							end
							DeleteEntity(Goons[i])
						end
						i = i +1
					end

					if Config.Debug == true then
						print("Deleting Van")
					end

					Citizen.Wait(500)
					-- Delete entity of VanPosition
					DeleteEntity(JobVan)

					if Config.Debug == true then
						print("Deleting Blip")
					end
					Citizen.Wait(500)
					RemoveBlip(blip)

					JobCompleted = true
					JobInProgress = false
					JobVanSpawned = false
					GoonsSpawned = false
					JobPlayer = false
					JobVanPlate = ''
					isVehicleLockPicked = false
					DeliveryInProgress = false
					vanIsDelivered = false
					DeliveryBlipCreated = false
					break

				end
			end
		
			if StopMission == true then
				
				if Config.EnableCustomNotification == true then
					TriggerEvent("prp-vanjobs:missionFailDeath")
				else
					print("You died")
				end	
								
				Config.MissionPosition[num].InUse = false
				TriggerServerEvent("prp-vanjobs:syncMissionData",Config.MissionPosition)
				DeleteVehicle(JobVan)
				
				if DeliveryInProgress == true then
					RemoveBlip(DeliveryBlip)
				else
					RemoveBlip(blip)
				end
				
				local i = 0
                for k,v in pairs(loc.GoonSpawns) do
                    if DoesEntityExist(Goons[i]) then
                        DeleteEntity(Goons[i])
                    end
                    i = i +1
				end
				
				JobCompleted = true
				JobInProgress = false
				JobVanSpawned = false
				GoonsSpawned = false
				JobPlayer = false
				JobVanPlate = ''
				isVehicleLockPicked = false
				DeliveryInProgress = false
				vanIsDelivered = false
				DeliveryBlipCreated = false
				break
			end
		end		
	end	
end)

RegisterNetEvent('prp-vanjobs:client:robberyCall')
AddEventHandler('prp-vanjobs:client:robberyCall', function(coords)

    local job = nil
    if PlayerJob == nil then
        job = PRPCore.Functions.GetPlayerData().job.name
    else
        job = PlayerJob.name
    end

    if job == "police" then 
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
        	timeOut = 30000,
            alertTitle = "Van Robbery Attempt",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
		})
		
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911: Van Robbery")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

---------------------
-- Citizen Threads --
---------------------

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(5)
		local pos = GetEntityCoords(MissionPED)
		local playerPos = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(Config.MissionNPC) do
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, pos.x, pos.y, pos.z)
			if distance <= 1.5 and (JobInProgress == false and talkingWithNPC == false) then
				DrawText3Ds(pos.x, pos.y, pos.z, "Press ~g~[E]~s~ to ~y~Talk~s~")
				if IsControlJustPressed(0, 38) then
                    requestMissionFromNPC()
					Citizen.Wait(500)
				end
			end
		end		
	end
end)






---------------
-- Functions --
---------------

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end


function requestMissionFromNPC()
    talkingWithNPC = true
    
	PRPCore.Functions.TriggerCallback('prp-vanjobs:getGoldJobCoolDown', function(cooldownTimer)
		if Config.Debug == true then
			print("cooldownTimer: "..tostring(cooldownTimer))
		end
		if not cooldownTimer then
            if CurrentCops >= Config.RequiredPoliceOnline then
                TriggerServerEvent("prp-vanjobs:missionAccepted")	
            else
                PRPCore.Functions.Notify("Not enough police!", "error")
            end
		else
			talkingWithNPC = false
		end
	end)
	Citizen.Wait(500)
end

function listState()
	for k, v in pairs(Config.MissionPosition) do
		print(k, v.InUse)
	end
end

function shuffle(tbl)
    for i = #tbl, 2, -1 do
      local j = math.random(i)
      tbl[i], tbl[j] = tbl[j], tbl[i]
    end
    return tbl
  end

function getVehiclesInArea(coords, area)
	local vehicles       = getVehicles()
	local vehiclesInArea = {}

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end

function getVehicles()
	local vehicles = {}

	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

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

 -- Function for job blip in progress:
function CreateMissionBlip(location)
	local blip = AddBlipForCoord(location.x,location.y,location.z)
	SetBlipSprite(blip, 1)
	SetBlipColour(blip, 5)
	AddTextEntry('MYBLIP', "GoldJob Mission")
	BeginTextCommandSetBlipName('MYBLIP')
	AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)
	SetBlipScale(blip, 0.9) -- set scale
	SetBlipAsShortRange(blip, true)
	SetBlipRoute(blip, true)
	SetBlipRouteColour(blip, 5)
	return blip
end

-- Function for Mission text:
function DrawMissionText(text)
    SetTextScale(0.5, 0.5)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(0.5,0.955)
end

function ArmVanDoor(pos,JobVan)
				
	local playerPed = GetPlayerPed(-1)
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	itemC4prop = CreateObject(GetHashKey('prop_c4_final_green'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(itemC4prop, playerPed, GetPedBoneIndex(playerPed, 60309), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)

	FreezeEntityPosition(playerPed, true)
	TaskPlayAnim(playerPed, 'anim@heists@ornate_bank@thermal_charge_heels', "thermal_charge", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	TriggerServerEvent("prp-vanjobs:callCops", pos)
	copsCalled = true

	Citizen.Wait(750)

	PRPCore.Functions.Progressbar("lockpickvan", "Arming the C4..", 60000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		PRPCore.Functions.Notify("Success!", "success")
	end, function() -- Cancel
		PRPCore.Functions.Notify("Failed!", "error")
	end)
	Citizen.Wait(5000)

	ClearPedTasks(playerPed)
	DetachEntity(itemC4prop)
	AttachEntityToEntity(itemC4prop, JobVan, GetEntityBoneIndexByName(JobVan, 'door_pside_r'), -0.7, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	FreezeEntityPosition(playerPed, false)

	Citizen.Wait(90000)

	local TruckPos = GetEntityCoords(JobVan)
	SetVehicleDoorBroken(JobVan, 2, false)
	SetVehicleDoorBroken(JobVan, 3, false)
	AddExplosion(TruckPos.x,TruckPos.y,TruckPos.z, 'EXPLOSION_TANKER', 2.0, true, false, 2.0)
	ApplyForceToEntity(JobVan, 0, TruckPos.x,TruckPos.y,TruckPos.z, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
end


-- Function for robbing the money in the truck
function RobbingTheMoney()
	
	RequestAnimDict('anim@heists@ornate_bank@grab_cash_heels')
	while not HasAnimDictLoaded('anim@heists@ornate_bank@grab_cash_heels') do
		Citizen.Wait(50)
	end
	
	local playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(playerPed)
	
	moneyBag = CreateObject(GetHashKey('prop_cs_heist_bag_02'),pos.x, pos.y,pos.z, true, true, true)
	AttachEntityToEntity(moneyBag, playerPed, GetPedBoneIndex(playerPed, 57005), 0.0, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
	TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
	FreezeEntityPosition(playerPed, true)
	
	PRPCore.Functions.Progressbar("lockpickvan", "Robbing the van..", 90000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		PRPCore.Functions.Notify("Success!", "success")
	end, function() -- Cancel
		PRPCore.Functions.Notify("Failed!", "error")
	end)
	Citizen.Wait(90000)
	
	DeleteEntity(moneyBag)
	ClearPedTasks(playerPed)
	FreezeEntityPosition(playerPed, false)
	SetPedComponentVariation(playerPed, 5, 23, 1, 2)
	

end