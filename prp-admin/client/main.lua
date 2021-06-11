PRPCore = nil
loaded = false

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

--- CODE

PRPAdmin = {}
PRPAdmin.Functions = {}
in_noclip_mode = false

PRPAdmin.Functions.DrawText3D = function(x, y, z, text, lines)
    -- Amount of lines default 1 test
    if lines == nil then
        lines = 1
    end

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
    DrawRect(0.0, 0.0+0.0125 * lines, 0.017+ factor, 0.03 * lines, 0, 0, 0, 75)
    ClearDrawOrigin()
end


local globaplayers = {}
Citizen.CreateThread(function()
    while true do
        if myPermissionRank ~= "user" then
            Wait(5000)
            getPlayers()
        else
            Wait(10000)
        end
    end
end)


GetPlayersFromCoords = function()
    local closePlayers = {}
    coords = GetEntityCoords(GetPlayerPed(-1))
    for _, player in pairs(globaplayers) do
		local targetCoords = player.coords
		local targetdistance = #(targetCoords- vector3(coords.x, coords.y, coords.z))
		if targetdistance <= 5.0 then
			table.insert(closePlayers, player)
		end
    end
    return closePlayers
end

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    loaded = true
    TriggerServerEvent("prp-admin:server:loadPermissions")
end)

AvailableWeatherTypes = {
    {label = "Extra Sunny",         weather = 'EXTRASUNNY',}, 
    {label = "Clear",               weather = 'CLEAR',}, 
    {label = "Neutral",             weather = 'NEUTRAL',}, 
    {label = "Smog",                weather = 'SMOG',}, 
    {label = "Foggy",               weather = 'FOGGY',}, 
    {label = "Overcast",            weather = 'OVERCAST',}, 
    {label = "Clouds",              weather = 'CLOUDS',}, 
    {label = "Clearing",            weather = 'CLEARING',}, 
    {label = "Rain",                weather = 'RAIN',}, 
    {label = "Thunder",             weather = 'THUNDER',}, 
    {label = "Snow",                weather = 'SNOW',}, 
    {label = "Blizzard",            weather = 'BLIZZARD',}, 
    {label = "Snowlight",           weather = 'SNOWLIGHT',}, 
    {label = "XMAS (Heavy Snow)",   weather = 'XMAS',}, 
    {label = "Halloween (Scarry)",  weather = 'HALLOWEEN',},
}

BanTimes = {
    [1] = 3600,
    [2] = 21600,
    [3] = 43200,
    [4] = 86400,
    [5] = 259200,
    [6] = 604800,
    [7] = 2678400,
    [8] = 8035200,
    [9] = 16070400,
    [10] = 32140800,
    [11] = 99999999999,
}

ServerTimes = {
    [1] = {hour = 0, minute = 0},
    [2] = {hour = 1, minute = 0},
    [3] = {hour = 2, minute = 0},
    [4] = {hour = 3, minute = 0},
    [5] = {hour = 4, minute = 0},
    [6] = {hour = 5, minute = 0},
    [7] = {hour = 6, minute = 0},
    [8] = {hour = 7, minute = 0},
    [9] = {hour = 8, minute = 0},
    [10] = {hour = 9, minute = 0},
    [11] = {hour = 10, minute = 0},
    [12] = {hour = 11, minute = 0},
    [13] = {hour = 12, minute = 0},
    [14] = {hour = 13, minute = 0},
    [15] = {hour = 14, minute = 0},
    [16] = {hour = 15, minute = 0},
    [17] = {hour = 16, minute = 0},
    [18] = {hour = 17, minute = 0},
    [19] = {hour = 18, minute = 0},
    [20] = {hour = 19, minute = 0},
    [21] = {hour = 20, minute = 0},
    [22] = {hour = 21, minute = 0},
    [23] = {hour = 22, minute = 0},
    [24] = {hour = 23, minute = 0},
}

PermissionLevels = {
    [1] = {rank = "user", label = "User"},
    [2] = {rank = "admin", label = "Admin"},
    [3] = {rank = "god", label = "God"},
}

isNoclip = false
isFreeze = false
isSpectating = false
isSpectatingNew = false
isWatching = false
-- isWatchingAll = false
showNames = false
showBlips = false
isInvisible = false
deleteLazer = false
banLazer = false
hasGodmode = false
superSpeed = false

lastSpectateCoord = nil
myPermissionRank = "user"

local InSpectatorMode	= false
local TargetSpectate	= nil
local LastPosition		= nil
local polarAngleDeg		= 0;
local azimuthAngleDeg	= 90;
local radius			= -3.5;
local cam 				= nil

function getPlayers()
    PRPCore.Functions.TriggerCallback('PRPCore:GetPlayersLoopAndNames', function(data)
        globaplayers = {}
        for _, player in ipairs(data) do
            table.insert(globaplayers, {
                ['ped'] = GetPlayerPed(GetPlayerFromServerId(tonumber(player['player']))),
                ['name'] = player['name'],
                ['serverid'] = tonumber(player['player']),
                ['coords'] =  player['coords'],

            })
        end
        table.sort(globaplayers, function(a,b) return a.serverid < b.serverid end)
    end)
end

--function getPlayers() -- non infinity
--    players = {}
--    callback()
--
--        for _, player in ipairs(GetActivePlayers()) do
--            table.insert(players, {
--                ['ped'] = GetPlayerPed(player),
--                ['name'] = GetPlayerName(player),
--                ['id'] = player,
--                ['serverid'] = GetPlayerServerId(player),
--            })
--        end
--
--    table.sort(players, function(a,b) return a.serverid < b.serverid end)
--    return players
--end

RegisterNetEvent('prp-admin:client:openMenu')
AddEventHandler('prp-admin:client:openMenu', function(group)
    PRPCore.Functions.TriggerCallback("prp-admin:server:hasPermissions", function(bool)
        if bool then
            WarMenu.OpenMenu('admin')
            myPermissionRank = group
        else
            TriggerServerEvent('prp-cityhall:server:banPlayer')
            TriggerServerEvent("prp-log:server:CreateLog", "anticheat", "POST Request (Abuse)", "red", "** @everyone " ..GetPlayerName(PlayerId()).. "** is banned for attempting to trigger a menu.")
        end
    end, "admin")
end)


local currentPlayerMenu = nil
local currentPlayer = {}
local gotValues = false
local ownedVehicles = {}
local targetPlayerData = {}


Citizen.CreateThread(function()
    local menus = {
        "admin",
        "playerMan",
        "serverMan",
        currentPlayer,
        "playerOptions",
        "playerInfo",
        "teleportOptions",
        "permissionOptions",
        "weatherOptions",
        "adminOptions",
        "adminOpt",
        "selfOptions",
    }

    local bans = {
        "1 hour",
        "6 hour",
        "12 hour",
        "1 day",
        "3 days",
        "1 week",
        "1 month",
        "3 months",
        "6 months",
        "1 year",
        "Perm",
        "Self",
    }

    local times = {
        "00:00",
        "01:00",
        "02:00",
        "03:00",
        "04:00",
        "05:00",
        "06:00",
        "07:00",
        "08:00",
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
        "21:00",
        "22:00",
        "23:00",
    }

    local perms = {
        "User",
        "Admin",
        "God"
    }

    
    local currentBanIndex = 1
    local selectedBanIndex = 1

    local currentPermIndex = 1
    local selectedPermIndex = 1

    WarMenu.CreateMenu('admin', 'Passion Admin')
    WarMenu.CreateSubMenu('playerMan', 'admin')
    WarMenu.CreateSubMenu('serverMan', 'admin')
    WarMenu.CreateSubMenu('adminOpt', 'admin')
    WarMenu.CreateSubMenu('selfOptions', 'adminOpt')

    WarMenu.CreateSubMenu('weatherOptions', 'serverMan')


    for k, v in pairs(menus) do
        WarMenu.SetMenuX(v, 0.71)
        WarMenu.SetMenuY(v, 0.15)
        WarMenu.SetMenuWidth(v, 0.23)
        WarMenu.SetTitleColor(v, 255, 255, 255, 255)
        WarMenu.SetTitleBackgroundColor(v, 0, 0, 0, 111)
    end

    while true do
        if WarMenu.IsMenuOpened('admin') then
            WarMenu.MenuButton('Admin Options', 'adminOpt')
            WarMenu.MenuButton('Player Management', 'playerMan')
            WarMenu.MenuButton('Server Management', 'serverMan')

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('adminOpt') then
            WarMenu.MenuButton('Self Options', 'selfOptions')
            WarMenu.CheckBox("Show Player Names", showNames, function(checked) showNames = checked end)

            if myPermissionRank == "god" then
                if WarMenu.CheckBox("Show Player Blips", showBlips, function(checked) showBlips = checked end) then
                    TriggerServerEvent("prp-log:server:CreateLog", "admin", "Admin Action", "red", "**"..GetPlayerName(PlayerId()).."** toggled player blips")
                    toggleBlips()
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('selfOptions') then
            if WarMenu.CheckBox("Noclip", isNoclip, function(checked) isNoclip = checked end) then
                local target = GetPlayerServerId(PlayerId())
                TriggerServerEvent("prp-admin:server:togglePlayerNoclip", target)
            end

            if WarMenu.Button('Revive') then
                local target = GetPlayerServerId(PlayerId())
                TriggerServerEvent("prp-log:server:CreateLog", "admin", "Admin Action", "red", "**"..GetPlayerName(PlayerId()).."** revived "..GetPlayerName(target))
                TriggerServerEvent('prp-admin:server:revivePlayer', target)
            end

            if myPermissionRank == "admin" or  myPermissionRank == "god"  then
                if WarMenu.CheckBox("Invisible", isInvisible, function(checked) isInvisible = checked end) then
                    local myPed = GetPlayerPed(-1)
                    TriggerServerEvent("prp-log:server:CreateLog", "admin", "Admin Action", "red", "**"..GetPlayerName(PlayerId()).."** toggled invisible")
                    if isInvisible then
                        SetEntityVisible(myPed, false, false)
                    else
                        SetEntityVisible(myPed, true, false)
                    end
                end
            end

            if myPermissionRank == "god" then
                if WarMenu.CheckBox("Super Speed", superSpeed, function(checked) superSpeed = checked end) then
                    local myPed = GetPlayerPed(-1)
                    TriggerServerEvent("prp-log:server:CreateLog", "admin", "Admin Action", "red", "**"..GetPlayerName(PlayerId()).."** toggled superspeed")
                    if superSpeed then
                        SetRunSprintMultiplierForPlayer(PlayerId(),1.49) -- dont need to execute every tick
                        Citizen.CreateThread(function()
                            while true do  
                                Citizen.Wait(0) 
                                if superSpeed then
                                    SetPedMoveRateOverride(PlayerPedId(),2.0)   -- need to execute every tick
                                else
                                    SetPedMoveRateOverride(PlayerPedId(),1.0)   -- need to execute every tick
                                end
                            end
                        end)
                    else
                        SetRunSprintMultiplierForPlayer(PlayerId(),1.0) -- dont need to execute every tick
                    end
                end
            end

            if myPermissionRank == "god" then
                if WarMenu.CheckBox("Godmode", hasGodmode, function(checked) hasGodmode = checked end) then
                    local myPlayer = PlayerId()
                    TriggerServerEvent("prp-log:server:CreateLog", "admin", "Admin Action", "red", "**"..GetPlayerName(PlayerId()).."** toggled god mode")
                    SetPlayerInvincible(myPlayer, hasGodmode)
                end
            end

            if WarMenu.CheckBox("Delete Lazer", deleteLazer, function(checked) deleteLazer = checked end) then
            end

            if WarMenu.CheckBox("Ban Lazer (Experimental)", banLazer, function(checked) banLazer = checked end) then
            end
            
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('playerMan') then

            for k, v in pairs(globaplayers) do
                WarMenu.CreateSubMenu(v["serverid"], 'playerMan', v["serverid"].." | "..v["name"])
            end
            for k, v in pairs(globaplayers) do
                if WarMenu.MenuButton('#'..v["serverid"].." | "..v["name"], v["serverid"]) then
                    currentPlayer = v
                    print(currentPlayer)
                    print(currentPlayer.serverid)
                    if WarMenu.CreateSubMenu('playerOptions', currentPlayer.serverid) then
                        currentPlayerMenu = 'playerOptions'
                    elseif WarMenu.CreateSubMenu('teleportOptions', currentPlayer.serverid) then
                        currentPlayerMenu = 'teleportOptions'
                    elseif WarMenu.CreateSubMenu('adminOptions', currentPlayer.serverid) then
                        currentPlayerMenu = 'adminOptions'
                    end
                end
            end

            if myPermissionRank == "god" then
                if WarMenu.CreateSubMenu('permissionOptions', currentPlayer.serverid) then
                    currentPlayerMenu = 'permissionOptions'
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('serverMan') then
            WarMenu.MenuButton('Weather Options', 'weatherOptions')
            if WarMenu.ComboBox('Server time', times, currentBanIndex, selectedBanIndex, function(currentIndex, selectedIndex)
                currentBanIndex = currentIndex
                selectedBanIndex = selectedIndex
            end) then
                local time = ServerTimes[currentBanIndex]
                TriggerServerEvent("prp-weathersync:server:setTime", time.hour, time.minute)
            end
            
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened(currentPlayer.serverid) then
            currMenu = WarMenu.CurrentMenu()
            gotValues = false
            WarMenu.CreateSubMenu('playerInfo', currentPlayer.serverid)
            WarMenu.MenuButton('Info', 'playerInfo')

            if WarMenu.CheckBox("Watch", isWatching, function(checked) isWatching = checked end) then
                local targetPed = currentPlayer.ped

                TriggerServerEvent("prp-log:server:CreateLog", "admin", "Moderation", "red", "**"..GetPlayerName(PlayerId()).."** watched player "..currentPlayer.name)
                WatchPlayer(targetPed, isWatching)
            end

            if WarMenu.CheckBox("Spectate", isSpectating, function(checked) isSpectating = checked end) then
                --local target = GetPlayerFromServerId(currentPlayer)
                --local targetPed = GetPlayerPed(target)

                TriggerServerEvent("prp-log:server:CreateLog", "admin", "Moderation", "red", "**"..GetPlayerName(PlayerId()).."** spectated player "..currentPlayer.name)
                SpectatePlayer(currentPlayer, isSpectating)
            end

            if WarMenu.CheckBox("Spectate (new)", isSpectatingNew, function(checked) isSpectatingNew = checked end) then
                TriggerServerEvent("prp-log:server:CreateLog", "admin", "Moderation", "red", "**"..GetPlayerName(PlayerId()).."** spectated player "..currentPlayer.name)
                SpectatePlayerNew(currentPlayer, isSpectatingNew)
            end

            if WarMenu.MenuButton('Screenshot', currentPlayer.serverid) then
                TriggerServerEvent("prp-admin:TakeScreenshot", currentPlayer.serverid)
            end

            if WarMenu.MenuButton('Goto', currentPlayer.serverid) then

                local targetPed = currentPlayer.ped
                local targetcoords = currentPlayer.coords
                local ply = GetPlayerPed(-1)
                TriggerServerEvent("prp-log:server:CreateLog", "admin", "Player Action", "red", "**"..GetPlayerName(PlayerId()).."** TP'd to "..currentPlayer.name.."Coords: "..GetEntityCoords(targetPed))
                if in_noclip_mode then
                    turnNoClipOff()
                    SetEntityCoords(ply, targetcoords)
                    turnNoClipOn()
                else
                    SetEntityCoords(ply, targetcoords)
                end
            end

            if WarMenu.MenuButton('Bring', currentPlayer.serverid) then
                local target = currentPlayer.ped
                local plyCoords = GetEntityCoords(GetPlayerPed(-1))

                TriggerServerEvent("prp-log:server:CreateLog", "admin", "Player Action", "red", "**"..GetPlayerName(PlayerId()).."** brought "..currentPlayer.name.."Coords: "..GetEntityCoords(target))
                TriggerServerEvent('prp-admin:server:bringTp', currentPlayer.serverid, plyCoords)
            end

            if WarMenu.MenuButton('Revive', currentPlayer.serverid) then
                local target = currentPlayer.serverid
                TriggerServerEvent('prp-admin:server:revivePlayer', target)
            end

            if WarMenu.CheckBox("Noclip", isNoclip, function(checked) isNoclip = checked end) then
                local target = currentPlayer.serverid
                TriggerServerEvent("prp-admin:server:togglePlayerNoclip", target)
            end

            if WarMenu.CheckBox("Freeze", isFreeze, function(checked) isFreeze = checked end) then
                local target = currentPlayer.serverid
                TriggerServerEvent("prp-admin:server:Freeze", target, isFreeze)
            end

            if WarMenu.MenuButton("Open Inventory", currentPlayer.serverid) then
                local targetId = currentPlayer.serverid

                TriggerServerEvent("prp-log:server:CreateLog", "admin", "Moderation", "red", "**"..GetPlayerName(PlayerId()).."** opened inventory of "..currentPlayer.name)
                OpenTargetInventory(targetId)
            end
            
            if WarMenu.MenuButton('Kill', currentPlayer.serverid) then
                TriggerServerEvent("prp-admin:server:killPlayer", currentPlayer.serverid)
            end

            if WarMenu.MenuButton("Give Clothing Menu", currentPlayer.serverid) then
                local targetId = currentPlayer.serverid
                TriggerServerEvent("prp-admin:server:skin", targetId)
            end

            
            if myPermissionRank == "god" then
                WarMenu.MenuButton('Permission Options', 'permissionOptions')
            end

            if WarMenu.ComboBox('Ban Length', bans, currentBanIndex, selectedBanIndex, function(currentIndex, selectedIndex)
                currentBanIndex = currentIndex
                selectedBanIndex = selectedIndex
            end) then
                local time = BanTimes[currentBanIndex]
                local index = currentBanIndex
                if index == 12 then
                    DisplayOnscreenKeyboard(1, "Time", "", "Length", "", "", "", 128 + 1)
                    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                        Citizen.Wait(7)
                    end
                    time = tonumber(GetOnscreenKeyboardResult())
                    time = time * 3600
                end
                DisplayOnscreenKeyboard(1, "Reason", "", "Reason", "", "", "", 128 + 1)
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(7)
				end
                local reason = GetOnscreenKeyboardResult()
                if reason ~= nil and reason ~= "" and time ~= 0 then
                    local target = currentPlayer.serverid
                    TriggerServerEvent("prp-admin:server:banPlayer", target, time, reason)
                end
            end
            if WarMenu.MenuButton('Kick', currentPlayer.serverid) then
                DisplayOnscreenKeyboard(1, "Reason", "", "Reason", "", "", "", 128 + 1)
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(7)
				end
                local reason = GetOnscreenKeyboardResult()
                if reason ~= nil and reason ~= "" then
                    local target = currentPlayer.serverid
                    TriggerServerEvent("prp-admin:server:kickPlayer", target, reason)
                end
            end

            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('permissionOptions') then
            if WarMenu.ComboBox('Permission Group', perms, currentPermIndex, selectedPermIndex, function(currentIndex, selectedIndex)
                currentPermIndex = currentIndex
                selectedPermIndex = selectedIndex
            end) then
                local group = PermissionLevels[currentPermIndex]
                local target = currentPlayer.serverid

                TriggerServerEvent('prp-admin:server:setPermissions', target, group)

                PRPCore.Functions.Notify('You changed '..currentPlayer.name..'\'s group to  '..group.label)
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('weatherOptions') then
            for k, v in pairs(AvailableWeatherTypes) do
                if WarMenu.MenuButton(AvailableWeatherTypes[k].label, 'weatherOptions') then
                    TriggerServerEvent('prp-weathersync:server:setWeather', AvailableWeatherTypes[k].weather)
                    PRPCore.Functions.Notify('Weather changed to: '..AvailableWeatherTypes[k].label)
                end
            end
            
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('playerInfo') then
            local timeout = 5 * 1000 -- 5 seconds
            local error = false
            if not gotValues then
                targetPlayerData = nil
                targetPlayerData = GetServerPlayerData(currentPlayer.serverid)
                ownedVehicles = nil
                ownedVehicles = GetOwnedVehiclesAmount(currentPlayer.serverid)
                gotValues = true
            end
            while targetPlayerData == {} or targetPlayerData == nil do
                Citizen.Wait(1000)
                timeout = timeout -1000
                if timeout <= 0 then
                    break
                end
            end
            if targetPlayerData == nil or targetPlayerData == {} then
                PRPCore.Functions.Notify('there has been an error getting the player data')
                TriggerEvent('chatMessage', "Admin menu", "error", 'There has been an error getting the player data, are you sure he is online?')
                error = true
            end
            if not error then
                local playerInfo = {
                    ['Account info'] = {
                        ['Server Id'] = currentPlayer.serverid,
                        ['Steam name'] = targetPlayerData.name,
                        ['Steam identifier'] = targetPlayerData.steam,
                        ['FiveM identifier'] = targetPlayerData.license,
                    },
                    ['Character info'] = {
                        ['Character name'] = '' .. targetPlayerData.charinfo.firstname .. ' '..  targetPlayerData.charinfo.lastname,
                        ['Play time'] = targetPlayerData.metadata["playtime"] or 'Unknown',
                        ['Gender'] = targetPlayerData.charinfo.gender ~= nil and targetPlayerData.charinfo.gender or 'Unknown',
                        ['Phone'] = targetPlayerData.charinfo.phone ~= nil and targetPlayerData.charinfo.phone or 'Unknown',
                        ['Job'] = ''.. targetPlayerData.job.name.. ' - '.. targetPlayerData.job.grade.label,
                        ['Salary'] = targetPlayerData.job.payment ~= nil and targetPlayerData.job.payment or 0,
                        ['Cash'] = targetPlayerData.money.cash ~=nil and targetPlayerData.money.cash or 0,
                        ['Bank'] = targetPlayerData.money.bank ~= nil and targetPlayerData.money.bank or 0,
                        ['Crypto'] = targetPlayerData.money.crypto ~= nil and targetPlayerData.money.crypto or 0,
                        ['Owned vehicles'] = ownedVehicles.Cars~= nil and ownedVehicles.Cars or 0,
                        ['Owned boats'] = ownedVehicles.Boats ~= nil and ownedVehicles.Boats or 0,
                    },
                }
                local gender
                if playerInfo['Character info']['Gender'] == 0 then
                    gender = 'Male'
                elseif playerInfo['Character info']['Gender'] == 1 then
                    gender = 'Female'
                end
                WarMenu.Button('---Account info---')
                WarMenu.Button('Player: #'.. playerInfo['Account info']['Server Id'].. ' '.. playerInfo['Account info']['Steam name'])
                WarMenu.Button(playerInfo['Account info']['Steam identifier'])
                if WarMenu.Button('Show FiveM License') then
                    TriggerEvent('chatMessage', "Player License", "normal", playerInfo["Account info"]["FiveM identifier"])
                end
                WarMenu.Button('---Character info---')
                WarMenu.Button('Name: '.. playerInfo['Character info']['Character name'])
                WarMenu.Button('Play Time: '.. playerInfo['Character info']['Play time'].." mins")
                WarMenu.Button('Gender: ' .. gender)
                WarMenu.Button('Phone Number: ' .. playerInfo['Character info']['Phone'])
                WarMenu.Button('Job: ' .. playerInfo['Character info']['Job'])
                WarMenu.Button('Salary: ' .. playerInfo['Character info']['Salary'])
                WarMenu.Button('Cash: ' .. playerInfo['Character info']['Cash'])
                WarMenu.Button('Bank: ' .. playerInfo['Character info']['Bank'])
                WarMenu.Button('Crypto: ' .. playerInfo['Character info']['Crypto'])
                WarMenu.Button('Owned vehicles: ' .. playerInfo['Character info']['Owned vehicles'])
                WarMenu.Button('Owned boats: ' .. playerInfo['Character info']['Owned boats'])
                WarMenu.Display()
            else
                WarMenu.CloseMenu()
            end
        end

        Citizen.Wait(3)
    end
end)

function SpectatePlayerNew(target, toggle)

    if toggle then
        if not InSpectatorMode then
            LastPosition = GetEntityCoords(GetPlayerPed(-1))
        end

        local playerPed = GetPlayerPed(-1)

        SetEntityCollision(playerPed, false, false)
        SetEntityVisible(playerPed, false)


        Citizen.CreateThread(function()

            if not DoesCamExist(cam) then
                cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
            end

            SetCamActive(cam, true)
            RenderScriptCams(true, false, 0, true, true)

            InSpectatorMode = true
            TargetSpectate  = target

        end)
    else
        resetNormalCamera()
    end

end

Citizen.CreateThread(function()
    while true do
      Wait(0)
      if InSpectatorMode then

        local targetPlayerId = GetPlayerPed(GetPlayerFromServerId(TargetSpectate.serverid))
        local playerPed	  = PlayerPedId()
        local targetPed	  = GetPlayerPed(TargetSpectate.serverid)
        --local coords	 = GetEntityCoords(targetPed)
        local coords = TargetSpectate.coords

        --print(targetPlayerId, targetPed, coords)
        --   for _, i in ipairs(GetActivePlayers()) do
        --       if i ~= PlayerId() then
        --           local otherPlayerPed = GetPlayerPed(i)
        --           SetEntityNoCollisionEntity(playerPed,  otherPlayerPed,  true)
        --           SetEntityVisible(playerPed, false)
        --       end
        --   end

          if IsControlPressed(2, 241) then
              radius = radius + 2.0;
          end

          if IsControlPressed(2, 242) then
              radius = radius - 2.0;
          end

          if radius > -1 then
              radius = -1
          end

          local xMagnitude = GetDisabledControlNormal(0, 1);
          local yMagnitude = GetDisabledControlNormal(0, 2);

          polarAngleDeg = polarAngleDeg + xMagnitude * 10;

          if polarAngleDeg >= 360 then
              polarAngleDeg = 0
          end

          azimuthAngleDeg = azimuthAngleDeg + yMagnitude * 10;

          if azimuthAngleDeg >= 360 then
              azimuthAngleDeg = 0;
          end

          local nextCamLocation = polar3DToWorld3D(coords, radius, polarAngleDeg, azimuthAngleDeg)

          SetCamCoord(cam,  nextCamLocation.x,  nextCamLocation.y,  nextCamLocation.z)

          PointCamAtEntity(cam,  targetPed)
          SetEntityCoords(playerPed,  coords.x, coords.y, coords.z + 8)
          
          local text = {}
          local targetGod = GetPlayerInvincible(targetPlayerId)
          if targetGod then
              table.insert(text,"Godmode: ~r~Found~w~")
          else
              table.insert(text,"Godmode: ~g~Not Found~w~")
          end

          table.insert(text,"Health: "..GetEntityHealth(targetPed).."/"..GetEntityMaxHealth(targetPed))
          table.insert(text,"Armor: "..GetPedArmour(targetPed))

          for i,theText in pairs(text) do
              SetTextFont(0)
              SetTextProportional(1)
              SetTextScale(0.0, 0.30)
              SetTextDropshadow(0, 0, 0, 0, 255)
              SetTextEdge(1, 0, 0, 0, 255)
              SetTextDropShadow()
              SetTextOutline()
              SetTextEntry("STRING")
              AddTextComponentString(theText)
              EndTextCommandDisplayText(0.3, 0.7+(i/30))
          end
      end
    end
end)


function SpectatePlayer(target, toggle)
    if toggle then
        local myPed = GetPlayerPed(-1)
        lastSpectateCoord = GetEntityCoords(myPed)
        showNames = true

        NetworkConcealPlayer(PlayerId(), true, false)
        --GetOffsetFromEntityInWorldCoords(targetPed, 0.0, 0.45, 0.0)
        SetEntityCoords(myPed, target.coords)
        local coords = vector3(target.coords.x,target.coords.y,target.coords.z)
        SetEntityCoords(myPed, coords.x, coords.y, coords.z)
        Wait(250)
        target.ped = GetPlayerPed(GetPlayerFromServerId(target.serverid))

        if myPed == target.ped then
            PRPCore.Functions.Notify('You cannot spectate yourself dont crash yourself please.')
            NetworkConcealPlayer(PlayerId(), false, false)
            SetEntityInvincible(myPed, false)
            lastSpectateCoord = nil
            return
        end
        SetEntityInvincible(myPed, true)
        AttachEntityToEntity(myPed, target.ped, 11816, 0.0, -1.3, 1.0, 0.0, 0.0, 0.0, false, false, true, false, 2, true)

    else
        local myPed = GetPlayerPed(-1)
        showNames = false
        DetachEntity(myPed, true, false)
        SetEntityInvincible(myPed, false)
        SetEntityCoords(GetPlayerPed(-1), lastSpectateCoord)
        Wait(500)
        NetworkConcealPlayer(PlayerId(), false, false)
        lastSpectateCoord = nil
        target.ped = nil
    end
end

function WatchPlayer(targetPed, toggle)
    local myPed = GetPlayerPed(-1)


    if toggle then
        RequestCollisionAtCoord(GetEntityCoords(myPed))
        NetworkSetInSpectatorMode(true, targetPed)
    else
        RequestCollisionAtCoord(GetEntityCoords(myPed))
        NetworkSetInSpectatorMode(false, targetPed)
    end
end


function OpenTargetInventory(targetId)
    WarMenu.CloseMenu()

    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", targetId)
end

Citizen.CreateThread(function()
    while true do

        if showNames then
            for _, player in pairs(GetPlayersFromCoords()) do
                local PlayerId = player.serverid
                local PlayerName = player.name
                local PlayerCoords = player.coords
                PRPAdmin.Functions.DrawText3D(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z + 1.0, '['..PlayerId..'] '..PlayerName)
            end
        else
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)

local PlayerBlips = {}

function toggleBlips()
    Citizen.CreateThread(function()
        -- while true do

            if showBlips then


                for k, v in pairs(globaplayers) do
                    local playerPed = v["ped"]
                    local playerName = v["name"]

                    RemoveBlip(PlayerBlips[k])
                    local PlayerBlip = AddBlipForCoord(v.coords)
                    --local PlayerBlip = AddBlipForEntity(playerPed)

                    SetBlipSprite(PlayerBlip, 1)
                    SetBlipColour(PlayerBlip, 0)
                    SetBlipScale  (PlayerBlip, 0.75)
                    SetBlipAsShortRange(PlayerBlip, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString('['..v["serverid"]..'] '..playerName)
                    EndTextCommandSetBlipName(PlayerBlip)
                    PlayerBlips[k] = PlayerBlip
                end
            else
                if next(PlayerBlips) ~= nil then
                    for k, v in pairs(PlayerBlips) do
                        RemoveBlip(PlayerBlips[k])
                    end
                    PlayerBlips = {}
                end
                Citizen.Wait(1000)
            end
    end)
end

Citizen.CreateThread(function()
    while true do
        if showBlips then
            if next(PlayerBlips) ~= nil then
                for k, v in pairs(PlayerBlips) do
                    RemoveBlip(PlayerBlips[k])
                end
                PlayerBlips = {}
            end
            for k, v in pairs(globaplayers) do
                local playerPed = v["ped"]
                local playerName = v["name"]

                RemoveBlip(PlayerBlips[k])
                local PlayerBlip = AddBlipForCoord(v.coords)
                --local PlayerBlip = AddBlipForEntity(playerPed)

                SetBlipSprite(PlayerBlip, 1)
                SetBlipColour(PlayerBlip, 0)
                SetBlipScale  (PlayerBlip, 0.75)
                SetBlipAsShortRange(PlayerBlip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('['..v["serverid"]..'] '..playerName)
                EndTextCommandSetBlipName(PlayerBlip)
                PlayerBlips[k] = PlayerBlip
            end
            --print('blip updated!')
        else
            if next(PlayerBlips) ~= nil then
                for k, v in pairs(PlayerBlips) do
                    RemoveBlip(PlayerBlips[k])
                end
                PlayerBlips = {}
            end
        end

        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()	
	while true do
		Citizen.Wait(0)

        if deleteLazer then
            local color = {r = 255, g = 255, b = 255, a = 200}
            local position = GetEntityCoords(GetPlayerPed(-1))
            local hit, coords, entity = RayCastGamePlayCamera(1000.0)
            
            -- If entity is found then verifie entity
            if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                local entityCoord = GetEntityCoords(entity)
                local minimum, maximum = GetModelDimensions(GetEntityModel(entity))
                
                DrawEntityBoundingBox(entity, color)
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                PRPAdmin.Functions.DrawText3D(entityCoord.x, entityCoord.y, entityCoord.z, "Obj: " .. entity .. " Model: " .. GetEntityModel(entity).. " \nPress [~g~E~s~] to delete object!", 2)

                -- When E pressed then remove targeted entity
                if IsControlJustReleased(0, 38) then
                    -- Set as missionEntity so the object can be remove (Even map objects)
                    SetEntityAsMissionEntity(GetVehiclePedIsIn(entity, true), 1, 1)
                    DeleteEntity(GetVehiclePedIsIn(entity, true))
                    SetEntityAsMissionEntity(entity, 1, 1)
                    DeleteEntity(entity)
                end
            -- Only draw of not center of map
            elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
                -- Draws line to targeted position
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
            end
        else
            Citizen.Wait(1000)
        end
	end
end)

Citizen.CreateThread(function()	
	while true do
		Citizen.Wait(0)

        if banLazer then
            local color = {r = 255, g = 255, b = 255, a = 200}
            local position = GetEntityCoords(GetPlayerPed(-1))
            local hit, coords, entity = RayCastGamePlayCamera(1000.0)
            
            -- If entity is found then verifie entity
            if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                local entityCoord = GetEntityCoords(entity)
                local minimum, maximum = GetModelDimensions(GetEntityModel(entity))
                
                DrawEntityBoundingBox(entity, color)
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                PRPAdmin.Functions.DrawText3D(entityCoord.x, entityCoord.y, entityCoord.z, "Obj: " .. entity .. " Model: " .. GetEntityModel(entity).. " \nPress [~g~E~s~] to perma ban!", 2)

                local playerId = GetPlayerServerId(entity)

                if playerId ~= nil and playerId ~= 0 and playerId ~= "" then
                    -- When E pressed then remove targeted entity
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("prp-admin:server:banPlayer", playerId, 2147483647, "NOT HERE TO RP")
                    end
                end
            -- Only draw of not center of map
            elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
                -- Draws line to targeted position
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
            end
        else
            Citizen.Wait(1000)
        end
	end
end)

-- Draws boundingbox around the object with given color parms
function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim = 
	{ 
		x = 0.5*(max.x - min.x), 
		y = 0.5*(max.y - min.y), 
		z = 0.5*(max.z - min.z)
	}

    local FUR = 
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x, 
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y, 
		z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL = 
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 = 
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 = 
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 = 
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 = 
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 = 
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 = 
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

-- Embed direction in rotation vector
function RotationToDirection(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = 
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

-- Raycast function for "Admin Lazer"
function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination = 
	{ 
		x = cameraCoord.x + direction.x * distance, 
		y = cameraCoord.y + direction.y * distance, 
		z = cameraCoord.z + direction.z * distance 
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

RegisterNetEvent('prp-admin:client:bringTp')
AddEventHandler('prp-admin:client:bringTp', function(coords)
    local ped = GetPlayerPed(-1)

    SetEntityCoords(ped, coords.x, coords.y, coords.z)
end)

RegisterNetEvent('prp-admin:client:fsdaf')
AddEventHandler('prp-admin:client:fsdaf', function(coords)
    if not HasNamedPtfxAssetLoaded("core") then
        RequestNamedPtfxAsset("core")
        while not HasNamedPtfxAssetLoaded("core") do
            Wait(1)
        end
    end
    
    UseParticleFxAssetNextCall("core")
    local part = StartParticleFxLoopedAtCoord("ent_amb_fbi_smoke_stair_gather", coords.x, coords.y, coords.z-0.5, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(5000)
    StopParticleFxLooped(part)
end)

RegisterNetEvent('prp-admin:client:Freeze')
AddEventHandler('prp-admin:client:Freeze', function(toggle)
    local ped = GetPlayerPed(-1)

    local veh = GetVehiclePedIsIn(ped)

    if veh ~= 0 then
        FreezeEntityPosition(ped, toggle)
        FreezeEntityPosition(veh, toggle)
    else
        FreezeEntityPosition(ped, toggle)
    end
end)

RegisterNetEvent('prp-admin:client:SendReport')
AddEventHandler('prp-admin:client:SendReport', function(name, src, msg)
    TriggerServerEvent('prp-admin:server:SendReport', name, src, msg)
end)

RegisterNetEvent('prp-admin:client:SendStaffChat')
AddEventHandler('prp-admin:client:SendStaffChat', function(name, msg)
    TriggerServerEvent('prp-admin:server:StaffChatMessage', name, msg)
end)

-- Screenshot menu 
RegisterNetEvent("prp-admin:CaptureScreenshot")
AddEventHandler('prp-admin:CaptureScreenshot', function(toggle, url, field)
	exports['screenshot-basic']:requestScreenshotUpload('https://api.awau.moe/upload/pomf/associated?key=57a9e212-e462-41db-b7c6-5f5e0a795138&url=passion.is-fi.re', GetConvar("ea_screenshotfield", 'files[]'), function(data)
			TriggerServerEvent("prp-admin:TookScreenshot", data)
	end)
end)

RegisterNetEvent('prp-admin:client:GiveNuiFocus')
AddEventHandler('prp-admin:client:GiveNuiFocus', function(focus, mouse)
    SetNuiFocus(focus, mouse)
end)

RegisterNetEvent('prp-admin:client:SetModel')
AddEventHandler('prp-admin:client:SetModel', function(skin)
    local ped = GetPlayerPed(-1)
    local model = GetHashKey(skin)
    SetEntityInvincible(ped, true)

    if IsModelInCdimage(model) and IsModelValid(model) then
        LoadPlayerModel(model)
        SetPlayerModel(PlayerId(), model)

        if isPedAllowedRandom() then
            SetPedRandomComponentVariation(ped, true)
        end
        
		SetModelAsNoLongerNeeded(model)
	end
	SetEntityInvincible(ped, false)
end)

function LoadPlayerModel(skin)
    RequestModel(skin)
    while not HasModelLoaded(skin) do
        
        Citizen.Wait(0)
    end
end


function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(7)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.40, 0.00)
end

function GetOwnedVehiclesAmount(id)
    local rtval = {}
    PRPCore.Functions.TriggerCallback('prp-admin:GetOwnedVehiclesAmount', function(amounts)
        if amounts.numberOfCars ~= nil then
            rtval.Cars = amounts.numberOfCars
        else
            rtval.Cars = 'None'
        end
        if amounts.numberOfBoats ~= nil then
            rtval.Boats = amounts.numberOfBoats
        else
            rtval.Boats = 'None'
        end
    end, id)
    Wait(250)
    return rtval
end

function GetServerPlayerData(id)
    local rtval = nil
    PRPCore.Functions.TriggerCallback('prp-admin:GetPlayerData', function(targetData)
        rtval = targetData
    end, id)
    Wait(250)
    return rtval
end

RegisterNetEvent('prp-weapons:client:SetWeaponAmmoManual')
AddEventHandler('prp-weapons:client:SetWeaponAmmoManual', function(weapon, ammo)
    local ped = GetPlayerPed(-1)
    if weapon ~= "current" then
        local weapon = weapon:upper()
        SetPedAmmo(ped, GetHashKey(weapon), ammo)
        PRPCore.Functions.Notify('+'..ammo..' Ammo Set '..PRPCore.Shared.Weapons[GetHashKey(weapon)]["label"], 'success')
    else
        local weapon = GetSelectedPedWeapon(ped)
        if weapon ~= nil then
            SetPedAmmo(ped, weapon, ammo)
            PRPCore.Functions.Notify('+'..ammo..' Ammo Set '..PRPCore.Shared.Weapons[weapon]["label"], 'success')
        else
            PRPCore.Functions.Notify('You dont have a weapon..', 'error')
        end
    end
end)

RegisterNetEvent('prp-admin:listplates')
AddEventHandler('prp-admin:listplates', function(t)
    for _, e in pairs(t) do
        print("====================")
        for k, v in pairs(e) do
            if k == "vehicle" or k == "state" or k == "garage" or k == "plate" then 
                print(v)
            end
        end
    end
end)

RegisterNetEvent('prp-admin:listbans')
AddEventHandler('prp-admin:listbans', function(t)
    for _, e in pairs(t) do
        print("====================")
        for k, v in pairs(e) do
            print(v)
        end
    end
end)

RegisterNetEvent('prp-admin:client:SaveCar')
AddEventHandler('prp-admin:client:SaveCar', function()
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped)

    if veh ~= nil and veh ~= 0 then
        local plate = GetVehicleNumberPlateText(veh)
        local props = PRPCore.Functions.GetVehicleProperties(veh)
        local hash = props.model
        if PRPCore.Shared.VehicleModels[hash] ~= nil and next(PRPCore.Shared.VehicleModels[hash]) ~= nil then
            TriggerServerEvent('prp-admin:server:SaveCar', props, PRPCore.Shared.VehicleModels[hash], GetHashKey(veh), plate)
        else
            PRPCore.Functions.Notify('You cannot put this vehicle in your garage..', 'error')
        end
    else
        PRPCore.Functions.Notify('You are not in a vehicle..', 'error')
    end
end)

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

 function resetNormalCamera()
	InSpectatorMode = false
	TargetSpectate  = nil
	local playerPed = GetPlayerPed(-1)

	SetCamActive(cam,  false)
	RenderScriptCams(false, false, 0, true, true)

	SetEntityCollision(playerPed, true, true)
	SetEntityVisible(playerPed, true)
	SetEntityCoords(playerPed, LastPosition.x, LastPosition.y, LastPosition.z)
end

function polar3DToWorld3D(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
	-- convert degrees to radians
	local polarAngleRad   = polarAngleDeg   * math.pi / 180.0
	local azimuthAngleRad = azimuthAngleDeg * math.pi / 180.0

	local pos = {
		x = entityPosition.x + radius * (math.sin(azimuthAngleRad) * math.cos(polarAngleRad)),
		y = entityPosition.y - radius * (math.sin(azimuthAngleRad) * math.sin(polarAngleRad)),
		z = entityPosition.z - radius * math.cos(azimuthAngleRad)
	}

	return pos
end

--NON INVERTED
--[[function polar3DToWorld3D(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
	-- convert degrees to radians
	local polarAngleRad   = polarAngleDeg   * math.pi / 180.0
	local azimuthAngleRad = azimuthAngleDeg * math.pi / 180.0

	local pos = {
		x = entityPosition.x + radius * (math.sin(azimuthAngleRad) * math.sin(polarAngleRad)),
		y = entityPosition.y - radius * (math.sin(azimuthAngleRad) * math.cos(polarAngleRad)),
		z = entityPosition.z - radius * math.cos(azimuthAngleRad)
	}

	return pos
end]]