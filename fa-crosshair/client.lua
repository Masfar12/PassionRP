local crosshair = false
local toggled = true
local prevUpdate = true
Citizen.CreateThread(function()
    while true do
        Wait(100)

        if prevUpdate ~= crosshair then
            if crosshair and toggled then
                SendNUIMessage({
                    display = "crosshairShow",
                })
            else
                SendNUIMessage({
                    display = "crosshairHide",
                })
            end
        end
        prevUpdate = crosshair
    end
end)

--function update()
--    if crosshair then
--        SendNUIMessage({
--            display = "crosshairShow",
--        })
--    else
--        SendNUIMessage({
--            display = "crosshairHide",
--        })
--    end
--end




RegisterCommand('crosshair', function()
    toggled = not toggled
end)

 Citizen.CreateThread(function()
     while true do
         Wait(120)
         if IsPedArmed(PlayerPedId(), 6) then
             local carcam = GetFollowVehicleCamViewMode()
             local cam = GetFollowPedCamViewMode()
             if cam ~= 4 or carcam ~= 4 then
                 if (IsPlayerFreeAiming(PlayerId())) then
                     aiming = true
                     crosshair = true
                     Wait(150)
                 else
                     crosshair = false
                     aiming = false
                     Wait(150)
                 end
             end
         end
     end
 end)


