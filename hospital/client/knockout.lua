local knockedOut = false
local wait = 5
local count = 35

Citizen.CreateThread(function()
    while true do
        local sleep = 750
        local myPed = GetPlayerPed(-1)
        if IsPedInMeleeCombat(myPed) and IsPedOnFoot(myPed) then
            sleep = 50
            if GetEntityHealth(myPed) < 115 then
                sleep = 1
                SetPlayerInvincible(PlayerId(), true)
                SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                PRPCore.Functions.Notify("You are knocked out")
                wait = 15
                knockedOut = true
                SetEntityHealth(myPed, 101)
            end
        end
        if knockedOut == true then
            sleep = 1
            SetPlayerInvincible(PlayerId(), true)
            DisablePlayerFiring(PlayerId(), true)
            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
            ResetPedRagdollTimer(myPed)
            
            if wait >= 0 then
                count = count - 1
                if count == 0 then
                    count = 35
                    wait = wait - 1
                    SetEntityHealth(myPed, GetEntityHealth(myPed)+1)
                end
            else
                SetPlayerInvincible(PlayerId(), false)
                knockedOut = false
            end
        end
        Wait(sleep)
    end
end)