RegisterNetEvent('prp:spawnHostilePed')
AddEventHandler('prp:spawnHostilePed', function(model, x, y, z, h, id, weapon)
    spawnHostilePed(model, x, y, z, h, id, weapon)
end)

function spawnHostilePed(model, x, y, z, h, id, weapon)
    model = (tonumber(model))
    id = (tonumber(id))

    AddRelationshipGroup('HATES_ME')
    if x == nil or y == nil or z == nil or h == nil then   
        print("Not here")
    else
        Citizen.CreateThread(function()
            RequestModel(model)
    
            while not HasModelLoaded(model) do
                Citizen.Wait(1)
            end

            ped = CreatePed(30, model, tonumber(x), tonumber(y), tonumber(z), tonumber(h), true, false)
            SetPedArmour(ped, 200)
            SetPedAsEnemy(ped, true)
            GiveWeaponToPed(ped, GetHashKey(weapon), 250, false, true)
            TaskCombatPed(ped, PlayerPedId(id), 0, 16)
            SetPedRelationshipGroupHash(ped, 'HATES_ME')
        end)

    end
end

RegisterNetEvent('prp:addPedToEvent')
AddEventHandler('prp:addPedToEvent', function(eventId, pedModel, pedWeapon)
    local playerPed = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(playerPed) + GetEntityForwardVector(playerPed) * 1.0)
    local h = GetEntityHeading(playerPed)
    
    TriggerServerEvent('prp-spawnped:addPedToEvent', source, eventId, pedModel, pedWeapon, x, y, z, h)
end)

RegisterNetEvent('prp-spawnped:runPedEvent')
AddEventHandler('prp-spawnped:runPedEvent', function(peds, targetId)
    for _, ped in pairs(peds) do
        spawnHostilePed(
            ped['ped_model'],
            ped['x'],
            ped['y'],
            ped['z'],
            ped['h'],
            targetId,
            ped['ped_weapon']
        )
    end
end)

RegisterNetEvent('prp:spawnPed')
AddEventHandler('prp:spawnPed', function(model, x, y, z, h)
 
    model = (tonumber(model))

    if x == nil or y == nil or z == nil or h == nil then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local forward = GetEntityForwardVector(playerPed)
        local x, y, z = table.unpack(playerCoords + forward * 1.0)

        Citizen.CreateThread(function()
            RequestModel(model)
    
            while not HasModelLoaded(model) do
                Citizen.Wait(1)
            end
    
            CreatePed(5, model, x, y, z, 0.0, true, false)
        end)

    else
        
        Citizen.CreateThread(function()
            RequestModel(model)
    
            while not HasModelLoaded(model) do
                Citizen.Wait(1)
            end

            CreatePed(5, model, tonumber(x), tonumber(y), tonumber(z), tonumber(h), true, false)
        end)

    end
end)

RegisterNetEvent('prp:spawnobject')
AddEventHandler('prp:spawnobject', function(model)
    if type(model) == "string" then
        model = GetHashKey(model)
    end

    print(dump(model))
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local forward   = GetEntityForwardVector(playerPed)
	local x, y, z   = table.unpack(coords + forward * 1.0)

	SpawnObject(model, {
		x = x,
		y = y,
		z = z
	}, function(obj)
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
        print(obj)
	end)
end)

SpawnObject = function(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))

	Citizen.CreateThread(function()
		RequestModel(model)

		local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)

		if cb ~= nil then
			cb(obj)
		end
	end)
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

 