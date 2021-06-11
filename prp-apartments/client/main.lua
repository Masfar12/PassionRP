PRPCore = nil

local isLoggedIn = false
local InApartment = false
local ClosestHouse = nil
local CurrentApartment = nil
local IsOwned = false

local CurrentDoorBell = 0

local CurrentOffset = 0

local houseObj = {}
local POIOffsets = nil

local rangDoorbell = nil

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
        if isLoggedIn and not InApartment then
            SetClosestApartment()
        end
        Citizen.Wait(10000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn and ClosestHouse ~= nil then
            if InApartment then
                local pos = GetEntityCoords(GetPlayerPed(-1))

                if CurrentDoorBell ~= 0 then
                    if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.exit.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.exit.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.exit.z, true) < 1.2)then
                        PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.exit.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.exit.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.exit.z + 0.1, '~g~G~w~ - Open door')
                        if IsControlJustPressed(0, 47) then
                            TriggerServerEvent("apartments:server:OpenDoor", CurrentDoorBell, CurrentApartment, ClosestHouse)
                            CurrentDoorBell = 0
                        end
                    end
                end
                --exit
                if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.exit.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.exit.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.exit.z, true) < 3)then
                    PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.exit.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.exit.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.exit.z, '~g~E~w~ - Leave Apartment')
                    if IsControlJustPressed(0, 38) then
                        LeaveApartment(ClosestHouse)
                    end
                end
                --stash
                if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.stash.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.stash.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.stash.z, true) < 1.2)then
                    PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.stash.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.stash.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.stash.z, '~g~E~w~ - Stash')
                    if IsControlJustPressed(0, 38) then
                        if CurrentApartment ~= nil then
                            TriggerEvent("inventory:client:SetCurrentStash", CurrentApartment)
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", CurrentApartment)
                        end
                    end
                elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.stash.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.stash.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.stash.z, true) < 3)then
                    PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.stash.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.stash.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.stash.z, 'Stash')
                end
                --outfits
                if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.clothes.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.clothes.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.clothes.z, true) < 1.2)then
                    PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.clothes.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.clothes.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.clothes.z, '~g~E~w~ - Outfits')
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent('prp-clothing_new:client:openOutfitMenu')
                    end
                elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.clothes.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.clothes.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.clothes.z, true) < 3)then
                    PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.clothes.x, Apartments.Locations[ClosestHouse].coords.enter.y - POIOffsets.clothes.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.clothes.z, 'Outfits')
                end
                --logout
                if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.logout.x, Apartments.Locations[ClosestHouse].coords.enter.y + POIOffsets.logout.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.logout.z, true) < 1.5)then
                    PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.logout.x, Apartments.Locations[ClosestHouse].coords.enter.y + POIOffsets.logout.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.logout.z, '~g~E~w~ - Logout')
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('prp-houses:server:LogoutLocation')
                    end
                elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.logout.x, Apartments.Locations[ClosestHouse].coords.enter.y + POIOffsets.logout.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.logout.z, true) < 3)then
                    PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x - POIOffsets.logout.x, Apartments.Locations[ClosestHouse].coords.enter.y + POIOffsets.logout.y, Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset + POIOffsets.logout.z, 'Logout')
                end
            else
                local pos = GetEntityCoords(GetPlayerPed(-1))
                if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.doorbell.x, Apartments.Locations[ClosestHouse].coords.doorbell.y,Apartments.Locations[ClosestHouse].coords.doorbell.z, true) < 1.2)then
                    PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.doorbell.x, Apartments.Locations[ClosestHouse].coords.doorbell.y, Apartments.Locations[ClosestHouse].coords.doorbell.z, '~g~G~w~ - Ring')
                    if IsControlJustPressed(0, 47) then
                        MenuOwners()
                        Menu.hidden = not Menu.hidden
                    end
                    Menu.renderGUI()
                end

                if IsOwned then
                    local pos = GetEntityCoords(GetPlayerPed(-1))
                    if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x, Apartments.Locations[ClosestHouse].coords.enter.y,Apartments.Locations[ClosestHouse].coords.enter.z, true) < 1.2)then
                        PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x, Apartments.Locations[ClosestHouse].coords.enter.y, Apartments.Locations[ClosestHouse].coords.enter.z, '~g~E~w~ - Enter Apartment')
                        if IsControlJustPressed(0, 38) then
                            PRPCore.Functions.TriggerCallback('apartments:GetOwnedApartment', function(result)
                                if result ~= nil then
                                    EnterApartment(ClosestHouse, result.name)
                                end
                            end)
                        end
                    end
                elseif not IsOwned then
                    --[[local pos = GetEntityCoords(GetPlayerPed(-1))
                    if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[ClosestHouse].coords.enter.x, Apartments.Locations[ClosestHouse].coords.enter.y,Apartments.Locations[ClosestHouse].coords.enter.z, true) < 1.2)then
                        PRPCore.Functions.DrawText3D(Apartments.Locations[ClosestHouse].coords.enter.x, Apartments.Locations[ClosestHouse].coords.enter.y, Apartments.Locations[ClosestHouse].coords.enter.z, '~g~G~w~ - Verander van appartement')
                        if IsControlJustPressed(0, 47) then
                            TriggerServerEvent("apartments:server:UpdateApartment", ClosestHouse)
                            IsOwned = true
                        end
                    end]]--
                end
            end
        end

        local pos = GetEntityCoords(GetPlayerPed(-1))
        if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.UpdateApartmentLocation.x, Apartments.UpdateApartmentLocation.y,Apartments.UpdateApartmentLocation.z, true) < 2.5) then
            PRPCore.Functions.DrawText3D(Apartments.UpdateApartmentLocation.x, Apartments.UpdateApartmentLocation.y, Apartments.UpdateApartmentLocation.z, '~g~E~w~ - Move Apartments')
            if IsControlJustPressed(0, 38) then
                closeMenuFull()
                MenuApartments()
                Menu.hidden = not Menu.hidden
            end
            Menu.renderGUI()
        end
        
    end
end)


function ChosenNewApartment(apartment)
    closeMenuFull()
    TriggerServerEvent("apartments:server:UpdateApartment", apartment.name)
    IsOwned = true
end

function ChooseApartment()
    
    ped = GetPlayerPed(-1);
    MenuTitle = "Choose Apartment :"
    ClearMenu()

    Menu.addButton('Choose an Apartment', "yeet", "")

    for k, v in pairs(Apartments.Locations) do
        label = v.label
        Menu.addButton(v.label, "ChosenNewApartment", v, v.name, 'Cost: $10,000')
    end
        
    Menu.addButton("Back", "MenuApartments", nil)
end

function MenuApartments()
    ped = GetPlayerPed(-1);
    MenuTitle = "Apartments"
    ClearMenu()
    TriggerEvent("inmenu",true)
    Menu.addButton("Choose Apartment", "ChooseApartment", nil)
    Menu.addButton("Close Menu", "close", nil) 
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if houseObj ~= nil then
            exports['prp-interior']:DespawnInterior(houseObj, function()
                CurrentApartment = nil
                TriggerEvent('prp-weathersync:client:EnableSync')
                DoScreenFadeIn(500)
                while not IsScreenFadedOut() do
                    Citizen.Wait(10)
                end
                SetEntityCoords(GetPlayerPed(-1), Apartments.Locations[ClosestHouse].coords.enter.x, Apartments.Locations[ClosestHouse].coords.enter.y,Apartments.Locations[ClosestHouse].coords.enter.z)
                SetEntityHeading(GetPlayerPed(-1), Apartments.Locations[ClosestHouse].coords.enter.h)
                Citizen.Wait(1000)
                InApartment = false
                DoScreenFadeIn(1000)
            end)
        end
    end
end)

RegisterNetEvent('apartments:client:setupSpawnUI')
AddEventHandler('apartments:client:setupSpawnUI', function(cData)
    PRPCore.Functions.TriggerCallback('apartments:GetOwnedApartment', function(result)
        if result ~= nil then
            TriggerEvent('prp-spawn:client:setupSpawns', cData, false, nil)
            TriggerEvent('prp-spawn:client:openUI', true)
            TriggerEvent("apartments:client:SetHomeBlip", result.type)
        else
            TriggerEvent('prp-spawn:client:setupSpawns', cData, true, Apartments.Locations)
            TriggerEvent('prp-spawn:client:openUI', true)
        end
    end, cData.citizenid)
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    CurrentApartment = nil
    InApartment = false
    CurrentOffset = 0
end)

RegisterNetEvent('apartments:client:SpawnInApartment')
AddEventHandler('apartments:client:SpawnInApartment', function(apartmentId, apartment)
    --TriggerEvent('instances:client:JoinInstance', apartmentId, apartment)
    if rangDoorbell ~= nil then
        if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Apartments.Locations[rangDoorbell].coords.enter.x, Apartments.Locations[rangDoorbell].coords.enter.y,Apartments.Locations[rangDoorbell].coords.enter.z, true) > 5)then
            return
        end
    end
    ClosestHouse = apartment
    EnterApartment(apartment, apartmentId, true)
    IsOwned = true
end)

RegisterNetEvent('prp-apartments:client:LastLocationHouse')
AddEventHandler('prp-apartments:client:LastLocationHouse', function(apartmentType, apartmentId)
    ClosestHouse = apartmentType
    EnterApartment(apartmentType, apartmentId, false)
end)

RegisterNetEvent('apartments:client:SetHomeBlip')
AddEventHandler('apartments:client:SetHomeBlip', function(home)
    Citizen.CreateThread(function()
        SetClosestApartment()
        for name, apartment in pairs(Apartments.Locations) do
            RemoveBlip(Apartments.Locations[name].blip)

            Apartments.Locations[name].blip = AddBlipForCoord(Apartments.Locations[name].coords.enter.x, Apartments.Locations[name].coords.enter.y, Apartments.Locations[name].coords.enter.z)
            if (name == home) then
                SetBlipSprite(Apartments.Locations[name].blip, 475)
            else
                SetBlipSprite(Apartments.Locations[name].blip, 476)
            end
            SetBlipDisplay(Apartments.Locations[name].blip, 4)
            SetBlipScale(Apartments.Locations[name].blip, 0.50)
            SetBlipAsShortRange(Apartments.Locations[name].blip, true)
            SetBlipColour(Apartments.Locations[name].blip, 3)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName("Motel")
            EndTextCommandSetBlipName(Apartments.Locations[name].blip)
        end
    end)
end)

RegisterNetEvent('apartments:client:RingDoor')
AddEventHandler('apartments:client:RingDoor', function(player, house)
    CurrentDoorBell = player
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "doorbell", 0.1)
    PRPCore.Functions.Notify("Someone is calling at the door")
end)

function EnterApartment(house, apartmentId, new)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
    openHouseAnim()
    Citizen.Wait(250)
    PRPCore.Functions.TriggerCallback('apartments:GetApartmentOffset', function(offset)
        if offset == nil or offset == 0 then
            PRPCore.Functions.TriggerCallback('apartments:GetApartmentOffsetNewOffset', function(newoffset)
                if newoffset > 230 then
                    newoffset = 210
                end
                CurrentOffset = newoffset
                TriggerServerEvent("apartments:server:AddObject", apartmentId, house, CurrentOffset)
                
                local coords = { x = Apartments.Locations[house].coords.enter.x, y = Apartments.Locations[house].coords.enter.y, z = Apartments.Locations[house].coords.enter.z - CurrentOffset}
                data = exports['prp-interior']:CreateApartmentFurnished(coords)
                Citizen.Wait(100)
                houseObj = data[1]
                POIOffsets = data[2]

                InApartment = true
                CurrentApartment = apartmentId
                ClosestHouse = house
                rangDoorbell = nil
                
                Citizen.Wait(500)
                SetRainFxIntensity(0.0)
                TriggerEvent('prp-weathersync:client:DisableSync')
                -- TriggerEvent('tb-weed:client:getHousePlants', house)
                Citizen.Wait(100)
                SetWeatherTypePersist('EXTRASUNNY')
                SetWeatherTypeNow('EXTRASUNNY')
                SetWeatherTypeNowPersist('EXTRASUNNY')
                NetworkOverrideClockTime(23, 0, 0)
                --TriggerEvent('instances:client:JoinInstance', apartmentId, house)
                TriggerServerEvent('prp-apartments:server:SetInsideMeta', house, apartmentId, true)
                

                TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
                TriggerServerEvent("PRPCore:Server:SetMetaData", "currentapartment", CurrentApartment)
            end, house)
        else
            if offset > 230 then
                offset = 210
            end
            CurrentOffset = offset
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
            TriggerServerEvent("apartments:server:AddObject", apartmentId, house, CurrentOffset)
            local coords = { x = Apartments.Locations[ClosestHouse].coords.enter.x, y = Apartments.Locations[ClosestHouse].coords.enter.y, z = Apartments.Locations[ClosestHouse].coords.enter.z - CurrentOffset}
            data = exports['prp-interior']:CreateApartmentFurnished(coords)
            
            Citizen.Wait(100)
            houseObj = data[1]
            POIOffsets = data[2]

            InApartment = true
            CurrentApartment = apartmentId
            
            Citizen.Wait(500)
            SetRainFxIntensity(0.0)
            TriggerEvent('prp-weathersync:client:DisableSync')
            -- TriggerEvent('tb-weed:client:getHousePlants', house)
            Citizen.Wait(100)
            SetWeatherTypePersist('EXTRASUNNY')
            SetWeatherTypeNow('EXTRASUNNY')
            SetWeatherTypeNowPersist('EXTRASUNNY')
            NetworkOverrideClockTime(23, 0, 0)
            --TriggerEvent('instances:client:JoinInstance', apartmentId, house)
            

            TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
            TriggerServerEvent("PRPCore:Server:SetMetaData", "currentapartment", CurrentApartment)
        end
        if new ~= nil then
            if new then
                TriggerEvent('prp-interior:client:SetNewState', true)
            else
                TriggerEvent('prp-interior:client:SetNewState', false)
            end
        else
            TriggerEvent('prp-interior:client:SetNewState', false)
        end
    end, apartmentId)
end

function LeaveApartment(house)
    --TriggerEvent('instances:client:LeaveInstance')
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
    openHouseAnim()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    exports['prp-interior']:DespawnInterior(houseObj, function()
        TriggerEvent('prp-weathersync:client:EnableSync')
        SetEntityCoords(GetPlayerPed(-1), Apartments.Locations[house].coords.enter.x, Apartments.Locations[house].coords.enter.y,Apartments.Locations[house].coords.enter.z)
        SetEntityHeading(GetPlayerPed(-1), Apartments.Locations[house].coords.enter.h)
        Citizen.Wait(1000)
        TriggerServerEvent("apartments:server:RemoveObject", CurrentApartment, house)
        TriggerServerEvent('prp-apartments:server:SetInsideMeta', CurrentApartment, false)
        CurrentApartment = nil
        InApartment = false
        CurrentOffset = 0
        DoScreenFadeIn(1000)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
        TriggerServerEvent("PRPCore:Server:SetMetaData", "currentapartment", nil)
    end)
end

function SetClosestApartment()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil

    for id, house in pairs(Apartments.Locations) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Apartments.Locations[id].coords.enter.x, Apartments.Locations[id].coords.enter.y, Apartments.Locations[id].coords.enter.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Apartments.Locations[id].coords.enter.x, Apartments.Locations[id].coords.enter.y, Apartments.Locations[id].coords.enter.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Apartments.Locations[id].coords.enter.x, Apartments.Locations[id].coords.enter.y, Apartments.Locations[id].coords.enter.z, true)
            current = id
        end
    end
    if current ~= ClosestHouse and isLoggedIn and not InApartment then
        ClosestHouse = current
        PRPCore.Functions.TriggerCallback('apartments:IsOwner', function(result)
            IsOwned = result
        end, ClosestHouse)
    end
end

function openHouseAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(GetPlayerPed(-1))
end

function MenuOwners()
    ped = GetPlayerPed(-1);
    MenuTitle = "Owners"
    ClearMenu()
    Menu.addButton("Ring", "OwnerList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
end

function OwnerList()
    PRPCore.Functions.TriggerCallback('apartments:GetAvailableApartments', function(apartments)
        ped = GetPlayerPed(-1);
        MenuTitle = "Ring at: "
        ClearMenu()

        if apartments == nil then
            PRPCore.Functions.Notify("Nobody's home..", "error", 3500)
            closeMenuFull()
        else
            for k, v in pairs(apartments) do
                Menu.addButton(v, "RingDoor", k) 
            end
        end
        Menu.addButton("Back", "MenuOwners",nil)
    end, ClosestHouse)
end

function RingDoor(apartmentId)
    rangDoorbell = ClosestHouse
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "doorbell", 0.1)
    TriggerServerEvent("apartments:server:RingDoor", apartmentId, ClosestHouse)
end

function MenuOutfits()
    ped = GetPlayerPed(-1);
    MenuTitle = "Outfits"
    ClearMenu()
    Menu.addButton("My Outfits", "OutfitsLijst", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
end

function changeOutfit()
	Wait(200)
    loadAnimDict("clothingshirt")    	
	TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	Wait(3100)
	TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function OutfitsLijst()
    PRPCore.Functions.TriggerCallback('apartments:GetOutfits', function(outfits)
        ped = GetPlayerPed(-1);
        MenuTitle = "My Outfits :"
        ClearMenu()

        if outfits == nil then
            PRPCore.Functions.Notify("You don't have any saved outfits...", "error", 3500)
            closeMenuFull()
        else
            for k, v in pairs(outfits) do
                Menu.addButton(outfits[k].outfitname, "optionMenu", outfits[k]) 
            end
        end
        Menu.addButton("Back", "MenuOutfits",nil)
    end)
end

function optionMenu(outfitData)
    ped = GetPlayerPed(-1);
    MenuTitle = "What now?"
    ClearMenu()

    Menu.addButton("Choose Outfit", "selectOutfit", outfitData) 
    Menu.addButton("Delete Outfit", "removeOutfit", outfitData) 
    Menu.addButton("Back", "OutfitsLijst",nil)
end

function selectOutfit(oData)
    TriggerServerEvent('clothes:selectOutfit', oData.model, oData.skin)
    PRPCore.Functions.Notify(oData.outfitname.." choose", "success", 2500)
    closeMenuFull()
    changeOutfit()
end

function removeOutfit(oData)
    TriggerServerEvent('clothes:removeOutfit', oData.outfitname)
    PRPCore.Functions.Notify(oData.outfitname.." has been deleted", "success", 2500)
    closeMenuFull()
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end
