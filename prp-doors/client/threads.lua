PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

function canUse(playerData, restrictions)
    if restrictions == nil or (restrictions["jobs"] == nil and restrictions["items"] == nil) then
        return true
    end

    if restrictions["jobs"] ~= nil then
        for _, job in ipairs(restrictions.jobs) do
            if playerData["job"] ~= nil and playerData.job.name == job.name then
                if job["grade"] ~= nil and playerData.job.grade.level < job.grade then
                    return false
                end
                return true
            end
        end
    end

    if restrictions["items"] ~= nil then
        for _, authItem in ipairs(restrictions.items) do
            if playerData["items"] == nil then
                return false
            end
            for _, item in pairs(playerData.items) do
                if item.name == authItem then
                    return true
                end
            end
        end
    end

    return false
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)

    while true do
        Citizen.Wait(5)

        local inRangeOfDoor = false

        local ped           = GetPlayerPed(-1)
        local veh           = GetVehiclePedIsIn(ped)
        local playerData    = PRPCore.Functions.GetPlayerData()
        local pos           = GetEntityCoords(ped)

        for _, v in ipairs(_DoorsConfig.doors) do
            local canUse  = canUse(playerData, v["restrictions"] or nil)

            if not canUse then
                goto continue
            end

            local distLeft = GetDistanceBetweenCoords(pos, v.left.coords, true)
            local distRight = GetDistanceBetweenCoords(pos, v.right.coords, true)

            if distLeft < v.left.seeDist or distRight < v.right.seeDist then
                inRangeOfDoor = true

                if distLeft < v.left.seeDist then
                    if v.left["marker"] ~= nil then
                        addMarker(v.left.marker, v.left.coords.x, v.left.coords.y, v.left.coords.z)
                    end
                    if distLeft < v.left.useDist then
                        addText(v.left.coords.x, v.left.coords.y, v.left.coords.z, v.left.label)

                        if IsControlJustPressed(0, 38) then
                            if v.bringVehicle and DoesEntityExist(veh) then
                                moveEntity(veh, v.right.coords, v.right.heading)
                                SetVehicleOnGroundProperly(veh)
                            else
                                moveEntity(ped, v.right.coords, v.right.heading)
                            end

                            Citizen.Wait(50)
                        end
                    end
                end

                if distRight < v.right.seeDist then
                    if v.right["marker"] ~= nil then
                        addMarker(v.right.marker, v.right.coords.x, v.right.coords.y, v.right.coords.z)
                    end
                    if distRight < v.right.useDist then
                        addText(v.right.coords.x, v.right.coords.y, v.right.coords.z, v.right.label)

                        if IsControlJustPressed(0, 38) then
                            if v.bringVehicle and DoesEntityExist(veh) then
                                moveEntity(veh, v.left.coords, v.left.heading)
                                SetVehicleOnGroundProperly(veh)
                            else
                                moveEntity(ped, v.left.coords, v.left.heading)
                            end

                            Citizen.Wait(50)
                        end
                    end
                end

                if not canUse then
                    goto continue
                end
            end

            :: continue ::
        end

        if not inRangeOfDoor then
            Citizen.Wait(1000)
        end
    end
end)

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz       = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

function addMarker(id, x, y, z)
    DrawMarker(id, x, y, z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
end

function addText(x, y, z, text)
    DrawText3Ds(x, y, z + 0.5, "~g~E~w~ - " .. text)
end

function moveEntity(ent, destination, heading)
    SetEntityCoords(ent, destination.x, destination.y, destination.z)
    SetEntityHeading(ent, heading)
end
