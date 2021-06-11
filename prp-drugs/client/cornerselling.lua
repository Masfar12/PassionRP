cornerselling = false
hasTarget = false
busySelling = false

startLocation = nil

currentPed = nil

lastPed = {}

stealingPed = nil
stealData = {}

availableDrugs = nil

CurrentCops = 0

local policeMessage = {
    "Suspicious behavior",
    "Possible drugsales sighted",
}

RegisterNetEvent('prp-drugs:client:cornerselling')
AddEventHandler('prp-drugs:client:cornerselling', function(data)
    PRPCore.Functions.TriggerCallback('prp-drugs:server:cornerselling:getAvailableDrugs', function(result)
        if result ~= nil then
            availableDrugs = result

            if not cornerselling then
                if CurrentCops >= Config.MinimumCornerSellingPolice then
                    cornerselling = true
                    PRPCore.Functions.Notify('Corner selling started')
                    startLocation = GetEntityCoords(GetPlayerPed(-1))
                    -- TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_CROSS_ROAD_WAIT", 0, false)
                else
                    PRPCore.Functions.Notify("Not enough police", "error")
                end
            else
                cornerselling = false
                hasTarget = false
                busySelling = false
                startLocation = nil
                currentPed = nil
                availableDrugs = nil
                PRPCore.Functions.Notify('Corner selling stopped')
                -- ClearPedTasks(GetPlayerPed(-1))
            end
        else
            PRPCore.Functions.Notify('You dont have any drugs on you..', 'error')
        end
    end)
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

function toFarAway()
    PRPCore.Functions.Notify('Where you walking to? Get back!', 'error')
    cornerselling = false
    hasTarget = false
    busySelling = false
    startLocation = nil
    currentPed = nil
    availableDrugs = nil
    Citizen.Wait(5000)
end

function callPolice(coords)
    local title = "Possible drug sale"
    local pCoords = GetEntityCoords(GetPlayerPed(-1))
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pCoords.x, pCoords.y, pCoords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then streetLabel = street1..' '..street2 end

    TriggerServerEvent('police:server:PoliceAlertMessage', title, streetLabel, coords)
    hasTarget = false
    Citizen.Wait(5000)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if stealingPed ~= nil and stealData ~= nil then
            if IsEntityDead(stealingPed) then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local pedpos = GetEntityCoords(stealingPed)
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, pedpos.x, pedpos.y, pedpos.z, true) < 1.5) then
                    DrawText3D(pedpos.x, pedpos.y, pedpos.z, "[E] Grab items")
                    if IsControlJustReleased(0, Keys["E"]) then
                        RequestAnimDict("pickup_object")
                        while not HasAnimDictLoaded("pickup_object") do
                            Citizen.Wait(7)
                        end
                        TaskPlayAnim(GetPlayerPed(-1), "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false )
                        Citizen.Wait(2000)
                        ClearPedTasks(GetPlayerPed(-1))
                        TriggerServerEvent("PRPCore:Server:AddItem", stealData.item, stealData.amount)
                        TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items[stealData.item], "add")
                        stealingPed = nil
                        stealData = {}
                    end
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        if cornerselling then
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player)
            --for _, zone in pairs(Config.CornerSellingZones) do
                --local zoneDist = GetDistanceBetweenCoords(coords, zone["coords"]["x"], zone["coords"]["y"], zone["coords"]["z"], true)
                --if zoneDist < 150 then
                    --local hours = GetClockHours()
                    --if hours > 1 and hours < 6 or hours >= 19 and hours <= 23 then
                        if not hasTarget then
                            local PlayerPeds = {}
                            if next(PlayerPeds) == nil then
                                for _, player in ipairs(GetActivePlayers()) do
                                    local ped = GetPlayerPed(player)
                                    if not IsPedDeadOrDying(ped,1) then
                                        table.insert(PlayerPeds, ped)
                                    end
                                end
                            end

                            local closestPed, closestDistance = PRPCore.Functions.GetClosestPed(coords, PlayerPeds,true)

                            if GetPedType(closestPed) == 28 then
                                goto continue
                            end

                            if closestDistance < 15.0 and closestPed ~= 0 and not IsPedDeadOrDying(closestPed,1) then
                                if availableDrugs ~= nil then
                                    SellToPed(closestPed)
                                else
                                    cornerselling = false
                                    hasTarget = false
                                    busySelling = false
                                    startLocation = nil
                                    currentPed = nil
                                    availableDrugs = nil
                                    PRPCore.Functions.Notify('Corner selling stopped')
                                    PRPCore.Functions.Notify('You ran out of drugs')
                                end
                            end
                        end

                        local startDist = GetDistanceBetweenCoords(startLocation, GetEntityCoords(GetPlayerPed(-1)))

                        if startDist > 10 then
                            toFarAway()
                        end
                    --end
                --end
            --end
        end

        ::continue::

        if not cornerselling then
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)

RegisterNetEvent('prp-drugs:client:refreshAvailableDrugs')
AddEventHandler('prp-drugs:client:refreshAvailableDrugs', function(items)
    if items ~= nil then
        availableDrugs = items
    else
        cornerselling = false
        hasTarget = false
        busySelling = false
        startLocation = nil
        currentPed = nil
        availableDrugs = nil
        PRPCore.Functions.Notify('Corner selling stopped')
        Wait(200)
        PRPCore.Functions.Notify('You ran out of drugs')
    end
end)

function isHappening(chance)
    return math.random(1, 100) < chance
end

function SellToPed(ped)
    AddRelationshipGroup('HATES_ME')

    hasTarget = true
    for i = 1, #lastPed, 1 do
        if lastPed[i] == ped then
            hasTarget = false
            return
        end
    end

    -- Do nothing if success chance isn't high enough.
    if not isHappening(Config.CornerSelling.successChance) then
        hasTarget = false
        return
    end

    -- Call the police if chance is high enough.
    if isHappening(Config.CornerSelling.callPoliceChance) then
        callPolice(GetEntityCoords(GetPlayerPed(-1)))
    end

    if availableDrugs == nil then
        PRPCore.Functions.Notify("There was an error, please try again.")
        return
    end

    -- Pick a drug type from the available ones.
    local drugType = math.random(1, #availableDrugs)

    -- The total amount owned by the player.
    local hasAmount = availableDrugs[drugType].amount

    --[[
        If the player has less than our ideal minimum, get a number between 1 and however many they have.
        Otherwise, if the player has more than our ideal maximum, get between our ideal min / max.
        Otherwise, get between our min and however many they have (which is below our ideal max at this point).
    ]]--
    local bagAmount = hasAmount < Config.CornerSelling.idealMinSell
        and math.random(1, hasAmount)
        or  math.random(Config.CornerSelling.idealMinSell, math.min(Config.CornerSelling.idealMaxSell, hasAmount))

    currentOfferDrug = availableDrugs[drugType]

    -- Price per drug will be the amount in the array, plus a random number between our min / max padding numbers.
    local pricePerDrug = math.random(Config.CornerSelling.minPricePadding, Config.CornerSelling.maxPricePadding) + Config.DrugsPrice[currentOfferDrug.item]

    -- If the local should scam the player, deduct our scamPriceReduction percentage from the calculated price.
    if isHappening(Config.CornerSelling.scamChance) then
        pricePerDrug = pricePerDrug - (pricePerDrug * (Config.CornerSelling.scamPriceReduction / 100))
    end

    -- Get the price for all of the drugs the player is selling.
    local randomPrice = math.floor(pricePerDrug * bagAmount)

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)

    local coords = GetEntityCoords(GetPlayerPed(-1), true)
    local pedCoords = GetEntityCoords(ped)
    local pedDist = GetDistanceBetweenCoords(coords, pedCoords)

    -- If they're getting robbed, move the ped slightly faster than usual
    local isGettingRobbed = isHappening(Config.CornerSelling.getRobbedChance)
    if isGettingRobbed then
        TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
    else
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
    end

    while pedDist > Config.CornerSelling.distanceToSell do
        if DoesEntityExist(ped) then
            coords = GetEntityCoords(GetPlayerPed(-1), true)
            pedCoords = GetEntityCoords(ped)
            if isGettingRobbed then
                TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
            else
                TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
            end
            TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
            pedDist = GetDistanceBetweenCoords(coords, pedCoords)

            Citizen.Wait(100)
        else
            return
        end
    end

    TaskLookAtEntity(ped, GetPlayerPed(-1), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, GetPlayerPed(-1), 5500)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)
    currentPed = ped
    SetPedKeepTask(ped, false)

    if hasTarget then
        while pedDist < Config.CornerSelling.distanceToSell do
            coords = GetEntityCoords(GetPlayerPed(-1), true)
            pedCoords = GetEntityCoords(ped)
            pedDist = GetDistanceBetweenCoords(coords, pedCoords)

            if isGettingRobbed then
                TriggerServerEvent('prp-drugs:server:robCornerDrugs', availableDrugs[drugType].item, bagAmount)
                PRPCore.Functions.Notify(string.format("You have been robbed of %d bag('s) of %s", bagAmount, availableDrugs[drugType].label), "error")
                stealingPed = ped
                stealData = {
                    item = availableDrugs[drugType].item,
                    amount = bagAmount,
                }

                hasTarget = false

                local moveto = GetEntityCoords(GetPlayerPed(-1))
                local movetoCoords = {x = moveto.x + math.random(100, 500), y = moveto.y + math.random(100, 500), z = moveto.z}
                ClearPedTasksImmediately(ped)
                TaskGoStraightToCoord(ped, movetoCoords.x, movetoCoords.y, movetoCoords.z, 15.0, -1, 0.0, 0.0)

                table.insert(lastPed, ped)
                break
            else
                if pedDist < Config.CornerSelling.distanceToSell then
                    local sellKey = "E"
                    local rejectKey = "G"

                    PRPCore.Functions.DrawText3D(
                        pedCoords.x, pedCoords.y, pedCoords.z, string.format(
                            "~g~[%s]~w~ Sell %sx %s for $%s? / ~g~[%s]~w~ Reject offer",
                            sellKey,
                            bagAmount,
                            currentOfferDrug.label,
                            randomPrice,
                            rejectKey
                        )
                    )
                    if IsControlJustPressed(0, Keys[sellKey]) then
                        PRPCore.Functions.Notify('Drugs slung', 'success')
                        TriggerServerEvent('prp-drugs:server:sellCornerDrugs', availableDrugs[drugType].item, bagAmount, randomPrice)
                        hasTarget = false

                        loadAnimDict("gestures@f@standing@casual")
                        TaskPlayAnim(GetPlayerPed(-1), "gestures@f@standing@casual", "gesture_point", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                        Citizen.Wait(650)
                        ClearPedTasks(GetPlayerPed(-1))

                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        table.insert(lastPed, ped)
                        break
                    end

                    if IsControlJustPressed(0, Keys[rejectKey]) then
                        PRPCore.Functions.Notify('Offer rejected!', 'error')

                        hasTarget = false
                        table.insert(lastPed, ped)

                        if isHappening(Config.CornerSelling.attackChanceOnReject) then
                            SetPedAsEnemy(ped, true)
                            TaskCombatPed(ped, PlayerPedId(id), 0, 16)
                            SetPedRelationshipGroupHash(ped, 'HATES_ME')
                            break
                        end

                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        break
                    end
                else
                    hasTarget = false
                    SetPedKeepTask(ped, false)
                    SetEntityAsNoLongerNeeded(ped)
                    ClearPedTasksImmediately(ped)
                    table.insert(lastPed, ped)
                end
            end

            Citizen.Wait(3)
        end

        Citizen.Wait(math.random(4000, 7000))
    end
end

function loadAnimDict(dict)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
end

function runAnimation(target)
    RequestAnimDict("mp_character_creation@lineup@male_a")
    while not HasAnimDictLoaded("mp_character_creation@lineup@male_a") do
    Citizen.Wait(0)
    end
    if not IsEntityPlayingAnim(target, "mp_character_creation@lineup@male_a", "loop_raised", 3) then
        TaskPlayAnim(target, "mp_character_creation@lineup@male_a", "loop_raised", 8.0, -8, -1, 49, 0, 0, 0, 0)
    end
end
