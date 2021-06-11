----------------
-- Core Stuff --
----------------
PRPCore = nil

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(200)
	end
end)


---------------
-- Variables --
---------------
inside = false
inhouse = false
closesthouse = nil
hasKey = false
isOwned = false

isLoggedIn = false
local contractOpen = false

local cam = nil
local viewCam = false

local FrontCam = false

stashLocation = nil
outfitLocation = nil
logoutLocation = nil

local OwnedHouseBlips = {}

local CurrentDoorBell = 0
local rangDoorbell = nil

local houseObj = {}
local POIOffsets = nil
local entering = false
local data = nil

local CurrentHouse = nil

local inHoldersMenu = false

local availableKeys = nil
local ownedPlayerHouses = nil

local RamsDone = 0


---------------------
-- Citizen Threads --
---------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)

        if isLoggedIn then
            if not inside then
                SetClosestHouse()
            end
        end
    end
end)

Citizen.CreateThread(function()

    -- This is for the real estate agency blip
    local blip = AddBlipForCoord(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)
    SetBlipSprite(blip, 374)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.6)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(blip)

    while true do
        Citizen.Wait(1)
        local inRange = false
        if isLoggedIn and PRPCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z, true) < 1.5 or GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, true) < 1.5 then
                inRange = true
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z, true) < 1.5) then
                    DrawText3D(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z, "~g~E~w~ - Enter")
                    if IsControlJustReleased(0, 38) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        SetEntityCoords(PlayerPedId(), Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), Config.Locations["inside"].coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, true) < 1.5) then
                    DrawText3D(Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, "~g~E~w~ - Exit")
                    if IsControlJustReleased(0, 38) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end
        end
        if not inRange then
            Citizen.Wait(2500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local inRange = false

        if closesthouse ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, false) < 30)then
                inRange = true
                if hasKey then
                    -- ENTER HOUSE
                    if not inside then
                        if closesthouse ~= nil then
                            if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5)then
                                DrawText3Ds(Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, '~b~/enter~w~ - to enter house')
                            end
                        end
                    end

                    if CurrentDoorBell ~= 0 then
                        if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[closesthouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[closesthouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                            DrawText3Ds(Config.Houses[closesthouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[closesthouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[closesthouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z + 0.35, '~g~G~w~ - Enter')
                            if IsControlJustPressed(0, 47) then
                                TriggerServerEvent("prp-houses:server:OpenDoor", CurrentDoorBell, closesthouse)
                                CurrentDoorBell = 0
                            end
                        end
                    end
                    -- EXIT HOUSE
                    if inside then
                        if not entering then
                            if POIOffsets ~= nil then
                                if POIOffsets.exit ~= nil then
                                    if(GetDistanceBetweenCoords(pos, Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                                        DrawText3Ds(Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To leave house')
                                        DrawText3Ds(Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z - 0.1, '~g~H~w~ - Check doorcam')
                                        if IsControlJustPressed(0, 38) then
                                            leaveOwnedHouse(CurrentHouse)
                                        end
                                        if IsControlJustPressed(0, 74) then
                                            FrontDoorCam(Config.Houses[CurrentHouse].coords.enter)
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    if not isOwned then
                        if closesthouse ~= nil then
                            if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5)then
                                if not viewCam and Config.Houses[closesthouse].locked then
                                    DrawText3Ds(Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, '~g~E~w~ - To view the house')
                                    if IsControlJustPressed(0, 38) then
                                        TriggerServerEvent('prp-houses:server:viewHouse', closesthouse)
                                    end
                                end
                            end
                        end
                    elseif isOwned then
                        if closesthouse ~= nil then
                            if not inOwned then
                            elseif inOwned then
                                if POIOffsets ~= nil then
                                    if POIOffsets.exit ~= nil then
                                        if(GetDistanceBetweenCoords(pos, Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                                            DrawText3Ds(Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To exit house')
                                            if IsControlJustPressed(0, 38) then
                                                leaveNonOwnedHouse(CurrentHouse)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if inside and not isOwned then
                        if not entering then
                            if POIOffsets ~= nil then
                                if POIOffsets.exit ~= nil then
                                    if(GetDistanceBetweenCoords(pos, Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                                        DrawText3Ds(Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To exit house')
                                        if IsControlJustPressed(0, 38) then
                                            leaveNonOwnedHouse(CurrentHouse)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                local StashObject = nil
                -- STASH
                if inside then
                    if CurrentHouse ~= nil then
                        if stashLocation ~= nil then
                            if(GetDistanceBetweenCoords(pos, stashLocation.x, stashLocation.y, stashLocation.z, true) < 1.5)then
                                DrawText3Ds(stashLocation.x, stashLocation.y, stashLocation.z, '~g~E~w~ - Stash')
                                if IsControlJustPressed(0, 38) then
                                    TriggerServerEvent("inventory:server:OpenInventory", "house", CurrentHouse)
                                    TriggerEvent("inventory:client:SetCurrentStash", CurrentHouse)
                                end
                            elseif(GetDistanceBetweenCoords(pos, stashLocation.x, stashLocation.y, stashLocation.z, true) < 3)then
                                DrawText3Ds(stashLocation.x, stashLocation.y, stashLocation.z, 'Stash')
                            end
                        end
                    end
                end

                if inside then
                    if CurrentHouse ~= nil then
                        local near = IsNearObject()
                        if near ~= false then
                            nearStash = true
                            DrawText3Ds(near.coords.x, near.coords.y, near.coords.z, '~g~E~w~ - Open Safe')
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent("inventory:client:SetCurrentStash", near.text)
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", near.text, {
                                    maxweight = 500000,
                                    slots = 10,
                                })
                            end
                        end
                    end
                end

                if inside then
                    if CurrentHouse ~= nil then
                        if outfitLocation ~= nil then
                            if(GetDistanceBetweenCoords(pos, outfitLocation.x, outfitLocation.y, outfitLocation.z, true) < 1.5)then
                                DrawText3Ds(outfitLocation.x, outfitLocation.y, outfitLocation.z, '~g~E~w~ - Outfits')
                                if IsControlJustPressed(0, 38) then
                                    TriggerEvent('prp-clothing_new:client:openOutfitMenu')
                                end
                            elseif(GetDistanceBetweenCoords(pos, outfitLocation.x, outfitLocation.y, outfitLocation.z, true) < 3)then
                                DrawText3Ds(outfitLocation.x, outfitLocation.y, outfitLocation.z, 'Outfits')
                            end
                        end
                    end
                end

                if inside then
                    if CurrentHouse ~= nil then
                        if logoutLocation ~= nil then
                            if(GetDistanceBetweenCoords(pos, logoutLocation.x, logoutLocation.y, logoutLocation.z, true) < 1.5)then
                                DrawText3Ds(logoutLocation.x, logoutLocation.y, logoutLocation.z, '~g~E~w~ - Logout')
                                if IsControlJustPressed(0, 38) then
                                    DoScreenFadeOut(250)
                                    while not IsScreenFadedOut() do
                                        Citizen.Wait(10)
                                    end
                                    exports['prp-interior']:DespawnInterior(houseObj, function()
                                        -- TriggerEvent('prp-weathersync:client:EnableSync')
                                        SetEntityCoords(GetPlayerPed(-1), Config.Houses[CurrentHouse].coords.enter.x, Config.Houses[CurrentHouse].coords.enter.y, Config.Houses[CurrentHouse].coords.enter.z + 0.5)
                                        SetEntityHeading(GetPlayerPed(-1), Config.Houses[CurrentHouse].coords.enter.h)
                                        inOwned = false
                                        inside = false
                                        TriggerServerEvent('prp-houses:server:LogoutLocation')
                                    end)
                                end
                            elseif(GetDistanceBetweenCoords(pos, logoutLocation.x, logoutLocation.y, logoutLocation.z, true) < 3)then
                                DrawText3Ds(logoutLocation.x, logoutLocation.y, logoutLocation.z, 'Logout')
                            end
                        end
                    end
                end
            end
        end
        if not inRange then
            Citizen.Wait(1500)
        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if inHoldersMenu then
            Menu.renderGUI()
        end
    end
end)

------------
-- Events --
------------

-- Things that happen on load or unload
RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()

    -- Tell the script that you are logged in
    isLoggedIn = true

    -- This calls back the housing config from the server.
    TriggerServerEvent('prp-houses:server:setHouses')

    -- This loops over the config and determines which house is closest. It then check to see if you have the key to get in, and if you own it.
    -- This ultimately is responsible for populating isOwned and hasKey.
    SetClosestHouse()

    -- Set up the housing blips. TODO: it looops over the server config to do this, don't we already have this info?
    TriggerEvent('prp-houses:client:setupHouseBlips')
    Citizen.Wait(100)

    -- Call to garage script to set your garage. TODO: Add a nil check here for the two inputs, don't do it if we don't have houses.
    TriggerEvent('prp-garages:client:setHouseGarage', closesthouse, hasKey)
end)

RegisterNetEvent("PRPCore:Client:OnJobUpdate")
AddEventHandler("PRPCore:Client:OnJobUpdate", function()
    TriggerEvent("prp-houses:client:updateDataTables")
end)

-- Unload everything if switching characters
RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    inside = false
    closesthouse = nil
    hasKey = false
    isOwned = false
    for k, v in pairs(OwnedHouseBlips) do
        RemoveBlip(v)
    end
end)

-- This event is for fixing where the client does not think you're inside.
RegisterNetEvent('prp-houses:client:iaminside')
AddEventHandler('prp-houses:client:iaminside', function()
    inside = true
end)

RegisterNetEvent('prp-houses:client:sellHouse')
AddEventHandler('prp-houses:client:sellHouse', function()
    if closesthouse ~= nil and hasKey then
        TriggerServerEvent('prp-houses:server:viewHouse', closesthouse)
    end
end)


RegisterNetEvent('prp-houses:client:EnterHouse')
AddEventHandler('prp-houses:client:EnterHouse', function()
    SetClosestHouse()

    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)

    if closesthouse ~= nil then
        local dist = GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true)
        if dist < 1.5 then
            if hasKey then
                enterOwnedHouse(closesthouse)
            else
                if not Config.Houses[closesthouse].locked then
                    enterNonOwnedHouse(closesthouse)
                end
            end
        end
    end
end)

RegisterNetEvent('prp-houses:client:RequestRing')
AddEventHandler('prp-houses:client:RequestRing', function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)

    if closesthouse ~= nil then
        TriggerServerEvent('prp-houses:server:RingDoor', closesthouse)
    end
end)


RegisterNetEvent('prp-houses:client:setHouseConfig')
AddEventHandler('prp-houses:client:setHouseConfig', function(houseConfig)
    Config.Houses = houseConfig
    TriggerEvent("prp-houses:client:updateDataTables")
    --TriggerEvent("prp-houses:client:refreshHouse")
end)

RegisterNetEvent('prp-houses:client:lockHouse')
AddEventHandler('prp-houses:client:lockHouse', function(bool, house)
    Config.Houses[house].locked = bool
end)

RegisterNetEvent('prp-houses:client:createHouses')
AddEventHandler('prp-houses:client:createHouses', function(price, tier)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local heading = GetEntityHeading(GetPlayerPed(-1))
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street = GetStreetNameFromHashKey(s1)
    local coords = {
        enter 	= { x = pos.x, y = pos.y, z = pos.z, h = heading},
        cam 	= { x = pos.x, y = pos.y, z = pos.z, h = heading, yaw = -10.00},
    }
    street = street:gsub("%-", " ")
    TriggerServerEvent(
            "prp-log:server:CreateLog",
            "housing",
            "House Created",
            "red",
            ("**%s** created house. Price: %s. Tier: %s. Location: %s"):format(
                    GetPlayerName(PlayerId()),
                    price,
                    tier,
                    street
            )
    )
    TriggerServerEvent('prp-houses:server:addNewHouse', street, coords, price, tier)
end)

RegisterNetEvent('prp-houses:client:evict')
AddEventHandler('prp-houses:client:evict', function()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)

    if closesthouse ~= nil then
        if (GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5) then
            TriggerServerEvent("prp-houses:server:evict", closesthouse)
            TriggerEvent("chatMessage", "Construction Crew", "success", "Message recieved, Tenant has been Evicted.  Instruct tenants NOT to enter this house.  Renovations will complete after the next storm, and the house will be put back up for sale.")
        else
            PRPCore.Functions.Notify("You are not close enough to a house", "error", 5000)
        end
    end
end)

RegisterNetEvent('prp-houses:client:deleteHouse')
AddEventHandler('prp-houses:client:deleteHouse', function()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)

    if closesthouse ~= nil then
        if (GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5) then
            TriggerServerEvent("prp-log:server:CreateLog", "housing", "House Deleted", "red", "**"..GetPlayerName(PlayerId()).."** deleted house: "..closesthouse)
            TriggerServerEvent("prp-houses:server:deleteHouse", closesthouse)
            TriggerEvent("chatMessage", "Construction Crew", "success", "Message Recieved, instruct any tenants NOT to enter this house. The house will be demolished by the end of the next storm.")
        else
            PRPCore.Functions.Notify("You are not close enough to a house", "error", 5000)
        end
    end
end)

RegisterNetEvent('prp-houses:client:addGarage')
AddEventHandler('prp-houses:client:addGarage', function(addr)
    local house = addr ~= nil and addr or closesthouse
    if house ~= nil then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local heading = GetEntityHeading(GetPlayerPed(-1))
        local coords = {
            x = pos.x,
            y = pos.y,
            z = pos.z,
            h = heading,
        }
        TriggerServerEvent('prp-houses:server:addGarage', house, coords)
    else
        PRPCore.Functions.Notify("No house nearby..", "error")
    end
end)

RegisterNetEvent("prp-houses:client:getAddress")
AddEventHandler("prp-houses:client:getAddress", function()
    SetClosestHouse()
    if closesthouse ~= nil then
        TriggerEvent("chatMessage", "Real Estate Agency", "success", ("The address here is %s"):format(closesthouse))
        exports.CopyCoords:CopyText(closesthouse)
    else
        PRPCore.Functions.Notify("No house nearby...", "error")
    end
end)

RegisterNetEvent("prp-houses:client:changeLocks")
AddEventHandler("prp-houses:client:changeLocks", function()
    SetClosestHouse()
    if closesthouse ~= nil then
        TriggerServerEvent("prp-houses:server:changeLocks", closesthouse)
        PRPCore.Functions.Notify(("Locks removed from %s"):format(closesthouse))
    else
        PRPCore.Functions.Notify("No house nearby...", "error")
    end
end)

RegisterNetEvent("prp-houses:client:updateNearestHouse")
AddEventHandler("prp-houses:client:updateNearestHouse", function()
    TriggerServerEvent('prp-houses:client:setHouses')
    isLoggedIn = true
    SetClosestHouse()
    TriggerEvent('prp-houses:client:setupHouseBlips')
    Citizen.Wait(1000)
    TriggerEvent('prp-garages:client:setHouseGarage', closesthouse, hasKey)
    TriggerServerEvent("prp-houses:server:setHouses")
end)

RegisterNetEvent('prp-houses:client:toggleDoorlock')
AddEventHandler('prp-houses:client:toggleDoorlock', function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)

    if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5)then
        if hasKey then
            if Config.Houses[closesthouse].locked then
                TriggerServerEvent('prp-houses:server:lockHouse', false, closesthouse)
                PRPCore.Functions.Notify("Front door unlocked!", "success", 2500)
            else
                TriggerServerEvent('prp-houses:server:lockHouse', true, closesthouse)
                PRPCore.Functions.Notify("Front door locked!", "error", 2500)
            end
        else
            PRPCore.Functions.Notify("You dont have the keys to this house...", "error", 3500)
        end
    else
        PRPCore.Functions.Notify("There is no door??", "error", 3500)
    end
end)


RegisterNetEvent('prp-houses:client:RingDoor')
AddEventHandler('prp-houses:client:RingDoor', function(player, house)
    if closesthouse == house and inside then
        CurrentDoorBell = player
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "doorbell", 0.1)
        PRPCore.Functions.Notify("Somebody is ringing the door!")
    end
end)



RegisterNetEvent('prp-houses:client:giveHouseKey')
AddEventHandler('prp-houses:client:giveHouseKey', function(data)
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 and closesthouse ~= nil then
        local playerId = GetPlayerServerId(player)
        local enter = Config.Houses[closesthouse].coords.enter
        local housedist = #(GetEntityCoords(GetPlayerPed(-1)) - vector3(enter.x, enter.y, enter.z))

        if housedist < 10 or inhouse then
            TriggerServerEvent('prp-houses:server:giveHouseKey', playerId, closesthouse)
        else
            PRPCore.Functions.Notify("You are not close enough to the house..", "error")
        end
    elseif closesthouse == nil then
        PRPCore.Functions.Notify("No house nearby!", "error")
    else
        PRPCore.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('prp-houses:client:removeHouseKey')
AddEventHandler('prp-houses:client:removeHouseKey', function(data)
    if closesthouse ~= nil then
        local enter = Config.Houses[closesthouse].coords.enter
        local housedist = #(GetEntityCoords(GetPlayerPed(-1)) - vector3(enter.x, enter.y, enter.z))
        if housedist < 10 or inhouse then
            PRPCore.Functions.TriggerCallback('prp-houses:server:getHouseOwner', function(result)
                if PRPCore.Functions.GetPlayerData().citizenid == result then
                    inHoldersMenu = true
                    HouseKeysMenu()
                    Menu.hidden = not Menu.hidden
                else
                    PRPCore.Functions.Notify("You are not the home owner..", "error")
                end
            end, closesthouse)
        else
            PRPCore.Functions.Notify("You are not close enough to the house..", "error")
        end
    else
        PRPCore.Functions.Notify("You are not close enough to the house..", "error")
    end
end)

RegisterNetEvent('prp-houses:client:refreshHouse')
AddEventHandler('prp-houses:client:refreshHouse', function(data)
    Citizen.Wait(1000)
    SetClosestHouse()
    --TriggerEvent('prp-garages:client:setHouseGarage', closesthouse, hasKey)
end)

RegisterNetEvent('prp-houses:client:SpawnInApartment')
AddEventHandler('prp-houses:client:SpawnInApartment', function(house)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    if rangDoorbell ~= nil then
        if(GetDistanceBetweenCoords(pos, Config.Houses[house].coords.enter.x, Config.Houses[house].coords.enter.y, Config.Houses[house].coords.enter.z, true) > 5)then
            return
        end
    end
    closesthouse = house
    enterNonOwnedHouse(house)
end)


RegisterNetEvent('prp-houses:client:enterOwnedHouse')
AddEventHandler('prp-houses:client:enterOwnedHouse', function(house)
    PRPCore.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.metadata["injail"] == 0 then
			enterOwnedHouse(house)
		end
	end)
end)

RegisterNUICallback('HasEnoughMoney', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-houses:server:HasEnoughMoney', function(hasEnough)

    end, data.objectData)
end)

RegisterNetEvent('prp-houses:client:LastLocationHouse')
AddEventHandler('prp-houses:client:LastLocationHouse', function(houseId)
    PRPCore.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.metadata["injail"] == 0 then
			enterOwnedHouse(houseId)
		end
	end)
end)



RegisterNetEvent('prp-houses:client:setupHouseBlips')
AddEventHandler('prp-houses:client:setupHouseBlips', function()
    Citizen.CreateThread(function()
        Citizen.Wait(10000)
        if isLoggedIn then
            PRPCore.Functions.TriggerCallback('prp-houses:server:getOwnedHouses', function(ownedHouses)
                if ownedHouses ~= nil then
                    for k, v in pairs(ownedHouses) do
                        local house = Config.Houses[ownedHouses[k]]
                        HouseBlip = AddBlipForCoord(house.coords.enter.x, house.coords.enter.y, house.coords.enter.z)

                        SetBlipSprite (HouseBlip, 40)
                        SetBlipDisplay(HouseBlip, 4)
                        SetBlipScale  (HouseBlip, 0.65)
                        SetBlipAsShortRange(HouseBlip, true)
                        SetBlipColour(HouseBlip, 3)

                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentSubstringPlayerName(house.adress)
                        EndTextCommandSetBlipName(HouseBlip)

                        table.insert(OwnedHouseBlips, HouseBlip)
                    end
                end
            end)
        end
    end)
end)

RegisterNetEvent('prp-houses:client:SetClosestHouse')
AddEventHandler('prp-houses:client:SetClosestHouse', function()
    SetClosestHouse()
end)


RegisterNUICallback('buy', function()
    openContract(false)
    disableViewCam()
    TriggerServerEvent('prp-houses:server:buyHouse', closesthouse)
end)

RegisterNUICallback('exit', function()
    openContract(false)
    disableViewCam()
end)

RegisterNetEvent('prp-houses:client:viewHouse')
AddEventHandler('prp-houses:client:viewHouse', function(houseprice, brokerfee, bankfee, taxes, firstname, lastname)
    setViewCam(Config.Houses[closesthouse].coords.cam, Config.Houses[closesthouse].coords.cam.h, Config.Houses[closesthouse].coords.yaw)
    Citizen.Wait(500)
    openContract(true)
    SendNUIMessage({
        type = "setupContract",
        firstname = firstname,
        lastname = lastname,
        street = Config.Houses[closesthouse].adress,
        houseprice = houseprice,
        brokerfee = brokerfee,
        bankfee = bankfee,
        taxes = taxes,
        totalprice = (houseprice + brokerfee + bankfee + taxes)
    })
end)

RegisterNetEvent('prp-houses:client:setLocation')
AddEventHandler('prp-houses:client:setLocation', function(data)
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local coords = {x = pos.x, y = pos.y, z = pos.z}

    if inside then
        if hasKey then
            if data.id == 'setstash' then
                TriggerServerEvent('prp-houses:server:setLocation', coords, closesthouse, 1)
            elseif data.id == 'setoutift' then
                TriggerServerEvent('prp-houses:server:setLocation', coords, closesthouse, 2)
            elseif data.id == 'setlogout' then
                TriggerServerEvent('prp-houses:server:setLocation', coords, closesthouse, 3)
            end
        else
            PRPCore.Functions.Notify('You are not the home owner..', 'error')
        end
    else
        PRPCore.Functions.Notify('You are not in a house..', 'error')
    end
end)

RegisterNetEvent('prp-houses:client:refreshLocations')
AddEventHandler('prp-houses:client:refreshLocations', function(house, location, type)
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)

    if closesthouse == house then
        if inside then
            if type == 1 then
                stashLocation = json.decode(location)
            elseif type == 2 then
                outfitLocation = json.decode(location)
            elseif type == 3 then
                logoutLocation = json.decode(location)
            end
        end
    end
end)




RegisterNetEvent('prp-houses:client:HomeInvasion')
AddEventHandler('prp-houses:client:HomeInvasion', function()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local Skillbar = exports['prp-skillbar']:GetSkillbarObject()
    if closesthouse ~= nil then
        PRPCore.Functions.TriggerCallback('police:server:IsPoliceForcePresent', function(IsPresent)
            if IsPresent then
                local dist = GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true)
                if Config.Houses[closesthouse].IsRaming == nil then
                    Config.Houses[closesthouse].IsRaming = false
                end

                if dist < 1 then
                    if Config.Houses[closesthouse].locked then
                        if not Config.Houses[closesthouse].IsRaming then
                            DoRamAnimation(true)
                            Skillbar.Start({
                                duration = math.random(5000, 10000),
                                pos = math.random(10, 30),
                                width = math.random(10, 20),
                            }, function()
                                if RamsDone + 1 >= Config.RamsNeeded then
                                    TriggerServerEvent('prp-houses:server:lockHouse', false, closesthouse)
                                    PRPCore.Functions.Notify('Door breached succesfully.', 'success')
                                    TriggerServerEvent("prp-log:server:CreateLog", "stormram", "STORMRAM", "red", "**" ..GetPlayerName(PlayerId()).. "** used ram on house: "..closesthouse)
                                    TriggerServerEvent('prp-houses:server:SetHouseRammed', true, closesthouse)
                                    DoRamAnimation(false)
                                else
                                    DoRamAnimation(true)
                                    Skillbar.Repeat({
                                        duration = math.random(500, 1000),
                                        pos = math.random(10, 30),
                                        width = math.random(5, 12),
                                    })
                                    RamsDone = RamsDone + 1
                                end
                            end, function()
                                RamsDone = 0
                                TriggerServerEvent('prp-houses:server:SetRamState', false, closesthouse)
                                PRPCore.Functions.Notify('Failed to breach, try again..', 'error')
                                DoRamAnimation(false)
                            end)
                            TriggerServerEvent('prp-houses:server:SetRamState', true, closesthouse)
                        else
                            PRPCore.Functions.Notify('Someone is already working on the door..', 'error')
                        end
                    else
                        PRPCore.Functions.Notify('This house does not need to be breached..', 'error')
                    end
                else
                    PRPCore.Functions.Notify('Not close enough..', 'error')
                end
            else
                PRPCore.Functions.Notify('No supervisor present..', 'error')
            end
        end)
    else
        PRPCore.Functions.Notify('Not close enough..', 'error')
    end
end)

RegisterNetEvent('prp-houses:client:SetRamState')
AddEventHandler('prp-houses:client:SetRamState', function(bool, house)
    Config.Houses[house].IsRaming = bool
end)

RegisterNetEvent('prp-houses:client:SetHouseRammed')
AddEventHandler('prp-houses:client:SetHouseRammed', function(bool, house)
    Config.Houses[house].IsRammed = bool
end)

RegisterNetEvent('prp-houses:client:ResetHouse')
AddEventHandler('prp-houses:client:ResetHouse', function()
    local ped = GetPlayerPed(-1)

    if closesthouse ~= nil then
        if Config.Houses[closesthouse].IsRammed == nil then
            Config.Houses[closesthouse].IsRammed = false
            TriggerServerEvent('prp-houses:server:SetHouseRammed', false, closesthouse)
            TriggerServerEvent('prp-houses:server:SetRamState', false, closesthouse)
        end
        if Config.Houses[closesthouse].IsRammed then
            openHouseAnim()
            TriggerServerEvent('prp-houses:server:SetHouseRammed', false, closesthouse)
            TriggerServerEvent('prp-houses:server:SetRamState', false, closesthouse)
            TriggerServerEvent('prp-houses:server:lockHouse', true, closesthouse)
            RamsDone = 0
            PRPCore.Functions.Notify('You have locked the house..', 'success')
        else
            PRPCore.Functions.Notify('This door is not breached..', 'error')
        end
    end
end)

RegisterNetEvent("prp-houses:client:MarkHouse")
AddEventHandler("prp-houses:client:MarkHouse", function(coords)
    local c = json.decode(coords)
    SetNewWaypoint(c.x, c.y)
end)






---------------
-- Functions --
---------------

DrawText3Ds = function(x, y, z, text)
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

function openHouseAnim()
    loadAnimDict("anim@heists@keycard@")
    TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(GetPlayerPed(-1))
end


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

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function HouseKeysMenu()
    ped = GetPlayerPed(-1);
    MenuTitle = "Housekeys"
    ClearMenu()
    PRPCore.Functions.TriggerCallback('prp-houses:server:getHouseKeyHolders', function(holders)
        ped = GetPlayerPed(-1);
        MenuTitle = "Housekeys:"
        ClearMenu()
        if holders == nil or next(holders) == nil then
            PRPCore.Functions.Notify("No key owners found..", "error", 3500)
            closeMenuFull()
        else
            for k, v in pairs(holders) do
                Menu.addButton(holders[k].firstname .. " " .. holders[k].lastname, "optionMenu", holders[k])
            end
        end
        Menu.addButton("Close Menu", "closeMenuFull", nil)
    end, closesthouse)
end

function changeOutfit()
	Wait(200)
    loadAnimDict("clothingshirt")
	TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	Wait(3100)
	TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function optionMenu(citizenData)
    ped = GetPlayerPed(-1);
    MenuTitle = "What now?"
    ClearMenu()
    Menu.addButton("Delete key", "removeHouseKey", citizenData)
    Menu.addButton("Back", "HouseKeysMenu",nil)
end

function removeHouseKey(citizenData)
    TriggerServerEvent('prp-houses:server:removeHouseKey', closesthouse, citizenData)
    closeMenuFull()
end

function removeOutfit(oData)
    TriggerServerEvent('clothes:removeOutfit', oData.outfitname)
    PRPCore.Functions.Notify(oData.outfitname.." is removed", "success", 2500)
    closeMenuFull()
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    inHoldersMenu = false
    ClearMenu()
end

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

function openContract(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "toggle",
        status = bool,
    })
    contractOpen = bool
end

function enterOwnedHouse(house)
    inhouse = true
    CurrentHouse = house
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    inside = true
    Citizen.Wait(250)
    local coords = { x = Config.Houses[house].coords.enter.x, y = Config.Houses[house].coords.enter.y, z= Config.Houses[house].coords.enter.z - Config.MinZOffset}
    LoadDecorations(house)

    if Config.Houses[house].tier == 1 then
        data = exports['prp-interior']:CreateTier1House(coords)
    elseif Config.Houses[house].tier == 2 then
        data = exports['prp-interior']:CreateTrevorsShell(coords)
    elseif Config.Houses[house].tier == 3 then
        data = exports['prp-interior']:CreateMichaelShell(coords)
    elseif Config.Houses[house].tier == 4 then
        data = exports['prp-interior']:CreateDeluxeShell(coords)
    elseif Config.Houses[house].tier == 5 then
        data = exports['prp-interior']:CreateTrailerShell(coords)
    elseif Config.Houses[house].tier == 6 then
        data = exports['prp-interior']:CreateLesterShell(coords)
    elseif Config.Houses[house].tier == 7 then
        data = exports['prp-interior']:CreateHighEnd2Shell(coords)
    elseif Config.Houses[house].tier == 8 then
        data = exports['prp-interior']:CreateHighEndApartment1(coords)
    end

    Citizen.Wait(100)
    houseObj = data[1]
    POIOffsets = data[2]
    inside = true
    entering = true
    TriggerServerEvent('prp-houses:server:SetInsideMeta', house, true)
    Citizen.Wait(500)
    SetRainFxIntensity(0.0)
    -- TriggerEvent('prp-weathersync:client:DisableSync')
    TriggerEvent('prp-weed:client:getHousePlants', house)
    Citizen.Wait(100)
    -- SetWeatherTypePersist('EXTRASUNNY')
    -- SetWeatherTypeNow('EXTRASUNNY')
    -- SetWeatherTypeNowPersist('EXTRASUNNY')
    -- NetworkOverrideClockTime(23, 0, 0)
    entering = false
    setHouseLocations()
end


function leaveOwnedHouse(house)
    inhouse = false
    if not FrontCam then
    inside = false
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Citizen.Wait(250)
    DoScreenFadeOut(250)
    Citizen.Wait(500)
    exports['prp-interior']:DespawnInterior(houseObj, function()
        UnloadDecorations()
        -- TriggerEvent('prp-weathersync:client:EnableSync')
        Citizen.Wait(250)
        DoScreenFadeIn(250)
        SetEntityCoords(GetPlayerPed(-1), Config.Houses[CurrentHouse].coords.enter.x, Config.Houses[CurrentHouse].coords.enter.y, Config.Houses[CurrentHouse].coords.enter.z + 0.2)
        SetEntityHeading(GetPlayerPed(-1), Config.Houses[CurrentHouse].coords.enter.h)
        TriggerEvent('prp-weed:client:leaveHouse')
        TriggerServerEvent('prp-houses:server:SetInsideMeta', house, false)
        CurrentHouse = nil
     end)
  end
end

function enterNonOwnedHouse(house)
    CurrentHouse = house
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    inside = true
    Citizen.Wait(250)
    local coords = { x = Config.Houses[closesthouse].coords.enter.x, y = Config.Houses[closesthouse].coords.enter.y, z= Config.Houses[closesthouse].coords.enter.z - Config.MinZOffset}
    LoadDecorations(house)

    if Config.Houses[house].tier == 1 then
        data = exports['prp-interior']:CreateTier1House(coords)
    elseif Config.Houses[house].tier == 2 then
        data = exports['prp-interior']:CreateTrevorsShell(coords)
    elseif Config.Houses[house].tier == 3 then
        data = exports['prp-interior']:CreateMichaelShell(coords)
    elseif Config.Houses[house].tier == 4 then
        data = exports['prp-interior']:CreateDeluxeShell(coords)
    elseif Config.Houses[house].tier == 5 then
        data = exports['prp-interior']:CreateTrailerShell(coords)
    elseif Config.Houses[house].tier == 6 then
        data = exports['prp-interior']:CreateLesterShell(coords)
    elseif Config.Houses[house].tier == 7 then
        data = exports['prp-interior']:CreateHighEnd2Shell(coords)
    elseif Config.Houses[house].tier == 8 then
        data = exports['prp-interior']:CreateHighEndApartment1(coords)
    end

    houseObj = data[1]
    POIOffsets = data[2]
    entering = true
    Citizen.Wait(500)
    SetRainFxIntensity(0.0)
    TriggerServerEvent('prp-houses:server:SetInsideMeta', house, true)
    -- TriggerEvent('prp-weathersync:client:DisableSync')
    TriggerEvent('prp-weed:client:getHousePlants', house)
    Citizen.Wait(100)
    -- SetWeatherTypePersist('EXTRASUNNY')
    -- SetWeatherTypeNow('EXTRASUNNY')
    -- SetWeatherTypeNowPersist('EXTRASUNNY')
    -- NetworkOverrideClockTime(23, 0, 0)
    entering = false
    inOwned = true
    setHouseLocations()
end


function leaveNonOwnedHouse(house)
    inhouse = false
    if not FrontCam then
    inside = false
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Citizen.Wait(250)
    DoScreenFadeOut(250)
    Citizen.Wait(500)
    exports['prp-interior']:DespawnInterior(houseObj, function()
        UnloadDecorations()
        -- TriggerEvent('prp-weathersync:client:EnableSync')
        Citizen.Wait(250)
        DoScreenFadeIn(250)
        SetEntityCoords(GetPlayerPed(-1), Config.Houses[CurrentHouse].coords.enter.x, Config.Houses[CurrentHouse].coords.enter.y, Config.Houses[CurrentHouse].coords.enter.z + 0.2)
        SetEntityHeading(GetPlayerPed(-1), Config.Houses[CurrentHouse].coords.enter.h)
        inOwned = false
        TriggerEvent('prp-weed:client:leaveHouse')
        TriggerServerEvent('prp-houses:server:SetInsideMeta', house, false)
        CurrentHouse = nil
    end)
  end
end

RegisterNetEvent("prp-houses:client:updateDataTables")
AddEventHandler("prp-houses:client:updateDataTables", function()
    availableKeys = GetAvailableKeys()
end)

function setViewCam(coords, h, yaw)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords.x, coords.y, coords.z, yaw, 0.00, h, 80.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    viewCam = true
end


function FrontDoorCam(coords)
    DoScreenFadeOut(150)
    Citizen.Wait(500)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords.x, coords.y, coords.z + 0.5, 0.0, 0.00, coords.h - 180, 80.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    FrontCam = true
    FreezeEntityPosition(GetPlayerPed(-1), true)
    Citizen.Wait(500)
    DoScreenFadeIn(150)
    SendNUIMessage({
        type = "frontcam",
        toggle = true,
        label = Config.Houses[closesthouse].adress
    })
    Citizen.CreateThread(function()
        while FrontCam do

            local instructions = CreateInstuctionScaleform("instructional_buttons")
            DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
            SetTimecycleModifier("scanline_cam_cheap")
            SetTimecycleModifierStrength(1.0)

            if IsControlJustPressed(1, 177) then
                DoScreenFadeOut(150)
                SendNUIMessage({
                    type = "frontcam",
                    toggle = false,
                })
                Citizen.Wait(500)
                RenderScriptCams(false, true, 500, true, true)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                SetCamActive(cam, false)
                DestroyCam(cam, true)
                ClearTimecycleModifier("scanline_cam_cheap")
                cam = nil
                FrontCam = false
                Citizen.Wait(500)
                DoScreenFadeIn(150)
            end

            local getCameraRot = GetCamRot(cam, 2)

            -- ROTATE UP
            if IsControlPressed(0, Keys["W"]) then
                if getCameraRot.x <= 0.0 then
                    SetCamRot(cam, getCameraRot.x + 0.7, 0.0, getCameraRot.z, 2)
                end
            end

            -- ROTATE DOWN
            if IsControlPressed(0, Keys["S"]) then
                if getCameraRot.x >= -50.0 then
                    SetCamRot(cam, getCameraRot.x - 0.7, 0.0, getCameraRot.z, 2)
                end
            end

            -- ROTATE LEFT
            if IsControlPressed(0, Keys["A"]) then
                SetCamRot(cam, getCameraRot.x, 0.0, getCameraRot.z + 0.7, 2)
            end

            -- ROTATE RIGHT
            if IsControlPressed(0, Keys["D"]) then
                SetCamRot(cam, getCameraRot.x, 0.0, getCameraRot.z - 0.7, 2)
            end

            Citizen.Wait(1)
        end
    end)
end


function CreateInstuctionScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    InstructionButton(GetControlInstructionalButton(1, 194, true))
    InstructionButtonMessage("Close Camera")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end


function InstructionButton(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function InstructionButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function disableViewCam()
    if viewCam then
        RenderScriptCams(false, true, 500, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        viewCam = false
    end
end

function DoRamAnimation(bool)
    local ped = GetPlayerPed(-1)
    local dict = "missheistfbi3b_ig7"
    local anim = "lift_fibagent_loop"

    if bool then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(1)
        end
        TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 1, -1, false, false, false)
    else
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(1)
        end
        TaskPlayAnim(ped, dict, "exit", 8.0, 8.0, -1, 1, -1, false, false, false)
    end
end

function isInHouse()
    return(inhouse)
end

function SetClosestHouse()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil
    if not inside then
        for id, house in pairs(Config.Houses) do
            if current ~= nil then
                if(GetDistanceBetweenCoords(pos, Config.Houses[id].coords.enter.x, Config.Houses[id].coords.enter.y, Config.Houses[id].coords.enter.z, true) < dist)then
                    current = id
                    dist = GetDistanceBetweenCoords(pos, Config.Houses[id].coords.enter.x, Config.Houses[id].coords.enter.y, Config.Houses[id].coords.enter.z, true)
                end
            else
                dist = GetDistanceBetweenCoords(pos, Config.Houses[id].coords.enter.x, Config.Houses[id].coords.enter.y, Config.Houses[id].coords.enter.z, true)
                current = id
            end
        end
        closesthouse = current
        if closesthouse ~= nil then
            PRPCore.Functions.GetPlayerData(function(PlayerData)
                if availableKeys == nil then
                    availableKeys = GetAvailableKeys()
                end
                hasKey = false
                hasKey = availableKeys[closesthouse]
                if PlayerData.job.name == "realestateagent" then
                    hasKey = true
                end
                isOwned = Config.Houses[closesthouse].owned
            end)
        end
    end
    TriggerEvent('prp-garages:client:setHouseGarage', closesthouse, hasKey)
end

function setHouseLocations()
    if closesthouse ~= nil then
        PRPCore.Functions.TriggerCallback('prp-houses:server:getHouseLocations', function(result)
            if result ~= nil then
                if result.stash ~= nil then
                    stashLocation = json.decode(result.stash)
                end

                if result.outfit ~= nil then
                    outfitLocation = json.decode(result.outfit)
                end

                if result.logout ~= nil then
                    logoutLocation = json.decode(result.logout)
                end
            end
        end, closesthouse)
    end
end

function GetAvailableKeys()
    Wait(100)
    local rtval = nil
    PRPCore.Functions.TriggerCallback('prp-houses:server:GetAvailableKeys', function(result)
        rtval = result
    end)
    while rtval == nil do
        Citizen.Wait(100)
    end
    return rtval
end

function DrawText3D(x, y, z, text)
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

function IsNearObject()
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
    local tbl = {}
	for k, v in pairs(Config.Objects) do
	  local closestObj = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 3.0, v.obj, false, 0, 0)
	  local objCoords = GetEntityCoords(closestObj)
	  if closestObj ~= 0 then
		local dist = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, objCoords.x, objCoords.y, objCoords.z, true)
		if dist <= 2 then
			local crunch = math.floor((objCoords.x / objCoords.y) + objCoords.z)
			local text = v.name.."_"..crunch
			local text = v.name.."_"..math.abs(objCoords.x).."_"..math.abs(objCoords.y).."_"..math.abs(objCoords.z)
            tbl = { ["obj"] = closestObj, ["text"] = text, ["coords"] = objCoords}
		  	return tbl
		end
	  end
	end
    return false
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Dump out data structures
function dump(o)
	if type(o) == 'table' then
	   local s = '{ '
	   for k,v in pairs(o) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. dump(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(o)
	end
end

function tprint (tbl, indent)
    if not indent then indent = 0 end
    local toprint = string.rep(" ", indent) .. "{\r\n"
    indent = indent + 2 
    for k, v in pairs(tbl) do
      toprint = toprint .. string.rep(" ", indent)
      if (type(k) == "number") then
        toprint = toprint .. "[" .. k .. "] = "
      elseif (type(k) == "string") then
        toprint = toprint  .. k ..  "= "   
      end
      if (type(v) == "number") then
        toprint = toprint .. v .. ",\r\n"
      elseif (type(v) == "string") then
        toprint = toprint .. "\"" .. v .. "\",\r\n"
      elseif (type(v) == "table") then
        toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
      else
        toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
      end
    end
    toprint = toprint .. string.rep(" ", indent-2) .. "}"
    return toprint
  end
