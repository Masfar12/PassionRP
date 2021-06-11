---------------
-- Variables --
---------------
local holdingUp = false
local store = ""
local blipRobbery = nil
local isLoggedIn = false
local wave = ""
local rewarded = nil
local rewardposx = nil
local rewardposy = nil
local rewardposz = nil

-------------------
-- PRP Core Stuff --
-------------------
PRPCore = nil
Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
end)


---------------------
-- Local Functions --
---------------------

-- This is used to draw the text on the screen for the timer.
function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

-- This is used to draw the text to start the robbery
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


---------------------
-- Client Handlers --
---------------------
RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('prp_customrob:currentlyRobbing')
AddEventHandler('prp_customrob:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
end)

RegisterNetEvent('prp_customrob:killBlip')
AddEventHandler('prp_customrob:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('prp_customrob:setBlip')
AddEventHandler('prp_customrob:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('prp_customrob:alreadyRobbed')
AddEventHandler('prp_customrob:alreadyRobbed', function()
	PRPCore.Functions.Notify("Merryweather has already been robbed!", "error", 10000)
end)

RegisterNetEvent('prp_customrob:tooFar')
AddEventHandler('prp_customrob:tooFar', function()
	holdingUp, store = false, ''
	PRPCore.Functions.Notify("You strayed too far!", "error", 10000)
end)

RegisterNetEvent('prp_customrob:robberyComplete')
AddEventHandler('prp_customrob:robberyComplete', function(award)
	holdingUp, store = false, ''
	PRPCore.Functions.Notify("Robbery complete!", "success", 10000)
end)

RegisterNetEvent('prp_customrob:startTimer')
AddEventHandler('prp_customrob:startTimer', function()
	local merryped2 = GetHashKey('s_m_y_marine_03')
	local gun = GetHashKey('WEAPON_COMBATPDW')
	local timer = Stores[store].secondsRemaining

	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

RegisterNetEvent('prp-merryweather:client:robberyCall')
AddEventHandler('prp-merryweather:client:robberyCall', function(coords)

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
            alertTitle = "Merryweather Breach",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            callSign = PRPCore.Functions.GetPlayerData().metadata["callsign"],
		})
		
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Merryweather Breach")
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

	Citizen.CreateThread(function()

		local pos = {x = 569.34, y = -3126.35, z = 18.77}
		TriggerServerEvent("prp-merryweather:callCops", pos)

		AddRelationshipGroup('Merryweather')

		PRPCore.Functions.Notify("Wave 1 begins", "success", 10000)
		wave = "1"
		RequestModel(-1275859404)

		while not HasModelLoaded(-1275859404) do
			Citizen.Wait(1)
		end

		merryped1 = CreatePed(30, -1275859404, 552.94647216797, -3117.9782714844, 18.76861000061, 264.44537353516, true, false)
		SetPedArmour(merryped1, 100)
		SetPedAsEnemy(merryped1, true)
		SetPedRelationshipGroupHash(merryped1, 'Merryweather')
		GiveWeaponToPed(merryped1, GetHashKey('weapon_heavysniper'), 250, false, true)
		TaskCombatPed(merryped1, GetPlayerPed(-1))
		SetPedAccuracy(merryped1, 80)
		SetPedDropsWeaponsWhenDead(merryped1, false)
		SetPedSuffersCriticalHits(merryped1, false)


		merryped2 = CreatePed(30, -1275859404, 585.06848144531, -3117.990234375, 18.768590927124, 83.496025085449, true, false)
		SetPedArmour(merryped2, 100)
		SetPedAsEnemy(merryped2, true)
		SetPedRelationshipGroupHash(merryped2, 'Merryweather')
		GiveWeaponToPed(merryped2, GetHashKey('weapon_microsmg'), 250, false, true)
		TaskCombatPed(merryped2, GetPlayerPed(-1))
		SetPedAccuracy(merryped2, 80)
		SetPedDropsWeaponsWhenDead(merryped2, false)
		SetPedSuffersCriticalHits(merryped2, false)

		merryped3 = CreatePed(30, -1275859404, 589.77655029297, -3117.0854492188, 18.710088729858, 81.091339111328, true, false)
		SetPedArmour(merryped3, 100)
		SetPedAsEnemy(merryped3, true)
		SetPedRelationshipGroupHash(merryped3, 'Merryweather')
		GiveWeaponToPed(merryped3, GetHashKey('weapon_microsmg'), 250, false, true)
		TaskCombatPed(merryped3, GetPlayerPed(-1))
		SetPedAccuracy(merryped3, 80)
		SetPedDropsWeaponsWhenDead(merryped3, false)
		SetPedSuffersCriticalHits(merryped3, false)


		merryped4 = CreatePed(30, -1275859404, 589.73980712891, -3119.2443847656, 18.709962844849, 70.214447021484, true, false)
		SetPedArmour(merryped4, 100)
		SetPedAsEnemy(merryped4, true)
		SetPedRelationshipGroupHash(merryped4, 'Merryweather')
		GiveWeaponToPed(merryped4, GetHashKey('weapon_microsmg'), 250, false, true)
		TaskCombatPed(merryped4, GetPlayerPed(-1))
		SetPedAccuracy(merryped4, 80)
		SetPedDropsWeaponsWhenDead(merryped4, false)
		SetPedSuffersCriticalHits(merryped4, false)


		merryped5 = CreatePed(30, -1275859404, 548.47924804688, -3118.5693359375, 18.726892471313, 270.88671875, true, false)
		SetPedArmour(merryped5, 100)
		SetPedAsEnemy(merryped5, true)
		SetPedRelationshipGroupHash(merryped5, 'Merryweather')
		GiveWeaponToPed(merryped5, GetHashKey('weapon_microsmg'), 250, false, true)
		TaskCombatPed(merryped5, GetPlayerPed(-1))
		SetPedAccuracy(merryped5, 80)
		SetPedDropsWeaponsWhenDead(merryped5, false)
		SetPedSuffersCriticalHits(merryped5, false)


		if Config.Debug then
			Citizen.Wait(10000)
		else
			Citizen.Wait(100000)
		end
		PRPCore.Functions.Notify("Wave 2 begins", "success", 10000)
		wave = "2"

		merryped6 = CreatePed(30, -1275859404, 512.55, -3118.49, 25.57, 266.00, true, false)
		SetPedArmour(merryped6, 100)
		SetPedAsEnemy(merryped6, true)
		SetPedRelationshipGroupHash(merryped6, 'Merryweather')
		GiveWeaponToPed(merryped6, GetHashKey('weapon_microsmg'), 250, false, true)
		TaskCombatPed(merryped6, GetPlayerPed(-1))
		SetPedAccuracy(merryped6, 100)
		SetPedDropsWeaponsWhenDead(merryped6, false)
		SetPedSuffersCriticalHits(merryped6, false)

		merryped06 = CreatePed(30, -1275859404, 555.96, -3117.02, 18.77, 238.09, true, false)
		SetPedArmour(merryped06, 100)
		SetPedAsEnemy(merryped06, true)
		SetPedRelationshipGroupHash(merryped06, 'Merryweather')
		GiveWeaponToPed(merryped06, GetHashKey('weapon_combatmg_mk2'), 250, false, true)
		TaskCombatPed(merryped06, GetPlayerPed(-1))
		SetPedAccuracy(merryped06, 100)
		SetPedDropsWeaponsWhenDead(merryped06, false)
		SetPedSuffersCriticalHits(merryped06, false)

		merryped07 = CreatePed(30, -1275859404, 555.96, -3117.02, 18.77, 238.09, true, false)
		SetPedArmour(merryped07, 100)
		SetPedAsEnemy(merryped07, true)
		SetPedRelationshipGroupHash(merryped07, 'Merryweather')
		GiveWeaponToPed(merryped07, GetHashKey('weapon_minigun'), 250, false, true)
		TaskCombatPed(merryped07, GetPlayerPed(-1))
		SetPedAccuracy(merryped07, 100)
		SetPedDropsWeaponsWhenDead(merryped07, false)
		SetPedSuffersCriticalHits(merryped07, false)


		merryped7 = CreatePed(30, -1275859404, 508.17, -3159.81, 6.47, 298.00, true, false)
		SetPedArmour(merryped7, 100)
		SetPedAsEnemy(merryped7, true)
		SetPedRelationshipGroupHash(merryped7, 'Merryweather')
		GiveWeaponToPed(merryped7, GetHashKey('weapon_microsmg'), 250, false, true)
		TaskCombatPed(merryped7, GetPlayerPed(-1))
		SetPedAccuracy(merryped7, 100)
		SetPedDropsWeaponsWhenDead(merryped7, false)
		SetPedSuffersCriticalHits(merryped7, false)


		merryped8 = CreatePed(30, -1275859404, 547.22, -3131.19, 17.47, 266.00, true, false)
		SetPedArmour(merryped8, 50)
		SetPedAsEnemy(merryped8, true)
		SetPedRelationshipGroupHash(merryped8, 'Merryweather')
		GiveWeaponToPed(merryped8, GetHashKey('weapon_pumpshotgun'), 250, false, true)
		TaskCombatPed(merryped8, GetPlayerPed(-1))
		SetPedAccuracy(merryped8, 100)
		SetPedDropsWeaponsWhenDead(merryped8, false)
		SetPedSuffersCriticalHits(merryped8, false)


		merryped9 = CreatePed(30, -1275859404, 501.22, -3126.19, 6.47, 269.00, true, false)
		SetPedArmour(merryped9, 100)
		SetPedAsEnemy(merryped9, true)
		SetPedRelationshipGroupHash(merryped9, 'Merryweather')
		GiveWeaponToPed(merryped9, GetHashKey('weapon_smg'), 250, false, true)
		TaskCombatPed(merryped9, GetPlayerPed(-1))
		SetPedAccuracy(merryped9, 100)
		SetPedDropsWeaponsWhenDead(merryped9, false)
		SetPedSuffersCriticalHits(merryped9, false)


		merryped10 = CreatePed(30, -1275859404, 509.22, -3174.20, 6.47, 319.00, true, false)
		SetPedArmour(merryped10, 100)
		SetPedAsEnemy(merryped10, true)
		SetPedRelationshipGroupHash(merryped10, 'Merryweather')
		GiveWeaponToPed(merryped10, GetHashKey('weapon_smg'), 250, false, true)
		TaskCombatPed(merryped10, GetPlayerPed(-1))
		SetPedAccuracy(merryped10, 100)
		SetPedDropsWeaponsWhenDead(merryped10, false)
		SetPedSuffersCriticalHits(merryped10, false)

		merryped010 = CreatePed(30, -1275859404, 571.03, -3116.07, 18.77, 319.00, true, false)
		SetPedArmour(merryped010, 100)
		SetPedAsEnemy(merryped010, true)
		SetPedRelationshipGroupHash(merryped010, 'Merryweather')
		GiveWeaponToPed(merryped010, GetHashKey('weapon_smg'), 250, false, true)
		TaskCombatPed(merryped010, GetPlayerPed(-1))
		SetPedAccuracy(merryped010, 100)
		SetPedDropsWeaponsWhenDead(merryped010, false)
		SetPedSuffersCriticalHits(merryped010, false)

		merryped011 = CreatePed(30, -1275859404, 569.89, -3116.07, 18.77, 319.00, true, false)
		SetPedArmour(merryped011, 100)
		SetPedAsEnemy(merryped011, true)
		SetPedRelationshipGroupHash(merryped011, 'Merryweather')
		GiveWeaponToPed(merryped011, GetHashKey('weapon_smg'), 250, false, true)
		TaskCombatPed(merryped011, GetPlayerPed(-1))
		SetPedAccuracy(merryped011, 100)
		SetPedDropsWeaponsWhenDead(merryped011, false)
		SetPedSuffersCriticalHits(merryped011, false)


		if Config.Debug then
			Citizen.Wait(10000)
		else
			Citizen.Wait(250000)
		end
		PRPCore.Functions.Notify("Wave 3 begins", "success", 10000)
		wave = "3"

		merryped11 = CreatePed(30, -1275859404, 547.22, -3204.20, 22.47, 359.00, true, false)
		SetPedArmour(merryped11, 100)
		SetPedAsEnemy(merryped11, true)
		SetPedRelationshipGroupHash(merryped11, 'Merryweather')
		GiveWeaponToPed(merryped11, GetHashKey('weapon_smg'), 250, false, true)
		TaskCombatPed(merryped11, GetPlayerPed(-1))
		SetPedShootRate(merryped11, 1000)
		SetPedAccuracy(merryped11, 100)
		SetPedDropsWeaponsWhenDead(merryped11, false)
		SetPedSuffersCriticalHits(merryped11, false)

		merryped011 = CreatePed(30, -1275859404, 547.22, -3204.20, 22.47, 359.00, true, false)
		SetPedArmour(merryped011, 100)
		SetPedAsEnemy(merryped011, true)
		SetPedRelationshipGroupHash(merryped011, 'Merryweather')
		GiveWeaponToPed(merryped011, GetHashKey('weapon_combatmg_mk2'), 250, false, true)
		TaskCombatPed(merryped011, GetPlayerPed(-1))
		SetPedShootRate(merryped011, 1000)
		SetPedAccuracy(merryped011, 100)
		SetPedDropsWeaponsWhenDead(merryped011, false)
		SetPedSuffersCriticalHits(merryped011, false)


		merryped12 = CreatePed(30, -1275859404, 547.22, -3163.22, 6.07, 359.00, true, false)
		SetPedArmour(merryped12, 100)
		SetPedAsEnemy(merryped12, true)
		SetPedShootRate(merryped12, 1000)
		SetPedRelationshipGroupHash(merryped12, 'Merryweather')
		GiveWeaponToPed(merryped12, GetHashKey('weapon_smg'), 250, false, true)
		TaskCombatPed(merryped12, GetPlayerPed(-1))
		SetPedAccuracy(merryped12, 100)
		SetPedDropsWeaponsWhenDead(merryped12, false)
		SetPedSuffersCriticalHits(merryped12, false)


		merryped13 = CreatePed(30, -1275859404, 592.39, -3188.20, 6.47, 50.00, true, false)
		SetPedArmour(merryped13, 100)
		SetPedAsEnemy(merryped13, true)
		SetPedRelationshipGroupHash(merryped13, 'Merryweather')
		GiveWeaponToPed(merryped13, GetHashKey('weapon_railgun'), 250, false, true)
		TaskCombatPed(merryped13, GetPlayerPed(-1))
		SetPedAccuracy(merryped13, 100)
		SetPedDropsWeaponsWhenDead(merryped13, false)
		SetPedSuffersCriticalHits(merryped13, false)


		merryped14 = CreatePed(30, -1275859404, 494.64, -3124.20, 6.47, 268.00, true, false)
		SetPedArmour(merryped14, 100)
		SetPedAsEnemy(merryped14, true)
		SetPedRelationshipGroupHash(merryped14, 'Merryweather')
		GiveWeaponToPed(merryped14, GetHashKey('weapon_assaultrifle'), 250, false, true)
		TaskCombatPed(merryped14, GetPlayerPed(-1))
		SetPedAccuracy(merryped14, 100)
		SetPedDropsWeaponsWhenDead(merryped14, false)
		SetPedSuffersCriticalHits(merryped14, false)


		merryped15 = CreatePed(30, -1275859404, 521.39, -3118.20, 18.47, 266.00, true, false)
		SetPedArmour(merryped15, 100)
		SetPedAsEnemy(merryped15, true)
		SetPedRelationshipGroupHash(merryped15, 'Merryweather')
		GiveWeaponToPed(merryped15, GetHashKey('weapon_assaultrifle'), 250, false, true)
		TaskCombatPed(merryped15, GetPlayerPed(-1))
		SetPedAccuracy(merryped15, 100)
		SetPedDropsWeaponsWhenDead(merryped15, false)
		SetPedSuffersCriticalHits(merryped15, false)


		if Config.Debug then
			Citizen.Wait(10000)
		else
			Citizen.Wait(150000)
		end
		PRPCore.Functions.Notify("Wave 4 begins", "success", 10000)
		wave = "4"

		merryped555 = CreatePed(30, -1275859404, 563.61, -3127.6, 18.77, 359.00, true, false)
		SetPedArmour(merryped555, 100)
		SetPedAsEnemy(merryped555, true)
		SetPedRelationshipGroupHash(merryped555, 'Merryweather')
		GiveWeaponToPed(merryped555, GetHashKey('weapon_combatmg_mk2'), 250, false, true)
		TaskCombatPed(merryped555, GetPlayerPed(-1))
		SetPedShootRate(merryped555, 1000)
		SetPedAccuracy(merryped555, 100)
		SetPedDropsWeaponsWhenDead(merryped555, false)
		SetPedSuffersCriticalHits(merryped555, false)

		merryped556 = CreatePed(30, -1275859404, 563.61, -3127.6, 18.77, 359.00, true, false)
		SetPedArmour(merryped556, 100)
		SetPedAsEnemy(merryped556, true)
		SetPedRelationshipGroupHash(merryped556, 'Merryweather')
		GiveWeaponToPed(merryped556, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped556, GetPlayerPed(-1))
		SetPedShootRate(merryped556, 1000)
		SetPedAccuracy(merryped556, 100)
		SetPedDropsWeaponsWhenDead(merryped556, false)
		SetPedSuffersCriticalHits(merryped556, false)

		merryped16 = CreatePed(30, -1275859404, 557.25, -3131.12, 17.37, 266.00, true, false)
		SetPedArmour(merryped16, 100)
		SetPedAsEnemy(merryped16, true)
		SetPedRelationshipGroupHash(merryped16, 'Merryweather')
		GiveWeaponToPed(merryped16, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped16, GetPlayerPed(-1))
		SetPedAccuracy(merryped16, 100)
		SetPedDropsWeaponsWhenDead(merryped16, false)
		SetPedSuffersCriticalHits(merryped16, false)


		merryped17 = CreatePed(30, -1275859404, 517.24, -3118.20, 25.57, 266.00, true, false)
		SetPedArmour(merryped17, 100)
		SetPedAsEnemy(merryped17, true)
		SetPedRelationshipGroupHash(merryped17, 'Merryweather')
		GiveWeaponToPed(merryped17, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped17, GetPlayerPed(-1))
		SetPedAccuracy(merryped17, 100)
		SetPedDropsWeaponsWhenDead(merryped17, false)
		SetPedSuffersCriticalHits(merryped17, false)


		merryped18 = CreatePed(30, -1275859404, 521.39, -3118.20, 18.47, 266.00, true, false)
		SetPedArmour(merryped18, 100)
		SetPedAsEnemy(merryped18, true)
		SetPedShootRate(merryped18, 1000)
		SetPedRelationshipGroupHash(merryped18, 'Merryweather')
		GiveWeaponToPed(merryped18, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped18, GetPlayerPed(-1))
		SetPedAccuracy(merryped18, 100)
		SetPedDropsWeaponsWhenDead(merryped18, false)
		SetPedSuffersCriticalHits(merryped18, false)


		merryped19 = CreatePed(30, -1275859404, 587.65, -3125.26, 17.47, 266.00, true, false)
		SetPedArmour(merryped19, 100)
		SetPedAsEnemy(merryped19, true)
		SetPedRelationshipGroupHash(merryped19, 'Merryweather')
		GiveWeaponToPed(merryped19, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped19, GetPlayerPed(-1))
		SetPedAccuracy(merryped19, 100)
		SetPedDropsWeaponsWhenDead(merryped19, false)
		SetPedSuffersCriticalHits(merryped19, false)


		merryped20 = CreatePed(30, -1275859404, 576.32, -3108.20, 6.47, 182.00, true, false)
		SetPedArmour(merryped20, 100)
		SetPedAsEnemy(merryped20, true)
		SetPedRelationshipGroupHash(merryped20, 'Merryweather')
		GiveWeaponToPed(merryped20, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped20, GetPlayerPed(-1))
		SetPedAccuracy(merryped20, 100)
		SetPedDropsWeaponsWhenDead(merryped20, false)
		SetPedSuffersCriticalHits(merryped20, false)


		if Config.Debug then
			Citizen.Wait(10000)
		else
			Citizen.Wait(150000)
		end
		PRPCore.Functions.Notify("Wave 5 begins", "success", 10000)
		wave = "5"

		merryped21 = CreatePed(30, -1275859404, 468.54, -3121.51, 6.07, 266.00, true, false)
		SetPedArmour(merryped21, 100)
		SetPedAsEnemy(merryped21, true)
		SetPedRelationshipGroupHash(merryped21, 'Merryweather')
		GiveWeaponToPed(merryped21, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(merryped21, 100)
		SetPedDropsWeaponsWhenDead(merryped21, false)
		SetPedSuffersCriticalHits(merryped21, false)


		merryped22 = CreatePed(30, -1275859404, 484.39, -3112.22, 6.33, 227.00, true, false)
		SetPedArmour(merryped22, 100)
		SetPedAsEnemy(merryped22, true)
		SetPedRelationshipGroupHash(merryped22, 'Merryweather')
		GiveWeaponToPed(merryped22, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(merryped22, 100)
		SetPedDropsWeaponsWhenDead(merryped22, false)
		SetPedSuffersCriticalHits(merryped22, false)


		merryped23 = CreatePed(30, -1275859404, 468.84, -3167.4, 6.07, 344.00, true, false)
		SetPedArmour(merryped23, 100)
		SetPedAsEnemy(merryped23, true)
		SetPedRelationshipGroupHash(merryped23, 'Merryweather')
		GiveWeaponToPed(merryped23, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(merryped23, 100)
		SetPedDropsWeaponsWhenDead(merryped23, false)
		SetPedSuffersCriticalHits(merryped23, false)



		if Config.Debug then
			Citizen.Wait(10000)
		else
			Citizen.Wait(350000)
		end
		PRPCore.Functions.Notify("Final Wave begins", "success", 10000)
		wave = "Final"

		merryped24 = CreatePed(30, -1275859404, 474.95, -3196.20, 6.07, 351.00, true, false)
		SetPedArmour(merryped24, 100)
		SetPedAsEnemy(merryped24, true)
		SetPedRelationshipGroupHash(merryped24, 'Merryweather')
		GiveWeaponToPed(merryped24, GetHashKey('WEAPON_RPG'), 250, false, true)
		TaskCombatPed(merryped24, GetPlayerPed(-1))
		SetPedAccuracy(merryped24, 100)
		SetPedDropsWeaponsWhenDead(merryped24, false)
		SetPedSuffersCriticalHits(merryped24, false)


		merryped25 = CreatePed(30, -1275859404, 595.92, -3288.12, 18.71, 87.00, true, false)
		SetPedArmour(merryped25, 100)
		SetPedAsEnemy(merryped25, true)
		SetPedRelationshipGroupHash(merryped25, 'Merryweather')
		GiveWeaponToPed(merryped25, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped25, GetPlayerPed(-1))
		SetPedAccuracy(merryped25, 80)
		SetPedDropsWeaponsWhenDead(merryped25, false)
		SetPedSuffersCriticalHits(merryped25, false)


		merryped26 = CreatePed(30, -1275859404, 598.33, -3141.49, 6.07, 182.00, true, false)
		SetPedArmour(merryped26, 100)
		SetPedAsEnemy(merryped26, true)
		SetPedRelationshipGroupHash(merryped26, 'Merryweather')
		GiveWeaponToPed(merryped26, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped26, GetPlayerPed(-1))
		SetPedAccuracy(merryped26, 80)
		SetPedDropsWeaponsWhenDead(merryped26, false)
		SetPedSuffersCriticalHits(merryped26, false)


		merryped27 = CreatePed(30, -1275859404, 542.49, -2992.64, 6.04, 179.00, true, false)
		SetPedArmour(merryped27, 100)
		SetPedAsEnemy(merryped27, true)
		SetPedRelationshipGroupHash(merryped27, 'Merryweather')
		GiveWeaponToPed(merryped27, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped27, GetPlayerPed(-1))
		SetPedAccuracy(merryped27, 80)
		SetPedDropsWeaponsWhenDead(merryped27, false)
		SetPedSuffersCriticalHits(merryped27, false)


		merryped28 = CreatePed(30, -1285859404, 607.07, -3079.56, 6.07, 6.00, true, false)
		SetPedArmour(merryped28, 100)
		SetPedAsEnemy(merryped28, true)
		SetPedRelationshipGroupHash(merryped28, 'Merryweather')
		GiveWeaponToPed(merryped28, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped28, GetPlayerPed(-1))
		SetPedAccuracy(merryped28, 80)
		SetPedDropsWeaponsWhenDead(merryped28, false)
		SetPedSuffersCriticalHits(merryped28, false)


		PRPCore.Functions.Notify("Wait for an e-mail from the back-end hack team..", "success", 10000)

		-- Get a random location
		local r = math.random(1,3)

		local rewardloc = Config.Rewards[r]
		local rewardx   = rewardloc.position.x
		local rewardy   = rewardloc.position.y

		print("Sending an e-mail.")
		SetTimeout(math.random(1500, 2000), function()
			TriggerServerEvent('prp-phone:server:sendNewMail', {
				sender = "Hack Team",
				subject = "Merryweather Coords",
				message = "Thanks to being inside their firewall, we were able to get a exact location of their loot.<br /><br /><strong>Longitude: "..rewardx.."</strong><br /><br /><strong>Latitude: "..rewardy.."</strong><br /><br />Delete this message for both our protection. We fear Merryweather will retaliate.",
				button = {}
			})
		end)

		rewarded = true
		rewardposx = rewardloc.position.x
		rewardposy = rewardloc.position.y
		rewardposz = rewardloc.position.z

	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(3)
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, "Countdown: "..timer..". On wave: "..wave, 255, 255, 255, 255)
		end
	end)
end)

---------------------
-- Citizen Threads --
---------------------

--Citizen.CreateThread(function()
--	CreateObject(-1203351544, 598.28, -3139.25, 5.07, true, true, true)
--end)

Citizen.CreateThread(function()
	while true do
		--if isLoggedIn then
			local playerPos = GetEntityCoords(PlayerPedId(), true)

			for k,v in pairs(Stores) do
				local storePos = v.position
				local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z)

				if distance < Config.Marker.DrawDistance then
					if not holdingUp then
						DrawMarker(2, storePos.x, storePos.y, storePos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

						if distance < 0.5 then
							DrawText3Ds(storePos.x, storePos.y, storePos.z, "[E] to rob Merryweather")

							if IsControlJustReleased(0, 38) then

								TriggerEvent("utk_fingerprint:Start", 4, 2, 2, function(outcome, reason)
									if outcome == true then -- reason will be nil if outcome is true
										TriggerServerEvent('prp_customrob:robberyStarted', k)
									elseif outcome == false then
										AddExplosion(569.34, -3126.35, 18.77, 2, 100000.0, true, true, 1.0)
										PRPCore.Functions.Notify("You failed the hack!", "error", 10000)
									end
								end)
								Citizen.Wait(60000)
							end
						end
					else
						Citizen.Wait(10000)
					end
				end
			end
		--end
		Citizen.Wait(3)
	end
end)

Citizen.CreateThread(function()
	while true do
		if rewarded and rewardposx and rewardposy and rewardposz then
			local playerPos = GetEntityCoords(PlayerPedId(), true)
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, rewardposx, rewardposy, rewardposz)

			if distance < Config.Marker.DrawDistance then
					DrawMarker(2,  rewardposx, rewardposy, rewardposz, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

					if distance < 0.5 then
						DrawText3Ds( rewardposx, rewardposy, rewardposz, "[E] loot cache")

						if IsControlJustReleased(0, 38) then
							TriggerServerEvent('prp_customrob:robberyLoot')
							rewarded = false
						end
					end
			end
		else
			Citizen.Wait(60000)
		end

		Citizen.Wait(3)
	end
end)



Citizen.CreateThread(function()
	while true do
		if holdingUp then
			local playerPos = GetEntityCoords(PlayerPedId(), true)
			local storePos = Stores[store].position
			if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > Config.MaxDistance then
				TriggerServerEvent('prp_customrob:tooFar', store)
			end
		end

		Citizen.Wait(5000)
	end
end)