PRPCore = nil
isLoggedIn = false
local requiredItemsShowed = false

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
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

Citizen.CreateThread(function()
	while true do
		local inRange = false

		if PRPCore ~= nil then
			local requiredItems = {
				[1] = {name = PRPCore.Shared.Items["cryptostick"]["name"], image = PRPCore.Shared.Items["cryptostick"]["image"]},
			}
			if isLoggedIn then
				local ped = GetPlayerPed(-1)
				local pos = GetEntityCoords(ped)
				local dist = GetDistanceBetweenCoords(pos, Crypto.Exchange.coords.x, Crypto.Exchange.coords.y, Crypto.Exchange.coords.z, true)

				if dist < 15 then
					inRange = true
					
					if dist < 1.5 then
						if not Crypto.Exchange.RebootInfo.state then
							DrawText3Ds(Crypto.Exchange.coords.x, Crypto.Exchange.coords.y, Crypto.Exchange.coords.z, '~g~E~w~ - USB enter')
							if not requiredItemsShowed then
								requiredItemsShowed = true
								TriggerEvent('inventory:client:requiredItems', requiredItems, true)
							end
							
							if IsControlJustPressed(0, 38) then
								PRPCore.Functions.TriggerCallback('prp-crypto:server:HasSticky', function(HasItem)
									if HasItem then
										TriggerEvent("mhacking:show")
										TriggerEvent("mhacking:start", math.random(4, 6), 25, HackingSuccess)
									else
										PRPCore.Functions.Notify('You do not have a Cryptostick..', 'error')
									end
								end)
							end
						else
							DrawText3Ds(Crypto.Exchange.coords.x, Crypto.Exchange.coords.y, Crypto.Exchange.coords.z, 'System is rebooting - '..Crypto.Exchange.RebootInfo.percentage..'%')
						end
					else
						if requiredItemsShowed then
							requiredItemsShowed = false
							TriggerEvent('inventory:client:requiredItems', requiredItems, false)
						end
					end
				end
			end
		end

		if not inRange then
			Citizen.Wait(5000)
		end

		Citizen.Wait(3)
    end
end)

function ExchangeSuccess()
	TriggerServerEvent('prp-crypto:server:ExchangeSuccess', math.random(1, 10))
end

function ExchangeFail()
	local Odd = 5
	local RemoveChance = math.random(1, Odd)
	local LosingNumber = math.random(1, Odd)

	if RemoveChance == LosingNumber then
		TriggerServerEvent('prp-crypto:server:ExchangeFail')
		TriggerServerEvent('prp-crypto:server:SyncReboot')
		-- Crypto.Exchange.RebootInfo.state = true
		-- SystemCrashCooldown()
	end
end

RegisterNetEvent('prp-crypto:client:SyncReboot')
AddEventHandler('prp-crypto:client:SyncReboot', function()
	Crypto.Exchange.RebootInfo.state = true
	SystemCrashCooldown()
end)

function SystemCrashCooldown()
	Citizen.CreateThread(function()
		while Crypto.Exchange.RebootInfo.state do

			if (Crypto.Exchange.RebootInfo.percentage + 1) <= 100 then
				Crypto.Exchange.RebootInfo.percentage = Crypto.Exchange.RebootInfo.percentage + 1
				TriggerServerEvent('prp-crypto:server:Rebooting', true, Crypto.Exchange.RebootInfo.percentage)
			else
				Crypto.Exchange.RebootInfo.percentage = 0
				Crypto.Exchange.RebootInfo.state = false
				TriggerServerEvent('prp-crypto:server:Rebooting', false, 0)
			end

			Citizen.Wait(1200)
		end
	end)
end

function HackingSuccess(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccess()
    else
		TriggerEvent('mhacking:hide')
		ExchangeFail()
	end
end

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
	isLoggedIn = true
	TriggerServerEvent('prp-crypto:server:FetchWorth')
	TriggerServerEvent('prp-crypto:server:GetRebootState')
end)

RegisterNetEvent('prp-crypto:client:UpdateCryptoWorth')
AddEventHandler('prp-crypto:client:UpdateCryptoWorth', function(crypto, amount, history)
	Crypto.Worth[crypto] = amount
	if history ~= nil then
		Crypto.History[crypto] = history
	end
end)

RegisterNetEvent('prp-crypto:client:GetRebootState')
AddEventHandler('prp-crypto:client:GetRebootState', function(RebootInfo)
	if RebootInfo.state then
		Crypto.Exchange.RebootInfo.state = RebootInfo.state
		Crypto.Exchange.RebootInfo.percentage = RebootInfo.percentage
		SystemCrashCooldown()
	end
end)

Citizen.CreateThread(function()
	isLoggedIn = true
	TriggerServerEvent('prp-crypto:server:FetchWorth')
	TriggerServerEvent('prp-crypto:server:GetRebootState')
end)