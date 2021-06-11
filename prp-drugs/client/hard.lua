PRPCore = nil
usingUsb = nil
marker = nil
Goon = {}
local blip
local suitcase
local h = math.random(1,400)
local spawned = false
local inrange = false

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)



------------
-- Events --
------------
RegisterNetEvent('prp-drugs:client:EnterUsb')
AddEventHandler('prp-drugs:client:EnterUsb', function(x,y,z,usb)
    usingUsb = usb
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(pos, x, y, z, true)

    if distance < 2.0 then
        TriggerEvent('animations:client:EmoteCommandStart', {"atm"})
        Citizen.Wait(3500)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        TriggerEvent("mhacking:show")
        TriggerEvent("mhacking:start", math.random(3, 6), math.random(10, 20), OnHackDone)
    end
end)


RegisterNetEvent('prp-drugs:client:startmission')
AddEventHandler('prp-drugs:client:startmission', function()
    PRPCore.Functions.TriggerCallback('prp-drugs:server:getjob', function(job)
        
        -- Let's spawn the brief case
        TriggerEvent('prp-drugs:spawnbriefcase', job.briefcase.coords.x, job.briefcase.coords.y, job.briefcase.coords.z)

        -- Define some variables for ease of use
        local x = job.briefcase.coords.x
        local y = job.briefcase.coords.y
        local z = job.briefcase.coords.z

        -- Create our Mission blip
        blip = CreateMissionBlip(x,y,z)
        
        marker = true
        Citizen.CreateThread(function()
            Citizen.Wait(0)
            while true do
                Citizen.Wait(3)
                if marker == true then
                    local ped = GetPlayerPed(-1)
                    local pos = GetEntityCoords(ped)
                    local textDist = GetDistanceBetweenCoords(pos, x, y, z)
                    if textDist < 10.0 then
                        DrawText3Ds(job.briefcase.coords.x, job.briefcase.coords.y, job.briefcase.coords.z + 0.3, '[E] Collect Drop')
                        
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent('prp-drugs:client:claimdrugs')
                        end
                    else
                        Citizen.Wait(2000) 
                    end

                    if textDist < 250.0 then
                        inrange = true
                    end
                else
                    Citizen.Wait(10000) 
                end
            end
        end)


        Citizen.CreateThread(function()
            Citizen.Wait(0)
            while true do
                Citizen.Wait(3)

                if inrange == true and spawned == false then
                    local peds = {
                        'g_m_y_famdnf_01', 'g_m_y_mexgang_01', 'g_m_m_chicold_01', 'g_m_y_azteca_01', 'g_m_y_korean_02', 'g_m_y_lost_01'
                    }
                    local ped = peds[math.random(1,#peds)]
                    TriggerServerEvent("prp-log:server:CreateLog", "drugs", "Earned", "red", "**"..GetPlayerName(PlayerId()).."** spawned peds: "..ped)
                    local animDict = 'rcmme_amanda1'
                    local anim = 'stand_loop_cop'
                    local weapons = {
                        'weapon_appistol', 'weapon_pistol50', 'weapon_microsmg', 'weapon_smg', 
                        'weapon_appistol', 'weapon_pistol50', 'weapon_microsmg', 'weapon_smg', 
                        'weapon_assaultrifle', 'weapon_advancedrifle', 'weapon_microsmg', 'weapon_minigun'
                    }
        
                    ClearAreaOfPeds(x, y, z, 50, 1)
                    SetPedRelationshipGroupHash(GetPlayerPed(-1), GetHashKey("PLAYER"))
                    AddRelationshipGroup('MissionNPCs')
            
                    RequestModel(GetHashKey(ped))
                    while not HasModelLoaded(GetHashKey(ped)) do
                        Wait(1)
                        print("waiting for ped to load")
                    end
                    
                    local a = 1
                    spawned = true
                    repeat
                        print("Spawning Ped "..a)
                        Goon[a] = CreatePed(4, GetHashKey(ped), x + randomFloat(1,7), y + randomFloat(1,7), z, 90.0, false, true)
                        NetworkRegisterEntityAsNetworked(Goon[a])
                        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(Goon[a]), true)
                        SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(Goon[a]), true)
                        SetPedCanSwitchWeapon(Goon[a], true)
                        SetPedArmour(Goon[a], 100)
                        SetPedAccuracy(Goon[a], 100)
                        SetPedSuffersCriticalHits(Goon[a], false)
                        SetPedCombatAbility(Goon[a],2)
                        SetPedCombatRange(Goon[a],1)
                        SetPedSeeingRange(Goon[a], 500.0)
                        SetPedHearingRange(Goon[a], 500.0)
                        SetPedAlertness(Goon[a],3)
                        SetPedCombatMovement(Goon[a],100)
                        SetEntityInvincible(Goon[a], false)
                        SetEntityVisible(Goon[a], true)
                        SetEntityAsMissionEntity(Goon[a])
                        RequestAnimDict(animDict) 
                        while not HasAnimDictLoaded(animDict) do
                            Citizen.Wait(0) 
                        end 
                        TaskPlayAnim(Goon[a], animDict, anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        local weapon = weapons[math.random(1,#weapons)]
        
                        GiveWeaponToPed(Goon[a], GetHashKey(weapon), 255, false, false)
                        SetPedDropsWeaponsWhenDead(Goon[a], false)
                        SetPedFleeAttributes(Goon[a], 0, false)	
                        SetPedRelationshipGroupHash(Goon[a], GetHashKey("MissionNPCs"))	
                        TaskGuardCurrentPosition(Goon[a], 5.0, 5.0, 1)
            
                        JobPlayer = true
                        SetPedRelationshipGroupHash(GetPlayerPed(-1), GetHashKey("PLAYER"))
                        AddRelationshipGroup('MissionNPCs')
                        ClearPedTasksImmediately(Goon[a])
                        SetRelationshipBetweenGroups(0, GetHashKey("MissionNPCs"), GetHashKey("MissionNPCs"))
                        SetRelationshipBetweenGroups(5, GetHashKey("MissionNPCs"), GetHashKey("PLAYER"))
                        SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("MissionNPCs"))
                        TaskCombatPed(Goon[a], GetPlayerPed(-1), 0, 16)
                        print("Done spawning Ped "..a)
                        a = a + 1
                    until( a > 8 )
                end
            end
        end)

    end)
end)


RegisterNetEvent('prp-drugs:spawnbriefcase')
AddEventHandler('prp-drugs:spawnbriefcase', function(x,y,z)
    model = 1049338225

	SpawnObject(model, {
		x = x,
		y = y,
		z = z
    }, function(obj)
        suitcase = obj
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
	end)
end)


RegisterNetEvent('prp-drugs:client:claimdrugs')
AddEventHandler('prp-drugs:client:claimdrugs', function()
    loadAnimDict("amb@medic@standing@kneel@enter")
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@kneel@enter', 'enter' , 3.0, 3.0, -1, 10, 0, false, false, false)
	PRPCore.Functions.Progressbar("claimdrugs", "Inspecting and collecting the drop", 30000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "amb@medic@standing@kneel@enter", "enter", 1.0)
        PRPCore.Functions.Notify("Success!", "success")

        -- Get reward and cleanup
        TriggerEvent('prp-drugs:client:clean')
        TriggerEvent('prp-drugs:client:i1ii1i111i', h)
        marker = false

	end, function() -- Cancel
		PRPCore.Functions.Notify("Failed!", "error")
	end)
end)

RegisterNetEvent('prp-drugs:client:clean')
AddEventHandler('prp-drugs:client:clean', function()

    -- Remove the blip, this variable is locally scoped at top of file
    RemoveBlip(blip)

    -- Delete the suitcase full of drugs
    DeleteObject(suitcase)

end)

RegisterNetEvent('prp-drugs:client:i1ii1i111i')
AddEventHandler('prp-drugs:client:i1ii1i111i', function(p)
    if p ~= nil then
        if p == h then
            TriggerServerEvent('prp-drugs:server:1ii1i1i1ii1', usingUsb)
        else
            TriggerServerEvent("prp-log:server:CreateLog", "honeypot", "LUA INJECTION", "red", "**"..GetPlayerName(PlayerId()).."** tried to execute reward for drugs. Expected: "..h.." Got:"..p)
        end
    else
        TriggerServerEvent("prp-log:server:CreateLog", "honeypot", "LUA INJECTION", "red", "**"..GetPlayerName(PlayerId()).."** tried to execute reward for drugs. Got nil")
    end
end)


RegisterNetEvent('prp-drugs:client:teleport')
AddEventHandler('prp-drugs:client:teleport', function(x,y,z)
    Citizen.Wait(500)
    SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
    SetEntityHeading(PlayerPedId(), 200.0)
    Citizen.Wait(100)
    DoScreenFadeIn(1000)
end)


RegisterNetEvent('prp-drugs:client:getinfo')
AddEventHandler('prp-drugs:client:getinfo', function(toggle)
    if toggle == true then
        ReadLetter(toggle)
    else
        CloseLetter(toggle)
    end
end)

---------------------
-- Citizen Threads --
---------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        local inDist = GetDistanceBetweenCoords(pos, Config.ServerRoomDoor.coords.x, Config.ServerRoomDoor.coords.y, Config.ServerRoomDoor.coords.z)
        if inDist < 1.0 then
            DrawText3Ds(Config.ServerRoomDoor.coords.x, Config.ServerRoomDoor.coords.y, Config.ServerRoomDoor.coords.z + 0.3, '[E] Enter Server Room')
                        
            if IsControlJustPressed(0, 38) then
                TriggerEvent('prp-drugs:client:teleport', Config.ServerRoomSpawn.coords.x, Config.ServerRoomSpawn.coords.y, Config.ServerRoomSpawn.coords.z)
            end
        else
            Citizen.Wait(2000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        local textDist = GetDistanceBetweenCoords(pos, Config.ServerRoomSpawn.coords.x, Config.ServerRoomSpawn.coords.y, Config.ServerRoomSpawn.coords.z)
        if textDist < 1.0 then
            DrawText3Ds(Config.ServerRoomSpawn.coords.x, Config.ServerRoomSpawn.coords.y, Config.ServerRoomSpawn.coords.z + 0.3, '[E] Enter Server Room')
                        
            if IsControlJustPressed(0, 38) then
                TriggerEvent('prp-drugs:client:teleport', Config.ServerRoomDoor.coords.x, Config.ServerRoomDoor.coords.y, Config.ServerRoomDoor.coords.z)
            end
        else
            Citizen.Wait(2000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        local textDist = GetDistanceBetweenCoords(pos, Config.ServerRoomComputer.coords.x, Config.ServerRoomComputer.coords.y, Config.ServerRoomComputer.coords.z)
        if textDist < 1.0 then
            DrawText3Ds(Config.ServerRoomComputer.coords.x, Config.ServerRoomComputer.coords.y, Config.ServerRoomComputer.coords.z + 0.3, '[E] Read Computer Screen')
                        
            if IsControlJustPressed(0, 38) then
                PRPCore.Functions.TriggerCallback('prp-drugs:server:getlocation', function(loc)

                    TriggerServerEvent('prp-phone:server:sendNewMail', {
                        sender = "Anonymous",
                        subject = "USB Location",
                        message = "Here is the location of the USB triggers: "..loc.Hint,
                        button = {}
                    })
                end)
            end
        else
            Citizen.Wait(2000)
        end
    end
end)




---------------
-- Functions --
---------------
function OnHackDone(success)
    if success then
        spawned = false
        inrange = false
        TriggerEvent('mhacking:hide')
        TriggerServerEvent("prp-drugs:server:setavailable", usingUsb)
        TriggerServerEvent("prp-drugs:server:wait", usingUsb)
        TriggerEvent('prp-drugs:client:startmission')
    else
        TriggerEvent('mhacking:hide')
        PRPCore.Functions.Notify("Totally failed!", "error")
	end
end

SpawnObject = function(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))

	Citizen.CreateThread(function()
		RequestModel(model)

		local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)

		if cb ~= nil then
			cb(obj)
		end
	end)
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

function randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end

function CreateMissionBlip(x,y,z)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip, 1)
	SetBlipColour(blip, 5)
	AddTextEntry('MYBLIP', "Drug Pickup")
	BeginTextCommandSetBlipName('MYBLIP')
	AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)
	SetBlipScale(blip, 0.9) -- set scale
	SetBlipAsShortRange(blip, true)
	SetBlipRoute(blip, true)
	SetBlipRouteColour(blip, 5)
	return blip
end