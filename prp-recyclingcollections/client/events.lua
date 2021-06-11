RegisterNetEvent("prp-recyclingcollections:client:CollectScrap")
AddEventHandler("prp-recyclingcollections:client:CollectScrap", function()
    if _liveData.isOnRoute then return end

    local nextLocation, isEndLocation = getNextLocation(_liveData.currentRegionIndex)

    createBlip(nextLocation.x, nextLocation.y, nextLocation.z)
    
    _liveData.isOnRoute = true

    if not isEndLocation then
        while _liveData.isOnRoute do
            Citizen.Wait(1)

            local playerCoords = GetEntityCoords(PlayerPedId())
            local vehicleCoords = GetEntityCoords(_liveData.vehicle)
            
            local distanceFromBlip = #(playerCoords - vector3(nextLocation.x, nextLocation.y, nextLocation.z))
            local distanceFromVehicle = #(playerCoords - vehicleCoords)

            if distanceFromBlip < 5 and distanceFromVehicle < 10 then
                DrawText3D(nextLocation.x, nextLocation.y, nextLocation.z, keyToPressString("E", "Collect the scrap"))

                if IsControlJustReleased(0, _Config.keys.E) then
                    PRPCore.Functions.Progressbar("collect_scrap", "Collecting scrap...", 10000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- On completion
                        ClearPedTasks(GetPlayerPed(-1))
                        giveReward()
                        deleteBlip()
                    end)
                end
            end
        end
    else
        jobCompleted()
    end
end)


RegisterNetEvent("prp-recyclingcollections:client:BeginContract")
AddEventHandler("prp-recyclingcollections:client:BeginContract", function()
    TriggerEvent(
        "chatMessage",
        "Mohammed the Scrap Dealer",
        "normal",
        "Hop in that truck over there, I'll stick some locations on your GPS. Go and grab the scrap, keep whatever is leftover!"
    )

    _liveData.isOnJob = true
    _liveData.hasNewVehicle = true
    createVehicle()
    Citizen.Wait(5000)
end)

RegisterNetEvent("prp-recyclingcollections:client:EndContract")
AddEventHandler("prp-recyclingcollections:client:EndContract", function()
    TriggerEvent(
        "chatMessage",
        "Mohammed the Scrap Dealer",
        "normal",
        "Pleasure doing business with you. Here's your deposit back."
    )

    deleteVehicle()
    
    _liveData.isOnJob = false
    _liveData.isOnRoute = false

    deleteBlip()
    Citizen.Wait(5000)
end)