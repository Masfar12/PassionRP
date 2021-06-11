PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    CreateMechPed()
end)

ActiveKeys = {}
---------------------
-- Citizen Threads --
---------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local stash = Temple.TemplePartStash
        
        if (GetDistanceBetweenCoords(pos, stash.x, stash.y, stash.z, true) < 3.0) then
            if Council() then
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent("prp-log:server:CreateLog", "passcodes", "Entered Stash", "red", "**"..GetPlayerName(PlayerId()).."** accessed Temple Stash")
                    TriggerEvent("inventory:client:SetCurrentStash", "temple")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "temple", {
                        maxweight = 20000000,
                        slots = 500,
                    })
                end
            end
        end
    end

end)

------------
-- Events --
------------
RegisterNetEvent('prp-temple:client:usePart')
AddEventHandler('prp-temple:client:usePart', function(item)
    local ped = GetPlayerPed(-1)
    local inVehicle = IsPedInAnyVehicle(ped) and not IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(ped)))
    --Checks if in Vehicle, and Not a Bike.
    if inVehicle then
        local dist = GetDistanceBetweenCoords(GetEntityCoords(ped, false), Temple.TemplePartInstall.x, Temple.TemplePartInstall.y, Temple.TemplePartInstall.z, false)
        --Checks in distance to install/removal BEFORE Installing.
        if dist < 5 then
            plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, false))
            TriggerServerEvent('prp-temple:server:installPart', plate, item)
        else
            TriggerEvent("PRPCore:Notify", "You cannot do that here..", "error", 10000)
        end
    else
        TriggerEvent("PRPCore:Notify", "You are not in a vehicle..", "error", 10000)
    end
end)

RegisterNetEvent('prp-temple:client:useKey')
AddEventHandler('prp-temple:client:useKey', function()
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped)
    local plate = GetVehicleNumberPlateText(veh)
    local inVehicle = IsPedInAnyVehicle(ped) and not IsThisModelABike(GetEntityModel(veh))
    --Checks if Vehicle is Tuned by a TunerLaptop... Since both these resources effect the same handling fields.. 
    --it's best to restrict the order you apply them, so the player removes them in the same order.
    PRPCore.Functions.TriggerCallback('prp-tunerchip:server:GetTunedVehicles', function(result)
        if result == nil or result[plate] == nil then
            if inVehicle then
                if not GetIsVehicleEngineRunning(veh) then
                    ApplyVehicleEffects()
                    SetVehicleEngineOn(veh, true, true)
                else
                    TriggerEvent("PRPCore:Notify", "The Vehicle is Already Running..", "error", 10000)
                end
            else
                TriggerEvent("PRPCore:Notify", "You are not in a vehicle..", "error", 10000)
            end
        else
            TriggerEvent("PRPCore:Notify", "Please Remove your Vehicle Tune Before Using the Red Key..", "error", 10000)
        end
    end)
end)

RegisterNetEvent('prp-temple:client:useScanner')
AddEventHandler('prp-temple:client:useScanner', function()
    local veh = PRPCore.Functions.GetClosestVehicle()
    local inRange = false
    local rearEng = false
    --If we Find a Vehicle
    if veh ~= nil and veh ~= 0 then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local vehpos = GetEntityCoords(veh)
        --If we are Close enough, but not inside of it.
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
            local vehHood = GetOffsetFromEntityInWorldCoords(veh, 0, 2.5, 0)
            --Adjusts vehHood if it's a rear Engine Vehicle
            if (RearEngine(GetEntityModel(veh))) then
                vehHood = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                rearEng = true
			end
            --If we are Close to the Vehicles Hood..
            if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehHood) < 2.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                inRange = true
                scanVehicle(veh, rearEng)
            end
        end
    end
    if not inRange then
        TriggerEvent("PRPCore:Notify", "You Don't Know what you are Doing..", "error", 10000)
    end
end)

RegisterNetEvent('prp-temple:client:swapTyres')
AddEventHandler('prp-temple:client:swapTyres', function(item)
    local veh = PRPCore.Functions.GetClosestVehicle()
    local inRange = false
    --If we Find a Vehicle
    if veh ~= nil and veh ~= 0 then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local vehpos = GetEntityCoords(veh)
        --If we are Close enough, but not inside of it.
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
            local leftTyre = GetOffsetFromEntityInWorldCoords(veh, 1, 2, 0)
            --If we are Close to the Front Left Tyre..
            if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, leftTyre) < 2.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                local plate = GetVehicleNumberPlateText(veh)
                inRange = true
                swapTyres(plate, item)
            end
        end
    end
    if not inRange then
        TriggerEvent("PRPCore:Notify", "You Don't Know what you are Doing..", "error", 10000)
    end
end)

RegisterNetEvent('prp-temple:client:installAnimation')
AddEventHandler('prp-temple:client:installAnimation', function(part)
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local rear = false
    if RearEngine(veh) then
        rear = true
        SetVehicleDoorOpen(veh, 5, false, false)
    else
        SetVehicleDoorOpen(veh, 4, false, false)
    end
    giveAnim()
    PRPCore.Functions.Progressbar("connect_laptop", "Installing: "..(part), 15000, false, false, {
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
        if rear then 
            SetVehicleDoorShut(veh, 5, false, false)
        else
            SetVehicleDoorShut(veh, 4, false, false)
        end
    end)
end)



-------------
-- Scanner --
-------------
function scanVehicle(veh, rearEng)
    local plate = GetVehicleNumberPlateText(veh)
    if rearEng then
        SetVehicleDoorOpen(veh, 5, false, false)
    else
        SetVehicleDoorOpen(veh, 4, false, false)
    end
    PRPCore.Functions.Progressbar("repair_vehicle", "Looking for any Illegal Performance Parts", 15000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 16,
    }, {}, {}, function() -- Done
        PRPCore.Functions.TriggerCallback('prp-temple:server:GetPlateParts', function(r)
            if r ~= nil then
                sendScannerData(r)
            else
                TriggerEvent("PRPCore:Notify", "You Find No illegal Parts..", "error", 10000)
            end
        end, plate)

        if rearEng then
			SetVehicleDoorShut(veh, 5, false)
		else
			SetVehicleDoorShut(veh, 4, false)
		end
        StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 1.0) -- Cancel
    end)
end

function sendScannerData(r)
    local p = {}
    for i, v in pairs(r) do
        if v == 1 then
            p[i] = "Installed"
        else
            p[i] = "Nothing Found"
        end
    end

    local tempString = [[
        <div class="chat-message advert">
            <div class="chat-message-body">
                Vehicle Plate: <strong>{0}</strong><br>
                <br>
                ECU Stg. One: <strong>{1}</strong> <br>
                ECU Stg. Two: <strong>{2}</strong> <br>
                Engine Stg. One: <strong>{3}</strong> <br>
                Engine Stg. Two: <strong>{4}</strong> <br>
                Transmission Stg. One: <strong>{5}</strong> <br>
                Transmission Stg. Two: <strong>{6}</strong> <br>
                Brakes Stg. One: <strong>{7}</strong> <br>
                Brakes Stg. Two: <strong>{8}</strong> <br>
            </div>
        </div>
    ]]

    TriggerEvent('chat:addMessage', {
        template = tempString,
        args = {r.plate, p.ecu_1, p.ecu_2, p.engine_1, p.engine_2, p.transmission_1, p.transmission_2, p.brakes_1, p.brakes_2}
    })
end



----------------
-- TyresSwaps --
----------------
function swapTyres(plate, item)
    if not hasValues(plate) then
        PRPCore.Functions.TriggerCallback('prp-temple:server:GetPlateParts', function(result)
            --Checks if the Car even has Temple Parts.
            if result ~= nil then
                local r = result
                --Check of that Tyre Type is already installed
                if r[item.name] == 0 then
                    tyreAnimation(item.label)
                    TriggerServerEvent('prp-temple:server:swapTyres', r, plate, item)
                else
                    TriggerEvent("PRPCore:Notify", "That Tyre type is Already Installed..", "error", 10000)
                end
            else
                TriggerEvent("PRPCore:Notify", "You Don't Know what you are Doing..", "error", 10000)
            end
        end, plate)
    else
        TriggerEvent("PRPCore:Notify", "Red Key: Please remove the Red Key before swapping Tyres..", "error", 10000)
    end
end

function tyreAnimation(part)
    --Crouches the Player
    ClearPedTasks(GetPlayerPed(-1))
    RequestAnimSet("move_ped_crouched")
    while not HasAnimSetLoaded("move_ped_crouched") do
        Citizen.Wait(0)
    end
    SetPedMovementClipset(GetPlayerPed(-1), "move_ped_crouched",1.0)    
    SetPedWeaponMovementClipset(GetPlayerPed(-1), "move_ped_crouched",1.0)
    SetPedStrafeClipset(GetPlayerPed(-1), "move_ped_crouched_strafing",1.0)
    --Mechanic Animation
    PRPCore.Functions.Progressbar("repair_vehicle", "Swapping Tyres to a "..(part), 15000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 16,
    }, {}, {}, function() -- Done
        --Clears All Animations, returns player to standing.
        StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 1.0) -- Cancel
        ResetPedMovementClipset(GetPlayerPed(-1))
        ResetPedWeaponMovementClipset(GetPlayerPed(-1))
        ResetPedStrafeClipset(GetPlayerPed(-1))
    end)
end



--------------
-- Mech Ped --
--------------
function CreateMechPed()
    local hashKey = Temple.TempleMechPed.ped
    local coords = Temple.TempleMechPed.coords
    local pedType = 5
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end

	mechPed = CreatePed(pedType, hashKey, coords.x, coords.y, coords.z, coords.h, 0, 0)
	
    ClearPedTasks(mechPed)
    ClearPedSecondaryTask(mechPed)
    TaskSetBlockingOfNonTemporaryEvents(mechPed, true)
    SetPedFleeAttributes(mechPed, 0, 0)
    SetPedCombatAttributes(mechPed, 17, 1)

    SetPedSeeingRange(mechPed, 0.0)
    SetPedHearingRange(mechPed, 0.0)
    SetPedAlertness(mechPed, 0)
    SetPedKeepTask(mechPed, true)

end

function giveAnim()
    if (DoesEntityExist(mechPed) and not IsEntityDead(mechPed)) then 
        if (IsEntityPlayingAnim(mechPed, "mini@repair", "fixing_a_player", 3)) then 
            TaskPlayAnim(mechPed, "mini@repair", "fixing_a_player", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        else
            TaskPlayAnim(mechPed, "mini@repair", "fixing_a_player", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        end   
    end
end



---------------
-- Functions --
---------------
function ApplyVehicleEffects()
    local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1)))
    local turnOff = false
    --Grabbing ActiveKeys to sync ActiveKeys to all Clients
    PRPCore.Functions.TriggerCallback('prp-temple:server:GetActiveKeys', function(keys)
        if keys ~= nil then
            ActiveKeys = keys
        else
            ActiveKeys = {}
        end

        --If we Don't find a plate already stored in ActiveKeys.. We are Turning Off the effects.
        if hasValues(plate) then
            PRPCore.Functions.Notify('Red Key: Removing Key from the ignition!', 'error')
            turnOff = true
        else
            PRPCore.Functions.Notify('Red Key: Successful Start!', 'success')
            turnOff = false
        end

        --CallBack to see what parts the vehicle has..  Then installing the ones it finds
        PRPCore.Functions.TriggerCallback('prp-temple:server:GetPlateParts', function(r)
            if r ~= nil then
                local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
                local plate = GetVehicleNumberPlateText(veh)
                
                --IF we have Level Twos.. we Do Not want to Apply Level Ones.
                if r.ecu_2 == 1 then r.ecu_1 = 0 end
                if r.engine_2 == 1 then r.engine_1 = 0 end
                if r.brakes_2 == 1 then r.brakes_1 = 0 end
                if r.transmission_2 == 1 then r.transmission_1 = 0 end

                applyParts(r, veh, plate, turnOff)
            end

            --If we are turning off the effects.. we want to remove the plate from the ActiveKeys table.
            if turnOff then
                ActiveKeys[plate] = nil
                TriggerServerEvent('prp-temple:server:UpdateActiveKeys', ActiveKeys)
            else
                TriggerServerEvent('prp-temple:server:UpdateActiveKeys', ActiveKeys)
            end
        end, plate)
    end)
end

function applyParts(result, veh, plate, turnOff)
    for k, v in pairs(result) do
        if v == 1 then
            if k ~= "tyres_h" and k ~= "nitrous_kit" then
                local part = partData(k)
                local effect = part.effect
                local multp = part.multp

                if turnOff then
                    SetVehicleHandlingFloat(veh, "CHandlingData", part.effect, ActiveKeys[plate][effect])

                    print(string.format("%s Returning %s to the original value of %s", k, effect, ActiveKeys[plate][effect]))
                else
                    if hasValues(plate) then
                        ActiveKeys[plate][effect] = GetVehicleHandlingFloat(veh, "CHandlingData", effect)
                    else
                        ActiveKeys[plate] = {
                            [effect] = GetVehicleHandlingFloat(veh, "CHandlingData", effect),
                        }
                    end
                    SetVehicleHandlingFloat(veh, "CHandlingData", effect, (ActiveKeys[plate][effect] * multp))

                    print(string.format("%s Setting Default Value for %s to %s", k, effect, ActiveKeys[plate][effect]))
                    print(string.format( "%s Applying new Values for %s to %s", k, effect, ActiveKeys[plate][effect] * multp))
                end

            end
        end
    end
end

function hasValues(p)
    local retval = false
    for k,_ in pairs(ActiveKeys) do
        if k == p then
            retval = true
            break
        end
    end
    return retval
end

function RearEngine(vehModel)
    for _, model in ipairs(BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end

function Council()
    local PlayerData = PRPCore.Functions.GetPlayerData()
    local id = PlayerData.citizenid
    local retval = false
    for _, v in pairs(Temple.TempleCouncil) do
        if v == id then
            retval = true
            break
        end
    end
    return retval
end

function partData(part)
    for _, v in ipairs(Temple.TempleParts) do
        if v.part == part then
            return v
        end
    end
end