local NitrousActivated = false
local NitrousBoost = 40.0
local ScreenEffect = false
local NosFlames = nil
VehicleNitrous = {}
Fxs = {}

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
end)

RegisterNetEvent('smallresource:client:LoadNitrous')
AddEventHandler('smallresource:client:LoadNitrous', function()
    local IsInVehicle = IsPedInAnyVehicle(GetPlayerPed(-1))
    local ped = GetPlayerPed(-1)

    if not NitrousActivated then
        if IsInVehicle and not IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(ped))) then
            local veh = GetVehiclePedIsIn(ped)
            local plate = GetVehicleNumberPlateText(veh)
            local speed = GetEntitySpeed(veh)
            local mph = (speed * 2.236936);

            if mph <= 1 then
                PRPCore.Functions.TriggerCallback('prp-temple:server:GetPlateParts', function(result)
                    if result ~= nil then
                        if result.nitrous_kit == 1 then
                            PRPCore.Functions.Progressbar("use_nos", "Connecting NOS tank..", 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                TriggerEvent("inventory:client:ItemBox", PRPCore.Shared.Items['nitrous'], "remove")
                                TriggerServerEvent("PRPCore:Server:RemoveItem", 'nitrous', 1)
                                local CurrentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
                                local Plate = GetVehicleNumberPlateText(CurrentVehicle)
                                TriggerServerEvent('nitrous:server:LoadNitrous', Plate)
                            end)
                        else
                            PRPCore.Functions.Notify('This car does not have a Nitrous Kit Installed..')
                        end
                    else
                        PRPCore.Functions.Notify('This car does not have a Nitrous Kit Installed..')
                    end
                end, plate)
            else
                PRPCore.Functions.Notify('Vehicle must be stationary..', 'error')
            end
        else
            PRPCore.Functions.Notify('You are not in a car..', 'error')
        end
    else
        PRPCore.Functions.Notify('You already have NOS active..', 'error')
    end
end)

local nosupdated = false

Citizen.CreateThread(function()
    while true do
        local IsInVehicle = IsPedInAnyVehicle(GetPlayerPed(-1))
        local CurrentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
        if IsInVehicle then
            local Plate = GetVehicleNumberPlateText(CurrentVehicle)
            if VehicleNitrous[Plate] ~= nil then
                if VehicleNitrous[Plate].hasnitro then
                    if IsControlJustPressed(0, 36) then
                        local speed = GetEntitySpeed(CurrentVehicle)
                        local mph = (speed * 2.23694);
                        if mph <= 250 then
                            SetVehicleEngineTorqueMultiplier(CurrentVehicle, NitrousBoost)
                            NitrousActivated = true

                            Citizen.CreateThread(function()
                                while NitrousActivated do
                                    if VehicleNitrous[Plate].level - 1 ~= 0 then
                                        TriggerServerEvent('nitrous:server:UpdateNitroLevel', Plate, (VehicleNitrous[Plate].level - 1))
                                        TriggerEvent('prp-hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, true)
                                    else
                                        TriggerServerEvent('nitrous:server:UnloadNitrous', Plate)
                                        NitrousActivated = false
                                        SetVehicleBoostActive(CurrentVehicle, 0)
                                        SetVehicleEngineTorqueMultiplier(CurrentVehicle, 1.0)
                                        StopScreenEffect("RaceTurbo")
                                        ScreenEffect = false
                                        for index,_ in pairs(Fxs) do
                                            StopParticleFxLooped(Fxs[index], 1)
                                            TriggerServerEvent('nitrous:server:StopSync', GetVehicleNumberPlateText(CurrentVehicle))
                                            Fxs[index] = nil
                                        end
                                    end
                                    Citizen.Wait(100)
                                end
                            end)
                        else
                            PRPCore.Functions.Notify('Vehicle is running too hot for NOS... Using NOS over 250mph is not Recommended.', 'error', 3500)
                        end
                    end

                    if IsControlJustReleased(0, Keys["LEFTCTRL"]) then
                        if NitrousActivated or not NitrousActivated then
                            local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                            SetVehicleBoostActive(veh, 0)
                            SetVehicleEngineTorqueMultiplier(veh, 1.0)
                            for index,_ in pairs(Fxs) do
                                StopParticleFxLooped(Fxs[index], 1)
                                TriggerServerEvent('nitrous:server:StopSync', GetVehicleNumberPlateText(veh))
                                Fxs[index] = nil
                            end
                            StopScreenEffect("RaceTurbo")
                            TriggerEvent('prp-hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, false)
                            NitrousActivated = false
                        end
                    end
                end
            else
                if not nosupdated then
                    TriggerEvent('prp-hud:client:UpdateNitrous', false, nil, false)
                    nosupdated = true
                end
            end
        else
            if nosupdated then
                nosupdated = false
            end
            Citizen.Wait(1500)
        end
        Citizen.Wait(3)
    end
end)

p_flame_location = {
	"exhaust",
	"exhaust_2",
	"exhaust_3",
	"exhaust_4",
	"exhaust_5",
	"exhaust_6",
	"exhaust_7",
	"exhaust_8",
	"exhaust_9",
	"exhaust_10",
	"exhaust_11",
	"exhaust_12",
	"exhaust_13",
	"exhaust_14",
	"exhaust_15",
	"exhaust_16",
}

local bonesindex = {
    "chassis",
    "windscreen",
    "seat_pside_r",
    "seat_dside_r",
    "bodyshell",
    "suspension_lm",
    "suspension_lr",
    "platelight",
    "attach_female",
    "attach_male",
    "bonnet",
    "boot",
    "chassis_dummy",
    "chassis_Control",
    "door_dside_f",
    "door_dside_r",
    "door_pside_f",
    "door_pside_r",
    "Gun_GripR",
    "windscreen_f",
    "platelight",
    "VFX_Emitter",
    "window_lf",
    "window_lr",
    "window_rf",
    "window_rr",
    "engine",
    "gun_ammo",
    "ROPE_ATTATCH",
    "wheel_lf",
    "wheel_lr",
    "wheel_rf",
    "wheel_rr",
    "exhaust",
    "overheat",
    "misc_e",
    "seat_dside_f",
    "seat_pside_f",
    "Gun_Nuzzle",
    "seat_r",
}

ParticleDict = "veh_xs_vehicle_mods"
ParticleFx = "veh_nitrous"
ParticleSize = 1.4

Citizen.CreateThread(function()
    while true do
        if NitrousActivated then
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
            TriggerServerEvent('nitrous:server:SyncFlames', VehToNet(veh))
            SetVehicleBoostActive(veh, 1)
            StartScreenEffect("RaceTurbo", 0.0, 0)

            for _,bones in pairs(p_flame_location) do
                if GetEntityBoneIndexByName(veh, bones) ~= -1 then
                    if Fxs[bones] == nil then
                        RequestNamedPtfxAsset(ParticleDict)
                        while not HasNamedPtfxAssetLoaded(ParticleDict) do
                            Citizen.Wait(0)
                        end
                        SetPtfxAssetNextCall(ParticleDict)
                        UseParticleFxAssetNextCall(ParticleDict)
                        Fxs[bones] = StartParticleFxLoopedOnEntityBone(ParticleFx, veh, 0.0, -0.02, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(veh, bones), ParticleSize, 0.0, 0.0, 0.0)
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

local NOSPFX = {}

RegisterNetEvent('nitrous:client:SyncFlames')
AddEventHandler('nitrous:client:SyncFlames', function(netid, nosid)
    local veh = NetToVeh(netid)
    local myid = GetPlayerServerId(PlayerId())
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        if veh ~= nil then
            if NOSPFX[GetVehicleNumberPlateText(veh)] == nil then
                NOSPFX[GetVehicleNumberPlateText(veh)] = {}
            end
        elseif NetToVeh(netid) ~= nil then
            if NOSPFX[GetVehicleNumberPlateText(veh)] == nil then
                NOSPFX[GetVehicleNumberPlateText(veh)] = {}
            end
        else
            return
        end
        if myid ~= nosid then
            for _,bones in pairs(p_flame_location) do
                if NOSPFX[GetVehicleNumberPlateText(veh)][bones] == nil then
                    NOSPFX[GetVehicleNumberPlateText(veh)][bones] = {}
                end
                if GetEntityBoneIndexByName(veh, bones) ~= -1 then
                    if NOSPFX[GetVehicleNumberPlateText(veh)][bones].pfx == nil then
                        RequestNamedPtfxAsset(ParticleDict)
                        while not HasNamedPtfxAssetLoaded(ParticleDict) do
                            Citizen.Wait(0)
                        end
                        SetPtfxAssetNextCall(ParticleDict)
                        UseParticleFxAssetNextCall(ParticleDict)
                        NOSPFX[GetVehicleNumberPlateText(veh)][bones].pfx = StartParticleFxLoopedOnEntityBone(ParticleFx, veh, 0.0, -0.05, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(veh, bones), ParticleSize, 0.0, 0.0, 0.0)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('nitrous:client:StopSync')
AddEventHandler('nitrous:client:StopSync', function(plate)
    if NOSPFX[plate] ~= nil then
        for k, v in pairs(NOSPFX[plate]) do
            StopParticleFxLooped(v.pfx, 1)
            NOSPFX[plate][k].pfx = nil
        end
    end
end)

RegisterNetEvent('nitrous:client:UpdateNitroLevel')
AddEventHandler('nitrous:client:UpdateNitroLevel', function(Plate, level)
    VehicleNitrous[Plate].level = level
end)

RegisterNetEvent('nitrous:client:LoadNitrous')
AddEventHandler('nitrous:client:LoadNitrous', function(Plate)
    VehicleNitrous[Plate] = {
        hasnitro = true,
        level = 100,
    }
    local IsInVehicle = IsPedInAnyVehicle(GetPlayerPed(-1))
    local CurrentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    local CPlate = GetVehicleNumberPlateText(CurrentVehicle)
    if CPlate == Plate then
        TriggerEvent('prp-hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, false)
    end
end)

RegisterNetEvent('nitrous:client:UnloadNitrous')
AddEventHandler('nitrous:client:UnloadNitrous', function(Plate)
    VehicleNitrous[Plate] = nil
    
    local CurrentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    local CPlate = GetVehicleNumberPlateText(CurrentVehicle)
    if CPlate == Plate then
        NitrousActivated = false
        TriggerEvent('prp-hud:client:UpdateNitrous', false, nil, false)
    end
end)