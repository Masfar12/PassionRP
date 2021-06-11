Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

local TunedVehicles = {}
local inTuner = false

function setVehData(veh,data)
    local plate = GetVehicleNumberPlateText(veh)

    TunedVehicles[plate] = {
        ["drForce"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveForce"),
        ["drCoeff"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDragCoeff"),
        ["drInertia"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fDriveInertia"),
        ["tracLoss"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fLowSpeedTractionLossMult"),
        ["clutchUp"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fClutchChangeRateScaleUpShift"),
        ["clutchDwn"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fClutchChangeRateScaleDownShift"),
        ["brkBias"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeBiasFront"),
        ["drBias"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront"),
        ["brkForce"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeForce"),
        ["flatVel"] = GetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel")
    }
    TriggerServerEvent('prp-tunerchip:server:UpdateTunedVehicles', TunedVehicles)

    local orgVal = TunedVehicles[plate]

    local multp = 0.017                                                                     --When multiplied by slider data.[value] this produces a float of 0.25 when the slider is at it's max of 9.

    local setDrForce = orgVal["drForce"] * (1 + (data.boost * multp))                       --sliderValue multiplied by var(multp) to produce a decimal float to represent a percentage.
    local setDrCoeff = orgVal["drCoeff"] - (data.boost * 0.06)                              --sliderValue multiplied by 0.06 to produce a decimal float between 0.1 and 0.5           
    local setInertia = orgVal["drInertia"] * (1 + (data.acceleration * multp))              --sliderValue multiplied by var(multp) to produce a decimal float to represent a percentage.
    local setTrLoss = orgVal["tracLoss"] - (data.acceleration * 0.04)                       --sliderValue multiplied by 0.06 to produce a decimal float between 0.1 and 0.5           
    local setClutchUp = orgVal["clutchUp"] * (1 + (data.gearchange * multp))                --sliderValue multiplied by var(multp) to produce a decimal float to represent a percentage.
    local setClutchDwn = orgVal["clutchDwn"] * (1 + (data.gearchange * multp))              --sliderValue multiplied by var(multp) to produce a decimal float to represent a percentage.     
    local setBrkBi = data.breaking * 0.1                                                    --sliderValue multiplied by 0.1 to produce a decimal float between 0 and 1
    local setDrBi = data.drivetrain * 0.1                                                   --sliderValue multiplied by 0.1 to produce a decimal float between 0 and 1
    local setBrkForce = orgVal["brkForce"] + 0.2                                            --sliderValue multiplied by 0.1 to produce a decimal float between 0 and 1
    local setFlatVel = orgVal["flatVel"] + 2


    if tonumber(data.boost) == 1 then 
        setDrForce = orgVal["drForce"] 
        setDrCoeff = orgVal["drCoeff"] 
    end
    if tonumber(data.acceleration) == 1 then 
        setInertia = orgVal["drInertia"] 
        setTrLoss = orgVal["tracLoss"] 
    end
    if tonumber(data.gearchange) == 1 then 
        setClutchUp = orgVal["clutchUp"]
        setClutchDwn = orgVal["clutchDwn"] 
    end  
    if tonumber(data.breaking) == 9 then 
        setBrkBi = 1.0
    elseif tonumber(data.breaking) == 1 then
        setBrkBi = orgVal["brkBias"] 
    elseif tonumber(data.breaking) == 2 then 
        setBrkBi = 0.0 
    end
    if tonumber(data.drivetrain) == 9 then 
        setDrBi = 1.0
    elseif tonumber(data.drivetrain) == 1 then
        setDrBi = orgVal["drBias"] 
    elseif tonumber(data.drivetrain) == 2 then 
        setDrBi = 0.0 
    end
    
    if not DoesEntityExist(veh) or not data then 
        return nil 
    end
    
    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveForce", setDrForce)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDragCoeff", setDrCoeff)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveInertia", setInertia)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fLowSpeedTractionLossMult", setTrLoss)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fClutchChangeRateScaleUpShift", setClutchUp)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fClutchChangeRateScaleDownShift", setClutchDwn)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeBiasFront", setBrkBi)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront", setDrBi)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeForce", setBrkForce)
    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel", setFlatVel)
end

function resetVeh(veh)
    local plate = GetVehicleNumberPlateText(veh)
    orgVal = TunedVehicles[plate]
    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveForce", orgVal["drForce"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDragCoeff", orgVal["drCoeff"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveInertia", orgVal["drInertia"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fLowSpeedTractionLossMult", orgVal["tracLoss"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fClutchChangeRateScaleUpShift", orgVal["clutchUp"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fClutchChangeRateScaleDownShift", orgVal["clutchDwn"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeBiasFront", orgVal["brkBias"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront", orgVal["drBias"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeForce", orgVal["brkForce"])
    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel", orgVal["flatVel"])
    TunedVehicles[plate] = nil
    TriggerServerEvent('prp-tunerchip:server:UpdateTunedVehicles', TunedVehicles)
end

RegisterNUICallback('save', function(data)
    PRPCore.Functions.TriggerCallback('prp-tunerchip:server:HasChip', function(HasChip)
        if HasChip then
            local ped = GetPlayerPed(-1)
            local veh = GetVehiclePedIsUsing(ped)
            local plate = GetVehicleNumberPlateText(veh)
            if veh ~= nil then
                PRPCore.Functions.TriggerCallback('prp-tunerchip:server:GetTunedVehicles', function(result)
                    if result ~= nil then
                        TunedVehicles = result
                    else
                        TunedVehicles = {}
                    end
                    if TunedVehicles[plate] then
                        PRPCore.Functions.Notify('TunerChip v1.10: Vehicle has already been Tuned!', 'error')
                    else
                        setVehData(veh, data)
                        PRPCore.Functions.Notify('TunerChip v1.10: Vehicle has been Tuned!', 'success')
                        TriggerServerEvent('prp-tunerchip:server:TuneStatus', GetVehicleNumberPlateText(veh), true)
                    end
                end)
            end
        end
    end)
end)

RegisterNetEvent('prp-tunerchip:server:TuneStatus')
AddEventHandler('prp-tunerchip:server:TuneStatus', function()
    local ped = GetPlayerPed(-1)
    local closestVehicle = GetClosestVehicle(GetEntityCoords(ped), 5.0, 0, 70)
    local plate = GetVehicleNumberPlateText(closestVehicle)
    local vehModel = GetEntityModel(closestVehicle)

    local displayName = GetLabelText(GetDisplayNameFromVehicleModel(vehModel))

    PRPCore.Functions.TriggerCallback('prp-tunerchip:server:GetStatus', function(status)
        if status then
            TriggerEvent("chatMessage", "VEHICLE STATUS", "warning", displayName..": Chip Tuned: Yes")
        else
            TriggerEvent("chatMessage", "VEHICLE STATUS", "warning", displayName..": Chip Tuned: No")
        end
    end, plate)
end)

RegisterNUICallback('checkItem', function(data, cb)
    local retval = false
    PRPCore.Functions.TriggerCallback('PRPCore:HasItem', function(result)
        if result then
            retval = true
        end
        cb(retval)
    end, data.item)
end)

RegisterNUICallback('reset', function(data)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local plate = GetVehicleNumberPlateText(veh)
    PRPCore.Functions.TriggerCallback('prp-tunerchip:server:GetTunedVehicles', function(result)
        if result ~= nil then
            TunedVehicles = result
        else
            TunedVehicles = {}
        end
        if TunedVehicles[plate] then
            resetVeh(veh)
            PRPCore.Functions.Notify('TunerChip v1.10: Vehicle has been reset!', 'success')
        else
            PRPCore.Functions.Notify('TunerChip v1.10: Vehicle does not have a tune to reset!', 'error')
        end
    end)
end)

RegisterNetEvent('prp-tunerchip:client:openChip')
AddEventHandler('prp-tunerchip:client:openChip', function()
    local ped = GetPlayerPed(-1)
    local inVehicle = IsPedInAnyVehicle(ped) and not IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(ped)))
    local inBike = IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(ped)))

    if inVehicle then
        PRPCore.Functions.Progressbar("connect_laptop", "Connecting tuner chip...", 2000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            anim = "machinic_loop_mechandplayer",
            flags = 16,
        }, {}, {}, function() -- Done
            StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            openTunerLaptop(true)
        end, function() -- Cancel
            StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            PRPCore.Functions.Notify("Canceled..", "error")
        end)
    else
        if inBike then
            PRPCore.Functions.Notify("TunerChip v1.10 is not equipt to tune Motorcycles", "error")
        else
            PRPCore.Functions.Notify("You are not in a vehicle..", "error")
        end
    end
end)

RegisterNUICallback('exit', function()
    openTunerLaptop(false)
    SetNuiFocus(false, false)
    inTuner = false
end)

RegisterNUICallback('saveNeon', function(data)
    PRPCore.Functions.TriggerCallback('prp-tunerchip:server:HasChip', function(HasChip)
        if HasChip then
            local ped = GetPlayerPed(-1)
            local veh = GetVehiclePedIsIn(ped)

            if tonumber(data.neonEnabled) == 1 then
                SetVehicleNeonLightEnabled(veh, 0, true)
                SetVehicleNeonLightEnabled(veh, 1, true)
                SetVehicleNeonLightEnabled(veh, 2, true)
                SetVehicleNeonLightEnabled(veh, 3, true)
                if tonumber(data.r) ~= nil and tonumber(data.g) ~= nil and tonumber(data.b) ~= nil then
                    SetVehicleNeonLightsColour(veh, tonumber(data.r), tonumber(data.g), tonumber(data.b))
                else
                    SetVehicleNeonLightsColour(veh, 255, 255, 255)
                end
                PRPCore.Functions.Notify("Neons are ON..", "success")
            else
                SetVehicleNeonLightEnabled(veh, 0, false)
                SetVehicleNeonLightEnabled(veh, 1, false)
                SetVehicleNeonLightEnabled(veh, 2, false)
                SetVehicleNeonLightEnabled(veh, 3, false)
                PRPCore.Functions.Notify("Neons are OFF..", "error")
            end
        end
    end)
end)

RegisterNUICallback('saveHeadlights', function(data)
    PRPCore.Functions.TriggerCallback('prp-tunerchip:server:HasChip', function(HasChip)
        if HasChip then
            local ped = GetPlayerPed(-1)
            local veh = GetVehiclePedIsIn(ped)
            local value = tonumber(data.value)
            if IsToggleModOn(veh, 22) == 1 then
                if tonumber(data.headLightEnabled) == 1 then
                    ToggleVehicleMod(veh, 22, true)
                    SetVehicleHeadlightsColour(veh, value)
                    PRPCore.Functions.Notify("Headlight Color Changed!...(remove contact lenses - if the color hasnt changed)", "success")
                else
                    ToggleVehicleMod(veh, 22, true)
                    SetVehicleHeadlightsColour(veh, -1)
                    PRPCore.Functions.Notify("Headlight Coloring is now OFF..", "error")
                end
            else
                PRPCore.Functions.Notify("You need Xenon Headlights..", "error")
            end 
        end
    end)
end)

function openTunerLaptop(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool
    })
    inTuner = bool
end