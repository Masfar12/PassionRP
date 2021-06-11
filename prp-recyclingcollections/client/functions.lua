function keyToPressString(key, todoString)
    return string.format("~g~[%s]~w~ - %s", key, todoString)
end

function refreshLocations()
    local out = {}

    for region, coordsTable in pairs(_Config.collectionCoords) do
        out[region] = {}

        for _, c in pairs(coordsTable) do
            table.insert(out[region], {
                x = c.x,
                y = c.y,
                z = c.z,
            })
        end
    end

    _liveData.remainingLocations = out
end

--[[
    Return: table(coords), bool(isEndLocation)
]]
function getNextLocation(currentRegionIndex)
    local nextRegionIndex = currentRegionIndex == #_Config.regionOrder
        and 1
        or currentRegionIndex + 1

    local nextRegion = _Config.regionOrder[nextRegionIndex]

    _liveData.currentRegionIndex = nextRegionIndex

    if _liveData.remainingLocations[nextRegion] == nil or #_liveData.remainingLocations[nextRegion] == 0 then
        -- out of locations
        return _Config.endLocation.coords, true
    end

    local rnd = math.random(1, #_liveData.remainingLocations[nextRegion])

    local out = _liveData.remainingLocations[nextRegion][rnd]
    table.remove(_liveData.remainingLocations[nextRegion], rnd)

    return out, false
end

function hasLocationsLeft()
    for _, v in pairs(_liveData.remainingLocations) do
        if v ~= nil and #v > 0 then
            return true
        end
    end

    return false
end

function jobCompleted()
    TriggerEvent(
        "PRPCore:Notify",
        "Mohammed the Scrap Dealer: Job done! Come back to me and return the vehicle in order to get your deposit back.",
        "error",
        10000
    )
end

function giveReward()
    TriggerServerEvent("prp-recyclingcollections:server:GiveReward")
end

function createVehicle()
    deleteVehicle()

    local c
    for i, v in ipairs(_Config.vehicle.coords) do
        local existing = GetClosestVehicle(v.x, v.y, v.z, 3.500, 0, 70)
        if not DoesEntityExist(existing) then
            c = v
            goto continue
        end
    end

    ::continue::

    PRPCore.Functions.SpawnVehicle(_Config.vehicle.modelName, function(v)
        local numberPlate = string.format("RECY%s", tostring(math.random(1000, 9999)))
        _liveData.vehicle = v
        SetVehicleNumberPlateText(_liveData.vehicle, numberPlate)
        SetEntityHeading(_liveData.vehicle, c.h)
        exports.LegacyFuel:SetFuel(_liveData.vehicle, 100)
        SetEntityAsMissionEntity(_liveData.vehicle, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", numberPlate)
        modVehicle(_liveData.vehicle)
    end, c, true)

    _liveData.hasNewVehicle = true
end

function modVehicle(vehicle)
    SetVehicleModKit(vehicle, 0)

    SetVehicleMod(vehicle, 4, 1) -- Exhaust
    SetVehicleMod(vehicle, 5, 0) -- Frame (Chassis)
    SetVehicleMod(vehicle, 6, 0) -- Grille
    SetVehicleMod(vehicle, 7, 1) -- Hood
    -- SetVehicleMod(vehicle, 10, 2) -- Roof
    -- SetVehicleMod(vehicle, 11, 2) -- Engine
    SetVehicleMod(vehicle, 12, 2) -- Brakes
    -- SetVehicleMod(vehicle, 13, 2) -- Transmission
    -- SetVehicleMod(vehicle, 16, 4) -- Armo(u)r
    -- ToggleVehicleMod(vehicle, 18, 1) -- Turbo ... Keeping this disabled for now, it's a bit mental.

    SetVehicleModColor_1(vehicle, 4, 4, 0)
    SetVehicleModColor_2(vehicle, 4, 4)
    
    SetVehicleDirtLevel(vehicle)
    SetVehicleUndriveable(vehicle, false)
    WashDecalsFromVehicle(vehicle, 1.0)
end

function deleteVehicle()
    if DoesEntityExist(_liveData.vehicle) then
        SetVehicleHasBeenOwnedByPlayer(_liveData.vehicle, false)
        SetEntityAsNoLongerNeeded(_liveData.vehicle)
        DeleteEntity(_liveData.vehicle)
    end
end

function displayMarker(type, x, y, z, r, g, b, a, sX, sY, sZ)
    sX = sX or 1.0
    sY = sY or 1.0
    sZ = sZ or 1.0

    DrawMarker(type, x, y, z, 0, 0, 0, 0, 0, 0, sX, sY, sZ, r, g, b, a, false, false, 100, 0, 0, 0, 0)
end

function createBlip(x, y, z)
    deleteBlip()

    if _liveData.isOnJob then
        _liveData.blip = AddBlipForCoord(x, y, z)
        SetNewWaypoint(x, y)
    end

    SetBlipSprite(_liveData.blip, 527)
    SetBlipScale(_liveData.blip, 1.0)
    SetBlipAsShortRange(_liveData.blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Collect Scrap")
    EndTextCommandSetBlipName(_liveData.blip)
end

function deleteBlip()
    if DoesBlipExist(_liveData.blip) then
        RemoveBlip(_liveData.blip)
    end
    _liveData.isOnRoute = false
end

function DrawText3D(x, y, z, text, formatVars)
    formatVars = formatVars or nil
    if formatVars ~= nil then
        text = string.format(text, table.unpack(formatVars))
    end

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

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end