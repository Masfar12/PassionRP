PRPCore = nil

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)


------------
-- Events --
------------

RegisterNetEvent('prp-forage:client:cleartasks')
AddEventHandler('prp-forage:client:cleartasks', function()
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
end)

RegisterNetEvent('prp-forage:client:print')
AddEventHandler('prp-forage:client:print', function(item)
    print("Foraging: "..item)
end)


RegisterNetEvent('prp-forage:client:forage')
AddEventHandler('prp-forage:client:forage', function()

    local random = math.random(1,100)
    local hit = false

    if random < PRP.Forage["Chance"] then
        hit = true
    end

    TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
    PRPCore.Functions.Progressbar("forage", "Searching", math.random(5000, 15000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        -- Do stuff here
        if hit == true then
            TriggerServerEvent('prp-forage:getItem')
        else
            PRPCore.Functions.Notify("Nothing found..", "error")
        end
        ClearPedTasks(GetPlayerPed(-1))
    end, function()
        PRPCore.Functions.Notify("Forage Cancelled..", "error")
        ClearPedTasks(GetPlayerPed(-1))
    end)

end)

-------------------
-- Menu Creation --
-------------------
CreateMenuForage = function(hit)
    local data = {
        {
            texto = "Search",
            ctype = "cevent",
            cname = "prp-forage:client:forage",
            args = {id},
        }
    }

    return data
end


---------------
-- Functions --
---------------
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