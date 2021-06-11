PRPCore = nil

Citizen.CreateThread(function()
    while PRPCore == nil do
        TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

ModdedVehicles = {}
VehicleStatus = {}
ClosestPlate = nil
SimonClosestPlate = nil
BaduClosestPlate = nil
isLoggedIn = true
PlayerJob = {}

local onDuty = false

function DrawText3Ds(x, y, z, text)
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
    while true do
        if isLoggedIn then
            SetClosestPlate()
            SimonSetClosestPlate()
            BaduSetClosestPlate()
        end
        Citizen.Wait(1000)
    end
end)

function SetClosestPlate()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil
    for id,_ in pairs(Config.Plates) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z, true)
            current = id
        end
    end
    ClosestPlate = current
end

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "bennys" then
                TriggerServerEvent("PRPCore:ToggleDuty")
            end
        end
    end)
    isLoggedIn = true
    PRPCore.Functions.TriggerCallback('prp-vehicletuning:server:GetAttachedVehicle', function(plates)
        for k, v in pairs(plates) do
            Config.Plates[k].AttachedVehicle = v.AttachedVehicle
        end
    end)

end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('PRPCore:Client:SetDuty')
AddEventHandler('PRPCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    RACBlip = AddBlipForCoord(919.07, -978.24, 39.5)

    SetBlipSprite (RACBlip, 646)
    SetBlipDisplay(RACBlip, 4)
    SetBlipScale  (RACBlip, 0.55)
    SetBlipAsShortRange(RACBlip, true)
    SetBlipColour(RACBlip, 1)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("RAC")
    EndTextCommandSetBlipName(RACBlip)
end)

Citizen.CreateThread(function()
    while true do
        local inRange = false

        if isLoggedIn then
            if PlayerJob.name == "bennys" then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local StashDistance = GetDistanceBetweenCoords(pos, Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, true)
                local OnDutyDistance = GetDistanceBetweenCoords(pos, Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, true)
                local VehicleDistance = GetDistanceBetweenCoords(pos, Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, true)

                if onDuty then
                    if PlayerJob.grade.level >= 1 then
                        if StashDistance < 20 then
                            inRange = true
                            DrawMarker(2, Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                            if StashDistance < 1 then
                                DrawText3Ds(Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, "[E] Stash open")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("inventory:client:SetCurrentStash", "mechanicstash")
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "mechanicstash", {
                                        maxweight = 4000000,
                                        slots = 500,
                                    })
                                end
                            end
                        end
                    end
                end

                if onDuty then
                    if VehicleDistance < 20 then
                        inRange = true
                        DrawMarker(2, Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                        if VehicleDistance < 1 then
                            local InVehicle = IsPedInAnyVehicle(GetPlayerPed(-1))

                            if InVehicle then
                                DrawText3Ds(Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, '[E] Hide the vehicle')
                                if IsControlJustPressed(0, 38) then
                                    DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                end
                            else
                                DrawText3Ds(Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, '[E] Grab Vehicle')
                                if IsControlJustPressed(0, 38) then
                                    if IsControlJustPressed(0, 38) then
                                        VehicleList()
                                        Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            end
                        end
                    end
                end

                --if OnDutyDistance < 20 then
                --    inRange = true
                --    DrawMarker(2, Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                --
                --    if OnDutyDistance < 1 then
                --        if onDuty then
                --            DrawText3Ds(Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, "[E] Off Duty")
                --        else
                --            DrawText3Ds(Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, "[E] On Duty")
                --        end
                --        if IsControlJustReleased(0, 38) then
                --            TriggerServerEvent("PRPCore:ToggleDuty")
                --        end
                --    end
                --end

                if onDuty then
                    for k, v in pairs(Config.Plates) do
                        if v.AttachedVehicle == nil then
                            local PlateDistance = GetDistanceBetweenCoords(pos, v.coords.x, v.coords.y, v.coords.z)
                            if PlateDistance < 20 then
                                inRange = true
                                DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                                if PlateDistance < 2 then
                                    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                                        if not IsThisModelABicycle(GetEntityModel(veh)) then
                                            DrawText3Ds(v.coords.x, v.coords.y, v.coords.z + 0.3, "[E] Place the vehicle on the platform")
                                            if IsControlJustPressed(0, 38) then
                                                DoScreenFadeOut(150)
                                                Wait(150)
                                                Config.Plates[ClosestPlate].AttachedVehicle = veh
                                                SetEntityCoords(veh, v.coords.x, v.coords.y, v.coords.z)
                                                SetEntityHeading(veh, v.coords.h)
                                                FreezeEntityPosition(veh, true)
                                                Wait(500)
                                                DoScreenFadeIn(250)
                                                TriggerServerEvent('prp-vehicletuning:server:SetAttachedVehicle', veh, k)
                                            end
                                        else
                                            PRPCore.Functions.Notify("You cannot put bicycles on the plate!", "error")
                                        end
                                    end
                                end
                            end
                        else
                            local PlateDistance = GetDistanceBetweenCoords(pos, v.coords.x, v.coords.y, v.coords.z)
                            if PlateDistance < 3 then
                                inRange = true
                                DrawText3Ds(v.coords.x, v.coords.y, v.coords.z, "[E] Open Menu Options")
                                if IsControlJustPressed(0, 38) then
                                    OpenMenu()
                                    Menu.hidden = not Menu.hidden
                                end
                                Menu.renderGUI()
                            end
                        end
                    end
                end

                if not inRange then
                    Citizen.Wait(1500)
                end
            else
                Citizen.Wait(1500)
            end
        else
            Citizen.Wait(1500)
        end

        Citizen.Wait(3)
    end
end)

function niks()
    print('niks')
end

function OpenMenu()
    ClearMenu()
    Menu.addButton("Options", "VehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function VehicleList()
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(v, "SpawnListVehicle", k) 
    end
    Menu.addButton("Close Menu Menu", "CloseMenu", nil) 
end

function SpawnListVehicle(model)
    local coords = {
        x = Config.Locations["vehicle"].x,
        y = Config.Locations["vehicle"].y,
        z = Config.Locations["vehicle"].z,
        h = Config.Locations["vehicle"].h,
    }
    local plate = "AC"..math.random(1111, 9999)
    PRPCore.Functions.SpawnVehicle(model, function(veh)
        SetVehicleNumberPlateText(veh, "ACBV"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        Menu.hidden = true
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

function VehicleOptions()
    ClearMenu()
    Menu.addButton("Unattach Vehicle", "UnattachVehicle", nil)
    -- Menu.addButton("Check Status", "CheckStatus", nil)
    Menu.addButton("Components", "PartsMenu", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil)
end

function PartsMenu()
    ClearMenu()
    local plate = GetVehicleNumberPlateText(Config.Plates[ClosestPlate].AttachedVehicle)
    if VehicleStatus[plate] ~= nil then
        for k, v in pairs(Config.ValuesLabels) do
            if math.ceil(VehicleStatus[plate][k]) ~= Config.MaxStatusValues[k] then
                local percentage = math.ceil(VehicleStatus[plate][k])
                if percentage > 100 then
                    percentage = math.ceil(VehicleStatus[plate][k]) / 10
                end
                Menu.addButton(v..": "..percentage.."%", "PartMenu", k) 
            else
                local percentage = math.ceil(Config.MaxStatusValues[k])
                if percentage > 100 then
                    percentage = math.ceil(Config.MaxStatusValues[k]) / 10
                end
                Menu.addButton(v..": "..percentage.."%", "NoDamage", nil) 
            end
        end
    else
        for k, v in pairs(Config.ValuesLabels) do
            local percentage = math.ceil(Config.MaxStatusValues[k])
            if percentage > 100 then
                percentage = math.ceil(Config.MaxStatusValues[k]) / 10
            end
            Menu.addButton(v..": "..percentage.."%", "NoDamage", nil) 
        end
    end
    Menu.addButton("Back", "VehicleOptions", nil) 
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function CheckStatus()
    local plate = GetVehicleNumberPlateText(Config.Plates[ClosestPlate].AttachedVehicle)
    SendStatusMessage(VehicleStatus[plate])
end

function PartMenu(part)
    ClearMenu()
    Menu.addButton("Repair ("..PRPCore.Shared.Items[Config.RepairCostAmount[part].item]["label"].." "..Config.RepairCostAmount[part].costs.."x)", "RepairPart", part)
    Menu.addButton("Back", "VehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function NoDamage(part)
    ClearMenu()
    Menu.addButton("There is no damage to this part!", "PartsMenu", part)
    Menu.addButton("Back", "VehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function RepairPart(part)
    local plate = GetVehicleNumberPlateText(Config.Plates[ClosestPlate].AttachedVehicle)
    local PartData = Config.RepairCostAmount[part]

    PRPCore.Functions.TriggerCallback('prp-inventory:server:GetStashItems', function(StashItems)
        if json.encode(StashItems) ~= "[]" then
            for k, v in pairs(StashItems) do
                if v.name == PartData.item then
                    if v.amount >= PartData.costs then
                        PRPCore.Functions.Progressbar("repair_part", Config.ValuesLabels[part].." Repairing", math.random(5000, 10000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            if (v.amount - PartData.costs) <= 0 then
                                StashItems[k] = nil
                            else
                                v.amount = (v.amount - PartData.costs)
                            end
                            TriggerEvent('prp-vehicletuning:client:RepaireeePart', part)
                            TriggerServerEvent('prp-inventory:server:SaveStashItems', "mechanicstash", StashItems)
                            SetTimeout(250, function()
                                PartsMenu()
                            end)
                        end, function()
                            PRPCore.Functions.Notify("Repair Cancelled..", "error")
                        end)
                        break
                    else
                        PRPCore.Functions.Notify('There are not enough materials in the safe..', 'error')
                    end
                    break
                end
            end
        else
            PRPCore.Functions.Notify('There are not enough materials in the safe..', 'error')
        end
    end, "mechanicstash")
end


RegisterNetEvent('prp-vehicletuning:client:RepaireeePart')
AddEventHandler('prp-vehicletuning:client:RepaireeePart', function(part)
    local veh = Config.Plates[ClosestPlate].AttachedVehicle
    local plate = GetVehicleNumberPlateText(veh)
    if part == "engine" then
        SetVehicleEngineHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", Config.MaxStatusValues[part])
    elseif part == "body" then
        local curEngine = GetVehicleEngineHealth(veh)
        Citizen.Wait(500)
        SetVehicleBodyHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", Config.MaxStatusValues[part])
        SetVehicleFixed(veh)
        SetVehicleEngineHealth(veh, curEngine)
    else
        TriggerServerEvent("vehiclemod:server:updatePart", plate, part, Config.MaxStatusValues[part])
    end
    PRPCore.Functions.Notify("The "..Config.ValuesLabels[part].." is repaired!")
end)

function UnattachVehicle()
    local coords = Config.Locations["exit"]
    DoScreenFadeOut(150)
    Wait(150)
    FreezeEntityPosition(Config.Plates[ClosestPlate].AttachedVehicle, false)
    SetEntityCoords(Config.Plates[ClosestPlate].AttachedVehicle, Config.Plates[ClosestPlate].coords.x, Config.Plates[ClosestPlate].coords.y, Config.Plates[ClosestPlate].coords.z)
    SetEntityHeading(Config.Plates[ClosestPlate].AttachedVehicle, Config.Plates[ClosestPlate].coords.h)
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), Config.Plates[ClosestPlate].AttachedVehicle, -1)
    Wait(500)
    DoScreenFadeIn(250)
    Config.Plates[ClosestPlate].AttachedVehicle = nil
    TriggerServerEvent('prp-vehicletuning:server:SetAttachedVehicle', false, ClosestPlate)
end

RegisterNetEvent('prp-vehicletuning:client:SetAttachedVehicle')
AddEventHandler('prp-vehicletuning:client:SetAttachedVehicle', function(veh, key)
    if veh ~= false then
        Config.Plates[key].AttachedVehicle = veh
    else
        Config.Plates[key].AttachedVehicle = nil
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
            if ModdedVehicles[tostring(veh)] == nil and not IsThisModelABicycle(GetEntityModel(veh)) then
                --[[local fSteeringLock = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock')
                fSteeringLock = math.ceil((fSteeringLock * 0.6)) + 0.1

                SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock', fSteeringLock)
                SetVehicleHandlingField(veh, 'CHandlingData', 'fSteeringLock', fSteeringLock)]]--

                local fInitialDriveMaxFlatVel = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel')

                if IsThisModelABike(GetEntityModel(veh)) then
                    local fTractionCurveMin = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionCurveMin')

                    fTractionCurveMin = fTractionCurveMin * 0.6
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionCurveMin', fTractionCurveMin)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fTractionCurveMin', fTractionCurveMin)   

                    -- local fTractionCurveMax = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionCurveMax')
                    -- fTractionCurveMax = fTractionCurveMax * 0.6
                    -- SetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionCurveMax', fTractionCurveMax)
                    -- SetVehicleHandlingField(veh, 'CHandlingData', 'fTractionCurveMax', fTractionCurveMax)

                    local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
                    fInitialDriveForce = fInitialDriveForce * 2.4
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)

                    local fBrakeForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce')
                    fBrakeForce = fBrakeForce * 1.4
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce', fBrakeForce)
                    
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSuspensionReboundDamp', 5.000000)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fSuspensionReboundDamp', 5.000000)

                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSuspensionCompDamp', 5.000000)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fSuspensionCompDamp', 5.000000)

                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fSuspensionForce', 22.000000)
                    SetVehicleHandlingField(veh, 'CHandlingData', 'fSuspensionForce', 22.000000)

                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fCollisionDamageMult', 2.500000)
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fEngineDamageMult', 0.120000)
                else
                    local fBrakeForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce')
                    fBrakeForce = fBrakeForce * 0.5
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce', fBrakeForce)

                    local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
                    if fInitialDriveForce < 0.289 then
                        fInitialDriveForce = fInitialDriveForce * 1.2
                        SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)
                    else
                        fInitialDriveForce = fInitialDriveForce * 0.9
                        SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce', fInitialDriveForce)
                    end
                                
                    local fInitialDragCoeff = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDragCoeff')
                    fInitialDragCoeff = fInitialDragCoeff * 0.3
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDragCoeff', fInitialDragCoeff)

                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fEngineDamageMult', 0.100000)
                    SetVehicleHandlingFloat(veh, 'CHandlingData', 'fCollisionDamageMult', 2.900000)

                end
                SetVehicleHandlingFloat(veh, 'CHandlingData', 'fDeformationDamageMult', 1.000000)
                SetVehicleHasBeenOwnedByPlayer(veh,true)
                ModdedVehicles[tostring(veh)] = { 
                    ["fInitialDriveMaxFlatVel"] = fInitialDriveMaxFlatVel, 
                    ["fSteeringLock"] = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock'), 
                    ["fTractionLossMult"] = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fTractionLossMult'), 
                    ["fLowSpeedTractionLossMult"] = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fLowSpeedTractionLossMult') 
                }
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(2000)
        end
    end
end)
local effectTimer = 0
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(10000)
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
            if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
                local engineHealth = GetVehicleEngineHealth(veh)
                local bodyHealth = GetVehicleBodyHealth(veh)
                local plate = GetVehicleNumberPlateText(veh)
                if VehicleStatus[plate] == nil then 
                    TriggerServerEvent("vehiclemod:server:setupVehicleStatus", plate, engineHealth, bodyHealth)
                else
                    TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", engineHealth)
                    TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", bodyHealth)
                    effectTimer = effectTimer + 1
                    if effectTimer >= math.random(10, 15) then
                        ApplyEffects(veh)
                        effectTimer = 0
                    end
                end
            else
                effectTimer = 0
                Citizen.Wait(10000)
            end
        else
            effectTimer = 0
            Citizen.Wait(20000)
        end
    end
end)

RegisterNetEvent('vehiclemod:client:setVehicleStatus')
AddEventHandler('vehiclemod:client:setVehicleStatus', function(plate, status)
    VehicleStatus[plate] = status
end)

RegisterNetEvent('vehiclemod:client:getVehicleStatus')
AddEventHandler('vehiclemod:client:getVehicleStatus', function(plate, status)
    if not (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        if veh ~= nil and veh ~= 0 then
            local vehpos = GetEntityCoords(veh)
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0 then
                if not IsThisModelABicycle(GetEntityModel(veh)) then
                    local plate = GetVehicleNumberPlateText(veh)
                    if VehicleStatus[plate] ~= nil then 
                        SendStatusMessage(VehicleStatus[plate])
                    else
                        PRPCore.Functions.Notify("No status known..", "error")
                    end
                else
                    PRPCore.Functions.Notify("Not a valid vehicle..", "error")
                end
            else
                PRPCore.Functions.Notify("You are not close enough to a vehicle..", "error")
            end
        else
            PRPCore.Functions.Notify("You must be in the vehicle first..", "error")
        end
    else
        PRPCore.Functions.Notify("You must be outside the vehicle..", "error")
    end
end)

RegisterNetEvent('vehiclemod:client:fixEverything')
AddEventHandler('vehiclemod:client:fixEverything', function()
    if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
        if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
            local plate = GetVehicleNumberPlateText(veh)
            TriggerServerEvent("vehiclemod:server:fixEverything", plate)
        else
            PRPCore.Functions.Notify("You are not a driver or a on a bicycle..", "error")
        end
    else
        PRPCore.Functions.Notify("You are not in a vehicle..", "error")
    end
end)

RegisterNetEvent('vehiclemod:client:setPartLevel')
AddEventHandler('vehiclemod:client:setPartLevel', function(part, level)
    if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
        if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
            local plate = GetVehicleNumberPlateText(veh)
            if part == "engine" then
                SetVehicleEngineHealth(veh, level)
                TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", GetVehicleEngineHealth(veh))
            elseif part == "body" then
                SetVehicleBodyHealth(veh, level)
                TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", GetVehicleBodyHealth(veh))
            else
                TriggerServerEvent("vehiclemod:server:updatePart", plate, part, level)
            end
        else
            PRPCore.Functions.Notify("You are not a driver or on a bicycle..", "error")
        end
    else
        PRPCore.Functions.Notify("You are not in vehicle..", "error")
    end
end)
local openingDoor = false

RegisterNetEvent('vehiclemod:client:repairPart')
AddEventHandler('vehiclemod:client:repairPart', function(part, level, needAmount)
    -- if CanReapair() then
        if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
            if veh ~= nil and veh ~= 0 then
                local vehpos = GetEntityCoords(veh)
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local currentEngine = GetVehicleEngineHealth(veh)
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0 then
                    if not IsThisModelABicycle(GetEntityModel(veh)) then
                        local plate = GetVehicleNumberPlateText(veh)
                        if VehicleStatus[plate] ~= nil and VehicleStatus[plate][part] ~= nil then
                            local lockpickTime = (1000 * level)
                            if part == "body" then
                                lockpickTime = lockpickTime / 10
                            end
                            ScrapAnim(lockpickTime)
                            PRPCore.Functions.Progressbar("repair_advanced", "Repair Vehicle..", lockpickTime, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mp_car_bomb",
                                anim = "car_bomb_mechanic",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                openingDoor = false
                                ClearPedTasks(GetPlayerPed(-1))
                                if part == "body" then
                                    SetVehicleBodyHealth(veh, GetVehicleBodyHealth(veh) + level)
                                    SetVehicleFixed(veh)
                                    Citizen.Wait(1000)
                                    SetVehicleEngineHealth(veh, currentEngine)
                                    TriggerServerEvent("vehiclemod:server:updatePart", plate, part, GetVehicleBodyHealth(veh))
                                    TriggerServerEvent("PRPCore:Server:RemoveItem", Config.RepairCost[part], needAmount)
                                    TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items[Config.RepairCost[part]], "remove")
                                elseif part ~= "engine" then
                                    TriggerServerEvent("vehiclemod:server:updatePart", plate, part, GetVehicleStatus(plate, part) + level)
                                    TriggerServerEvent("PRPCore:Server:RemoveItem", Config.RepairCost[part], level)
                                    TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items[Config.RepairCost[part]], "remove")
                                end
                            end, function() -- Cancel
                                openingDoor = false
                                ClearPedTasks(GetPlayerPed(-1))
                                PRPCore.Functions.Notify("Process Cancelled..", "error")
                            end)
                        else
                            PRPCore.Functions.Notify("Not a valid part..", "error")
                        end
                    else
                        PRPCore.Functions.Notify("Not a valid vehicle..", "error")
                    end
                else
                    PRPCore.Functions.Notify("You are not close enough to the vehicle..", "error")
                end
            else
                PRPCore.Functions.Notify("You must be in the vehicle first..", "error")
            end
        else
            PRPCore.Functions.Notify("You are not in vehicle..", "error")
        end
    -- end
end)

function ScrapAnim(time)
    local time = time / 1000
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
            time = time - 2
            if time <= 0 then
                openingDoor = false
                StopAnimTask(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end

function CanReapair()
    local retval = false
    for k, v in pairs(Config.Businesses) do
        retval = exports['prp-companies']:IsEmployee(v)
    end
    return retval
end

function ApplyEffects(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    if GetVehicleClass(vehicle) ~= 13 and GetVehicleClass(vehicle) ~= 21 and GetVehicleClass(vehicle) ~= 16 and GetVehicleClass(vehicle) ~= 15 and GetVehicleClass(vehicle) ~= 14 then
        if VehicleStatus[plate] ~= nil then 
            local chance = math.random(1, 100)
            if VehicleStatus[plate]["radiator"] <= 50 and (chance >= 1 and chance <= 20) then
                local engineHealth = GetVehicleEngineHealth(vehicle)
                if VehicleStatus[plate]["radiator"] <= 50 and VehicleStatus[plate]["radiator"] >= 38 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(10, 15))
                elseif VehicleStatus[plate]["radiator"] <= 37 and VehicleStatus[plate]["radiator"] >= 25 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(15, 20))
                elseif VehicleStatus[plate]["radiator"] <= 24 and VehicleStatus[plate]["radiator"] >= 12 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(20, 30))
                elseif VehicleStatus[plate]["radiator"] <= 11 and VehicleStatus[plate]["radiator"] >= 1 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(30, 40))
                else
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(40, 50))
                end
            end

            if VehicleStatus[plate]["axle"] <= 50 and (chance >= 21 and chance <= 40) then
                if VehicleStatus[plate]["axle"] <= 50 and VehicleStatus[plate]["axle"] >= 38 then
                    for i=0,360 do					
                        SetVehicleSteeringScale(vehicle,i)
                        Citizen.Wait(5)
                    end
                elseif VehicleStatus[plate]["axle"] <= 37 and VehicleStatus[plate]["axle"] >= 25 then
                    for i=0,360 do	
                        Citizen.Wait(10)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                elseif VehicleStatus[plate]["axle"] <= 24 and VehicleStatus[plate]["axle"] >= 12 then
                    for i=0,360 do
                        Citizen.Wait(15)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                elseif VehicleStatus[plate]["axle"] <= 11 and VehicleStatus[plate]["axle"] >= 1 then
                    for i=0,360 do
                        Citizen.Wait(20)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                else
                    for i=0,360 do
                        Citizen.Wait(25)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                end
            end

            if VehicleStatus[plate]["brakes"] <= 50 and (chance >= 41 and chance <= 60) then
                if VehicleStatus[plate]["brakes"] <= 50 and VehicleStatus[plate]["brakes"] >= 38 then
                    SetVehicleHandbrake(vehicle, true)
                    Citizen.Wait(1000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 37 and VehicleStatus[plate]["brakes"] >= 25 then
                    SetVehicleHandbrake(vehicle, true)
                    Citizen.Wait(3000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 24 and VehicleStatus[plate]["brakes"] >= 12 then
                    SetVehicleHandbrake(vehicle, true)
                    Citizen.Wait(5000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 11 and VehicleStatus[plate]["brakes"] >= 1 then
                    SetVehicleHandbrake(vehicle, true)
                    Citizen.Wait(7000)
                    SetVehicleHandbrake(vehicle, false)
                else
                    SetVehicleHandbrake(vehicle, true)
                    Citizen.Wait(9000)
                    SetVehicleHandbrake(vehicle, false)
                end
            end

            if VehicleStatus[plate]["clutch"] <= 50 and (chance >= 61 and chance <= 80) then
                if VehicleStatus[plate]["clutch"] <= 50 and VehicleStatus[plate]["clutch"] >= 38 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Citizen.Wait(50)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Citizen.Wait(5)
                    end
                    Citizen.Wait(500)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 37 and VehicleStatus[plate]["clutch"] >= 25 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Citizen.Wait(100)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Citizen.Wait(5)
                    end
                    Citizen.Wait(750)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 25 and VehicleStatus[plate]["clutch"] >= 12 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Citizen.Wait(150)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Citizen.Wait(5)
                    end
                    Citizen.Wait(1000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 11 and VehicleStatus[plate]["clutch"] >= 1 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Citizen.Wait(200)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Citizen.Wait(5)
                    end
                    Citizen.Wait(1250)
                    SetVehicleHandbrake(vehicle, false)
                else
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Citizen.Wait(250)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Citizen.Wait(5)
                    end
                    Citizen.Wait(1500)
                    SetVehicleHandbrake(vehicle, false)
                end
            end

            if VehicleStatus[plate]["fuel"] <= 50 and (chance >= 81 and chance <= 100) then
                local fuel = exports['LegacyFuel']:GetFuel(vehicle)
                if VehicleStatus[plate]["fuel"] <= 50 and VehicleStatus[plate]["fuel"] >= 38 then
                    exports['LegacyFuel']:SetFuel(vehicle, fuel - 2.0)
                elseif VehicleStatus[plate]["fuel"] <= 37 and VehicleStatus[plate]["fuel"] >= 25 then
                    exports['LegacyFuel']:SetFuel(vehicle, fuel - 4.0)
                elseif VehicleStatus[plate]["fuel"] <= 24 and VehicleStatus[plate]["fuel"] >= 12 then
                    exports['LegacyFuel']:SetFuel(vehicle, fuel - 6.0)
                elseif VehicleStatus[plate]["fuel"] <= 11 and VehicleStatus[plate]["fuel"] >= 1 then
                    exports['LegacyFuel']:SetFuel(vehicle, fuel - 8.0)
                else
                    exports['LegacyFuel']:SetFuel(vehicle, fuel - 10.0)
                end
            end
        end
    end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function GetVehicleStatusList(plate)
    local retval = nil
    if VehicleStatus[plate] ~= nil then 
        retval = VehicleStatus[plate]
    end
    return retval
end

function GetVehicleStatus(plate, part)
    local retval = nil
    if VehicleStatus[plate] ~= nil then 
        retval = VehicleStatus[plate][part]
    end
    return retval
end

function SetVehicleStatus(plate, part, level)
    TriggerServerEvent("vehiclemod:server:updatePart", plate, part, level)
end

function SendStatusMessage(statusList)
    if statusList ~= nil then 
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message normal"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>'.. Config.ValuesLabels["engine"] ..' (engine):</strong> {1} <br><strong>'.. Config.ValuesLabels["body"] ..' (body):</strong> {2} <br><strong>'.. Config.ValuesLabels["radiator"] ..' (radiator):</strong> {3} <br><strong>'.. Config.ValuesLabels["axle"] ..' (axle):</strong> {4}<br><strong>'.. Config.ValuesLabels["brakes"] ..' (brakes):</strong> {5}<br><strong>'.. Config.ValuesLabels["clutch"] ..' (clutch):</strong> {6}<br><strong>'.. Config.ValuesLabels["fuel"] ..' (fuel):</strong> {7}</div></div>',
            args = {'Vehicle Status', round(statusList["engine"]) .. "/" .. Config.MaxStatusValues["engine"] .. " ("..PRPCore.Shared.Items[Config.RepairCost["engine"]]["label"]..")", round(statusList["body"]) .. "/" .. Config.MaxStatusValues["body"] .. " ("..PRPCore.Shared.Items[Config.RepairCost["body"]]["label"]..")", round(statusList["radiator"]) .. "/" .. Config.MaxStatusValues["radiator"] .. ".0 ("..PRPCore.Shared.Items[Config.RepairCost["radiator"]]["label"]..")", round(statusList["axle"]) .. "/" .. Config.MaxStatusValues["axle"] .. ".0 ("..PRPCore.Shared.Items[Config.RepairCost["axle"]]["label"]..")", round(statusList["brakes"]) .. "/" .. Config.MaxStatusValues["brakes"] .. ".0 ("..PRPCore.Shared.Items[Config.RepairCost["brakes"]]["label"]..")", round(statusList["clutch"]) .. "/" .. Config.MaxStatusValues["clutch"] .. ".0 ("..PRPCore.Shared.Items[Config.RepairCost["clutch"]]["label"]..")", round(statusList["fuel"]) .. "/" .. Config.MaxStatusValues["fuel"] .. ".0 ("..PRPCore.Shared.Items[Config.RepairCost["fuel"]]["label"]..")"}
        })
    end
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 1) .. "f", num))
end

-- Menu Functions

CloseMenu = function()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

ClearMenu = function()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

function noSpace(str)
    local normalisedString = string.gsub(str, "%s+", "")
    return normalisedString
end

local vehiclemeters = 0
local previousvehiclepos = nil
local CheckDone = false

function GetDamageMultiplier(meters)
    local check = round(meters / 1000, -2)
    local retval = nil
    for k, v in pairs(Config.MinimalMetersForDamage) do
        if check >= v.min and check <= v.max then
            retval = k
            break
        elseif check >= Config.MinimalMetersForDamage[#Config.MinimalMetersForDamage].min then
            retval = #Config.MinimalMetersForDamage
            break
        end
    end
    return retval
end


function round(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces>0 then
      local mult = 10^numDecimalPlaces
      return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn then
            if PlayerJob.name == "bennys" and PlayerJob.grade.level >= 0 then
                local pos = GetEntityCoords(GetPlayerPed(-1))

                for k, v in pairs(Config.StashList["stash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            DrawText3Ds(v.x, v.y, v.z, "~g~E~w~ - Auto Stash")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("prp-log:server:CreateLog", "mechanicstash", "Opened Stash", "red", "**"..GetPlayerName(PlayerId()).."** opened Bennys Stash")
                                TriggerEvent("inventory:client:SetCurrentStash", "burtstash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "burtstash", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3Ds(v.x, v.y, v.z, "Auto Stash")
                        end
                    else
                        Citizen.Wait(1000)
                    end
                end
            elseif PlayerJob.name == "mechanic1" and PlayerJob.grade.level >= 1 then
                local pos = GetEntityCoords(GetPlayerPed(-1))

                for k, v in pairs(Config.StashList["simon"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            DrawText3Ds(v.x, v.y, v.z, "~g~E~w~ - Simon's Stash")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("prp-log:server:CreateLog", "mechanicstash", "Opened Stash", "red", "**"..GetPlayerName(PlayerId()).."** opened Simon's Stash")
                                TriggerEvent("inventory:client:SetCurrentStash", "simonstash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "simonstash", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3Ds(v.x, v.y, v.z, "Simon's Stash")
                        end
                    else
                        Citizen.Wait(1000)
                    end
                end
            elseif PlayerJob.name == "mechanic2" and PlayerJob.grade.level >= 4 then
                local pos = GetEntityCoords(GetPlayerPed(-1))

                for k, v in pairs(Config.StashList["badu"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            DrawText3Ds(v.x, v.y, v.z, "~g~E~w~ - Badu's Stash")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("prp-log:server:CreateLog", "mechanicstash", "Opened Stash", "red", "**"..GetPlayerName(PlayerId()).."** opened Badu's Stash")
                                TriggerEvent("inventory:client:SetCurrentStash", "badustash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "badustash", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3Ds(v.x, v.y, v.z, "Badu's Stash")
                        end
                    else
                        Citizen.Wait(1000)
                    end
                end
            else
                Citizen.Wait(10000)
            end
        end
    end
end)

RegisterNetEvent('prp-vehicletuning:client:SendMechanicMessage')
AddEventHandler('prp-vehicletuning:client:SendMechanicMessage', function(message)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    
    TriggerServerEvent("prp-vehicletuning:server:SendMechanicMessage", coords, message)
    TriggerEvent("police:client:CallAnim")
end)

RegisterNetEvent('prp-vehicletuning:client:SendMechanicMessageCheck')
AddEventHandler('prp-vehicletuning:client:SendMechanicMessageCheck', function(MainPlayer, message, coords)
    local PlayerData = PRPCore.Functions.GetPlayerData()

    if (PlayerData.job.name == "bennys" or PlayerData.job.name == "mechanic1" or PlayerData.job.name == "mechanic2" or PlayerData.job.name == "tow") and PlayerData.job.onduty then
        TriggerEvent('chatMessage', "Mechanic CALL - " .. MainPlayer.PlayerData.charinfo.firstname .. " " .. MainPlayer.PlayerData.charinfo.lastname .. " ("..MainPlayer.PlayerData.source..")", "warning", message)
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
        AddTextComponentString("Mechanic CALL")
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

function isTowVehicle(vehicle)
    local retval = false
    for k, v in pairs(Config.Vehicles) do
        if GetEntityModel(vehicle) == GetHashKey(k) then
            retval = true
        end
    end
    return retval
end

RegisterNetEvent('prp-vehicletuning:client:TowVehicle')
AddEventHandler('prp-vehicletuning:client:TowVehicle', function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
    if isTowVehicle(vehicle) then
        if CurrentTow == nil then 
            --[[ Replaced "PRPCore.Functions.GetClosestVehicle()" with custom implementation "getVehicleInDirection"
                 PRPCore native could not return polcice and other vehicles types (NPC) ]] 
            local playerped = PlayerPedId()
            local coordA = GetEntityCoords(playerped, 1)
            local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
            local targetVehicle = getVehicleInDirection(coordA, coordB)
            if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                if vehicle ~= targetVehicle then
                    local towPos = GetEntityCoords(vehicle)
                    local targetPos = GetEntityCoords(targetVehicle)
                    if GetDistanceBetweenCoords(towPos.x, towPos.y, towPos.z, targetPos.x, targetPos.y, targetPos.z, true) < 11.0 then
                        PRPCore.Functions.Progressbar("towing_vehicle", "Park the vehicle..", 5000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mini@repair",
                            anim = "fixing_a_ped",
                            flags = 16,
                        }, {}, {}, function() -- Done
                            StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_ped", 1.0)
                            AttachEntityToEntity(targetVehicle, vehicle, GetEntityBoneIndexByName(vehicle, 'bodyshell'), 0.0, -1.5 + -0.85, 0.0 + 1.15, 0, 0, 0, 1, 1, 0, 1, 0, 1)
                            FreezeEntityPosition(targetVehicle, true)
                            CurrentTow = targetVehicle
                            PRPCore.Functions.Notify("Vehicle Towed!")
                        end, function() -- Cancel
                            StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_ped", 1.0)
                            PRPCore.Functions.Notify("Failed!", "error")
                        end)
                    end
                end
            end
        else
            PRPCore.Functions.Progressbar("untowing_vehicle", "Remove the vehicle..", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_ped", 1.0)
                FreezeEntityPosition(CurrentTow, false)
                Citizen.Wait(250)
                AttachEntityToEntity(CurrentTow, vehicle, 20, -0.0, -15.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                DetachEntity(CurrentTow, true, true)
                CurrentTow = nil
                PRPCore.Functions.Notify("Vehicle taken off!")
            end, function() -- Cancel
                StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_ped", 1.0)
                PRPCore.Functions.Notify("Failed!", "error")
            end)
        end
    else
        PRPCore.Functions.Notify("You must be in a towing vehicle first..", "error")
    end
end)




-----------------------------------
---------Simon Mechanic-----------
-----------------------------------
function SimonSetClosestPlate()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil
    for id,_ in pairs(Config.SimonPlates) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.SimonPlates[id].coords.x, Config.SimonPlates[id].coords.y, Config.SimonPlates[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Config.SimonPlates[id].coords.x, Config.SimonPlates[id].coords.y, Config.SimonPlates[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Config.SimonPlates[id].coords.x, Config.SimonPlates[id].coords.y, Config.SimonPlates[id].coords.z, true)
            current = id
        end
    end
    SimonClosestPlate = current
end

Citizen.CreateThread(function()
    while true do
        local inRange = false

        if isLoggedIn then
            if PlayerJob.name == "mechanic1" then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local StashDistance = GetDistanceBetweenCoords(pos, Config.Locations["stash1"].x, Config.Locations["stash1"].y, Config.Locations["stash1"].z, true)
                local OnDutyDistance = GetDistanceBetweenCoords(pos, Config.Locations["duty1"].x, Config.Locations["duty1"].y, Config.Locations["duty1"].z, true)
                local VehicleDistance = GetDistanceBetweenCoords(pos, Config.Locations["vehicle1"].x, Config.Locations["vehicle1"].y, Config.Locations["vehicle1"].z, true)

                if onDuty then
                    if StashDistance < 20 then
                        inRange = true
                        DrawMarker(2, Config.Locations["stash1"].x, Config.Locations["stash1"].y, Config.Locations["stash1"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                        if StashDistance < 1 then
                            DrawText3Ds(Config.Locations["stash1"].x, Config.Locations["stash1"].y, Config.Locations["stash1"].z, "[E] Stash open")
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("inventory:client:SetCurrentStash", "mechanic1stash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "mechanic1stash", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                            end
                        end
                    end
                end

                if onDuty then
                    if VehicleDistance < 20 then
                        inRange = true
                        DrawMarker(2, Config.Locations["vehicle1"].x, Config.Locations["vehicle1"].y, Config.Locations["vehicle1"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                        if VehicleDistance < 1 then
                            local InVehicle = IsPedInAnyVehicle(GetPlayerPed(-1))

                            if InVehicle then
                                DrawText3Ds(Config.Locations["vehicle1"].x, Config.Locations["vehicle1"].y, Config.Locations["vehicle1"].z, '[E] Hide the vehicle')
                                if IsControlJustPressed(0, 38) then
                                    DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                end
                            else
                                DrawText3Ds(Config.Locations["vehicle1"].x, Config.Locations["vehicle1"].y, Config.Locations["vehicle1"].z, '[E] Grab Vehicle')
                                if IsControlJustPressed(0, 38) then
                                    if IsControlJustPressed(0, 38) then
                                        SimonVehicleList()
                                        Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            end
                        end
                    end
                end

                --if OnDutyDistance < 20 then
                --    inRange = true
                --    DrawMarker(2, Config.Locations["duty1"].x, Config.Locations["duty1"].y, Config.Locations["duty1"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                --
                --    if OnDutyDistance < 1 then
                --        if onDuty then
                --            DrawText3Ds(Config.Locations["duty1"].x, Config.Locations["duty1"].y, Config.Locations["duty1"].z, "[E] Off Duty")
                --        else
                --            DrawText3Ds(Config.Locations["duty1"].x, Config.Locations["duty1"].y, Config.Locations["duty1"].z, "[E] On Duty")
                --        end
                --        if IsControlJustReleased(0, 38) then
                --            TriggerServerEvent("PRPCore:ToggleDuty")
                --        end
                --    end
                --end

                if onDuty then
                    for k, v in pairs(Config.SimonPlates) do
                        if v.AttachedVehicle == nil then
                            local PlateDistance = GetDistanceBetweenCoords(pos, v.coords.x, v.coords.y, v.coords.z)
                            if PlateDistance < 20 then
                                inRange = true
                                DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                                if PlateDistance < 2 then
                                    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                                        if not IsThisModelABicycle(GetEntityModel(veh)) then
                                            DrawText3Ds(v.coords.x, v.coords.y, v.coords.z + 0.3, "[E] Place the vehicle on the platform")
                                            if IsControlJustPressed(0, 38) then
                                                DoScreenFadeOut(150)
                                                Wait(150)
                                                Config.SimonPlates[SimonClosestPlate].AttachedVehicle = veh
                                                SetEntityCoords(veh, v.coords.x, v.coords.y, v.coords.z)
                                                SetEntityHeading(veh, v.coords.h)
                                                FreezeEntityPosition(veh, true)
                                                Wait(500)
                                                DoScreenFadeIn(250)
                                                TriggerServerEvent('prp-vehicletuning:server:SimonSetAttachedVehicle', veh, k)
                                            end
                                        else
                                            PRPCore.Functions.Notify("You cannot put bicycles on the plate!", "error")
                                        end
                                    end
                                end
                            end
                        else
                            local PlateDistance = GetDistanceBetweenCoords(pos, v.coords.x, v.coords.y, v.coords.z)
                            if PlateDistance < 3 then
                                inRange = true
                                DrawText3Ds(v.coords.x, v.coords.y, v.coords.z, "[E] Open Menu Options")
                                if IsControlJustPressed(0, 38) then
                                    SimonOpenMenu()
                                    Menu.hidden = not Menu.hidden
                                end
                                Menu.renderGUI()
                            end
                        end
                    end
                end

                if not inRange then
                    Citizen.Wait(1500)
                end
            else
                Citizen.Wait(1500)
            end
        else
            Citizen.Wait(1500)
        end

        Citizen.Wait(3)
    end
end)

function SimonOpenMenu()
    ClearMenu()
    Menu.addButton("Options", "SimonVehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function SimonVehicleList()
    ClearMenu()
    for k, v in pairs(Config.SimonVehicles) do
        Menu.addButton(v, "SimonSpawnListVehicle", k) 
    end
    Menu.addButton("Close Menu Menu", "CloseMenu", nil) 
end

function SimonSpawnListVehicle(model)
    local coords = {
        x = Config.Locations["vehicle1"].x,
        y = Config.Locations["vehicle1"].y,
        z = Config.Locations["vehicle1"].z,
        h = Config.Locations["vehicle1"].h,
    }
    local plate = "AC"..math.random(1111, 9999)
    PRPCore.Functions.SpawnVehicle(model, function(veh)
        SetVehicleNumberPlateText(veh, "ACBV"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        Menu.hidden = true
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

function SimonVehicleOptions()
    ClearMenu()
    Menu.addButton("Unattach Vehicle", "SimonUnattachVehicle", nil)
    -- Menu.addButton("Check Status", "CheckStatus", nil)
    Menu.addButton("Components", "SimonPartsMenu", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil)
end

function SimonPartsMenu()
    ClearMenu()
    local plate = GetVehicleNumberPlateText(Config.SimonPlates[SimonClosestPlate].AttachedVehicle)
    if VehicleStatus[plate] ~= nil then
        for k, v in pairs(Config.ValuesLabels) do
            if math.ceil(VehicleStatus[plate][k]) ~= Config.MaxStatusValues[k] then
                local percentage = math.ceil(VehicleStatus[plate][k])
                if percentage > 100 then
                    percentage = math.ceil(VehicleStatus[plate][k]) / 10
                end
                Menu.addButton(v..": "..percentage.."%", "SimonPartMenu", k) 
            else
                local percentage = math.ceil(Config.MaxStatusValues[k])
                if percentage > 100 then
                    percentage = math.ceil(Config.MaxStatusValues[k]) / 10
                end
                Menu.addButton(v..": "..percentage.."%", "SimonNoDamage", nil) 
            end
        end
    else
        for k, v in pairs(Config.ValuesLabels) do
            local percentage = math.ceil(Config.MaxStatusValues[k])
            if percentage > 100 then
                percentage = math.ceil(Config.MaxStatusValues[k]) / 10
            end
            Menu.addButton(v..": "..percentage.."%", "SimonNoDamage", nil) 
        end
    end
    Menu.addButton("Back", "SimonVehicleOptions", nil) 
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function SimonPartMenu(part)
    ClearMenu()
    Menu.addButton("Repair ("..PRPCore.Shared.Items[Config.RepairCostAmount[part].item]["label"].." "..Config.RepairCostAmount[part].costs.."x)", "SimonRepairPart", part)
    Menu.addButton("Back", "SimonVehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function SimonNoDamage(part)
    ClearMenu()
    Menu.addButton("There is no damage to this part!", "SimonPartsMenu", part)
    Menu.addButton("Back", "SimonVehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function SimonRepairPart(part)
    local plate = GetVehicleNumberPlateText(Config.SimonPlates[SimonClosestPlate].AttachedVehicle)
    local PartData = Config.RepairCostAmount[part]

    PRPCore.Functions.TriggerCallback('prp-inventory:server:GetStashItems', function(StashItems)
        if json.encode(StashItems) ~= "[]" then
            for k, v in pairs(StashItems) do
                if v.name == PartData.item then
                    if v.amount >= PartData.costs then
                        PRPCore.Functions.Progressbar("repair_part", Config.ValuesLabels[part].." Repairing", math.random(5000, 10000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            if (v.amount - PartData.costs) <= 0 then
                                StashItems[k] = nil
                            else
                                v.amount = (v.amount - PartData.costs)
                            end
                            TriggerEvent('prp-vehicletuning:client:SimonRepaireeePart', part)
                            TriggerServerEvent('prp-inventory:server:SaveStashItems', "mechanic1stash", StashItems)
                            SetTimeout(250, function()
                                SimonPartsMenu()
                            end)
                        end, function()
                            PRPCore.Functions.Notify("Repair Cancelled..", "error")
                        end)
                        break
                    else
                        PRPCore.Functions.Notify('There are not enough materials in the safe..', 'error')
                    end
                    break
                else
                    PRPCore.Functions.Notify('There are not enough materials in the safe..', 'error')
                end
            end
        else
            PRPCore.Functions.Notify('There are not enough materials in the safe..', 'error')
        end
    end, "mechanic1stash")
end

RegisterNetEvent('prp-vehicletuning:client:SimonRepaireeePart')
AddEventHandler('prp-vehicletuning:client:SimonRepaireeePart', function(part)
    local veh = Config.SimonPlates[SimonClosestPlate].AttachedVehicle
    local plate = GetVehicleNumberPlateText(veh)
    if part == "engine" then
        SetVehicleEngineHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", Config.MaxStatusValues[part])
    elseif part == "body" then
        local curEngine = GetVehicleEngineHealth(veh)
        Citizen.Wait(500)
        SetVehicleBodyHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", Config.MaxStatusValues[part])
        SetVehicleFixed(veh)
        SetVehicleEngineHealth(veh, curEngine)
    else
        TriggerServerEvent("vehiclemod:server:updatePart", plate, part, Config.MaxStatusValues[part])
    end
    PRPCore.Functions.Notify("The "..Config.ValuesLabels[part].." is repaired!")
end)

function SimonUnattachVehicle()
    local coords = Config.Locations["exit1"]
    DoScreenFadeOut(150)
    Wait(150)
    FreezeEntityPosition(Config.SimonPlates[SimonClosestPlate].AttachedVehicle, false)
    SetEntityCoords(Config.SimonPlates[SimonClosestPlate].AttachedVehicle, Config.SimonPlates[SimonClosestPlate].coords.x, Config.SimonPlates[SimonClosestPlate].coords.y, Config.SimonPlates[SimonClosestPlate].coords.z)
    SetEntityHeading(Config.SimonPlates[SimonClosestPlate].AttachedVehicle, Config.SimonPlates[SimonClosestPlate].coords.h)
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), Config.SimonPlates[SimonClosestPlate].AttachedVehicle, -1)
    Wait(500)
    DoScreenFadeIn(250)
    Config.SimonPlates[SimonClosestPlate].AttachedVehicle = nil
    TriggerServerEvent('prp-vehicletuning:server:SimonSetAttachedVehicle', false, SimonClosestPlate)
end

RegisterNetEvent('prp-vehicletuning:client:SimonSetAttachedVehicle')
AddEventHandler('prp-vehicletuning:client:SimonSetAttachedVehicle', function(veh, key)
    if veh ~= false then
        Config.SimonPlates[key].AttachedVehicle = veh
    else
        Config.SimonPlates[key].AttachedVehicle = nil
    end
end)

RegisterNetEvent('PRPCore:Client:SimonOnPlayerLoaded')
AddEventHandler('PRPCore:Client:SimonOnPlayerLoaded', function()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "mechanic1" then
                TriggerServerEvent("PRPCore:ToggleDuty")
            end
        end
    end)
    isLoggedIn = true
    PRPCore.Functions.TriggerCallback('prp-vehicletuning:server:SimonGetAttachedVehicle', function(plates)
        for k, v in pairs(plates) do
            Config.SimonPlates[k].AttachedVehicle = v.AttachedVehicle
        end
    end)

end)




-----------------------------------
---------Badu Mechanic-----------
-----------------------------------
function BaduSetClosestPlate()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil
    for id,_ in pairs(Config.BaduPlates) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.BaduPlates[id].coords.x, Config.BaduPlates[id].coords.y, Config.BaduPlates[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Config.BaduPlates[id].coords.x, Config.BaduPlates[id].coords.y, Config.BaduPlates[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Config.BaduPlates[id].coords.x, Config.BaduPlates[id].coords.y, Config.BaduPlates[id].coords.z, true)
            current = id
        end
    end
    BaduClosestPlate = current
end

Citizen.CreateThread(function()
    while true do
        local inRange = false

        if isLoggedIn then
            if PlayerJob.name == "mechanic2" then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local StashDistance = GetDistanceBetweenCoords(pos, Config.Locations["stash2"].x, Config.Locations["stash2"].y, Config.Locations["stash2"].z, true)
                local OnDutyDistance = GetDistanceBetweenCoords(pos, Config.Locations["duty2"].x, Config.Locations["duty2"].y, Config.Locations["duty2"].z, true)
                local VehicleDistance = GetDistanceBetweenCoords(pos, Config.Locations["vehicle2"].x, Config.Locations["vehicle2"].y, Config.Locations["vehicle2"].z, true)

                if onDuty then
                    if StashDistance < 20 then
                        inRange = true
                        DrawMarker(2, Config.Locations["stash2"].x, Config.Locations["stash2"].y, Config.Locations["stash2"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                        if StashDistance < 1 then
                            DrawText3Ds(Config.Locations["stash2"].x, Config.Locations["stash2"].y, Config.Locations["stash2"].z, "[E] Stash open")
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("inventory:client:SetCurrentStash", "mechanic2stash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "mechanic2stash", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                            end
                        end
                    end
                end

                if onDuty then
                    if VehicleDistance < 20 then
                        inRange = true
                        DrawMarker(2, Config.Locations["vehicle2"].x, Config.Locations["vehicle2"].y, Config.Locations["vehicle2"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                        if VehicleDistance < 1 then
                            local InVehicle = IsPedInAnyVehicle(GetPlayerPed(-1))

                            if InVehicle then
                                DrawText3Ds(Config.Locations["vehicle2"].x, Config.Locations["vehicle2"].y, Config.Locations["vehicle2"].z, '[E] Hide the vehicle')
                                if IsControlJustPressed(0, 38) then
                                    DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                end
                            else
                                DrawText3Ds(Config.Locations["vehicle2"].x, Config.Locations["vehicle2"].y, Config.Locations["vehicle2"].z, '[E] Grab Vehicle')
                                if IsControlJustPressed(0, 38) then
                                    if IsControlJustPressed(0, 38) then
                                        BaduVehicleList()
                                        Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            end
                        end
                    end
                end

                --if OnDutyDistance < 20 then
                --    inRange = true
                --    DrawMarker(2, Config.Locations["duty2"].x, Config.Locations["duty2"].y, Config.Locations["duty2"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                --
                --    if OnDutyDistance < 1 then
                --        if onDuty then
                --            DrawText3Ds(Config.Locations["duty2"].x, Config.Locations["duty2"].y, Config.Locations["duty2"].z, "[E] Off Duty")
                --        else
                --            DrawText3Ds(Config.Locations["duty2"].x, Config.Locations["duty2"].y, Config.Locations["duty2"].z, "[E] On Duty")
                --        end
                --        if IsControlJustReleased(0, 38) then
                --            TriggerServerEvent("PRPCore:ToggleDuty")
                --        end
                --    end
                --end

                if onDuty then
                    for k, v in pairs(Config.BaduPlates) do
                        if v.AttachedVehicle == nil then
                            local PlateDistance = GetDistanceBetweenCoords(pos, v.coords.x, v.coords.y, v.coords.z)
                            if PlateDistance < 20 then
                                inRange = true
                                DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                                if PlateDistance < 2 then
                                    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                                        if not IsThisModelABicycle(GetEntityModel(veh)) then
                                            DrawText3Ds(v.coords.x, v.coords.y, v.coords.z + 0.3, "[E] Place the vehicle on the platform")
                                            if IsControlJustPressed(0, 38) then
                                                DoScreenFadeOut(150)
                                                Wait(150)
                                                Config.BaduPlates[BaduClosestPlate].AttachedVehicle = veh
                                                SetEntityCoords(veh, v.coords.x, v.coords.y, v.coords.z)
                                                SetEntityHeading(veh, v.coords.h)
                                                FreezeEntityPosition(veh, true)
                                                Wait(500)
                                                DoScreenFadeIn(250)
                                                TriggerServerEvent('prp-vehicletuning:server:BaduSetAttachedVehicle', veh, k)
                                            end
                                        else
                                            PRPCore.Functions.Notify("You cannot put bicycles on the plate!", "error")
                                        end
                                    end
                                end
                            end
                        else
                            local PlateDistance = GetDistanceBetweenCoords(pos, v.coords.x, v.coords.y, v.coords.z)
                            if PlateDistance < 3 then
                                inRange = true
                                DrawText3Ds(v.coords.x, v.coords.y, v.coords.z, "[E] Open Menu Options")
                                if IsControlJustPressed(0, 38) then
                                    BaduOpenMenu()
                                    Menu.hidden = not Menu.hidden
                                end
                                Menu.renderGUI()
                            end
                        end
                    end
                end

                if not inRange then
                    Citizen.Wait(1500)
                end
            else
                Citizen.Wait(1500)
            end
        else
            Citizen.Wait(1500)
        end

        Citizen.Wait(3)
    end
end)

function BaduOpenMenu()
    ClearMenu()
    Menu.addButton("Options", "BaduVehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function BaduVehicleList()
    ClearMenu()
    for k, v in pairs(Config.BaduVehicles) do
        Menu.addButton(v, "BaduSpawnListVehicle", k) 
    end
    Menu.addButton("Close Menu Menu", "CloseMenu", nil) 
end

function BaduSpawnListVehicle(model)
    local coords = {
        x = Config.Locations["vehicle2"].x,
        y = Config.Locations["vehicle2"].y,
        z = Config.Locations["vehicle2"].z,
        h = Config.Locations["vehicle2"].h,
    }
    local plate = "AC"..math.random(1111, 9999)
    PRPCore.Functions.SpawnVehicle(model, function(veh)
        SetVehicleNumberPlateText(veh, "ACBV"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        Menu.hidden = true
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

function BaduVehicleOptions()
    ClearMenu()
    Menu.addButton("Unattach Vehicle", "BaduUnattachVehicle", nil)
    -- Menu.addButton("Check Status", "CheckStatus", nil)
    Menu.addButton("Components", "BaduPartsMenu", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil)
end

function BaduPartsMenu()
    ClearMenu()
    local plate = GetVehicleNumberPlateText(Config.BaduPlates[BaduClosestPlate].AttachedVehicle)
    if VehicleStatus[plate] ~= nil then
        for k, v in pairs(Config.ValuesLabels) do
            if math.ceil(VehicleStatus[plate][k]) ~= Config.MaxStatusValues[k] then
                local percentage = math.ceil(VehicleStatus[plate][k])
                if percentage > 100 then
                    percentage = math.ceil(VehicleStatus[plate][k]) / 10
                end
                Menu.addButton(v..": "..percentage.."%", "BaduPartMenu", k) 
            else
                local percentage = math.ceil(Config.MaxStatusValues[k])
                if percentage > 100 then
                    percentage = math.ceil(Config.MaxStatusValues[k]) / 10
                end
                Menu.addButton(v..": "..percentage.."%", "BaduNoDamage", nil) 
            end
        end
    else
        for k, v in pairs(Config.ValuesLabels) do
            local percentage = math.ceil(Config.MaxStatusValues[k])
            if percentage > 100 then
                percentage = math.ceil(Config.MaxStatusValues[k]) / 10
            end
            Menu.addButton(v..": "..percentage.."%", "BaduNoDamage", nil) 
        end
    end
    Menu.addButton("Back", "BaduVehicleOptions", nil) 
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function BaduPartMenu(part)
    ClearMenu()
    Menu.addButton("Repair ("..PRPCore.Shared.Items[Config.RepairCostAmount[part].item]["label"].." "..Config.RepairCostAmount[part].costs.."x)", "BaduRepairPart", part)
    Menu.addButton("Back", "BaduVehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function BaduNoDamage(part)
    ClearMenu()
    Menu.addButton("There is no damage to this part!", "BaduPartsMenu", part)
    Menu.addButton("Back", "BaduVehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function BaduRepairPart(part)
    local plate = GetVehicleNumberPlateText(Config.BaduPlates[BaduClosestPlate].AttachedVehicle)
    local PartData = Config.RepairCostAmount[part]

    PRPCore.Functions.TriggerCallback('prp-inventory:server:GetStashItems', function(StashItems)
        if json.encode(StashItems) ~= "[]" then
            for k, v in pairs(StashItems) do
                if v.name == PartData.item then
                    if v.amount >= PartData.costs then
                        PRPCore.Functions.Progressbar("repair_part", Config.ValuesLabels[part].." Repairing", math.random(5000, 10000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            if (v.amount - PartData.costs) <= 0 then
                                StashItems[k] = nil
                            else
                                v.amount = (v.amount - PartData.costs)
                            end
                            TriggerEvent('prp-vehicletuning:client:BaduRepaireeePart', part)
                            TriggerServerEvent('prp-inventory:server:SaveStashItems', "mechanic2stash", StashItems)
                            SetTimeout(250, function()
                                BaduPartsMenu()
                            end)
                        end, function()
                            PRPCore.Functions.Notify("Repair Cancelled..", "error")
                        end)
                        break
                    else
                        PRPCore.Functions.Notify('There are not enough materials in the safe..', 'error')
                    end
                    break
                else
                    PRPCore.Functions.Notify('There are not enough materials in the safe..', 'error')
                end
            end
        else
            PRPCore.Functions.Notify('There are not enough materials in the safe..', 'error')
        end
    end, "mechanic2stash")
end

RegisterNetEvent('prp-vehicletuning:client:BaduRepaireeePart')
AddEventHandler('prp-vehicletuning:client:BaduRepaireeePart', function(part)
    local veh = Config.BaduPlates[BaduClosestPlate].AttachedVehicle
    local plate = GetVehicleNumberPlateText(veh)
    if part == "engine" then
        SetVehicleEngineHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", Config.MaxStatusValues[part])
    elseif part == "body" then
        local curEngine = GetVehicleEngineHealth(veh)
        Citizen.Wait(500)
        SetVehicleBodyHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", Config.MaxStatusValues[part])
        SetVehicleFixed(veh)
        SetVehicleEngineHealth(veh, curEngine)
    else
        TriggerServerEvent("vehiclemod:server:updatePart", plate, part, Config.MaxStatusValues[part])
    end
    PRPCore.Functions.Notify("The "..Config.ValuesLabels[part].." is repaired!")
end)

function BaduUnattachVehicle()
    local coords = Config.Locations["exit2"]
    DoScreenFadeOut(150)
    Wait(150)
    FreezeEntityPosition(Config.BaduPlates[BaduClosestPlate].AttachedVehicle, false)
    SetEntityCoords(Config.BaduPlates[BaduClosestPlate].AttachedVehicle, Config.BaduPlates[BaduClosestPlate].coords.x, Config.BaduPlates[BaduClosestPlate].coords.y, Config.BaduPlates[BaduClosestPlate].coords.z)
    SetEntityHeading(Config.BaduPlates[BaduClosestPlate].AttachedVehicle, Config.BaduPlates[BaduClosestPlate].coords.h)
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), Config.BaduPlates[BaduClosestPlate].AttachedVehicle, -1)
    Wait(500)
    DoScreenFadeIn(250)
    Config.BaduPlates[BaduClosestPlate].AttachedVehicle = nil
    TriggerServerEvent('prp-vehicletuning:server:BaduSetAttachedVehicle', false, BaduClosestPlate)
end

RegisterNetEvent('prp-vehicletuning:client:BaduSetAttachedVehicle')
AddEventHandler('prp-vehicletuning:client:BaduSetAttachedVehicle', function(veh, key)
    if veh ~= false then
        Config.BaduPlates[key].AttachedVehicle = veh
    else
        Config.BaduPlates[key].AttachedVehicle = nil
    end
end)

RegisterNetEvent('PRPCore:Client:BaduOnPlayerLoaded')
AddEventHandler('PRPCore:Client:BaduOnPlayerLoaded', function()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "mechanic2" then
                TriggerServerEvent("PRPCore:ToggleDuty")
            end
        end
    end)
    isLoggedIn = true
    PRPCore.Functions.TriggerCallback('prp-vehicletuning:server:BaduGetAttachedVehicle', function(plates)
        for k, v in pairs(plates) do
            Config.BaduPlates[k].AttachedVehicle = v.AttachedVehicle
        end
    end)

end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        isLoggedIn = true
        if isLoggedIn then
            if PlayerJob.name == "bennys" then
                local player = GetPlayerPed(-1)
                local pos = GetEntityCoords(player)
                for k, v in pairs(Config.ShopLocations["mechanicshop"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) and PlayerJob.grade.level > 0 then
                        if (v.requiresOnDuty and onDuty) or not v.requiresOnDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                DrawText3Ds(v.x, v.y, v.z, "~g~E~w~ - Part Shop")
                                if IsControlJustReleased(0, 38) then
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "mechanicshop", Config.Items)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3Ds(v.x, v.y, v.z, "Part Shop")
                            end  
                        end
                    end
                end
            end
        end
    end
end)


