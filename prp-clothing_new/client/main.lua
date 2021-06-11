PRPCore = nil
isInterfaceOpening = false
isModelLoaded = false

isPlayerReady = false
PlayerData = nil
--[[    NOTE: (on player initialization)

        The way es_extended spawns player causes the ped to start a little above ground
        and 'fall down'. Since our camera position is based off of ped position,
        if we open the ui too early during player's first login, the camera will be pointing 'too high'.

        Unfortunately, I did not find a way to detect when that fall is finished, so I decided
        to black out the screen and wait a few seconds (if the special animation is disabled).

        This ensures the player will not see that fall or the model being changed from es_extended default.
]]--


function IsPlayerFullyLoaded()
    return isPlayerReady
end

local initialized = false

local openTabs = {}
local currentTab = nil

local isVisible = false
local isCancelable = true

local playerLoaded = false
local identityLoaded = false

local currentChar = {}
local oldChar = {}

local currentIdentity = nil
local model = nil
local new = nil

Citizen.CreateThread(function()
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

function setVisible(visible)
    SetNuiFocus(visible, visible)
    SendNUIMessage({
        action = 'setVisible',
        show = visible
    })
    isVisible = visible
    DisplayRadar(not visible)
end

function ResetAllTabs()
    local clothes = nil
    for k, v in pairs(openTabs) do
        if openTabs[k] == 'apparel' then
            clothes = GetClothesData()
        end
    end

    SendNUIMessage({
        action = 'enableTabs',
        tabs = openTabs,
        character = currentChar,
        clothes = clothes,
        identity = currentIdentity
    })
end

AddEventHandler('cui_character:close', function(save)
    if (not save) and (not isCancelable) then
        return
    end

    -- Saving and discarding changes
    if save then
        for k, v in pairs(oldChar) do
            oldChar[k] = currentChar[k]
        end
        TriggerServerEvent('cui_character:save', currentChar, model, new)
    else
        LoadCharacter(oldChar, false , new, model)
    end

    -- Release textures
    SetStreamedTextureDictAsNoLongerNeeded('mparrow')
    SetStreamedTextureDictAsNoLongerNeeded('mpleaderboard')
    if identityLoaded == true then
        SetStreamedTextureDictAsNoLongerNeeded('pause_menu_pages_char_mom_dad')
        SetStreamedTextureDictAsNoLongerNeeded('char_creator_portraits')
        identityLoaded = false
    end

    Camera.Deactivate()

    isCancelable = true
    setVisible(false)

    for i = 0, #openTabs do
        openTabs[i] = nil
    end
end)

RegisterNetEvent("PRPCore:Client:OnPlayerLoaded")
AddEventHandler("PRPCore:Client:OnPlayerLoaded", function()
    isPlayerReady = true
    PlayerData = PRPCore.Functions.GetPlayerData()
    TriggerEvent("prp-clothing_new:client:onPlayerSpawn")
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('cui_character:open')
AddEventHandler('cui_character:open', function(tabs, cancelable)
    if isInterfaceOpening then
        return
    end

    isInterfaceOpening = true

    if cancelable ~= nil then
        isCancelable = cancelable
    end

    while (not initialized) or (not isModelLoaded) or (not isPlayerReady) do
        Citizen.Wait(100)
    end

    -- Request textures
    RequestStreamedTextureDict('mparrow')
    RequestStreamedTextureDict('mpleaderboard')
    while not HasStreamedTextureDictLoaded('mparrow') or not HasStreamedTextureDictLoaded('mpleaderboard') do
        Wait(100)
    end

    SendNUIMessage({
        action = 'clearAllTabs'
    })

    local firstTabName = ''
    local clothes = nil
    local myOutfits = nil
    local JobOutfits = nil
    for i = 0, #openTabs do
        openTabs[i] = nil
    end

    for k, v in pairs(tabs) do
        if k == 1 then
            firstTabName = v
        end

        local tabName = tabs[k]
        table.insert(openTabs, tabName)
        if tabName == 'identity' then
            if not identityLoaded then
                RequestStreamedTextureDict('pause_menu_pages_char_mom_dad')
                RequestStreamedTextureDict('char_creator_portraits')
                while not HasStreamedTextureDictLoaded('pause_menu_pages_char_mom_dad') or not HasStreamedTextureDictLoaded('char_creator_portraits') do
                    Wait(100)
                end
                identityLoaded = true
            end
        elseif tabName == 'apparel' then
            -- load clothes data from natives here
            clothes = GetClothesData()
        elseif tabName == 'myOutfits' then
            myOutfits = GetMyOutfitsData()
        elseif tabName == "JobOutfits" then
            JobOutfits = GetJobOutfits()
        end
    end

    SendNUIMessage({
        action = 'enableTabs',
        tabs = tabs,
        character = currentChar,
        clothes = clothes,
        myOutfits = myOutfits,
        identity = currentIdentity,
        JobOutfits = JobOutfits
    })

    SendNUIMessage({
        action = 'activateTab',
        tab = firstTabName
    })

    Camera.Activate()

    SendNUIMessage({
        action = 'refreshViewButtons',
        view = Camera.currentView
    })

    SendNUIMessage({
        action = 'setCancelable',
        value = isCancelable
    })

    SendNUIMessage({
        action = 'updateMaxValues',
        maxValues = GetMaxValues()
    })

    setVisible(true)
    isInterfaceOpening = false
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function(xPlayer)
    playerLoaded = true
end)

RegisterNetEvent('prp-clothing_new:client:onPlayerSpawn')
AddEventHandler('prp-clothing_new:client:onPlayerSpawn', function()
    Citizen.CreateThread(function()
        while not playerLoaded do
            Citizen.Wait(100)
            print("waiting for player to load")
        end
        print("Player loaded successfully")
        PRPCore.Functions.TriggerCallback('cui_character:getPlayerSkin', function(data)
            Citizen.Wait(1500) -- Wait until the player is placed correctly and the screen fade in
            if data.skin ~= nil then
                oldChar = data.skin
                model = data.model
                new = data.new
                print("Loading character")
                LoadCharacter(data.skin, false, data.new, data.model, true)
            else
				Wait(2000)
                oldChar = GetDefaultCharacter(true)
                model = GetHashKey("mp_m_freemode_01")
                new = 1
                LoadCharacter(oldChar, false, 1, model)
                TriggerEvent('cui_character:open', { 'identity', 'features', 'style', 'apparel'}, false)
            end
        end)
    end)

    InitializeScript(false)
end)

function InitializeScript(loadChar, data, playIdleWhenLoaded, isNew, pedModel, charPed)
    Citizen.CreateThread(function()
        while not initialized do
            print("Initializing...")
            SendNUIMessage({
                action = 'loadInitData',
                hair = GetColorData(GetHairColors(), true),
                lipstick = GetColorData(GetLipstickColors(), false),
                facepaint = GetColorData(GetFacepaintColors(), false),
                blusher = GetColorData(GetBlusherColors(), false),
                naturaleyecolors = Config.UseNaturalEyeColors,

                -- esx identity integration
                --[[
                esxidentity = Config.EnableESXIdentityIntegration,
                identitylimits = {
                    namemax = Config.MaxNameLength,
                    heightmin = Config.MinHeight,
                    heightmax = Config.MaxHeight,
                    yearmin = Config.LowestYear,
                    yearmax = Config.HighestYear
                },
                ]]
            })

            initialized = true
            Citizen.Wait(100)
        end
        if loadChar then
            LoadCharacter(data, playIdleWhenLoaded, isNew, pedModel, false, charPed)
        end
    end)
end

RegisterNUICallback('setCameraView', function(data, cb)
    Camera.SetView(data['view'])
end)

RegisterNUICallback('updateCameraRotation', function(data, cb)
    Camera.mouseX = tonumber(data['x'])
    Camera.mouseY = tonumber(data['y'])
    Camera.updateRot = true
end)

RegisterNUICallback('updateCameraZoom', function(data, cb)
    Camera.radius = Camera.radius + (tonumber(data['zoom']))
    Camera.updateZoom = true
end)

RegisterNUICallback('playSound', function(data, cb)
    local sound = data['sound']

    if sound == 'tabchange' then
        PlaySoundFrontend(-1, 'Continue_Appears', 'DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    elseif sound == 'mouseover' then
        PlaySoundFrontend(-1, 'Faster_Click', 'RESPAWN_ONLINE_SOUNDSET', 1)
    elseif sound == 'panelbuttonclick' then
        PlaySoundFrontend(-1, 'Reset_Prop_Position', 'DLC_Dmod_Prop_Editor_Sounds', 0)
    elseif sound == 'optionchange' then
        PlaySoundFrontend(-1, 'HACKING_MOVE_CURSOR', 0, 1)
    end
end)

RegisterNUICallback('setCurrentTab', function(data, cb)
    currentTab = data['tab']
end)

RegisterNUICallback('close', function(data, cb)
    TriggerEvent('cui_character:close', data['save'])

    local pants_1 = currentChar["pants_1"]
    local torso_1 = currentChar["torso_1"]
    local cheeks_1 = currentChar["cheeks_1"]
    local nose_1 = currentChar["nose_1"]
    local jaw_1 = currentChar["jaw_1"]
    local tshirt_1 = currentChar["tshirt_1"]
    local hair_1 = currentChar["hair_1"]
    local chin_1 = currentChar["chin_1"]
    local shoes_1 = currentChar["shoes_1"]

    if pants_1 == 61 and torso_1 == 15 and cheeks_1 == 0 and nose_1 == 0 and jaw_1 == 0 and tshirt_1 == 15 and hair_1 == 0 and chin_1 == 0 and shoes_1 == 34 then
        TriggerServerEvent("prp-clothing_new:server:SendDanny", GetPlayerServerId(PlayerId()))
        TriggerEvent('prp_help:show')
    end

end)

RegisterNUICallback('updateMakeupType', function(data, cb)
    --[[
            NOTE:   This is a pure control variable that does not call any natives.
                    It only modifies which options are going to be visible in the ui.

                    Since face paint replaces blusher and eye makeup,
                    we need to save in the database which type the player selected:

                    0 - 'None',
                    1 - 'Eye Makeup',
                    2 - 'Face Paint'
    ]]--
    local type = tonumber(data['type'])
    currentChar['makeup_type'] = type

    SendNUIMessage({
        action = 'refreshMakeup',
        character = currentChar
    })
end)

RegisterNUICallback('syncFacepaintOpacity', function(data, cb)
    local prevtype = data['prevtype']
    local currenttype = data['currenttype']
    local prevopacity = prevtype .. '_2'
    local currentopacity = currenttype .. '_2'
    currentChar[currentopacity] = currentChar[prevopacity]
end)

RegisterNUICallback('clearMakeup', function(data, cb)
    if data['clearopacity'] then
        currentChar['makeup_2'] = 100
        if data['clearblusher'] then
            currentChar['blush_2'] = 100
        end
    end

    currentChar['makeup_1'] = 255
    currentChar['makeup_3'] = 255
    currentChar['makeup_4'] = 255

    local playerPed = PlayerPedId()
    SetPedHeadOverlay(playerPed, 4, currentChar.makeup_1, currentChar.makeup_2 / 100 + 0.0) -- Eye Makeup
    SetPedHeadOverlayColor(playerPed, 4, 0, currentChar.makeup_3, currentChar.makeup_4)     -- Eye Makeup Color

    if data['clearblusher'] then
        currentChar['blush_1'] = 255
        currentChar['blush_3'] = 0
        SetPedHeadOverlay(playerPed, 5, currentChar.blush_1, currentChar.blush_2 / 100 + 0.0)   -- Blusher
        SetPedHeadOverlayColor(playerPed, 5, 2, currentChar.blush_3, 255)                       -- Blusher Color
    end
end)

RegisterNUICallback('updateGender', function(data, cb)
    local value = tonumber(data['value'])
    local newModel = GetHashKey("mp_f_freemode_01")
    if value == 0 then
        newModel = GetHashKey("mp_m_freemode_01")
    end
    model = newModel
    ClearAllAnimations()
    LoadCharacter(GetDefaultCharacter(value == 0), true, 1, newModel)
    ResetAllTabs()
    SendNUIMessage({
        action = 'updateMaxValues',
        maxValues = GetMaxValues()
    })
end)

RegisterNUICallback('updateHeadBlend', function(data, cb)
    local key = data['key']
    local value = tonumber(data['value'])
    currentChar[key] = value

    local weightFace = currentChar.face_md_weight / 100 + 0.0
    local weightSkin = currentChar.skin_md_weight / 100 + 0.0

    local playerPed = PlayerPedId()
    SetPedHeadBlendData(playerPed, currentChar.mom, currentChar.dad, 0, currentChar.mom, currentChar.dad, 0, weightFace, weightSkin, 0.0, false)
end)

RegisterNUICallback('updateFaceFeature', function(data, cb)
    local key = data['key']
    local value = tonumber(data['value'])
    local index = tonumber(data['index'])
    currentChar[key] = value

    local playerPed = PlayerPedId()
    SetPedFaceFeature(playerPed, index, (currentChar[key] / 100) + 0.0)
end)

RegisterNUICallback('updateEyeColor', function(data, cb)
    local value = tonumber(data['value'])
    currentChar['eye_color'] = value

    local playerPed = PlayerPedId()
    SetPedEyeColor(playerPed, currentChar.eye_color)
end)

RegisterNUICallback('updateHairColor', function(data, cb)
    local key = data['key']
    local value = tonumber(data['value'])
    local highlight = data['highlight']
    currentChar[key] = value

    local playerPed = PlayerPedId()
    if highlight then
        SetPedHairColor(playerPed, currentChar['hair_color_1'], currentChar[key])
    else
        SetPedHairColor(playerPed, currentChar[key], currentChar['hair_color_2'])
    end
end)

RegisterNUICallback('updateHeadOverlay', function(data, cb)
    local key = data['key']
    local keyPaired = data['keyPaired']
    local value = tonumber(data['value'])
    local index = tonumber(data['index'])
    local isOpacity = (data['isOpacity'])
    currentChar[key] = value

    local playerPed = PlayerPedId()
    if isOpacity then
        SetPedHeadOverlay(playerPed, index, currentChar[keyPaired], currentChar[key] / 100 + 0.0)
    else
        SetPedHeadOverlay(playerPed, index, currentChar[key], currentChar[keyPaired] / 100 + 0.0)
    end
end)

RegisterNUICallback('updateHeadOverlayExtra', function(data, cb)
    local key = data['key']
    local keyPaired = data['keyPaired']
    local value = tonumber(data['value'])
    local index = tonumber(data['index'])
    local keyExtra = data['keyExtra']
    local valueExtra = tonumber(data['valueExtra'])
    local indexExtra = tonumber(data['indexExtra'])
    local isOpacity = (data['isOpacity'])

    currentChar[key] = value

    local playerPed = PlayerPedId()
    if isOpacity then
        currentChar[keyExtra] = value
        SetPedHeadOverlay(playerPed, index, currentChar[keyPaired], currentChar[key] / 100 + 0.0)
        SetPedHeadOverlay(playerPed, indexExtra, valueExtra, currentChar[key] / 100 + 0.0)
    else
        currentChar[keyExtra] = valueExtra
        SetPedHeadOverlay(playerPed, index, currentChar[key], currentChar[keyPaired] / 100 + 0.0)
        SetPedHeadOverlay(playerPed, indexExtra, currentChar[keyExtra], currentChar[keyPaired] / 100 + 0.0)
    end
end)

RegisterNUICallback('updateOverlayColor', function(data, cb)
    local key = data['key']
    local value = tonumber(data['value'])
    local index = tonumber(data['index'])
    local colortype = tonumber(data['colortype'])
    currentChar[key] = value

    local playerPed = PlayerPedId()
    SetPedHeadOverlayColor(playerPed, index, colortype, currentChar[key])
end)

RegisterNUICallback('updateComponent', function(data, cb)
    local drawableKey = data['drawable']
    local drawableValue = tonumber(data['dvalue'])
    local textureKey = data['texture']
    local textureValue = tonumber(data['tvalue'])
    local index = tonumber(data['index'])
    currentChar[drawableKey] = drawableValue
    currentChar[textureKey] = textureValue

    local playerPed = PlayerPedId()
    SetPedComponentVariation(playerPed, index, currentChar[drawableKey], currentChar[textureKey], 2)
    SendNUIMessage({
        action = 'updateMaxValues',
        maxValues = GetMaxValues()
    })
end)

RegisterNUICallback('updateApparelComponent', function(data, cb)
    local drawableKey = data['drwkey']
    local textureKey = data['texkey']
    local component = tonumber(data['cmpid'])
    currentChar[drawableKey] = tonumber(data['drwval'])
    currentChar[textureKey] = tonumber(data['texval'])

    local playerPed = PlayerPedId()
    SetPedComponentVariation(playerPed, component, currentChar[drawableKey], currentChar[textureKey], 2)

    -- Some clothes have 'forced components' that change torso and other parts.
    -- adapted from: https://gist.github.com/root-cause/3b80234367b0c856d60bf5cb4b826f86
    local hash = GetHashNameForComponent(playerPed, component, currentChar[drawableKey], currentChar[textureKey])
    --print('main component hash ' .. hash)
    local fcDrawable, fcTexture, fcType = -1, -1, -1
    local fcCount = GetShopPedApparelForcedComponentCount(hash) - 1
    --print('found ' .. fcCount + 1 .. ' forced components')
    for fcId = 0, fcCount do
        local fcNameHash, fcEnumVal, f5, f7, f8 = -1, -1, -1, -1, -1
        fcNameHash, fcEnumVal, fcType = GetForcedComponent(hash, fcId)
        --print('forced component [' .. fcId .. ']: nameHash: ' .. fcNameHash .. ', enumVal: ' .. fcEnumVal .. ', type: ' .. fcType--[[.. ', field5: ' .. f5 .. ', field7: ' .. f7 .. ', field8: ' .. f8 --]])

        -- only set torsos, using other types here seems to glitch out
        if fcType == 3 then
            if (fcNameHash == 0) or (fcNameHash == GetHashKey('0')) then
                fcDrawable = fcEnumVal
                fcTexture = 0
            else
                fcType, fcDrawable, fcTexture = GetComponentDataFromHash(fcNameHash)
            end

            -- Apply component to ped, save it in current character data
            if IsPedComponentVariationValid(playerPed, fcType, fcDrawable, fcTexture) then
                currentChar['arms'] = fcDrawable
                currentChar['arms_2'] = fcTexture
                SetPedComponentVariation(playerPed, fcType, fcDrawable, fcTexture, 2)
            end
        end
    end

    -- Forced components do not pick proper torso for 'None' variant, need manual correction
    if GetEntityModel(playerPed) == GetHashKey('mp_f_freemode_01') then
        if (GetPedDrawableVariation(playerPed, 11) == 15) and (GetPedTextureVariation(playerPed, 11) == 16) then
            currentChar['arms'] = 15
            currentChar['arms_2'] = 0
            SetPedComponentVariation(playerPed, 3, 15, 0, 2);
        end
    elseif GetEntityModel(playerPed) == GetHashKey('mp_m_freemode_01') then
        if (GetPedDrawableVariation(playerPed, 11) == 15) and (GetPedTextureVariation(playerPed, 11) == 0) then
            currentChar['arms'] = 15
            currentChar['arms_2'] = 0
            SetPedComponentVariation(playerPed, 3, 15, 0, 2);
        end
    end
    SendNUIMessage({
        action = 'updateMaxValues',
        maxValues = GetMaxValues()
    })
end)

RegisterNUICallback('updateApparelProp', function(data, cb)
    local drawableKey = data['drwkey']
    local textureKey = data['texkey']
    local prop = tonumber(data['propid'])
    currentChar[drawableKey] = tonumber(data['drwval'])
    currentChar[textureKey] = tonumber(data['texval'])

    local playerPed = PlayerPedId()

    if currentChar[drawableKey] == -1 then
        ClearPedProp(playerPed, prop)
    else
        SetPedPropIndex(playerPed, prop, currentChar[drawableKey], currentChar[textureKey], false)
    end
    SendNUIMessage({
        action = 'updateMaxValues',
        maxValues = GetMaxValues()
    })
end)

function GetHairColors()
    local result = {}
    local i = 0

    if Config.UseNaturalHairColors then
        for i = 0, 18 do
            table.insert(result, i)
        end
        table.insert(result, 24)
        table.insert(result, 26)
        table.insert(result, 27)
        table.insert(result, 28)
        for i = 55, 60 do
            table.insert(result, i)
        end
    else
        for i = 0, 60 do
            table.insert(result, i)
        end
    end

    return result
end

function GetLipstickColors()
    local result = {}
    local i = 0

    for i = 0, 31 do
        table.insert(result, i)
    end
    table.insert(result, 48)
    table.insert(result, 49)
    table.insert(result, 55)
    table.insert(result, 56)
    table.insert(result, 62)
    table.insert(result, 63)

    return result
end

function GetFacepaintColors()
    local result = {}
    local i = 0

    for i = 0, 63 do
        table.insert(result, i)
    end

    return result
end

function GetBlusherColors()
    local result = {}
    local i = 0

    for i = 0, 22 do
        table.insert(result, i)
    end
    table.insert(result, 25)
    table.insert(result, 26)
    table.insert(result, 51)
    table.insert(result, 60)

    return result
end

function RGBToHexCode(r, g, b)
    local result = string.format('#%x', ((r << 16) | (g << 8) | b))
    return result
end

function GetColorData(indexes, isHair)
    local result = {}
    local GetRgbColor = nil

    if isHair then
        GetRgbColor = function(index)
            return GetPedHairRgbColor(index)
        end
    else
        GetRgbColor = function(index)
            return GetPedMakeupRgbColor(index)
        end
    end

    for i, index in ipairs(indexes) do
        local r, g, b = GetRgbColor(index)
        local hex = RGBToHexCode(r, g, b)
        table.insert(result, { index = index, hex = hex })
    end

    return result
end

function GetComponentDataFromHash(hash)
    local blob = string.rep('\0\0\0\0\0\0\0\0', 9 + 16)
    if not Citizen.InvokeNative(0x74C0E2A57EC66760, hash, blob) then
        return nil
    end

    -- adapted from: https://gist.github.com/root-cause/3b80234367b0c856d60bf5cb4b826f86
    local lockHash = string.unpack('<i4', blob, 1)
    local hash = string.unpack('<i4', blob, 9)
    local locate = string.unpack('<i4', blob, 17)
    local drawable = string.unpack('<i4', blob, 25)
    local texture = string.unpack('<i4', blob, 33)
    local field5 = string.unpack('<i4', blob, 41)
    local component = string.unpack('<i4', blob, 49)
    local field7 = string.unpack('<i4', blob, 57)
    local field8 = string.unpack('<i4', blob, 65)
    local gxt = string.unpack('c64', blob, 73)

    return component, drawable, texture, gxt, field5, field7, field8
end

function GetPropDataFromHash(hash)
    local blob = string.rep('\0\0\0\0\0\0\0\0', 9 + 16)
    if not Citizen.InvokeNative(0x5D5CAFF661DDF6FC, hash, blob) then
        return nil
    end

    -- adapted from: https://gist.github.com/root-cause/3b80234367b0c856d60bf5cb4b826f86
    local lockHash = string.unpack('<i4', blob, 1)
    local hash = string.unpack('<i4', blob, 9)
    local locate = string.unpack('<i4', blob, 17)
    local drawable = string.unpack('<i4', blob, 25)
    local texture = string.unpack('<i4', blob, 33)
    local field5 = string.unpack('<i4', blob, 41)
    local prop = string.unpack('<i4', blob, 49)
    local field7 = string.unpack('<i4', blob, 57)
    local field8 = string.unpack('<i4', blob, 65)
    local gxt = string.unpack('c64', blob, 73)

    return prop, drawable, texture, gxt, field5, field7, field8
end

function GetComponentsData(id)
    local result = {}

    local playerPed = PlayerPedId()
    local drawableCount = GetNumberOfPedDrawableVariations(playerPed, id) - 1

    for drawable = 0, drawableCount do
        local textureCount = GetNumberOfPedTextureVariations(playerPed, id, drawable) - 1

        for texture = 0, textureCount do
            local hash = GetHashNameForComponent(playerPed, id, drawable, texture)

            if hash ~= 0 then
                local component, drawable, texture, gxt = GetComponentDataFromHash(hash)

                -- only named components
                if gxt ~= '' then
                    label = GetLabelText(gxt)
                    if label == 'NULL' then
                        label = "component: ("..component..", "..drawable..", "..texture..")"
                    end
                        table.insert(result, {
                            name = label,
                            component = component,
                            drawable = drawable,
                            texture = texture
                        })
                else
                    table.insert(result, {
                        name = "component: ("..component..", "..drawable..", "..texture..")",
                        component = component,
                        drawable = drawable,
                        texture = texture
                    })
                end
            end
        end
    end

    return result
end

function GetPropsData(id)
    local result = {}

    local playerPed = PlayerPedId()
    local drawableCount = GetNumberOfPedPropDrawableVariations(playerPed, id) - 1

    for drawable = 0, drawableCount do
        local textureCount = GetNumberOfPedPropTextureVariations(playerPed, id, drawable) - 1

        for texture = 0, textureCount do
            local hash = GetHashNameForProp(playerPed, id, drawable, texture)

            if hash ~= 0 then
                local prop, drawable, texture, gxt = GetPropDataFromHash(hash)

                -- only named props
                if gxt ~= '' then
                    label = GetLabelText(gxt)
                    if label == 'NULL' then
                        label = "prop: ("..prop..", "..drawable..", "..texture..")"
                    end
                    table.insert(result, {
                        name = label,
                        prop = prop,
                        drawable = drawable,
                        texture = texture
                    })
                else
                    table.insert(result, {
                        name = "prop: ("..prop..", "..drawable..", "..texture..")",
                        prop = prop,
                        drawable = drawable,
                        texture = texture
                    })
                end
            end
        end
    end

    return result
end

function GetClothesData()
    local result = {
        topsover = {},
        topsunder = {},
        pants = {},
        shoes = {},
        bags = {},
        neckarms = {},
        hats = {},
        masks = {},
        arms = {},
        ears = {},
        glasses = {},
        lefthands = {},
        righthands = {},
    }

    result.topsover = GetComponentsData(11)
    result.topsunder = GetComponentsData(8)
    result.pants = GetComponentsData(4)
    result.shoes = GetComponentsData(6)
    result.masks = GetComponentsData(1)
    result.arms = GetComponentsData(3)
    result.bags = GetComponentsData(5)   -- there seems to be no named components in this category
    result.neckarms = GetComponentsData(7)  -- chains/ties/suspenders/bangles

    result.hats = GetPropsData(0)
    result.ears = GetPropsData(2)
    result.glasses = GetPropsData(1)
    result.lefthands = GetPropsData(6)
    result.righthands = GetPropsData(7)

    return result
end

function GetDefaultCharacter(isMale)
    local result = {
        sex = 1,
        mom = 21,
        dad = 0,
        face_md_weight = 50,
        skin_md_weight = 50,
        nose_1 = 0,
        nose_2 = 0,
        nose_3 = 0,
        nose_4 = 0,
        nose_5 = 0,
        nose_6 = 0,
        cheeks_1 = 0,
        cheeks_2 = 0,
        cheeks_3 = 0,
        lip_thickness = 0,
        jaw_1 = 0,
        jaw_2 = 0,
        chin_1 = 0,
        chin_2 = 0,
        chin_3 = 0,
        chin_4 = 0,
        neck_thickness = 0,
        hair_1 = 0,
        hair_2 = 0,
        hair_color_1 = 0,
        hair_color_2 = 0,
        tshirt_1 = 0,
        tshirt_2 = 0,
        torso_1 = 0,
        torso_2 = 0,
        decals_1 = 0,
        decals_2 = 0,
        arms = 15,
        arms_2 = 0,
        pants_1 = 0,
        pants_2 = 0,
        shoes_1 = 0,
        shoes_2 = 0,
        mask_1 = 0,
        mask_2 = 0,
        bproof_1 = 0,
        bproof_2 = 0,
        neckarm_1 = 0,
        neckarm_2 = 0,
        helmet_1 = -1,
        helmet_2 = 0,
        glasses_1 = -1,
        glasses_2 = 0,
        lefthand_1 = -1,
        lefthand_2 = 0,
        righthand_1 = -1,
        righthand_2 = 0,
        bags_1 = 0,
        bags_2 = 0,
        eye_color = 0,
        eye_squint = 0,
        eyebrows_2 = 100,
        eyebrows_1 = 0,
        eyebrows_3 = 0,
        eyebrows_4 = 0,
        eyebrows_5 = 0,
        eyebrows_6 = 0,
        makeup_type = 0,
        makeup_1 = 255,
        makeup_2 = 100,
        makeup_3 = 255,
        makeup_4 = 255,
        lipstick_1 = 255,
        lipstick_2 = 100,
        lipstick_3 = 0,
        lipstick_4 = 0,
        ears_1 = -1,
        ears_2 = 0,
        chest_1 = 255,
        chest_2 = 100,
        chest_3 = 0,
        chest_4 = 0,
        bodyb_1 = 255,
        bodyb_2 = 100,
        bodyb_3 = 255,
        bodyb_4 = 100,
        age_1 = 255,
        age_2 = 100,
        blemishes_1 = 255,
        blemishes_2 = 100,
        blush_1 = 255,
        blush_2 = 100,
        blush_3 = 0,
        complexion_1 = 255,
        complexion_2 = 100,
        sun_1 = 255,
        sun_2 = 100,
        moles_1 = 255,
        moles_2 = 100,
        beard_1 = 255,
        beard_2 = 100,
        beard_3 = 0,
        beard_4 = 0
    }

    if isMale then
        result['sex'] = 0
        result['torso_1'] = 15
        result['tshirt_1'] = 15
        result['pants_1'] = 61
        result['shoes_1'] = 34
    else
        result['torso_1'] = 18
        result['tshirt_1'] = 2
        result['pants_1'] = 19
        result['shoes_1'] = 35
    end

    return result
end

function LoadModel(model, playIdleWhenLoaded)
    isModelLoaded = false

    local playerPed = PlayerPedId()
    local characterModel = model

    SetEntityInvincible(playerPed, true)
    if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
        RequestModel(characterModel)
        while not HasModelLoaded(characterModel) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), characterModel)
        SetModelAsNoLongerNeeded(characterModel)
        FreezePedCameraRotation(playerPed, true)
    end
    SetEntityInvincible(playerPed, false)

    if playIdleWhenLoaded then
        PlayIdleAnimation(IsPedMale(playerPed))
    end

    isModelLoaded = true
end

function PlayIdleAnimation(isMale)
    if isMale == nil then
        isMale = (currentChar.sex == 0)
    end

    local animDict = 'anim@heists@heist_corona@team_idles@female_a'

    if isMale then
        animDict = 'anim@heists@heist_corona@team_idles@male_c'
    end

    while not HasAnimDictLoaded(animDict) do
        RequestAnimDict(animDict)
        Wait(100)
    end

    local playerPed = PlayerPedId()
    ClearPedTasksImmediately(playerPed)
    TaskPlayAnim(playerPed, animDict, 'idle', 1.0, 1.0, -1, 1, 1, 0, 0, 0)
end

function ClearAllAnimations()
    ClearPedTasksImmediately(PlayerPedId())

    if HasAnimDictLoaded('anim@heists@heist_corona@team_idles@female_a') then
        RemoveAnimDict('anim@heists@heist_corona@team_idles@female_a')
    end

    if HasAnimDictLoaded('anim@heists@heist_corona@team_idles@male_c') then
        RemoveAnimDict('anim@heists@heist_corona@team_idles@male_c')
    end
end

RegisterNetEvent("prp-clothing_new:client:LoadCharacter")
AddEventHandler("prp-clothing_new:client:LoadCharacter", function(data, playIdleWhenLoaded, isNew, pedModel, charPed)
    InitializeScript(true, data, playIdleWhenLoaded, isNew, pedModel, charPed)
end)

-- Loading character data
function LoadCharacter(data, playIdleWhenLoaded, newFormat, model, convert, charPed)
    for k, v in pairs(data) do
        currentChar[k] = v
    end

    LoadModel(model, playIdleWhenLoaded)

    local playerPed = charPed
    if charPed == nil then
        playerPed = PlayerPedId()
    end

    if newFormat == 1 then
        if data.face_md_weight == nil then -- double checking
            return LoadCharacter(data, playIdleWhenLoaded, 0, model, convert, charPed)
        end
        -- Face Blend
        local weightFace = data.face_md_weight / 100 + 0.0
        local weightSkin = data.skin_md_weight / 100 + 0.0
        SetPedHeadBlendData(playerPed, data.mom, data.dad, 0, data.mom, data.dad, 0, weightFace, weightSkin, 0.0, false)

        -- Facial Features
        SetPedFaceFeature(playerPed, 0,  (data.nose_1 / 100)         + 0.0)  -- Nose Width
        SetPedFaceFeature(playerPed, 1,  (data.nose_2 / 100)         + 0.0)  -- Nose Peak Height
        SetPedFaceFeature(playerPed, 2,  (data.nose_3 / 100)         + 0.0)  -- Nose Peak Length
        SetPedFaceFeature(playerPed, 3,  (data.nose_4 / 100)         + 0.0)  -- Nose Bone Height
        SetPedFaceFeature(playerPed, 4,  (data.nose_5 / 100)         + 0.0)  -- Nose Peak Lowering
        SetPedFaceFeature(playerPed, 5,  (data.nose_6 / 100)         + 0.0)  -- Nose Bone Twist
        SetPedFaceFeature(playerPed, 6,  (data.eyebrows_5 / 100)     + 0.0)  -- Eyebrow height
        SetPedFaceFeature(playerPed, 7,  (data.eyebrows_6 / 100)     + 0.0)  -- Eyebrow depth
        SetPedFaceFeature(playerPed, 8,  (data.cheeks_1 / 100)       + 0.0)  -- Cheekbones Height
        SetPedFaceFeature(playerPed, 9,  (data.cheeks_2 / 100)       + 0.0)  -- Cheekbones Width
        SetPedFaceFeature(playerPed, 10, (data.cheeks_3 / 100)       + 0.0)  -- Cheeks Width
        SetPedFaceFeature(playerPed, 11, (data.eye_squint / 100)     + 0.0)  -- Eyes squint
        SetPedFaceFeature(playerPed, 12, (data.lip_thickness / 100)  + 0.0)  -- Lip Fullness
        SetPedFaceFeature(playerPed, 13, (data.jaw_1 / 100)          + 0.0)  -- Jaw Bone Width
        SetPedFaceFeature(playerPed, 14, (data.jaw_2 / 100)          + 0.0)  -- Jaw Bone Length
        SetPedFaceFeature(playerPed, 15, (data.chin_1 / 100)         + 0.0)  -- Chin Height
        SetPedFaceFeature(playerPed, 16, (data.chin_2 / 100)         + 0.0)  -- Chin Length
        SetPedFaceFeature(playerPed, 17, (data.chin_3 / 100)         + 0.0)  -- Chin Width
        SetPedFaceFeature(playerPed, 18, (data.chin_4 / 100)         + 0.0)  -- Chin Hole Size
        SetPedFaceFeature(playerPed, 19, (data.neck_thickness / 100) + 0.0)  -- Neck Thickness

        -- Appearance
        SetPedComponentVariation(playerPed, 2, data.hair_1, data.hair_2, 2)                  -- Hair Style
        SetPedHairColor(playerPed, data.hair_color_1, data.hair_color_2)                     -- Hair Color
        SetPedHeadOverlay(playerPed, 2, data.eyebrows_1, data.eyebrows_2 / 100 + 0.0)        -- Eyebrow Style + Opacity
        SetPedHeadOverlayColor(playerPed, 2, 1, data.eyebrows_3, data.eyebrows_4)            -- Eyebrow Color
        SetPedHeadOverlay(playerPed, 1, data.beard_1, data.beard_2 / 100 + 0.0)              -- Beard Style + Opacity
        SetPedHeadOverlayColor(playerPed, 1, 1, data.beard_3, data.beard_4)                  -- Beard Color

        SetPedHeadOverlay(playerPed, 0, data.blemishes_1, data.blemishes_2 / 100 + 0.0)      -- Skin blemishes + Opacity
        SetPedHeadOverlay(playerPed, 12, data.bodyb_3, data.bodyb_4 / 100 + 0.0)             -- Skin blemishes body effect + Opacity

        SetPedHeadOverlay(playerPed, 11, data.bodyb_1, data.bodyb_2 / 100 + 0.0)             -- Body Blemishes + Opacity

        SetPedHeadOverlay(playerPed, 3, data.age_1, data.age_2 / 100 + 0.0)                  -- Age + opacity
        SetPedHeadOverlay(playerPed, 6, data.complexion_1, data.complexion_2 / 100 + 0.0)    -- Complexion + Opacity
        SetPedHeadOverlay(playerPed, 9, data.moles_1, data.moles_2 / 100 + 0.0)              -- Moles/Freckles + Opacity
        SetPedHeadOverlay(playerPed, 7, data.sun_1, data.sun_2 / 100 + 0.0)                  -- Sun Damage + Opacity
        SetPedEyeColor(playerPed, data.eye_color)                                            -- Eyes Color
        SetPedHeadOverlay(playerPed, 4, data.makeup_1, data.makeup_2 / 100 + 0.0)            -- Makeup + Opacity
        SetPedHeadOverlayColor(playerPed, 4, 0, data.makeup_3, data.makeup_4)                -- Makeup Color
        SetPedHeadOverlay(playerPed, 5, data.blush_1, data.blush_2 / 100 + 0.0)              -- Blush + Opacity
        SetPedHeadOverlayColor(playerPed, 5, 2,	data.blush_3)                                -- Blush Color
        SetPedHeadOverlay(playerPed, 8, data.lipstick_1, data.lipstick_2 / 100 + 0.0)        -- Lipstick + Opacity
        SetPedHeadOverlayColor(playerPed, 8, 2, data.lipstick_3, data.lipstick_4)            -- Lipstick Color
        SetPedHeadOverlay(playerPed, 10, data.chest_1, data.chest_2 / 100 + 0.0)             -- Chest Hair + Opacity
        SetPedHeadOverlayColor(playerPed, 10, 1, data.chest_3, data.chest_4)                 -- Chest Hair Color

        -- Clothing and Accessories
        SetPedComponentVariation(playerPed, 8,  data.tshirt_1, data.tshirt_2, 2)        -- Undershirts
        SetPedComponentVariation(playerPed, 11, data.torso_1,  data.torso_2,  2)        -- Jackets
        SetPedComponentVariation(playerPed, 3,  data.arms,     data.arms_2,   2)        -- Torsos
        SetPedComponentVariation(playerPed, 10, data.decals_1, data.decals_2, 2)        -- Decals
        SetPedComponentVariation(playerPed, 4,  data.pants_1,  data.pants_2,  2)        -- Legs
        SetPedComponentVariation(playerPed, 6,  data.shoes_1,  data.shoes_2,  2)        -- Shoes
        SetPedComponentVariation(playerPed, 1,  data.mask_1,   data.mask_2,   2)        -- Masks
        SetPedComponentVariation(playerPed, 9,  data.bproof_1, data.bproof_2, 2)        -- Vests
        SetPedComponentVariation(playerPed, 7,  data.neckarm_1,  data.neckarm_2,  2)    -- Necklaces/Chains/Ties/Suspenders
        SetPedComponentVariation(playerPed, 5,  data.bags_1,   data.bags_2,   2)        -- Bags

        if data.helmet_1 == -1 then
            ClearPedProp(playerPed, 0)
        else
            SetPedPropIndex(playerPed, 0, data.helmet_1, data.helmet_2, 2)          -- Hats
        end

        if data.glasses_1 == -1 then
            ClearPedProp(playerPed, 1)
        else
            SetPedPropIndex(playerPed, 1, data.glasses_1, data.glasses_2, 2)        -- Glasses
        end

        if data.lefthand_1 == -1 then
            ClearPedProp(playerPed, 6)
        else
            SetPedPropIndex(playerPed, 6, data.lefthand_1, data.lefthand_2, 2)      -- Left Hand Accessory
        end

        if data.righthand_1 == -1 then
            ClearPedProp(playerPed,	7)
        else
            SetPedPropIndex(playerPed, 7, data.righthand_1, data.righthand_2, 2)    -- Right Hand Accessory
        end

        if data.ears_1 == -1 then
            ClearPedProp(playerPed, 2)
        else
            SetPedPropIndex (playerPed, 2, data.ears_1, data.ears_2, 2)             -- Ear Accessory
        end
    else
        local ped = playerPed

        for i = 0, 11 do
            SetPedComponentVariation(ped, i, 0, 0, 0)
        end

        for i = 0, 7 do
            ClearPedProp(ped, i)
        end

        -- Face
        SetPedHeadBlendData(ped, data["face"].item, data["face"].item, data["face"].item, data["face"].texture, data["face"].texture, data["face"].texture, 1.0, 1.0, 1.0, true)

        -- Pants
        SetPedComponentVariation(ped, 4, data["pants"].item, 0, 0)
        SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)

        -- Hair
        SetPedComponentVariation(ped, 2, data["hair"].item, 0, 0)
        SetPedHairColor(ped, data["hair"].texture, data["hair"].texture)

        -- Eyebrows
        SetPedHeadOverlay(ped, 2, data["eyebrows"].item, 1.0)
        SetPedHeadOverlayColor(ped, 2, 1, data["eyebrows"].texture, 0)

        -- Eyes
        --SetPedComponentVariation(ped, 7, data["eyes"].item, 0, 0)
        SetPedEyeColor(ped, data["eyes"].texture)

        -- Beard
        SetPedHeadOverlay(ped, 1, data["beard"].item, 1.0)
        SetPedHeadOverlayColor(ped, 1, 1, data["beard"].texture, 0)

        -- Blush
        SetPedHeadOverlay(ped, 5, data["blush"].item, 1.0)
        SetPedHeadOverlayColor(ped, 5, 1, data["blush"].texture, 0)

        -- Lipstick
        SetPedHeadOverlay(ped, 8, data["lipstick"].item, 1.0)
        SetPedHeadOverlayColor(ped, 8, 1, data["lipstick"].texture, 0)

        -- Makeup
        SetPedHeadOverlay(ped, 4, data["makeup"].item, 1.0)
        SetPedHeadOverlayColor(ped, 4, 1, data["makeup"].texture, 0)

        -- Ageing
        SetPedHeadOverlay(ped, 3, data["ageing"].item, 1.0)
        SetPedHeadOverlayColor(ped, 3, 1, data["ageing"].texture, 0)

        -- Arms
        SetPedComponentVariation(ped, 3, data["arms"].item, 0, 2)
        SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)

        -- T-Shirt
        SetPedComponentVariation(ped, 8, data["t-shirt"].item, 0, 2)
        SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)

        -- Vest
        SetPedComponentVariation(ped, 9, data["vest"].item, 0, 2)
        SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)

        -- Torso 2
        SetPedComponentVariation(ped, 11, data["torso2"].item, 0, 2)
        SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)

        -- Shoes
        SetPedComponentVariation(ped, 6, data["shoes"].item, 0, 2)
        SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)

        -- Mask
        SetPedComponentVariation(ped, 1, data["mask"].item, 0, 2)
        SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)

        -- Badge
        SetPedComponentVariation(ped, 10, data["decals"].item, 0, 2)
        SetPedComponentVariation(ped, 10, data["decals"].item, data["decals"].texture, 0)

        -- Accessory
        SetPedComponentVariation(ped, 7, data["accessory"].item, 0, 2)
        SetPedComponentVariation(ped, 7, data["accessory"].item, data["accessory"].texture, 0)

        -- Bag
        SetPedComponentVariation(ped, 5, data["bag"].item, 0, 2)
        SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)

        -- Hat
        if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
            SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)
        else
            ClearPedProp(ped, 0)
        end

        -- Glass
        if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
            SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)
        else
            ClearPedProp(ped, 1)
        end

        -- Ear
        if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
            SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)
        else
            ClearPedProp(ped, 2)
        end

        -- Watch
        if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
            SetPedPropIndex(ped, 6, data["watch"].item, data["watch"].texture, true)
        else
            ClearPedProp(ped, 6)
        end

        -- Bracelet
        if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
            SetPedPropIndex(ped, 7, data["bracelet"].item, data["bracelet"].texture, true)
        else
            ClearPedProp(ped, 7)
        end

        if convert then
            print("Converting to the new skin format....")
            oldChar = ConvertToNewFormat(data)
            new = 1
            TriggerServerEvent('cui_character:save', oldChar, model, new)
            print("Converted skin successfully")
        end
    end
end

-- Map Locations
function GetDistanceToLocation(locations)
    local result = 1000
    local pedPosition = GetEntityCoords(PlayerPedId())

    for i = 1, #locations do
        local loc = locations[i]
		local distance = #(vector3(pedPosition.x, pedPosition.y, pedPosition.z)-vector3(loc[1], loc[2], loc[3]))
        --local distance = GetDistanceBetweenCoords(pedPosition.x, pedPosition.y, pedPosition.z, loc[1], loc[2], loc[3], true)

        if distance < result then
            result = distance
        end
        if (distance < 20.0) and (distance > 1.0) then
            DrawMarker(
                20,
                loc[1], loc[2], loc[3] + 1.0,
                0.0, 0.0, 0.0,
                0.0, 0.0, 0.0,
                0.2, 0.2, 0.2,
                45, 110, 185, 128,
                true,   -- move up and down
                false,
                2,
                true,  -- rotate
                nil,
                nil,
                false
            )
        end
    end

    return result
end

function DisplayTooltip(suffix)
    SetTextComponentFormat('STRING')
    AddTextComponentString('Press ~INPUT_PICKUP~ to ' .. suffix)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ConvertToNewFormat(data, ignoreDefault)
    local convertedData = {}
    if not ignoreDefault then
        convertedData = {
            sex = 1,
            mom = 21,
            dad = 0,
            face_md_weight = 1.0,
            skin_md_weight = 1.0,
            nose_1 = 0,
            nose_2 = 0,
            nose_3 = 0,
            nose_4 = 0,
            nose_5 = 0,
            nose_6 = 0,
            cheeks_1 = 0,
            cheeks_2 = 0,
            cheeks_3 = 0,
            lip_thickness = 0,
            jaw_1 = 0,
            jaw_2 = 0,
            chin_1 = 0,
            chin_2 = 0,
            chin_3 = 0,
            chin_4 = 0,
            neck_thickness = 0,
            hair_2 = 0,
            eye_color = 0,
            eye_squint = 0,
            eyebrows_2 = 100,
            eyebrows_4 = 0,
            eyebrows_5 = 0,
            eyebrows_6 = 0,
            makeup_type = 0,
            makeup_2 = 100,
            makeup_4 = 0,
            lipstick_2 = 100,
            lipstick_4 = 0,
            chest_1 = 255,
            chest_2 = 100,
            chest_3 = 0,
            chest_4 = 0,
            bodyb_1 = 255,
            bodyb_2 = 100,
            bodyb_3 = 255,
            bodyb_4 = 100,
            age_2 = 100,
            blemishes_1 = 255,
            blemishes_2 = 100,
            blush_2 = 100,
            blush_3 = 0,
            complexion_1 = 255,
            complexion_2 = 100,
            sun_1 = 255,
            sun_2 = 100,
            moles_1 = 255,
            moles_2 = 100,
            beard_2 = 100,
            beard_4 = 0
        }
    end

    if data["hair"] ~= nil then
        convertedData.hair_1 = data["hair"].item
        convertedData.hair_color_1 = data["hair"].texture
        convertedData.hair_color_2 = data["hair"].texture
    end

    if data["decals"] ~= nil then
        convertedData.decals_1 = data["decals"].item
        convertedData.decals_2 = data["decals"].texture
    end

    if data["torso2"] ~= nil then
        convertedData.torso_1 = data["torso2"].item
        convertedData.torso_2 = data["torso2"].texture
    end

    if data["t-shirt"] ~= nil then
        convertedData.tshirt_1 = data["t-shirt"].item
        convertedData.tshirt_2 = data["t-shirt"].texture
    end

    if data["vest"] ~= nil then
        convertedData.bproof_1 = data["vest"].item
        convertedData.bproof_2 = data["vest"].texture
    end

    if data["mask"] ~= nil then
        convertedData.mask_1 = data["mask"].item
        convertedData.mask_2 = data["mask"].texture
    end

    if data["shoes"] ~= nil then
        convertedData.shoes_1 = data["shoes"].item
        convertedData.shoes_2 = data["shoes"].texture
    end

    if data["pants"] ~= nil then
        convertedData.pants_1 = data["pants"].item
        convertedData.pants_2 = data["pants"].texture
    end

    if data["arms"] ~= nil then
        if type(data["arms"]) == 'table' then -- had to check if the item exists because it's called arms in the old and the new format
            convertedData.arms = data["arms"].item
            convertedData.arms_2 = data["arms"].texture
        end
    end

    if data["bracelet"] ~= nil then
        convertedData.righthand_1 = data["bracelet"].item
        convertedData.righthand_2 = data["bracelet"].texture
    end

    if data["watch"] ~= nil then
        convertedData.lefthand_1 = data["watch"].item
        convertedData.lefthand_2 = data["watch"].texture
    end

    if data["glass"] ~= nil then
        convertedData.glasses_1 = data["glass"].item
        convertedData.glasses_2 = data["glass"].texture
    end

    if data["hat"] ~= nil then
        convertedData.helmet_1 = data["hat"].item
        convertedData.helmet_2 = data["hat"].texture
    end

    if data["accessory"] ~= nil then
        convertedData.neckarm_1 = data["accessory"].item
        convertedData.neckarm_2 = data["accessory"].texture
    end

    if data["beard"] ~= nil then
        convertedData.beard_1 = data["beard"].item
        convertedData.beard_3 = data["beard"].texture
    end

    if data["blush"] ~= nil then
        convertedData.blush_1 = data["blush"].item
    end

    if data["ageing"] ~= nil then
        convertedData.age_1 = data["ageing"].item
    end

    if data["ear"] ~= nil then
        convertedData.ears_1 = data["ear"].item
        convertedData.ears_2 = data["ear"].texture
    end

    if data["lipstick"] ~= nil then
        convertedData.lipstick_1 = data["lipstick"].item
        convertedData.lipstick_3 = data["lipstick"].texture
    end

    if data["makeup"] ~= nil then
        convertedData.makeup_1 = data["makeup"].item
        convertedData.makeup_3 = data["makeup"].texture
    end

    if data["eyebrows"] ~= nil then
        convertedData.eyebrows_1 = data["eyebrows"].item
        convertedData.eyebrows_3 = data["eyebrows"].texture
    end

    if data["bag"] ~= nil then
        convertedData.bags_1 = data["bag"].item
        convertedData.bags_2 = data["bag"].texture
    end

   if IsPedMale(PlayerPedId()) then
       convertedData['sex'] = 0
   end
   return convertedData
end

Citizen.CreateThread(function()
    while true do
        --  TODO: make nearby players invisible while using these,
        --  use https://runtime.fivem.net/doc/natives/?_0xE135A9FF3F5D05D8
        --  TODO: possibly charge money for use

        local inRange = false

        if Config.EnableClothingShops then
            local dstCloth = GetDistanceToLocation(Config.ClothingShops)
            if (dstCloth < 2.5) and (not isVisible) then
                inRange = true
                DisplayTooltip('use clothing store.')
                if IsControlJustPressed(1, 38) then
                    TriggerEvent('cui_character:open', { 'apparel' })
                end
            end
        end

        if Config.EnableBarberShops then
            local dstBarber = GetDistanceToLocation(Config.BarberShops)
            if (dstBarber < 2.5) and (not isVisible) then
                inRange = true
                DisplayTooltip('use barber shop.')
                if IsControlJustPressed(1, 38) then
                    TriggerEvent('cui_character:open', { 'style' })
                end
            end
        end

        if Config.EnablePlasticSurgeryUnits then
            local dstSurgery = GetDistanceToLocation(Config.PlasticSurgeryUnits)
            if (dstSurgery < 1.5) and (not isVisible) then
                inRange = true
                DisplayTooltip('use plastic surgery unit.')
                if IsControlJustPressed(1, 38) then
                    TriggerEvent('cui_character:open', { 'features', 'style', 'identity' })
                end
            end
        end

        if Config.EnableNewIdentityProviders then
            local dstIdentity = GetDistanceToLocation(Config.NewIdentityProviders)
            if (dstIdentity < 2.5) and (not isVisible) then
                inRange = true
                DisplayTooltip('change your identity.')
                if IsControlJustPressed(1, 38) then
                    TriggerEvent('cui_character:open', { 'identity' })
                end
            end
        end

        if not inRange then
            Citizen.Wait(2500)
        end

        Citizen.Wait(0)
    end
end)

RegisterNetEvent("prp-clothing_new:client:openOutfitMenu")
AddEventHandler("prp-clothing_new:client:openOutfitMenu", function()
    TriggerEvent('cui_character:open', { 'myOutfits' }, true)
end)

function GetMyOutfitsData()
    local rtval = nil
    PRPCore.Functions.TriggerCallback("prp-clothing_new:server:getMyOutfits", function(outfits)
        if outfits then
            for k, v in pairs(outfits) do
                if v.new ~= 1 then
                    outfits[k].skin = ConvertToNewFormat(outfits[k].skin)
                end
            end
        end
        rtval = outfits
    end, model)
    while rtval == nil do
        Citizen.Wait(100)
    end
    return rtval
end

function GetJobOutfits()
    local PlayerData = PRPCore.Functions.GetPlayerData()
    local jobOutfits = nil
    local rtval = {}
    local configString = json.encode(Config)
    if Config.Outfits[PlayerData.job.name] then
        model = GetEntityModel(PlayerPedId())
        jobOutfits = json.decode(configString).Outfits[PlayerData.job.name]["female"]
        if model == GetHashKey("mp_m_freemode_01") then
            jobOutfits = json.decode(configString).Outfits[PlayerData.job.name]["male"]
        end
        for k, v in pairs(jobOutfits) do
            if not v.new then
                jobOutfits[k]["outfitData"] = ConvertToNewFormat(jobOutfits[k]["outfitData"], true)
            end
            if rtval[k] == nil then
                rtval[k] = {}
                rtval[k]["outfitLabel"] = jobOutfits[k]["outfitLabel"]
                rtval[k]["outfitData"] = {}
                rtval[k]["outfitData"] = jobOutfits[k]["outfitData"]
            end
        end
        return rtval
    end
    return nil
end

function GetMaxValues()
    local maxValues = {
        ["arms"]          = {type = "variation",         id = 3},
        ["arms_2"]        = {type = "variationTexture",  id = 3},
        ["tshirt_1"]      = {type = "variation",         id = 8},
        ["tshirt_2"]      = {type = "variationTexture",  id = 8},
        ["torso_1"]       = {type = "variation",         id = 11},
        ["torso_2"]       = {type = "variationTexture",  id = 11},
        ["pants_1"]       = {type = "variation",         id = 4},
        ["pants_2"]       = {type = "variationTexture",  id = 4},
        ["bproof_1"]      = {type = "variation",         id = 9},
        ["bproof_2"]      = {type = "variationTexture",  id = 9},
        ["shoes_1"]       = {type = "variation",         id = 6},
        ["shoes_2"]       = {type = "variationTexture",  id = 6},
        ["bags_1"]        = {type = "variation",         id = 5},
        ["bags_2"]        = {type = "variationTexture",  id = 5},
        ["hair_1"]        = {type = "variation",         id = 2},
        ["mask_1"]        = {type = "mask",              id = 1},
        ["mask_2"]        = {type = "maskTexture",       id = 1},
        ["helmet_1"]      = {type = "prop",              id = 0},
        ["helmet_2"]      = {type = "propTexture",       id = 0},
        ["glasses_1"]     = {type = "prop",              id = 1},
        ["glasses_2"]     = {type = "propTexture",       id = 1},
        ["ears_1"]        = {type = "prop",              id = 2},
        ["ears_2"]        = {type = "propTexture",       id = 2},
        ["lefthand_1"]    = {type = "prop",              id = 6},
        ["lefthand_2"]    = {type = "propTexture",       id = 6},
        ["righthand_1"]   = {type = "prop",              id = 7},
        ["righthand_2"]   = {type = "propTexture",       id = 7},
        ["neckarm_1"]     = {type = "variation",         id = 7},
        ["neckarm_2"]     = {type = "variationTexture",  id = 7},
        ["decals_1"]      = {type = "variation",         id = 10},
        ["decals_2"]      = {type = "variationTexture",  id = 10},
    }
    local me = PlayerPedId()

    for k, v in pairs(maxValues) do
        if v.type == "variation" then
            maxValues[k].maxNum = GetNumberOfPedDrawableVariations(me, v.id)
        end

        if v.type == "variationTexture" then
            maxValues[k].maxNum = GetNumberOfPedTextureVariations(me, v.id, GetPedDrawableVariation(me, v.id)) -1
        end

        if v.type == "mask" then
            maxValues[k].maxNum = GetNumberOfPedDrawableVariations(me, v.id)
        end

        if v.type == "maskTexture" then
            maxValues[k].maxNum = GetNumberOfPedTextureVariations(me, v.id, GetPedDrawableVariation(me, v.id))
        end

        if v.type == "prop" then
            maxValues[k].maxNum = GetNumberOfPedPropDrawableVariations(me, v.id)
        end

        if v.type == "propTexture" then
            maxValues[k].maxNum = GetNumberOfPedPropTextureVariations(me, v.id, GetPedPropIndex(me, v.id))
        end
    end
    return maxValues
end

-- Map Blips
Citizen.CreateThread(function()
    if Config.EnableClothingShops then
        for k, v in ipairs(Config.ClothingShopsBlips) do
            local clothingBlip = AddBlipForCoord(Config.ClothingShopsBlips[k].x, Config.ClothingShopsBlips[k].y, Config.ClothingShopsBlips[k].z)
            SetBlipSprite(clothingBlip, 366)
            SetBlipDisplay(clothingBlip, 4)
            SetBlipScale  (clothingBlip, 0.45)
            SetBlipAsShortRange(clothingBlip, true)
            SetBlipColour(clothingBlip, 47)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName("Clothing Store")
            EndTextCommandSetBlipName(clothingBlip)
        end
    end

    if Config.EnableBarberShops then
        for k, v in ipairs(Config.BarberShops) do
            local barberBlip = AddBlipForCoord(Config.BarberShops[k].x, Config.BarberShops[k].y, Config.BarberShops[k].z)
            SetBlipSprite(barberBlip, 366)
            SetBlipDisplay(barberBlip, 4)
            SetBlipScale  (barberBlip, 0.45)
            SetBlipAsShortRange(barberBlip, true)
            SetBlipColour(barberBlip, 47)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName("Barber")
            EndTextCommandSetBlipName(barberBlip)
        end
    end
end)

RegisterNUICallback("SetMyOutfit", function(data, cb)
    local id = data.id
    if not data.outfitData then
        PRPCore.Functions.TriggerCallback("prp-clothing_new:server:GetOutfitById", function(outfit)
            if outfit then
                outfit["skin"] = json.decode(outfit["skin"])
                if tonumber(outfit["new"]) ~= 1 then
                    outfit["skin"] = ConvertToNewFormat(outfit["skin"])
                end
                currentChar = outfit["skin"]
                LoadCharacter(outfit["skin"], false, 1, model, false)
            end
        end, id, false)
    else
        LoadCharacter(oldChar, false, new, model, false)
        for k, v in pairs(data.outfitData) do
            currentChar[k] = data.outfitData[k]
        end
        LoadCharacter(currentChar, false, 1, model, false)
    end
    cb(true)
end)

RegisterNUICallback("DeleteMyOutfit", function(data, cb)
    local id = data.id
    local cbval = nil
    PRPCore.Functions.TriggerCallback("prp-clothing_new:server:GetOutfitById", function(result)
        cbval = result
    end, id, true, model)
    while cbval == nil do
        Citizen.Wait(100)
    end
    cb(cbval)
end)

RegisterNUICallback('SaveOutfit', function(data, cb)
    local name = data.name
    local mySkin = currentChar
    local cbval = nil
    PRPCore.Functions.TriggerCallback("prp-clothing_new:server:SaveOutfit", function(result)
        cbval = result
    end, model, name, mySkin)
    while cbval == nil do
        Citizen.Wait(100)
    end
    cb(cbval)
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

 Citizen.CreateThread(function()
    while true do

        if isPlayerReady then

            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)

            local inRange = false

            for _, v in ipairs(Config.ClothingRooms) do
                local dist = GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true)

                if dist < 15 then
                    if not creatingCharacter then
                        DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                        if dist < 2 then
                            if v["requiredJob"] == nil or PlayerData.job.name == v.requiredJob then
                                DrawText3Ds(v.x, v.y, v.z + 0.3, '~g~E~w~ - Check Outfits')
                                if IsControlJustPressed(0, 38) then
                                    TriggerEvent('cui_character:open', {'JobOutfits', 'apparel', 'myOutfits' }, true)
                                end
                            end
                        end
                        inRange = true
                    end
                end
            end

            if not inRange then
                Citizen.Wait(2000)
            end

        end

        Citizen.Wait(3)
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

--[[
if Config.EnablePlasticSurgeryUnits then
    Citizen.CreateThread(function()
        for k, v in ipairs(Config.PlasticSurgeryUnits) do
            local blip = AddBlipForCoord(v)
            SetBlipSprite(blip, 102)
            SetBlipColour(blip, 84)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString('Platic Surgery Unit')
            EndTextCommandSetBlipName(blip)
        end
    end)
end

if Config.EnableNewIdentityProviders then
    Citizen.CreateThread(function()
        for k, v in ipairs(Config.NewIdentityProviders) do
            local blip = AddBlipForCoord(v)
            SetBlipSprite(blip, 498)
            SetBlipColour(blip, 84)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString('Municipal Building')
            EndTextCommandSetBlipName(blip)
        end
    end)
end


-- ESX Identity Integration
if Config.EnableESXIdentityIntegration then
    function LoadIdentity(data)
        currentIdentity = {}
        for k, v in pairs(data) do
            currentIdentity[k] = v
        end
    end

    AddEventHandler('esx_skin:resetFirstSpawn', function()
        firstSpawn = true
    end)

    AddEventHandler('cui_character:setCurrentIdentity', function(data)
        currentIdentity = data
    end)
end
]]
