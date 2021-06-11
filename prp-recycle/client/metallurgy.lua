Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local cfg            = Config.metallurgy
        local c              = cfg.door.coords
        local distFromMarker = #(GetEntityCoords(PlayerPedId(-1)) - vector3(c.x, c.y, c.z))

        if distFromMarker < cfg.door.seeDistance then
            displayMarker(42, c.x, c.y, c.z, 50, 255, 200, 200)
            if distFromMarker < cfg.door.useDistance then
                DrawText3D(c.x, c.y, c.z, ("~g~[E]~w~ %s"):format(cfg.door.label))
                if IsControlJustReleased(0, Config.keys["E"]) then
                    TriggerEvent("prp-recycle:client:metallurgy:BeginProcessing")
                end
            end
        end
    end
end)

RegisterNetEvent("prp-recycle:client:metallurgy:BeginProcessing")
AddEventHandler("prp-recycle:client:metallurgy:BeginProcessing", function(actionsCompleted)
    actionsCompleted = actionsCompleted or 0
    if actionsCompleted >= Config.metallurgy.swaps.maxActionsAtOnce then
        return
    end
    TriggerServerEvent("prp-recycle:server:metallurgy:ProcessMetallurgy", actionsCompleted)
end)

Citizen.CreateThread(function()
    local l   = Config.metallurgy.door.coords
    local blip = AddBlipForCoord(l.x, l.y, l.z)

    SetBlipSprite(blip, 467)
    SetBlipScale(blip, 0.55)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 3)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Metallurgy")
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("prp-recycle:client:metallurgy:ProcessMetallurgy")
AddEventHandler(
        "prp-recycle:client:metallurgy:ProcessMetallurgy",
        function(invSlot, doMore, actionsCompleted)
            local barTime = Config.metallurgy.swaps.timeSeconds * 1000
            TriggerEvent('animations:client:EmoteCommandStart', { "mechanic" })
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "Stash", 0.2)
            PRPCore.Functions.Progressbar("process_metallurgy", "Processing Metallurgy...", barTime, false, true, {
                disableMovement    = true,
                disableCarMovement = true,
                disableMouse       = false,
                disableCombat      = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', { "c" })
                TriggerServerEvent("prp-recycle:server:metallurgy:RewardItems", invSlot, doMore, actionsCompleted)
            end)
        end
)

