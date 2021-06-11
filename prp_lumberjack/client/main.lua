PRPCore                                                                               = nil
local PlayerData, startBlip, choppingBlip, processingBlip, packagingBlip, sellingBlip = {}, nil, nil, nil, nil
local vehicleSpawned, chopping, isBusy, isProcessing, hasjob                          = false, false, false, false, false, false
local vehiclePlate                                                                    = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PlayerData = PRPCore.Functions.GetPlayerData()

    if PlayerData.job.name == Config.RequiredJobName then
        hasjob = true
        setupBlips()
    end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    chopping, isBusy, isProcessing, hasjob = false, false, false, false
    RemoveLumberjackBlips()
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    local PlayerJob = JobInfo
    if PlayerJob.name == 'lumberjack' then
        hasjob = true
        setupBlips()
    else
        hasjob = false
        RemoveLumberjackBlips()
    end
end)

function setupBlips()
    if not DoesBlipExist(startBlip) then
        startBlip = addBlip(Config.Depot, 285, 28, '1 - Lumberjack Depot')
    end
    if not DoesBlipExist(choppingBlip) then
        choppingBlip = addBlip(Config.ChoppingBlipLocation, 285, 28, '2 - Woods')
    end
    if not DoesBlipExist(processingBlip) then
        processingBlip = addBlip(Config.WoodProcessor, 285, 28, '3 - Wood processing')
        SetBlipScale(processingBlip, 0.9)
    end
    if not DoesBlipExist(packagingBlip) then
        packagingBlip = addBlip(Config.WoodPacker, 285, 28, '4 - Wood packaging')
        SetBlipScale(packagingBlip, 0.9)
    end
    if not DoesBlipExist(sellingBlip) then
        sellingBlip = addBlip(Config.BuyerLocation, 285, 28, '5 - Wood Sales')
        SetBlipScale(sellingBlip, 0.9)
    end
end

Citizen.CreateThread(function()
    while true do
        local me, sleep   = PlayerPedId(), 750
        local coords      = GetEntityCoords(me)
        local isInVehicle = IsPedInAnyVehicle(me)
        if hasjob then
            local distance2 = GetDistanceBetweenCoords(coords, Config.VehicleSpawner.menu, true)
            if distance2 <= 25 then
                sleep = 0
                DrawMarker(36, Config.VehicleSpawner.menu, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(1, 1, 1), Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 150, false, true, 2, false, false, false)
                if distance2 <= 1.5 then
                    if not isInVehicle then
                        helpText('Press ~INPUT_CONTEXT~ to open vehicle spawner')
                        if IsControlJustReleased(0, 38) then
                            VehicleMenu()
                            Menu.hidden = not Menu.hidden
                        end
                        Menu.renderGUI()
                    end
                end
            end
            local distance3 = GetDistanceBetweenCoords(coords, Config.VehicleSpawner.returnVeh, true)
            if distance3 <= 80 then
                sleep = 0
                DrawMarker(36, Config.VehicleSpawner.returnVeh, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(1, 1, 1), 255, 0, 0, 150, false, true, 2, false, false, false)
                if distance3 <= 1.5 then
                    if isInVehicle then
                        helpText('Press ~INPUT_CONTEXT~ to return job vehicle')
                        if IsControlJustReleased(0, 38) then
                            ReturnJobVehicle()
                        end
                    end
                end
            end
            local distance4 = GetDistanceBetweenCoords(coords, Config.WoodProcessor, true)
            if distance4 <= 25 then
                sleep = 0
                DrawMarker(1, Config.WoodProcessor, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(4.5, 4.5, 0.9), Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 150, false, false, 2, false, false, false)
                if distance4 <= 3.5 then
                    if not isInVehicle then
                        helpText('Press ~INPUT_CONTEXT~ to start processing wood')
                        if IsControlJustReleased(0, 38) and not isBusy then
                            StartWoodProcessing()
                        end
                    end
                end
            end
            local distance5 = GetDistanceBetweenCoords(coords, Config.WoodPacker, true)
            if distance5 <= 25 then
                sleep = 0
                DrawMarker(1, Config.WoodPacker, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(4.5, 4.5, 0.9), Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 150, false, false, 2, false, false, false)
                if distance5 <= 3.5 then
                    if not isInVehicle then
                        helpText('Press ~INPUT_CONTEXT~ to start packaging planks')
                        if IsControlJustReleased(0, 38) and not isBusy then
                            StartWoodPackaging()
                        end
                    end
                end
            end
            local distance6 = GetDistanceBetweenCoords(coords, Config.BuyerLocation, true)
            if distance6 <= 30 then
                sleep = 0
                DrawMarker(1, Config.BuyerLocation, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(4.5, 4.5, 0.9), Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 150, false, false, 2, false, false, false)
                if distance6 <= 3.5 then
                    if not isInVehicle then
                        helpText('Press ~INPUT_CONTEXT~ to start selling')
                        if IsControlJustReleased(0, 38) and not isBusy then
                            SellWoodPallets()
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep       = 500
        local me          = PlayerPedId()
        local coords      = GetEntityCoords(me)
        local isInVehicle = IsPedInAnyVehicle(me)
        if hasjob then
            local closeTo
            for k, v in pairs(Config.ChoppingPositions) do
                if GetDistanceBetweenCoords(coords, v.coords, true) <= 4 then
                    closeTo = v
                    break
                end
            end
            if type(closeTo) == 'table' then
                while Vdist2(GetEntityCoords(me), closeTo.coords, true) <= 4 do
                    if not isInVehicle then
                        Draw3DText(closeTo.coords.x, closeTo.coords.y, closeTo.coords.z, '~w~Press ~g~[E] ~w~to start chopping')
                        local counter = 0
                        sleep         = 0
                        if IsControlJustReleased(0, 38) then
                            if HasPedGotWeapon(me, 'WEAPON_HATCHET', false) then
                                local player, distance = PRPCore.Functions.GetClosestPlayer()
                                if distance == -1 or distance >= 5.0 then
                                    chopping = true
                                    SetEntityCoords(me, closeTo.coords - (vector3(0, 0, 1)))
                                    SetEntityHeading(me, closeTo.heading)
                                    FreezeEntityPosition(me, true)

                                    while chopping do
                                        counter = counter + 1
                                        if counter > 500 then
                                            break
                                        end

                                        Wait(sleep)
                                        SetCurrentPedWeapon(me, 'WEAPON_HATCHET', true)
                                        helpText('Press ~INPUT_ATTACK~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.')
                                        if IsControlJustReleased(0, 24) then
                                            local timer = GetGameTimer() + 800
                                            while GetGameTimer() <= timer do
                                                Wait(0)
                                                DisableControlAction(0, 24, true)
                                            end
                                            ClearPedTasks(me)
                                            TriggerServerEvent('prp_lumberjack:GetWood')
                                        elseif IsControlJustReleased(0, 194) then
                                            break
                                        end
                                    end
                                    chopping = false
                                    SetCurrentPedWeapon(me, GetHashKey('WEAPON_UNARMED'), true)
                                    FreezeEntityPosition(me, false)
                                else
                                    PRPCore.Functions.Notify('There is a player too close to you!', 'error')
                                end
                            else
                                PRPCore.Functions.Notify('You need to equip a hatchet to start chopping!', 'error')
                            end
                        end
                    end
                    Wait(sleep)
                end
            end
        end
        Wait(sleep)
    end
end)

function VehicleMenu()
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "VehicleList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil)
end

function VehicleList(isDown)
    MenuTitle              = "Vehicles:"
    local PlayerReputation = PRPCore.Functions.GetPlayerData().metadata["jobrep"]["lumberjack"]
    ClearMenu()
    for k, v in pairs(Config.Trucks) do
        if v.reputation <= PlayerReputation then
            Menu.addButton(GetLabelText(GetDisplayNameFromVehicleModel(v.model)), "TakeOutVehicle", v.model, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
        end
    end
    Menu.addButton("Back", "VehicleMenu", nil)
end

function TakeOutVehicle(model)
    PRPCore.Functions.TriggerCallback("prp_lumberjack:GetVehicleFee", function(hasMoney)
        if hasMoney then
            PRPCore.Functions.SpawnVehicle(model, function(vehicle)
                platenum = math.random(1000, 9999)
                SetVehicleNumberPlateText(vehicle, "WORK" .. platenum)
                vehiclePlate = "WORK" .. platenum
                if model == 'BobcatXL' then
                    SetVehicleExtra(vehicle, 1, 1)
                end
                SetVehicleDirtLevel(vehicle, 14.0)
                SetEntityAsMissionEntity(vehicle, true, true)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
                SetVehicleEngineOn(vehicle, true, true)
                SetEntityHeading(vehicle, Config.VehicleSpawner.spawnPos.h)
                TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                vehicleSpawned = true
                PRPCore.Functions.Notify('$' .. Config.VehicleFee .. ' Has been removed from your account until you return the vehicle')
            end, Config.VehicleSpawner.spawnPos)
        else
            PRPCore.Functions.Notify("You don't have enough money to pay the vehicle fee", "error")
        end
    end)
end

function closeMenuFull()
    Menu.hidden = true
    ClearMenu()
end

function ReturnJobVehicle()
    if vehicleSpawned and vehiclePlate then
        local me = GetPlayerPed(-1)
        if IsPedInAnyVehicle(me, false) then
            local vehicle   = GetVehiclePedIsIn(me, false)
            local currPlate = GetVehicleNumberPlateText(vehicle)
            print(currPlate .. ' ' .. vehiclePlate)
            if currPlate == vehiclePlate then
                local vehicleHealth = GetVehicleEngineHealth(vehicle)
                local vehicleDamage = 1000 - vehicleHealth
                local amount        = math.floor(Config.VehicleFee - vehicleDamage)
                DeleteVehicle(vehicle)
                vehicleSpawned = false
                vehiclePlate   = nil
                TriggerServerEvent('prp_lumberjack:PayBank', amount)
                PRPCore.Functions.Notify('You got your vehicle fee back (minus repair damages if it\'s damaged)')
            else
                PRPCore.Functions.Notify('This is not your job vehicle!', 'error')
            end
        else
            PRPCore.Functions.Notify('you\'re not in a vehicle!', 'error')
        end
    else
        PRPCore.Functions.Notify('You didn\'t spawn any job vehicles!', 'error')
    end
end

function StartWoodProcessing()
    PRPCore.Functions.TriggerCallback('prp_lumberjack:GetItemData', function(count)
        isBusy       = true
        isProcessing = true
        local me     = PlayerPedId()
        if count ~= nil then
            if count ~= 0 then
                PRPCore.Functions.Progressbar("Wood_Processing", "Processing...", 2000, {
                    disableMovement    = false,
                    disableCarMovement = true,
                    disableMouse       = false,
                    disableCombat      = true,
                })
                for i = 1, count, 1 do
                    if Vdist2(GetEntityCoords(me), Config.WoodProcessor) < 1.5 then
                        Wait(2000)
                        if isProcessing and not IsPedInAnyVehicle(me) then
                            TriggerServerEvent('prp_lumberjack:process', 'wood', 1)
                        else
                            break
                        end
                    else
                        PRPCore.Functions.Notify('You went too far away!', 'error')
                        break
                    end
                end
            else
                PRPCore.Functions.Notify('You don\'t have enough wood on you!', 'error')
            end
        end
        isBusy       = false
        isProcessing = false
    end, 'wood')
end

function StartWoodPackaging()
    PRPCore.Functions.TriggerCallback('prp_lumberjack:GetItemData', function(count)
        isBusy       = true
        isProcessing = true
        local me     = PlayerPedId()
        if count ~= nil then
            if count ~= 0 then
                PRPCore.Functions.Progressbar("Plank_Packaging", "Packaging...", 2000, {
                    disableMovement    = false,
                    disableCarMovement = true,
                    disableMouse       = false,
                    disableCombat      = true,
                })
                for i = 1, count, 1 do
                    if Vdist2(GetEntityCoords(me), Config.WoodPacker) < 1.5 then
                        Wait(2000)
                        if isProcessing and not IsPedInAnyVehicle(me) then
                            TriggerServerEvent('prp_lumberjack:process', 'wood_planks', 30)
                        else
                            break
                        end
                    else
                        PRPCore.Functions.Notify('You went too far away!', 'error')
                        break
                    end
                end
            else
                PRPCore.Functions.Notify('You don\'t have enough wood planks on you!', 'error')
            end
        end
        isBusy       = false
        isProcessing = false
    end, 'wood_planks')
end

function SellWoodPallets()
    local me = PlayerPedId()
    PRPCore.Functions.TriggerCallback('prp_lumberjack:GetItemData', function(count)
        if not isBusy and not IsPedInAnyVehicle(me) then
            if count > 0 then
                isBusy = true
                PRPCore.Functions.Progressbar("Pallet_Selling", "Selling...", 10000, {
                    disableMovement    = true,
                    disableCarMovement = true,
                    disableMouse       = false,
                    disableCombat      = true,
                })
                Wait(10000)
                TriggerServerEvent('prp_lumberjack:sell')
                FreezeEntityPosition(me, false)
                Wait(1000)
                PRPCore.Functions.Notify('Don\'t forget to return your vehicle to the depot!')
            else
                PRPCore.Functions.Notify('You don\'t have any pallets of planks on you!', 'error')
            end
        end
        isBusy = false
    end, 'packaged_plank')
end

function RemoveLumberjackBlips()
    if DoesBlipExist(startBlip) then
        RemoveBlip(startBlip)
    end
    if DoesBlipExist(choppingBlip) then
        RemoveBlip(choppingBlip)
    end
    if DoesBlipExist(processingBlip) then
        RemoveBlip(processingBlip)
    end
    if DoesBlipExist(packagingBlip) then
        RemoveBlip(packagingBlip)
    end
    if DoesBlipExist(sellingBlip) then
        RemoveBlip(sellingBlip)
    end
end

RegisterNetEvent('prp_lumberjack:cancelProcessing')
AddEventHandler('prp_lumberjack:cancelProcessing', function()
    isProcessing = false
    PRPCore.Functions.Notify('Done!', 'Success')
end)

addBlip  = function(coords, sprite, colour, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
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

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p                = GetGameplayCamCoords()
    local distance         = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale            = (1 / distance) * 2
    local fov              = (1 / GetGameplayCamFov()) * 100
    local scale            = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end