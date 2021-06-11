---------- CONFIG
local speed = 20.0
local autopilotActive = false
local Keys = {
    ["ESC"] = 322, ["BACKSPACE"] = 177, ["W"] = 32, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["LEFTSHIFT"] = 21, ["SPACE"] = 22
}

RegisterNetEvent("prp-autodrive:start")
AddEventHandler("prp-autodrive:start", function()
    local player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player,false)
    print(vehicle)
    if not autopilotActive and vehicle then
        autopilotActive = true
        TaskVehicleDriveWander(GetPlayerPed(-1), vehicle, speed, 786603)
        print("y")
        PRPCore.Functions.Notify("Autodrive On", "primary")
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player,false)
        if vehicle ~= 0 and not autopilotActive then
            if (IsDisabledControlPressed(0,36) and IsDisabledControlJustPressed(0,22)) then
                TriggerServerEvent('prp-autodrive:start')
            end
        end
        if not vehicle then
            Citizen.Wait(2000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if autopilotActive then
            for k,v in pairs(Keys) do
                if (IsControlPressed(0,v)) then
                    autopilotActive = false
                    ClearPedTasks(GetPlayerPed(-1))
                    PRPCore.Functions.Notify("Autodrive Off", "primary")
                    break
                end
            end
        end
        if not autopilotActive then
            Citizen.Wait(2000)
        end
    end
end)
