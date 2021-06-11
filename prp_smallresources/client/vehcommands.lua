RegisterNetEvent("VehCommands:Client:ToggleVehicleExtra")
AddEventHandler("VehCommands:Client:ToggleVehicleExtra", function(extraId)
    local player = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(player, false)

    if veh == nil then
        PRPCore.Functions.Notify("You must be inside a vehicle to use this command.")
        return
    end

    if GetEntitySpeed(veh) > 0 then
        PRPCore.Functions.Notify("You cannot use this command while moving.")
        return
    end

    local extraCount = 0
    for i = 1, 9 do
        if DoesExtraExist(veh, i) then
            extraCount = i
        else
            break
        end
    end

    if extraId > extraCount then
        PRPCore.Functions.Notify("There is no extra for this ID", "error", 5000)
        return
    end

    local isActive = IsVehicleExtraTurnedOn(veh, extraId)

    -- Exit the vehicle for immersion
    TaskLeaveVehicle(player, veh)
    Citizen.Wait(1000)
    TaskTurnPedToFaceEntity(player, veh, 1000)
    Citizen.Wait(1000)
    TriggerEvent("animations:client:EmoteCommandStart", { "mechanic" })

    PRPCore.Functions.Progressbar(
            "toggle_vehicle_extra",
            ("%s vehicle extra"):format(isActive and "Disabling" or "Enabling"),
            10000,
            false,
            true,
            {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            {},
            {},
            {},
            function()
                TriggerEvent("animations:client:EmoteCommandStart", { "c" })
                SetVehicleExtra(veh, extraId, isActive)
            end,
            function()
                TriggerEvent("animations:client:EmoteCommandStart", { "c" })
            end
    )
end)

RegisterNetEvent("VehCommands:Client:WindowUp")
AddEventHandler("VehCommands:Client:WindowUp", function(windowId)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    RollUpWindow(vehicle, windowId)
end)

RegisterNetEvent("VehCommands:Client:WindowDown")
AddEventHandler("VehCommands:Client:WindowDown", function(windowId)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    RollDownWindow(vehicle, windowId)
end)

local function flipVehicle(pVehicle, pPitch, pVRoll, pVYaw)
    SetEntityRotation(pVehicle, pPitch, pVRoll, pVYaw, 1, true)
    Wait(10)
    SetVehicleOnGroundProperly(pVehicle)
end

RegisterNetEvent("vehicle:client:impound")
AddEventHandler("vehicle:client:impound", function(pVehicle)
    PRPCore.Functions.DeleteVehicle(NetToVeh(pVehicle))
end)

RegisterNetEvent("vehicle:client:flip")
AddEventHandler("vehicle:client:flip", function(pVehicle, pPitch, pVRoll, pVYaw)
    flipVehicle(NetToVeh(pVehicle), pPitch, pVRoll, pVYaw)
end)

RegisterNetEvent('FlipVehicle')
AddEventHandler('FlipVehicle', function(pDummy, pEntity)
    local ped = GetPlayerPed(-1)
    local animDict = "missfinale_c2ig_11"
    local animation = "pushcar_offcliff_f"
    if IsPedArmed(ped, 7) then
        SetCurrentPedWeapon(ped, 0xA2719263, true)
    end

    if IsEntityPlayingAnim(ped, animDict, animation, 3) then
        ClearPedSecondaryTask(ped)
    else
        loadAnimDict(animDict)
        local animLength = GetAnimDuration(animDict, animation)
        TaskPlayAnim(PlayerPedId(), animDict, animation, 1.0, 4.0, animLength, 49, 0, 0, 0, 0)
    end
    Wait(100)
    PRPCore.Functions.Progressbar('Flipping vehicle', 'Flipping Vehicle Over', 30000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true, }, {}, {}, {}, function()
    end)
    Wait(30000)
    ClearPedTasks(PlayerPedId())


    local playerped = PlayerPedId()
    local coordA = GetEntityCoords(playerped, 1)
    local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    local pPitch, pRoll, pYaw = GetEntityRotation(playerped)
    local vPitch, vRoll, vYaw = GetEntityRotation(pEntity)
    if targetVehicle ~= 0 then
        if not NetworkHasControlOfEntity(pEntity) then
            local vehicleOwnerId = NetworkGetEntityOwner(pEntity)
            TriggerServerEvent("vehicle:server:flip", GetPlayerServerId(vehicleOwnerId), VehToNet(pEntity), pPitch, vRoll, vYaw)
        else
            flipVehicle(pEntity, pPitch, vRoll, vYaw)
        end
    end

end)
