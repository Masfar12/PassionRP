local guiEnabled = false

function focusNUI (shouldDisplay)
    guiEnabled = shouldDisplay
    SetNuiFocus(guiEnabled, guiEnabled)
end

RegisterNetEvent('prp_help:show')
AddEventHandler('prp_help:show', function()
    focusNUI(true)
    SendNUIMessage({
        type = "help:toggle",
        enable = true,
    })
end)

RegisterNetEvent('prp_help:show')
AddEventHandler('prp_help:show', function()
    focusNUI(true)
    SendNUIMessage({
        type = "help:toggle",
        enable = true,
    })
end)

RegisterNetEvent('prp_help:hide')
AddEventHandler('prp_help:hide', function()
    focusNUI(false)
    SendNUIMessage({
        type = "help:toggle",
        enable = false,
    })
end)

-- This is just in case the resources restarted whilst the NUI is focused (for dev restarting)
Citizen.CreateThread(function()
    TriggerEvent('prp_help:hide')
end)


RegisterNUICallback('escape', function(data, cb)
    TriggerEvent('prp_help:hide')
    cb('ok')
end)

RegisterNUICallback('submitSupportRequest', function(data, cb)
    TriggerServerEvent('prp_help:submitDiscordRequest', data)
    cb('ok')
end)

RegisterCommand('help', function(source, args, rawCommand)
    TriggerEvent('prp_help:show')
end, false)
