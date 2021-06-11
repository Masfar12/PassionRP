PRPCore = nil

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)

-- Code1

local inside = false
local currentHouse = nil
local closestHouse

local inRange

local lockpicking = false

local houseObj = {}
local POIOffsets = nil
local usingAdvanced = false

local requiredItemsShowed = false

local requiredItems = {}

CurrentCops = 0

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PRPCore.Functions.TriggerCallback('prp-houserobbery:server:GetHouseConfig', function(HouseConfig)
        Config.Houses = HouseConfig
    end)
end)

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
    Citizen.Wait(500)
    requiredItems = {
        [1] = {name = PRPCore.Shared.Items["lockpick"]["name"], image = PRPCore.Shared.Items["lockpick"]["image"]},
        [2] = {name = PRPCore.Shared.Items["screwdriverset"]["name"], image = PRPCore.Shared.Items["screwdriverset"]["image"]},
    }
    while true do
        inRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)
        closestHouse = nil

        if PRPCore ~= nil then
            if GetClockHours() >= 0 and GetClockHours() <= 5 then
                if not inside then
                    for k, v in pairs(Config.Houses) do
                        local dist = GetDistanceBetweenCoords(PlayerPos, Config.Houses[k]["coords"]["x"], Config.Houses[k]["coords"]["y"], Config.Houses[k]["coords"]["z"], true)

                        if dist <= 1.5 then
                            closestHouse = k
                            inRange = true
                            
                            if CurrentCops >= Config.MinimumHouseRobberyPolice then
                                if Config.Houses[k]["opened"] then
                                    DrawText3Ds(Config.Houses[k]["coords"]["x"], Config.Houses[k]["coords"]["y"], Config.Houses[k]["coords"]["z"], '~g~E~w~ - To enter')
                                    if IsControlJustPressed(0, 38) then
                                        TriggerServerEvent('prp-hud:Server:GainStress', 10)
                                        enterRobberyHouse(k)
                                    end
                                else
                                    if not requiredItemsShowed then
                                        requiredItemsShowed = true
                                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                                    end
                                end
                            end
                        end
                    end
                end

                if inside then
                    Citizen.Wait(1000)
                end

                if not inRange then
                    if requiredItemsShowed then
                        requiredItemsShowed = false
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end
                    Citizen.Wait(1000)
                end
            end
        end

        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        if inside then

            if(GetDistanceBetweenCoords(pos, Config.Houses[currentHouse]["coords"]["x"] + POIOffsets.exit.x, Config.Houses[currentHouse]["coords"]["y"] + POIOffsets.exit.y, Config.Houses[currentHouse]["coords"]["z"] - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + POIOffsets.exit.x, Config.Houses[currentHouse]["coords"]["y"] + POIOffsets.exit.y, Config.Houses[currentHouse]["coords"]["z"] - Config.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To leave')
                if IsControlJustPressed(0, 38) then
                    leaveRobberyHouse(currentHouse)
                end
            end

            for k, v in pairs(Config.Houses[currentHouse]["furniture"]) do
                if (GetDistanceBetweenCoords(pos, Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - Config.MinZOffset, true) < 1.5) then
                    if not Config.Houses[currentHouse]["furniture"][k]["searched"] then
                        if not Config.Houses[currentHouse]["furniture"][k]["isBusy"] then
                            DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - Config.MinZOffset, '~g~E~w~ - '..Config.Houses[currentHouse]["furniture"][k]["text"])
                            if IsControlJustPressed(0, 38) then
                                searchCabin(k)
                            end
                        else
                            DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - Config.MinZOffset, 'Someone is already searching..')
                        end
                    else
                        DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - Config.MinZOffset, 'Closet is empty..')
                    end
                end
            end
        end

        if not inside then 
            Citizen.Wait(5000)
        end

        Citizen.Wait(3)
    end
end)

function enterRobberyHouse(house)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Citizen.Wait(250)
    local coords = { x = Config.Houses[house]["coords"]["x"], y = Config.Houses[house]["coords"]["y"], z= Config.Houses[house]["coords"]["z"] - Config.MinZOffset}
    if Config.Houses[house]["tier"] == 1 then
        data = exports['prp-interior']:CreateTier1HouseFurnished(coords)
    end
    Citizen.Wait(100)
    houseObj = data[1]
    POIOffsets = data[2]
    inside = true
    currentHouse = house
    Citizen.Wait(500)
    SetRainFxIntensity(0.0)
    TriggerEvent('prp-weathersync:client:DisableSync')
    Citizen.Wait(100)
    SetWeatherTypePersist('EXTRASUNNY')
    SetWeatherTypeNow('EXTRASUNNY')
    SetWeatherTypeNowPersist('EXTRASUNNY')
    NetworkOverrideClockTime(23, 0, 0)
end

function leaveRobberyHouse(house)
    local ped = GetPlayerPed(-1)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Citizen.Wait(250)
    DoScreenFadeOut(250)
    Citizen.Wait(500)
    exports['prp-interior']:DespawnInterior(houseObj, function()
        TriggerEvent('prp-weathersync:client:EnableSync')
        Citizen.Wait(250)
        DoScreenFadeIn(250)
        SetEntityCoords(ped, Config.Houses[house]["coords"]["x"], Config.Houses[house]["coords"]["y"], Config.Houses[house]["coords"]["z"] + 0.5)
        SetEntityHeading(ped, Config.Houses[house]["coords"]["h"])
        inside = false
        currentHouse = nil
    end)
end

RegisterNetEvent('prp-houserobbery:client:ResetHouseState')
AddEventHandler('prp-houserobbery:client:ResetHouseState', function(house)
    Config.Houses[house]["opened"] = false
    for k, v in pairs(Config.Houses[house]["furniture"]) do
        v["searched"] = false
    end
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('prp-houserobbery:client:enterHouse')
AddEventHandler('prp-houserobbery:client:enterHouse', function(house)
    enterRobberyHouse(house)
end)

function openHouseAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(GetPlayerPed(-1))
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function(isAdvanced)
    usingAdvanced = isAdvanced
    if usingAdvanced then
        if closestHouse ~= nil then
            if CurrentCops >= Config.MinimumHouseRobberyPolice then
                if not Config.Houses[closestHouse]["opened"] then
                    PoliceCall()
                    TriggerServerEvent('prp-hud:Server:GainStress', 5)
                    TriggerEvent('prp-lockpick:client:openLockpick', lockpickFinish)
                    if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
                        local pos = GetEntityCoords(GetPlayerPed(-1))
                        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                    end
                else
                    PRPCore.Functions.Notify('Door is already open..', 'error', 3500)
                end
            else
                PRPCore.Functions.Notify('Not enough Police..', 'error', 3500)
            end
        end
    else
        PRPCore.Functions.TriggerCallback('PRPCore:HasItem', function(result)
            if closestHouse ~= nil then
                if result then
                    if CurrentCops >= Config.MinimumHouseRobberyPolice then
                        if not Config.Houses[closestHouse]["opened"] then
                            TriggerServerEvent('prp-hud:Server:GainStress', 5)
                            PoliceCall()
                            TriggerEvent('prp-lockpick:client:openLockpick', lockpickFinish)
                            if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
                                local pos = GetEntityCoords(GetPlayerPed(-1))
                                TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                            end
                        else
                            PRPCore.Functions.Notify('Door is already open..', 'error', 3500)
                        end
                    else
                        PRPCore.Functions.Notify('Not enough officers..', 'error', 3500)
                    end
                else
                    PRPCore.Functions.Notify('Looks like youre missing a tool...', 'error', 3500)
                end
            end
        end, "screwdriverset")
    end
end)

function PoliceCall()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local chance = 80
    if GetClockHours() >= 1 and GetClockHours() <= 6 then
        chance = 20
    end
    if math.random(1, 100) <= chance then
        local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
        local streetLabel = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        if street2 ~= nil and street2 ~= "" then 
            streetLabel = streetLabel .. " " .. street2
        end
        local gender = "Male"
        if PRPCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "Female"
        end
        local msg = streetLabel
        TriggerServerEvent("police:server:HouseRobberyCall", pos, msg)
    end
end

function lockpickFinish(success)
    if success then
        TriggerServerEvent('prp-houserobbery:server:enterHouse', closestHouse)
        PRPCore.Functions.Notify('Entering house!', 'success', 2500)
    else
        if usingAdvanced then
            local itemInfo = PRPCore.Shared.Items["advancedlockpick"]
            if math.random(1, 100) < 20 then
                TriggerServerEvent("PRPCore:Server:RemoveItem", "advancedlockpick", 1)
                TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
            end
        else
            local itemInfo = PRPCore.Shared.Items["lockpick"]
            if math.random(1, 100) < 50 then
                TriggerServerEvent("PRPCore:Server:RemoveItem", "lockpick", 1)
                TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
            end
        end
        
        PRPCore.Functions.Notify('No joy..', 'error', 2500)
    end
end

RegisterNetEvent('prp-houserobbery:client:setHouseState')
AddEventHandler('prp-houserobbery:client:setHouseState', function(house, state)
    Config.Houses[house]["opened"] = state
end)

local openingDoor = false
function searchCabin(cabin)
    if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    local lockpickTime = math.random(45000, 80000)
    LockpickDoorAnim(lockpickTime)
    TriggerServerEvent('prp-houserobbery:server:SetBusyState', cabin, currentHouse, true)
    PRPCore.Functions.Progressbar("search_cabin", "Searching..", lockpickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "veh@break_in@0h@p_m_one@",
        anim = "low_force_entry_ds",
        flags = 16,
    }, {}, {}, function() -- Done
        openingDoor = false
        ClearPedTasks(GetPlayerPed(-1))
        TriggerServerEvent('prp-houserobbery:server:searchCabin', cabin, currentHouse)
        Config.Houses[currentHouse]["furniture"][cabin]["searched"] = true
        TriggerServerEvent('prp-houserobbery:server:SetBusyState', cabin, currentHouse, false)
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(GetPlayerPed(-1))
        TriggerServerEvent('prp-houserobbery:server:SetBusyState', cabin, currentHouse, false)
        PRPCore.Functions.Notify("Cancelled..", "error")
    end)
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

RegisterNetEvent('prp-houserobbery:client:setCabinState')
AddEventHandler('prp-houserobbery:client:setCabinState', function(house, cabin, state)
    Config.Houses[house]["furniture"][cabin]["searched"] = state
end)

RegisterNetEvent('prp-houserobbery:client:SetBusyState')
AddEventHandler('prp-houserobbery:client:SetBusyState', function(cabin, house, bool)
    Config.Houses[house]["furniture"][cabin]["isBusy"] = bool
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(GetPlayerPed(-1), 3)
    local model = GetEntityModel(GetPlayerPed(-1))
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end