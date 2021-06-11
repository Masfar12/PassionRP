Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)


-- Automated Prison Defense
Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(0)

        local pos = GetEntityCoords(PlayerPedId())
        if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, 1702.9809570313, 2578.2302246094, 74.141448974609, true) < 185.0) then
            if IsPedInFlyingVehicle(PlayerPedId()) then
                veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                model = GetDisplayNameFromVehicleModel(GetEntityModel(veh))

                if (model ~= "EHELI") then
                    AddExplosion(pos.x, pos.y, pos.z, 5, 1.0, true, false, 1.0)
                    TriggerServerEvent('prison:defense', pos)
                    TriggerServerEvent("prp-log:server:CreateLog", "prisonbreaks", "Automated Missle System", "red", "**"..GetPlayerName(PlayerId()).."** was flying a "..model.." and got blown up.")
                    Citizen.Wait(60000)
                end
            end
        end

        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1000)
      N_0xf4f2c0d4ee209e20() -- stops camera from idling
    end
end)

local playerdatatable ={}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        PRPCore.Functions.TriggerCallback('PRPCore:GetPlayersLoop', function(data)
            playerdatatable = {}
            for _, player in ipairs(data) do
                local ped = GetPlayerPed(GetPlayerFromServerId(tonumber(player)))
                if ped ~= nil and DoesEntityExist(ped) then
                    table.insert(playerdatatable, {
                        ["ped"] = ped,
                        ["id"] = tonumber(player),
                    })
                end
            end
        end)
    end
end)

local idsOn = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)

        if IsControlJustPressed(0, 213) then
            idsOn = true
        end

        if IsControlJustReleased(0, 213) then
            idsOn = false
        end

        if idsOn then
            for _, player in pairs(GetPlayersFromCoords(10.0)) do
                local ped = player.ped
                local PlayerId = player.id
                local PlayerName = GetPlayerName(NetworkGetPlayerIndexFromPed(player.ped))
                local PlayerCoords = GetEntityCoords(ped)

                if not IsAdmin(PlayerName) and PlayerCoords.x ~= 0.0 then
                    DrawText3Ds(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z + 1.0, '['..PlayerId..']')
                end

            end
        end
    end
end)


GetPlayersFromCoords = function(distance)
    local closePlayers = {}
    coords = GetEntityCoords(GetPlayerPed(-1))

    if distance == nil then
        distance = 5.0
    end
    for _, player in pairs(playerdatatable) do
		local target = player.ped
		local targetCoords = GetEntityCoords(target)
		local targetdistance = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)
		if GetPlayerFromServerId(player.id) ~= -1 and targetdistance <= distance then
			table.insert(closePlayers, player)
		end
    end
    
    return closePlayers
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

DrawText3Ds = function(x, y, z, text)
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

function IsAdmin(name) 
    for _, admin in pairs(Config.AdminNames) do
        if admin == name then
            return(true)
        end
    end
    return false
end

AddEventHandler("gameEventTriggered", function(name, args)
    if name == "CEventNetworkEntityDamage" then
        local ped = PlayerPedId()

        local hit, bone = nil, nil
        hit, bone = GetPedLastDamageBone(ped)
        if bone ~= nil then
            local weapon = GetDamagingWeapon(ped)
            if weapon ~= nil then
                if IsPedAPlayer(args[1]) then
                    local attacker = GetPlayerServerId(NetworkGetPlayerIndexFromPed(args[2]))
                    local dmg = GetPlayerWeaponDamageModifier(GetPlayerFromServerId(attacker))
                    if dmg > 1.0 then
                        TriggerServerEvent("logDamageDone", attacker, weapon, dmg)
                    end
                end
            end
        end
    end
end) 

function GetDamagingWeapon(ped)
    for k, v in pairs(Config.Weapons) do
        if HasPedBeenDamagedByWeapon(ped, k, 0) then
            ClearEntityLastDamageEntity(ped)
            return v
        end
    end

    return nil
end

AddEventHandler("prp-polyzone:enter", function(name)
    if name == "Vanilla" then
        TriggerServerEvent('PRPCore:server:SetStatZoneMultipler',2.0)
    end
end)

AddEventHandler("prp-polyzone:exit", function(name)
    if name == "Vanilla" then
        TriggerServerEvent('PRPCore:server:SetStatZoneMultipler',1.0)
    end
end)

Citizen.CreateThread(function()
    local ResetTimer = 5 -- The time (in seconds) you have from the beginning of jump 1 until the timer resets, if you jump under MaxJumps in this time, the count will reset.
    local MaxJumps = 3 -- Max amount of jumps until ragdoll.
    local count, start_timer = 0, 0
    while true do 
        wait = 5
        local ped = PlayerPedId()
        local timer = GetGameTimer()
        if IsPedSprinting(ped) or IsPedRunning(ped) then
            if IsControlJustReleased(0, 22) then
                wait = 1000
                count = count+1
                if count == 1 then
                    start_timer = timer
                end
            end
        else
            wait = 1000
        end
        if count >= MaxJumps then
            SetPedToRagdollWithFall(ped, 950, 1000, 0, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            count, start_timer = 0, 0
        end
        --print(count, timer-start_timer)
        if start_timer > 0 and (timer-start_timer) > ResetTimer*1000 then
            count, start_timer = 0, 0
        end
        Citizen.Wait(wait)
    end           
end)