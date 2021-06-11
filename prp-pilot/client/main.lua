PRPCore = nil
local lsiaBlip, sandyBlip, PlayerData, vehiclePlate, currentHangar, importsBlip = nil, nil, nil, nil, nil, nil
local hasjob = false

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = PRPCore.Functions.GetPlayerData()
    if PlayerData.job.name == "pilot" then hasjob = true else hasjob = false end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    if PlayerData.job.name == "pilot" then hasjob = true else hasjob = false end
end)

function _isTrueOriginal()
    local isTrueOriginal = false

    PRPCore.Functions.TriggerCallback("prp-radio:server:GetItem", function(hasItem)
        if hasItem then
            isTrueOriginal = true
        end
    end, Config.TrueOriginals.restrictions.item)

    return isTrueOriginal
end

Citizen.CreateThread(function()
    while true do
        local me = PlayerPedId()
        local coords = GetEntityCoords(me)
        local inVeh = IsPedInAnyVehicle(me)
        local sleep = 3000
        if hasjob then
            sleep = 750
            local distance1 = GetDistanceBetweenCoords(coords, Config.Hangars.LSIA.mainCoords, true)
            if distance1 < 50 then
                sleep = 0
                currentHangar = 'LSIA'
                DrawMarker(33, Config.Hangars.LSIA.mainCoords, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(1.5, 1.5, 1), Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 150, false, true, 2, false, false, false)
                if distance1 < 2.5  then
                    if not inVeh then
                        helpText('Press ~INPUT_CONTEXT~ to open aircraft menu')
                        if IsControlJustReleased(0, 38) then
                            AircraftMenu()
                            Menu.hidden = not Menu.hidden
                        end
                    elseif inVeh then
                        if IsPedInAnyPlane(me) or IsPedInAnyHeli(me) then
                            helpText('Press ~INPUT_CONTEXT~ to store aircraft')
                            if IsControlJustReleased(0, 38) then
                                local veh = GetVehiclePedIsIn(me)
                                SetEntityAsMissionEntity(veh, true, true)
                                DeleteEntity(veh)
                            end
                        end
                    end
                    Menu.renderGUI()
                end
            end

            local distance2 = GetDistanceBetweenCoords(coords, Config.Hangars.sandy.mainCoords, true)
            if distance2 < 50 then
                sleep = 0
                currentHangar = 'Sandy'
                DrawMarker(33, Config.Hangars.sandy.mainCoords, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(1.5, 1.5, 1), Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 150, false, true, 2, false, false, false)
                if distance2 < 2.5 and not inVeh  then
                    helpText('Press ~INPUT_CONTEXT~ to open aircraft menu')
                    if IsControlJustReleased(0, 38) then
                        AircraftMenu()
                        Menu.hidden = not Menu.hidden
                    end
                    Menu.renderGUI()
                end
            end

            local distance3 = GetDistanceBetweenCoords(coords, Config.ContainerCoords, true)
            if distance3 < 1.5 then
                sleep = 0
                DrawText3D(Config.ContainerCoords.x, Config.ContainerCoords.y, Config.ContainerCoords.z, "~g~E~w~ - Container")
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "pilot", Config.Items)
                end
            elseif distance3 < 2.5 then
                sleep = 0
                DrawText3D(Config.ContainerCoords.x, Config.ContainerCoords.y, Config.ContainerCoords.z, "Container")
            end

            local distance4 = GetDistanceBetweenCoords(coords, Config.Hangars.LSIA.stash, false)
            if distance4 < 1.5 then
                sleep = 0
                DrawText3D(Config.Hangars.LSIA.stash.x, Config.Hangars.LSIA.stash.y, Config.Hangars.LSIA.stash.z, "~g~E~w~ - Container")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("inventory:client:SetCurrentStash", "Pilot stash (LSIA)")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Pilot stash (LSIA)", Config.Stashes)
                end
            elseif distance4 < 2.5 then
                sleep = 0
                DrawText3D(Config.Hangars.LSIA.stash.x, Config.Hangars.LSIA.stash.y, Config.Hangars.LSIA.stash.z, "Container")
            end

            local distance5 = GetDistanceBetweenCoords(coords, Config.Hangars.sandy.stash, false)
            if distance5 < 1.5 then
                sleep = 0
                DrawText3D(Config.Hangars.sandy.stash.x, Config.Hangars.sandy.stash.y, Config.Hangars.sandy.stash.z, "~g~E~w~ - Container")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("inventory:client:SetCurrentStash", "Pilot stash (Sandy Shores)")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Pilot stash (Sandy Shores)", Config.Stashes)
                end
            elseif distance5 < 2.5 then
                sleep = 0
                DrawText3D(Config.Hangars.sandy.stash.x, Config.Hangars.sandy.stash.y, Config.Hangars.sandy.stash.z, "Container")
            end

            local distance6 = GetDistanceBetweenCoords(coords, Config.Hangars.sandy.planeSpawnPos, true)
            if distance6 < 50 and inVeh then
                sleep = 0
                DrawMarker(27, Config.Hangars.sandy.planeSpawnPos.x, Config.Hangars.sandy.planeSpawnPos.y, Config.Hangars.sandy.planeSpawnPos.z-0.98, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(1.5, 1.5, 1), Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 150, false, true, 2, false, false, false)
                if distance6 < 3.5 then
                    if IsPedInAnyPlane(me) or IsPedInAnyHeli(me) then
                        helpText('Press ~INPUT_CONTEXT~ to store aircraft')
                        if IsControlJustReleased(0, 38) then
                            local veh = GetVehiclePedIsIn(me)
                            SetEntityAsMissionEntity(veh, true, true)
                            DeleteEntity(veh)
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('prp-pilot:client:UseAviationFuel')
AddEventHandler('prp-pilot:client:UseAviationFuel', function()
    local ped = GetPlayerPed(-1)
    local aircraft = IsPedInAnyHeli(ped) or IsPedInAnyPlane(ped)
    if aircraft then
        local curVeh = GetVehiclePedIsIn(ped, false)
        PRPCore.Functions.Progressbar("reful_aircraft", "Refueling Aircraft..", 20000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            exports['LegacyFuel']:SetFuel(curVeh, 100)
            PRPCore.Functions.Notify('The Aircraft has been refueled', 'success')
            TriggerServerEvent('prp-pilot:server:RemoveItem', 'aviation_fuel', 1)
            TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items['aviation_fuel'], "remove")
        end, function() -- Cancel
            PRPCore.Functions.Notify('Refueling cancelled!', 'error')
        end)
    else
        PRPCore.Functions.Notify('You\'re not in an aircraft!', 'error')
    end
end)

RegisterNetEvent("prp-pilot:client:ShowPilotLicense")
AddEventHandler("prp-pilot:client:ShowPilotLicense", function(sourceId, citizenid, character, coords)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Pilot License:</strong> {4}</div></div>',
            args = {'Pilot License', character.firstname, character.lastname, character.birthdate, character.type}
        })
    end
end)

function AddPilotBlips()
    if not DoesBlipExist(lsiaBlip) then
        lsiaBlip = addBlip(Config.Hangars.LSIA.mainCoords, 359, 3, 'LSIA Hangar')
    end
    if not DoesBlipExist(sandyBlip) then
        sandyBlip = addBlip(Config.Hangars.sandy.mainCoords, 359, 3, 'Sandy Shores Hangar')
    end
    if not DoesBlipExist(importsBlip) then
        importsBlip = addBlip(Config.ContainerCoords, 478, 3, 'Edmund Air Imports')
    end
end

function RemovePilotBlips()
    if DoesBlipExist(lsiaBlip) then
        RemoveBlip(lsiaBlip)
    end
    if DoesBlipExist(sandyBlip) then
        RemoveBlip(sandyBlip)
    end
    if DoesBlipExist(importsBlip) then
        RemoveBlip(importsBlip)
    end
end

function AircraftMenu()
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Planes", "PlaneList", nil)
    Menu.addButton("Helicopters", "HeliList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil)
end

function PlaneList(isDown)
    MenuTitle = "Planes:"
    ClearMenu()
    for k, v in pairs(Config.Aircrafts.Planes) do
        Menu.addButton(GetLabelText(GetDisplayNameFromVehicleModel(v.model)), "TakeOutAircraft", v.model, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
    end
    Menu.addButton("Back", "AircraftMenu",nil)
end

function HeliList(isDown)
MenuTitle = "Helicopters:"
ClearMenu()
for k, v in pairs(Config.Aircrafts.Helicopters) do
    Menu.addButton(GetLabelText(GetDisplayNameFromVehicleModel(v.model)), "TakeOutAircraft", v.model, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
end
Menu.addButton("Back", "AircraftMenu",nil)
end

local spawnPos = nil
function TakeOutAircraft(model)
    PRPCore.Functions.SpawnVehicle(model, function(vehicle)
        platenum = math.random(100, 999)
        SetVehicleNumberPlateText(vehicle, "PILOT"..platenum)
        vehiclePlate = "PILOT"..platenum
        if currentHangar == 'LSIA' then
            if GetVehicleClass(vehicle) == 16 then
                spawnPos = Config.Hangars.LSIA.mainCoords
                SetEntityCoords(vehicle, spawnPos)
                SetEntityHeading(vehicle, Config.Hangars.LSIA.heading)
            elseif GetVehicleClass(vehicle) == 15 then
                spawnPos = Config.Hangars.LSIA.helipadCoords
                SetEntityCoords(vehicle, spawnPos)
                SetEntityHeading(vehicle, 0)
            end
        elseif currentHangar == 'Sandy' then
            if GetVehicleClass(vehicle) == 16 then
                spawnPos = Config.Hangars.sandy.planeSpawnPos
                SetEntityHeading(vehicle, Config.Hangars.sandy.heading)
                SetEntityCoords(vehicle, spawnPos)
            elseif GetVehicleClass(vehicle) == 15 then
                spawnPos = Config.Hangars.sandy.helipadCoords
                SetEntityHeading(vehicle, 0)
                SetEntityCoords(vehicle, spawnPos)
            end
        end
        SetVehicleDirtLevel(vehicle, 1.0)
        SetEntityAsMissionEntity(vehicle, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
        closeMenuFull()
        print(spawnPos)
    end, spawnPos)
    spawnPos = nil
end

function closeMenuFull()
    Menu.hidden = true
    ClearMenu()
end

addBlip = function(coords, sprite, colour, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.55)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    return blip
end

helpText = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

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