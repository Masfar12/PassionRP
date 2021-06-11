local Keys = {
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

local HasKey = false
local LastVehicle = nil
local IsHotwiring = false
local IsRobbing = false
local isLoggedIn = true

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), true), -1) == GetPlayerPed(-1) and PRPCore ~= nil then
            local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true))
            if LastVehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                PRPCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
                    if result then
                        HasKey = true
                        SetVehicleEngineOn(veh, true, false, true)
                    else
                        HasKey = false
                        SetVehicleEngineOn(veh, false, false, true)
                    end
                    LastVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                end, plate)
            end
        end

        if not HasKey and IsPedInAnyVehicle(GetPlayerPed(-1), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1) and PRPCore ~= nil and not IsHotwiring then
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            SetVehicleEngineOn(veh, false, false, true)
            --[[local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local vehpos = GetOffsetFromEntityInWorldCoords(veh, 0, 1.5, 0.5)
            PRPCore.Functions.DrawText3D(vehpos.x, vehpos.y, vehpos.z, "~g~H~w~ - Hotwire")
            SetVehicleEngineOn(veh, false, false, true)

            if IsControlJustPressed(0, Keys["H"]) then
                Hotwire()
            end]]--
        end

        if IsControlJustPressed(1, 182) then
            LockVehicle()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        if not IsRobbing and isLoggedIn and PRPCore ~= nil then
            if GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)) ~= nil and GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)) ~= 0 then
                local vehicle = GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))
                local driver = GetPedInVehicleSeat(vehicle, -1)
                if driver ~= 0 and not IsPedAPlayer(driver) then
                    --if IsEntityDead(driver) then
                        IsRobbing = true
                        PRPCore.Functions.Progressbar("rob_keys", "Grabbing keys..", 3000, false, false, {}, {}, {}, {}, function() -- Done
                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
                            HasKey = true
                            IsRobbing = false
                        end)
                    --end
                end
            end

            --[[if PRPCore.Functions.GetPlayerData().job.name ~= "police" then
                local aiming, target = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if aiming and (target ~= nil and target ~= 0) then
                    if DoesEntityExist(target) and not IsPedAPlayer(target) then
                        if IsPedInAnyVehicle(target, false) and not IsPedInAnyVehicle(GetPlayerPed(-1), false ) then
                            if not IsBlacklistedWeapon() then
                                local pos = GetEntityCoords(GetPlayerPed(-1), true)
                                local targetpos = GetEntityCoords(target, true)
                                local vehicle = GetVehiclePedIsIn(target, true)
                                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, targetpos.x, targetpos.y, targetpos.z, true) < 13.0 then
                                    RobVehicle(target)
                                end
                            end
                        end
                    end
                end
            end]]--
        end
    end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('vehiclekeys:client:SetOwner')
AddEventHandler('vehiclekeys:client:SetOwner', function(plate)
    local VehPlate = plate

    if VehPlate == nil then
        VehPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true))
    end

    TriggerServerEvent('vehiclekeys:server:SetVehicleOwner', VehPlate)
    if IsPedInAnyVehicle(GetPlayerPed(-1)) and plate == GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true)) then
        SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), true), true, false, true)
    end
    HasKey = true
    --PRPCore.Functions.Notify('You have receieved the keys to the vehicle', 'success', 3500)
end)

RegisterNetEvent('vehiclekeys:client:SetEventOwner')
AddEventHandler('vehiclekeys:client:SetEventOwner', function(plate)
    local VehPlate = plate
    if VehPlate == nil then
        VehPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true))
    end
    print(VehPlate)
    TriggerServerEvent('vehiclekeys:server:SetEventOwner', VehPlate)
    if IsPedInAnyVehicle(GetPlayerPed(-1)) and VehPlate == GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true)) then
        SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), true), true, false, true)
    end
    HasKey = true
    --PRPCore.Functions.Notify('You have receieved the keys to the vehicle', 'success', 3500)
end)

function GetClosestPlayer()
    local closestPlayers = PRPCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

RegisterNetEvent('vehiclekeys:client:GiveKeys')
AddEventHandler('vehiclekeys:client:GiveKeys', function(target)
    if target and type(target) ~= "table" then
        local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true))
        TriggerServerEvent('vehiclekeys:server:GiveVehicleKeys', plate, target)
    else
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 2.5 then
            targetgiven = GetPlayerServerId(player)
            local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true))
            print("giving keys")
            TriggerServerEvent('vehiclekeys:server:GiveVehicleKeys', plate, targetgiven)
        end
    end
end)

RegisterNetEvent('vehiclekeys:client:ToggleEngine')
AddEventHandler('vehiclekeys:client:ToggleEngine', function()
    local EngineOn = IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1)))
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
    if HasKey then
        if EngineOn then
            SetVehicleEngineOn(veh, false, false, true)
        else
            SetVehicleEngineOn(veh, true, false, true)
        end
    end
end)

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function(isAdvanced)
    if (IsPedInAnyVehicle(GetPlayerPed(-1))) then
        if not HasKey then
            LockpickIgnition(isAdvanced)
        end
    else
        LockpickDoor(isAdvanced)
    end
end)

function RobVehicle(target)
    IsRobbing = true
    Citizen.CreateThread(function()
        while IsRobbing do
            local RandWait = math.random(30000, 60000)
            loadAnimDict("random@mugging3")

            TaskLeaveVehicle(target, GetVehiclePedIsIn(target, true), 256)
            Citizen.Wait(1000)
            ClearPedTasksImmediately(target)

            TaskStandStill(target, RandWait)
            TaskHandsUp(target, RandWait, GetPlayerPed(-1), 0, false)

            Citizen.Wait(RandWait)

            --TaskReactAndFleePed(target, GetPlayerPed(-1))
            IsRobbing = false
        end
    end)
end
RegisterNetEvent('prp-vehiclekeys:LockVehicle')
AddEventHandler('prp-vehiclekeys:LockVehicle', function(veh)
    --local veh = PRPCore.Functions.GetClosestVehicle()
    --local coordA = GetEntityCoords(GetPlayerPed(-1), true)
    --local coordB = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 255.0, 0.0)
    --local veh = GetClosestVehicleInDirection(coordA, coordB)
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    --local veh = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 70)
    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    end
    local vehpos = GetEntityCoords(veh, false)
    if veh ~= nil and GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 10 then
        if HasKey then
            local vehLockStatus = GetVehicleDoorLockStatus(veh)
            loadAnimDict("anim@mp_player_intmenu@key_fob@")
            TaskPlayAnim(GetPlayerPed(-1), 'anim@mp_player_intmenu@key_fob@', 'fob_click_fp' ,3.0, 3.0, -1, 49, 0, false, false, false)

            if vehLockStatus == 1 then
                Citizen.Wait(750)
                ClearPedTasks(GetPlayerPed(-1))
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 6, "lock", 0.5)
                SetVehicleDoorsLocked(veh, 2)
                if(GetVehicleDoorLockStatus(veh) == 2)then
                    PRPCore.Functions.Notify("Vehicle Locked!")
                else
                    PRPCore.Functions.Notify("Something went wrong with locking the vehicle!")
                end
            else
                Citizen.Wait(750)
                ClearPedTasks(GetPlayerPed(-1))
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 6, "unlock", 0.5)
                SetVehicleDoorsLocked(veh, 1)
                if(GetVehicleDoorLockStatus(veh) == 1)then
                    PRPCore.Functions.Notify("Vehicle Unlocked!")
                else
                    PRPCore.Functions.Notify("Something went wrong with locking the vheicle!")
                end
            end

            if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                SetVehicleInteriorlight(veh, true)
                SetVehicleIndicatorLights(veh, 0, true)
                SetVehicleIndicatorLights(veh, 1, true)
                Citizen.Wait(450)
                SetVehicleIndicatorLights(veh, 0, false)
                SetVehicleIndicatorLights(veh, 1, false)
                Citizen.Wait(450)
                SetVehicleInteriorlight(veh, true)
                SetVehicleIndicatorLights(veh, 0, true)
                SetVehicleIndicatorLights(veh, 1, true)
                Citizen.Wait(450)
                SetVehicleInteriorlight(veh, false)
                SetVehicleIndicatorLights(veh, 0, false)
                SetVehicleIndicatorLights(veh, 1, false)
                Citizen.Wait(100)
                SetVehicleLights(veh, 2)
                Citizen.Wait(200)
                SetVehicleLights(veh, 1)
                Citizen.Wait(200)
                SetVehicleLights(veh, 2)
                Citizen.Wait(200)
                SetVehicleLights(veh, 1)
                Citizen.Wait(200)
                SetVehicleLights(veh, 2)
                Citizen.Wait(200)
                SetVehicleLights(veh, 0)
                Wait(500)
                SetVehicleDoorShut(veh, 0, false)
                SetVehicleDoorShut(veh, 1, false)
                SetVehicleDoorShut(veh, 2, false)
                SetVehicleDoorShut(veh, 3, false)
                -- SetVehicleDoorsLocked(veh, 2)
                PlayVehicleDoorCloseSound(veh, 1)
                SetVehicleEngineOn(veh,false,true,false)
            end
        end
    end
end)

function LockVehicle()
    local veh = PRPCore.Functions.GetClosestVehicle()
    local coordA = GetEntityCoords(GetPlayerPed(-1), true)
    local coordB = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 255.0, 0.0)
    local veh = GetClosestVehicleInDirection(coordA, coordB)
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    --local veh = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 70)
    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    end
    local vehpos = GetEntityCoords(veh, false)
    if veh ~= nil and GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 10 then
        if HasKey then
            local vehLockStatus = GetVehicleDoorLockStatus(veh)
            loadAnimDict("anim@mp_player_intmenu@key_fob@")
            TaskPlayAnim(GetPlayerPed(-1), 'anim@mp_player_intmenu@key_fob@', 'fob_click_fp' ,3.0, 3.0, -1, 49, 0, false, false, false)

            if vehLockStatus == 1 then
                Citizen.Wait(750)
                ClearPedTasks(GetPlayerPed(-1))
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 6, "lock", 0.5)
                SetVehicleDoorsLocked(veh, 2)
                if(GetVehicleDoorLockStatus(veh) == 2)then
                    PRPCore.Functions.Notify("Vehicle Locked!")
                else
                    PRPCore.Functions.Notify("Something went wrong with locking the vehicle!")
                end
            else
                Citizen.Wait(750)
                ClearPedTasks(GetPlayerPed(-1))
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 6, "unlock", 0.5)
                SetVehicleDoorsLocked(veh, 1)
                if(GetVehicleDoorLockStatus(veh) == 1)then
                    PRPCore.Functions.Notify("Vehicle Unlocked!")
                else
                    PRPCore.Functions.Notify("Something went wrong with locking the vheicle!")
                end
            end

            if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                SetVehicleInteriorlight(veh, true)
                SetVehicleIndicatorLights(veh, 0, true)
                SetVehicleIndicatorLights(veh, 1, true)
                Citizen.Wait(450)
                SetVehicleIndicatorLights(veh, 0, false)
                SetVehicleIndicatorLights(veh, 1, false)
                Citizen.Wait(450)
                SetVehicleInteriorlight(veh, true)
                SetVehicleIndicatorLights(veh, 0, true)
                SetVehicleIndicatorLights(veh, 1, true)
                Citizen.Wait(450)
                SetVehicleInteriorlight(veh, false)
                SetVehicleIndicatorLights(veh, 0, false)
                SetVehicleIndicatorLights(veh, 1, false)
                Citizen.Wait(100)
                SetVehicleLights(veh, 2)
                Citizen.Wait(200)
                SetVehicleLights(veh, 1)
                Citizen.Wait(200)
                SetVehicleLights(veh, 2)
                Citizen.Wait(200)
                SetVehicleLights(veh, 1)
                Citizen.Wait(200)
                SetVehicleLights(veh, 2)
                Citizen.Wait(200)
                SetVehicleLights(veh, 0)
                Wait(500)
                SetVehicleDoorShut(veh, 0, false)
                SetVehicleDoorShut(veh, 1, false)
                SetVehicleDoorShut(veh, 2, false)
                SetVehicleDoorShut(veh, 3, false)
                -- SetVehicleDoorsLocked(veh, 2)
                PlayVehicleDoorCloseSound(veh, 1)
                SetVehicleEngineOn(veh,false,true,false)
            end
        end
    end
end

local openingDoor = false
function LockpickDoor(isAdvanced)
    local vehicle = PRPCore.Functions.GetClosestVehicle()
    if vehicle ~= nil and vehicle ~= 0 then
        local vehpos = GetEntityCoords(vehicle)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 1.5 then
            local vehLockStatus = GetVehicleDoorLockStatus(vehicle)
            if (vehLockStatus > 1) then
                local lockpickTime = math.random(30000, 60000)
                if isAdvanced then
                    lockpickTime = math.ceil(lockpickTime*0.5)
                end
                LockpickDoorAnim(lockpickTime)
                PoliceCall()
                IsHotwiring = true
                SetVehicleAlarm(vehicle, true)
                SetVehicleAlarmTimeLeft(vehicle, lockpickTime)
                PRPCore.Functions.Progressbar("lockpick_vehicledoor", "Lockpicking..", lockpickTime, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    openingDoor = false
                    StopAnimTask(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
                    IsHotwiring = false
                    if math.random(1, 100) <= 90 then
                        PRPCore.Functions.Notify("Opened door!")
                        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "unlock", 0.3)
                        SetVehicleDoorsLocked(vehicle, 0)
                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                        if isAdvanced then
                            if math.random(1,5) == 1 then
                                TriggerServerEvent("PRPCore:Server:RemoveItem", "advancedlockpick", 1)
                                PRPCore.Functions.Notify("Lockpick broke!")
                            end
                        else
                            if math.random(1,2) == 1 then
                                TriggerServerEvent("PRPCore:Server:RemoveItem", "lockpick", 1)
                                PRPCore.Functions.Notify("Lockpick broke!")
                            end
                        end
                    else
                        PRPCore.Functions.Notify("Failed!", "error")
                        if isAdvanced then
                            if math.random(1,5) == 1 then
                                TriggerServerEvent("PRPCore:Server:RemoveItem", "advancedlockpick", 1)
                                PRPCore.Functions.Notify("Lockpick broke!")
                            end
                        else
                            if math.random(1,2) == 1 then
                                TriggerServerEvent("PRPCore:Server:RemoveItem", "lockpick", 1)
                                PRPCore.Functions.Notify("Lockpick broke!")
                            end
                        end
                    end
                end, function() -- Cancel
                    openingDoor = false
                    StopAnimTask(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
                    PRPCore.Functions.Notify("Failed!", "error")
                    IsHotwiring = false
                end)
            end
        end
    end
end

function LockpickDoorAnim(time)
    time = time / 1000
    loadAnimDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1000)
            time = time - 1
            if time <= 0 then
                openingDoor = false
                StopAnimTask(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            end
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end

function LockpickIgnition(isAdvanced)
    if not HasKey then
        taskBar = 100
        taskBar2 = 100
        taskBar3 = 100
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        IsHotwiring = true
        PoliceCall()
        local lockpickTime = math.random(1500, 3000)
        if isAdvanced then
            lockpickTime = math.ceil(lockpickTime*1.5)
        end
        loadAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        Wait(50)
        TaskPlayAnim(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        local taskBar = exports["skillbar"]:taskBar(lockpickTime,math.random(8,15))
        if taskBar ~= 100 then
            StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            HasKey = false
            SetVehicleEngineOn(veh, false, false, true)
            PRPCore.Functions.Notify("Lockpick Failed!", "error")
            IsHotwiring = false
        else
            local taskBar2 = exports["skillbar"]:taskBar(lockpickTime-500,math.random(6,12))
            if taskBar2 ~= 100 then
                StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                HasKey = false
                SetVehicleEngineOn(veh, false, false, true)
                PRPCore.Functions.Notify("Lockpick Failed!", "error")
                IsHotwiring = false
            else
                local taskBar3 = exports["skillbar"]:taskBar(lockpickTime-1000,math.random(5,10))
                if taskBar3 ~= 100 then
                    StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                    HasKey = false
                    SetVehicleEngineOn(veh, false, false, true)
                    PRPCore.Functions.Notify("Lockpick Failed!", "error")
                    IsHotwiring = false
                else
                    IsHotwiring = false
                    StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
                    PRPCore.Functions.Notify("Lockpick success!")
                    HasKey = true
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))

                    if isAdvanced then
                        if math.random(1,5) == 1 then
                            TriggerServerEvent("PRPCore:Server:RemoveItem", "advancedlockpick", 1)
                            PRPCore.Functions.Notify("Lockpick broke!")
                        end
                    else
                        if math.random(1,2) == 1 then
                            TriggerServerEvent("PRPCore:Server:RemoveItem", "lockpick", 1)
                            PRPCore.Functions.Notify("Lockpick broke!")
                        end
                    end
                end
            end

        end
        --PRPCore.Functions.Progressbar("lockpick_ignition", "Lockpicking..", lockpickTime, false, true, {
        --    disableMovement = true,
        --    disableCarMovement = true,
        --    disableMouse = false,
        --    disableCombat = true,
        --}, {
        --    animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        --    anim = "machinic_loop_mechandplayer",
        --    flags = 16,
        --}, {}, {}, function() -- Done
        --
        --end, function() -- Cancel
        --
        --end)
    end
end

function Hotwire()
    if not HasKey then 
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        IsHotwiring = true
        local hotwireTime = math.random(20000, 40000)
        SetVehicleAlarm(vehicle, true)
        SetVehicleAlarmTimeLeft(vehicle, hotwireTime)
        PoliceCall()
        PRPCore.Functions.Progressbar("hotwire_vehicle", "Working ignition key..", hotwireTime, false, true, {
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
            if (math.random(0, 100) < 10) then
                HasKey = true
                PRPCore.Functions.Notify("Hotwire success!")
            else
                HasKey = false
                SetVehicleEngineOn(veh, false, false, true)
                PRPCore.Functions.Notify("Hotwire Failed!", "error")
            end
            IsHotwiring = false
        end, function() -- Cancel
            StopAnimTask(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            HasKey = false
            SetVehicleEngineOn(veh, false, false, true)
            PRPCore.Functions.Notify("Hotwire Failed!", "error")
            IsHotwiring = false
        end)
    end
end

function PoliceCall()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local chance = 25
    if GetClockHours() >= 1 and GetClockHours() <= 6 then
        chance = 3
    end
    if math.random(1, 100) <= chance then
        local closestPed = GetNearbyPed()
        if closestPed ~= nil then
            local msg = ""
            local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
            local streetLabel = GetStreetNameFromHashKey(s1)
            local street2 = GetStreetNameFromHashKey(s2)
            if street2 ~= nil and street2 ~= "" then 
                streetLabel = streetLabel .. " " .. street2
            end
            if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                local modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                local modelPlate = GetVehicleNumberPlateText(vehicle)
                msg = "Attempted car burglary " ..streetLabel.. ". Vehicle: " .. modelName .. ", Plate: " .. modelPlate
            else
                local vehicle = PRPCore.Functions.GetClosestVehicle()
                local modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                local modelPlate = GetVehicleNumberPlateText(vehicle)
                msg = "Attempted car burglary " ..streetLabel.. ". Vehicle: " .. modelName .. ", Plate: " .. modelPlate
            end
            TriggerServerEvent("police:server:VehicleCall", pos, msg)
        end
    end
end

function GetClosestVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle

	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, GetPlayerPed(-1), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		
		offset = offset - 1

		if vehicle ~= 0 then break end
	end
	
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	
	if distance > 250 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function GetNearbyPed()
	local retval = nil
	local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local closestPed, closestDistance = PRPCore.Functions.GetClosestPed(coords, PlayerPeds)
	if not IsEntityDead(closestPed) and closestDistance < 30.0 then
		retval = closestPed
	end
	return retval
end

function IsBlacklistedWeapon()
    local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
    if weapon ~= nil then
        for _, v in pairs(Config.NoRobWeapons) do
            if weapon == GetHashKey(v) then
                return true
            end
        end
    end
    return false
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end