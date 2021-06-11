currentDealer = nil
knockingDoor = false

local dealerIsHome = false

local waitingDelivery = nil
local activeDelivery = nil

local interacting = false

local deliveryTimeout = 0

local isHealingPerson = false
local healAnimDict = "mini@cpr@char_a@cpr_str"
local healAnim = "cpr_pumpchest"

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PRPCore.Functions.TriggerCallback('prp-drugs:server:RequestConfig', function(DealerConfig)
        Config.Dealers = DealerConfig
    end)
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        nearDealer = false

        for id, dealer in pairs(Config.Dealers) do
            local dealerDist = GetDistanceBetweenCoords(pos, dealer["coords"]["x"], dealer["coords"]["y"], dealer["coords"]["z"])

            if dealerDist <= 6 then
                nearDealer = true

                if dealerDist <= 1.5 and not isHealingPerson then
                    if not interacting then
                        if not dealerIsHome then
                            DrawText3D(dealer["coords"]["x"], dealer["coords"]["y"], dealer["coords"]["z"], '[E] to knock')

                            if IsControlJustPressed(0, Keys["E"]) then
                                currentDealer = id
                                knockDealerDoor()
                            end
                        elseif dealerIsHome then
                            if dealer["name"] == "Oldman" then
                                DrawText3D(dealer["coords"]["x"], dealer["coords"]["y"], dealer["coords"]["z"], '[G] Help your friend ($10000)')
                            else
                                if dealer["name"] ~= "Witchdoctor" then
                                    DrawText3D(dealer["coords"]["x"], dealer["coords"]["y"], dealer["coords"]["z"], '[G] For assignment')
                                end
                            end

                            if dealer["name"] == "Witchdoctor" then
                                DrawText3D(dealer["coords"]["x"], dealer["coords"]["y"], dealer["coords"]["z"], '[G] Help your friend ($3000)')
                            end

                            if IsControlJustPressed(0, Keys["G"]) then
                                if dealer["name"] == "Oldman" or dealer["name"] == "Witchdoctor" then
                                    local player, distance = GetClosestPlayer()
                                    if player ~= -1 and distance < 5.0 then
                                        local playerId = GetPlayerServerId(player)
                                        isHealingPerson = true
                                        PRPCore.Functions.Progressbar("hospital_revive", "Help out..", 5000, false, true, {
                                            disableMovement = false,
                                            disableCarMovement = false,
                                            disableMouse = false,
                                            disableCombat = true,
                                        }, {
                                            animDict = healAnimDict,
                                            anim = healAnim,
                                            flags = 16,
                                        }, {}, {}, function() -- Done
                                            isHealingPerson = false
                                            StopAnimTask(GetPlayerPed(-1), healAnimDict, "exit", 1.0)
                                            PRPCore.Functions.Notify("You have helped out!")
                                            TriggerServerEvent("hospital:server:RevivePlayer", playerId, true)
                                        end, function() -- Cancel
                                            isHealingPerson = false
                                            StopAnimTask(GetPlayerPed(-1), healAnimDict, "exit", 1.0)
                                            PRPCore.Functions.Notify("Failed!", "error")
                                        end)
                                    else
                                        PRPCore.Functions.Notify("There is no one close..", "error")
                                    end
                                else
                                    if waitingDelivery == nil then
                                        TriggerEvent("chatMessage", "Dealer "..Config.Dealers[currentDealer]["name"], "normal", 'Heres your product, await my next email with the next order!')
                                        requestDelivery()
                                        interacting = false
                                        dealerIsHome = false
                                    else
                                        TriggerEvent("chatMessage", "Dealer "..Config.Dealers[currentDealer]["name"], "error", 'You still have to deliver the product, where you at?')
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        if not nearDealer then
            dealerIsHome = false
            Citizen.Wait(2000)
        end

        Citizen.Wait(3)
    end
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

knockDealerDoor = function()
    local hours = GetClockHours()

    if (hours >= Config.Dealers[currentDealer]["time"]["min"] and hours < 24) or (hours <= Config.Dealers[currentDealer]["time"]["max"] and hours > 0) then
        knockDoorAnim(true)
    else
        knockDoorAnim(false)
    end
end

function buyDealerStuff()
    local repItems = {}
    repItems.label = Config.Dealers[currentDealer]["name"]
    repItems.items = {}
    repItems.slots = 30

    for k, v in pairs(Config.Dealers[currentDealer]["products"]) do
        if PRPCore.Functions.GetPlayerData().metadata["dealerrep"] >= Config.Dealers[currentDealer]["products"][k].minrep then
            repItems.items[k] = Config.Dealers[currentDealer]["products"][k]
        end
    end

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Dealer_"..Config.Dealers[currentDealer]["name"], repItems)
end

function knockDoorAnim(home)
    local knockAnimLib = "timetable@jimmy@doorknock@"
    local knockAnim = "knockdoor_idle"
    local PlayerPed = GetPlayerPed(-1)
    local myData = PRPCore.Functions.GetPlayerData()

    if home then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "knock_door", 0.2)
        Citizen.Wait(100)
        while (not HasAnimDictLoaded(knockAnimLib)) do
            RequestAnimDict(knockAnimLib)
            Citizen.Wait(100)
        end
        knockingDoor = true
        TaskPlayAnim(PlayerPed, knockAnimLib, knockAnim, 3.0, 3.0, -1, 1, 0, false, false, false )
        Citizen.Wait(3500)
        TaskPlayAnim(PlayerPed, knockAnimLib, "exit", 3.0, 3.0, -1, 1, 0, false, false, false)
        knockingDoor = false
        Citizen.Wait(1000)
        if Config.Dealers[currentDealer]["name"] == "Oldman" then
            TriggerEvent("chatMessage", "Dealer WitchDoctor", "normal", 'What is it kid?')
        else
            TriggerEvent("chatMessage", "Dealer "..Config.Dealers[currentDealer]["name"], "normal", 'Hi '..myData.charinfo.firstname..', What do you need?')
        end
        -- knockTimeout()
        dealerIsHome = true
    else
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "knock_door", 0.2)
        Citizen.Wait(100)
        while (not HasAnimDictLoaded(knockAnimLib)) do
            RequestAnimDict(knockAnimLib)
            Citizen.Wait(100)
        end
        knockingDoor = true
        TaskPlayAnim(PlayerPed, knockAnimLib, knockAnim, 3.0, 3.0, -1, 1, 0, false, false, false )
        Citizen.Wait(3500)
        TaskPlayAnim(PlayerPed, knockAnimLib, "exit", 3.0, 3.0, -1, 1, 0, false, false, false)
        knockingDoor = false
        Citizen.Wait(1000)
        PRPCore.Functions.Notify('Looks likes no one is home..', 'error', 3500)
    end
end

RegisterNetEvent('prp-drugs:client:updateDealerItems')
AddEventHandler('prp-drugs:client:updateDealerItems', function(itemData, amount)
    TriggerServerEvent('prp-drugs:server:updateDealerItems', itemData, amount, currentDealer)
end)

RegisterNetEvent('prp-drugs:client:setDealerItems')
AddEventHandler('prp-drugs:client:setDealerItems', function(itemData, amount, dealer)
    Config.Dealers[dealer]["products"][itemData.slot].amount = Config.Dealers[dealer]["products"][itemData.slot].amount - amount
end)

function requestDelivery()
    local location = math.random(1, #Config.DeliveryLocations)
    local amount = math.random(3, 6)
    local item = randomDeliveryItemOnRep()
    waitingDelivery = {
        ["coords"] = Config.DeliveryLocations[location]["coords"],
        ["locationLabel"] = Config.DeliveryLocations[location]["label"],
        ["amount"] = amount,
        ["dealer"] = currentDealer,
        ["itemData"] = Config.DeliveryItems[item]
    }
    TriggerServerEvent('prp-drugs:server:giveDeliveryItems', amount)
    SetTimeout(math.random(10000, 30000), function()
        TriggerServerEvent('prp-phone:server:sendNewMail', {
            sender = Config.Dealers[currentDealer]["name"],
            subject = "Delivery location",
            message = "Heres your delivery information, <br>Location: "..waitingDelivery["locationLabel"].."<br>Product: <br> "..amount.."x "..PRPCore.Shared.Items[waitingDelivery["itemData"]["item"]]["label"].."<br><br> Dont be late.",
            button = {
                enabled = true,
                buttonEvent = "prp-drugs:client:setLocation",
                buttonData = waitingDelivery
            }
        })
    end)
end

function randomDeliveryItemOnRep()
    local ped = GetPlayerPed(-1)
    local myRep = PRPCore.Functions.GetPlayerData().metadata["dealerrep"]

    retval = nil

    for k, v in pairs(Config.DeliveryItems) do
        if Config.DeliveryItems[k]["minrep"] <= myRep then
            local availableItems = {}
            table.insert(availableItems, k)

            local item = math.random(1, #availableItems)

            retval = item
        end
    end
    return retval
end

function setMapBlip(x, y)
    SetNewWaypoint(x, y)
    PRPCore.Functions.Notify('The location has been marked on your GPS.', 'success');
end

RegisterNetEvent('prp-drugs:client:setLocation')
AddEventHandler('prp-drugs:client:setLocation', function(locationData)
    if activeDelivery == nil then
        activeDelivery = locationData
    else
        setMapBlip(activeDelivery["coords"]["x"], activeDelivery["coords"]["y"])
        PRPCore.Functions.Notify('You have to finish your delivery...')
        return
    end

    deliveryTimeout = 300

    deliveryTimer()

    setMapBlip(activeDelivery["coords"]["x"], activeDelivery["coords"]["y"])

    Citizen.CreateThread(function()
        while true do

            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local inDeliveryRange = false

            if activeDelivery ~= nil then
                local dist = GetDistanceBetweenCoords(pos, activeDelivery["coords"]["x"], activeDelivery["coords"]["y"], activeDelivery["coords"]["z"])

                if dist < 15 then
                    inDeliveryRange = true
                    if dist < 1.5 then
                        DrawText3D(activeDelivery["coords"]["x"], activeDelivery["coords"]["y"], activeDelivery["coords"]["z"], '[E] '..activeDelivery["amount"]..'x '..PRPCore.Shared.Items[activeDelivery["itemData"]["item"]]["label"]..' drop off.')

                        if IsControlJustPressed(0, Keys["E"]) then
                            deliverStuff(activeDelivery)
                            activeDelivery = nil
                            waitingDelivery = nil
                            break
                        end
                    end
                end

                if not inDeliveryRange then
                    Citizen.Wait(1500)
                end
            else
                break
            end

            Citizen.Wait(3)
        end
    end)
end)

function deliveryTimer()
    Citizen.CreateThread(function()
        while true do

            if deliveryTimeout - 1 > 0 then
                deliveryTimeout = deliveryTimeout - 1
            else
                deliveryTimeout = 0
                break
            end

            Citizen.Wait(1000)
        end
    end)
end

function deliverStuff(activeDelivery)
    if deliveryTimeout > 0 then
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        Citizen.Wait(500)
        TriggerEvent('animations:client:EmoteCommandStart', {"bumbin"})
        checkPedDistance()
        PRPCore.Functions.Progressbar("work_dropbox", "Deliver products..", 3500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('prp-drugs:server:succesDelivery', activeDelivery, true)
            TriggerServerEvent('prp-hud:Server:GainStress', 15)
        end, function() -- Cancel
            ClearPedTasks(GetPlayerPed(-1))
            PRPCore.Functions.Notify("Canceled..", "error")
        end)
    else
        TriggerServerEvent('prp-drugs:server:succesDelivery', activeDelivery, false)
        TriggerServerEvent('prp-hud:Server:GainStress', 25)
    end
    deliveryTimeout = 0
end

function checkPedDistance()
    local PlayerPeds = {}
    if next(PlayerPeds) == nil then
        for _, player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)
            table.insert(PlayerPeds, ped)
        end
    end
    
    local closestPed, closestDistance = PRPCore.Functions.GetClosestPed(coords, PlayerPeds)

    if closestDistance < 60 and closestPed ~= 0 then
        local callChance = math.random(1, 100)

        if callChance < 50 then
            doPoliceAlert()
        end
    end
end

function doPoliceAlert()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then 
        streetLabel = streetLabel .. " " .. street2
    end

    TriggerServerEvent('prp-drugs:server:callCops', streetLabel, pos)
end

RegisterNetEvent('prp-drugs:client:robberyCall')
AddEventHandler('prp-drugs:client:robberyCall', function(msg, streetLabel, coords)
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    TriggerEvent("chatMessage", "911-DISPATCH", "error", msg)
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 458)
    SetBlipColour(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipAlpha(blip, transG)
    SetBlipScale(blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("911: Drugactivity")
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
end)

RegisterNetEvent('prp-drugs:client:sendDeliveryMail')
AddEventHandler('prp-drugs:client:sendDeliveryMail', function(type, deliveryData)
    if type == 'perfect' then
        TriggerServerEvent('prp-phone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = "Delivery",
            message = "You did a good job ;)<br><br>Greets, "..Config.Dealers[deliveryData["dealer"]]["name"]
        })
    elseif type == 'bad' then
        TriggerServerEvent('prp-phone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = "Delivery",
            message = "Dont fuck up your next delivery again, or else..."
        })
    elseif type == 'late' then
        TriggerServerEvent('prp-phone:server:sendNewMail', {
            sender = Config.Dealers[deliveryData["dealer"]]["name"],
            subject = "Delivery",
            message = "You were too late, dont dissapoint me again."
        })
    end
end)