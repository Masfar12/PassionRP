PRPCore = nil

local h = math.random(1,400)

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('scratchcard:OpenCard')
AddEventHandler('scratchcard:OpenCard', function()
    OpenCard()
end)

function OpenCard()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openScratchCard',
        prizes = Config.Prizes,
        items = Config.Items,
        currency = Config.CurrencySymbol
    })
end
--        
RegisterNUICallback('wonScratchCard', function(data)
    PRPCore.Functions.Notify("You won $"..comma_value(data.prize), "error", 10000)
    TriggerEvent('scratchcard:i1ii1i111i', h, data.prize)
end)

RegisterNUICallback('lostScratchCard', function()
    PRPCore.Functions.Notify("You lost!", "error", 10000)
    TriggerServerEvent("prp-log:server:CreateLog", "gambling", "Scratchcard", "green", "**"..GetPlayerName(PlayerId()).."** Lost $5000")
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)



function Notif(msg) 
    SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end

function comma_value(amount)
    local formatted = amount
    while true do  
      formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
      if (k==0) then
        break
      end
    end
    return formatted
end

RegisterNetEvent('scratchcard:i1ii1i111i')
AddEventHandler('scratchcard:i1ii1i111i', function(p, prize)
    if p ~= nil then
        if p == h then
            TriggerServerEvent('scratchcard:givePrizeMoney', prize)
        else
            TriggerServerEvent("prp-log:server:CreateLog", "honeypot", "LUA INJECTION", "red", "**"..GetPlayerName(PlayerId()).."** tried to execute reward for scratchcard. Expected: "..h.." Got:"..p)
        end
    else
        TriggerServerEvent("prp-log:server:CreateLog", "honeypot", "LUA INJECTION", "red", "**"..GetPlayerName(PlayerId()).."** tried to execute reward for scratchcard. Got nil")
    end
end)

RegisterNetEvent('scratchcard:close')
AddEventHandler('scratchcard:close', function()
    SendNUIMessage({
        action = 'closeScratchCard',
    })
    SetNuiFocus(false, false)
end)