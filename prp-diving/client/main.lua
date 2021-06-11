Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

PRPCore = nil
isLoggedIn = false
PlayerJob = {}

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent("PRPCore:Client:OnPlayerLoaded")
AddEventHandler("PRPCore:Client:OnPlayerLoaded", function()

    Citizen.Wait(math.random(30000, 50000))
    PRPCore.Functions.TriggerCallback('prp-diving:server:GetBusyDocks', function(Docks)
        PRPBoatshop.Locations["berths"] = Docks
    end)

    PRPCore.Functions.TriggerCallback('prp-diving:server:GetDivingConfig', function(Config, Area)
        PRPDiving.Locations = Config
        TriggerEvent('prp-diving:client:SetDivingLocation', Area)
    end)

    PlayerJob = PRPCore.Functions.GetPlayerData().job

    isLoggedIn = true

    if PlayerJob.name == "police" then
        if PoliceBlip ~= nil then
            RemoveBlip(PoliceBlip)
        end
        PoliceBlip = AddBlipForCoord(PRPBoatshop.PoliceBoat.x, PRPBoatshop.PoliceBoat.y, PRPBoatshop.PoliceBoat.z)
        SetBlipSprite(PoliceBlip, 410)
        SetBlipDisplay(PoliceBlip, 4)
        SetBlipScale(PoliceBlip, 0.8)
        SetBlipAsShortRange(PoliceBlip, true)
        SetBlipColour(PoliceBlip, 29)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Police Boat")
        EndTextCommandSetBlipName(PoliceBlip)
        PoliceBlip = AddBlipForCoord(PRPBoatshop.PoliceBoat2.x, PRPBoatshop.PoliceBoat2.y, PRPBoatshop.PoliceBoat2.z)
        SetBlipSprite(PoliceBlip, 410)
        SetBlipDisplay(PoliceBlip, 4)
        SetBlipScale(PoliceBlip, 0.8)
        SetBlipAsShortRange(PoliceBlip, true)
        SetBlipColour(PoliceBlip, 29)
    
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Police Boat")
        EndTextCommandSetBlipName(PoliceBlip)
    end
end)

-- Code

DrawText3D = function(x, y, z, text)
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

RegisterNetEvent('prp-diving:client:UseJerrycan')
AddEventHandler('prp-diving:client:UseJerrycan', function()
    local ped = GetPlayerPed(-1)
    local boat = IsPedInAnyVehicle(ped)
    if boat then
        local curVeh = GetVehiclePedIsIn(ped, false)
        PRPCore.Functions.Progressbar("reful_boat", "Refueling Vehicle..", 20000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            exports['LegacyFuel']:SetFuel(curVeh, 100)
            PRPCore.Functions.Notify('The vehicle has been refueled', 'success')
            TriggerServerEvent('prp-diving:server:RemoveItem', 'jerry_can', 1)
            TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items['jerry_can'], "remove")
        end, function() -- Cancel
            PRPCore.Functions.Notify('Refueling cancelled!', 'error')
        end)
    else
        PRPCore.Functions.Notify('Youre not in a vehicle', 'error')
    end
end)