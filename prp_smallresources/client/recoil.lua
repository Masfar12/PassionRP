	local recoils = {
	    --Pistols
	[453432689]     =   0.12,    --Pistol
	[3219281620]    =   0.10,    --Pistol MK2
	[1593441988]    =   0.11,    --CombatPistol
	[-1716589765]   =   0.18,    --Pistol50
	[-1076751822]   =   0.06,    --SNSPistol
	[-771403250]    =   0.18,    --HeavyPistol
	[137902532]     =   0.19,    --VintagePistol
	[-598887786]    =   0.21,    --MarksmanPistol
	[-1045183535]   =   0.21,    --Revolver
	[911657153]     =   0.00,    --StunGun
	[1198879012]    =   0.09,    --FlareGun
	[584646201]     =   0.16,    --APPistol

	    --Machine Guns
	[324215364]     =   0.15,    --MicroSMG
	[-619010992]    =   0.15,    --MachinePistol
	[736523883]     =   0.15,    --SMG
	[2024373456]    =   0.15,    --SMGMk2
	[-270015777]    =   0.15,    --AssaultSMG
	[171789620]     =   0.15,    --CombatPDW
	[-1660422300]   =   0.15,    --MachineGun
	[2144741730]    =   0.15,    --CombatMachineGun
	[3686625920]    =   0.15,    --CombatMachineGunMk2
	[1627465347]    =   0.15,    --GusenBerg
	[-1121678507]   =   0.15,    --MiniSmg

	    --Assault Rifles
	[-1074790547]   =   0.20,    --AssaultRifle
	[961495388]     =   0.18,    --AssaultRifleMk2
	[-2084633992]   =   0.18,    --CarbineRifle
	[4208062921]    =   0.18,    --CarbineRifleMk2
	[-1357824103]   =   0.18,    --AdvancedRifle
	[-1063057011]   =   0.18,    --SpecialCarbine
	[2132975508]    =   0.18,    --BullpupRifle
	[1649403952]    =   0.18,    --CompactRifle

	    --Sniper Rifles (0.25 is a safe number for sniper rifles as scoped zooms are affected, but unscoping will reset?)
	[100416529]     =   0.25,    --SniperRifle
	[205991906]     =   0.25,    --HeavySniper
	[177293209]     =   0.25,    --HeavySniperMk2(deprecated but hackers can get)
	[-952879014]    =   0.25,    --MarksmanRifle

	    --Shotguns (0.15 is a safe number for shotguns, as they reload often anyway)
	[487013001]     =   0.15,    --PumpShotgun
	[2017895192]    =   0.15,    --SawnOffShotgun
	[-1654528753]   =   0.15,    --BullpupShotgun
	[-494615257]    =   0.20,    --AssaultShotgun
	[-1466123874]   =   0.15,    --Musket
	[984333226]     =   0.15,    --HeavyShotgun
	[-275439685]    =   0.08,    --DoubleBarrelShotgun
	[317205821]     =   0.20,    --Autoshotgun

	    --Heavy Weapons
	[-1568386805]   =   0.20,    --GrenadeLauncher
	[-1312131151]   =   0.20,    --RPG
	[1119849093]    =   0.20,    --MiniGun
	[2138347493]    =   0.20,    --Fireworks Launcher
	[1834241177]    =   0.20,    --Railgun
	[1672152130]    =   0.20,    --Hominglauncher
	[1305664598]    =   0.20,    --Grenadelauncher Smokes
	[125959754]     =   0.20     --Compact Launcher (pistol version?)
	}

	Citizen.CreateThread(function()
		while true do
	    Citizen.Wait(0)
	        local ply = PlayerPedId()
	        SetPedSuffersCriticalHits(ply, false)

	        if IsPedArmed(ply, 6) then
				DisableControlAction(1, 140, true)
	            DisableControlAction(1, 141, true)
	            DisableControlAction(1, 142, true)
	        elseif IsPedArmed(ply, 1) then
	            N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"), 0.1)
	        else
				N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.35)
				Citizen.Wait(1000)
			end

	        if IsPedShooting(ply) then
				local _,wep = GetCurrentPedWeapon(ply)
	            local _,cAmmo = GetAmmoInClip(ply, wep)

	            local GamePlayCam = GetFollowPedCamViewMode()
	            local Vehicled = IsPedInAnyVehicle(ply, false)
	            local MovementSpeed = math.ceil(GetEntitySpeed(ply))

	            if MovementSpeed > 69 then
	                MovementSpeed = 69
	            end
	            Citizen.Wait(50)
	            local _,wep = GetCurrentPedWeapon(ply)
				if (wep ~= 126349499) and (wep ~= 0) then
	                local group = GetWeapontypeGroup(wep)
	                local p = GetGameplayCamRelativePitch()
	                local cameraDistance = #(GetGameplayCamCoord() - GetEntityCoords(ply))

	                local recoil = math.random(100,140+MovementSpeed)/100
	                local rifle = false

	                if group == 970310034 then
	                    rifle = true
	                end

	                if cameraDistance < 5.3 then
	                    cameraDistance = 1.5
	                else
	                    if cameraDistance < 8.0 then
	                        cameraDistance = 4.0
	                    else
	                        cameraDistance = 7.0
	                    end
	                end

	                if Vehicled then
						recoil = recoil + (recoil * cameraDistance)
					else
						modifier = recoils[wep]
						if modifier == nil then
							modifier = 0.4
						end
	                    recoil = recoil * modifier
	                end

	                if GamePlayCam == 4 then
	                    recoil = recoil * 0.7
	                    if rifle then
	                        recoil = recoil * 0.1
	                    end
	                end

	                if rifle then
	                    recoil = recoil * 0.3
	                end

	                local rightleft = math.random(4)
	                local h = GetGameplayCamRelativeHeading()
	                local hf = math.random(10,40+MovementSpeed)/100

	                if Vehicled then
						local v = GetVehiclePedIsIn(PlayerPedId())

						if (GetPedInVehicleSeat(v, -1) == ply) then
							hf = hf * 5.0
						else
							hf = hf * 2.0
						end
	                end

	                if rightleft == 1 then
	                    SetGameplayCamRelativeHeading(h+hf)
	                elseif rightleft == 2 then
	                    SetGameplayCamRelativeHeading(h-hf)
	                end

	                local set = p+recoil

	                SetGameplayCamRelativePitch(set,0.8)
				end
	        end

		end
	end)
