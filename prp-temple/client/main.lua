Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

PRPCore = nil
isLoggedIn = true
local ClosestCustomVehicle = 1
local CustomModelLoaded = true

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

PlayerJob = {}
---------------------
-- Citizen Threads --
---------------------


Citizen.CreateThread(function()
    Citizen.Wait(1000)
    if isLoggedIn then
    for i = 1, #Temple.TempleVehicles, 1 do
        local oldVehicle = GetClosestVehicle(Temple.TempleVehicles[i].coords.x, Temple.TempleVehicles[i].coords.y, Temple.TempleVehicles[i].coords.z, 3.0, 0, 70)
        if oldVehicle ~= 0 then
            PRPCore.Functions.DeleteVehicle(oldVehicle)
        end

        local model = Temple.TempleVehicles[i].car
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model, Temple.TempleVehicles[i].coords.x, Temple.TempleVehicles[i].coords.y, (Temple.TempleVehicles[i].coords.z), false, false)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)
		SetEntityInvincible(veh,true)
        SetEntityHeading(veh, Temple.TempleVehicles[i].coords.h)
        SetVehicleDoorsLocked(veh, 3)

		FreezeEntityPosition(veh,true)
		SetVehicleNumberPlateText(veh, i .. "RACECAR")
    end
end
end)


Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local ShopDistance = GetDistanceBetweenCoords(pos, Temple.TempleVehicles[1].coords.x, Temple.TempleVehicles[1].coords.y, Temple.TempleVehicles[1].coords.z, false)

        if isLoggedIn then
            if ShopDistance <= 50 then
                SetClosestCustomVehicle()
            end
        end
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped, false)
        local dist = GetDistanceBetweenCoords(pos, Temple.TempleVehicles[ClosestCustomVehicle].coords.x, Temple.TempleVehicles[ClosestCustomVehicle].coords.y, Temple.TempleVehicles[ClosestCustomVehicle].coords.z, false)

        if isLoggedIn then
            if dist < 2 then
                local price = Temple.TempleVehicles[ClosestCustomVehicle].price
                if not buying then
                    DrawText3Ds(Temple.TempleVehicles[ClosestCustomVehicle].coords.x, Temple.TempleVehicles[ClosestCustomVehicle].coords.y, Temple.TempleVehicles[ClosestCustomVehicle].coords.z + 1.0, '~g~E~w~ - Buy Vehicle (~g~'..price..' Coins~w~)')

                    if IsControlJustPressed(0, 38) then
                        buying = true
                    end
                else
                    DrawText3Ds(Temple.TempleVehicles[ClosestCustomVehicle].coords.x, Temple.TempleVehicles[ClosestCustomVehicle].coords.y, Temple.TempleVehicles[ClosestCustomVehicle].coords.z + 1.0, 'Are you sure you want to buy this Vehicle?')
                    DrawText3Ds(Temple.TempleVehicles[ClosestCustomVehicle].coords.x, Temple.TempleVehicles[ClosestCustomVehicle].coords.y, Temple.TempleVehicles[ClosestCustomVehicle].coords.z + 0.9, '~g~7- Yes~w~ ~b~'..price..' Coins~w~  |  ~r~8- No~w~')
                    if IsDisabledControlJustPressed(0, Keys["7"]) then
                        TriggerServerEvent('prp-temple:server:buyTempleCar',Temple.TempleVehicles[ClosestCustomVehicle].car, price)
                    end
                    if IsDisabledControlJustPressed(0, Keys["8"]) then
                        buying = false
                    end
                end
            end
        end
        Citizen.Wait(3)
    end
end)

------------
-- Events --
------------
RegisterNetEvent('prp-temple:client:buyVehicle')
AddEventHandler('prp-temple:client:buyVehicle', function(vehicle, plate)
    PRPCore.Functions.SpawnVehicle(vehicle, function(veh)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, Temple.TemplePurchaseSpawn.h)
        SetEntityAsMissionEntity(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        TriggerServerEvent("lscustoms:server:SaveVehicleProps", PRPCore.Functions.GetVehicleProperties(veh))
        SetEntityAsMissionEntity(veh, true, true)
    end, Temple.TemplePurchaseSpawn, false)
end)

---------------
-- Functions --
---------------
function SetClosestCustomVehicle()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil

    for id, veh in pairs(Temple.TempleVehicles) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Temple.TempleVehicles[id].coords.x, Temple.TempleVehicles[id].coords.y, Temple.TempleVehicles[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Temple.TempleVehicles[id].coords.x, Temple.TempleVehicles[id].coords.y, Temple.TempleVehicles[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Temple.TempleVehicles[id].coords.x, Temple.TempleVehicles[id].coords.y, Temple.TempleVehicles[id].coords.z, true)
            current = id
        end
    end
    if current ~= ClosestCustomVehicle then
        ClosestCustomVehicle = current
    end
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