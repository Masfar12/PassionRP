Citizen.CreateThread(function()
    while true do
        for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
            SetScenarioGroupEnabled(scgrp, false)
        end
		for _, carmdl in next, Config.BlacklistedVehs do
			SetVehicleModelIsSuppressed(carmdl, true)
		end
		Citizen.Wait(10000)
    end
end)

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

Citizen.CreateThread(function()
	while true do
		for veh in EnumerateVehicles() do
			if Config.BlacklistedVehs[GetEntityModel(veh)] then
				DeleteEntity(veh)
			end
		end
        Citizen.Wait(5000)
	end
end)

-- Removing this thread, doesn't seem to do anything.
--Citizen.CreateThread(function()
--    while true do
	    --local playerPed = GetPlayerPed(-1)
		--local pos = GetEntityCoords(playerPed) 
		--SetGarbageTrucks(0)
		--SetAllLowPriorityVehicleGeneratorsActive(0.0)
		--RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0); -- ziekenhuis
		--RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0); -- politie bureau
		--RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0); -- pillbox
		--RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0); -- military
		--RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0); -- nudist
		--RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0); -- politie bureau paleto
		--RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0); -- politie bureau sandy
--	
--    	Citizen.Wait(10)
--	end
--end)

-- Citizen.CreateThread(function()
-- 	for ped in EnumeratePeds() do
-- 		SetPedDropsWeaponsWhenDead(ped, false)
-- 		if Config.BlacklistedPeds[GetEntityModel(ped)] then
-- 			DeleteEntity(ped)
-- 		end
-- 	end
-- 	Citizen.Wait(500)
-- end)

--Citizen.CreateThread(function()
	--while true do

		--for k, v in pairs(Config.BlacklistedPeds) do
			--SetVehicleModelIsSuppressed(k, true)
		--end

		--Citizen.Wait(3)
	--end
--end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		for veh in EnumerateVehicles() do
-- 			if Config.BlacklistedVehs[GetEntityModel(veh)] then
-- 				DeleteEntity(veh)
-- 			end
-- 		end
--         Citizen.Wait(5000)
-- 	end
-- end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = GetPlayerPed(-1)
		
		if IsPedBeingStunned(ped) then
			SetPedMinGroundTimeForStungun(GetPlayerPed(-1), math.random(4000, 7000))
		else
			Citizen.Wait(1000)
		end
	end
end)

Citizen.CreateThread(function()
	local globalDmg = 1.0
    SetWeaponDamageModifier(GetHashKey('WEAPON_UNARMED'), 0.15)
	SetWeaponDamageModifier(GetHashKey('WEAPON_KNIFE'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_KNUCKLE'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_NIGHTSTICK'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_HAMMER'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_BAT'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_GOLFCLUB'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_CROWBAR'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_BOTTLE'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_DAGGER'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_HATCHET'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MACHETE'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_FLASHLIGHT'), 0.40)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SWITCHBLADE'), 0.40)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_PROXMINE'), 0.40)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_BZGAS'), 0.40)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_SMOKEGRENADE'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_MOLOTOV'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_FIREEXTINGUISHER'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_PETROLCAN'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_HAZARDCAN'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SNOWBALL'), 0.000)
	SetWeaponDamageModifier(GetHashKey('WEAPON_FLARE'), 0.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_BALL'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_REVOLVER'), 0.400)
	SetWeaponDamageModifier(GetHashKey('WEAPON_HEAVYREVOLVER'), 0.400)
	SetWeaponDamageModifier(GetHashKey('WEAPON_POOLCUE'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_PIPEWRENCH'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_PISTOL'), (0.825 * globalDmg) + 0.500)
	SetWeaponDamageModifier(GetHashKey('WEAPON_PISTOL_MK2'), (0.700 * globalDmg) + 0.400)
	SetWeaponDamageModifier(GetHashKey('WEAPON_COMBATPISTOL'), (0.700 * globalDmg) + 0.450)
	SetWeaponDamageModifier(GetHashKey('WEAPON_APPISTOL'), (0.820 * globalDmg) + 0.820)
	SetWeaponDamageModifier(GetHashKey('WEAPON_PISTOL50'), (0.700 * globalDmg) + 0.700)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SNSPISTOL'), (0.700 * globalDmg) + 0.400)
	SetWeaponDamageModifier(GetHashKey('WEAPON_HEAVYPISTOL'), (0.600 * globalDmg) + 0.300)
	SetWeaponDamageModifier(GetHashKey('WEAPON_VINTAGEPISTOL'), (0.600 * globalDmg) + 0.425)
	SetWeaponDamageModifier(GetHashKey('WEAPON_STUNGUN'), 0.150)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_FLAREGUN'), 0.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MARKSMANPISTOL'), 0.625)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MICROSMG'), (0.750 * globalDmg) + 0.750)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MINISMG'), (0.750 * globalDmg) + 0.750)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SMG'), (0.800 * globalDmg) + 0.800)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SMG_MK2'), (0.850 * globalDmg) + 0.850)
	SetWeaponDamageModifier(GetHashKey('WEAPON_ASSAULTSMG'), (0.800 * globalDmg) + 0.800)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MG'), (0.800 * globalDmg) + 0.800)
	SetWeaponDamageModifier(GetHashKey('WEAPON_COMBATMG'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_COMBATMG_MK2'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_COMBATPDW'), (0.600 * globalDmg) + 0.600)
	SetWeaponDamageModifier(GetHashKey('WEAPON_GUSENBERG'), (0.700 * globalDmg) + 0.300)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MACHINEPISTOL'), (0.700 * globalDmg) + 0.300)
	SetWeaponDamageModifier(GetHashKey('WEAPON_ASSAULTRIFLE'), (0.500 * globalDmg) + 0.300)
	SetWeaponDamageModifier(GetHashKey('WEAPON_ASSAULTRIFLE_MK2'), (0.500 * globalDmg) + 0.300)
	SetWeaponDamageModifier(GetHashKey('WEAPON_CARBINERIFLE'), (0.900 * globalDmg) + 0.800)
	SetWeaponDamageModifier(GetHashKey('WEAPON_CARBINERIFLE_MK2'), (0.900 * globalDmg) + 0.600)
	SetWeaponDamageModifier(GetHashKey('WEAPON_ADVANCEDRIFLE'), (0.700 * globalDmg) + 0.500)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SPECIALCARBINE'), (0.900 * globalDmg) + 0.500)
	SetWeaponDamageModifier(GetHashKey('WEAPON_BULLPUPRIFLE'), (0.839 * globalDmg) + 0.839)
	SetWeaponDamageModifier(GetHashKey('WEAPON_COMPACTRIFLE'), (0.500 * globalDmg) + 0.300)
	SetWeaponDamageModifier(GetHashKey('WEAPON_PUMPSHOTGUN'), (0.500 * globalDmg) + 0.500)
	SetWeaponDamageModifier(GetHashKey('WEAPON_AUTOSHOTGUN'), (0.500 * globalDmg) + 0.500)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SWEEPERSHOTGUN'), (0.500 * globalDmg) + 0.500)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SAWNOFFSHOTGUN'), (0.650 * globalDmg) + 0.650)
	SetWeaponDamageModifier(GetHashKey('WEAPON_BULLPUPSHOTGUN'), (0.350 * globalDmg) + 0.300)
	SetWeaponDamageModifier(GetHashKey('WEAPON_ASSAULTSHOTGUN'), (0.500 * globalDmg) + 0.500)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MUSKET'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_HEAVYSHOTGUN'), 0.600)
	SetWeaponDamageModifier(GetHashKey('WEAPON_DBSHOTGUN'), 0.650)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SNIPERRIFLE'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_HEAVYSNIPER'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_HEAVYSNIPER_MK2'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MARKSMANRIFLE'), 0.750)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_GRENADELAUNCHER'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_GRENADELAUNCHER_SMOKE'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_RPG'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MINIGUN'), 0.800)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_FIREWORK'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_RAILGUN'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_HOMINGLAUNCHER'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_GRENADE'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_STICKYBOMB'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_COMPACTLAUNCHER'), 1.00)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SNSPISTOL_MK2'), 0.750)
	SetWeaponDamageModifier(GetHashKey('WEAPON_REVOLVER_MK2'), 0.600)
	SetWeaponDamageModifier(GetHashKey('WEAPON_DOUBLEACTION'), 0.600)
	SetWeaponDamageModifier(GetHashKey('WEAPON_SPECIALCARBINE_MK2'), (0.750 * globalDmg) + 0.750)
	SetWeaponDamageModifier(GetHashKey('WEAPON_BULLPUPRIFLE_MK2'), 0.750)
	SetWeaponDamageModifier(GetHashKey('WEAPON_PUMPSHOTGUN_MK2'), 0.250)
	SetWeaponDamageModifier(GetHashKey('WEAPON_MARKSMANRIFLE_MK2'), 0.550)
	SetWeaponDamageModifier(GetHashKey('WEAPON_RAYPISTOL'), 0.01)
	SetWeaponDamageModifier(GetHashKey('WEAPON_RAYCARBINE'), 0.01)
	SetWeaponDamageModifier(GetHashKey('WEAPON_RAYMINIGUN'), 0.01)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_DIGISCANNER'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_NAVYREVOLVER'), 0.750)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_CERAMICPISTOL'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('WEAPON_STONE_HATCHET'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_PIPEBOMB'), 0.25)
	--SetWeaponDamageModifier(GetHashKey('GADGET_PARACHUTE'), 0.25)
	SetWeaponDamageModifier(GetHashKey('WEAPON_REMOTESNIPER'),1.000)
	SetWeaponDamageModifier(GetHashKey('WEAPON_NIGHTSTICK'),0.40)
end)


function RemoveWeaponDrops()
	local pickupList = {`PICKUP_AMMO_BULLET_MP`,`PICKUP_AMMO_FIREWORK`,`PICKUP_AMMO_FLAREGUN`,`PICKUP_AMMO_GRENADELAUNCHER`,`PICKUP_AMMO_GRENADELAUNCHER_MP`,`PICKUP_AMMO_HOMINGLAUNCHER`,`PICKUP_AMMO_MG`,`PICKUP_AMMO_MINIGUN`,`PICKUP_AMMO_MISSILE_MP`,`PICKUP_AMMO_PISTOL`,`PICKUP_AMMO_RIFLE`,`PICKUP_AMMO_RPG`,`PICKUP_AMMO_SHOTGUN`,`PICKUP_AMMO_SMG`,`PICKUP_AMMO_SNIPER`,`PICKUP_ARMOUR_STANDARD`,`PICKUP_CAMERA`,`PICKUP_CUSTOM_SCRIPT`,`PICKUP_GANG_ATTACK_MONEY`,`PICKUP_HEALTH_SNACK`,`PICKUP_HEALTH_STANDARD`,`PICKUP_MONEY_CASE`,`PICKUP_MONEY_DEP_BAG`,`PICKUP_MONEY_MED_BAG`,`PICKUP_MONEY_PAPER_BAG`,`PICKUP_MONEY_PURSE`,`PICKUP_MONEY_SECURITY_CASE`,`PICKUP_MONEY_VARIABLE`,`PICKUP_MONEY_WALLET`,`PICKUP_PARACHUTE`,`PICKUP_PORTABLE_CRATE_FIXED_INCAR`,`PICKUP_PORTABLE_CRATE_UNFIXED`,`PICKUP_PORTABLE_CRATE_UNFIXED_INCAR`,`PICKUP_PORTABLE_CRATE_UNFIXED_INCAR_SMALL`,`PICKUP_PORTABLE_CRATE_UNFIXED_LOW_GLOW`,`PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE`,`PICKUP_PORTABLE_PACKAGE`,`PICKUP_SUBMARINE`,`PICKUP_VEHICLE_ARMOUR_STANDARD`,`PICKUP_VEHICLE_CUSTOM_SCRIPT`,`PICKUP_VEHICLE_CUSTOM_SCRIPT_LOW_GLOW`,`PICKUP_VEHICLE_HEALTH_STANDARD`,`PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW`,`PICKUP_VEHICLE_MONEY_VARIABLE`,`PICKUP_VEHICLE_WEAPON_APPISTOL`,`PICKUP_VEHICLE_WEAPON_ASSAULTSMG`,`PICKUP_VEHICLE_WEAPON_COMBATPISTOL`,`PICKUP_VEHICLE_WEAPON_GRENADE`,`PICKUP_VEHICLE_WEAPON_MICROSMG`,`PICKUP_VEHICLE_WEAPON_MOLOTOV`,`PICKUP_VEHICLE_WEAPON_PISTOL`,`PICKUP_VEHICLE_WEAPON_PISTOL50`,`PICKUP_VEHICLE_WEAPON_SAWNOFF`,`PICKUP_VEHICLE_WEAPON_SMG`,`PICKUP_VEHICLE_WEAPON_SMOKEGRENADE`,`PICKUP_VEHICLE_WEAPON_STICKYBOMB`,`PICKUP_WEAPON_ADVANCEDRIFLE`,`PICKUP_WEAPON_APPISTOL`,`PICKUP_WEAPON_ASSAULTRIFLE`,`PICKUP_WEAPON_ASSAULTSHOTGUN`,`PICKUP_WEAPON_ASSAULTSMG`,`PICKUP_WEAPON_AUTOSHOTGUN`,`PICKUP_WEAPON_BAT`,`PICKUP_WEAPON_BOTTLE`,`PICKUP_WEAPON_BULLPUPRIFLE`,`PICKUP_WEAPON_BULLPUPSHOTGUN`,`PICKUP_WEAPON_CARBINERIFLE`,`PICKUP_WEAPON_COMBATMG`,`PICKUP_WEAPON_COMBATPDW`,`PICKUP_WEAPON_COMBATPISTOL`,`PICKUP_WEAPON_COMPACTLAUNCHER`,`PICKUP_WEAPON_COMPACTRIFLE`,`PICKUP_WEAPON_CROWBAR`,`PICKUP_WEAPON_DAGGER`,`PICKUP_WEAPON_DBSHOTGUN`,`PICKUP_WEAPON_FIREWORK`,`PICKUP_WEAPON_FLAREGUN`,`PICKUP_WEAPON_FLASHLIGHT`,`PICKUP_WEAPON_GRENADE`,`PICKUP_WEAPON_GRENADELAUNCHER`,`PICKUP_WEAPON_GUSENBERG`,`PICKUP_WEAPON_GOLFCLUB`,`PICKUP_WEAPON_HAMMER`,`PICKUP_WEAPON_HATCHET`,`PICKUP_WEAPON_HEAVYPISTOL`,`PICKUP_WEAPON_HEAVYSHOTGUN`,`PICKUP_WEAPON_HEAVYSNIPER`,`PICKUP_WEAPON_HOMINGLAUNCHER`,`PICKUP_WEAPON_KNIFE`,`PICKUP_WEAPON_KNUCKLE`,`PICKUP_WEAPON_MACHETE`,`PICKUP_WEAPON_MACHINEPISTOL`,`PICKUP_WEAPON_MARKSMANPISTOL`,`PICKUP_WEAPON_MARKSMANRIFLE`,`PICKUP_WEAPON_MG`,`PICKUP_WEAPON_MICROSMG`,`PICKUP_WEAPON_MINIGUN`,`PICKUP_WEAPON_MINISMG`,`PICKUP_WEAPON_MOLOTOV`,`PICKUP_WEAPON_MUSKET`,`PICKUP_WEAPON_NIGHTSTICK`,`PICKUP_WEAPON_PETROLCAN`,`PICKUP_WEAPON_PIPEBOMB`,`PICKUP_WEAPON_PISTOL`,`PICKUP_WEAPON_PISTOL50`,`PICKUP_WEAPON_POOLCUE`,`PICKUP_WEAPON_PROXMINE`,`PICKUP_WEAPON_PUMPSHOTGUN`,`PICKUP_WEAPON_RAILGUN`,`PICKUP_WEAPON_REVOLVER`,`PICKUP_WEAPON_RPG`,`PICKUP_WEAPON_SAWNOFFSHOTGUN`,`PICKUP_WEAPON_SMG`,`PICKUP_WEAPON_SMOKEGRENADE`,`PICKUP_WEAPON_SNIPERRIFLE`,`PICKUP_WEAPON_SNSPISTOL`,`PICKUP_WEAPON_SPECIALCARBINE`,`PICKUP_WEAPON_STICKYBOMB`,`PICKUP_WEAPON_STUNGUN`,`PICKUP_WEAPON_SWITCHBLADE`,`PICKUP_WEAPON_VINTAGEPISTOL`,`PICKUP_WEAPON_WRENCH`}
	local PlayerPed = GetPlayerPed(-1)
	local pedPos = GetEntityCoords(PlayerPed, false)

	for a = 1, #pickupList do
		if IsPickupWithinRadius(pickupList[a], pedPos.x, pedPos.y, pedPos.z, 200.0) then
			RemoveAllPickupsOfType(pickupList[a])
		end
	end
end

Citizen.CreateThread(function()
	while true do    
		RemoveWeaponDrops()
		Citizen.Wait(1000)
	end
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerId()

		for i = 1, 12 do
			EnableDispatchService(i, false)
		end

		if GetPlayerWantedLevel(ped) ~= 0 then
			SetPlayerWantedLevel(ped, 0, false)
			SetPlayerWantedLevelNow(ped, false)
			SetPlayerWantedLevelNoDrop(ped, 0, false)
		else
			Citizen.Wait(500)
		end

		Citizen.Wait(6)
	end
end)


Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed( -1 )
        local weapon = GetSelectedPedWeapon(ped)

		if weapon ~= GetHashKey("WEAPON_UNARMED") then
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end

			if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER") or  weapon == GetHashKey("WEAPON_PETROLCAN") then
				if IsPedShooting(ped) then
					SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
					SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_PETROLCAN"))
				end
			end
		else
			Citizen.Wait(1000)
		end

        Citizen.Wait(7)
    end
end)

AddEventHandler("playerSpawned", function()
    NetworkSetFriendlyFireOption(true)
    SetCanAttackFriendly(PlayerPedId(), true, true)
end)