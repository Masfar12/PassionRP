local StandObject = nil

---------------------
-- Go/Leave Casino --
---------------------
local enterCasino = PolyZone:Create({
    vector2(932.85375976563, 48.176704406738),
    vector2(933.04974365234, 46.268394470215),
    vector2(934.09765625, 44.758888244629),
    vector2(935.81726074219, 44.414409637451),
    vector2(938.25323486328, 45.810123443604),
}, {
    name = "Casino Entrance",
    debugGrid = false,
    maxZ = 90.0,
    gridDivisions = 45
})

local exitCasino = PolyZone:Create({
    vector2(1092.3579101563, 205.77461242676),
    vector2(1093.0406494141, 208.4037322998),
    vector2(1091.0189208984, 210.91795349121),
    vector2(1088.6881103516, 212.57177734375),
    vector2(1086.9975585938, 205.79501342773),
}, {
    name = "Casino",
    debugGrid = false,
    maxZ = 90.0,
    gridDivisions = 45
})

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local plyPed = PlayerPedId()
        local coord = GetPedBoneCoords(plyPed, 0x796e)
        local inPolyEntering = enterCasino:isPointInside(coord)
        local inPolyExiting = exitCasino:isPointInside(coord)

        if inPolyEntering and not insideEntering then
            insideEntering = true
            SetEntityCoords(PlayerPedId(), 1094.9871826172, 212.01379394531, -49.99729156494, 0, 0, 0, false)
            SetEntityHeading(PlayerPedId(), 286.49)
            FreezeEntityPosition(PlayerPedId(), true)
            Citizen.Wait(500)
            FreezeEntityPosition(PlayerPedId(), false)
            Citizen.Wait(100)
            DoScreenFadeIn(1000)

            local oldVehicle = GetClosestVehicle(1099.62, 219.99, -48.74, 3.0, 0, 70)
            if oldVehicle ~= 0 then
                print("Vehicle Stat")
            else
                    
                local model = GetHashKey("bdragon")
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Citizen.Wait(0)
                end
        
                local veh = CreateVehicle(model, 1099.62, 219.99, -48.74, false, false)
                SetModelAsNoLongerNeeded(model)
                SetVehicleOnGroundProperly(veh)
                SetEntityInvincible(veh,true)
                SetEntityHeading(veh, 313.51)
                SetVehicleDoorsLocked(veh, 3)
                WashDecalsFromVehicle(veh, 1.0)
                SetVehicleDirtLevel(veh, 1.0)
        
                FreezeEntityPosition(veh,true)
                SetVehicleNumberPlateText(veh, "NOTSAMIS")
                SetVehicleOnGroundProperly(veh)
            end


            -- 1130.4291992188, 265.78103637695, -51.035774230957, 7.8470187187195
            LoadModel("ch_prop_casino_roulette_01a")
            StandObject = CreateObject(GetHashKey('ch_prop_casino_roulette_01a'), 1130.429, 267.00, -51.03, true)
            PlaceObjectOnGroundProperly(StandObject)
            SetEntityHeading(StandObject, 7.85 - 90)
            FreezeEntityPosition(StandObject, true)

            TriggerEvent('chCasinoWall:enteredCasino')

        elseif not inPoly and insideEntering then
            insideEntering = false
        end

        if inPolyExiting and not insideExiting then
            insideExiting = true
            SetEntityCoords(PlayerPedId(), 926.20, 45.19, 80.5, 0, 0, 0, false)
            SetEntityHeading(PlayerPedId(), 53.75)
            FreezeEntityPosition(PlayerPedId(), true)
            Citizen.Wait(500)
            FreezeEntityPosition(PlayerPedId(), false)
            Citizen.Wait(100)
            DoScreenFadeIn(1000)

            if DoesEntityExist(StandObject) then
                DeleteObject(StandObject)
                SetModelAsNoLongerNeeded(StandObject)
            end

            TriggerEvent('chCasinoWall:exitedCasino')
        elseif not inPolyExiting and insideExiting then
            insideExiting = false
        end

        Citizen.Wait(500)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if StandObject ~= nil then
            DeleteObject(StandObject)   
            ClearPedTasksImmediately(GetPlayerPed(-1))
        end
    end
end)

---------------
-- Functions --
---------------
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

 function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(1)
    end
end