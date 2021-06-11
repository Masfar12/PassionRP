globalOptionsCache = {}

function getDefaultInfo()
    return {
        volume = 1.0,
        url = "",
        id = "",
        position = nil,
        distance = 0,
        playing = false,
        paused = false,
        loop = false,
        isDynamic = false,
        timeStamp = 0,
        maxDuration = 0,
    }
end

Citizen.CreateThread(function()
    local refresh = config.RefreshTime
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    while true do
        Citizen.Wait(refresh)
        ped = PlayerPedId()
        pos = GetEntityCoords(ped)
        SendNUIMessage({
            status = "position",
            x = pos.x,
            y = pos.y,
            z = pos.z
        })
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1100)
    while true do
        for k, v in pairs(soundInfo) do
            if v.playing then
                if getInfo(v.id).timeStamp ~= nil and getInfo(v.id).maxDuration ~= nil then
                    if getInfo(v.id).timeStamp < getInfo(v.id).maxDuration then
                        getInfo(v.id).timeStamp = getInfo(v.id).timeStamp + 1
                    end
                end
            end
        end
        Citizen.Wait(1000)
    end
end)

RegisterCommand("play", function(source, args, rawCommand)

    local s = mysplit(rawCommand, ' ')
    local url = s[2]
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local closestStereo = GetClosestStero()
    local closestStereoCoords = GetEntityCoords(closestStereo)
    local dist = GetDistanceBetweenCoords(pos, closestStereoCoords.x, closestStereoCoords.y, closestStereoCoords.z, true)

    if dist < 1.0 then
        -- need to generate a unique ID, and then pass in the unique ID into /play. So use the stereo, sets it down, generates a unique short number.. then /play ID URL.
        -- Then adjust everything here. Return the object etc, and then pass into the appropriate event.
        TriggerEvent('prp-stereo:playLink', "ddd", url)
    end

end)

function GetClosestStero()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 10.0, 1729911864, false, false, false)
    return ClosestObject
end

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

 function mysplit (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end