PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

local inCityhallPage = false
local fxCityhall = {}

fxCityhall.Open = function()
    SendNUIMessage({
        action = "open"
    })
    SetNuiFocus(true, true)
    inCityhallPage = true
end

fxCityhall.Close = function()
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false, false)
    inCityhallPage = false
end

fxCityhall.DrawText3Ds = function(coords, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    inCityhallPage = false
end)

local inRange = false

Citizen.CreateThread(function()
    CityhallBlip = AddBlipForCoord(Config.Cityhall.coords.x, Config.Cityhall.coords.y, Config.Cityhall.coords.z)

    SetBlipSprite (CityhallBlip, 487)
    SetBlipDisplay(CityhallBlip, 4)
    SetBlipScale  (CityhallBlip, 0.65)
    SetBlipAsShortRange(CityhallBlip, true)
    SetBlipColour(CityhallBlip, 0)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("City Hall")
    EndTextCommandSetBlipName(CityhallBlip)

    -- DrivingSchoolBlip = AddBlipForCoord(Config.DrivingSchool.coords.x, Config.DrivingSchool.coords.y, Config.DrivingSchool.coords.z)

    -- SetBlipSprite (DrivingSchoolBlip, 225)
    -- SetBlipDisplay(DrivingSchoolBlip, 4)
    -- SetBlipScale  (DrivingSchoolBlip, 0.45)
    -- SetBlipAsShortRange(DrivingSchoolBlip, true)
    -- SetBlipColour(DrivingSchoolBlip, 47)

    -- BeginTextCommandSetBlipName("STRING")
    -- AddTextComponentSubstringPlayerName("DMV")
    -- EndTextCommandSetBlipName(DrivingSchoolBlip)
end)
local creatingCompany = false
local currentName = nil
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        inRange = false

        local dist = GetDistanceBetweenCoords(pos, Config.Cityhall.coords.x, Config.Cityhall.coords.y, Config.Cityhall.coords.z, true)
        local dist2 = GetDistanceBetweenCoords(pos, Config.DrivingSchool.coords.x, Config.DrivingSchool.coords.y, Config.DrivingSchool.coords.z, true)

        if dist < 20 then
            inRange = true
            DrawMarker(2, Config.Cityhall.coords.x, Config.Cityhall.coords.y, Config.Cityhall.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 155, 152, 234, 155, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos, Config.Cityhall.coords.x, Config.Cityhall.coords.y, Config.Cityhall.coords.z, true) < 1.5 then
                fxCityhall.DrawText3Ds(Config.Cityhall.coords, '~g~E~w~ - Open Cityhall')
                if IsControlJustPressed(0, 38) then
                    fxCityhall.Open()
                end
            end
        end

        if dist2 < 20 then
            inRange = true
            DrawMarker(2, Config.DrivingSchool.coords.x, Config.DrivingSchool.coords.y, Config.DrivingSchool.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 155, 152, 234, 155, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos, Config.DrivingSchool.coords.x, Config.DrivingSchool.coords.y, Config.DrivingSchool.coords.z, true) < 1.5 then
                fxCityhall.DrawText3Ds(Config.DrivingSchool.coords, '~g~E~w~ - DMV Application')
                if IsControlJustPressed(0, 38) then
                    if PRPCore.Functions.GetPlayerData().metadata["licences"]["driver"] then
                        PRPCore.Functions.Notify("You already have your license, please pick it up at city hall.")
                    else
                        TriggerServerEvent("prp-cityhall:server:sendDriverTest")
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(2)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        inRange = false

        local dist = GetDistanceBetweenCoords(pos, Config.CityhallPD.coords.x, Config.CityhallPD.coords.y, Config.CityhallPD.coords.z, true)

        if dist < 10 then
            inRange = true
            DrawMarker(2, Config.Cityhall.coords.x, Config.CityhallPD.coords.y, Config.CityhallPD.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 155, 152, 234, 155, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos, Config.CityhallPD.coords.x, Config.CityhallPD.coords.y, Config.CityhallPD.coords.z, true) < 1.0 then
                fxCityhall.DrawText3Ds(Config.CityhallPD.coords, '~g~E~w~ - Print ID Card Replacement')
                if IsControlJustPressed(0, 38) then
                    local licdata = { ["item"] = "id_card"}
                    TriggerServerEvent("prp-cityhall:server:newid", licdata)
                    Citizen.Wait(5000)
                end
            end
        end

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(2)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        inRange = false

        local dist = GetDistanceBetweenCoords(pos, Config.CityhallBPD.coords.x, Config.CityhallBPD.coords.y, Config.CityhallBPD.coords.z, true)

        if dist < 10 then
            inRange = true
            DrawMarker(2, Config.Cityhall.coords.x, Config.CityhallBPD.coords.y, Config.CityhallBPD.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 155, 152, 234, 155, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos, Config.CityhallBPD.coords.x, Config.CityhallBPD.coords.y, Config.CityhallBPD.coords.z, true) < 1.0 then
                fxCityhall.DrawText3Ds(Config.CityhallBPD.coords, '~g~E~w~ - Print ID Card Replacement')
                if IsControlJustPressed(0, 38) then
                    local licdata = { ["item"] = "id_card"}
                    TriggerServerEvent("prp-cityhall:server:newid", licdata)
                    Citizen.Wait(5000)
                end
            end
        end

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(2)
    end
end)


RegisterNetEvent('prp-cityhall:client:sendDriverEmail')
AddEventHandler('prp-cityhall:client:sendDriverEmail', function(charinfo)
    SetTimeout(math.random(2500, 4000), function()
        local gender = "Mr"
        if PRPCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "Miss"
        end
        local charinfo = PRPCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('prp-phone:server:sendNewMail', {
            sender = "City Hall",
            subject = "Driver License Application",
            message = "Hello " .. gender .. " " .. charinfo.lastname .. ",<br /><br />We just received an applicant for the driving school.<br />Please contact:<br />Name: <strong>".. charinfo.firstname .. " " .. charinfo.lastname .. "</strong><br />Phone Number: <strong>"..charinfo.phone.."</strong><br/><br/>Kind regards,<br />City of Los Santos",
            button = {}
        })
    end)
end)

local idTypes = {
    ["id-card"] = {
        label = "ID-Card",
        item = "id_card"
    },
    ["driverlicense"] = {
        label = "Driver License",
        item = "driver_license"
    }
}

RegisterNUICallback('requestId', function(data)
    if inRange then
        local idType = data.idType

        TriggerServerEvent('prp-cityhall:server:requestId', idTypes[idType])
        PRPCore.Functions.Notify('You successfully'..idTypes[idType].label..' applied for $50', 'success', 3500)
    else
        PRPCore.Functions.Notify('Why are you even trying?...', 'error')
    end
end)

RegisterNUICallback('requestLicenses', function(data, cb)
    local PlayerData = PRPCore.Functions.GetPlayerData()
    local licensesMeta = PlayerData.metadata["licences"]
    local availableLicenses = {}

    for type,_ in pairs(licensesMeta) do
        if licensesMeta[type] then
            local licenseType = nil
            local label = nil
            if type == "driver" then licenseType = "driverlicense" label = "Driver License" end

            table.insert(availableLicenses, {
                idType = licenseType,
                label = label
            })
        end
    end
    cb(availableLicenses)
end)

local AvailableJobs = {
    "trucker",
    "taxi",
    "tow",
    "reporter",
    "lumberjack",
    "garbage",
    -- "ecologist",
    "farmer",
    "miner"
}


function IsAvailableJob(job)
    local retval = false
    for k, v in pairs(AvailableJobs) do
        if v == job then
            retval = true
        end
    end
    return retval
end


RegisterNUICallback('applyJob', function(data)
    local player = PlayerId()
    if inRange then
        if IsAvailableJob(data.job) then
            jobdata = Config.jobs[data.job]
            messagetext = nil
            if data.job == "miner" or data.job == "ecologist" then
                messagetext = jobdata.message.." "..'<br><br> <img style="width: 100%; height: 100%;" src="'..jobdata.image1..'"><img><br><br><img style="width: 100%; height: 100%;" src="'..jobdata.image2..'"><img>'
            elseif jobdata.message and jobdata.image1 then
                messagetext = jobdata.message.." "..'<br><br> <img style="width: 100%; height: 100%;" src="'..jobdata.image1..'"><img><br>'
            elseif jobdata.message and not jobdata.image1 then
                messagetext = data.job.." has a broken image please report this to a developer!"
            elseif not jobdata.message and jobdata.image then
                messagetext = data.job.." has a broken description please report this to a developer!"
            elseif not jobdata.message and not jobdata.image then
                messagetext = data.job.." has a broken description AND image please report this to a developer!"
            end
            TriggerServerEvent('prp-phone:server:sendNewMail', {
                sender = jobdata.sendername,
                subject = jobdata.subject,
                message = messagetext,

                button = {
                    enabled = true,
                    buttonEvent = "prp-cityhall-setjoblocation",
                    buttonData = {
                        ["coords"] = jobdata.coords,
                        ["sender"] = jobdata.sendername
                    }
                }
            })
            TriggerServerEvent('prp-cityhall:server:ApplyJob', data.job)
        else
            TriggerServerEvent('prp-cityhall:server:banPlayer')
            TriggerServerEvent("prp-log:server:CreateLog", "anticheat", "POST Request (Abuse)", "red", "** @everyone " ..GetPlayerName(player).. "** is banned from localhost:13172, POST request\'s")         
        end
    else
        PRPCore.Functions.Notify('Why are you even trying?...', 'error')
    end
end)

RegisterNetEvent('prp-cityhall-setjoblocation')
AddEventHandler('prp-cityhall-setjoblocation', function(data)
    SetNewWaypoint(tonumber(data["coords"].x), tonumber(data["coords"].y))
    PRPCore.Functions.Notify('The location has been marked on your GPS.', 'success')
end)