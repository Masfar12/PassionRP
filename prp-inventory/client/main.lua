PRPCore = nil

inInventory = false
hotbarOpen = false

local inventoryTest = {}
local currentWeapon = nil
local CurrentWeaponData = {}
local currentOtherInventory = nil

local Drops = {}
local CurrentDrop = 0
local DropsNear = {}

local CurrentVehicle = nil
local CurrentGlovebox = nil
local CurrentStash = nil
local isCrafting = false

local showTrunkPos = false

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

function isInventoryOpen()
    return inInventory
end

RegisterNetEvent('inventory:client:CheckOpenState')
AddEventHandler('inventory:client:CheckOpenState', function(type, id, label)
    local name = PRPCore.Shared.SplitStr(label, "-")[2]
    if type == "stash" then
        if name ~= CurrentStash or CurrentStash == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "trunk" then
        if name ~= CurrentVehicle or CurrentVehicle == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "glovebox" then
        if name ~= CurrentGlovebox or CurrentGlovebox == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    end
end)

RegisterNetEvent('weapons:client:SetCurrentWeapon')
AddEventHandler('weapons:client:SetCurrentWeapon', function(data, bool)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
end)

--function GetClosestVending()
--    local ped = GetPlayerPed(-1)
--    local pos = GetEntityCoords(ped)
--    local object = nil
--    local machinetype = nil
--    local model = nil
--    for _, machine in pairs(Config.VendingObjects) do
--        local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 0.7, GetHashKey(machine), 0, 0, 0)
--        if ClosestObject ~= 0 and ClosestObject ~= nil then
--            if object == nil then
--                object = ClosestObject
--                model = GetEntityModel(object)
--
--                if model == -654402915 or model == -1034034125 then
--                    machinetype = 'food'
--
--                elseif model == 690372739 then
--                    machinetype = 'coffee'
--                else
--                    machinetype = 'drinks'
--                end
--            end
--        end
--    end
--    return object ,machinetype,model
--end

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


--Citizen.CreateThread(function()
--    while true do
--        local ped = GetPlayerPed(-1)
--        local pos = GetEntityCoords(ped)
--        local inRange = false
--        local VendingMachine,VendingMachineType,model = GetClosestVending()
--
--
--        if VendingMachine ~= nil then
--            local VendingPos = GetEntityCoords(VendingMachine)
--            local Distance = GetDistanceBetweenCoords(pos, VendingPos.x, VendingPos.y, VendingPos.z, true)
--            if Distance < 20 then
--                inRange = true
--                if Distance < 1.5 then
--                    if VendingMachineType == 'food' then
--                        DrawText3Ds(VendingPos.x, VendingPos.y, VendingPos.z, '~g~E~w~ - Buy Snacks')
--                    elseif VendingMachineType == 'coffee' then
--                        DrawText3Ds(VendingPos.x, VendingPos.y, VendingPos.z+1, '~g~E~w~ - Buy Coffee')
--                    else
--                        if model == -742198632 or model == -1691644768 then
--                            DrawText3Ds(VendingPos.x, VendingPos.y, VendingPos.z+0.7, '~g~E~w~ - Buy Drinks')
--                        else-- needs to be like this to prevent offsets from being outside the vending machine D:
--                            DrawText3Ds(VendingPos.x, VendingPos.y, VendingPos.z, '~g~E~w~ - Buy Drinks')
--                        end
--
--                    end
--
--                    if IsControlJustPressed(0, 38) then
--                        local ShopItems = {}
--                        ShopItems.items = {}
--                        ShopItems.slots = {}
--                        ShopItems.label = "Vending machine"
--                        ShopItems.items = Config.VendingItems[VendingMachineType]
--                        ShopItems.slots =  #Config.VendingItems[VendingMachineType]
--                        TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_"..math.random(1, 99), ShopItems)
--                    end
--                end
--            end
--        end
--
--        if not inRange then
--            Citizen.Wait(1000)
--        end
--
--        Citizen.Wait(1)
--    end
--end)

RegisterNetEvent('Inventory:vendingMachine')
AddEventHandler('Inventory:vendingMachine', function(pParams, pEntity, pContext)
    local type = nil
    local ShopItems = {}
    ShopItems.items = {}
    ShopItems.slots = {}
    ShopItems.label = "Vending machine"
    if pContext.flags.isVendingMachineHotBeverage then type = "coffee" end
    if pContext.flags.isVendingMachineBeverage then type = "drinks" end
    if pContext.flags.isVendingMachineFood then type = "food" end
    ShopItems.items = Config.VendingItems[type]
    ShopItems.slots =  #Config.VendingItems[type]
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_"..math.random(1, 99), ShopItems)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        if showTrunkPos and not inInventory then
            local vehicle = PRPCore.Functions.GetClosestVehicle()
            if vehicle ~= 0 and vehicle ~= nil then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local vehpos = GetEntityCoords(vehicle)
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                    local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                    end
                    PRPCore.Functions.DrawText3D(drawpos.x, drawpos.y, drawpos.z, "Trunk")
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, drawpos) < 2.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        CurrentVehicle = GetVehicleNumberPlateText(vehicle)
                        showTrunkPos = false
                    end
                else
                    showTrunkPos = false
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        DisableControlAction(0, Keys["TAB"], true)
        DisableControlAction(0, Keys["1"], true)
        DisableControlAction(0, Keys["2"], true)
        DisableControlAction(0, Keys["3"], true)
        DisableControlAction(0, Keys["4"], true)
        DisableControlAction(0, Keys["5"], true)
        if IsDisabledControlJustPressed(0, Keys["TAB"]) and not isCrafting then
            PRPCore.Functions.GetPlayerData(function(PlayerData)
                if not PlayerData.metadata["isdead"] and not PlayerData.metadata["ishandcuffed"] and not PlayerData.metadata["isdoingaction"] then
                    local curVeh = nil
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        CurrentGlovebox = GetVehicleNumberPlateText(vehicle)
                        curVeh = vehicle
                        CurrentVehicle = nil
                    else
                        local vehicle = PRPCore.Functions.GetClosestVehicle()
                        if vehicle ~= 0 and vehicle ~= nil then
                            local pos = GetEntityCoords(GetPlayerPed(-1))
                            local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            end
                            if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, trunkpos) < 2.0) and not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                                if GetVehicleDoorLockStatus(vehicle) < 2 then
                                    CurrentVehicle = GetVehicleNumberPlateText(vehicle)
                                    curVeh = vehicle
                                    CurrentGlovebox = nil
                                else
                                    PRPCore.Functions.Notify("Vehicle is locked..", "error")
                                    return
                                end
                            else
                                CurrentVehicle = nil
                            end
                        else
                            CurrentVehicle = nil
                        end
                    end

                    if CurrentVehicle ~= nil then
                        local maxweight = 0
                        local slots = Config.VehicleConfig.DefaultTrunks.slots
                        local trunkSpace = getVehicleTrunkSpace(curVeh)

                        if trunkSpace ~= nil then
                            maxweight = trunkSpace.weight
                            slots  = trunkSpace.slots
                        else
                            local vehicleClass = GetVehicleClass(curVeh)
                            if Config.VehicleConfig.DefaultTrunks[vehicleClass] ~= nil then
                                maxweight = Config.VehicleConfig.DefaultTrunks[vehicleClass].weight
                            else
                                maxweight = 60000
                            end
                        end
                        local other = {
                            maxweight = maxweight,
                            slots = slots,
                        }
                        TriggerServerEvent("inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
                        OpenTrunk()
                    elseif CurrentGlovebox ~= nil then
                        TriggerServerEvent("inventory:server:OpenInventory", "glovebox", CurrentGlovebox)
                    elseif CurrentDrop ~= 0 then
                        TriggerServerEvent("inventory:server:OpenInventory", "drop", CurrentDrop)
                    else
                        TriggerServerEvent("inventory:server:OpenInventory")
                    end
                end
            end)
        end

        if IsControlJustPressed(0, 243) then
            ToggleHotbar(true)
        end

        if IsControlJustReleased(0, 243) then
            ToggleHotbar(false)
        end

        if IsDisabledControlJustReleased(0, Keys["1"]) then
            PRPCore.Functions.GetPlayerData(function(PlayerData)
                if not PlayerData.metadata["isdead"] and not PlayerData.metadata["ishandcuffed"] and not PlayerData.metadata["isdoingaction"] then
                    TriggerServerEvent("inventory:server:UseItemSlot", 1)
                end
            end)
        end

        if IsDisabledControlJustReleased(0, Keys["2"]) then
            PRPCore.Functions.GetPlayerData(function(PlayerData)
                if not PlayerData.metadata["isdead"] and not PlayerData.metadata["ishandcuffed"] and not PlayerData.metadata["isdoingaction"] then
                    TriggerServerEvent("inventory:server:UseItemSlot", 2)
                end
            end)
        end

        if IsDisabledControlJustReleased(0, Keys["3"]) then
            PRPCore.Functions.GetPlayerData(function(PlayerData)
                if not PlayerData.metadata["isdead"] and not PlayerData.metadata["ishandcuffed"] and not PlayerData.metadata["isdoingaction"] then
                    TriggerServerEvent("inventory:server:UseItemSlot", 3)
                end
            end)
        end

        if IsDisabledControlJustReleased(0, Keys["4"]) then
            PRPCore.Functions.GetPlayerData(function(PlayerData)
                if not PlayerData.metadata["isdead"] and not PlayerData.metadata["ishandcuffed"] and not PlayerData.metadata["isdoingaction"] then
                    TriggerServerEvent("inventory:server:UseItemSlot", 4)
                end
            end)
        end

        if IsDisabledControlJustReleased(0, Keys["5"]) then
            PRPCore.Functions.GetPlayerData(function(PlayerData)
                if not PlayerData.metadata["isdead"] and not PlayerData.metadata["ishandcuffed"] and not PlayerData.metadata["isdoingaction"] then
                    TriggerServerEvent("inventory:server:UseItemSlot", 5)
                end
            end)
        end

        if IsDisabledControlJustReleased(0, Keys["6"]) then
            PRPCore.Functions.GetPlayerData(function(PlayerData)
                if not PlayerData.metadata["isdead"] and not PlayerData.metadata["ishandcuffed"] and not PlayerData.metadata["isdoingaction"] then
                    TriggerServerEvent("inventory:server:UseItemSlot", 41)
                end
            end)
        end
    end
end)

function getVehicleTrunkSpace(vehicle)
    for i, v in pairs(Config.VehicleConfig.Trunks) do
        if GetHashKey(i) == GetEntityModel(vehicle) then
            return v
        end
    end

    return nil
end

RegisterNetEvent('inventory:client:ItemBox')
AddEventHandler('inventory:client:ItemBox', function(itemData, type)
    SendNUIMessage({
        action = "itemBox",
        item = itemData,
        type = type
    })
end)

RegisterNetEvent('inventory:client:requiredItems')
AddEventHandler('inventory:client:requiredItems', function(items, bool)
    local itemTable = {}
    if bool then
        for k, v in pairs(items) do
            table.insert(itemTable, {
                item = items[k].name,
                label = PRPCore.Shared.Items[items[k].name]["label"],
                image = items[k].image,
            })
        end
    end

    SendNUIMessage({
        action = "requiredItem",
        items = itemTable,
        toggle = bool
    })
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if DropsNear ~= nil then
            for k, v in pairs(DropsNear) do
                if DropsNear[k] ~= nil then
                    DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 120, 10, 20, 155, false, false, false, 1, false, false, false)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if Drops ~= nil and next(Drops) ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1), true)
            for k, v in pairs(Drops) do
                if Drops[k] ~= nil then
                    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 7.5 then
                        DropsNear[k] = v
                        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.coords.x, v.coords.y, v.coords.z, true) < 2 then
                            CurrentDrop = k
                        else
                            CurrentDrop = nil
                        end
                    else
                        DropsNear[k] = nil
                    end
                end
            end
        else
            DropsNear = {}
        end
        Citizen.Wait(500)
    end
end)

RegisterNetEvent("PRPCore:Client:OnPlayerLoaded")
AddEventHandler("PRPCore:Client:OnPlayerLoaded", function()
    --TriggerServerEvent("inventory:server:LoadDrops")
end)

RegisterNetEvent('inventory:server:RobPlayer')
AddEventHandler('inventory:server:RobPlayer', function(TargetId)
    SendNUIMessage({
        action = "RobMoney",
        TargetId = TargetId,
    })
end)

--RegisterNUICallback('RobMoney', function(data, cb)
--    TriggerServerEvent("police:server:RobPlayer", data.TargetId)
--end)

RegisterNUICallback('Notify', function(data, cb)
    PRPCore.Functions.Notify(data.message, data.type)
end)

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

RegisterNetEvent("inventory:client:DebugInventory")
AddEventHandler("inventory:client:DebugInventory", function(inventory, other)
    print(dump(inventory))
    for var=1,#inventory do
        if inventory[var] ~= nil then
            if inventory[var].name ~= nil then
                print(inventory[var].name)
            end
        end
    end
end)


RegisterNetEvent("inventory:client:OpenInventory")
AddEventHandler("inventory:client:OpenInventory", function(inventory, other)
    local x = PRPCore.Functions.GetPlayerData().items
    local len = tablelength(x)
    local found = false
    for i=1,len do
        if PRPCore.Functions.GetPlayerData().items[i] ~= nil and PRPCore.Functions.GetPlayerData().items[i]["name"] == "bag" then
            found = true
        end
    end
    local maxWeight = PRPCore.Config.Player.MaxWeight
    if found == true then
        maxWeight = maxWeight + 100000
    end
    if not IsEntityDead(GetPlayerPed(-1)) then
        ToggleHotbar(false)
        SetNuiFocus(true, true)
        if other ~= nil then
            currentOtherInventory = other.name
        end
        SendNUIMessage({
            action = "open",
            inventory = inventory,
            slots = MaxInventorySlots,
            other = other,
            maxweight = maxWeight,
            Ammo = 0,
            maxammo = Config.MaximumAmmoValues,
        })
        inInventory = true
    end
end)

RegisterNetEvent("inventory:client:ShowTrunkPos")
AddEventHandler("inventory:client:ShowTrunkPos", function()
    showTrunkPos = true
end)

RegisterNetEvent("inventory:client:UpdatePlayerInventory")
AddEventHandler("inventory:client:UpdatePlayerInventory", function(isError)
    SendNUIMessage({
        action = "update",
        inventory = PRPCore.Functions.GetPlayerData().items,
        maxweight = PRPCore.Config.Player.MaxWeight,
        slots = MaxInventorySlots,
        error = isError,
    })
end)

RegisterNetEvent("inventory:client:CraftItems")
AddEventHandler("inventory:client:CraftItems", function(itemName, itemCosts, amount, toSlot, points)
    SendNUIMessage({
        action = "close",
    })
    isCrafting = true
    PRPCore.Functions.Progressbar("repair_vehicle", "Crafting..", (math.random(2000, 5000) * amount), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 1.0)
        TriggerServerEvent("inventory:server:CraftItems", itemName, itemCosts, amount, toSlot, points)
        TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items[itemName], 'add')
        isCrafting = false
	end, function() -- Cancel
		StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 1.0)
        PRPCore.Functions.Notify("Failed!", "error")
        isCrafting = false
	end)
end)

RegisterNetEvent('inventory:client:CraftAttachment')
AddEventHandler('inventory:client:CraftAttachment', function(itemName, itemCosts, amount, toSlot, points)
    SendNUIMessage({
        action = "close",
    })
    isCrafting = true
    PRPCore.Functions.Progressbar("repair_vehicle", "Crafting..", (math.random(2000, 5000) * amount), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 1.0)
        TriggerServerEvent("inventory:server:CraftAttachment", itemName, itemCosts, amount, toSlot, points)
        TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items[itemName], 'add')
        isCrafting = false
	end, function() -- Cancel
		StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 1.0)
        PRPCore.Functions.Notify("Failed!", "error")
        isCrafting = false
	end)
end)

RegisterNetEvent("inventory:client:PickupSnowballs")
AddEventHandler("inventory:client:PickupSnowballs", function()
    LoadAnimDict('anim@mp_snowball')
    TaskPlayAnim(GetPlayerPed(-1), 'anim@mp_snowball', 'pickup_snowball', 3.0, 3.0, -1, 0, 1, 0, 0, 0)
    PRPCore.Functions.Progressbar("pickupsnowball", "Picking up snowballs..", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        ClearPedTasks(GetPlayerPed(-1))
        TriggerServerEvent('PRPCore:Server:AddItem', "snowball", 1)
        TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items["snowball"], "add")
    end, function() -- Cancel
        ClearPedTasks(GetPlayerPed(-1))
        PRPCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("inventory:client:UseSnowball")
AddEventHandler("inventory:client:UseSnowball", function(amount)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_snowball"), amount, false, false)
    SetPedAmmo(GetPlayerPed(-1), GetHashKey("weapon_snowball"), amount)
    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("weapon_snowball"), true)
end)

RegisterNetEvent("inventory:client:UseWeapon")
AddEventHandler("inventory:client:UseWeapon", function(weaponData, shootbool)
    local weaponName = tostring(weaponData.name)
    if currentWeapon == weaponName then
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
        RemoveAllPedWeapons(GetPlayerPed(-1), true)
        TriggerEvent('weapons:client:SetCurrentWeapon', nil, shootbool)
        currentWeapon = nil
    elseif weaponName == "weapon_stickybomb" then
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponName), ammo, false, false)
        SetPedAmmo(GetPlayerPed(-1), GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey(weaponName), true)
        TriggerServerEvent('PRPCore:Server:RemoveItem', weaponName, 1)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
    elseif weaponName == "weapon_snowball" then
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponName), ammo, false, false)
        SetPedAmmo(GetPlayerPed(-1), GetHashKey(weaponName), 10)
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey(weaponName), true)
        TriggerServerEvent('PRPCore:Server:RemoveItem', weaponName, 1)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
    else
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        PRPCore.Functions.TriggerCallback("weapon:server:GetWeaponAmmo", function(result)
            local ammo = tonumber(result)
            if weaponName == "weapon_petrolcan" or weaponName == "weapon_fireextinguisher" then
                ammo = 4000
            end
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponName), ammo, false, false)
            SetPedAmmo(GetPlayerPed(-1), GetHashKey(weaponName), ammo)
            SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey(weaponName), true)
            if weaponData.info.attachments ~= nil then
                for _, attachment in pairs(weaponData.info.attachments) do
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weaponName), GetHashKey(attachment.component))
                end
            end
            currentWeapon = weaponName
        end, CurrentWeaponData)
    end
end)

-----------------------------------------------------------
-----Weapon Attachment Crafting List 2/2-------------------
-----------------------------------------------------------
WeaponAttachments = {
    ["WEAPON_APPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_APPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_MACHINEPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MACHINEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_PISTOL50"] = {
        ["extendedclip"] = {
            component = "COMPONENT_PISTOL50_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_HEAVYPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_HEAVYPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["etchedwoodgripfinish"] = {
            component = "COMPONENT_HEAVYPISTOL_VARMOD_LUXE",
            label = "Etched Wood Grip Finish",
            item = "pistol_skin",
        },
    },
    ["WEAPON_CARBINERIFLE"] = {
        ["yusufamirluxuryfinish"] = {
            component = "COMPONENT_CARBINERIFLE_VARMOD_LUXE",
            label = "Yusuf Amir Luxury Finish",
            item = "rifle_skin",
        },
    },
    ["WEAPON_COMBATPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_COMBATPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_SNSPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_SNSPISTOL_CLIP_02",
            label = "Extended Magazine",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_VINTAGEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_PISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_PISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_MICROSMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MICROSMG_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "smg_flashlight",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Scope",
            item = "smg_scope",
        },
    },
    ["WEAPON_MINISMG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_MINISMG_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
    },
    ["WEAPON_COMBATPDW"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMBATPDW_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
    },
    ["WEAPON_ASSAULTSMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTSMG_CLIP_02",
            label = "Extended Magazine",
            item = "smg_extendedclip",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Scope",
            item = "smg_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Scope",
            item = "smg_flashlight",
        },
    },
    ["WEAPON_COMPACTRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_03",
            label = "Drum Mag",
            item = "rifle_drummag",
        },
    },
    ["WEAPON_BULLPUPRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_BULLPUPRIFLE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
    },
    ["WEAPON_SPECIALCARBINE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_SPECIALCARBINE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_SPECIALCARBINE_CLIP_03",
            label = "Drum Mag",
            item = "rifle_drummag",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
    },
    ["WEAPON_ADVANCEDRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_ADVANCEDRIFLE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
    },
    ["WEAPON_ASSAULTRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTRIFLE_CLIP_02",
            label = "Extended Magazine",
            item = "rifle_extendedclip",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
    },
}

function FormatWeaponAttachments(itemdata)
    local attachments = {}
    itemdata.name = itemdata.name:upper()
    if itemdata.info.attachments ~= nil and next(itemdata.info.attachments) ~= nil then
        for k, v in pairs(itemdata.info.attachments) do
            if WeaponAttachments[itemdata.name] ~= nil then
                for key, value in pairs(WeaponAttachments[itemdata.name]) do
                    if value.component == v.component then
                        table.insert(attachments, {
                            attachment = key,
                            label = value.label
                        })
                    end
                end
            end
        end
    end
    return attachments
end

RegisterNUICallback('GetWeaponData', function(data, cb)
    local data = {
        WeaponData = PRPCore.Shared.Items[data.weapon],
        AttachmentData = FormatWeaponAttachments(data.ItemData)
    }
    cb(data)
end)

RegisterNUICallback('RemoveAttachment', function(data, cb)
    local WeaponData = PRPCore.Shared.Items[data.WeaponData.name]
    local Attachment = WeaponAttachments[WeaponData.name:upper()][data.AttachmentData.attachment]

    PRPCore.Functions.TriggerCallback('weapons:server:RemoveAttachment', function(NewAttachments)
        if NewAttachments ~= false then
            local Attachies = {}
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey(data.WeaponData.name), GetHashKey(Attachment.component))
            for k, v in pairs(NewAttachments) do
                for wep, pew in pairs(WeaponAttachments[WeaponData.name:upper()]) do
                    if v.component == pew.component then
                        table.insert(Attachies, {
                            attachment = pew.item,
                            label = pew.label,
                        })
                    end
                end
            end
            local DJATA = {
                Attachments = Attachies,
                WeaponData = WeaponData,
            }
            cb(DJATA)
        else
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey(data.WeaponData.name), GetHashKey(Attachment.component))
            cb({})
        end
    end, data.AttachmentData, data.WeaponData)
end)

RegisterNetEvent("inventory:client:CheckWeapon")
AddEventHandler("inventory:client:CheckWeapon", function(weaponName)
    if currentWeapon == weaponName then
        TriggerEvent('weapons:ResetHolster')
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
        RemoveAllPedWeapons(GetPlayerPed(-1), true)
        currentWeapon = nil
    end
end)

RegisterNetEvent("inventory:client:AddDropItem")
AddEventHandler("inventory:client:AddDropItem", function(dropId, coords)
    --local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
    --local forward = GetEntityForwardVector(GetPlayerPed(GetPlayerFromServerId(player)))
	--local x, y, z = table.unpack(coords + forward * 0.5)
    Drops[dropId] = {
        id = dropId,
        coords = coords
    }
end)

RegisterNetEvent("inventory:client:RemoveDropItem")
AddEventHandler("inventory:client:RemoveDropItem", function(dropId)
    Drops[dropId] = nil
end)

RegisterNetEvent("inventory:client:DropItemAnim")
AddEventHandler("inventory:client:DropItemAnim", function()
    SendNUIMessage({
        action = "close",
    })
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do
        Citizen.Wait(7)
    end
    TaskPlayAnim(GetPlayerPed(-1), "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false )
    Citizen.Wait(2000)
    ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent("inventory:client:ShowId")
AddEventHandler("inventory:client:ShowId", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        local gender = "Male"
        if character.gender == 1 then
            gender = "Female"
        end
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>SS:</strong> {1} <br><strong>First name:</strong> {2} <br><strong>Surname:</strong> {3} <br><strong>Birthdate:</strong> {4} <br><strong>Gender:</strong> {5} <br><strong>Nationality:</strong> {6}</div></div>',
            args = {'ID-Card', character.citizenid, character.firstname, character.lastname, character.birthdate, gender, character.nationality}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowDriverLicense")
AddEventHandler("inventory:client:ShowDriverLicense", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Driver License:</strong> {4}</div></div>',
            args = {'Driver License', character.firstname, character.lastname, character.birthdate, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowDriftLicense")
AddEventHandler("inventory:client:ShowDriftLicense", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Driver License:</strong> {4}</div></div>',
            args = {'Drifting License', character.firstname, character.lastname, character.birthdate, character.nationality, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowDriftInstruct")
AddEventHandler("inventory:client:ShowDriftInstruct", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Driver License:</strong> {4}</div></div>',
            args = {'Drifting Instructor', character.firstname, character.lastname, character.birthdate, character.nationality, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowBwmLicense")
AddEventHandler("inventory:client:ShowBwmLicense", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Driver License:</strong> {4}</div></div>',
            args = {'Racing License', character.firstname, character.lastname, character.birthdate, character.nationality, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowBwmInstruct")
AddEventHandler("inventory:client:ShowBwmInstruct", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Driver License:</strong> {4}</div></div>',
            args = {'Racing Instructor', character.firstname, character.lastname, character.birthdate, character.nationality, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowRetailWeed")
AddEventHandler("inventory:client:ShowRetailWeed", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>License:</strong> {4}</div></div>',
            args = {'Marijuana License', character.firstname, character.lastname, character.birthdate, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowDistributorWeed")
AddEventHandler("inventory:client:ShowDistributorWeed", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>License:</strong> {4}</div></div>',
            args = {'Marijuana License', character.firstname, character.lastname, character.birthdate, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowMedicinalId")
AddEventHandler("inventory:client:ShowMedicinalId", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>License:</strong> {4}</div></div>',
            args = {'Marijuana License', character.firstname, character.lastname, character.birthdate, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:ShowTrueOriginalCard")
AddEventHandler("inventory:client:ShowTrueOriginalCard", function(coords, citizenid, character)
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    local c   = coords

    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, c.x, c.y, c.z, true) < 2.0 then
        TriggerEvent("chat:addMessage", {
            template = [[
            <div class="chat-message advert">
                <div class="chat-message-body">
                    <strong>
                        {0}:
                    </strong>
                    <br><br>
                    <strong>
                        First Name:
                    </strong>
                    {1}
                    <br>
                    <strong>
                        Last Name:
                    </strong>
                    {2}
                    <br>
                    <strong>
                        Date of Birth:
                    </strong>
                    {3}
                    <br>
                    <strong>
                        {4}
                    </strong>
                </div>
            </div>
        ]],
            args     = {
                'True Original Card',
                character.firstname,
                character.lastname,
                character.birthdate,
                character.type,
            }
        })
    end
end)

RegisterNetEvent("inventory:client:giveanimcash")
AddEventHandler("inventory:client:giveanimcash", function(coords, citizenid, character)
    playerCashAnim()
end)

RegisterNetEvent("inventory:client:giveanimitem")
AddEventHandler("inventory:client:giveanimitem", function(coords, citizenid, character)
    playerItemAnim()
end)

RegisterNetEvent("inventory:client:ShowPrescription")
AddEventHandler("inventory:client:ShowPrescription", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Prescription:</strong> {4}</div></div>',
            args = {'Marijuana License', character.firstname, character.lastname, character.birthdate, character.type}
        })
    end
end)

RegisterNetEvent("inventory:client:SetCurrentStash")
AddEventHandler("inventory:client:SetCurrentStash", function(stash)
    CurrentStash = stash
end)

RegisterNetEvent("inventory:client:close")
AddEventHandler("inventory:client:close", function()
    SendNUIMessage({
        action = "close",
    })
end)

RegisterNetEvent("inventory:client:CheckGiveItem")
AddEventHandler("inventory:client:CheckGiveItem", function(ItemData)
    local toSend = false
    local myCoords = GetEntityCoords(PlayerPedId())
    local closePlayers = PRPCore.Functions.GetPlayersFromCoords(myCoords, 3)
    local data = {}
    local civName = "Civilian"

    for i = 1, #closePlayers, 1 do
        if closePlayers ~= nil and next(closePlayers) ~= nil then
            if closePlayers[i] ~= PlayerId() then
                local playerName = GetPlayerName(closePlayers[i])
                table.insert(data, {name = civName, id = GetPlayerServerId(closePlayers[i])})
                print(playerName)
                print(closePlayers[i])
                toSend = true
            end
        else
            toSend = false
        end
    end

    if toSend then
        SendNUIMessage({
            action = "GiveItem",
            closePlayers = data,
            itemData = ItemData
        })
    else
        PRPCore.Functions.Notify("There are no players nearby!", "error")
    end
end)

RegisterNUICallback('getCombineItem', function(data, cb)
    cb(PRPCore.Shared.Items[data.item])
end)

RegisterNUICallback("CloseInventory", function(data, cb)
    if currentOtherInventory == "none-inv" then
        CurrentDrop = 0
        CurrentVehicle = nil
        CurrentGlovebox = nil
        CurrentStash = nil
        SetNuiFocus(false, false)
        inInventory = false
        ClearPedTasks(GetPlayerPed(-1))
        return
    end
    if CurrentVehicle ~= nil then
        CloseTrunk()
        TriggerServerEvent("inventory:server:SaveInventory", "trunk", CurrentVehicle)
        CurrentVehicle = nil
    elseif CurrentGlovebox ~= nil then
        TriggerServerEvent("inventory:server:SaveInventory", "glovebox", CurrentGlovebox)
        CurrentGlovebox = nil
    elseif CurrentStash ~= nil then
        TriggerServerEvent("inventory:server:SaveInventory", "stash", CurrentStash)
        CurrentStash = nil
    else
        TriggerServerEvent("inventory:server:SaveInventory", "drop", CurrentDrop)
        CurrentDrop = 0
    end
    SetNuiFocus(false, false)
    inInventory = false
end)
RegisterNUICallback("UseItem", function(data, cb)
    TriggerServerEvent("inventory:server:UseItem", data.inventory, data.item)
end)

RegisterNUICallback("CheckGiveItem", function(data, cb)
    TriggerServerEvent("inventory:server:CheckGiveItem", data.inventory, data.item)
end)

RegisterNUICallback("combineItem", function(data)
    Citizen.Wait(150)
    TriggerServerEvent('inventory:server:combineItem', data.reward, data.fromItem, data.toItem)
    TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items[data.reward], 'add')
end)

RegisterNUICallback('combineWithAnim', function(data)
    local combineData = data.combineData
    local aDict = combineData.anim.dict
    local aLib = combineData.anim.lib
    local animText = combineData.anim.text
    local animTimeout = combineData.anim.timeOut

    PRPCore.Functions.Progressbar("combine_anim", animText, animTimeout, false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = aDict,
        anim = aLib,
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), aDict, aLib, 1.0)
        TriggerServerEvent('inventory:server:combineItem', combineData.reward, data.requiredItem, data.usedItem)
        TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items[combineData.reward], 'add')
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), aDict, aLib, 1.0)
        PRPCore.Functions.Notify("Failed!", "error")
    end)
end)

RegisterNUICallback("SetInventoryData", function(data, cb)
    TriggerServerEvent("inventory:server:SetInventoryData", data.fromInventory, data.toInventory, data.fromSlot, data.toSlot, data.fromAmount, data.toAmount)
end)

RegisterNUICallback("PlayDropSound", function(data, cb)
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback("PlayDropFail", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback("GiveItem", function(data, cb)
    playerItemAnim()
    TriggerServerEvent("inventory:server:GiveItem", data.item, data.player.id, data.amount)
end)

function OpenTrunk()
    local vehicle = PRPCore.Functions.GetClosestVehicle()
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@idle_b", "idle_d", 4.0, 4.0, -1, 50, 0, false, false, false)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorOpen(vehicle, 4, false, false)
    else
        SetVehicleDoorOpen(vehicle, 5, false, false)
    end
end

function CloseTrunk()
    local vehicle = PRPCore.Functions.GetClosestVehicle()
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_bum_bin@idle_b", "exit", 4.0, 4.0, -1, 50, 0, false, false, false)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorShut(vehicle, 4, false)
    else
        SetVehicleDoorShut(vehicle, 5, false)
    end
end

function IsBackEngine(vehModel)
    for _, model in pairs(BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end

function ToggleHotbar(toggle)
    local HotbarItems = {
        [1] = PRPCore.Functions.GetPlayerData().items[1],
        [2] = PRPCore.Functions.GetPlayerData().items[2],
        [3] = PRPCore.Functions.GetPlayerData().items[3],
        [4] = PRPCore.Functions.GetPlayerData().items[4],
        [5] = PRPCore.Functions.GetPlayerData().items[5],
        [41] = PRPCore.Functions.GetPlayerData().items[41],
    }

    if toggle then
        SendNUIMessage({
            action = "toggleHotbar",
            open = true,
            items = HotbarItems
        })
    else
        SendNUIMessage({
            action = "toggleHotbar",
            open = false,
        })
    end
end

function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end

  function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function playerCashAnim()
	loadAnimDict( "friends@laf@ig_5" )
    TaskPlayAnim( PlayerPedId(), "friends@laf@ig_5", "nephew", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

function playerItemAnim()
	loadAnimDict( "taxi_hail" )
    TaskPlayAnim( PlayerPedId(), "taxi_hail", "forget_it", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

function giveAnim()
    if ( DoesEntityExist( deliveryPed ) and not IsEntityDead( deliveryPed ) ) then
        loadAnimDict( "mp_safehouselost@" )
        if ( IsEntityPlayingAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 3 ) ) then
            TaskPlayAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        else
            TaskPlayAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        end
    end
end
