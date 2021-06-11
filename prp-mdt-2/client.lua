local guiEnabled = false
PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Open Gui and Focus NUI
function openGui()
    local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
    if not isInVeh then
        SetPlayerControl(PlayerId(), 0, 0)
    end
    guiEnabled = true
    SetNuiFocus(true,true)
    SendNUIMessage({openWarrants = true})
    ToggleTablet(true)
end

function openpr()
    SetPlayerControl(PlayerId(), 0, 0)
    guiEnabled = true
    SetNuiFocus(true,true)
    SendNUIMessage({
        openSection = "publicrecords"
    })
    ToggleTablet(true)
end

function openphr()
    SetPlayerControl(PlayerId(), 0, 0)
    guiEnabled = true
    SetNuiFocus(true,true)
    SendNUIMessage({
        openSection = "publichousingrecords"
    })
    ToggleTablet(true)
end

-- Close Gui and disable NUI
function closeGui()
    SetNuiFocus(false,false)
    guiEnabled = false
    ToggleTablet(false)
    Wait(250)
    ClearPedTasks(PlayerPedId())
    SetPlayerControl(PlayerId(), 1, 0)
end

RegisterNetEvent("phone:publicrecords")
AddEventHandler("phone:publicrecords", function()
    openpr()
end)

RegisterNetEvent("phone:publichousingrecords")
AddEventHandler("phone:publichousingrecords", function()
    openphr()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local inRange = false
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local courthousePos = { x = 246.93, y = -1079.66, z = 29.3}
        local dist = GetDistanceBetweenCoords(pos, courthousePos.x, courthousePos.y, courthousePos.z, true)
        if dist  < 5 then
            inRange = true
            DrawMarker(2,courthousePos.x, courthousePos.y, courthousePos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 155, 152, 234, 155, false, false, false, true, false, false, false)
            if (GetDistanceBetweenCoords(pos, courthousePos.x, courthousePos.y, courthousePos.z, true) < 1.0) then
                DrawText3Ds(courthousePos.x, courthousePos.y, courthousePos.z, "~g~E~w~ - Public Records")
                if IsControlJustReleased(1,38) then
                    MenuPublicRecords()
                    Menu.hidden = not Menu.hidden
                end
            end
        end

        Menu.renderGUI()

        if dist >= 3 and not Menu.hidden then
            closeMenuFull()
        end

        if not inRange then
            Citizen.Wait(1000)
        end
    end
end)

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

-- Opens our warrants
RegisterNetEvent('warrantsGui')
AddEventHandler('warrantsGui', function()
    openGui()
    guiEnabled = true
end)

RegisterNetEvent('mdt:close')
AddEventHandler('mdt:close', function()
    closeGui()
    SendNUIMessage({
        closeGUI = true
    })
end)

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
    closeGui()
    cb('ok')
end)

function IsInMDT()
    local toggleMDT = guiEnabled
    return toggleMDT
end

local tablet = false
local tabletDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
local tabletAnim = "base"
local tabletProp = `prop_cs_tablet`
local tabletBone = 60309
local tabletOffset = vector3(0.03, 0.002, -0.0)
local tabletRot = vector3(10.0, 160.0, 0.0)

function ToggleTablet(toggle)
    if toggle and not tablet then
        tablet = true

        Citizen.CreateThread(function()
            RequestAnimDict(tabletDict)

            while not HasAnimDictLoaded(tabletDict) do
                Citizen.Wait(150)
            end

            RequestModel(tabletProp)

            while not HasModelLoaded(tabletProp) do
                Citizen.Wait(150)
            end

            local playerPed = PlayerPedId()
            local tabletObj = CreateObject(tabletProp, 0.0, 0.0, 0.0, true, true, false)
            local tabletBoneIndex = GetPedBoneIndex(playerPed, tabletBone)

            SetCurrentPedWeapon(playerPed, `weapon_unarmed`, true)
            AttachEntityToEntity(tabletObj, playerPed, tabletBoneIndex, tabletOffset.x, tabletOffset.y, tabletOffset.z, tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
            SetModelAsNoLongerNeeded(tabletProp)

            while tablet do
                Citizen.Wait(100)
                playerPed = PlayerPedId()

                if not IsEntityPlayingAnim(playerPed, tabletDict, tabletAnim, 3) then
                    TaskPlayAnim(playerPed, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                end
            end

            ClearPedSecondaryTask(playerPed)

            Citizen.Wait(450)

            DetachEntity(tabletObj, true, false)
            DeleteEntity(tabletObj)
        end)
    elseif not toggle and tablet then
        tablet = false
    end
end

function close()
    Menu.hidden = true
end

function closeMenuFull()
    Menu.hidden = true
    TriggerEvent("inmenu",false)
    ClearMenu()
end

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

function MenuPublicRecords()
    MenuTitle = "Public Records"
    ClearMenu()
    Menu.addButton("Public Records", "PublicRecords", nil)
    Menu.addButton("Public Properties", "PublicProperties", nil)
    Menu.addButton("Close Menu", "close", nil) 
    TriggerEvent("inmenu",true)
end

function yeet(label)
    -- print(label)
end

function PublicRecords()
    closeMenuFull()
    TriggerEvent('phone:publicrecords')
end

function PublicProperties()
    closeMenuFull()
    TriggerEvent('phone:publichousingrecords')
end

RegisterNUICallback('GetPublicHousingRecords', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-mdt-2:server:GetAllPlayerHouses', function(Houses)
        cb(Houses)
    end)
end)

RegisterNUICallback('GetHouseLocation', function(data, cb)
    local coords = data.houseCoords
    local Area = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    cb(Area)
end)

RegisterNUICallback('GetAuth', function(data, cb)
    local IsAuthorized = false
    PlayerData = PRPCore.Functions.GetPlayerData()
    if PlayerData ~= nil and (PlayerData.job.name == "doj" and PlayerData.job.grade.level > 0) then
        IsAuthorized = true
    end
    cb(IsAuthorized)
end)