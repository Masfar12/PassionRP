PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)


---------------------
-- Citizen Threads --
---------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local cpu = Temple.TempleComputer
        if (GetDistanceBetweenCoords(pos, cpu.x, cpu.y, cpu.z, true) < 2.0) then
            if Council() then
                if IsControlJustReleased(0, 38) then
                    openComputer(true)
                end
            end
        end
    end
end)



-------------------
-- NUI Callbacks --
-------------------

RegisterNUICallback('exit', function()
    openComputer(false)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('orderPart', function(data)
    TriggerServerEvent("prp-temple:server:orderPart", data.part, data.price, data.amount)
end)

RegisterNUICallback('orderSet', function(data)
    TriggerServerEvent("prp-temple:server:orderSet", data.set, data.price)
end)

RegisterNUICallback('getAllParts', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-temple:server:GetComputerFormat', function(result)
        if result ~= nil then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

RegisterNUICallback('getAllOrders', function(data, cb)
    cb(Temple.TempleParts)
end)

RegisterNUICallback('getAllStore', function(data, cb)
    cb(Temple.TempleStorePage)
end)


---------------
-- Functions --
---------------
function openComputer(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "computer",
        toggle = bool
    })
end

function Council()
    local PlayerData = PRPCore.Functions.GetPlayerData()
    local id = PlayerData.citizenid
    local retval = false
    for _, v in pairs(Temple.TempleCouncil) do
        if v == id then
            retval = true
            break
        end
    end
    return retval
end