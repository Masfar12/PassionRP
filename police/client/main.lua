Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

isLoggedIn = false

isHandcuffed = false
cuffType = 1
isEscorted = false
draggerId = 0
PlayerJob = {}
onDuty = false

databankOpen = false

PRPCore = nil
Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)    
        Citizen.Wait(200)
    end
    SetCarItemsInfo()
end)

Citizen.CreateThread(function()
    for k, station in pairs(Config.Locations["stations"]) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 60)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.55)
        SetBlipColour(blip, 29)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Police station")
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()

    -- Set variables on login
    isLoggedIn = true
    PlayerJob = PRPCore.Functions.GetPlayerData().job

    -- If you are handcuffed before, you should be handcuffed again.
    isHandcuffed = false
    TriggerServerEvent("PRPCore:Server:SetMetaData", "ishandcuffed", false)
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    onDuty = false
end)

Citizen.CreateThread(function()
    while true do
        if isLoggedIn then
            local playerData = PRPCore.Functions.GetPlayerData()
            onDuty = playerData.job.onduty
        end
        Citizen.Wait(30000)
    end
end)

RegisterNetEvent('police:client:sendBillingMail')
AddEventHandler('police:client:sendBillingMail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local gender = "mister"
        if PRPCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "miss"
        end
        local charinfo = PRPCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('prp-phone:server:sendNewMail', {
            sender = "LSPD",
            subject = "Citation",
            message = "Dear " .. gender .. " " .. charinfo.lastname .. ",<br /><br />The city of Los Santos will enforce the citations executed by the Los Santos Police Department.<br />The following $ <strong>$"..amount.."</strong> will be deducted from your bank.<br /><br />Kind regards,<br />City of Los Santos.",
            button = {}
        })
    end)
end)

local tabletProp = nil
RegisterNetEvent('police:client:toggleDatabank')
AddEventHandler('police:client:toggleDatabank', function()
    databankOpen = not databankOpen
    if databankOpen then
        RequestAnimDict("amb@code_human_in_bus_passenger_idles@female@tablet@base")
        while not HasAnimDictLoaded("amb@code_human_in_bus_passenger_idles@female@tablet@base") do
            Citizen.Wait(0)
        end
        local tabletModel = GetHashKey("prop_cs_tablet")
        local bone = GetPedBoneIndex(GetPlayerPed(-1), 60309)
        RequestModel(tabletModel)
        while not HasModelLoaded(tabletModel) do
            Citizen.Wait(100)
        end
        tabletProp = CreateObject(tabletModel, 1.0, 1.0, 1.0, 1, 1, 0)
        AttachEntityToEntity(tabletProp, GetPlayerPed(-1), bone, 0.03, 0.002, -0.0, 10.0, 160.0, 0.0, 1, 0, 0, 0, 2, 1)
        TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "databank",
        })
    else
        DetachEntity(tabletProp, true, true)
        DeleteObject(tabletProp)
        TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "exit", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = "closedatabank",
        })
    end
end)


RegisterNUICallback("closeDatabank", function(data, cb)
    databankOpen = false
    DetachEntity(tabletProp, true, true)
    DeleteObject(tabletProp)
    SetNuiFocus(false, false)
    TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "exit", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()

    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    TriggerServerEvent("police:server:UpdateCurrentCops")
    isLoggedIn = false
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(GetPlayerPed(-1))
    DetachEntity(GetPlayerPed(-1), true, false)
end)

AddEventHandler("prp-polyzone:enter", function(name, zoneData, zoneCenter)
    if name ~= "Police:Armory" then return end
    inRange = zoneData.name
    print("enter")
end)
AddEventHandler("prp-polyzone:exit", function(name, zoneData, zoneCenter)
    if name ~= "Police:Armory" then return end
    inRange = nil
    print("exit")
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = GetPlayerPed(-1)
        if inRange == "Cadet" then
            if IsControlJustPressed(0, 38) then
                if PlayerJob ~= nil and PlayerJob.name == 'police' and not onDuty then
                    FreezeEntityPosition(ped, true)
                    PRPCore.Functions.Progressbar('CadetArmory', 'Collecting gear...', 5000, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                    end)
                    Wait(5000)
                    FreezeEntityPosition(ped, false)
                    TriggerServerEvent("police:server:CadetLoadout", GetEntityCoords(ped))
                    TriggerServerEvent("prp-log:server:CreateLog", "leologs", "Entered Files", "red", "**"..GetPlayerName(PlayerId()).."** Accessed Cadet Armory")
                end
            end
        end
    end
end)

function CreateDutyBlips(playerLabel, playerJob, playerCoords)
    if playerLabel ~= PRPCore.Functions.GetPlayerData().metadata["callsign"] then


        blip = AddBlipForCoord(playerCoords)
        SetBlipSprite(blip, 1)
        --ShowHeadingIndicatorOnBlip(blip, true)
        --SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
        SetBlipScale(blip, 1.0)
        if playerJob == "police" then
            SetBlipColour(blip, 38)
        else
            SetBlipColour(blip, 5)
        end
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(playerLabel)
        EndTextCommandSetBlipName(blip)

        table.insert(DutyBlips, blip)
    end
end

RegisterNetEvent('police:client:SendPoliceEmergencyAlert')
AddEventHandler('police:client:SendPoliceEmergencyAlert', function(callsign, streetLabel, coords)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then 
        streetLabel = streetLabel .. " " .. street2
    end
    TriggerServerEvent("police:server:SendPoliceEmergencyAlert", streetLabel, pos, PRPCore.Functions.GetPlayerData().metadata["callsign"])
end)

RegisterNetEvent('police:PlaySound')
AddEventHandler('police:PlaySound', function()
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent('police:client:PoliceEmergencyAlert')
AddEventHandler('police:client:PoliceEmergencyAlert', function(callsign, streetLabel, coords)
    if (PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' or PlayerJob.name == 'doctor') and onDuty then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        TriggerEvent("chatMessage", "DISPATCH", "error", "10-13 officer down, 10-13 officer down ".. callsign .. " at "..streetLabel)
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("10-13 officer down")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:spawnObject')
AddEventHandler('police:client:spawnObject', function(objectId, type, cd,hd)
    local coords = cd
    local heading = hd
    local forward = GetEntityForwardVector(GetPlayerPed(-1))
    local x, y, z = table.unpack(coords + forward * 0.5)
    local spawnedObj = CreateObject(Config.Objects[type].model, x, y, z, false, false, false)
    PlaceObjectOnGroundProperly(spawnedObj)
    SetEntityHeading(spawnedObj, heading)
    FreezeEntityPosition(spawnedObj, Config.Objects[type].freeze)
    Config.Objects[objectId] = {
        id = objectId,
        object = spawnedObj,
        coords = {
            x = x,
            y = y,
            z = z - 0.3,
        },
    }
end)

RegisterNetEvent('police:client:GunShotAlert')
AddEventHandler('police:client:GunShotAlert', function(streetLabel, isAutomatic, fromVehicle, coords, vehicleInfo)
    local msg = ""
    local blipSprite = 313
    local blipText = "Shots fired"
    local MessageDetails = {}
    if fromVehicle then
        blipText = "Shots fired from vehicle"
        MessageDetails = {
            [1] = {
                icon = '<i class="fas fa-car"></i>',
                detail = vehicleInfo.name,
            },
            [2] = {
                icon = '<i class="fas fa-closed-captioning"></i>',
                detail = vehicleInfo.plate,
            },
            [3] = {
                icon = '<i class="fas fa-globe-europe"></i>',
                detail = streetLabel,
            },
        }
    else
        blipText = "Shots fired"
        MessageDetails = {
            [1] = {
                icon = '<i class="fas fa-globe-europe"></i>',
                detail = streetLabel,
            },
        }
    end
    local callSignvalue
    if PRPCore.Functions.GetPlayerData().metadata["callsign"] then
        callSignvalue = PRPCore.Functions.GetPlayerData().metadata["callsign"]
    else
        callSignvalue = math.random(100)
    end
    TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
        timeOut = 4000,
        alertTitle = blipText,
        coords = {
            x = coords.x,
            y = coords.y,
            z = coords.z,
        },
        details = MessageDetails,
        callSign = callSignvalue
    })
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, blipSprite)
    SetBlipColour(blip, 0)
    SetBlipDisplay(blip, 4)
    SetBlipAlpha(blip, transG)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipText)
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(180 * 4)
        transG = transG - 1
        SetBlipAlpha(blip, transG)
        if transG == 0 then
            SetBlipSprite(blip, 2)
            RemoveBlip(blip)
            return
        end
    end
end)

RegisterNetEvent('police:client:VehicleCall')
AddEventHandler('police:client:VehicleCall', function(coords, msg)
    if PlayerJob.name == 'police' and onDuty then
        TriggerEvent("chatMessage", "DISPATCH", "error", msg)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 380)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Dispatch: Vehicle Burglary")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:HouseRobberyCall')
AddEventHandler('police:client:HouseRobberyCall', function(coords, streetLabel)

    print(coords)
    local job = nil
    if PlayerJob.name == nil then
        job = PRPCore.Functions.GetPlayerData().job.name
    else
        job = PlayerJob.name
    end

    if job == "police" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
            timeOut = 5000,
            alertTitle = "House Robbery",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = {
                [1] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
        })

        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 458)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911: House Robbery")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:ParkingRobberyCall')
AddEventHandler('police:client:ParkingRobberyCall', function(coords, streetLabel)

    local job = nil
    if PlayerJob.name == nil then
        job = PRPCore.Functions.GetPlayerData().job.name
    else
        job = PlayerJob.name
    end

    if job == "police" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
            timeOut = 5000,
            alertTitle = "Parking Meter Robbery",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = {
                [1] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
        })

        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 458)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911: Parking Meter Robbery")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:FIBBuilding')
AddEventHandler('police:client:FIBBuilding', function(coords, streetLabel)

    local job = nil
    if PlayerJob.name == nil then
        job = PRPCore.Functions.GetPlayerData().job.name
    else
        job = PlayerJob.name
    end

    if job == "police" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
            timeOut = 5000,
            alertTitle = "FIB Building Security",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = {
                [1] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
        })

        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 458)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("FIB Security System")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('911:client:SendPoliceAlert')
AddEventHandler('911:client:SendPoliceAlert', function(notifyType, msg, blipSettings)
    if PlayerJob.name == 'police' and onDuty then
        if notifyType == "flagged" then
            TriggerEvent("chatMessage", "CALL", "error", msg)
            RadarSound()
        elseif notifyType == "player" then
            PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
        else
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent("chatMessage", "911-DISPATCH", "error", msg)
        end
        if blipSettings ~= nil then
            local transG = 250
            local blip = AddBlipForCoord(blipSettings.x, blipSettings.y, blipSettings.z)
            SetBlipSprite(blip, blipSettings.sprite)
            SetBlipColour(blip, blipSettings.color)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, blipSettings.scale)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(blipSettings.text)
            EndTextCommandSetBlipName(blip)
            while transG ~= 0 do
                Wait(60 * 4)
                transG = transG - 1
                SetBlipAlpha(blip, transG)
                if transG == 0 then
                    SetBlipSprite(blip, 2)
                    RemoveBlip(blip)
                    return
                end
            end
        end
    end
end)

RegisterNetEvent('police:client:PoliceAlertMessage')
AddEventHandler('police:client:PoliceAlertMessage', function(title, streetLabel, coords)
    if PlayerJob.name == 'police' and onDuty then
        TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
            timeOut = 5000,
            alertTitle = title,
            details = {
                [1] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
        })

        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 100
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z, 100.0)
        SetBlipSprite(blip, 9)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, transG)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911 - "..title)
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:server:SendEmergencyMessageCheck')
AddEventHandler('police:server:SendEmergencyMessageCheck', function(MainPlayer, message, coords)
    local PlayerData = PRPCore.Functions.GetPlayerData()

    if ((PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" or PlayerData.job.name == "doctor") and onDuty) then
        TriggerEvent('chatMessage', "911 CALL - " .. MainPlayer.PlayerData.charinfo.firstname .. " " .. MainPlayer.PlayerData.charinfo.lastname .. " ("..MainPlayer.PlayerData.source..")", "warning", message)
        TriggerEvent("police:client:EmergencySound")
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 0.9)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911 CALL")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:Send911AMessage')
AddEventHandler('police:client:Send911AMessage', function(message)
    local PlayerData = PRPCore.Functions.GetPlayerData()

    if ((PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" or PlayerData.job.name == "doctor") and onDuty) then
        TriggerEvent('chatMessage', "ANONYMOUS CALL", "warning", message)
        TriggerEvent("police:client:EmergencySound")
    end
end)

RegisterNetEvent('police:client:SendToJail')
AddEventHandler('police:client:SendToJail', function(time)
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(GetPlayerPed(-1))
    DetachEntity(GetPlayerPed(-1), true, false)
    TriggerEvent("prison:client:Enter", time)
end)

function RadarSound()
    PlaySoundFrontend( -1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)   
end

function GetClosestPlayer()
    local closestPlayers = PRPCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

function DrawText3D(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextOutline()
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        --local factor = (string.len(text)) / 370
		--DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
      end
  end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end 

