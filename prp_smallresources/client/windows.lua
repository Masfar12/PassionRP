RegisterCommand("windowsup", function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    for i = 0, 3 do
        RollUpWindow(vehicle, i)
    end
end)