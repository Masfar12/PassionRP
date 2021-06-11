local CanOpenBank = false
local LoggedIn = true

Framework = nil

TriggerEvent("PRPCore:GetObject", function(obj) Framework = obj end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(500, function()
     TriggerEvent("PRPCore:GetObject", function(obj) Framework = obj end)
      Citizen.Wait(150)
      LoggedIn = true
    end)
end)

local atms = {
    {name="ATM", id=277, x=-386.733, y=6045.953, z=31.501},
    {name="ATM", id=277, x=-284.037, y=6224.385, z=31.187},
    {name="ATM", id=277, x=-284.037, y=6224.385, z=31.187},
    {name="ATM", id=277, x=-135.165, y=6365.738, z=31.101},
    {name="ATM", id=277, x=-110.753, y=6467.703, z=31.784},
    {name="ATM", id=277, x=-94.9690, y=6455.301, z=31.784},
    {name="ATM", id=277, x=155.4300, y=6641.991, z=31.784},
    {name="ATM", id=277, x=174.6720, y=6637.218, z=31.784},
    {name="ATM", id=277, x=1703.138, y=6426.783, z=32.730},
    {name="ATM", id=277, x=1735.114, y=6411.035, z=35.164},
    {name="ATM", id=277, x=1702.842, y=4933.593, z=42.051},
    {name="ATM", id=277, x=1967.333, y=3744.293, z=32.272},
    {name="ATM", id=277, x=1821.917, y=3683.483, z=34.244},
    {name="ATM", id=277, x=1174.532, y=2705.278, z=38.027},
    {name="ATM", id=277, x=540.0420, y=2671.007, z=42.177},
    {name="ATM", id=277, x=2564.399, y=2585.100, z=38.016},
    {name="ATM", id=277, x=2558.683, y=349.6010, z=108.050},
    {name="ATM", id=277, x=2558.051, y=389.4817, z=108.660},
    {name="ATM", id=277, x=1077.692, y=-775.796, z=58.218},
    {name="ATM", id=277, x=1139.018, y=-469.886, z=66.789},
    {name="ATM", id=277, x=1168.975, y=-457.241, z=66.641},
    {name="ATM", id=277, x=1153.884, y=-326.540, z=69.245},
    {name="ATM", id=277, x=381.2827, y=323.2518, z=103.270},
    {name="ATM", id=277, x=236.4638, y=217.4718, z=106.840},
    {name="ATM", id=277, x=265.0043, y=212.1717, z=106.780},
    {name="ATM", id=277, x=285.2029, y=143.5690, z=104.970},
    {name="ATM", id=277, x=157.7698, y=233.5450, z=106.450},
    {name="ATM", id=277, x=-164.568, y=233.5066, z=94.919},
    {name="ATM", id=277, x=-1827.04, y=785.5159, z=138.020},
    {name="ATM", id=277, x=-1409.39, y=-99.2603, z=52.473},
    {name="ATM", id=277, x=-1205.35, y=-325.579, z=37.870},
    {name="ATM", id=277, x=-1215.64, y=-332.231, z=37.881},
    {name="ATM", id=277, x=-2072.41, y=-316.959, z=13.345},
    {name="ATM", id=277, x=-2975.72, y=379.7737, z=14.992},
    {name="ATM", id=277, x=-2962.60, y=482.1914, z=15.762},
    {name="ATM", id=277, x=-2955.70, y=488.7218, z=15.486},
    {name="ATM", id=277, x=-3044.22, y=595.2429, z=7.595},
    {name="ATM", id=277, x=-3144.13, y=1127.415, z=20.868},
    {name="ATM", id=277, x=-3241.10, y=996.6881, z=12.500},
    {name="ATM", id=277, x=-3241.11, y=1009.152, z=12.877},
    {name="ATM", id=277, x=-1305.40, y=-706.240, z=25.352},
    {name="ATM", id=277, x=-538.225, y=-854.423, z=29.234},
    {name="ATM", id=277, x=-711.156, y=-818.958, z=23.768},
    {name="ATM", id=277, x=-717.614, y=-915.880, z=19.268},
    {name="ATM", id=277, x=-526.566, y=-1222.90, z=18.434},
    {name="ATM", id=277, x=-256.831, y=-719.646, z=33.444},
    {name="ATM", id=277, x=-203.548, y=-861.588, z=30.205},
    {name="ATM", id=277, x=112.4102, y=-776.162, z=31.427},
    {name="ATM", id=277, x=112.9290, y=-818.710, z=31.386},
    {name="ATM", id=277, x=119.9000, y=-883.826, z=31.191},
    {name="ATM", id=277, x=149.4551, y=-1038.95, z=29.366},
    {name="ATM", id=277, x=-846.304, y=-340.402, z=38.687},
    {name="ATM", id=277, x=-1204.35, y=-324.391, z=37.877},
    {name="ATM", id=277, x=-1216.27, y=-331.461, z=37.773},
    {name="ATM", id=277, x=-56.1935, y=-1752.53, z=29.452},
    {name="ATM", id=277, x=-261.692, y=-2012.64, z=30.121},
    {name="ATM", id=277, x=-273.001, y=-2025.60, z=30.197},
    {name="ATM", id=277, x=314.187, y=-278.621, z=54.170},
    {name="ATM", id=277, x=-351.534, y=-49.529, z=49.042},
    {name="ATM", id=277, x=24.589, y=-946.056, z=29.357},
    {name="ATM", id=277, x=-254.112, y=-692.483, z=33.616},
    {name="ATM", id=277, x=-1570.197, y=-546.651, z=34.955},
    {name="ATM", id=277, x=-1415.909, y=-211.825, z=46.500},
    {name="ATM", id=277, x=-1430.112, y=-211.014, z=46.500},
    {name="ATM", id=277, x=33.232, y=-1347.849, z=29.497},
    {name="ATM", id=277, x=129.216, y=-1292.347, z=29.269},
    {name="ATM", id=277, x=287.645, y=-1282.646, z=29.659},
    {name="ATM", id=277, x=289.012, y=-1256.545, z=29.440},
    {name="ATM", id=277, x=295.839, y=-895.640, z=29.217},
    {name="ATM", id=277, x=1686.753, y=4815.809, z=42.008},
    {name="ATM", id=277, x=-302.408, y=-829.945, z=32.417},
    {name="ATM", id=277, x=5.134, y=-919.949, z=29.557},

}

ATMObjects = {
    -870868698,
    -1126237515,
    -1364697528,
    506770882,
}

-- Banks
local banks = {
    {name="Bank", id=108, x=150.266, y=-1040.203, z=29.374},
    {name="Bank", id=108, x=-1212.980, y=-330.841, z=37.787},
    {name="Bank", id=108, x=-2962.582, y=482.627, z=15.703},
    {name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
    {name="Bank", id=108, x=314.187, y=-278.621, z=54.170},
    {name="Bank", id=108, x=-351.534, y=-49.529, z=49.042},
    {name="Bank", id=108, x=241.17309570313, y=225.43760681152, z=106.2868270874},
    {name="Bank", id=108, x=1175.1030273438, y=2706.7941894531, z=38.094074249268},
}

Citizen.CreateThread(function()
    for _, item in pairs(banks) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
        SetBlipSprite(item.blip, item.id)
        SetBlipColour(item.blip, 25)
        SetBlipScale(item.blip, 0.6)
        SetBlipAsShortRange(item.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.name)
        EndTextCommandSetBlipName(item.blip)
    end
end)





RegisterNetEvent('pepe-banking:client:open:bank')
AddEventHandler('pepe-banking:client:open:bank', function()
    Citizen.SetTimeout(450, function()
        OpenBank(true)
    end)
end)

RegisterNetEvent('pepe-banking:client:open:atm')
AddEventHandler('pepe-banking:client:open:atm', function()
    Citizen.SetTimeout(250, function()
        OpenBank(false)
    end)
end)

RegisterNUICallback('ClickSound', function(data)
    if data.success == 'bank-error' then
     PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
    elseif data.success == 'click' then
     PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
    else
     TriggerEvent("pepe-sound:client:play", data.success, 0.25)
    end
end)

RegisterNUICallback('Withdraw', function(data)
    if IsNearAnyBank() or IsNearAtm() then
      TriggerServerEvent('pepe-banking:server:withdraw', data.RemoveAmount, data.BankId) 
    end
end)

RegisterNUICallback('Deposit', function(data)
    if IsNearAnyBank() then
      TriggerServerEvent('pepe-banking:server:deposit', data.AddAmount, data.BankId) 
    end
end)

RegisterNUICallback('CreateAccount', function(data)
     if IsNearAnyBank() or IsNearAtm() then
       TriggerServerEvent('pepe-banking:server:create:account', data.Name, data.Type)
    end
end)

RegisterNUICallback('AddUserToAccount', function(data)
     if IsNearAnyBank() or IsNearAtm() then
       TriggerServerEvent('pepe-banking:server:add:user', data.BankId, data.TargetBsn)
    end
end)

RegisterNUICallback('DeleteFromAccount', function(data)
     if IsNearAnyBank() or IsNearAtm() then
       TriggerServerEvent('pepe-banking:server:remove:user', data.BankId, data.TargetBsn)
     end
end)

RegisterNUICallback('DeleteAccount', function(data)
    if IsNearAnyBank() or IsNearAtm() then
        TriggerServerEvent('pepe-banking:server:remove:account', data.BankId)
      end
end)

RegisterNUICallback('GetTransactions', function(data)
    if IsNearAnyBank() or IsNearAtm() then
        Framework.Functions.TriggerCallback('pepe-banking:server:get:account:transactions', function(Transactions)
         SendNUIMessage({
           action = 'SetupTransaction',
           transaction = Transactions,
         })    
        end, data.BankId)
    end
end)

RegisterNUICallback('GetPersonalBalance', function(data, cb)
    local Player = Framework.Functions.GetPlayerData()
    local Data = {
        Balance = Player.money['bank'],
        BankId = Player.charinfo.account,
        CitizenId = Player.citizenid,
        Name = Player.charinfo.firstname..' '.. Player.charinfo.lastname,
    }
    cb(Data)
end)

RegisterNUICallback('GetSharedAccounts', function(data, cb)
    Framework.Functions.TriggerCallback('pepe-banking:server:get:shared:account', function(Accounts)
        cb(Accounts)
    end)  
end)

RegisterNUICallback('GetPrivateAcounts', function(data, cb)
    Framework.Functions.TriggerCallback('pepe-banking:server:get:private:account', function(Accounts)
        cb(Accounts)
    end)  
end)

RegisterNUICallback('CloseApp', function()
    SetNuiFocus(false, false)
    TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_atm@male@exit", "exit", 1.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Framework.Functions.Progressbar("bank", "Retrieving card..", 5000, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        ClearPedTasks(PlayerPedId())
    end, function()
        Framework.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNUICallback('GetAccountUsers', function(data)
    Framework.Functions.TriggerCallback('pepe-banking:server:get:account:users', function(Accounts)
        SendNUIMessage({
          action = 'SetupUsers',
          accounts = Accounts,
          citizenid = Framework.Functions.GetPlayerData().citizenid,
        })    
    end, data.BankId)
end)

RegisterNetEvent('pepe-banking:client:check:players:near')
AddEventHandler('pepe-banking:client:check:players:near', function(TargetPlayer, Amount)
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    if Player ~= -1 and Distance < 3.0 then
        if GetPlayerServerId(Player) == TargetPlayer then
            --exports['pepe-assets']:RequestAnimationDict('friends@laf@ig_5')
            TaskPlayAnim(PlayerPedId(), 'friends@laf@ig_5', 'nephew', 5.0, 1.0, 5.0,48, 0.0, 0, 0, 0)
            TriggerServerEvent('pepe-banking:server:give:cash', TargetPlayer, Amount) 
        else
            Framework.Functions.Notify("This is not the correct citizen..", "error")
        end
    else
        Framework.Functions.Notify("No citizen found..", "error")
    end
end)

function OpenBank(CanDeposit, UseAnim)
    --['pepe-assets']:RequestAnimationDict('amb@prop_human_atm@male@idle_a')
    --exports['pepe-assets']:RequestAnimationDict('amb@prop_human_atm@male@exit')
    TaskPlayAnim(GetPlayerPed(-1), "amb@prop_human_atm@male@idle_a", "idle_b", 1.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Framework.Functions.Progressbar("bank", "Inserting card..", 4500, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openbank',
            candeposit = CanDeposit,
            chardata = Framework.Functions.GetPlayerData(),
        })
    end, function()
        Framework.Functions.Notify("Cancelled..", "error")
    end)
end

function IsNearAtm()
    local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
    for k, v in pairs(Config.AtmObject) do
        local AtmObject = GetClosestObjectOfType(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 3.0, v, false, 0, 0)
        local ObjectCoords = GetEntityCoords(AtmObject)
        local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, ObjectCoords.x, ObjectCoords.y, ObjectCoords.z, true)
        if Distance < 2.0 then
            return true
        end
    end
end

function IsNearAnyBank()
    return true
end

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz       = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end


--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        if LoggedIn then
            IsNearBank = false
            for k, v in pairs(Config.Banks) do
                local PlayerCoords = GetEntityCoords(GetPlayerPed(-1))
                local Distance = GetDistanceBetweenCoords(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, v['X'], v['Y'], v['Z'], true)
                if Distance < 2.5 then
                    IsNearBank = true
                    if v['IsOpen'] then
                        DrawMarker(2, v['X'], v['Y'], v['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 48, 255, 58, 255, false, false, false, 1, false, false, false)
                        DrawText3Ds(v['X'], v['Y'], v['Z'] + 0.3, '~g~E ~s~- Insert card')
                        if IsControlJustPressed(1, 54) then
                            OpenBank(true)
                        end
                    else
                        CanOpenBank = false
                        DrawMarker(2, v['X'], v['Y'], v['Z'], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 72, 48, 255, false, false, false, 1, false, false, false)
                    end
                end
            end
            if not IsNearBank then
                Citizen.Wait(1500)
            end
        end
    end
end)]]


-- Check if player is near an atm
function IsNearATM()
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    for k, v in pairs(ATMObjects) do
        local closestObj = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 3.0, v, false, 0, 0)
        local objCoords = GetEntityCoords(closestObj)
        if closestObj ~= 0 then
            local dist = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, objCoords.x, objCoords.y, objCoords.z, true)
            if dist <= 2 then
                return true
            end
        end
    end
    return false
end

-- Check if player is in a vehicle
function IsInVehicle()
    local ply = GetPlayerPed(-1)
    if IsPedSittingInAnyVehicle(ply) then
        return true
    else
        return false
    end
end

-- Check if player is near a bank
function IsNearBank()
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    for _, item in pairs(banks) do
        local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
        if(distance <= 2) then
            return true
        end
    end
end
bankOpen = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)

        inRange = false

        local pos = GetEntityCoords(GetPlayerPed(-1))

        if(IsNearBank()) then
            inRange = true
            DrawText3Ds(pos.x, pos.y, pos.z, '[E] Insert Card')
            if IsControlJustPressed(1, 54)  then
                if (IsInVehicle()) then
                    PRPCore.Functions.Notify('Action not possible..', 'error')
                else
                    OpenBank(true)
                    bankOpen = true
                end
            end
        --elseif IsNearATM() then
        --    inRange = true
        --    DrawText3Ds(pos.x, pos.y, pos.z, '[E] Insert Card')
        --    if IsControlJustPressed(1, 54)  then
        --        if (IsInVehicle()) then
        --            PRPCore.Functions.Notify('Action not possible..', 'error')
        --        else
        --            OpenBank(false)
        --            bankOpen = true
        --        end
        --    end
        else
            CanOpenBank = false
        end

        if not inRange then
            Citizen.Wait(1500)
        end
    end
end)