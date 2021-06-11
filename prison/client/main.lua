Keys = {
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

PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

--------------
-- Variables --
---------------
isLoggedIn = false
inJail     = false
jailTime   = 0
currentJob = "electrician"
CellsBlip  = nil
TimeBlip   = nil
--local cell = math.random(1,#Config.Locations.meth.cells)
cell = math.random(1,1)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(7)
		if jailTime > 0 and inJail then 
			Citizen.Wait(1000 * 60)
			jailTime = jailTime - 1
			if jailTime <= 0 then
				jailTime = 0
				PRPCore.Functions.Notify("Your time is up! Check out at the visitors area.", "success", 10000)
			end
			TriggerServerEvent("prison:server:SetJailStatus", jailTime)
		else
			Citizen.Wait(5000)
		end
	end
end)

function CreateCellsBlip()
	if CellsBlip ~= nil then
		RemoveBlip(CellsBlip)
	end
	CellsBlip = AddBlipForCoord(Config.Locations["yard"].coords.x, Config.Locations["yard"].coords.y, Config.Locations["yard"].coords.z)

	SetBlipSprite (CellsBlip, 238)
	SetBlipDisplay(CellsBlip, 4)
	SetBlipScale  (CellsBlip, 0.8)
	SetBlipAsShortRange(CellsBlip, true)
	SetBlipColour(CellsBlip, 4)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Cells")
	EndTextCommandSetBlipName(CellsBlip)

	if TimeBlip ~= nil then
		RemoveBlip(TimeBlip)
	end
	TimeBlip = AddBlipForCoord(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z)

	SetBlipSprite (TimeBlip, 466)
	SetBlipDisplay(TimeBlip, 4)
	SetBlipScale  (TimeBlip, 0.8)
	SetBlipAsShortRange(TimeBlip, true)
	SetBlipColour(TimeBlip, 4)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Check Time")
	EndTextCommandSetBlipName(TimeBlip)
end

--[[
	Locations n stuff
]]
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		if isLoggedIn then
			if inJail then
				local pos = GetEntityCoords(GetPlayerPed(-1))
				if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, true) < 1.5) then
					PRPCore.Functions.DrawText3D(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, "~g~E~w~ - Check time")
					if IsControlJustReleased(0, 38) then
						TriggerEvent("prison:client:Leave")
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, true) < 2.5) then
					PRPCore.Functions.DrawText3D(Config.Locations["freedom"].coords.x, Config.Locations["freedom"].coords.y, Config.Locations["freedom"].coords.z, "Check time")
				end  
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
	isLoggedIn = true
	PRPCore.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.metadata["injail"] > 0 then
			TriggerEvent("prison:client:Enter", PlayerData.metadata["injail"], true)
		end

		TriggerEvent("prison:spawnNPC",-1)

	end)
end)

RegisterNetEvent('PRPCore:Client:RemoveJailTime')
AddEventHandler('PRPCore:Client:RemoveJailTime', function(time)
	jailTime = jailTime - time
end)

RegisterNetEvent('PRPCore:Client:CheckJailTime')
AddEventHandler('PRPCore:Client:CheckJailTime', function()
	src = source
	PRPCore.Functions.Notify("You have "..jailTime.." months left in jail.", "success", 5000)
end)

RegisterNetEvent('PRPCore:Client:CheckInmateTime')
AddEventHandler('PRPCore:Client:CheckInmateTime', function()
	src = source
	PRPCore.Functions.Notify("You have "..jailTime.." months left in jail.", "success", 5000)
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
	isLoggedIn = false
	inJail = false
	currentJob = nil
	RemoveBlip(currentBlip)
end)

RegisterNetEvent('prison:client:Enter')
AddEventHandler('prison:client:Enter', function(time, isRelog)
	PRPCore.Functions.Notify("You are jailed for "..time.." months..", "error")
	TriggerEvent("chatMessage", "SYSTEM", "warning", "Your belongings have been seized, you will receive them once you are out of jail..")
	DoScreenFadeOut(500)
	while not IsScreenFadedOut() do
		Citizen.Wait(10)
	end
	local RandomStartPosition = Config.Locations.spawns[math.random(1, #Config.Locations.spawns)]
	SetEntityCoords(GetPlayerPed(-1), RandomStartPosition.coords.x, RandomStartPosition.coords.y, RandomStartPosition.coords.z - 0.9, 0, 0, 0, false)
	SetEntityHeading(GetPlayerPed(-1), RandomStartPosition.coords.h)
	Citizen.Wait(500)
	TriggerEvent('animations:client:EmoteCommandStart', {RandomStartPosition.animation})

	inJail = true
	jailTime = time
	currentJob = "electrician"
	TriggerServerEvent("prison:server:SetJailStatus", jailTime)
	if not isRelog then
		TriggerServerEvent("prison:server:SaveJailItems", jailTime)
	end

	TriggerServerEvent("InteractSound_SV:PlayOnSource", "jail", 0.5)

	CreateCellsBlip()
	
	Citizen.Wait(2000)

	DoScreenFadeIn(1000)
	PRPCore.Functions.Notify("Do some jobs for sentencing reducing: "..Config.Jobs[currentJob])
end)

RegisterNetEvent('prison:client:Leave')
AddEventHandler('prison:client:Leave', function()
	if jailTime > 0 then 
		PRPCore.Functions.Notify("You need to sit in jail for "..jailTime.." months..")
	else
		TriggerServerEvent("prison:server:SetJailStatus", 0)
		TriggerServerEvent("prison:server:GiveJailItems")
		TriggerEvent("chatMessage", "SYSTEM", "warning", "You received your belongings again..")
		inJail = false
		RemoveBlip(currentBlip)
		RemoveBlip(CellsBlip)
		CellsBlip = nil
		RemoveBlip(TimeBlip)
		TimeBlip = nil
		PRPCore.Functions.Notify("You are free, enjoy and dont be a scum again! :)")
		DoScreenFadeOut(500)
		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end
		SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
		SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.h)

		Citizen.Wait(500)

		DoScreenFadeIn(1000)
	end
end)



---------------------
-- Citizen Threads --
---------------------
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		if isLoggedIn then
			if inJail then
				local pos = GetEntityCoords(GetPlayerPed(-1))
				loc = Config.Locations.meth.cells[cell]
				if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, loc.coords.x, loc.coords.y, loc.coords.z, true) < 1.5) then
					PRPCore.Functions.DrawText3D(loc.coords.x, loc.coords.y, loc.coords.z, "~g~E~w~ - Steal Meth")
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:assmeth')
						Citizen.Wait(5000)
						cell = math.random(1,#Config.Locations.meth.cells)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[1].Pos.x, Config.MissionNPC[1].Pos.y,Config.MissionNPC[1].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[1].Pos.x, Config.MissionNPC[1].Pos.y, Config.MissionNPC[1].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[1].Cost.." assmeth for 1 "..Config.MissionNPC[1].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[1].Item, Config.MissionNPC[1].Cost)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[2].Pos.x, Config.MissionNPC[2].Pos.y,Config.MissionNPC[2].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[2].Pos.x, Config.MissionNPC[2].Pos.y, Config.MissionNPC[2].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[2].Cost.." assmeth for 1 "..Config.MissionNPC[2].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[2].Item, Config.MissionNPC[2].Cost)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[3].Pos.x, Config.MissionNPC[3].Pos.y,Config.MissionNPC[3].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[3].Pos.x, Config.MissionNPC[3].Pos.y, Config.MissionNPC[3].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[3].Cost.." assmeth for 1 "..Config.MissionNPC[3].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[3].Item, Config.MissionNPC[3].Cost)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[4].Pos.x, Config.MissionNPC[4].Pos.y,Config.MissionNPC[4].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[4].Pos.x, Config.MissionNPC[4].Pos.y, Config.MissionNPC[4].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[4].Cost.." assmeth for 1 "..Config.MissionNPC[4].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[4].Item, Config.MissionNPC[4].Cost)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[5].Pos.x, Config.MissionNPC[5].Pos.y,Config.MissionNPC[5].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[5].Pos.x, Config.MissionNPC[5].Pos.y, Config.MissionNPC[5].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[5].Cost.." assmeth for 1 "..Config.MissionNPC[5].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[5].Item, Config.MissionNPC[5].Cost)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[6].Pos.x, Config.MissionNPC[6].Pos.y,Config.MissionNPC[6].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[6].Pos.x, Config.MissionNPC[6].Pos.y, Config.MissionNPC[6].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[6].Cost.." assmeth for 1 "..Config.MissionNPC[6].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[6].Item, Config.MissionNPC[6].Cost)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[7].Pos.x, Config.MissionNPC[7].Pos.y,Config.MissionNPC[7].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[7].Pos.x, Config.MissionNPC[7].Pos.y, Config.MissionNPC[7].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[7].Cost.." assmeth for 1 "..Config.MissionNPC[7].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[7].Item, Config.MissionNPC[7].Cost)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[8].Pos.x, Config.MissionNPC[8].Pos.y,Config.MissionNPC[8].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[8].Pos.x, Config.MissionNPC[8].Pos.y, Config.MissionNPC[8].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[8].Cost.." assmeth for 1 "..Config.MissionNPC[8].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[8].Item, Config.MissionNPC[8].Cost)
					end
				elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.MissionNPC[9].Pos.x, Config.MissionNPC[9].Pos.y,Config.MissionNPC[9].Pos.z, true) < 1.5) then
					drawtext(Config.MissionNPC[9].Pos.x, Config.MissionNPC[9].Pos.y, Config.MissionNPC[9].Pos.z, "~g~E~w~ - Trade "..Config.MissionNPC[9].Cost.." assmeth for 1 "..Config.MissionNPC[9].Label)
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('prison:server:trade', Config.MissionNPC[9].Item, Config.MissionNPC[9].Cost)
					end
				else
					Citizen.Wait(2000)
				end  
			end
		else
			Citizen.Wait(5000)
		end
	end
end)


------------
-- Events --
------------

-- NPC Mission spawn event
RegisterNetEvent("prison:spawnNPC")
AddEventHandler("prison:spawnNPC",function(x)

	for k,v in pairs(Config.MissionNPC) do
		NPC = v
		local LocationNPC = NPC.Pos
    	local heading = NPC.Heading
		RequestModel(GetHashKey(NPC.Ped))
		while not HasModelLoaded(GetHashKey(NPC.Ped)) do
			Citizen.Wait(100)
		end
		MissionPED = CreatePed(7,GetHashKey(NPC.Ped),LocationNPC.x,LocationNPC.y,LocationNPC.z-1,heading,0,true,true)
		FreezeEntityPosition(MissionPED,true)
		SetBlockingOfNonTemporaryEvents(MissionPED, true)
		if NPC.Ped == "u_m_y_prisoner_01" then
			TaskStartScenarioInPlace(MissionPED, "EAR_TO_TEXT", 0, false)
		elseif NPC.Ped == "s_m_y_prisoner_01" then
			TaskStartScenarioInPlace(MissionPED, "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON", 0, false)
		elseif NPC.Ped == "s_m_m_prisguard_01" then
			TaskStartScenarioInPlace(MissionPED, "WORLD_HUMAN_GUARD_PATROL", 0, false)
		elseif NPC.Ped == "mp_m_securoguard_01" then
			TaskStartScenarioInPlace(MissionPED, "WORLD_HUMAN_LEANING", 0, false)
		elseif NPC.Ped == "csb_rashcosvki" then
			TaskStartScenarioInPlace(MissionPED, "WORLD_HUMAN_SEAT_LEDGE_EATING", 0, false)
		elseif NPC.Ped == "ig_rashcosvki" then
			TaskStartScenarioInPlace(MissionPED, "PROP_HUMAN_BUM_BIN", 0, false)
		elseif NPC.Ped == "u_m_y_babyd" then
			TaskStartScenarioInPlace(MissionPED, "WORLD_HUMAN_JOG_STANDING", 0, false)
		else
			TaskStartScenarioInPlace(MissionPED, "WORLD_HUMAN_AA_SMOKE", 0, false)
		end
		SetEntityInvincible(MissionPED,true)
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

function drawtext(x, y, z, text)
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
    ClearDrawOrigin()
end