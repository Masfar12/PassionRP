PRPCore = nil

local isLoggedIn = true
local CurrentWeaponData = {}
local PlayerData = {}
local CanShoot = true
local weapon = nil
local ammo = nil
local ped
local PlayerJob

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
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function() 
    while true do
        if isLoggedIn then
            TriggerServerEvent("weapons:server:SaveWeaponAmmo")
        end
        Citizen.Wait(60000)
    end
end)

Citizen.CreateThread(function() 
     while true do
        Citizen.Wait(100)
         if isLoggedIn then
            PlayerJob = PRPCore.Functions.GetPlayerData().job
         end
         Citizen.Wait(60000)
     end
 end)

local MultiplierAmount = 0

Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if isLoggedIn then
            sleep = 250
            if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
                sleep = 0
                if IsPedShooting(ped) or IsControlJustPressed(0, 24) then
                    CanShoot = true
                    if CanShoot then
                        --local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
                        --local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)
                        if PRPCore.Shared.Weapons[weapon]["name"] == "weapon_snowball" then
                            TriggerServerEvent('PRPCore:Server:RemoveItem', "snowball", 1)
                        elseif PRPCore.Shared.Weapons[weapon]["name"] == "weapon_pipebomb" then
                            TriggerServerEvent('PRPCore:Server:RemoveItem', "weapon_pipebomb", 1)
                        elseif PRPCore.Shared.Weapons[weapon]["name"] == "weapon_molotov" then
                            TriggerServerEvent('PRPCore:Server:RemoveItem', "weapon_molotov", 1)
                        elseif PRPCore.Shared.Weapons[weapon]["name"] == "weapon_stickybomb" then
                            TriggerServerEvent('PRPCore:Server:RemoveItem', "weapon_stickybomb", 1)
                        elseif PRPCore.Shared.Weapons[weapon]["name"] == "weapon_smokegrenade" then
                            TriggerServerEvent('PRPCore:Server:RemoveItem', "weapon_smokegrenade", 1)
                        elseif PRPCore.Shared.Weapons[weapon]["name"] == "weapon_proxmine" then
                            TriggerServerEvent('PRPCore:Server:RemoveItem', "weapon_proxmine", 1)
                        elseif PRPCore.Shared.Weapons[weapon]["name"] == "weapon_flashbang" then
                            TriggerServerEvent('PRPCore:Server:RemoveItem', "weapon_flashbang", 1)
                        else
                            if ammo > 0 then
                                MultiplierAmount = MultiplierAmount + 1
                            end
                        end
                    else
                        TriggerEvent('inventory:client:CheckWeapon')
                        PRPCore.Functions.Notify("This weapon is broken and cannot be used..", "error")
                        MultiplierAmount = 0
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local outOfAmmo = false
        local broken = false
        local sleep = 500
        isLoggedIn = true
        if isLoggedIn then
            sleep = 250
            ped = GetPlayerPed(-1)
            weapon = GetSelectedPedWeapon(ped)
            ammo = GetAmmoInPedWeapon(ped, weapon)

            if ammo == 1 then
                sleep = 0
                if (weapon ~= -1169823560 and weapon ~= 615608432 and weapon ~= 741814745 and weapon ~= -37975472 and weapon ~= -1420407917 and weapon ~= -73270376) then
                    DisableControlAction(0, 24, true) -- Attack
                    DisableControlAction(0, 257, true) -- Attack 2
                    if IsPedInAnyVehicle(ped, true) then
                        SetPlayerCanDoDriveBy(ped, false)
                    end
                    outOfAmmo = true
                end
            end
            if CurrentWeaponData ~= nil then
                if next(CurrentWeaponData) ~= nil then
                    if CurrentWeaponData.info ~= nil then
                        if CurrentWeaponData.info.quality ~= nil then
                            if CurrentWeaponData.info.quality <= 0 then
                                sleep = 0
                                if CurrentWeaponData.info.quality < 0 then
                                    CurrentWeaponData.info.quality = 0
                                end
                                if (weapon ~= -1169823560 and weapon ~= 615608432 and weapon ~= 741814745 and weapon ~= -37975472) then
                                    broken = true
                                end
                            end
                        end
                    end
                end
            end
            if outOfAmmo or broken then
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                if IsPedInAnyVehicle(ped, true) then
                    SetPlayerCanDoDriveBy(ped, false)
                end
            else
                sleep = 5
                EnableControlAction(0, 24, true) -- Attack
                EnableControlAction(0, 257, true) -- Attack 2
                if IsPedInAnyVehicle(ped, true) then
                    SetPlayerCanDoDriveBy(ped, true)
                end            
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2500
        if isLoggedIn then
            sleep = 0
            if IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24) then
                --local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
                --local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)

                if ammo > 0 then
                    TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, tonumber(ammo))
                else
                    TriggerEvent('inventory:client:CheckWeapon')
                    TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, 0)
                end

                if MultiplierAmount > 0 then
                    TriggerServerEvent("weapons:server:UpdateWeaponQuality", CurrentWeaponData, MultiplierAmount)
                    MultiplierAmount = 0
                end
            end
            
            if IsPedShooting(ped) then
                if ammo - 1 <= 1 then
                    if weapon == -1312131151 then
                        if ammo == 2 then
                            RemoveAllPedWeapons(ped, true)
                        end
                    end
                    SetAmmoInClip(ped, GetHashKey(PRPCore.Shared.Weapons[weapon]["name"]), 1)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if isLoggedIn then
            sleep = 250
            local inRange = false
            --local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local hours = GetClockHours()

            for k, data in pairs(Config.WeaponRepairPoints) do
                --local distance = GetDistanceBetweenCoords(pos, data.coords.x, data.coords.y, data.coords.z, true)
                local distance = #(vector3(data.coords.x,data.coords.y,data.coords.z)-pos)

                if distance < 10 then
                    sleep = 0
                    inRange = true

                    if distance < 1 then
                        if PlayerJob ~= nil then
                            if PlayerJob.name ~= "police" then
                                if hours >= 03 and hours <= 06 then
                                    if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
                                        local WeaponData = PRPCore.Shared.Weapons[GetHashKey(CurrentWeaponData.name)]
                                        local WeaponClass = (PRPCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()
                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Repair Weapon, ~g~$'..Config.WeaponRepairCotsts[WeaponClass]..'~w~')
                                        if IsControlJustPressed(0, 38) then
                                            PRPCore.Functions.TriggerCallback('weapons:server:RepairWeapon', function(HasMoney)
                                                if HasMoney then
                                                    TriggerServerEvent("prp-log:server:CreateLog", "repairshop", "Repair shop", "green",  GetPlayerName(PlayerId()).. "** has his "..CurrentWeaponData.name.. " repaired for: $"..Config.WeaponRepairCotsts[WeaponClass])         
                                                end
                                            end, Config.WeaponRepairCotsts[WeaponClass], CurrentWeaponData, false)
                                        end
                                    else
                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'You have no weapon in your hand..')
                                    end
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'The repair shop is currently ~r~NOT~w~ available..')
                                end
                            else
                                if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
                                    local WeaponData = PRPCore.Shared.Weapons[GetHashKey(CurrentWeaponData.name)]
                                    local WeaponClass = (PRPCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Repair Weapon')
                                    if IsControlJustPressed(0, 38) then
                                        PRPCore.Functions.TriggerCallback('weapons:server:RepairWeapon', function()
                                            TriggerServerEvent("prp-log:server:CreateLog", "repairshop", "Repair shop", "green",  GetPlayerName(PlayerId()).. "** has his "..CurrentWeaponData.name.. " repaired")         
                                        end, Config.WeaponRepairCotsts[WeaponClass], CurrentWeaponData, true)
                                    end
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'You have no weapon in your hand..')
                                end
                            end
                        end
                    end
                end
            end

            if not inRange then
                Citizen.Wait(1000)
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('weapon:client:AddAmmo')
AddEventHandler('weapon:client:AddAmmo', function(type, amount, itemData)
    --local ped = GetPlayerPed(-1)
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData ~= nil then
        if PRPCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and PRPCore.Shared.Weapons[weapon]["ammotype"] == type:upper() then
            local total = (GetAmmoInPedWeapon(ped, weapon))
            local retval = GetMaxAmmoInClip(ped, weapon, 1)
            retval = tonumber(retval)

            local x = PRPCore.Functions.GetPlayerData().items
            local len = tablelength(x)
            local found = false
            for i=1,len do
                print(dump(PRPCore.Functions.GetPlayerData().items[i]))
                if PRPCore.Functions.GetPlayerData().items[i] ~= nil and PRPCore.Functions.GetPlayerData().items[i]["name"] == "speedloader" then
                    found = true
                end
            end

            local waittime = math.random(2000, 6000)
            if found == true then
                waittime = math.random(1000, 2000)
            end

           
            if (total + retval) <= (retval * 8 + 1) then
                PRPCore.Functions.Progressbar("taking_bullets", "loading magazine..", math.random(4000, 6000), false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    if PRPCore.Shared.Weapons[weapon] ~= nil then
                        GetAmmoInClip(ped, weapon, 0)
                        AddAmmoToPed(ped, weapon, retval)
                        TriggerServerEvent("weapons:server:AddWeaponAmmo", CurrentWeaponData, retval)
                        TriggerServerEvent('weapons:server:UpdateWeaponAmmo', CurrentWeaponData, GetAmmoInPedWeapon(ped, weapon))
                        TriggerServerEvent('PRPCore:Server:RemoveItem', itemData.name, 1, itemData.slot)
                        TriggerEvent('inventory:client:ItemBox', PRPCore.Shared.Items[itemData.name], "remove")
                        TriggerEvent('PRPCore:Notify', retval.." x bullets loaded", "success")
                    end
                end, function()
                    PRPCore.Functions.Notify("Canceled..", "error")
                end)
            else
                PRPCore.Functions.Notify("Your weapon is already loaded..", "error")
            end
        else
            PRPCore.Functions.Notify("You don't have a weapon..", "error")
        end
    else
        PRPCore.Functions.Notify("You don't have a weapon..", "error")
    end
end)

RegisterNetEvent('weapons:client:SetCurrentWeapon')
AddEventHandler('weapons:client:SetCurrentWeapon', function(data, bool)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
    CanShoot = bool
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent("weapons:client:EquipAttachment")
AddEventHandler("weapons:client:EquipAttachment", function(ItemData, attachment)
    local weapon = GetSelectedPedWeapon(ped)
    local WeaponData = PRPCore.Shared.Weapons[weapon]
    
    if weapon ~= GetHashKey("WEAPON_UNARMED") then
        WeaponData.name = WeaponData.name:upper()
        if Config.WeaponAttachments[WeaponData.name] ~= nil then
            if Config.WeaponAttachments[WeaponData.name][attachment] ~= nil then
                TriggerServerEvent("weapons:server:EquipAttachment", ItemData, CurrentWeaponData, Config.WeaponAttachments[WeaponData.name][attachment])
            else
                PRPCore.Functions.Notify("This weapon does not support this attachment..", "error")
            end
        end
    else
        PRPCore.Functions.Notify("You have no weapon in your hand..", "error")
    end
end)

RegisterNetEvent("addAttachment")
AddEventHandler("addAttachment", function(component)
    local weapon = GetSelectedPedWeapon(ped)
    local WeaponData = PRPCore.Shared.Weapons[weapon]
    GiveWeaponComponentToPed(ped, GetHashKey(WeaponData.name), GetHashKey(component))
end)

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end

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
