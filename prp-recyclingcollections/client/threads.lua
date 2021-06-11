Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if _liveData.isOnJob then
            local endCoords = _Config.endLocation.coords
            local distanceFromEnd = #(GetEntityCoords(PlayerPedId()) - vector3(endCoords.x, endCoords.y, endCoords.z))

            if distanceFromEnd < _Config.endLocation.visibilityDistance then
                displayMarker(25, endCoords.x, endCoords.y, endCoords.z, 255, 100, 100, 180)
                if distanceFromEnd < _Config.endLocation.useDistance then
                    DrawText3D(endCoords.x, endCoords.y, endCoords.z, keyToPressString("E", _Config.endLocation.label))
                    if IsControlJustReleased(0, _Config.keys.E) then
                        if DoesEntityExist(_liveData.vehicle) and GetVehiclePedIsIn(PlayerPedId()) == _liveData.vehicle then
                            TriggerServerEvent("prp-recyclingcollections:server:EndContract")
                            _liveData.isOnJob = false
                            _liveData.isOnRoute = false
                            refreshLocations()
                        end
                        Citizen.Wait(1000)
                    end
                end
            end
        else
            local c = _Config.startLocation.coords
            local distanceFromStart = #(GetEntityCoords(PlayerPedId()) - vector3(c.x, c.y, c.z))
            
            if distanceFromStart < _Config.startLocation.visibilityDistance then
                displayMarker(25, c.x, c.y, c.z, 100, 255, 100, 150)
                if distanceFromStart < _Config.startLocation.useDistance then
                    DrawText3D(c.x, c.y, c.z, keyToPressString("E", _Config.startLocation.label))
                    if IsControlJustReleased(0, _Config.keys.E) then
                        refreshLocations()
                        TriggerServerEvent("prp-recyclingcollections:server:BeginContract")
                        Citizen.Wait(1000)
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if not _liveData.hasNewVehicle or _liveData.vehicle == nil then
            Citizen.Wait(1000)
        else
            Citizen.Wait(1)
            local vc = GetEntityCoords(_liveData.vehicle)
            DrawText3Ds(vc.x, vc.y, vc.z, "Mohammed's Ratloader")
            if #(GetEntityCoords(PlayerPedId(-1)) - vector3(vc.x, vc.y, vc.z)) < 5 then
                _liveData.hasNewVehicle = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if _liveData.isOnJob then
            Citizen.Wait(500)
            if not DoesEntityExist(_liveData.vehicle) then
                _liveData.isOnJob = false
                _liveData.isOnRoute = false
                TriggerEvent("chatMessage", "Mohammed the Scrap Dealer", "error", "Your vehicle is gone!")
            else
                if _liveData.isOnRoute then
                    Citizen.Wait(5000)
                else
                    TriggerEvent("prp-recyclingcollections:client:CollectScrap")
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)