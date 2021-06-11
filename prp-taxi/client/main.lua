PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

local isLoggedIn = false
local PlayerData = {}

local meterIsOpen = false

local meterActive = false
local currentTaxi = nil

local lastLocation = nil

local meterData = {
    fareAmount = 20,
    currentFare = 0,
    distanceTraveled = 0,
}

local dutyPlate = nil

local NpcData = {
    Active = false,
    CurrentNpc = nil,
    LastNpc = nil,
    CurrentDeliver = nil,
    LastDeliver = nil,
    Npc = nil,
    NpcBlip = nil,
    DeliveryBlip = nil,
    NpcTaken = false,
    NpcDelivered = false,
    CountDown = true
}

RegisterNetEvent('prp-taxi:client:DoTaxiNpc')
AddEventHandler('prp-taxi:client:DoTaxiNpc', function()
    if whitelistedVehicle() then
        if NpcData.CountDown then
            if not NpcData.Active then
                NpcData.CurrentNpc = math.random(1, #Config.NPCLocations.TakeLocations)
                if NpcData.LastNpc ~= nil then
                    while NpcData.LastNpc ~= NpcData.CurrentNpc do
                        NpcData.CurrentNpc = math.random(1, #Config.NPCLocations.TakeLocations)
                    end
                end

                local Gender = math.random(1, #Config.NpcSkins)
                local PedSkin = math.random(1, #Config.NpcSkins[Gender])
                local model = GetHashKey(Config.NpcSkins[Gender][PedSkin])
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Citizen.Wait(0)
                end
                NpcData.Npc = CreatePed(3, model, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z - 0.98, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].h, false, true)
                PlaceObjectOnGroundProperly(NpcData.Npc)
                FreezeEntityPosition(NpcData.Npc, true)
                if NpcData.NpcBlip ~= nil then
                    RemoveBlip(NpcData.NpcBlip)
                end
                PRPCore.Functions.Notify('You received the customers position on your GPS', 'success')
                NpcData.NpcBlip = AddBlipForCoord(Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z)
                SetBlipColour(NpcData.NpcBlip, 3)
                SetBlipRoute(NpcData.NpcBlip, true)
                SetBlipRouteColour(NpcData.NpcBlip, 3)
                NpcData.LastNpc = NpcData.CurrentNpc
                NpcData.Active = true

                Citizen.CreateThread(function()
                    while not NpcData.NpcTaken do

                        local ped = GetPlayerPed(-1)
                        local pos = GetEntityCoords(ped)
                        local dist = GetDistanceBetweenCoords(pos, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z, true)

                        if dist < 20 then
                            DrawMarker(2, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                        
                            if dist < 5 then
                                local npccoords = GetEntityCoords(NpcData.Npc)
                                DrawText3D(Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z, '[E] Pick up')
                                if IsControlJustPressed(0, 38) then
                                    local veh = GetVehiclePedIsIn(ped, 0)
                                    local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

                                    for i=maxSeats - 1, 0, -1 do
                                        if IsVehicleSeatFree(vehicle, i) then
                                            freeSeat = i
                                            break
                                        end
                                    end

                                    meterIsOpen = true
                                    meterActive = true
                                    lastLocation = GetEntityCoords(GetPlayerPed(-1))
                                    SendNUIMessage({
                                        action = "openMeter",
                                        toggle = true,
                                        meterData = Config.Meter
                                    })
                                    SendNUIMessage({
                                        action = "toggleMeter"
                                    })

                                    ClearPedTasksImmediately(NpcData.Npc)
                                    FreezeEntityPosition(NpcData.Npc, false)
                                    TaskEnterVehicle(NpcData.Npc, veh, -1, freeSeat, 1.0, 0)
                                    PRPCore.Functions.Notify('Take the customer to his destination.')
                                    if NpcData.NpcBlip ~= nil then
                                        RemoveBlip(NpcData.NpcBlip)
                                    end
                                    GetDeliveryLocation()
                                    NpcData.NpcTaken = true
                                end
                            end
                        end
                        Citizen.Wait(1)
                    end
                end)
            else
                PRPCore.Functions.Notify('You already have a customer to take care of..')
            end
        else
            PRPCore.Functions.Notify('No customers available..')
        end
    else
        PRPCore.Functions.Notify('You are not in a marked yellow cab :(')
    end
end)

function GetDeliveryLocation()
    NpcData.CurrentDeliver = math.random(1, #Config.NPCLocations.DeliverLocations)
    if NpcData.LastDeliver ~= nil then
        while NpcData.LastDeliver ~= NpcData.CurrentDeliver do
            NpcData.CurrentDeliver = math.random(1, #Config.NPCLocations.DeliverLocations)
        end
    end

    if NpcData.DeliveryBlip ~= nil then
        RemoveBlip(NpcData.DeliveryBlip)
    end
    NpcData.DeliveryBlip = AddBlipForCoord(Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].x, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].y, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].z)
    SetBlipColour(NpcData.DeliveryBlip, 3)
    SetBlipRoute(NpcData.DeliveryBlip, true)
    SetBlipRouteColour(NpcData.DeliveryBlip, 3)
    NpcData.LastDeliver = NpcData.CurrentDeliver

    Citizen.CreateThread(function()
        while true do

            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local dist = GetDistanceBetweenCoords(pos, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].x, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].y, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].z, true)

            if dist < 20 then
                DrawMarker(2, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].x, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].y, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            
                if dist < 5 then
                    local npccoords = GetEntityCoords(NpcData.Npc)
                    DrawText3D(Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].x, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].y, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].z, '[E] Deliver Customer')
                    if IsControlJustPressed(0, 38) then
                        local veh = GetVehiclePedIsIn(ped, 0)
                        TaskLeaveVehicle(NpcData.Npc, veh, 0)
                        SetEntityAsMissionEntity(NpcData.Npc, false, true)
                        SetEntityAsNoLongerNeeded(NpcData.Npc)
                        local targetCoords = Config.NPCLocations.TakeLocations[NpcData.LastNpc]
                        TaskGoStraightToCoord(NpcData.Npc, targetCoords.x, targetCoords.y, targetCoords.z, 1.0, -1, 0.0, 0.0)
                        SendNUIMessage({
                            action = "toggleMeter"
                        })
                        TriggerServerEvent('prp-taxi:server:NpcPay', meterData.currentFare)
                        PRPCore.Functions.Notify('Trip completed!', 'success')
                        -- TriggerServerEvent('prp-hud:Server:GainStress', math.random(3, 5))
                        if NpcData.DeliveryBlip ~= nil then
                            RemoveBlip(NpcData.DeliveryBlip)
                        end
                        local RemovePed = function(ped)
                            Citizen.SetTimeout(60000, function()
                                DeletePed(ped)
                            end)
                        end
                        NpcData.CountDown = false
                        Citizen.SetTimeout(120000, function()
                            NpcData.CountDown = true
                        end)
                        RemovePed(NpcData.Npc)
                        ResetNpcTask()
                        break
                    end
                end
            end

            Citizen.Wait(1)
        end
    end)
end

function ResetNpcTask()
    NpcData = {
        Active = false,
        CurrentNpc = nil,
        LastNpc = nil,
        CurrentDeliver = nil,
        LastDeliver = nil,
        Npc = nil,
        NpcBlip = nil,
        DeliveryBlip = nil,
        NpcTaken = false,
        NpcDelivered = false,
    }
end

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = PRPCore.Functions.GetPlayerData()
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    isLoggedIn = true
    PlayerData.job = JobInfo
end)

Citizen.CreateThread(function()
    while true do
        local wait = calculateFareAmount()

        if wait then
            Citizen.Wait(2000)
        else
            Citizen.Wait(250)
        end
        
    end
end)

local lastFlare = nil

function calculateFareAmount()
    if meterIsOpen and meterActive then
        start = lastLocation
  
        if start then
            current = GetEntityCoords(PlayerPedId())
            distance = CalculateTravelDistanceBetweenPoints(start, current)
            if distance >= 100000.0 then return true; end
            meterData['distanceTraveled'] = distance
    
            fareAmount = (meterData['distanceTraveled'] / 400.00) * meterData['fareAmount']
    
            meterData['currentFare'] = math.ceil(fareAmount)
            if meterData['currentFare'] > 350 then
                meterData['currentFare'] = lastFlare
            end

            SendNUIMessage({
                action = "updateMeter",
                meterData = meterData
            })

            lastFlare = meterData['currentFare']
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn then
            if PlayerData.job.name == "taxi" then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                if (GetDistanceBetweenCoords(pos, Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, true) < 8) then
                    if (GetDistanceBetweenCoords(pos, Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, true) < 1.5) then
                        if not PlayerData.job.onduty then
                            DrawText3D(Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, "~g~E~w~ - Go on duty")
                        else
                            DrawText3D(Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, "~r~E~w~ - Go off duty")
                        end
                        if IsControlJustReleased(0, 38) then
                            PlayerData.job.onduty = not PlayerData.job.onduty
                            TriggerServerEvent("PRPCore:ToggleDuty")
                        end
                    else
                        DrawText3D(Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, "On/Off Duty")
                    end
                else
                    Citizen.Wait(1000)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        inRange = false

        if PRPCore ~= nil then
            if isLoggedIn then

                if PlayerData.job.name == "taxi" and PlayerData.job.onduty then
                    local ped = GetPlayerPed(-1)
                    local pos = GetEntityCoords(ped)

                    local vehDist = GetDistanceBetweenCoords(pos, Config.Locations["vehicle"]["x"], Config.Locations["vehicle"]["y"], Config.Locations["vehicle"]["z"])
                    local vehDist2 = GetDistanceBetweenCoords(pos, Config.Locations["vehicle1"]["x"], Config.Locations["vehicle1"]["y"], Config.Locations["vehicle1"]["z"])

                    if vehDist < 20 then
                        inRange = true

                        DrawMarker(2, Config.Locations["vehicle"]["x"], Config.Locations["vehicle"]["y"], Config.Locations["vehicle"]["z"], 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.3, 0.5, 0.2, 200, 0, 0, 222, false, false, false, true, false, false, false)

                        if vehDist < 1.5 then
                            if whitelistedVehicle() then
                                DrawText3D(Config.Locations["vehicle"]["x"], Config.Locations["vehicle"]["y"], Config.Locations["vehicle"]["z"] + 0.3, '[E] Store')
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                    end
                                end
                            else
                                DrawText3D(Config.Locations["vehicle"]["x"], Config.Locations["vehicle"]["y"], Config.Locations["vehicle"]["z"] + 0.3, '[E] Vehicles')
                                if IsControlJustReleased(0, 38) then
                                    TaxiGarage("vehicle")
                                    Menu.hidden = not Menu.hidden
                                end
                            end
                            Menu.renderGUI()
                        end
                    end

                    if vehDist2 < 20 then
                        inRange = true

                        DrawMarker(2, Config.Locations["vehicle1"]["x"], Config.Locations["vehicle1"]["y"], Config.Locations["vehicle1"]["z"], 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.3, 0.5, 0.2, 200, 0, 0, 222, false, false, false, true, false, false, false)

                        if vehDist2 < 1.5 then
                            if whitelistedVehicle() then
                                DrawText3D(Config.Locations["vehicle1"]["x"], Config.Locations["vehicle1"]["y"], Config.Locations["vehicle1"]["z"] + 0.3, '[E] Store')
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                    end
                                end
                            else
                                DrawText3D(Config.Locations["vehicle1"]["x"], Config.Locations["vehicle1"]["y"], Config.Locations["vehicle1"]["z"] + 0.3, '[E] Vehicles')
                                if IsControlJustReleased(0, 38) then
                                    TaxiGarage("vehicle1")
                                    Menu.hidden = not Menu.hidden
                                end
                            end
                            Menu.renderGUI()
                        end
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(3000)
        end

        Citizen.Wait(3)
    end
end)

RegisterNetEvent('prp-taxi:client:toggleMeter')
AddEventHandler('prp-taxi:client:toggleMeter', function()
    local ped = GetPlayerPed(-1)
    
    if IsPedInAnyVehicle(ped, false) then
        if whitelistedVehicle() then
            if not meterIsOpen then
                SendNUIMessage({
                    action = "openMeter",
                    toggle = true,
                    meterData = Config.Meter
                })
                meterIsOpen = true
            else
                SendNUIMessage({
                    action = "openMeter",
                    toggle = false
                })
                meterIsOpen = false
            end
        else
            PRPCore.Functions.Notify('This vehicle is not equipped with a meter..', 'error')
        end
    else
        PRPCore.Functions.Notify('Youre not in a vehicle.', 'error')
    end
end)

RegisterNetEvent('prp-taxi:client:enableMeter')
AddEventHandler('prp-taxi:client:enableMeter', function()
    local ped = GetPlayerPed(-1)

    if meterIsOpen then
        SendNUIMessage({
            action = "toggleMeter"
        })
    else
        PRPCore.Functions.Notify('The meter isnt on..', 'error')
    end
end)

RegisterNUICallback('enableMeter', function(data)
    meterActive = data.enabled

    if not data.enabled then
        SendNUIMessage({
            action = "resetMeter"
        })
    end
    lastLocation = GetEntityCoords(GetPlayerPed(-1))
end)

RegisterNetEvent('prp-taxi:client:toggleMuis')
AddEventHandler('prp-taxi:client:toggleMuis', function()
    Citizen.Wait(400)
    if meterIsOpen then
        if not mouseActive then
            SetNuiFocus(true, true)
            mouseActive = true
        end
    else
        PRPCore.Functions.Notify('Theres no meter..', 'error')
    end
end)

RegisterNUICallback('hideMouse', function()
    SetNuiFocus(false, false)
    mouseActive = false
end)

function whitelistedVehicle()
    local ped = GetPlayerPed(-1)
    local veh = GetEntityModel(GetVehiclePedIsIn(ped))
    local retval = false

    for i = 1, #Config.AllowedVehicles, 1 do
        if veh == GetHashKey(Config.AllowedVehicles[i].model) then
            retval = true
        end
    end
    return retval
end

function TaxiGarage(garage)
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "VehicleList", garage)
    Menu.addButton("Close", "closeMenuFull", nil) 
end

function VehicleList(garage)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicles:"
    ClearMenu()
    for k, v in pairs(Config.AllowedVehicles) do
        Menu.addButton(Config.AllowedVehicles[k].label, "TakeVehicle", {k,garage}, "Garage", " Motor: 100%", " Body: 100%", " Gas: 100%")
    end
        
    Menu.addButton("Return", "TaxiGarage",garage)
end

function TakeVehicle(data)
    local k = data[1]
    local garage = data[2]
    local coords = {x = Config.Locations[garage]["x"], y = Config.Locations[garage]["y"], z = Config.Locations[garage]["z"]}
    PRPCore.Functions.SpawnVehicle(Config.AllowedVehicles[k].model, function(veh)
        SetVehicleNumberPlateText(veh, "TAXI"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, Config.Locations[garage]["h"])
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh),"taxi")
        SetVehicleEngineOn(veh, true, true)
        dutyPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

RegisterNetEvent('prp-taxi:client:SendTaxiMessage')
AddEventHandler('prp-taxi:client:SendTaxiMessage', function(message)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    
    TriggerServerEvent("prp-taxi:server:SendTaxiMessage", coords, message)
    TriggerEvent("police:client:CallAnim")
end)

RegisterNetEvent('prp-taxi:client:SendTaxiMessageCheck')
AddEventHandler('prp-taxi:client:SendTaxiMessageCheck', function(MainPlayer, message, coords)
    local PlayerData = PRPCore.Functions.GetPlayerData()

    if (PlayerData.job.name == "taxi") and PlayerData.job.onduty then
        TriggerEvent('chatMessage', "Taxi CALL - " .. MainPlayer.PlayerData.charinfo.firstname .. " " .. MainPlayer.PlayerData.charinfo.lastname .. " ("..MainPlayer.PlayerData.source..")", "warning", message)
        TriggerEvent("police:client:EmergencySound")
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 0.9)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Taxi request CALL")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
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

Citizen.CreateThread(function()
    TaxiBlip = AddBlipForCoord(Config.Locations["vehicle"]["x"], Config.Locations["vehicle"]["y"], Config.Locations["vehicle"]["z"])

    SetBlipSprite (TaxiBlip, 198)
    SetBlipDisplay(TaxiBlip, 4)
    SetBlipScale  (TaxiBlip, 0.8)
    SetBlipAsShortRange(TaxiBlip, true)
    SetBlipColour(TaxiBlip, 5)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Downtown Taxis")
    EndTextCommandSetBlipName(TaxiBlip)
end)