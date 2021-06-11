function getRandomUCChars(count)
    local A, Z = 65, 90

    local out  = {}

    for i = 1, count do
        table.insert(out, string.char(math.random(A, Z)))
    end

    return out
end

function upgradeCar(veh, modData)
    -- Fix and clean the car first
    SetVehicleDirtLevel(veh)
    SetVehicleUndriveable(veh, false)
    WashDecalsFromVehicle(veh, 1.0)
    SetVehicleFixed(veh)
    SetVehicleEngineOn(veh, true, false)

    SetVehicleModKit(veh, 0)

    for index, value in pairs(modData.mods) do
        index         = tonumber(index)
        local modInfo = findModByIndex(index)

        if modInfo["toggle"] ~= nil and modInfo.toggle then
            ToggleVehicleMod(veh, index, (value == 1 and true or false))
        elseif modInfo["isWheel"] ~= nil and modInfo.isWheel then
            SetVehicleMod(veh, index, tonumber(value.mod), tonumber(value.variation))
        else
            SetVehicleMod(veh, index, value)
        end
    end

    SetVehicleWheelType(veh, modData.wheelType)
    SetVehicleWindowTint(veh, modData.windowTint)
    SetVehicleColours(veh, modData.colours.primary, modData.colours.secondary)
    SetVehicleExtraColours(veh, modData.colours.pearlescent, modData.colours.wheels)

    local c = modData.smokeColour
    SetVehicleTyreSmokeColor(veh, c.r, c.g, c.b)

    SetVehicleLivery(veh, modData.livery)
end

function findModByIndex(index)
    for _, v in pairs(PRP_SVMod_Config.mods) do
        if v.index == index then
            return v
        end
    end

    return -1
end