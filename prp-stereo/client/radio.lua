PRPCore = nil

agarrando = false
radios = {}
local plyCoords
local sleep
local ply
local updateVehCoords = 0


Citizen.CreateThread(function()
    while PRPCore == nil do
        Citizen.Wait(500)
        TriggerEvent("PRPCore:GetObject", function(library)
            PRPCore = library
        end)
    end

    PRPCore.Functions.TriggerCallback('prp-stereo:getRadios', function(val)
        radios = val
    end)
end)

RegisterNetEvent('prp-stereo:sendRadios')
AddEventHandler('prp-stereo:sendRadios', function(data)
    -- print("data nueva")
    for c,v in pairs(radios) do
        if not data[c] then
            Destroy(c)
            if v.obj then
                DeleteObject(v.obj)
            end
        else
            data[c].obj = v.obj
            data[c].veh = v.veh
            if soundExists(c) then
                if data[c]["pause"] ~= v.pause then
                    if data[c]["pause"] == true then
                        Pause(c)
                    else
                        Resume(c)
                    end
                end
            end
        end
    end
    radios = data
end)

RegisterNetEvent('prp-stereo:playLink')
AddEventHandler('prp-stereo:playLink', function(id,link)
    PlayUrlPos(id, link, 1, radios[id].coords)
    Distance(id, 20)
end)

--openMenuRadio(c)

Citizen.CreateThread(function()
    while true do
        sleep = 1000
        ply = PlayerPedId()
        plyCoords = GetEntityCoords(ply)
        for c,v in pairs(radios) do
            if v.tipo == "veh" then
                LoopVeh(c,v)
            elseif v.tipo == "stereo" then
                LoopStereo(c,v)
            end
        end
        Citizen.Wait(sleep)
    end
end)

LoopStereo = function(c,v)
    if not v.pause then
        local distance = #(plyCoords - v.coords)
        if distance > 30.0 then
            if soundExists(c) then
                if getVolume(c) == v.volumen then
                    setVolumeMax(c,0.0)
                end
            end
        else 
            sleep = 25
            local lowpass = false
            local nextVol = v.volumen
            if (v.obj == false or not DoesEntityExist(v.obj)) and not v.agarrado then
                if not v.agarrado then
                    v.obj = CreateStereo(v.coords)
                    SetEntityHeading(stereo, v.heading)
                end
            elseif v.agarrado and v.obj then
                DeleteObject(v.obj)
                v.obj = false
            end

            if soundExists(c) then     
                local entity = v.agarrado and GetPlayerPed(GetPlayerFromServerId(tonumber(v.agarrado))) or v.obj     
                if entity ~= 0 then
                    local int = GetInteriorFromEntity(entity)
                    local plyint = GetInteriorFromEntity(ply)

                    if int ~= plyint then
                        nextVol = nextVol / 1.5
                        lowpass = true
                    end
                    
                    if not HasEntityClearLosToEntity(entity,ply,17) and entity ~= ply then
                        nextVol = nextVol / 1.5
                        lowpass = true
                    end
                else
                    nextVol = 0.0
                end

                if getVolume(c) ~= nextVol then
                    setVolumeMax(c,nextVol)
                end

                if getLowpass(c) ~= lowpass then
                    setLowpass(c,lowpass)
                end
                
                Position(c,v.coords)
            end
        end
    end
    Wait(1)
end

LoopVeh = function(c,v)
    --plyCoords = GetEntityCoords(ply)
    local distance = #(plyCoords - v.coords)
    if distance > 40.0 then
        if soundExists(c) then
            if getVolume(c) == v.volumen then
                setVolumeMax(c,0.0)
            end
        end
    else 
        sleep = 25

        local vehexist = false

        if DoesEntityExist(v.veh) then
            vehexist = true
            if GetPedInVehicleSeat(v.veh, -1) == ply then
                if updateVehCoords == 2 then
                    updateVehCoords = 0
                    local vehcoords = GetEntityCoords(v.veh)
                    if vehcoords ~= v.coords then
                        TriggerServerEvent('prp-stereo:updateCoords',c,vehcoords)
                    end
                else
                    updateVehCoords = updateVehCoords + 1
                end
            end
        else    
            v.veh = NetworkGetEntityFromNetworkId(v.netid)
            sleep = sleep < 500 and sleep or 500
        end   

        if soundExists(c) then
            local nextVol = v.volumen / 2
            local lowpass = true
            local doorsopen = false

            if vehexist then
                for i=1, 7 do
                    i = i -1
                    if GetVehicleDoorAngleRatio(v.veh,tonumber(i)) > 0.0 then
                        nextVol = v.volumen / 1.1
                        lowpass = false
                        doorsopen = true
                        break
                    end
                end
                if IsPedInAnyVehicle(ply,true) then
                    if IsPedInVehicle(ply, v.veh, true) then
                        nextVol = v.volumen
                        lowpass = false
                    else
                        lowpass = true
                        nextVol = v.volumen / 2
                        local vehact = GetVehiclePedIsIn(ply,true)
                        for i=1, 7 do
                            i = i -1
                            if GetVehicleDoorAngleRatio(vehact,tonumber(i)) > 0.0 then
                                nextVol = v.volumen / 1.7
                                if doorsopen then
                                    lowpass = false
                                end
                                break
                            end
                        end
                    end
                end
            end

            if getVolume(c) ~= nextVol then
                setVolumeMax(c,nextVol)
            end

            if getLowpass(c) ~= lowpass then
                setLowpass(c,lowpass)
            end

            Position(c,v.coords)
        end            
    end
    Wait(1)
end

RegisterNetEvent('prp-stereo:useStereo')
AddEventHandler('prp-stereo:useStereo', function()
    local ply = PlayerPedId()
    local plyCoords, forward = GetEntityCoords(ply), GetEntityForwardVector(ply)
    local spawnCoord = (plyCoords + forward * 1.0)

    PlayAnim("anim@heists@narcotics@trash","pickup")
    SetTimeout(700, function()
        ClearPedTasks(ply)
        --local stereo = CreateStereo(spawnCoord)
        --SetEntityHeading(stereo, GetEntityHeading(ply))
        TriggerServerEvent('prp-stereo:newStereo',"ddd",spawnCoord,GetEntityHeading(ply))
    end)
end)

RegisterNetEvent('prp-stereo:guardar')
AddEventHandler('prp-stereo:guardar', function(id)
    PlayAnim("anim@heists@narcotics@trash","pickup")
    SetTimeout(700, function()
        ClearPedTasks(ply)
        TriggerServerEvent('prp-stereo:saveStereo',id)
    end)
end)

RegisterNetEvent('prp-stereo:agarrar')
AddEventHandler('prp-stereo:agarrar', function(id)
    local stereo = radios[id]
    PlayAnim("anim@heists@narcotics@trash","pickup")
    SetTimeout(700, function()
        ClearPedTasks(ply)
        DeleteObject(stereo.obj)
        local obj = CreateStereo(plyCoords,true)
        while not HasAnimDictLoaded("missheistdocksprep1hold_cellphone") do
            RequestAnimDict("missheistdocksprep1hold_cellphone")
            Citizen.Wait(100)
        end
        AttachEntityToEntity(obj, ply, GetPedBoneIndex(ply, 57005), 0.30, 0, 0, 0, 260.0, 60.0, true, true, false, true, 1, true)
        TaskPlayAnim(ply, 1.0, -1, -1, 50, 0, 0, 0, 0) 
        TaskPlayAnim(ply, "missheistdocksprep1hold_cellphone", "hold_cellphone", 1.0, -1, -1, 50, 0, 0, 0, 0)
        
        agarrando = {id=id,obj=obj}
        TriggerServerEvent("prp-stereo:agarrado", agarrando.id, GetPlayerServerId(PlayerId()))
    end)
end)

RegisterNetEvent('prp-stereo:dejarStereo')
AddEventHandler('prp-stereo:dejarStereo', function()
    PlayAnim("anim@heists@narcotics@trash","pickup")
    SetTimeout(700, function()
        ClearPedTasks(ply)
        DetachEntity(agarrando.obj)
        DeleteObject(agarrando.obj)
        local plyCoords, forward = GetEntityCoords(ply), GetEntityForwardVector(ply)
        local spawnCoord = (plyCoords + forward * 1.0)
        TriggerServerEvent("prp-stereo:updateCoords", agarrando.id, spawnCoord,GetEntityHeading(ply))
        TriggerServerEvent("prp-stereo:agarrado", agarrando.id, false)
        agarrando = false
    end)
end)

Citizen.CreateThread(function()
	local tickCount = 0
	while true do
		local wait = 1000
        if agarrando then
            wait = 5
			local coords = GetEntityCoords(PlayerPedId(), false)
			DisablePlayerFiring(PlayerId(), true)
            DisableControlAction(0,25,true) -- disable aim
            DisableControlAction(0,23,true) -- enter car
			DisableControlAction(0,44,true) -- INPUT_COVER
			DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
            SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
			if tickCount > 10 then
				tickCount = 0
				TriggerServerEvent("prp-stereo:updateCoords", agarrando.id, coords)
			end
			tickCount = tickCount + 1
        end
        Citizen.Wait(wait)
	end
end)

RegisterNetEvent('prp-stereo:openMenu')
AddEventHandler('prp-stereo:openMenu', function(veh)
    PRPCore.Functions.TriggerCallback('PRPCore:HasItem', function(result)
        if result then
            Citizen.Wait(500)
            local veh = veh or GetVehiclePedIsIn(PlayerPedId(), false)
            local id = GetVehicleNumberPlateText(veh)
            openMenuRadio(id,veh)

        else
            PRPCore.Functions.Notify("You dont have a stereo!","error")
        end
    end,"stereo")
end)

openMenuRadio = function(id,veh)
    local data = {}

    if radios[id] then
        data[#data+1] = {
            texto = "Play Song",
            ctype = "cevent",
            cname = "prp-stereo:client:PonerCancion",
            args = {id},
        }
    else
        data[#data+1] = {
            texto = "Turn On",
            ctype = "cevent",
            cname = "prp-stereo:client:EncenderVeh",
            args = {id,veh,NetworkGetNetworkIdFromEntity(veh),GetEntityCoords(veh)},
        }
    end

    if soundExists(id) then     
        data[#data+1] = {
            texto = "Volume",
            ctype = "cevent",
            cname = "prp-stereo:client:Volumen",
            args = {id},
        }

        if radios[id]["pause"] then
            data[#data+1] = {
                texto = "Play",
                ctype = "sevent",
                cname = "prp-stereo:play",
                args = {id},
            }
        else
            data[#data+1] = {
                texto = "Pause",
                ctype = "sevent",
                cname = "prp-stereo:pause",
                args = {id},
            }
        end
        data[#data+1] = {
            texto = "Turn Off",
            ctype = "sevent",
            cname = "prp-stereo:apagar",
            args = {id},
        }
    end

    exports["interaction"]:OpenMenu(GetEntityCoords(veh),data)
end

RegisterNetEvent('prp-stereo:client:EncenderVeh')
AddEventHandler('prp-stereo:client:EncenderVeh', function(id,veh,netid,coords)
    TriggerServerEvent('prp-stereo:nuevaRadio',id,veh,netid,coords)
    Citizen.Wait(300)
    openMenuRadio(id,veh)
end)


RegisterNetEvent('prp-stereo:client:PonerCancion')
AddEventHandler('prp-stereo:client:PonerCancion', function(id)
    local data = {
        {
            id = 0,
            type = "input",
            title = "Insert youtube link"
        }
    }
    exports["interaction"]:OpenInput(data,function(val)
        TriggerServerEvent('prp-stereo:ponerLink',id,val[0])
    end)
end)

RegisterNetEvent('prp-stereo:client:Volumen')
AddEventHandler('prp-stereo:client:Volumen', function(id)
    local data = {
        {
            id = 0,
            type = "input",
            title = "Input volume, 1-10."
        }
    }
    exports["interaction"]:OpenInput(data,function(val)
        local volume = tonumber(val[0])
        if volume == 0 then
            TriggerServerEvent('prp-stereo:cambiarVolumen',id,0.0)
        else
            if volume > 0 and volume < 11 then
                volume = volume / 10 + 0.0
                TriggerServerEvent('prp-stereo:cambiarVolumen',id,volume)
            else
                PRPCore.Functions.Notify("The volume should be 1 to 10","error")
            end
        end
    end)
end)
