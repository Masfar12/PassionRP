local carryingBackInProgress = false
PRPCore = nil
local code = nil
RegisterNetEvent('carry:SendCode')
AddEventHandler('carry:SendCode', function(code1)
	code = code1
end)
local targetcode = nil

RegisterNetEvent('Target:SendCode')
AddEventHandler('Target:SendCode', function(code1)
	targetcode = code1
end)

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
		TriggerServerEvent('carry:getCode')
	end

end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end
	TriggerServerEvent('carry:getCode')
end)


RegisterCommand("carry",function(source, args)
	if not carryingBackInProgress then
		carryingBackInProgress = true
		local player = PlayerPedId()
		TriggerServerEvent('carry:getCode')
		lib = 'missfinale_c2mcs_1'
		anim1 = 'fin_c2_mcs_1_camman'
		lib2 = 'nm'
		anim2 = 'firemans_carry'
		distans = 0.15
		distans2 = 0.27
		height = 0.63
		spin = 0.0		
		length = 100000
		controlFlagMe = 50
		controlFlagTarget = 33
		animFlagTarget = 1

		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		if closestPlayer ~= nil then
			print("triggering cmg2_animations:sync")
			if code ~= nil then
				TriggerServerEvent('cmg2_animations:sync',code, closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
			end
		else
			print("[CMG Anim] No player nearby")
		end
	else
		carryingBackInProgress = false
		ClearPedSecondaryTask(GetPlayerPed(-1))
		DetachEntity(GetPlayerPed(-1), true, false)
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		TriggerServerEvent("cmg2_animations:stop",target)
	end
end,false)

RegisterNetEvent('cmg2_animations:startcarry')
AddEventHandler('cmg2_animations:startcarry',function(code1,targetPlayer)
	print("triggered")
	if code1 == targetcode then end
	if not carryingBackInProgress then
		carryingBackInProgress = true
		local player = PlayerPedId()
		lib = 'missfinale_c2mcs_1'
		anim1 = 'fin_c2_mcs_1_camman'
		lib2 = 'nm'
		anim2 = 'firemans_carry'
		distans = 0.15
		distans2 = 0.27
		height = 0.63
		spin = 0.0
		length = 100000
		controlFlagMe = 50
		controlFlagTarget = 33
		animFlagTarget = 1

		target = GetPlayerFromServerId(targetPlayer)
		print(targetPlayer)
		if targetPlayer ~= nil then
			print("triggering cmg2_animations:sync")
			if code ~= nil then
				print(code)
				TriggerServerEvent('cmg2_animations:sync',code, target, lib,lib2, anim1, anim2, distans, distans2, height,targetPlayer,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
			end
		else
			print("[CMG Anim] No player nearby")
		end
	else
		carryingBackInProgress = false
		ClearPedSecondaryTask(GetPlayerPed(-1))
		DetachEntity(GetPlayerPed(-1), true, false)
		TriggerServerEvent("cmg2_animations:stop",targetPlayer)
	end
end)

RegisterNetEvent('cmg2_animations:syncTarget')
AddEventHandler('cmg2_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	print("triggered cmg2_animations:syncTarget")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMe')
AddEventHandler('cmg2_animations:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	print("triggered cmg2_animations:syncMe")
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	Citizen.Wait(length)
end)

RegisterNetEvent('cmg2_animations:cl_stop')
AddEventHandler('cmg2_animations:cl_stop', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)

function GetClosestPlayer()
    local closestPlayers = PRPCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end