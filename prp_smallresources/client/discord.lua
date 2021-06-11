PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

local totalplayers = 0
Citizen.CreateThread(function()
    Wait(1000)
    while true do
        --This is the Application ID (Replace this with you own)
        SetDiscordAppId(813531700129693707)

        --Here you will have to put the image name for the "large" icon.
        SetDiscordRichPresenceAsset('instaimage')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('https://discord.gg/passionrp')
       
        --Here you will have to put the image name for the "small" icon.
        --SetDiscordRichPresenceAssetSmall('')

        --Here you can add hover text for the "small" icon.
        --SetDiscordRichPresenceAssetSmallText('')

        --It updates every one minute just in case.

        PRPCore.Functions.TriggerCallback('PRPCore:GetPlayersLoop', function(data)
            totalplayers = 0
            for _, player in ipairs(data) do
                totalplayers = totalplayers + 1
            end
        end)

        Wait(200)

        -- Sets the string with variables as RichPresence (Don't touch)
        SetRichPresence(totalplayers.. " players")


        Citizen.Wait(60000)
    end
end)

local firstSpawn = true
AddEventHandler('playerSpawned', function()
    if firstSpawn then
        for _, v in pairs(Config.Buttons) do
            SetDiscordRichPresenceAction(v.index, v.name, v.url)
        end
        firstSpawn = false
    end
end)
