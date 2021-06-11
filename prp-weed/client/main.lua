local isLoggedIn = true
local housePlants = {}
local insideHouse = false
local currentHouse = nil
local isLoggedIn = false
local PlayerData = {}
local openingDoor = false

PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PlayerData = PRPCore.Functions.GetPlayerData()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

PRPWeed.DrawText3Ds = function(x, y, z, text)
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

RegisterNetEvent('prp-weed:client:getHousePlants')
AddEventHandler('prp-weed:client:getHousePlants', function(house)    
    PRPCore.Functions.TriggerCallback('prp-weed:server:getBuildingPlants', function(plants)
        currentHouse = house
        housePlants[currentHouse] = plants
        insideHouse = true
        spawnHousePlants()
    end, house)
end)

function spawnHousePlants()
    Citizen.CreateThread(function()
        if not plantSpawned then
            for k, v in pairs(housePlants[currentHouse]) do
                local plantData = {
                    ["plantCoords"] = {["x"] = json.decode(housePlants[currentHouse][k].coords).x, ["y"] = json.decode(housePlants[currentHouse][k].coords).y, ["z"] = json.decode(housePlants[currentHouse][k].coords).z},
                    ["plantProp"] = GetHashKey(PRPWeed.Plants[housePlants[currentHouse][k].sort]["stages"][housePlants[currentHouse][k].stage]),
                }

                plantProp = CreateObject(plantData["plantProp"], plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], false, false, false)
                FreezeEntityPosition(plantProp, true)
                SetEntityAsMissionEntity(plantProp, false, false)
                PlaceObjectOnGroundProperly(plantProp)
                Citizen.Wait(20)
                PlaceObjectOnGroundProperly(plantProp)
            end
            plantSpawned = true
        end
    end)
end

function despawnHousePlants()
    Citizen.CreateThread(function()
        if plantSpawned then
            for k, v in pairs(housePlants[currentHouse]) do
                local plantData = {
                    ["plantCoords"] = {["x"] = json.decode(housePlants[currentHouse][k].coords).x, ["y"] = json.decode(housePlants[currentHouse][k].coords).y, ["z"] = json.decode(housePlants[currentHouse][k].coords).z},
                }

                for _, stage in pairs(PRPWeed.Plants[housePlants[currentHouse][k].sort]["stages"]) do
                    local closestPlant = GetClosestObjectOfType(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], 3.5, GetHashKey(stage), false, false, false)
                    if closestPlant ~= 0 then                    
                        DeleteObject(closestPlant)
                    end
                end
            end
            plantSpawned = false
        end
    end)
end

local ClosestTarget = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if insideHouse then
            if plantSpawned then
                local ped = GetPlayerPed(-1)
                for k, v in pairs(housePlants[currentHouse]) do
                    local gender = "M"
                    if housePlants[currentHouse][k].gender == "female" then gender = "V" end

                    local plantData = {
                        ["plantCoords"] = {["x"] = json.decode(housePlants[currentHouse][k].coords).x, ["y"] = json.decode(housePlants[currentHouse][k].coords).y, ["z"] = json.decode(housePlants[currentHouse][k].coords).z},
                        ["plantStage"] = housePlants[currentHouse][k].stage,
                        ["plantProp"] = GetHashKey(PRPWeed.Plants[housePlants[currentHouse][k].sort]["stages"][housePlants[currentHouse][k].stage]),
                        ["plantSort"] = {
                            ["name"] = housePlants[currentHouse][k].sort,
                            ["label"] = PRPWeed.Plants[housePlants[currentHouse][k].sort]["label"],
                        },
                        ["plantStats"] = {
                            ["food"] = housePlants[currentHouse][k].food,
                            ["health"] = housePlants[currentHouse][k].health,
                            ["progress"] = housePlants[currentHouse][k].progress,
                            ["stage"] = housePlants[currentHouse][k].stage,
                            ["highestStage"] = PRPWeed.Plants[housePlants[currentHouse][k].sort]["highestStage"],
                            ["gender"] = gender,
                            ["plantId"] = housePlants[currentHouse][k].plantid,
                        }
                    }

                    local plyDistance = GetDistanceBetweenCoords(GetEntityCoords(ped), plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], false)

                    if plyDistance < 0.8 then

                        ClosestTarget = k
                        if plantData["plantStats"]["health"] > 0 then
                            if plantData["plantStage"] ~= plantData["plantStats"]["highestStage"] then
                                PRPWeed.DrawText3Ds(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], 'Type: '..plantData["plantSort"]["label"]..'~w~ ['..plantData["plantStats"]["gender"]..'] | Nutrition: ~b~'..plantData["plantStats"]["food"]..'% ~w~ | Health: ~b~'..plantData["plantStats"]["health"]..'%')
                            else
                                PRPWeed.DrawText3Ds(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"] + 0.2, 'Press ~g~E~w~ to harvest..')
                                PRPWeed.DrawText3Ds(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], 'Type: ~g~'..plantData["plantSort"]["label"]..'~w~ ['..plantData["plantStats"]["gender"]..'] | Nutrition: ~b~'..plantData["plantStats"]["food"]..'% ~w~ | Health: ~b~'..plantData["plantStats"]["health"]..'%')
                                if IsControlJustPressed(0, 38) then
                                    PRPCore.Functions.Progressbar("remove_weed_plant", "Harvesting..", 8000, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                        animDict = "amb@world_human_gardener_plant@male@base",
                                        anim = "base",
                                        flags = 16,
                                    }, {}, {}, function() -- Done
                                        ClearPedTasks(ped)
                                        if plantData["plantStats"]["gender"] == "M" then
                                            amount = math.random(1, 2)
                                        else
                                            amount = math.random(2, 4)
                                        end
                                        TriggerServerEvent('prp-weed:server:harvestPlant', currentHouse, amount, plantData["plantSort"]["name"], plantData["plantStats"]["plantId"])
                                    end, function() -- Cancel
                                        ClearPedTasks(ped)
                                        PRPCore.Functions.Notify("Cancelled..", "error")
                                    end)
                                end
                            end
                        elseif plantData["plantStats"]["health"] == 0 then
                            PRPWeed.DrawText3Ds(plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], 'Your plant is dead, press ~r~E~w~ - to remove it..')
                            if IsControlJustPressed(0, 38) then
                                PRPCore.Functions.Progressbar("remove_weed_plant", "Removing plant..", 8000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "amb@world_human_gardener_plant@male@base",
                                    anim = "base",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasks(ped)
                                    TriggerServerEvent('prp-weed:server:removeDeathPlant', currentHouse, plantData["plantStats"]["plantId"])
                                end, function() -- Cancel
                                    ClearPedTasks(ped)
                                    PRPCore.Functions.Notify("Cancelled..", "error")
                                end)
                            end
                        end
                    end
                end
            end
        end

        if not insideHouse then
            Citizen.Wait(5000)
        end
    end
end)

RegisterNetEvent('prp-weed:client:leaveHouse')
AddEventHandler('prp-weed:client:leaveHouse', function()
    despawnHousePlants()
    SetTimeout(1000, function()
        if currentHouse ~= nil then
            insideHouse = false
            housePlants[currentHouse] = nil
            currentHouse = nil
        end
    end)
end)

RegisterNetEvent('prp-weed:client:refreshHousePlants')
AddEventHandler('prp-weed:client:refreshHousePlants', function(house)
    if currentHouse ~= nil and currentHouse == house then
        despawnHousePlants()
        SetTimeout(500, function()
            PRPCore.Functions.TriggerCallback('prp-weed:server:getBuildingPlants', function(plants)
                currentHouse = house
                housePlants[currentHouse] = plants
                spawnHousePlants()
            end, house)
        end)
    end
end)

RegisterNetEvent('prp-weed:client:refreshPlantStats')
AddEventHandler('prp-weed:client:refreshPlantStats', function()
    if insideHouse then
        despawnHousePlants()
        SetTimeout(500, function()
            PRPCore.Functions.TriggerCallback('prp-weed:server:getBuildingPlants', function(plants)
                housePlants[currentHouse] = plants
                spawnHousePlants()
            end, currentHouse)
        end)
    end
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
end

RegisterNetEvent('prp-weed:client:placePlant')
AddEventHandler('prp-weed:client:placePlant', function(type, item)
    local ped = GetPlayerPed(-1)
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.75, 0)
    local plantData = {
        ["plantCoords"] = {["x"] = plyCoords.x, ["y"] = plyCoords.y, ["z"] = plyCoords.z},
        ["plantModel"] = PRPWeed.Plants[type]["stages"]["stage-a"],
        ["plantLabel"] = PRPWeed.Plants[type]["label"]
    }
    local ClosestPlant = 0
    for k, v in pairs(PRPWeed.Props) do
        if ClosestPlant == 0 then
            ClosestPlant = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 0.8, GetHashKey(v), false, false, false)
        end
    end

    if currentHouse ~= nil then
        local plantCount = 0
        for _ in ipairs(housePlants[currentHouse]) do
            plantCount = plantCount + 1
        end
        if plantCount >= PRPWeed.MaxPlants then
            PRPCore.Functions.Notify(("You may not plant more than %d plants in one house."):format(PRPWeed.MaxPlants))
            return
        end


        if ClosestPlant == 0 then
            PRPCore.Functions.Progressbar("plant_weed_plant", "Planting..", 8000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "amb@world_human_gardener_plant@male@base",
                anim = "base",
                flags = 16,
            }, {}, {}, function() -- Done
                ClearPedTasks(ped)
                plantObject = CreateObject(plantData["plantModel"], plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], false, false, false)
                FreezeEntityPosition(plantObject, true)
                SetEntityAsMissionEntity(plantObject, false, false)
                PlaceObjectOnGroundProperly(plantObject)
            
                TriggerServerEvent('prp-weed:server:placePlant', currentHouse, json.encode(plantData["plantCoords"]), type)
                TriggerServerEvent('prp-weed:server:removeSeed', item.slot, type)
            end, function() -- Cancel
                ClearPedTasks(ped)
                PRPCore.Functions.Notify("Cancelled..", "error")
            end)
        else
            PRPCore.Functions.Notify('No room here..', 'error', 3500)
        end
    else
        PRPCore.Functions.Notify('Its not safe here..', 'error', 3500)
    end
end)

RegisterNetEvent('prp-weed:client:foodPlant')
AddEventHandler('prp-weed:client:foodPlant', function(item)
    local plantData = {}
    if currentHouse ~= nil then
        if ClosestTarget ~= 0 then
            local ped = GetPlayerPed(-1)
            local gender = "M"
            if housePlants[currentHouse][ClosestTarget].gender == "female" then 
                gender = "V" 
            end

            plantData = {
                ["plantCoords"] = {["x"] = json.decode(housePlants[currentHouse][ClosestTarget].coords).x, ["y"] = json.decode(housePlants[currentHouse][ClosestTarget].coords).y, ["z"] = json.decode(housePlants[currentHouse][ClosestTarget].coords).z},
                ["plantStage"] = housePlants[currentHouse][ClosestTarget].stage,
                ["plantProp"] = GetHashKey(PRPWeed.Plants[housePlants[currentHouse][ClosestTarget].sort]["stages"][housePlants[currentHouse][ClosestTarget].stage]),
                ["plantSort"] = {
                    ["name"] = housePlants[currentHouse][ClosestTarget].sort,
                    ["label"] = PRPWeed.Plants[housePlants[currentHouse][ClosestTarget].sort]["label"],
                },
                ["plantStats"] = {
                    ["food"] = housePlants[currentHouse][ClosestTarget].food,
                    ["health"] = housePlants[currentHouse][ClosestTarget].health,
                    ["progress"] = housePlants[currentHouse][ClosestTarget].progress,
                    ["stage"] = housePlants[currentHouse][ClosestTarget].stage,
                    ["highestStage"] = PRPWeed.Plants[housePlants[currentHouse][ClosestTarget].sort]["highestStage"],
                    ["gender"] = gender,
                    ["plantId"] = housePlants[currentHouse][ClosestTarget].plantid,
                }
            }
            local plyDistance = GetDistanceBetweenCoords(GetEntityCoords(ped), plantData["plantCoords"]["x"], plantData["plantCoords"]["y"], plantData["plantCoords"]["z"], false)

            if plyDistance < 1.0 then
                if plantData["plantStats"]["food"] == 100 then
                    PRPCore.Functions.Notify('Your plant doesnt need any nutrition..', 'error', 3500)
                else
                    PRPCore.Functions.Progressbar("plant_weed_plant", "feeding plant..", math.random(4000, 8000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "timetable@gardener@filling_can",
                        anim = "gar_ig_5_filling_can",
                        flags = 16,
                    }, {}, {}, function() -- Done
                        ClearPedTasks(ped)
                        local newFood = math.random(40, 60)
                        TriggerServerEvent('prp-weed:server:foodPlant', currentHouse, newFood, plantData["plantSort"]["name"], plantData["plantStats"]["plantId"])
                    end, function() -- Cancel
                        ClearPedTasks(ped)
                        PRPCore.Functions.Notify("Cancelled..", "error")
                    end)
                end
            else
                PRPCore.Functions.Notify("No plant to use..", "error")
            end
        else
            PRPCore.Functions.Notify("No plant to use..", "error")
        end
    end
end)

RegisterNetEvent('prp-weed:client:WeedRoller')
AddEventHandler('prp-weed:client:WeedRoller', function()
    local waitTime = math.random(15000,25000)
    ScrapAnim(waitTime)
    PRPCore.Functions.Progressbar("drop_golden_stuff", "Rolling That Good Good..", waitTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        openingDoor = false
        TriggerServerEvent("prp-weed:server:WeedRoller")
    end, function() -- Cancel
        PRPCore.Functions.Notify("Cancelled..", "error")
        openingDoor = false  
    end)
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            local jName = PlayerData.job.name
            local jGrade = PlayerData.job.grade.level
                      
            if jName == "bestbuds" then
                stash = PRPWeed.Dispensary["bestbuds"]["stash"]["coords"]
                reg = PRPWeed.Dispensary["bestbuds"]["register"]["coords"]
                roll = PRPWeed.Dispensary["bestbuds"]["roller"]["coords"]
                file = PRPWeed.Dispensary["bestbuds"]["file"]["coords"]

                if (GetDistanceBetweenCoords(pos, stash.x, stash.y, stash.z, true) < 2) then
                    if jGrade >= 2 then
                        if (GetDistanceBetweenCoords(pos, stash.x, stash.y, stash.z, true) < 1.0) then
                            DrawText3Ds(stash.x, stash.y, stash.z, "~g~E~w~ - Best Bud's Stash")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("prp-log:server:CreateLog", "passcodes", "Opened Stash", "red", "**"..GetPlayerName(PlayerId()).."** opened Best Buds Stash")
                                TriggerEvent("inventory:client:SetCurrentStash", "bestbuds")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "bestbuds", {
                                    maxweight = PRPWeed.Dispensary["bestbuds"]["stash"]["size"],
                                    slots = PRPWeed.Dispensary["bestbuds"]["stash"]["slots"],
                                })
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, stash.x, stash.y, stash.z, true) < 1.5) then
                            DrawText3Ds(stash.x, stash.y, stash.z, "Best Bud's Stash")
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, stash.x, stash.y, stash.z, true) < 1.5) then
                        DrawText3Ds(stash.x, stash.y, stash.z, "Best Bud's Stash")
                    end
                elseif (GetDistanceBetweenCoords(pos, file.x, file.y, file.z, true) < 2) then
                    if (GetDistanceBetweenCoords(pos, file.x, file.y, file.z, true) < 1.0) then
                        DrawText3Ds(file.x, file.y, file.z, "~g~E~w~ - Best Bud's Records")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "bestbudsfile")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "bestbudsfile", {
                                maxweight = PRPWeed.Dispensary["bestbuds"]["file"]["size"],
                                slots = PRPWeed.Dispensary["bestbuds"]["file"]["slots"],
                            })
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, file.x, file.y, file.z, true) < 1.5) then
                        DrawText3Ds(file.x, file.y, file.z, "Best Bud's Records")
                    end
                elseif (GetDistanceBetweenCoords(pos, reg.x, reg.y, reg.z, true) < 2) then
                    if (GetDistanceBetweenCoords(pos, reg.x, reg.y, reg.z, true) < 1.0) then
                        DrawText3Ds(reg.x, reg.y, reg.z, "~g~E~w~ - Best Bud's Register")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "bestbudsreg")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "bestbudsreg", {
                                maxweight = PRPWeed.Dispensary["bestbuds"]["register"]["size"],
                                slots = PRPWeed.Dispensary["bestbuds"]["register"]["slots"],
                            })
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, reg.x, reg.y, reg.z, true) < 1.5) then
                        DrawText3Ds(reg.x, reg.y, reg.z, "Best Bud's Register")
                    end
                elseif (GetDistanceBetweenCoords(pos, roll.x, roll.y, roll.z, true) < 2) then
                    if (GetDistanceBetweenCoords(pos, roll.x, roll.y, roll.z, true) < 1.0) then
                        DrawText3Ds(roll.x, roll.y, roll.z, "~g~E~w~ - Rolling Station")
                        if IsControlJustReleased(0, 38) then
                            local waitTime = math.random(10000,20000)
                            ScrapAnim(waitTime)
                            PRPCore.Functions.Progressbar("drop_golden_stuff", "Rolling That Good Good..", waitTime, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                StopAnimTask(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                TriggerServerEvent("prp-weed:server:rollWeed")
                            end)
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, roll.x, roll.y, roll.z, true) < 1.5) then
                        DrawText3Ds(roll.x, roll.y, roll.z, "Rolling Station")
                    end
                else
                    Citizen.Wait(1000)
                end
            elseif jName == "drkush" then
                stash = PRPWeed.Dispensary["drkush"]["stash"]["coords"]
                reg = PRPWeed.Dispensary["drkush"]["register"]["coords"]
                roll = PRPWeed.Dispensary["drkush"]["roller"]["coords"]
                file = PRPWeed.Dispensary["drkush"]["file"]["coords"]

                if (GetDistanceBetweenCoords(pos, stash.x, stash.y, stash.z, true) < 2) then
                    if jGrade >= 1 then
                        if (GetDistanceBetweenCoords(pos, stash.x, stash.y, stash.z, true) < 0.5) then
                            DrawText3Ds(stash.x, stash.y, stash.z, "~g~E~w~ - Dr. Kush's Stash")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("prp-log:server:CreateLog", "passcodes", "Opened Stash", "red", "**"..GetPlayerName(PlayerId()).."** opened Dr. Kush Stash")
                                TriggerEvent("inventory:client:SetCurrentStash", "drkush")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "drkush", {
                                    maxweight = PRPWeed.Dispensary["drkush"]["stash"]["size"],
                                    slots = PRPWeed.Dispensary["drkush"]["stash"]["slots"],
                                })
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, stash.x, stash.y, stash.z, true) < 1.5) then
                            DrawText3Ds(stash.x, stash.y, stash.z, "Dr. Kush's Stash")
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, stash.x, stash.y, stash.z, true) < 1.5) then
                        DrawText3Ds(stash.x, stash.y, stash.z, "Dr. Kush's Stash")
                    end
                elseif (GetDistanceBetweenCoords(pos, file.x, file.y, file.z, true) < 2) then
                    if (GetDistanceBetweenCoords(pos, file.x, file.y, file.z, true) < 1.0) then
                        DrawText3Ds(file.x, file.y, file.z, "~g~E~w~ - Dr. Kush's Records")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "drkushfile")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "drkushfile", {
                                maxweight = PRPWeed.Dispensary["drkush"]["file"]["size"],
                                slots = PRPWeed.Dispensary["drkush"]["file"]["slots"],
                            })
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, file.x, file.y, file.z, true) < 1.5) then
                        DrawText3Ds(file.x, file.y, file.z, "Dr Kush's Records")
                    end
                elseif (GetDistanceBetweenCoords(pos, reg.x, reg.y, reg.z, true) < 2) then
                    if (GetDistanceBetweenCoords(pos, reg.x, reg.y, reg.z, true) < 1.0) then
                        DrawText3Ds(reg.x, reg.y, reg.z, "~g~E~w~ - Dr Kush's Register")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "drkushreg")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "drkushreg", {
                                maxweight = PRPWeed.Dispensary["drkush"]["register"]["size"],
                                slots = PRPWeed.Dispensary["drkush"]["register"]["slots"],
                            })
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, reg.x, reg.y, reg.z, true) < 1.5) then
                        DrawText3Ds(reg.x, reg.y, reg.z, "Dr. Kush's Register")
                    end
                elseif (GetDistanceBetweenCoords(pos, roll.x, roll.y, roll.z, true) < 2) then
                    if (GetDistanceBetweenCoords(pos, roll.x, roll.y, roll.z, true) < 0.5) then
                        DrawText3Ds(roll.x, roll.y, roll.z, "~g~E~w~ - Rolling Station")
                        if IsControlJustReleased(0, 38) then
                            local waitTime = math.random(10000,20000)
                            ScrapAnim(waitTime)
                            PRPCore.Functions.Progressbar("drop_golden_stuff", "Rolling That Good Good..", waitTime, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                StopAnimTask(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                TriggerServerEvent("prp-weed:server:rollWeed")
                            end)
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, roll.x, roll.y, roll.z, true) < 1.5) then
                        DrawText3Ds(roll.x, roll.y, roll.z, "Rolling Station")
                    end
                else
                    Citizen.Wait(1000)
                end
            else
                Citizen.Wait(10000)
            end
        end
    end
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

function ScrapAnim(time)
    local time = time / 1000
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
            time = time - 2
            if time <= 0 then
                openingDoor = false
                StopAnimTask(GetPlayerPed(-1), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end