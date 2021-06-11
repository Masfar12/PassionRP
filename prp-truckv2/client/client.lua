---------------
-- Variables --
---------------
PRPCore = nil
local isLoggedIn = true
local coord = vector3(1159.8433837891, -315.24078369141, 69.205078125)
local pos = nil
local inUse = false
local found
local truck
local TruckIsExploded = false
local h = math.random(1,400)
local robbed
local blowing = false

--------------------
-- PRP Core Stuff --
--------------------
Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

------------
-- Events --
------------
RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('prp-truck:SyncRobberyClient')
AddEventHandler('prp-truck:SyncRobberyClient', function(bool)
    inUse = bool
end)

RegisterNetEvent('prp-truck:clientgetreward')
AddEventHandler('prp-truck:clientgetreward', function(p)
    if p ~= nil then
        if p == h then
            TriggerServerEvent('prp-truck:server:1ii1i1i1ii1')
        else
            TriggerServerEvent("prp-log:server:CreateLog", "honeypot", "LUA INJECTION", "red", "**"..GetPlayerName(PlayerId()).."** tried to execute reward for drugs. Expected: "..h.." Got:"..p)
        end
    else
        TriggerServerEvent("prp-log:server:CreateLog", "honeypot", "LUA INJECTION", "red", "**"..GetPlayerName(PlayerId()).."** tried to execute reward for drugs. Got nil")
    end
end)

RegisterNetEvent('prp-truck:client:setLocation')
AddEventHandler('prp-truck:client:setLocation', function(locationData)

    if activeTruck == nil then
        activeTruck = locationData
        SetNewWaypoint(pos.x, pos.y)
        PRPCore.Functions.Notify('The location has been marked on your GPS.', 'success');
    else
        SetNewWaypoint(x, y)
        PRPCore.Functions.Notify('You have to finish your delivery for '..activeTruck["dealer"]..' first!')
        return
    end

    Citizen.CreateThread(function()
        while true do
            sleep = 5
            local pcoords = GetEntityCoords(GetPlayerPed(-1))
            local vcoords = GetEntityCoords(truck)
            local dist = #( vector3(pcoords.x, pcoords.y, pcoords.z) - vector3(pos.x, pos.y, pos.z) )
            local vdist = #( vector3(pcoords.x, pcoords.y, pcoords.z) - vector3(vcoords.x, vcoords.y, vcoords.z) )
            if dist < 250 then
                sleep = 250
                if not found then
                    TriggerSpawn()
                    found = true
    
                end
            end

            if vdist < 20 and vcoords.x ~= 0.0 and found then
                sleep = 5
                local text = GetOffsetFromEntityInWorldCoords(truck, 0.0, -4.25, 0.0)
                if vdist < 10 then
                    if activeTruck ~= nil and TruckIsExploded == false and blowing == false then
                        DrawText3Ds(text.x, text.y, text.z, 'Arm C4 [E]')	
                        if IsControlJustPressed(1, 51) then
                            BlowTruck()
                        end
                    end

                    if activeTruck ~= nil and TruckIsExploded == true and robbed ~= true then
                        DrawText3Ds(text.x, text.y, text.z, 'Rob Truck [E]')	
                        if IsControlJustPressed(1, 51) then
                            RobTruck()
                        end
                    end
                end
            elseif found and vcoords.x == 0.0 then
                --PRPCore.Functions.Notify('The truck got away!.', 'error');
                --Cancel()
            end
            Wait(sleep)
        end
    end)
end)

RegisterNetEvent('prp-truck:client:robberyCall')
AddEventHandler('prp-truck:client:robberyCall', function(coords)

    local job = nil
    if PlayerJob == nil then
        job = PRPCore.Functions.GetPlayerData().job.name
    else
        job = PlayerJob.name
    end

    if job == "police" then 
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
        	timeOut = 30000,
            alertTitle = "Bank Truck Robbery",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
		})
		
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Merryweather Breach")
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
    end
end)


--------------------
-- Client Threads --
--------------------
Citizen.CreateThread(function()
    local sleep
	while not coord do
		Citizen.Wait(5)
	end
    while true do
        sleep = 500
        if isLoggedIn then
            sleep = 5
            local player = GetPlayerPed(-1)
            local playercoords = GetEntityCoords(player)
            local dist = #(vector3(playercoords.x, playercoords.y, playercoords.z)-vector3(coord.x, coord.y, coord.z))
            if not inUse then
                if dist <= 2 then
                    sleep = 5
                    DrawText3Ds(coord.x, coord.y, coord.z, '~g~E~w~ - USB enter')	
                    if IsControlJustPressed(1, 51) then
                        PRPCore.Functions.TriggerCallback('prp-truck:server:HasCard', function(HasItem)
                            if HasItem then
                                PRPCore.Functions.TriggerCallback('prp-jewellery:server:getCops', function(cops)
                                    if cops >= 5 then
                                        TriggerEvent("mhacking:show")
                                        TriggerEvent("mhacking:start", math.random(3, 5), math.random(10, 18), OnHackDone)
                                    else
                                        PRPCore.Functions.Notify('There are not enough cops on duty...', 'error', 10000)
                                    end
                                end)
                            else
                                PRPCore.Functions.Notify('You do not have a card', 'error')
                            end
                        end)
                    end
                end
            elseif dist <= 3 and inUse then
                sleep = 5
                DrawText3Ds(coord.x, coord.y, coord.z, 'unavailable')
            else
                sleep = 3000
            end
            
        end
        Citizen.Wait(sleep)
    end
end)

---------------
-- Functions --
---------------
function BlowTruck()
    blowing = true
    local playerPed = GetPlayerPed(-1)
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
    TriggerServerEvent("prp-truck:callCops", GetEntityCoords(PlayerPedId()))
    itemC4prop = CreateObject(GetHashKey('prop_c4_final_green'), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(itemC4prop, playerPed, GetPedBoneIndex(playerPed, 60309), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
    SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"),true)
    Citizen.Wait(700)
    FreezeEntityPosition(playerPed, true)
    TaskPlayAnim(playerPed, 'anim@heists@ornate_bank@thermal_charge_heels', "thermal_charge", 3.0, -8, -1, 63, 0, 0, 0, 0 )

    PRPCore.Functions.Progressbar("smoke_joint", "Planting C4..", 30000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        ClearPedTasks(playerPed)
        DetachEntity(itemC4prop)
        AttachEntityToEntity(itemC4prop, truck, GetEntityBoneIndexByName(truck, 'door_pside_r'), -0.7, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        FreezeEntityPosition(playerPed, false)
        Citizen.Wait(500)

        PRPCore.Functions.Progressbar("smoke_joint", "TIME UNTIL DETONATION..", 30000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        }, {}, {}, {}, function() -- Done
            local TruckPos = GetEntityCoords(truck)
            SetVehicleDoorBroken(truck, 2, false)
            SetVehicleDoorBroken(truck, 3, false)
            AddExplosion(TruckPos.x,TruckPos.y,TruckPos.z, 'EXPLOSION_TANKER', 2.0, true, false, 2.0)
            ApplyForceToEntity(truck, 0, TruckPos.x,TruckPos.y,TruckPos.z, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
            TruckIsExploded = true
            PRPCore.Functions.Notify('Blown!', 'success')
        end)

    end)

end

function OnHackDone(success)

    if success then
        TriggerEvent('mhacking:hide')
        PRPCore.Functions.Notify('The informant will contact you soon', 'success')
        Citizen.Wait(3000)
        inUse = true
        found = false
        truck = nil
        TriggerServerEvent('prp-truck:SyncRobbery', true)
        main()
    else
        PRPCore.Functions.Notify('Hack failed!', 'success')
        TriggerEvent('mhacking:hide')
    end
end

function RobTruck()

    robbed = true

    RequestAnimDict('anim@heists@ornate_bank@grab_cash_heels')
	while not HasAnimDictLoaded('anim@heists@ornate_bank@grab_cash_heels') do
		Citizen.Wait(50)
    end

    local playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(playerPed)
	
	moneyBag = CreateObject(GetHashKey('prop_cs_heist_bag_02'),pos.x, pos.y,pos.z, true, true, true)
	AttachEntityToEntity(moneyBag, playerPed, GetPedBoneIndex(playerPed, 57005), 0.0, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
	TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
	FreezeEntityPosition(playerPed, true)
    
    PRPCore.Functions.Progressbar("smoke_joint", "Robbing Truck", 120000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done

        DeleteEntity(moneyBag)
        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)

        TriggerEvent("prp-truck:clientgetreward", h)

    end)

end

function Cancel()
    inUse = false
    found = false
    HasItem = false
    pos = nil
    truck = nil
end

function main()
    PRPCore.Functions.TriggerCallback('prp-truck:server:GetCoords', function(Coords)
        pos = Coords
    end)
    Wait(500)
    phonepos = vector3(pos.x,pos.y,pos.z)
    waitingTruck = {
        ["coords"] = phonepos,
        ["locationLabel"] = "",
        ["dealer"] = "Achmed",
        ["itemData"] = "test2"
    }
    TriggerServerEvent('prp-phone:server:sendNewMail', {
        sender = "Achmed",
        subject = "Truck location",
        message = 'Check the message for the locations and take a look at the images to know what your dealing with <br> <img style="filter: blur(1px); width: 80%; height: 80%;" src="https://cdn.discordapp.com/attachments/549952050251825162/765614716671885372/Gruppe6-GTAV-GuardAtGarage.jpg"><img><br><img style=" margin-top: 10%; filter: blur(2px); width: 80%; height: 80%;" src="https://cdn.discordapp.com/attachments/549952050251825162/765614689765425192/Stockade-GTAV-front.png"><img>',
        button = {
            enabled = true,
            buttonEvent = "prp-truck:client:setLocation",
            buttonData = waitingTruck
        }
    })
end

function TriggerSpawn()
    local mtruck = GetHashKey("stockade")
    RequestModel(mtruck)
    while not HasModelLoaded(mtruck) do
        Wait(0)
    end

    truck = CreateVehicle(mtruck, pos.x, pos.y, pos.z, pos.w, true, false)

    createped()

end

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


function createped()

    local pos = GetEntityCoords(GetPlayerPed(-1))
    local hashKey = GetHashKey("ig_casey")
    --local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.001, 0, 70)
    local pedType = 5

    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(500)
    end

    guard = CreatePedInsideVehicle(truck, pedType, hashKey, -1, 1, 1)
    guard2 = CreatePedInsideVehicle(truck, pedType, hashKey, 0, 1, 1)

    AddRelationshipGroup('x')

  --////////////
  --  Guard 1
  --///////////

    SetPedFleeAttributes(guard, 0, 0)
    SetPedKeepTask(guard, true)
    SetPedShootRate(guard,  750)
    SetPedCombatAttributes(guard, 46, true)
    SetPedFleeAttributes(guard, 0, 0)
    SetPedAsEnemy(guard,true)
    SetPedMaxHealth(guard, 900)
    SetPedAlertness(guard, 3)
    SetPedCombatRange(guard, 0)
    SetPedCombatMovement(guard, 3)
    TaskCombatPed(guard, GetPlayerPed(-1), 0,16)
    SetPedRelationshipGroupHash(guard, 'x')
    TaskLeaveVehicle(guard, vehicle, 0)
    GiveWeaponToPed(guard, GetHashKey("WEAPON_SMG"), 5000, true, true)
    SetPedRelationshipGroupHash( guard, GetHashKey("HATES_PLAYER"))

    --////////////
    --  Guard 2
    --///////////
    SetPedShootRate(guard2,  750)
    SetPedCombatAttributes(guard2, 46, true)
    SetPedFleeAttributes(guard2, 0, 0)
    SetPedAsEnemy(guard2,true)
    SetPedMaxHealth(guard2, 900)
    SetPedAlertness(guard2, 3)
    SetPedRelationshipGroupHash(guard2, 'x')
    SetPedCombatRange(guard2, 0)
    SetPedCombatMovement(guard2, 3)
    TaskCombatPed(guard2, GetPlayerPed(-1), 0,16)
    TaskLeaveVehicle(guard2, vehicle, 0)
    GiveWeaponToPed(guard2, GetHashKey("WEAPON_SMG"), 5000, true, true)
    SetPedRelationshipGroupHash( guard2, GetHashKey("HATES_PLAYER"))
    TaskVehicleDriveWander(guard2, truck, 80.0, 443)
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