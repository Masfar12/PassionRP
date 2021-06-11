local speed = 0.0
local seatbeltOn = false
local cruiseOn = false

local bleedingPercentage = 0

--function CalculateTimeToDisplay()
--	hour = GetClockHours()
--    minute = GetClockMinutes()
--
--    local obj = {}
--
--	if minute <= 9 then
--		minute = "0" .. minute
--    end
--
--	if hour <= 9 then
--		hour = "0" .. hour
--    end
--
--    obj.hour = hour
--    obj.minute = minute
--
--    return obj
--end

local toggleHud = true
local _toggleHungerThirst = true

RegisterCommand("hudon", function()
    TriggerEvent("prp-hud:toggleHud", true)
end)

RegisterCommand("hudoff", function()
    TriggerEvent("prp-hud:toggleHud", false)
end)

RegisterNetEvent('prp-hud:toggleHud')
AddEventHandler('prp-hud:toggleHud', function(toggleHud1)
    toggleHud = toggleHud1
    _toggleHungerThirst = toggleHud1
end)

RegisterNetEvent('prp-hud:toggleHungerThirst')
AddEventHandler('prp-hud:toggleHungerThirst', function(toggleHungerThirst)
    _toggleHungerThirst = toggleHungerThirst
end)

Citizen.CreateThread(function()
    Citizen.Wait(500)
    while true do 
        if PRPCore ~= nil and isLoggedIn and PRPHud.Show then
            local playerData = PRPCore.Functions.GetPlayerData()

            --speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.4
            --local pos = GetEntityCoords(GetPlayerPed(-1))
            --local time = CalculateTimeToDisplay()
            --local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
            --local current_zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z))
            --local fuel = exports['LegacyFuel']:GetFuel(GetVehiclePedIsIn(GetPlayerPed(-1)))
            --local engine = GetVehicleEngineHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
            local stamina = (100 - GetPlayerSprintStaminaRemaining(PlayerId()))
            local inwater = IsPedSwimmingUnderWater(GetPlayerPed(-1))
            local oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId())
            local hunger = playerData.metadata.hunger
            local thirst = playerData.metadata.thirst
            SendNUIMessage({
                action = "hudtick",
                show = IsPauseMenuActive(),
                health = GetEntityHealth(GetPlayerPed(-1)),
                armour = GetPedArmour(GetPlayerPed(-1)),
                bleeding = bleedingPercentage,
                -- direction = GetDirectionText(GetEntityHeading(GetPlayerPed(-1))),
                --street1 = GetStreetNameFromHashKey(street1),
                --street2 = GetStreetNameFromHashKey(street2),
                --area_zone = current_zone,
                --speed = math.ceil(speed),
                --fuel = fuel,
                time = time,
                --engine = engine,
                stamina = stamina,
                inwater = inwater,
                oxygen = oxygen,
                togglehud = toggleHud,
                toggleHungerThirst = _toggleHungerThirst,
                hunger = hunger,
                thirst = thirst,
            })
            Citizen.Wait(500)
        else
            Citizen.Wait(1000)
        end
    end
end)


local radarActive = false
Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1000)
        TriggerEvent("hud:client:SetMoney")
        if IsPedInAnyVehicle(PlayerPedId()) and isLoggedIn and PRPHud.Show then
            DisplayRadar(true)
            SendNUIMessage({
                action = "car",
                show = true,
            })
            radarActive = true
        else
            DisplayRadar(false)
            SendNUIMessage({
                action = "car",
                show = false,
            })
            --seatbeltOn = false
            --cruiseOn = false
            --
            --SendNUIMessage({
            --    action = "seatbelt",
            --    seatbelt = seatbeltOn,
            --})
            --
            --SendNUIMessage({
            --    action = "cruise",
            --    cruise = cruiseOn,
            --})
            radarActive = false
        end
    end
end)

--
--RegisterNetEvent("seatbelt:client:ToggleSeatbelt")
--AddEventHandler("seatbelt:client:ToggleSeatbelt", function(toggle)
--    if toggle == nil then
--        seatbeltOn = not seatbeltOn
--        SendNUIMessage({
--            action = "seatbelt",
--            seatbelt = seatbeltOn,
--        })
--    else
--        seatbeltOn = toggle
--        SendNUIMessage({
--            action = "seatbelt",
--            seatbelt = toggle,
--        })
--    end
--end)
--
--RegisterNetEvent('prp-hud:client:ToggleHarness')
--AddEventHandler('prp-hud:client:ToggleHarness', function(toggle)
--    SendNUIMessage({
--        action = "harness",
--        toggle = toggle
--    })
--end)
--
--RegisterNetEvent('prp-hud:client:UpdateNitrous')
--AddEventHandler('prp-hud:client:UpdateNitrous', function(toggle, level, IsActive)
--    SendNUIMessage({
--        action = "nitrous",
--        toggle = toggle,
--        level = level,
--        active = IsActive
--    })
--end)
--
--RegisterNetEvent('prp-hud:client:UpdateDrivingMeters')
--AddEventHandler('prp-hud:client:UpdateDrivingMeters', function(toggle, amount)
--    SendNUIMessage({
--        action = "UpdateDrivingMeters",
--        amount = amount,
--        toggle = toggle,
--    })
--end)

RegisterNetEvent('prp-hud:client:UpdateVoiceProximity')
AddEventHandler('prp-hud:client:UpdateVoiceProximity', function(Proximity)
    SendNUIMessage({
        action = "proximity",
        prox = Proximity
    })
end)

RegisterNetEvent('prp-hud:client:ProximityActive')
AddEventHandler('prp-hud:client:ProximityActive', function(active)
    SendNUIMessage({
        action = "talking",
        IsTalking = active
    })
end)


-- doesnt need to run whilst not in
--Citizen.CreateThread(function()
--    while true do
--        if isLoggedIn and PRPHud.Show and PRPCore ~= nil then
--            PRPCore.Functions.TriggerCallback('hospital:GetPlayerBleeding', function(playerBleeding)
--                if playerBleeding == 0 then
--                    bleedingPercentage = 0
--                elseif playerBleeding == 1 then
--                    bleedingPercentage = 25
--                elseif playerBleeding == 2 then
--                    bleedingPercentage = 50
--                elseif playerBleeding == 3 then
--                    bleedingPercentage = 75
--                elseif playerBleeding == 4 then
--                    bleedingPercentage = 100
--                end
--            end)
--        end
--
--        Citizen.Wait(2500)
--    end
--end)
--
--local LastHeading = nil
--local Rotating = "left"
--local toggleCompass = true
--
--RegisterNetEvent('prp-hud:toggleCompass')
--AddEventHandler('prp-hud:toggleCompass', function(toggleCompass1)
--    toggleCompass = toggleCompass1
--end)
--
--RegisterNetEvent("PRPCore:Client:OnPlayerLoaded")
--AddEventHandler("PRPCore:Client:OnPlayerLoaded", function()
--    isLoggedIn = true
--    PRPHud.Show = true
--    PlayerJob = PRPCore.Functions.GetPlayerData().job
--
--end)
--Citizen.CreateThread(function()
--    while true do
--        if isLoggedIn and PRPHud.Show and PRPCore ~= nil and toggleCompass then
--            local ped = GetPlayerPed(-1)
--            local PlayerHeading = GetEntityHeading(ped)
--            if LastHeading ~= nil then
--                if PlayerHeading < LastHeading then
--                    Rotating = "right"
--                elseif PlayerHeading > LastHeading then
--                    Rotating = "left"
--                end
--            end
--            LastHeading = PlayerHeading
--            SendNUIMessage({
--                action = "UpdateCompass",
--                heading = PlayerHeading,
--                lookside = Rotating,
--                toggle = toggleCompass
--            })
--            Citizen.Wait(50)
--        else
--            SendNUIMessage({
--                action = "UpdateCompass",
--                heading = 1,
--                lookside = 1,
--                toggle = toggleCompass
--            })
--            Citizen.Wait(1500)
--        end
--    end
--end)
--
--function GetDirectionText(heading)
--    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
--        return "Noord"
--    elseif (heading >= 45 and heading < 135) then
--        return "Oost"
--    elseif (heading >=135 and heading < 225) then
--        return "Zuid"
--    elseif (heading >= 225 and heading < 315) then
--        return "West"
--    end
--end