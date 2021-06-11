local crouched = false

CreateThread(function()
    while true do
        Wait(1)
        if (DoesEntityExist(PlayerPedId()) and not IsEntityDead(PlayerPedId())) then
            DisableControlAction(0, 36, true)

            if (not IsPauseMenuActive()) then
                if (IsDisabledControlJustPressed(0, 36)) then
                    RequestAnimSet("move_ped_crouched")

                    while (not HasAnimSetLoaded("move_ped_crouched")) do
                        Wait(100)
                    end

                    if (crouched == true) then
                        ResetPedMovementClipset(PlayerPedId(), 0)
                        crouched = false
                    elseif (crouched == false) then
                        SetPedMovementClipset(PlayerPedId(), "move_ped_crouched", 0.25)
                        crouched = true
                    end
                end
            end
        end
    end
end)

local walkSet = "default"
RegisterNetEvent("crouchprone:client:SetWalkSet")
AddEventHandler("crouchprone:client:SetWalkSet", function(clipset)
    walkSet = clipset
end)


function ResetAnimSet()
    if walkSet == "default" then
        ResetPedMovementClipset(GetPlayerPed(-1))
        ResetPedWeaponMovementClipset(GetPlayerPed(-1))
        ResetPedStrafeClipset(GetPlayerPed(-1))
    else
        ResetPedMovementClipset(GetPlayerPed(-1))
        ResetPedWeaponMovementClipset(GetPlayerPed(-1))
        ResetPedStrafeClipset(GetPlayerPed(-1))
        Citizen.Wait(100)
        RequestWalking(walkSet)
        SetPedMovementClipset(PlayerPedId(), walkSet, 1)
        RemoveAnimSet(walkSet)
    end
end

function RequestWalking(set)
    RequestAnimSet(set)
    while not HasAnimSetLoaded(set) do
        Citizen.Wait(1)
    end
end