----------------
-- Core Stuff --
----------------
PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

---------------
-- Variables --
---------------
local PlayerData = {}
PlayerJob = {}

local moneymachine_slot = {
	{ x = 1116.75, y = 228.09, z = -49.85 },
	{ x = 1113.72, y = 232.89, z = -49.85 },
	{ x = 1109.7, y = 233.75, z = -49.85 },
	{ x = 1106.12, y = 230.97, z = -49.85 },
	{ x = 1102.56, y = 231.88, z = -49.85 },
	{ x = 1110.43, y = 237.41, z = -49.85 },
	{ x = 1119.47, y = 231.92, z = -49.85 },
	{ x = 1137.44, y = 251.72, z = -51.04 },
	{ x = 1134.28, y = 255.41, z = -51.04 },
	{ x = 1132.92, y = 250.13, z = -51.04 },
	{ x = 1104.59, y = 228.57, z = -49.85 },
}



------------
-- Events --
------------
RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PRPCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
    isLoggedIn = true
end)

RegisterNetEvent('errormessage2')
AddEventHandler('errormessage2', function()
PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "HUD_MINI_GAME_SOUNDSET", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
end)


RegisterNetEvent('spinit2')
AddEventHandler('spinit2', function()
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)

	SendNUIMessage({
			canspin = true
		})
	Citizen.Wait(100)

		SendNUIMessage({
			canspin = false
		})

end)

-------------------
-- NUI Callbacks --
-------------------
RegisterNUICallback('close', function(data, cb)

	SetNuiFocus(false, false)
	SendNUIMessage({
		show = false
	})
	cb("ok")
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)

end)

RegisterNUICallback('payforplayer', function(winnings, cb)
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0, 0, 1)
	TriggerServerEvent('payforplayer2',winnings)
end)


RegisterNUICallback('playerpays', function(bet, cb)
	TriggerServerEvent('playerpays2',bet)
end)


---------------------
-- Citizen Threads --
---------------------
Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local pos = GetEntityCoords(GetPlayerPed(-1), false)
        for k,v in ipairs(moneymachine_slot) do
            if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.0)then
                sleep = 5
                DisplayHelpText("Press ~INPUT_CONTEXT~ ~y~ to play slots")
                if IsControlJustPressed(1, 38) then
                    SendNUIMessage({
                        show = true
                    })
                    SetNuiFocus(true,true)
                    PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
	SetNuiFocus(false, false)
end)

---------------
-- Functions --
---------------
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

