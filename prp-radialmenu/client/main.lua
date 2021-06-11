PRPCore = nil

Citizen.CreateThread(function()
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterKeyMapping("radialMenu", "Radial Menu", "keyboard", "F1") --Removed Bind System and added standalone version
RegisterCommand('radialMenu', function()
    if IsPauseMenuActive() then return end
    openRadial(true)
    SetCursorLocation(0.5, 0.5)
end, false)

--TriggerEvent("chat:removeSuggestion", "/radialMenu") -- enables people to add it to a bindable key

local inRadialMenu = false

function setupSubItems()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["isdead"] then
            if PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" then
                Config.MenuItems[4].items = {
                    [1] = {
                        id    = 'emergencybutton2',
                        title = 'Panic',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:SendPoliceEmergencyAlert',
                        shouldClose = true,
                    },
                }
            end
        else
            if Config.JobInteractions[PlayerData.job.name] ~= nil and next(Config.JobInteractions[PlayerData.job.name]) ~= nil then
                Config.MenuItems[4].items = Config.JobInteractions[PlayerData.job.name]
            else 
                Config.MenuItems[4].items = {}
            end
        end
    end)

    local Vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))

    if Vehicle ~= nil or Vehicle ~= 0 then
        local AmountOfSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Vehicle))

        if AmountOfSeats == 2 then
            Config.MenuItems[3].items[2].items = {
                [1] = {
                    id    = -1,
                    title = 'Driver Seat',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
                [2] = {
                    id    = 0,
                    title = 'Passenger Seat',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
            }
        elseif AmountOfSeats == 3 then
            Config.MenuItems[3].items[2].items = {
                [4] = {
                    id    = -1,
                    title = 'Driver Seat',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
                [1] = {
                    id    = 0,
                    title = 'Passenger Seat',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
                [3] = {
                    id    = 1,
                    title = 'Others',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
            }
        elseif AmountOfSeats == 4 then
            Config.MenuItems[3].items[2].items = {
                [4] = {
                    id    = -1,
                    title = 'Driver Seat',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
                [1] = {
                    id    = 0,
                    title = 'Passenger Seat',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
                [3] = {
                    id    = 1,
                    title = 'Left Back Seat',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
                [2] = {
                    id    = 2,
                    title = 'Right Back Seat',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'prp-radialmenu:client:ChangeSeat',
                    shouldClose = true,
                },
            }
        end
    end
end

function openRadial(bool)    
    setupSubItems()

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = Config.MenuItems
    })
    inRadialMenu = bool
end

function closeRadial(bool)    
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

function getNearestVeh()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end




RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)


RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData
    if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData)
        --print('yeey')
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    end
end)

RegisterNetEvent('prp-radialmenu:client:noPlayers')
AddEventHandler('prp-radialmenu:client:noPlayers', function(data)
    PRPCore.Functions.Notify('There are no players nearby', 'error', 2500)
end)

RegisterNetEvent('prp-radialmenu:client:giveidkaart')
AddEventHandler('prp-radialmenu:client:giveidkaart', function(data)
 --   print('Ik ben een getriggered event :)')
end)

RegisterNetEvent('prp-radialmenu:client:openDoor')
AddEventHandler('prp-radialmenu:client:openDoor', function(data)
    local string = data.id
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
    local ped = GetPlayerPed(-1)
    local closestVehicle = nil

    if IsPedInAnyVehicle(ped, false) then
        closestVehicle = GetVehiclePedIsIn(ped)
    else
        closestVehicle = getNearestVeh()
    end

    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local plate = GetVehicleNumberPlateText(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('prp-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('prp-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        PRPCore.Functions.Notify('No vehicle nearby...', 'error', 2500)
    end
end)

RegisterNetEvent('prp-radialmenu:client:setExtra')
AddEventHandler('prp-radialmenu:client:setExtra', function(data)
    local string = data.id
    local replace = string:gsub("extra", "")
    local extra = tonumber(replace)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped)
    local enginehealth = 1000.0
    local bodydamage = 1000.0

    if veh ~= nil then
        local plate = GetVehicleNumberPlateText(closestVehicle)
    
        if GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
            if DoesExtraExist(veh, extra) then 
                if IsVehicleExtraTurnedOn(veh, extra) then
                    enginehealth = GetVehicleEngineHealth(veh)
                    bodydamage = GetVehicleBodyHealth(veh)
                    SetVehicleExtra(veh, extra, 1)
                    SetVehicleEngineHealth(veh, enginehealth)
                    SetVehicleBodyHealth(veh, bodydamage)
                    TriggerServerEvent("lscustoms:server:SaveVehicleProps", PRPCore.Functions.GetVehicleProperties(veh))
                    PRPCore.Functions.Notify('Extra ' .. extra .. ' switched off', 'error', 2500)
                else
                    enginehealth = GetVehicleEngineHealth(veh)
                    bodydamage = GetVehicleBodyHealth(veh)
                    SetVehicleExtra(veh, extra, 0)
                    SetVehicleEngineHealth(veh, enginehealth)
                    SetVehicleBodyHealth(veh, bodydamage)
                    TriggerServerEvent("lscustoms:server:SaveVehicleProps", PRPCore.Functions.GetVehicleProperties(veh))
                    PRPCore.Functions.Notify('Extra ' .. extra .. ' Activated', 'success', 2500)
                end    
            else
                PRPCore.Functions.Notify('Extra ' .. extra .. ' Is not available on this vehicle', 'error', 2500)
            end
        else
            PRPCore.Functions.Notify('You must be the driver of the vehicle to make changes', 'error', 2500)
        end
    end
end)

RegisterNetEvent('prp-radialmenu:trunk:client:Door')
AddEventHandler('prp-radialmenu:trunk:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))

    if veh ~= 0 then
        local pl = GetVehicleNumberPlateText(veh)

        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

local Seats = {
    ["-1"] = "Driver Seat",
    ["0"] = "Passenger Seat",
    ["1"] = "Left Back Seat",
    ["2"] = "Right Back Seat",
}

RegisterNetEvent('prp-radialmenu:client:ChangeSeat')
AddEventHandler('prp-radialmenu:client:ChangeSeat', function(data)
    local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local IsSeatFree = IsVehicleSeatFree(Veh, data.id)
    local speed = GetEntitySpeed(Veh)
    local HasHarnass = exports['prp_smallresources']:HasHarness()
    if not HasHarnass then
        local kmh = (speed * 3.6);  

        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(GetPlayerPed(-1), Veh, data.id)
                PRPCore.Functions.Notify('Swapped seats to '..data.title..'!')
            else
                PRPCore.Functions.Notify('Vehicle is moving too fast..')
            end
        else
            PRPCore.Functions.Notify('Seat is not available..')
        end
    else
        PRPCore.Functions.Notify('You can not switch seats with a Racing Harness..', 'error')
    end
end)