PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

local ClosestSafe = nil

local PlayerData = {}

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function SetClosestSafe()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil
    for id, house in pairs(Config.Safes) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.Safes[id].coords.x, Config.Safes[id].coords.y, Config.Safes[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Config.Safes[id].coords.x, Config.Safes[id].coords.y, Config.Safes[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Config.Safes[id].coords.x, Config.Safes[id].coords.y, Config.Safes[id].coords.z, true)
            current = id
        end
    end
    ClosestSafe = current
end

RegisterNetEvent("PRPCore:Client:OnPlayerLoaded")
AddEventHandler("PRPCore:Client:OnPlayerLoaded", function()
    Citizen.CreateThread(function()
        PlayerData = PRPCore.Functions.GetPlayerData()
        while true do
            SetClosestSafe()
            Citizen.Wait(2500)
        end
    end)
end)

Citizen.CreateThread(function()
    while true do
        local inRange = false
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        if ClosestSafe ~= nil then
            if PlayerData.job.name == ClosestSafe then
                local data = Config.Safes[ClosestSafe]

                local distance = GetDistanceBetweenCoords(pos, data.coords.x, data.coords.y, data.coords.z)
                if distance < 20 then
                    inRange = true
                    if distance < Config.MinimumSafeDistance and checkCanDeposit(data, PlayerData) then
                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '~g~$'..data.money)
                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z - 0.1, '~b~/deposit~w~ - Put money in the safe')
                        if checkJobRestrictionMet(data, PlayerData) then
                            DrawText3Ds(data.coords.x, data.coords.y, data.coords.z - 0.2, '~b~/withdraw~w~ - Get money out of the safe')
                        end
                    end
                end
            else
                Citizen.Wait(1750)
            end
        else
            Citizen.Wait(1750)
        end
        Citizen.Wait(1)
    end
end)

checkJobRestrictionMet = function(safe, playerData)
    if safe.jobRestrictions == nil then return true end

    for _, v in pairs(safe.jobRestrictions) do
        if v == playerData.job.grade.label then
            return true
        end
    end

    return false
end

function checkCanDeposit(safe, playerData)
    if safe["depositJobRestrictions"] ~= nil then
        for _, v in ipairs(safe.depositJobRestrictions) do
            if v == playerData.job.grade.label then
                return true
            end
        end
    end

    return checkJobRestrictionMet(safe, playerData)
end

RegisterNetEvent('prp-moneysafe:client:DepositMoney')
AddEventHandler('prp-moneysafe:client:DepositMoney', function(amount)
    if ClosestSafe ~= nil then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local data = Config.Safes[ClosestSafe]
            local distance = GetDistanceBetweenCoords(pos, data.coords.x, data.coords.y, data.coords.z)
            
            if distance < Config.MinimumSafeDistance then
                if PlayerData.job.name == ClosestSafe and checkCanDeposit(data, PlayerData) then
                    TriggerServerEvent('prp-moneysafe:server:DepositMoney', ClosestSafe, amount, PlayerData.job.grade.level)
                end
            end
    end
end)

RegisterNetEvent('prp-moneysafe:client:WithdrawMoney')
AddEventHandler('prp-moneysafe:client:WithdrawMoney', function(amount)
    if ClosestSafe ~= nil then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local data = Config.Safes[ClosestSafe]
            local distance = GetDistanceBetweenCoords(pos, data.coords.x, data.coords.y, data.coords.z)
            
            if distance < Config.MinimumSafeDistance then
                if PlayerData.job.name == ClosestSafe and checkJobRestrictionMet(data, PlayerData) then
                    TriggerServerEvent('prp-moneysafe:server:WithdrawMoney', ClosestSafe, amount)
                end
            end
    end
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('prp-moneysafe:client:UpdateSafe')
AddEventHandler('prp-moneysafe:client:UpdateSafe', function(SafeData, k)
    Config.Safes[k].money = SafeData.money
    Config.Safes[k].transactions = SafeData.transactions
end)