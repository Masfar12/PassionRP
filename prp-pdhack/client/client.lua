--------------------------------------
--------------- PRPCore --------------
--------------------------------------


PRPCore = nil
local isLoggedIn = false
local globalCoords = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)


--------------------------------------
--------------- EVENTS ---------------
--------------------------------------


RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('prp-pdhack:client:StartHack')
AddEventHandler('prp-pdhack:client:StartHack', function()
	PRPCore.Functions.TriggerCallback('prp-pdhack:server:StartCheck', function(cb)
        if cb then

            local ped = GetPlayerPed(-1)
			globalCoords = GetEntityCoords(ped)

			PRPCore.Functions.Progressbar('Hack', 'Connecting USB', 5000, false, false, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function()
			end)
			playAnim('anim@heists@keypad@', 'idle_a', 12000)
			Wait(3000)
			TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_STAND_MOBILE', -1, true)
			Wait(2000)
            FreezeEntityPosition(ped, true)
            TriggerEvent("mhacking:show")
			TriggerEvent("mhacking:start", 7, 13, HackingEvent)
        end
    end)
end)

RegisterNetEvent('prp-pdhack:client:MailMan')
AddEventHandler('prp-pdhack:client:MailMan', function(CurrentCops)
	SetTimeout(math.random(3000, 8000), function()
		TriggerServerEvent('prp-phone:server:sendNewMail', {
			sender = "Hack Team",
			subject = "Police on Duty",
			message = "Psst, a contact on the inside tells me there is "..CurrentCops.." on patrol right now, be careful.",
			button = {
				enabled = false,
				buttonEvent = "prp-drugs:client:setLocation",
				buttonData = waitingDelivery
			}
		})
	end)
end)

RegisterNetEvent('prp-pdhack:client:robberyCall')
AddEventHandler('prp-pdhack:client:robberyCall', function(coords)

    local job = nil
    if PlayerJob == nil then
        job = PRPCore.Functions.GetPlayerData().job.name
    else
        job = PlayerJob.name
    end

    if job == "police" then 
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('prp-policealerts:client:AddPoliceAlert', {
        	timeOut = 30000,
            alertTitle = "PD Hack",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
		})
		
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 459)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("PD Hack")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)


--------------------------------------
------------- FUNCTIONS --------------
--------------------------------------


function HackingEvent(success)
	local ped = GetPlayerPed(-1)
	TriggerEvent('mhacking:hide')
	ClearPedTasks(ped)
	FreezeEntityPosition(ped, false)
	
	if success then
		TriggerServerEvent('prp-pdhack:server:CheckCops')
		TriggerEvent('prp-pdhack:client:robberyCall', globalCoords)
		globalCoords = nil
	else
		MissionText('~r~Mission Failed!~w~ You have failed the hack.', 10000)
		TriggerEvent('prp-pdhack:client:robberyCall', globalCoords)
		globalCoords = nil
	end
end

function MissionText(text, duration)
    ClearPrints()
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(duration, 1)
end

function playAnim(animDict, animName)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 2.0, -2.0, -1, 1, 0, 0, 0, 0 )
	RemoveAnimDict(animDict)
end
