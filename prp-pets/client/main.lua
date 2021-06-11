PRPCore = nil
LogIn = false
local TempPet = false

Citizen.CreateThread(function()
    while PRPCore == nil do
        TriggerEvent('PRPCore:GetObject', function(obj)
            PRPCore = obj
        end)
        Citizen.Wait(500)
    end

    for c,v in pairs(Config.tienda.animales) do
        DoRequestModel(v.model)
    end

    LogIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    --myJob = PRPCore.Functions.GetPlayerData().job
    LogIn = true
end)

Citizen.CreateThread(function()

    local blip = AddBlipForCoord(Config.tienda.coords)

	SetBlipSprite (blip, 463)
    SetBlipDisplay(blip, 4)
    SetBlipColour(blip, 10)
	SetBlipScale  (blip, 1.0)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Pet Store')
	EndTextCommandSetBlipName(blip)

    while true do
        local s = 2000
        if LogIn and PRPCore then
            s = 1000
            plypos = GetEntityCoords(PlayerPedId())
            local dtienda = #(Config.tienda.coords - plypos)
            if dtienda < 5.0 then
                s = 5
                DrawMarker(2, Config.tienda.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 55, 22, 222, false, false, false, 1, false, false, false)
                if dtienda < 2.0 then
                    PRPCore.Functions.DrawText3D(Config.tienda.coords.x, Config.tienda.coords.y, Config.tienda.coords.z, "~g~E~w~ - Purchase")
                    if IsControlJustReleased(0, 38) then
                        local datos = {}
                        local listaAnimales = {}
                        for c,v in pairs(Config.tienda.animales) do
                            listaAnimales[#listaAnimales+1] = {
                                texto = v.nombre.. " $"..v.price,
                                ctype = 'sevent',
                                cname = 'prp-pets:server:ComprarAnimal',
                                args = {v.nombre,v.model,v.price},
                            }
                        end
                        datos[#datos+1] = {
                            texto = "Purchase Pet",
                            menu = listaAnimales,
                        }
                        -- datos[#datos+1] = {
                        --     texto = "Comida para animales",
                        --     ctype = 'cevent',
                        --     cname = 'prp-pets:client:Comida',
                        --     args = {},
                        -- }
                        local pdata = PRPCore.Functions.GetPlayerData()
                        if pdata.metadata and pdata.metadata["pet"] ~= false then
                            datos[#datos+1] = {
                                texto = "My Pet",
                                menu = {
                                    {
                                        texto = "Give up pet for Adoption",
                                        ctype = 'cevent',
                                        cname = 'prp-pets:client:Adopcion',
                                        args = {},
                                    },
                                    {
                                        texto = "Heal Pet for $100",
                                        ctype = 'cevent',
                                        cname = 'prp-pets:client:Curar',
                                        args = {},
                                    },
                                },
                            }
                        end
                        exports["interaction"]:OpenMenu(Config.tienda.coords,datos)
                    end
                end
            end
        end
        Citizen.Wait(s)
    end
end)

RegisterNetEvent('prp-pets:client:DarNombre')
AddEventHandler('prp-pets:client:DarNombre',function()
    local pdata = PRPCore.Functions.GetPlayerData()
    if pdata.metadata and pdata.metadata["pet"] ~= false then
        exports["interaction"]:OpenInput({
            {
                id = 0,
                type = "input",
                title = "How do you want to name your pet?"
            },
    }, function(resp)
        if resp and resp[0] then
            local pet = pdata.metadata["pet"]
            pet.nombre = resp[0]
            TriggerServerEvent('prp-pets:server:ActualizarPet', pet)
        else
            TriggerEvent('prp-pets:client:DarNombre')
        end
    end)
    end
end)

RegisterNetEvent('prp-pets:client:Adopcion')
AddEventHandler('prp-pets:client:Adopcion',function()
    local pdata = PRPCore.Functions.GetPlayerData()
    if pdata.metadata and pdata.metadata["pet"] ~= false then
        if TempPet ~= false then
            DeleteEntity(TempPet.ped)
            DeletePed(TempPet.ped)
            TempPet = false
        end
        TriggerServerEvent('prp-pets:server:Adopcion')
    end
end)

RegisterNetEvent('prp-pets:client:Curar')
AddEventHandler('prp-pets:client:Curar',function()
    local pdata = PRPCore.Functions.GetPlayerData()
    if pdata.metadata and pdata.metadata["pet"] ~= false then
        local pet = pdata.metadata["pet"]
        pet.hp = 200
        pet.comida = pet.comida > 50 and pet.comida or 50
        pet.agua = pet.agua > 50 and pet.agua or 50
        pet.vivo = true
        TriggerServerEvent('prp-pets:server:ActualizarPet', pet,true)
    end
end)

RegisterNetEvent('prp-pets:client:LlamarMascota')
AddEventHandler('prp-pets:client:LlamarMascota',function(noalert)
    local pdata = PRPCore.Functions.GetPlayerData()
    if pdata.metadata and pdata.metadata["pet"] ~= false then
        local pet = pdata.metadata["pet"]
        if TempPet ~= false then
            DeleteEntity(TempPet.ped)
            DeletePed(TempPet.ped)
            TriggerServerEvent('prp-pets:server:ActualizarPet', TempPet)
            if not noalert then
                PRPCore.Functions.Notify('You sent '..TempPet.nombre.." to your home! 🐶",'primary',6000)
            end
            TempPet = false
            return
        end
        if pet.vivo then
           LlamarMascota(pet)
        else
            PRPCore.Functions.Notify('You dont have a pet, go get one at the store! 🐶','primary',6000)
        end
    end
end)

RegisterNetEvent('prp-pets:client:Quieto')
AddEventHandler('prp-pets:client:Quieto',function()
    if TempPet ~= false and TempPet.vivo then
        if TempPet.quieto then
            PRPCore.Functions.Notify(''..TempPet.nombre..' is following you 🐶','primary')
        else
            PRPCore.Functions.Notify(''..TempPet.nombre..' is waiting for your next command 🐶','primary')
        end
        CambiarQuieto()
    end
end)

LlamarMascota = function(pet)
    Citizen.CreateThread(function()
        local plyped = PlayerPedId()
        DoRequestAnimSet('rcmnigel1c')
        TaskPlayAnim(plyped, 'rcmnigel1c', 'hailing_whistle_waive_a' ,8.0, -8, -1, 120, 0, false, false, false)
        Citizen.SetTimeout(5000, function()
            local LastPosition = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 2.0, 0.0)
            local GroupHandle = GetPlayerGroup(PlayerId())
            --PRPCore.Functions.TriggerCallback('PRPCore:CreatePed', function(netid)
                ped =  CreatePed(GetPedType(pet.model), pet.model, LastPosition.x , LastPosition.y , LastPosition.z, GetEntityHeading(GetPlayerPed(PlayerId())), 1, 0)

                SetBlockingOfNonTemporaryEvents(ped, true)
                SetPedAllowVehiclesOverride(ped, 1)
                
                SetPedCanPlayAmbientAnims(ped,0)
                SetPedCanPlayAmbientBaseAnims(ped,0)
                SetPedFleeAttributes(ped, 0, 0)
                N_0x2208438012482a1a(ped,0,0)
                
                SetPedCanBeTargetted(ped, false)
                SetEntityAsMissionEntity(ped, false,true)

                TempPet = {
                    id = NetworkGetNetworkIdFromEntity(ped),
                    ped = ped,
                    nombre = pet.nombre,
                    model = pet.model,
                    comida = pet.comida,
                    hp = pet.hp,
                    agua = pet.agua,
                    quieto = false,
                    vivo = pet.vivo,
                    hud = false,
                }
                SetEntityHealth(TempPet.ped, pet.hp)
                Citizen.Wait(5); CambiarQuieto(); Citizen.Wait(5); CambiarQuieto()

                local netid = NetworkGetNetworkIdFromEntity(ped)
                Citizen.Wait(200)
                Citizen.Trace(netid)
                SetNetworkIdCanMigrate(netid, false)

                LoopMascota()
                LoopComida()
                --func_100(ped)
                
            --end,28, pet.model, LastPosition.x +1, LastPosition.y +1, LastPosition.z -1, 1, 1)
        end)
    end)
end

function func_100(ped)
   -- print(GetPlayerGroup(PlayerId()),IsPedInGroup(ped))
    local group = GetPlayerGroup(PlayerId())

    if (not IsPedInGroup(ped)) then
        SetPedAsGroupLeader(ped, group)
		SetPedAsGroupMember(ped, group);
    end
	if (IsPedInGroup(ped)) then
		SetPedNeverLeavesGroup(ped, 1);
		SetGroupFormationSpacing(group, 1, 0.9, 3)
		SetPedCanTeleportToGroupLeader(ped, group, 1);
    end
end

RegisterNetEvent('prp-pets:client:MostrarEstado')
AddEventHandler('prp-pets:client:MostrarEstado',function()
    LoopHud()
end)

local emotePlaying = false

GetAnimationList = function(model)
    for c,v in pairs(Config.tienda.animales) do
        if model == v.model then
            return v.animations
        end
    end
end

RegisterNetEvent('prp-pets:client:Animacion')
AddEventHandler('prp-pets:client:Animacion',function(dictionary,animation)
    if emotePlaying then
		ClearPedTasksImmediately(TempPet.ped)
	    emotePlaying = false
    end
    if not dictionary or not animation then
        return
    end
	RequestAnimDict(dictionary)
	while not HasAnimDictLoaded(dictionary) do
		Wait(1)
	end
	TaskPlayAnim(TempPet.ped, dictionary, animation, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	emotePlaying = true
end)

RegisterNetEvent('prp-pets:client:UpdateEstado')
AddEventHandler('prp-pets:client:UpdateEstado',function(val,cant)
    if TempPet ~= false then
        TempPet[val] = TempPet[val] + cant > 100 and 100 or TempPet[val] + cant
        PRPCore.Functions.Notify('Yay your pet '..TempPet.nombre..' is satisfied and loves you <3 🐶','primary')
        TriggerServerEvent('prp-pets:server:ActualizarPet', TempPet)
    end
end)

GetPetMenu = function(hit)
    if TempPet and hit == TempPet.ped then
        local data = {}

        if TempPet.vivo then
            data[#data+1] = {
                texto = "Show status",
                ctype = "cevent",
                cname = "prp-pets:client:MostrarEstado",
                args = {}
            }

            data[#data+1] = {
                texto = TempPet.quieto and "Follow me" or "Wait",
                ctype = "cevent",
                cname = "prp-pets:client:Quieto",
                args = {}
            }

            data[#data+1] = {
                texto = "Feed",
                ctype = "cevent",
                cname = "prp-pets:client:UpdateEstado",
                args = {"comida",30}
            }

            data[#data+1] = {
                texto = "Give drink",
                ctype = "cevent",
                cname = "prp-pets:client:UpdateEstado",
                args = {"agua",30}
            }

            local anims = {}

            if emotePlaying then
                anims[#anims+1] = {
                    texto = "Cancel Animation",
                    ctype = "cevent",
                    cname = "prp-pets:client:Animacion",
                    args = {}
                }
            end

            for c,v in pairs(GetAnimationList(GetEntityModel(hit))) do
                anims[#anims+1] = {
                    texto = v.name,
                    ctype = "cevent",
                    cname = "prp-pets:client:Animacion",
                    args = {v.dictionary,v.animation}
                }
            end
            if #anims > 0 then
                data[#data+1] = {
                    texto = "Animations",
                    menu = anims,
                }
            end

            return data
        else
            data[#data+1] = {
                texto = "Lift up",
                ctype = "cevent",
                cname = "prp-pets:client:LlamarMascota",
                args = {true}
            }
            return data
        end
    else
        return false
    end
end

LoopHud = function()
    TempPet.hud = not TempPet.hud
    if TempPet.hud then
        Citizen.SetTimeout(30000, function()
            TempPet.hud = false
            print("[prp-pets] Pet information")
        end)
    end
    SendNUIMessage({
        type = "ui",
        status = TempPet.hud,
    })
    Citizen.CreateThread(function()
        local mostrando = true
        local ply = PlayerPedId()
        while TempPet ~= false and TempPet.hud do
            local s = 250            
            local plycoords = GetEntityCoords(ply)
            local petcoords = GetEntityCoords(TempPet.ped)
            local dist = #(plycoords-petcoords) 
			local onScreen, _x, _y  = World3dToScreen2d(petcoords.x, petcoords.y, petcoords.z + 0.5)
            --local onScreen_hit, _x_hit, _y_hit  = World3dToScreen2d(petcoords.x, petcoords.y, petcoords.z)

            if dist < 7.0 and not IsPedInAnyVehicle(TempPet.ped, true) then
                s = 10
                SendNUIMessage({
                    type = "coords",
                    x = _x,
                    y = _y,
                    dist = dist,
                    hit_x = _x,
                    hit_y = _y,
                    hp = TempPet.hp,
                    comida = TempPet.comida,
                    agua = TempPet.agua,
                })

                if not mostrando then mostrando = true; 
                    SendNUIMessage({
                        type = "ui",
                        status = true,
                    })
                end
            else
                if mostrando then mostrando = false; SendNUIMessage({type = "ui",status = false,});end
            end

            Citizen.Wait(s)
        end
        if mostrando then SendNUIMessage({type = "ui",status = false,});end
    end)
end

function ShowHelpNotification(str,petcoords)
    AddTextEntry('prp-pets', str)
	SetFloatingHelpTextWorldPosition(1, petcoords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('prp-pets')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

local lastcheck = 0
local lastpetcoords = {}
local lasttask = 0

LoopMascota = function()
    Citizen.CreateThread(function()
        local comidaAlert, aguaAlert = false, false

        while TempPet ~= false and TempPet.vivo do
            local s = 500
            local plyped = PlayerPedId()
            

            if not TempPet.quieto then
                local PlyVeh = GetVehiclePedIsIn(plyped, false)
                local PetVeh = GetVehiclePedIsIn(TempPet.ped, false)
                local PlyInVeh, PetInVeh = PlyVeh ~= nil and PlyVeh ~= 0, PetVeh ~= nil and PetVeh ~= 0
                s = 100

                --func_100(TempPet.ped)

                plyPos = GetEntityCoords(plyped) 
                petPos = GetEntityCoords(TempPet.ped)
                distance = #(plyPos - petPos)

                local time = GetGameTimer() - lastcheck

                if distance > 3.0 and distance < 15.0 then
                    if time > 1000 or lastcheck == 0 then
                        local dist = #(petPos - lastpetcoords)
                        --print("task status", GetScriptTaskStatus(TempPet.ped,0x4924437d))
                        if dist < 0.1 and GetScriptTaskStatus(TempPet.ped,0x4924437d) ~= 1 then
                            if IsPedSprinting(plyped) then
                                lastcheck = GetGameTimer()
                                ClearPedTasks(TempPet.ped)
                                TaskGoToEntity(TempPet.ped,plyped,-1,4.0,30.0,1073741824,0)
                                SetPedKeepTask(TempPet.ped,true)
                            else
                                lastcheck = GetGameTimer()
                                ClearPedTasks(TempPet.ped)
                                TaskGoToEntity(TempPet.ped,plyped,-1,1.0,2.0,1073741824,0)
                                SetPedKeepTask(TempPet.ped,true)
                            end
                        end
                    end
                end

                if distance > 14.0 and distance < 25.0 then
                    if time > 1000 or lastcheck == 0 then
                        local dist = #(petPos - lastpetcoords)
                        if dist < 0.1 then
                            TaskGoToEntity(TempPet.ped,plyped,-1,4.0,30.0,1073741824,0)
                        end
                    end
                end

                if distance > 25 and not PlyInVeh then
                    SetEntityInvincible(TempPet.ped, true)
                    tp = GetOffsetFromEntityInWorldCoords(plyped, 1.0, 1.0, -1.0)
                    SetEntityCoords(TempPet.ped,tp)
                    Citizen.Wait(1000)
                    SetEntityInvincible(TempPet.ped, false)
                    TaskGoToEntity(TempPet.ped,plyped,-1,1.0,2.0,1073741824,0)
                end

                lastpetcoords = petPos

                -- veh
                if PlyInVeh and (not PetInVeh or PlyVeh ~= PetVeh) and distance < 2.5 then
                    --TaskWarpPedIntoVehicle(TempPet.ped,PlyVeh,-2)
                    local seat = GetEmptySeat(PlyVeh)
                    if seat and not IsThisModelABike(GetEntityModel(PlyVeh)) then
                        TaskEnterVehicle(TempPet.ped,PlyVeh,-1,seat,2.0,16,0)
                        RequestAnimDict("creatures@rottweiler@in_vehicle@std_car")
                        Citizen.Wait(100)
                        TaskPlayAnim(TempPet.ped, "creatures@rottweiler@in_vehicle@std_car", "sit", 1.0, -1, -1, 2, 0, 0, 0, 0)
                    else
                        PRPCore.Functions.Notify(TempPet.nombre..'  cant get in this vehicle 🐶')
                        Citizen.Wait(15000)
                        PlyVeh = GetVehiclePedIsIn(plyped, false)
                        if PlyVeh ~= nil and PlyVeh ~= 0 then
                            PRPCore.Functions.Notify(TempPet.nombre..' went home!🐶')
                            TriggerEvent('prp-pets:client:LlamarMascota',true)
                            return
                        end
                    end
                elseif not PlyInVeh and PetInVeh then
                    plyPos = GetEntityCoords(PlayerPedId(),  true)
                    local xnew = plyPos.x+1
                    local ynew = plyPos.y+1
                    SetEntityCoords(TempPet.ped, xnew, ynew, plyPos.z)
                    ClearPedTasks(TempPet.ped)
                end
            end
            -- vida

            if IsEntityDead(TempPet.ped) then
                TempPet.vivo = false
                TriggerServerEvent('prp-pets:server:ActualizarPet', TempPet)
                PRPCore.Functions.Notify('You need to start taking better care of '..TempPet.nombre..'!🐶')
            else
                TempPet.hp = GetEntityHealth(TempPet.ped)
            end
            Citizen.Wait(s)
        end; return
    end)
end

LoopComida = function()
    Citizen.CreateThread(function()
        local comidaAlert, aguaAlert = false, false

        while TempPet ~= false and TempPet.vivo do
            local s = 500

            -- comida y agua
            if TempPet.comida > 0 and TempPet.agua > 0 then
                TempPet.comida = TempPet.comida - 0.05
                TempPet.agua = TempPet.agua - 0.05
                if TempPet.comida < 15.0 and not comidaAlert then
                    comidaAlert = true; PRPCore.Functions.Notify(TempPet.nombre..'  is hungry! 🐶',"error",7000); TriggerServerEvent('prp-pets:server:ActualizarPet', TempPet)
                elseif TempPet.comida > 15.0 and comidaAlert then
                    comidaAlert = false
                end

                if TempPet.agua < 15.0 and not aguaAlert then
                    aguaAlert = true; PRPCore.Functions.Notify(TempPet.nombre..'  is thirsty! 🐶',"error",7000); TriggerServerEvent('prp-pets:server:ActualizarPet', TempPet)
                elseif TempPet.agua > 15.0 and aguaAlert then
                    aguaAlert = false
                end
            else
                TempPet.hp = GetEntityHealth(TempPet.ped)
                SetEntityHealth(TempPet.ped,TempPet.hp - 1.0)                
            end
            Citizen.Wait(s)
        end; return
    end)
end

GetEmptySeat = function(veh)
    local seat = false
    for i=0,6 do 
        if IsVehicleSeatFree(veh,i) then; seat = i; break; end; end
    return seat
end

CambiarQuieto = function(val)
    if not TempPet.quieto then
        FreezeEntityPosition(TempPet.ped, true); TempPet.quieto = true;
    else
        FreezeEntityPosition(TempPet.ped, false); TempPet.quieto = false;
    end
end

DoRequestModel = function(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
end

DoRequestAnimSet = function(anim)
	RequestAnimDict(anim)
	while not HasAnimDictLoaded(anim) do
		Citizen.Wait(1)
	end
end
