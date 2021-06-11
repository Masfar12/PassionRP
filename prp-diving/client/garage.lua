local CurrentDock = nil
local ClosestDock = nil
local PoliceBlip = nil

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    if PlayerJob.name == "police" then
        if PoliceBlip ~= nil then
            RemoveBlip(PoliceBlip)
        end
        PoliceBlip = AddBlipForCoord(PRPBoatshop.PoliceBoat.x, PRPBoatshop.PoliceBoat.y, PRPBoatshop.PoliceBoat.z)
        SetBlipSprite(PoliceBlip, 410)
        SetBlipDisplay(PoliceBlip, 4)
        SetBlipScale(PoliceBlip, 0.55)
        SetBlipAsShortRange(PoliceBlip, true)
        SetBlipColour(PoliceBlip, 29)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Police Boats")
        EndTextCommandSetBlipName(PoliceBlip)
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(3)
        if isLoggedIn then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerJob.name == "police" then
                local dist = GetDistanceBetweenCoords(pos, PRPBoatshop.PoliceBoat.x, PRPBoatshop.PoliceBoat.y, PRPBoatshop.PoliceBoat.z, true)
                if dist < 10 then
                    DrawMarker(2, PRPBoatshop.PoliceBoat.x, PRPBoatshop.PoliceBoat.y, PRPBoatshop.PoliceBoat.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, PRPBoatshop.PoliceBoat.x, PRPBoatshop.PoliceBoat.y, PRPBoatshop.PoliceBoat.z, true) < 1.5) then
                        PRPCore.Functions.DrawText3D(PRPBoatshop.PoliceBoat.x, PRPBoatshop.PoliceBoat.y, PRPBoatshop.PoliceBoat.z, "~g~E~w~ - Grab Boat")
                        if IsControlJustReleased(0, 38) then
                            local coords = PRPBoatshop.PoliceBoatSpawn
                            PRPCore.Functions.SpawnVehicle("pboat", function(veh)
                                SetVehicleNumberPlateText(veh, "PBOA"..tostring(math.random(1000, 9999)))
                                SetEntityHeading(veh, coords.h)
                                exports['LegacyFuel']:SetFuel(veh, 100.0)
                                TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                SetVehicleEngineOn(veh, true, true)
                            end, coords, true)
                        end
                    end
                else
                    Citizen.Wait(1000)
                end
            else
                Citizen.Wait(3000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(3)
        if isLoggedIn then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerJob.name == "police" then
                local dist = GetDistanceBetweenCoords(pos, PRPBoatshop.PoliceBoat2.x, PRPBoatshop.PoliceBoat2.y, PRPBoatshop.PoliceBoat2.z, true)
                if dist < 10 then
                    DrawMarker(2, PRPBoatshop.PoliceBoat2.x, PRPBoatshop.PoliceBoat2.y, PRPBoatshop.PoliceBoat2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, PRPBoatshop.PoliceBoat2.x, PRPBoatshop.PoliceBoat2.y, PRPBoatshop.PoliceBoat2.z, true) < 1.5) then
                        PRPCore.Functions.DrawText3D(PRPBoatshop.PoliceBoat2.x, PRPBoatshop.PoliceBoat2.y, PRPBoatshop.PoliceBoat2.z, "~g~E~w~ - Grab Boat")
                        if IsControlJustReleased(0, 38) then
                            local coords = PRPBoatshop.PoliceBoatSpawn2
                            PRPCore.Functions.SpawnVehicle("pboat", function(veh)
                                SetVehicleNumberPlateText(veh, "PBOA"..tostring(math.random(1000, 9999)))
                                SetEntityHeading(veh, coords.h)
                                exports['LegacyFuel']:SetFuel(veh, 100.0)
                                TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                SetVehicleEngineOn(veh, true, true)
                            end, coords, true)
                        end
                    end
                else
                    Citizen.Wait(1000)
                end
            else
                Citizen.Wait(3000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        local inRange = false
        local Ped = GetPlayerPed(-1)
        local Pos = GetEntityCoords(Ped)

        for k, v in pairs(PRPBoatshop.Docks) do
            local TakeDistance = GetDistanceBetweenCoords(Pos, v.coords.take.x, v.coords.take.y, v.coords.take.z)

            if TakeDistance < 50 then
                ClosestDock = k
                inRange = true
                PutDistance = GetDistanceBetweenCoords(Pos, v.coords.put.x, v.coords.put.y, v.coords.put.z)

                local inBoat = IsPedInAnyBoat(Ped)

                if inBoat then
                    DrawMarker(35, v.coords.put.x, v.coords.put.y, v.coords.put.z + 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.7, 1.7, 1.7, 255, 55, 15, 255, false, false, false, true, false, false, false)
                    if PutDistance < 2 then
                        if inBoat then
                            DrawText3D(v.coords.put.x, v.coords.put.y, v.coords.put.z, '~g~E~w~ - Store Boat')
                            if IsControlJustPressed(0, 38) then
                                RemoveVehicle()
                            end
                        end
                    end
                end

                if not inBoat then
                    DrawMarker(2, v.coords.take.x, v.coords.take.y, v.coords.take.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.5, -0.30, 15, 255, 55, 255, false, false, false, true, false, false, false)
                    if TakeDistance < 2 then
                        DrawText3D(v.coords.take.x, v.coords.take.y, v.coords.take.z, '~g~E~w~ - Grab Boat')
                        if IsControlJustPressed(1, 177) and not Menu.hidden then
                            CloseMenu()
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            CurrentDock = nil
                        elseif IsControlJustPressed(0, 38) and Menu.hidden then
                            MenuGarage()
                            Menu.hidden = not Menu.hidden
                            CurrentDock = k
                        end
                        Menu.renderGUI()
                    end
                end
            elseif TakeDistance > 51 then
                if ClosestDock ~= nil then
                    ClosestDock = nil
                end
            end
        end

        for k, v in pairs(PRPBoatshop.Depots) do
            local TakeDistance = GetDistanceBetweenCoords(Pos, v.coords.take.x, v.coords.take.y, v.coords.take.z)

            if TakeDistance < 50 then
                ClosestDock = k
                inRange = true
                PutDistance = GetDistanceBetweenCoords(Pos, v.coords.put.x, v.coords.put.y, v.coords.put.z)

                local inBoat = IsPedInAnyBoat(Ped)

                if not inBoat then
                    DrawMarker(2, v.coords.take.x, v.coords.take.y, v.coords.take.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.5, -0.30, 15, 255, 55, 255, false, false, false, true, false, false, false)
                    if TakeDistance < 2 then
                        DrawText3D(v.coords.take.x, v.coords.take.y, v.coords.take.z, '~g~E~w~ - Boat Depot')
                        if IsControlJustPressed(1, 177) and not Menu.hidden then
                            CloseMenu()
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            CurrentDock = nil
                        elseif IsControlJustPressed(0, 38) and Menu.hidden then
                            MenuBoatDepot()
                            Menu.hidden = not Menu.hidden
                            CurrentDock = k
                        end
                        Menu.renderGUI()
                    end
                end
            elseif TakeDistance > 51 then
                if ClosestDock ~= nil then
                    ClosestDock = nil
                end
            end
        end

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(4)
    end
end)

function RemoveVehicle()
    local ped = GetPlayerPed(-1)
    local Boat = IsPedInAnyBoat(ped)

    if Boat then
        local CurVeh = GetVehiclePedIsIn(ped)

        TriggerServerEvent('prp-diving:server:SetBoatState', GetVehicleNumberPlateText(CurVeh), 1, ClosestDock)

        PRPCore.Functions.DeleteVehicle(CurVeh)
        SetEntityCoords(ped, PRPBoatshop.Docks[ClosestDock].coords.take.x, PRPBoatshop.Docks[ClosestDock].coords.take.y, PRPBoatshop.Docks[ClosestDock].coords.take.z)
    end
end

-- Citizen.CreateThread(function()
--     for k, v in pairs(PRPBoatshop.Docks) do
--         DockGarage = AddBlipForCoord(v.coords.put.x, v.coords.put.y, v.coords.put.z)

--         SetBlipSprite (DockGarage, 410)
--         SetBlipDisplay(DockGarage, 4)
--         SetBlipScale  (DockGarage, 0.45)
--         SetBlipAsShortRange(DockGarage, true)
--         SetBlipColour(DockGarage, 3)
    
--         BeginTextCommandSetBlipName("STRING")
--         AddTextComponentSubstringPlayerName(v.label)
--         EndTextCommandSetBlipName(DockGarage)
--     end

--     for k, v in pairs(PRPBoatshop.Depots) do
--         BoatDepot = AddBlipForCoord(v.coords.take.x, v.coords.take.y, v.coords.take.z)

--         SetBlipSprite (BoatDepot, 410)
--         SetBlipDisplay(BoatDepot, 4)
--         SetBlipScale  (BoatDepot, 0.45)
--         SetBlipAsShortRange(BoatDepot, true)
--         SetBlipColour(BoatDepot, 3)
    
--         BeginTextCommandSetBlipName("STRING")
--         AddTextComponentSubstringPlayerName(v.label)
--         EndTextCommandSetBlipName(BoatDepot)
--     end
-- end)

-- MENU JAAAAAAAAAAAAAA

function MenuBoatDepot()
    ClearMenu()
    PRPCore.Functions.TriggerCallback("prp-diving:server:GetDepotBoats", function(result)
        ped = GetPlayerPed(-1);
        MenuTitle = "My Vehicles :"

        if result == nil then
            PRPCore.Functions.Notify("You dont have any vehicles here", "error", 5000)
            CloseMenu()
        else
            Menu.addButton(PRPBoatshop.Depots[CurrentDock].label, "MenuGarage", PRPBoatshop.Depots[CurrentDock].label)

            for k, v in pairs(result) do
                currentFuel = v.fuel
                state = "Boathouse"
                if v.state == 0 then
                    state = "Storage"
                end

                Menu.addButton(PRPBoatshop.ShopBoats[v.model]["label"], "TakeOutDepotBoat", v, state, "Fuel: "..currentFuel.. "%")
            end
        end
            
        Menu.addButton("Back", "MenuGarage", nil)
    end)
end

function VehicleList()
    ClearMenu()
    PRPCore.Functions.TriggerCallback("prp-diving:server:GetMyBoats", function(result)
        ped = GetPlayerPed(-1);
        MenuTitle = "My Vehicles :"

        if result == nil then
            PRPCore.Functions.Notify("You dont have any boats", "error", 5000)
            CloseMenu()
        else
            Menu.addButton(PRPBoatshop.Docks[CurrentDock].label, "MenuGarage", PRPBoatshop.Docks[CurrentDock].label)

            for k, v in pairs(result) do
                currentFuel = v.fuel
                state = "Boathouse"
                if v.state == 0 then
                    state = "From"
                end

                Menu.addButton(PRPBoatshop.ShopBoats[v.model]["label"], "TakeOutVehicle", v, state, "Fuel: "..currentFuel.. "%")
            end
        end
            
        Menu.addButton("Back", "MenuGarage", nil)
    end, CurrentDock)
end

function TakeOutVehicle(vehicle)
    if vehicle.state == 1 then
        PRPCore.Functions.SpawnVehicle(vehicle.model, function(veh)
            SetVehicleNumberPlateText(veh, vehicle.plate)
            SetEntityHeading(veh, PRPBoatshop.Docks[CurrentDock].coords.put.h)
            exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
            PRPCore.Functions.Notify("Boat Eng: Fuel: "..currentFuel.. "%", "primary", 4500)
            CloseMenu()
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
            TriggerServerEvent('prp-diving:server:SetBoatState', GetVehicleNumberPlateText(veh), 0, CurrentDock)
        end, PRPBoatshop.Docks[CurrentDock].coords.put, true)
    else
        PRPCore.Functions.Notify("Boat is not in this dock", "error", 4500)
    end
end

function TakeOutDepotBoat(vehicle)
    PRPCore.Functions.SpawnVehicle(vehicle.model, function(veh)
        SetVehicleNumberPlateText(veh, vehicle.plate)
        SetEntityHeading(veh, PRPBoatshop.Depots[CurrentDock].coords.put.h)
        exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
        PRPCore.Functions.Notify("Boat Eng: Fuel: "..currentFuel.. "%", "primary", 4500)
        CloseMenu()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, PRPBoatshop.Depots[CurrentDock].coords.put, true)
end

function MenuGarage()
    ClearMenu()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    Menu.addButton("My vehicles", "VehicleList", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function CloseMenu()
    Menu.hidden = true
    ClearMenu()
end

function ClearMenu()
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end