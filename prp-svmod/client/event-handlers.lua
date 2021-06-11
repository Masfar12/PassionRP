PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent("prp-svmod:client:FullyUpgradeCar")
AddEventHandler("prp-svmod:client:FullyUpgradeCar", function()
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped)

    SetVehicleModKit(veh, 0)

    local m    = PRP_SVMod_Config.mods
    local mods = {
        m.brakes,
        m.engine,
        m.transmission,
        m.turbo,
    }

    for _, v in ipairs(mods) do
        local max = GetNumVehicleMods(veh, v.index)
        if v["toggle"] ~= nil and v.toggle then
            ToggleVehicleMod(veh, v.index, true)
        else
            local setTo = max - 1
            if v["reduce"] ~= nil then
                setTo = setTo - v.reduce
            end
            SetVehicleMod(veh, v.index, setTo)
        end
    end
end)

RegisterNetEvent("prp-svmod:client:TouchEngine")
AddEventHandler("prp-svmod:client:TouchEngine", function()
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped)

    SetVehicleModKit(veh, 0)

    local engine = GetVehicleMod(veh, PRP_SVMod_Config.mods.engine.index)
    SetVehicleMod(veh, PRP_SVMod_Config.mods.engine.index, engine)
end)

RegisterNetEvent("prp-svmod:client:SaveCar")
AddEventHandler("prp-svmod:client:SaveCar", function(name)
    local veh     = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local model   = GetEntityModel(veh)

    local current = {
        mods        = {},
        colours     = {},
        livery      = -1,
        smokeColour = {},
        wheelType   = -1,
        windowTint  = -1,
    }

    for _, m in pairs(PRP_SVMod_Config.mods) do
        if m["isWheel"] ~= nil and m.isWheel then
            local mod             = GetVehicleMod(veh, m.index)
            local variation       = GetVehicleModVariation(veh, m.index)
            current.mods[m.index] = { mod = mod, variation = variation }
        else
            current.mods[m.index] = GetVehicleMod(veh, m.index)
        end
    end

    local primary, secondary       = GetVehicleColours(veh)
    local pearlescent, wheelColour = GetVehicleExtraColours(veh)
    current.colours                = {
        primary     = primary,
        secondary   = secondary,
        pearlescent = pearlescent,
        wheels      = wheelColour,
    }

    current.livery                 = GetVehicleLivery(veh)

    local sr, sg, sb               = GetVehicleTyreSmokeColor(veh)
    current.smokeColour            = { r = sr, g = sg, b = sb }

    current.wheelType              = GetVehicleWheelType(veh)

    current.windowTint             = GetVehicleWindowTint(veh)

    TriggerServerEvent("prp-svmod:server:SaveCar", name, model, current)
end)

RegisterNetEvent("prp-svmod:client:LoadCar")
AddEventHandler("prp-svmod:client:LoadCar", function(name)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped)

    if veh ~= 0 then
        PRPCore.Functions.Notify("You can't use this command whilst in a vehicle already.")
        return
    end

    TriggerServerEvent("prp-svmod:server:LoadCar", name)
end)

RegisterNetEvent("prp-svmod:client:SpawnInCar")
AddEventHandler("prp-svmod:client:SpawnInCar", function(vehModel, modData)
    local ped = GetPlayerPed(-1)
    local c   = GetEntityCoords(ped)
    local h   = GetEntityHeading(ped)

    vehModel  = tonumber(vehModel)
    RequestModel(vehModel)
    while not HasModelLoaded(vehModel) do
        Citizen.Wait(0)
    end
    local veh = CreateVehicle(vehModel, c.x, c.y, c.z, false, false)
    SetEntityHeading(veh, h)
    TaskWarpPedIntoVehicle(ped, veh, -1)
    exports.LegacyFuel:SetFuel(veh, 100)

    Citizen.Wait(200)

    local fst, lst = getRandomUCChars(3), math.random(10, 99)
    local plate    = ("%sSVM%s"):format(table.concat(fst, ""), lst)
    SetVehicleNumberPlateText(veh, plate)
    TriggerEvent("vehiclekeys:client:SetOwner", plate)

    --TriggerEvent('iens:repaira')

    upgradeCar(veh, modData)
end)
