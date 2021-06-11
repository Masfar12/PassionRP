PRPCore = nil
Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

local isOpen = false
local PlayerData = nil

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PlayerData = PRPCore.Functions.GetPlayerData()
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData = PRPCore.Functions.GetPlayerData()
end)

Citizen.CreateThread(function()
    local menus = {
        "polmenu",
        "extras",
        "liveries",
        "colors",
        "primary",
        "secondary",
        "chrome",
        "metallic",
        "matte",
        "metals",
        "chrome2",
        "metallic2",
        "matte2",
        "metals2",
        "windows",
    }
    local extras = {}

    WarMenu.CreateMenu('polmenu', 'Vehicle Menu')
    WarMenu.CreateSubMenu('extras', 'polmenu')
    WarMenu.CreateSubMenu('liveries', 'polmenu')
    WarMenu.CreateSubMenu('colors', 'polmenu')
    WarMenu.CreateSubMenu('primary', 'colors')
    WarMenu.CreateSubMenu('secondary', 'colors')
    WarMenu.CreateSubMenu('chrome', 'primary')
    WarMenu.CreateSubMenu('metallic', 'primary')
    WarMenu.CreateSubMenu('matte', 'primary')
    WarMenu.CreateSubMenu('metals', 'primary')
    WarMenu.CreateSubMenu('chrome2', 'secondary')
    WarMenu.CreateSubMenu('metallic2', 'secondary')
    WarMenu.CreateSubMenu('matte2', 'secondary')
    WarMenu.CreateSubMenu('metals2', 'secondary')
    WarMenu.CreateSubMenu('windows', 'polmenu')


    for k, v in pairs(menus) do
        WarMenu.SetMenuX(v, 0.75)
        WarMenu.SetMenuY(v, 0.02)
        WarMenu.SetMenuWidth(v, 0.23)
        WarMenu.SetTitleColor(v, 255, 255, 255, 255)
        WarMenu.SetTitleBackgroundColor(v, 255, 53, 53, 200)
    end
    local colorMenu
    while true do
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
        if WarMenu.IsMenuOpened('polmenu') then
            WarMenu.MenuButton('Extras', 'extras')
            WarMenu.MenuButton('Liveries', 'liveries')
            WarMenu.MenuButton('Colors', 'colors')
            WarMenu.MenuButton('Window tint', 'windows')

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('extras') then
            for id=0, 20 do
                if DoesExtraExist(vehicle, id) then
                    local state = IsVehicleExtraTurnedOn(vehicle, id) 
                    local isExtra =  WarMenu.CheckBox("Extra: "..id, state, function(checked) state = checked end)
                    if isExtra then
                        isExtra = not isExtra
                        SetVehicleExtra(vehicle, id, not state)
                    else
                        isExtra = not isExtra
                        SetVehicleExtra(vehicle, id, not state)
                    end
                end
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('liveries') then
            local liveryCount = GetVehicleLiveryCount(vehicle)
            for i = 1, liveryCount do
                local state = GetVehicleLivery(vehicle)
                local string
                if state == i then
                    string = "Livery "..i.. ":  " .. "~g~[SELECTED]~w~"
                else
                   string = "Livery "..i.. ":"
                end

                if WarMenu.Button(string) then
                    SetVehicleLivery(vehicle, i)
                end
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('colors') then
            WarMenu.MenuButton('Primary Color', 'primary')
            WarMenu.MenuButton('Secondary Color', 'secondary')
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('primary') then
            WarMenu.MenuButton('Chrome', 'chrome')
            WarMenu.MenuButton('Metallic', 'metallic')
            WarMenu.MenuButton('Matte', 'matte')
            WarMenu.MenuButton('Metals', 'metals')
            colorMenu = 'primary'
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('secondary') then
            WarMenu.MenuButton('Chrome', 'chrome2')
            WarMenu.MenuButton('Metallic', 'metallic2')
            WarMenu.MenuButton('Matte', 'matte2')
            WarMenu.MenuButton('Metals', 'metals2')
            colorMenu = 'secondary'
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('chrome') or WarMenu.IsMenuOpened('chrome2')then
            for k, v in pairs (Colors.Chrome) do
                if WarMenu.Button(k) then
                    if colorMenu == 'primary' then
                        SetVehicleColours(vehicle, v, colorSecondary)
                    elseif colorMenu == 'secondary' then
                        SetVehicleColours(vehicle, colorPrimary, v)
                    end
                end
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('metallic') or WarMenu.IsMenuOpened('metallic2') then
            for k, v in pairs (Colors.Metallic) do
                if WarMenu.Button(k) then
                    if colorMenu == 'primary' then
                        SetVehicleColours(vehicle, v, colorSecondary)
                    elseif colorMenu == 'secondary' then
                        SetVehicleColours(vehicle, colorPrimary, v)
                    end
                end
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('matte') or WarMenu.IsMenuOpened('matte2') then
            for k, v in pairs (Colors.Matte) do
                if WarMenu.Button(k) then
                    if colorMenu == 'primary' then
                        SetVehicleColours(vehicle, v, colorSecondary)
                    elseif colorMenu == 'secondary' then
                        SetVehicleColours(vehicle, colorPrimary, v)
                    end
                end
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('metals') or WarMenu.IsMenuOpened('metals2') then
            for k, v in pairs (Colors.Metals) do
                if WarMenu.Button(k) then
                    if colorMenu == 'primary' then
                        SetVehicleColours(vehicle, v, colorSecondary)
                    elseif colorMenu == 'secondary' then
                        SetVehicleColours(vehicle, colorPrimary, v)
                    end
                end
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('windows') then
            if WarMenu.Button('None') then
                SetVehicleModKit(vehicle, 0)
                SetVehicleWindowTint(vehicle, 0)
            end
            if WarMenu.Button('Stock') then
                SetVehicleModKit(vehicle, 0)
                SetVehicleWindowTint(vehicle, 4)
            end
            if WarMenu.Button('Light Smoke') then
                SetVehicleModKit(vehicle, 0)
                SetVehicleWindowTint(vehicle, 3)
            end
            if WarMenu.Button('Dark Smoke') then
                SetVehicleModKit(vehicle, 0)
                SetVehicleWindowTint(vehicle, 2)
            end
            if WarMenu.Button('Limo') then
                SetVehicleModKit(vehicle, 0)
                SetVehicleWindowTint(vehicle, 5)
            end
            if WarMenu.Button('Pure Black') then
                SetVehicleModKit(vehicle, 0)
                SetVehicleWindowTint(vehicle, 1)
            end
            if WarMenu.Button('Green') then
                SetVehicleModKit(vehicle, 0)
                SetVehicleWindowTint(vehicle, 6)
            end
            WarMenu.Display()
        end
        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while PlayerData == nil do Wait(1000) end
    while true do
        local sleep = 750
        local coords = GetEntityCoords(PlayerPedId())
        if not WarMenu.IsAnyMenuOpened() then
            isOpen = false
        else
            isOpen = true
        end
        if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'doctor' then
            for k, v in pairs(Config.MarkerCoords) do
                if GetDistanceBetweenCoords(coords, v, true) <= 25 then
                    sleep = 0
                    DrawMarker(27, v, vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(1.5, 1.5, 1), 255, 0, 0, 255, false, false, 2, true, false, false)
                    if Vdist2(coords, v) <= 1.5 and IsPedInAnyVehicle(PlayerPedId()) then
                        if not isOpen then
                            helpText('Press ~INPUT_CONTEXT~ to open extras menu')
                            if IsControlJustReleased(0,38) then
                                TriggerEvent("pvm:client:OpenVehicleMenu")
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent("pvm:client:OpenVehicleMenu")
AddEventHandler("pvm:client:OpenVehicleMenu", function()
    local me = PlayerPedId()
    local coords = GetEntityCoords(me)
    local success = false
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'doctor' then
        if IsPedInAnyVehicle(me, false) then
            if GetVehicleClass(GetVehiclePedIsIn(me, false)) == 18 then
                for k, v in pairs(Config.MarkerCoords) do
                    if GetDistanceBetweenCoords(coords, v, true) <= 25 then
                        WarMenu.OpenMenu('polmenu')
                        success = true
                        break
                    end
                end
                if success == false then
                    PRPCore.Functions.Notify('You are too far away!!', 'error')
                end
           else
                PRPCore.Functions.Notify('You are not in an emergency vehicle!!', 'error')
           end
        else
            PRPCore.Functions.Notify('You are not in a vehicle!!', 'error')
        end
    else
        PRPCore.Functions.Notify('You are not a cop!!', 'error')
    end
end)

helpText = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end
