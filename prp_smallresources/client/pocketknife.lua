PRPCore = nil
Citizen.CreateThread(function()
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(o) PRPCore = o end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("pocketknife:client:slashTyres")
AddEventHandler("pocketknife:client:slashTyres", function()
    local pos = GetEntityCoords(PlayerPedId(-1))
    local closestVehicle = PRPCore.Functions.GetClosestVehicle()

    local animDict = "melee@knife@streamed_core_fps"
    local animName = "ground_attack_on_spot"

    print(closestVehicle)
    if not DoesEntityExist(closestVehicle) then
        return
    end

    local nearestTyre = getNearestVehicleTyre(closestVehicle)
    if nearestTyre == nil or IsVehicleTyreBurst(vehicle, nearestTyre.tyreIndex, 0) then
        return
    end

    PRPCore.Functions.Progressbar("slash_tyres", "Slashing Tyres...", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = animDict,
        anim = animName,
        flags = 1,
    }, {}, {}, function()
        StopAnimTask(GetPlayerPed(-1), animDict, animName, 1.0)
        if #(GetEntityCoords(PlayerPedId(-1)) - GetEntityCoords(closestVehicle)) < 5.0 then
            SetVehicleTyreBurst(closestVehicle, nearestTyre.tyreIndex, false, 100.0)
        end
    end, function()
        StopAnimTask(GetPlayerPed(-1), animDict, animName, 1.0)
        PRPCore.Functions.Notify("Cancelled!", "error")
    end)
end)

function getNearestVehicleTyre(vehicle)
    local wheelIndexes = {
        wheel_lf = 0,
        wheel_rf = 1,
        wheel_lm1 = 2,
        wheel_rm1 = 3,
        wheel_lm2 = 45,
        wheel_rm2 = 47,
        wheel_lm3 = 46,
        wheel_rm3 = 48,
        wheel_lr = 4,
        wheel_rr = 5,
    }

    local player = PlayerPedId(-1)
    local playerPed = GetPlayerPed(player)
    local playerPos = GetEntityCoords(player, false)

    local minDistance = 1.5
    local nearestTyre = nil

    for bone, index in pairs(wheelIndexes) do
        local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, bone))
        local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, bonePos.x, bonePos.y, bonePos.z)

        local checkToOverwrite =
            (nearestTyre == nil and distance <= minDistance) or
            (nearestTyre ~= nil and distance < nearestTyre.boneDistance)

        if checkToOverwrite then
            nearestTyre = {
                bone = bone,
                boneDistance = distance,
                bonePos = bonePos,
                tyreIndex = index,
            }
        end
    end

    return nearestTyre
end