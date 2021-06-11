

PlayAnim = function(lib,anim)
    while not HasAnimDictLoaded(lib) do
        RequestAnimDict(lib)
        Citizen.Wait(10)
    end
    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
end

GenerateID = function()
    local id
    repeat
        id = math.random(1111111,9999999)
    until radios[id] == nil
    return id
end

AgarrandoStereo = function()
    return agarrando
end

GetIDfromObj = function(obj)
    local val = false
    for c,v in pairs(radios) do
        if v.obj and v.obj == obj then
            val = c
            break
        end
    end
    return val
end

CreateMenuStereo = function(hit)
    local id = GetIDfromObj(hit)

    if id and radios[id] then
        local data = {
            {
                texto = "Play Song",
                ctype = "cevent",
                cname = "prp-stereo:client:PonerCancion",
                args = {id},
            }
        }
    
        if soundExists(id) then     
            data[#data+1] = {
                texto = "Volume Control",
                ctype = "cevent",
                cname = "prp-stereo:client:Volumen",
                args = {id},
            }
    
            if radios[id]["pause"] then
                data[#data+1] = {
                    texto = "Resume Song",
                    ctype = "sevent",
                    cname = "prp-stereo:play",
                    args = {id},
                }
            else
                data[#data+1] = {
                    texto = "Pause Song",
                    ctype = "sevent",
                    cname = "prp-stereo:pause",
                    args = {id},
                }
            end
        end

        -- data[#data+1] = {
        --     texto = "Grab Stereo",
        --     ctype = "cevent",
        --     cname = "prp-stereo:agarrar",
        --     args = {id},
        -- }

        data[#data+1] = {
            texto = "Retrieve Boombox",
            ctype = "cevent",
            cname = "prp-stereo:guardar",
            args = {id},
        }
        
        return data
    else
        return false
    end
end

CreateStereo = function(coords,networked)
    local stereo = CreateObject(1729911864, coords,networked or false, true, true)
    FreezeEntityPosition(stereo, true)
    SetEntityAsMissionEntity(stereo)
    --SetEntityCollision(stereo, false, true)
    PlaceObjectOnGroundProperly(stereo)
    return stereo
end

