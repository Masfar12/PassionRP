----------------------
------ PRPCore -------
----------------------

PRPCore = nil

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)

-------------------------------
------ CORE OF THE MENU -------
-------------------------------

local GlobalBlipData = {}
local currentPlayer = {}
local old_coords = nil
local hasGodMode = false
local FrozenState = false
local showNames = false
local showBlips = false
local PlayerBlips = {}
local is_spectating = false
local is_spectating_2 = false
local has_permissions = false
local loaded = false
local can_reset_coords = false
local permission_group = nil

local polarAngleDeg		= 0;
local azimuthAngleDeg	= 90;
local radius			= -3.5;
local cam 				= nil


RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('prp-adminMenu:server:loadPermissions')
end)

RegisterNetEvent('prp-adminMenu:server:loadPermissions')
AddEventHandler('prp-adminMenu:server:loadPermissions', function(result, permission_group2)
	PRPCore.Functions.TriggerCallback('prp-adminMenu:server:hasPermissions', function(cb)
		if cb then
			has_permissions = result
			permission_group = permission_group2
			loaded = true
		end
	end)
end)

Citizen.CreateThread(function()
	LoadingPlsWaitTY()
	while true do
		Citizen.Wait(5)
		if has_permissions then
			if IsControlJustPressed(1, 10) then
				PRPCore.Functions.TriggerCallback('prp-adminMenu:GetData', function(data)
					SetNuiFocus(true, true)
					SendNUIMessage({type = 'open', values = data})
				end)
			end
		else
			break
		end
	end
end)

Citizen.CreateThread(function()
	while not loaded do Wait(500) end
    while true do
        if has_permissions then
            GetBlipData()
			Wait(5000)
        else
			break
		end
    end
end)

RegisterNUICallback('closemenu', function(data)
	SetNuiFocus(false)
end)

RegisterNUICallback('exitspectate', function(data)
	SetNuiFocus(false)
	ExitSpectate(false)
end)

RegisterNUICallback('quick', function(data)
	local ped = PlayerPedId()
	local pedId = PlayerId()
	local target = GetPlayerServerId(PlayerId())
	local pname = GetPlayerName(pedId)
	local targetName = GetPlayerName(target)
	if data.id == nil then
		data.id = GetPlayerServerId(PlayerId())
	end
	data.id = tonumber(data.id)
	if data.type == 'spectate' or data.type == 'openinv' or data.type == 'menu' then
		SendNUIMessage({type = 'close'})
		SetNuiFocus(false)
	end
	if data.type == 'openinv' then
		TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', data.id)
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	elseif data.type == 'screenshot' then
		TriggerServerEvent('prp-admin:TakeScreenshot', data.id)
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	elseif data.type == 'godmode' and CheckPerms('god') then
		hasGodMode = not hasGodMode
		SetPlayerInvincible(pedId, hasGodMode)
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	elseif data.type == 'spectate' then
		TriggerServerEvent('prp-adminMenu:requestSpectate', data.id)
		TriggerEvent("prp-log:server:CreateLog", "admin", "Spectate", "red", "**"..pname.."** spectated player "..targetName)
	elseif data.type == 'revive' then
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	elseif data.type == 'goto' then 
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	elseif data.type == 'bring' then 
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	elseif data.type == 'freeze' then 
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	elseif data.type == 'slay' then
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	elseif data.type == 'names' then 
		showNames = not showNames
		PRPCore.Functions.Notify('Player names toggled', 'success')
		TriggerServerEvent("prp-log:server:CreateLog", "admin", "Names", "red", "**"..pname.."** toggled player names")
	elseif data.type == 'blips' and CheckPerms('god') then
		showBlips = not showBlips
		PRPCore.Functions.Notify('Player blips toggled', 'success')
		TriggerServerEvent("prp-log:server:CreateLog", "admin", "Blips", "red", "**"..pname.."** toggled player blips")
		toggleBlips()
	elseif data.type == 'menu' then 
		TriggerServerEvent('prp-adminMenu:quick', data.id, data.type)
	end
end)

---------------------
------ EVENTS -------
---------------------
RegisterNetEvent('prp-adminMenu:quick')
AddEventHandler('prp-adminMenu:quick', function(t, target, target_coords)
	if t == 'slay' then 
		SetEntityHealth(PlayerPedId(), 0) 
	end

	if t == 'goto' then 
		SetEntityCoords(PlayerPedId(), target_coords) 
	end

	if t == 'bring' then 
		SetEntityCoords(PlayerPedId(), target_coords) 
	end
end)

RegisterNetEvent('prp-adminMenu:freezePlayer')
AddEventHandler('prp-adminMenu:freezePlayer', function(state)
	local ped_1 = PlayerPedId()
	local ped_2 = PlayerId()
	local frozen_coords = GetEntityCoords(ped_1, false)
	if not state then
		FreezeEntityPosition(ped_1, false)
        SetPlayerInvincible(ped_1, false)
		SetEntityCollision(ped_1, true)
		FrozenState = false
	else
		FreezeEntityPosition(ped_1, true)
		SetEntityVisible(ped_1, true, 0)
		SetPlayerInvincible(ped_2, true)
		SetEntityCollision(ped_1, false)
		SetPlayerInvisibleLocally(ped_1, false)
		FrozenState = true
        while FrozenState do
			Citizen.Wait(0)
			ClearPedTasksImmediately(PlayerPedId())
			SetEntityCoords(PlayerPedId(), frozen_coords)
		end
	end
end)

RegisterNetEvent('prp-adminMenu:requestSpectate')
AddEventHandler('prp-adminMenu:requestSpectate', function(playerServerId, tgtCoords)
    if playerServerId == GetPlayerServerId(PlayerId()) then 
        ExitSpectate(false)
        return 
    else
		if is_spectating then
			ExitSpectate(true)
			spectatePlayer(playerServerId, tgtCoords)
		else
        	old_coords = GetEntityCoords(PlayerPedId())
			spectatePlayer(playerServerId, tgtCoords)
		end
	end
end)

------------------------
------ FUNCTIONS -------
------------------------

function GetBlipData()
    PRPCore.Functions.TriggerCallback('PRPCore:GetPlayersLoopAndNames', function(data)
        GlobalBlipData = {}
        for c, d in ipairs(data) do
			local source = tonumber(d.player)
            table.insert(GlobalBlipData, {
                name = d.name,
                id = source,
                coords = d.coords,
            })
        end
    end)
end

function spectatePlayer(target_source, target_coords)
	local ped = PlayerPedId()
	SetEntityCoords(ped, target_coords.x, target_coords.y, target_coords.z+8, 0, 0, 0, false)
	local target_ped = GetPlayerPed(GetPlayerFromServerId(target_source))
	local timeout = 0 
	SetEntityInvincible(ped, true)
	SetEntityVisible(ped, false, false)
	SetEntityCollision(ped, false, false)
	while (target_ped == ped or target_ped == 0) and timeout <= 500 do 
		Wait(0)
		target_ped = GetPlayerPed(GetPlayerFromServerId(target_source)) 
		timeout=timeout+1 
	end
	
	is_spectating = true
	is_spectating_2 = true

	cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	SetCamActive(cam, true)
	RenderScriptCams(true, false, 0, true, true)
	PointCamAtEntity(cam, target_ped)

	PRPCore.Functions.Notify('Spectating User', 'success')

	while is_spectating_2 do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(target_source)))
		SetEntityCoords(ped, coords.x, coords.y, coords.z+8, 0, 0, 0, false)
		if IsControlPressed(2, 241) then
			radius = radius + 2.0
		end
		if IsControlPressed(2, 242) then
			radius = radius - 2.0
		end
		if radius > -1 then
			radius = -1
		end
		polarAngleDeg = polarAngleDeg + GetDisabledControlNormal(0, 1) * 10
		if polarAngleDeg >= 360 then polarAngleDeg = 0 end
		azimuthAngleDeg = azimuthAngleDeg + GetDisabledControlNormal(0, 2) * 10
		if azimuthAngleDeg >= 360 then azimuthAngleDeg = 0 end
		local nextCamLocation = polar3DToWorld3D(coords, radius, polarAngleDeg, azimuthAngleDeg)
		SetCamCoord(cam, nextCamLocation.x, nextCamLocation.y, nextCamLocation.z)
	end
	can_reset_coords = true
end

function ExitSpectate(still_spectating)
	if not is_spectating then return end
	local ped = PlayerPedId()
	SetEntityInvincible(ped, false)
	SetEntityVisible(ped, true, false)
	SetEntityCollision(ped, true, true)
	SetCamActive(cam, false)
	RenderScriptCams(false, false, 0, true, true)
	cam = nil
	is_spectating = false
	is_spectating_2 = false
	while not can_reset_coords do Wait(0) end
	RequestCollisionAtCoord(old_coords.x, old_coords.y, old_coords.z)
	SetEntityCoords(ped, old_coords.x, old_coords.y, old_coords.z-1, 0, 0, 0, false)
	can_reset_coords = false
	if not still_spectating then
		old_coords = nil
	end
end

function GetPlayersFromCoords()
    local closePlayers = {}
    local coords = GetEntityCoords(PlayerPedId())
    for _, player in pairs(GlobalBlipData) do
		local targetCoords = player.coords
		local targetdistance = #(targetCoords- vector3(coords.x, coords.y, coords.z))
		if targetdistance <= 5.0 then
			table.insert(closePlayers, player)
		end
    end
    return closePlayers
end

function toggleBlips()
	LoadingPlsWaitTY()
	while true do
		wait = 1000
		if has_permissions then
			if showBlips then
				for k, v in pairs(GlobalBlipData) do
					local playerName = v.name
					RemoveBlip(PlayerBlips[k])
					local PlayerBlip = AddBlipForCoord(v.coords)
					SetBlipSprite(PlayerBlip, 1)
					SetBlipColour(PlayerBlip, 0)
					SetBlipScale(PlayerBlip, 0.75)
					SetBlipAsShortRange(PlayerBlip, true)
					BeginTextCommandSetBlipName('STRING')
					AddTextComponentString('['..v.id..'] '..v.name)
					EndTextCommandSetBlipName(PlayerBlip)
					PlayerBlips[k] = PlayerBlip
				end
			else
				wait = 2000
				if next(PlayerBlips) ~= nil then
					for k, v in pairs(PlayerBlips) do
						RemoveBlip(PlayerBlips[k])
					end
					PlayerBlips = {}
				end
			end
		else
			break
		end
		Wait(wait)
	end
end
  
Citizen.CreateThread(function()
	LoadingPlsWaitTY()
    while true do
		if has_permissions then
			if showNames then
				wait = 5
				for c, d in ipairs(GetActivePlayers()) do 
					local coords = GetPedBoneCoords(GetPlayerPed(d), 0x796e)
					if #(GetEntityCoords(PlayerPedId())-coords) < 50 then -- this number will change the distance you see player ID's from
						DrawText3D(coords.x, coords.y, coords.z+0.5, '['..GetPlayerServerId(d)..'] '..GetPlayerName(d))
						--PRPCore.Functions.DrawText3D(coords.x, coords.y, coords.z + 0.5, )
					end
				end
			else
				wait = 1000
			end
		else
			break
		end
        Wait(wait)
    end
end)

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.30, 0.30)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 550
	DrawRect(_x,_y+0.0100, 0.015+ factor, 0.02, 41, 11, 41, 68)
end
  


function LoadingPlsWaitTY()
	while not loaded or #GlobalBlipData == 0 do Wait(500) end
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
		ExitSpectate(false)
    end
end)

function polar3DToWorld3D(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
	local polarAngleRad   = polarAngleDeg   * math.pi / 180.0
	local azimuthAngleRad = azimuthAngleDeg * math.pi / 180.0

	local pos = {
		x = entityPosition.x + radius * (math.sin(azimuthAngleRad) * math.cos(polarAngleRad)),
		y = entityPosition.y - radius * (math.sin(azimuthAngleRad) * math.sin(polarAngleRad)),
		z = entityPosition.z - radius * math.cos(azimuthAngleRad)
	}

	return pos
end

function CheckPerms(perm)
	if perm == 'god' and permission_group == perm then
		return true
	elseif perm == 'admin' and (permission_group == perm or permission_group == 'god') then
		return true
	end
end
