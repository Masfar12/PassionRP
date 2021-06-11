Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local c              = Config.sorting.sortLocation.coords
        local distFromMarker = #(GetEntityCoords(PlayerPedId(-1)) - vector3(c.x, c.y, c.z))

        if distFromMarker < Config.sorting.sortLocation.seeDistance then
            displayMarker(42, c.x, c.y, c.z, 50, 255, 200, 200)
            if distFromMarker < Config.sorting.sortLocation.useDistance then
                DrawText3D(c.x, c.y, c.z, ("~g~[E]~w~%s"):format(Config.sorting.sortLocation.label))
                if IsControlJustReleased(0, Config.keys["E"]) then
                    TriggerEvent("prp-recycle:client:sorting:BeginProcessing")
                end
            end
        end
    end
end)

RegisterNetEvent("prp-recycle:client:sorting:BeginProcessing")
AddEventHandler("prp-recycle:client:sorting:BeginProcessing", function()
    TriggerServerEvent("prp-recycle:server:sorting:ProcessScrap")
end)

Citizen.CreateThread(function()
    local sl   = Config.sorting.sortLocation
    local blip = AddBlipForCoord(sl.coords.x, sl.coords.y, sl.coords.z)

    SetBlipSprite(blip, 467)
    SetBlipScale(blip, 0.55)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 3)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Scrap Processing")
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("prp-recycle:client:sorting:ProcessScrap")
AddEventHandler("prp-recycle:client:sorting:ProcessScrap", function(count, invSlot, doMore)
    local barTime = Config.sorting.timePerItem * count
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    PRPCore.Functions.Progressbar("process_scrap", "Processing Scrap...", barTime, false, true, {
        disableMovement    = true,
        disableCarMovement = true,
        disableMouse       = false,
        disableCombat      = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("prp-recycle:server:sorting:GiveReward", count, invSlot, doMore)
    end)
end)

function displayMarker(type, x, y, z, r, g, b, a, sX, sY, sZ)
    sX = sX or 1.0
    sY = sY or 1.0
    sZ = sZ or 1.0

    DrawMarker(type, x, y, z, 0, 0, 0, 0, 0, 0, sX, sY, sZ, r, g, b, a, true, true, 100, true, 0, 0, 0)
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
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end