Citizen.CreateThread(function()
	OnEnterMp(1)
	while true do
        Citizen.Wait(0)
		-- Meth Lab
		-- bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo
		if config.methLabBasic then
			if config.wareHouseOne then
				ActivateInteriorEntitySet(config.wareHouseOneId, "meth_lab_basic")
		
			end
		end
		if config.methLabEmpty then
			if config.wareHouseOne then
			ActivateInteriorEntitySet(config.wareHouseOneId, "meth_lab_empty")
			end
		end
		if config.methLabProduction then
			if config.wareHouseOne then
				ActivateInteriorEntitySet(config.wareHouseOneId, "meth_lab_production")
			end
		end
		if config.methLabSecurityHigh then
			if config.wareHouseOne then
				ActivateInteriorEntitySet(config.wareHouseOneId, "meth_lab_security_high")
			end
		end
		if config.methLabSetup then
			if config.wareHouseOne then
				ActivateInteriorEntitySet(config.wareHouseOneId, "meth_lab_setup")
			end
		end
		if config.methLabUpgrade then
			if config.wareHouseOne then
				ActivateInteriorEntitySet(config.wareHouseOneId, "meth_lab_upgrade")
			end
		end
			-- Weed Lab
        if config.weedDrying then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_drying")
            end
        end
        if config.weedProduction then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_production")
            end
        end
        if config.weedSetup then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_set_up")
            end
        end
        if config.weedStandardEquip then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_standard_equip")
            end
        end
        if config.weedUpgradeEquip then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_upgrade_equip")
            end
        end
        if config.weedGrowthAStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growtha_stage1")
            end
        end
        if config.weedGrowthAStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growtha_stage2")
            end
        end
        if config.weedGrowthAStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growtha_stage3")
            end
        end
        if config.weedGrowthBStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthb_stage1")
            end
        end
        if config.weedGrowthBStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthb_stage2")
            end
        end
        if config.weedGrowthBStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthb_stage3")
            end
        end
        if config.weedGrowthCStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthc_stage1")
            end
        end
        if config.weedGrowthCStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthc_stage2")
            end
        end
        if config.weedGrowthCStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthc_stage3")
            end
        end
        if config.weedGrowthDStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthd_stage1")
            end
        end
        if config.weedGrowthDStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthd_stage2")
            end
        end
        if config.weedGrowthDStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthd_stage3")
            end
        end
        if config.weedGrowthEStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthe_stage1")
            end
        end
        if config.weedGrowthEStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthe_stage2")
            end
        end
        if config.weedGrowthEStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthe_stage3")
            end
        end
        if config.weedGrowthFStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthf_stage1")
            end
        end
        if config.weedGrowthFStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthf_stage2")
            end
        end
        if config.weedGrowthFStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthf_stage3")
            end
        end
        if config.weedGrowthGStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthg_stage1")
            end
        end
        if config.weedGrowthGStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthg_stage2")
            end
        end
        if config.weedGrowthGStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthg_stage3")
            end
        end
        if config.weedGrowthHStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthh_stage1")
            end
        end
        if config.weedGrowthHStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthh_stage2")
            end
        end
        if config.weedGrowthHStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthh_stage3")
            end
        end
        if config.weedGrowthIStage1 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthi_stage1")
            end
        end
        if config.weedGrowthIStage2 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthi_stage2")
            end
        end
        if config.weedGrowthIStage3 then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_growthi_stage3")
            end
        end
        if config.weedHoseA then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hosea")
            end
        end
        if config.weedHoseB then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hoseb")
            end
        end
        if config.weedHoseC then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hosec")
            end
        end
        if config.weedHoseD then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hosed")
            end
        end
        if config.weedHoseE then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hosee")
            end
        end
        if config.weedHoseF then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hosef")
            end
        end
        if config.weedHoseG then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hoseg")
            end
        end
        if config.weedHoseH then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hoseh")
            end
        end
        if config.weedHoseI then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_hosei")
            end
        end
        if config.weedlightGrowthAStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growtha_stage23_standard")
            end
        end
        if config.weedlightGrowthBStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthb_stage23_standard")
            end
        end
        if config.weedlightGrowthCStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthc_stage23_standard")
            end
        end
        if config.weedlightGrowthDStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthd_stage23_standard")
            end
        end
        if config.weedlightGrowthEStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthe_stage23_standard")
            end
        end
        if config.weedlightGrowthFStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthf_stage23_standard")
            end
        end
        if config.weedlightGrowthHStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthg_stage23_standard")
            end
        end
        if config.weedlightGrowthIStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthh_stage23_standard")
            end
        end
        if config.weedlightGrowthJStage23Standard then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthi_stage23_standard")
            end
        end
        if config.weedlightGrowthAStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growtha_stage23_upgrade")
            end
        end
        if config.weedlightGrowthBStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthb_stage23_upgrade")
            end
        end
        if config.weedlightGrowthCStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthc_stage23_upgrade")
            end
        end
        if config.weedlightGrowthDStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthd_stage23_upgrade")
            end
        end
        if config.weedlightGrowthEStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthe_stage23_upgrade")
            end
        end
        if config.weedlightGrowthFStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthf_stage23_upgrade")
            end
        end
        if config.weedlightGrowthGStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthg_stage23_upgrade")
            end
        end
        if config.weedlightGrowthHStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthh_stage23_upgrade")
            end
        end
        if config.weedlightGrowthIStage23Upgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "light_growthi_stage23_upgrade")
            end
        end
        if config.weedLowSecurity then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_low_security")
            end
        end
        if config.weedSecurityUpgrade then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_security_upgrade")
            end
        end
        if config.weedChairs then
            if config.wareHouseTwo then
                ActivateInteriorEntitySet(config.wareHouseTwoId, "weed_chairs")
            end
        end
		-- Cocain Lab
        if config.cocainSecurityLow then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "security_low")
            end
        end
        if config.cocainSecurityHigh then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "security_high")
            end
        end
        if config.cocainequipmentBasic then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "equipment_basic")
            end
        end
        if config.cocainequipmentUpgrade then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "equipment_upgrade")
            end
        end
        if config.cocainSetup then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "set_up")
            end
        end
        if config.cocainProductionBasic then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "production_basic")
            end
        end
        if config.cocainProductionUpgrade then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "production_upgrade")
            end
        end
        if config.cocainTableEquipmentUpgeade then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "table_equipment")
            end
        end
        if config.cocainCokePressBasic then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "table_equipment_upgrade")
            end
        end
        if config.cocainCokePressUpgrade then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "coke_press_basic")
            end
        end
        if config.cocainCokeCut01 then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "coke_press_upgrade")
            end
        end
        if config.cocainCokeCut02 then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "coke_cut_01")
            end
        end
        if config.cocainCokeCut03 then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "coke_cut_02")
            end
        end
        if config.cocainCokeCut04 then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "coke_cut_03")
            end
        end
        if config.cocainCokeCut05 then
            if config.wareHouseThree then
			    ActivateInteriorEntitySet(config.wareHouseThreeId, "coke_cut_04")
            end
        end
	--[[
			-- Bunkers
		if config.bunkerStyleA then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "Bunker_Style_A")
				RefreshInterior(config.bunkerId)
				print(config.bunkerId)
			else
				DeactivateInteriorEntitySet(config.bunkerId, "Bunker_Style_A")
			end
		end
		if config.bunkerStyleB then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "Bunker_Style_B")
				RefreshInterior(config.bunkerId)
				print(config.bunkerId)
			else 
				DeactivateInteriorEntitySet(config.bunkerId, "Bunker_Style_B")
			end
		end
		if config.bunkerStyleC then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "Bunker_Style_C")
				RefreshInterior(config.bunkerId)
				print(config.bunkerId)
			else 
				DeactivateInteriorEntitySet(config.bunkerId, "Bunker_Style_C")
			end
		end
		if config.bunkerStandardSet then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "standard_bunker_set")
			end
		end
		if config.bunkerUpgradeSet then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "upgrade_bunker_set")
			end
		end
		if config.bunkerStandardSecuritySet then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "standard_security_set")
			end
		end
		if config.bunkerUpgradeSecuritySet then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "security_upgrade")
			end
		end
		if config.bunkerOfficeBlockerSet then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "Office_blocker_set")
			end
		end
		if config.bunkerOfficeUpgradeSet then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "Office_Upgrade_set")
			end
		end
		if config.bunkerGunRangeBlockerSet then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "gun_range_blocker_set")
			end
		end
		if config.bunkerWallBlocker then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "gun_wall_blocker")
			end
		end
		if config.bunkerGunRangeLights then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "gun_range_lights")
			end
		end
		if config.bunkerGunLockerUpgrade then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "gun_locker_upgrade")
			end
		end
		if config.bunkerGunSchematicSet then
			if config.bunkerInterior then
				ActivateInteriorEntitySet(config.bunkerId, "Gun_schematic_set")
			end
		end
]]
			-- FIB Lobby
		if config.fibProps then
			if config.fbiLobby then
				ActivateInteriorEntitySet(config.FIBId, "V_FIB03_door_light")
				ActivateInteriorEntitySet(config.FIBId, "V_FIB02_set_AH3b")
				ActivateInteriorEntitySet(config.FIBId, "V_FIB03_set_AH3b")
				ActivateInteriorEntitySet(config.FIBId, "V_FIB04_set_AH3b")
			end
		end
		-- Counterfeit Cash Factory
		if config.cfcCashPile10a then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile10a")
			end
		end
		if config.cfcCashPile10b then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile10b")
			end
		end
		if config.cfcCashPile10c then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile10c")
			end
		end
		if config.cfcCashPile10D then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile10d")
			end
		end
		if config.cfcCashPile20a then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile20a")
			end
		end
		if config.cfcCashPile20b then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile20b")
			end
		end
		if config.cfcCashPile20c then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile20c")
			end
		end
		if config.cfcCashPile20d then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile20d")
			end
		end
		if config.cfcCashPile100a then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile100a")
			end
		end
		if config.cfcCashPile100b then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile100b")
			end
		end
		if config.cfcCashPile100c then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile100c")
			end
		end
		if config.cfcCashPile100d then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_cashpile100d")
			end
		end
		if config.cfcLowSecurity then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_low_security")
			end
		end
		if config.cfcSecurity then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_security")
			end
		end
		if config.cfcSetup then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_setup")
			end
		end
		if config.cfcStandardEquipment then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_standard_equip")
			end
		end
		if config.cfcStandardNoProd then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_standard_equip_no_prod")
			end
		end
		if config.cfcUpgradeEquip then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_upgrade_equip")
			end
		end
		if config.cfcUpgradeEquipNoProd then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "counterfeit_upgrade_equip_no_prod")
			end
		end
		if config.cfcMoneyCutter then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "money_cutter")
			end
		end
		if config.cfcSpecialChairs then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "special_chairs")
			end
		end
		if config.cfcDryerAOff then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryera_off")
			end
		end
		if config.cfcDryerAOn then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryera_on")
			end
		end
		if config.cfcDryerAOpen then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryera_open")
			end
		end
		if config.cfcDryerBOff then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerb_off")
			end
		end
		if config.cfcDryerBOn then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerb_on")
			end
		end
		if config.cfcDryerBOpen then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerb_open")
			end
		end
		if config.cfcDryerCOff then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerc_off")
			end
		end
		if config.cfcDryerCOn then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerc_on")
			end
		end
		if config.cfcDryerCOpen then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerc_open")
			end
		end
		if config.cfcDryerDOff then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerd_off")
			end
		end
		if config.cfcDryerDOn then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerd_on")
			end
		end
		if config.cfcDryerDOpen then
			if config.wareHouseFour then
				ActivateInteriorEntitySet(config.wareHouseFourId, "dryerd_open")
			end
		end
			-- Clubhouse 1
        if config.clubhouse1CashStash1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "cash_stash1")
            end
        end
        if config.clubhouse1CashStash2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "cash_stash2")
            end
        end
        if config.clubhouse1CashStash3 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "cash_stash3")
            end
        end
        if config.clubhouse1CokeStash1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "coke_stash1")
            end
        end
        if config.clubhouse1CokeStash2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "coke_stash2")
            end
        end
        if config.clubhouse1CokeStash3 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "coke_stash3")
            end
        end
        if config.clubhouse1CounterfeitStash1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "counterfeit_stash1")
            end
        end
        if config.clubhouse1CounterfeitStash2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "counterfeit_stash2")
            end
        end
        if config.clubhouse1CounterfeitStash3 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "counterfeit_stash3")
            end
        end
        if config.clubhouse1WeedStash1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "weed_stash1")
            end
        end
        if config.clubhouse1WeedStash2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "weed_stash2")
            end
        end
        if config.clubhouse1WeedStash3 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "weed_stash3")
            end
        end
        if config.clubhouse1IDStash1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "id_stash1")
            end
        end
        if config.clubhouse1IDStash2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "id_stash2")
            end
        end
        if config.clubhouse1IDStash3 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "id_stash3")
            end
        end
        if config.clubhouse1MethStash1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "meth_stash1")
            end
        end
        if config.clubhouse1MethStash2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "meth_stash2")
            end
        end
        if config.clubhouse1MethStash3 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "meth_stash3")
            end
        end
        if config.clubhouse1Decorative1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "decorative_01")
            end
        end
        if config.clubhouse1Decorative2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "decorative_02")
            end
        end
        if config.clubhouse1Furnishings1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "furnishings_01")
            end
        end
        if config.clubhouse1Furnishings2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "furnishings_02")
            end
        end
        if config.clubhouse1Walls1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "walls_01")
            end
        end
        if config.clubhouse1Walls2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "walls_02")
            end
        end
        if config.clubhouse1Murals1 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_01")
            end
        end
        if config.clubhouse1Murals2 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_02")
            end
        end
        if config.clubhouse1Murals3 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_03")
            end
        end
        if config.clubhouse1Murals4 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_04")
            end
        end
        if config.clubhouse1Murals5 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_05")
            end
        end
        if config.clubhouse1Murals6 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_06")
            end
        end
        if config.clubhouse1Murals7 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_07")
            end
        end
        if config.clubhouse1Murals8 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_08")
            end
        end
        if config.clubhouse1Murals9 then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mural_09")
            end
        end
        if config.clubhouse1GunLocker then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "gun_locker")
            end
        end
        if config.clubhouse1ModBooth then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "mod_booth")
            end
        end
        if config.clubhouse1NoGunLocker then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "no_gun_locker")
            end
        end
        if config.clubhouse1NoModBooth then
            if config.clubHouseOne then
                ActivateInteriorEntitySet(config.clubHouseOneId, "no_mod_booth")
            end
        end
			-- Clubhouse 2
		if config.clubhouse2CashLarge then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "cash_large")
			end
		end
		if config.clubhouse2CashMedium then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "cash_medium")
			end
		end
		if config.clubhouse2Cashsmall then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "cash_small")
			end
		end
		if config.clubhouse2CokeLarge then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "coke_large")
			end
		end
		if config.clubhouse2CokeMedium then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "coke_medium")
			end
		end
		if config.clubhouse2CashSmall then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "coke_small")
			end
		end
		if config.clubhouse2CounterfeitLarge then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "counterfeit_large")
			end
		end
		if config.clubhouse2CounterfeitMedium then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "counterfeit_medium")
			end
		end
		if config.clubhouse2CounterfeitSmall then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "counterfeit_small")
			end
		end
		if config.clubhouse2IDLarge then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "id_large")
			end
		end
		if config.clubhouse2IDMedium then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "id_medium")
			end
		end
		if config.clubhouse2IDSmall then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "id_small")
			end
		end
		if config.clubhouse2MethLarge then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "meth_large")
			end
		end
		if config.clubhouse2MethMedium then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "meth_medium")
			end
		end
		if config.clubhouse2MethSmall then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "meth_small")
			end
		end
		if config.clubhouse2WeedLarge then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "weed_large")
			end
		end
		if config.clubhouse2WeedMedium then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "weed_medium")
			end
		end
		if config.clubhouse2WeedSmall then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "weed_small")
			end
		end
		if config.clubhouse2Decorative1 then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "decorative_01")
			end
		end
		if config.clubhouse2Decorative2 then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "decorative_02")
			end
		end
		if config.clubhouse2Furnishings1 then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "furnishings_01")
			end
		end
		if config.clubhouse2Furnishings2 then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "furnishings_02")
			end
		end
		if config.clubhouse2Walls1 then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "walls_01")
			end
		end
		if config.clubhouse2Walls2 then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "walls_02")
			end
		end
		if config.clubhouse2LowerWallsDefault then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "lower_walls_default")
			end
		end
		if config.clubhouse2GunLocker then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "gun_locker")
			end
		end
		if config.clubhouse2ModBooth then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "mod_booth")
			end
		end
		if config.clubhouse2NoGunLocker then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "no_gun_locker")
			end
		end
		if config.clubhouse2NoModBooth then
			if config.clubHouse2 then
				ActivateInteriorEntitySet(config.clubHoue2Id, "no_mod_booth")
			end
		end
		-- Import/Export
		if config.importExportDecor1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "garage_decor_01")
		    end
		end
		if config.importExportDecor2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "garage_decor_02")
		    end
		end
		if config.importExportDecor3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "garage_decor_03")
		    end
		end
		if config.importExportDecor4 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "garage_decor_04")
		    end
		end
		if config.importExportLightingOptions1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option01")
		    end
		end
		if config.importExportLightingOptions2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option02")
		    end
		end
		if config.importExportLightingOptions3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option03")
		    end
		end
		if config.importExportLightingOptions4 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option04")
		    end
		end
		if config.importExportLightingOptions5 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option05")
		    end
		end
		if config.importExportLightingOptions6 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option06")
		    end
		end
		if config.importExportLightingOptions7 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option07")
		    end
		end
		if config.importExportLightingOptions8 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option08")
		    end
		end
		if config.importExportLightingOptions9 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "lighting_option09")
		    end
		end
		if config.importExportNumberStyle1N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style01_n1")
		    end
		end
		if config.importExportNumberStyle1N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style01_n2")
		    end
		end
		if config.importExportNumberStyle1N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style01_n3")
		    end
		end
		if config.importExportNumberStyle2N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style02_n1")
		    end
		end
		if config.importExportNumberStyle2N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style02_n2")
		    end
		end
		if config.importExportNumberStyle2N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style02_n3")
		    end
		end
		if config.importExportNumberStyle3N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style03_n1")
		    end
		end
		if config.importExportNumberStyle3N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style03_n2")
		    end
		end
		if config.importExportNumberStyle3N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style03_n3")
		    end
		end
		if config.importExportNumberStyle4N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style04_n1")
		    end
		end
		if config.importExportNumberStyle4N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style04_n2")
		    end
		end
		if config.importExportNumberStyle4N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style04_n3")
		    end
		end
		if config.importExportNumberStyle5N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style05_n1")
		    end
		end
		if config.importExportNumberStyle5N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style05_n2")
		    end
		end
		if config.importExportNumberStyle5N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style05_n3")
		    end
		end
		if config.importExportNumberStyle6N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style06_n1")
		    end
		end
		if config.importExportNumberStyle6N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style06_n2")
		    end
		end
		if config.importExportNumberStyle6N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style06_n3")
		    end
		end
		if config.importExportNumberStyle7N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style07_n1")
		    end
		end
		if config.importExportNumberStyle7N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style07_n2")
		    end
		end
		if config.importExportNumberStyle7N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style07_n3")
		    end
		end
		if config.importExportNumberStyle8N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style08_n1")
		    end
		end
		if config.importExportNumberStyle8N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style08_n2")
		    end
		end
		if config.importExportNumberStyle8N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style08_n3")
		    end
		end
		if config.importExportNumberStyle9N1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style09_n1")
		    end
		end
		if config.importExportNumberStyle9N2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style09_n2")
		    end
		end
		if config.importExportNumberStyle9N3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "numbering_style09_n3")
		    end
		end
		if config.importExportFloorVinyl1 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_01")
		    end
		end
		if config.importExportFloorVinyl2 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_02")
		    end
		end
		if config.importExportFloorVinyl3 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_03")
		    end
		end
		if config.importExportFloorVinyl4 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_04")
		    end
		end
		if config.importExportFloorVinyl5 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_05")
		    end
		end
		if config.importExportFloorVinyl6 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_06")
		    end
		end
		if config.importExportFloorVinyl7 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_07")
		    end
		end
		if config.importExportFloorVinyl8 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_08")
		    end
		end
		if config.importExportFloorVinyl9 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_09")
		    end
		end
		if config.importExportFloorVinyl10 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_10")
		    end
		end
		if config.importExportFloorVinyl11 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_11")
		    end
		end
		if config.importExportFloorVinyl12 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_12")
		    end
		end
		if config.importExportFloorVinyl13 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_13")
		    end
		end
		if config.importExportFloorVinyl14 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_14")
		    end
		end
		if config.importExportFloorVinyl15 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_15")
		    end
		end
		if config.importExportFloorVinyl16 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_16")
		    end
		end
		if config.importExportFloorVinyl17 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_17")
		    end
		end
		if config.importExportFloorVinyl18 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_18")
		    end
		end
		if config.importExportFloorVinyl19 then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "floor_vinyl_19")
		    end
		end
		if config.importExportBasicStyleSet then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "basic_style_set")
		    end
		end
		if config.importExportBrandedStyleSet then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "branded_style_set")
		    end
		end
		if config.importExportUrbanStyleSet then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "urban_style_set")
		    end
		end
		if config.importExportCarFloorHatch then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "car_floor_hatch")
		    end
		end
		if config.importExportDoorBlocker then
    		if config.importExport then
        		ActivateInteriorEntitySet(config.importExportId, "door_blocker")
			end
		end
		-- CEO Offices

		if config.ceoOffices then

			arcadiusId     = {}
			mazeBankId     = {}
			mazeBankWestId = {}
			lomBankId      = {}
		
			if config.arcadiusOldSpiceWarm then
				arcadiusId = config.arcadiusOldSpiceWarmId
			elseif config.arcadiusOldSpiceVintage then
				arcadiusId = config.arcadiusOldSpiceVintageId
			elseif config.arcadiusOldSpiceClassical then
				arcadiusId = config.arcadiusOldSpiceClassicalId
			elseif config.arcadiusExecutiveContrast then
				arcadiusId = config.arcadiusExecutiveContrastId
			elseif config.arcadiusExecutiveRich then
				arcadiusId = config.arcadiusExecutiveRichId
			elseif config.arcadiusExecutiveCool then
				arcadiusId = config.arcadiusExecutiveCoolId
			elseif config.arcadiusPowerBrokerIce then
				arcadiusId = config.arcadiusPowerBrokerIceId
			elseif config.arcadiusPowerBrokerConservative then
				arcadiusId = config.arcadiusPowerBrokerConservativeId
			elseif config.arcadiusPowerBrokerPolished then
				arcadiusId = config.arcadiusPowerBrokerPolishedId
				if config.ceoCashSet1 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_01")
				end
				if config.ceoCashSet2 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_02")
				end
				if config.ceoCashSet3 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_03")
				end
				if config.ceoCashSet4 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_04")
				end
				if config.ceoCashSet5 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_05")
				end
				if config.ceoCashSet6 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_06")
				end
				if config.ceoCashSet7 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_07")
				end
				if config.ceoCashSet8 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_08")
				end
				if config.ceoCashSet9 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_09")
				end
				if config.ceoCashSet10 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_10")
				end
				if config.ceoCashSet11 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_11")
				end
				if config.ceoCashSet12 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_12")
				end
				if config.ceoCashSet13 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_13")
				end
				if config.ceoCashSet14 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_14")
				end
				if config.ceoCashSet15 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_15")
				end
				if config.ceoCashSet16 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_16")
				end
				if config.ceoCashSet17 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_17")
				end
				if config.ceoCashSet18 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_18")
				end
				if config.ceoCashSet19 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_19")
				end
				if config.ceoCashSet20 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_20")
				end
				if config.ceoCashSet21 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_21")
				end
				if config.ceoCashSet22 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_22")
				end
				if config.ceoCashSet23 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_23")
				end
				if config.ceoCashSet24 then
					ActivateInteriorEntitySet(config.arcadiusId, "cash_set_24")
				end
				if config.ceoOfficeBooze then
					ActivateInteriorEntitySet(config.arcadiusId, "office_booze")
				end
				if config.ceoOfficeChairs then
					ActivateInteriorEntitySet(config.arcadiusId, "office_chairs")
				end
				if config.ceoSwagArt1 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_art")
				end
				if config.ceoSwagArt2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_art2")
				end
				if config.ceoSwagArt3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_art3")
				end
				if config.ceoBoozeCigs then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_booze_cigs")
				end
				if config.ceoBoozeCigs2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_booze_cigs2")
				end
				if config.ceoBoozeCigs3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_booze_cigs3")
				end
				if config.ceoSwagCounterfeit then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_counterfeit")
				end
				if config.ceoSwagCounterfeit2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_counterfeit2")
				end
				if config.ceoSwagCounterfeit3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_counterfeit3")
				end
				if config.ceoSwagDrugBags then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_drugbags")
				end
				if config.ceoSwagDrugBags2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_drugbags2")
				end
				if config.ceoSwagDrugBags3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_drugbags3")
				end
				if config.ceoDrugStatue then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_drugstatue")
				end
				if config.ceoDrugStatue2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_drugstatue2")
				end
				if config.ceoDrugStatue3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_drugstatue3")
				end
				if config.ceoElectronic then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_electronic")
				end
				if config.ceoElectronic2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_electronic2")
				end
				if config.ceoElectronic3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_electronic3")
				end
				if config.ceoFurCoats then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_furcoats")
				end	
				if config.ceoFurCoats2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_furcoats2")
				end
				if config.ceoFurCoats3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_furcoats3")
				end
				if config.ceoSwagGems then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_gems")
				end
				if config.ceoSwagGems2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_gems2")
				end
				if config.ceoSwagGems3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_gems3")
				end
				if config.ceoSwagGuns then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_guns")
				end
				if config.ceoSwagGuns2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_guns2")
				end
				if config.ceoSwagGuns3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_guns3")
				end
				if config.ceoSwagIvory then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_ivory")
				end
				if config.ceoSwagIvory2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_ivory2")
				end
				if config.ceoSwagIvory3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_ivory3")
				end
				if config.ceoSwagJewelWatch then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_jewelwatch")
				end
				if config.ceoSwagJewelWatch2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_jewelwatch2")
				end
				if config.ceoSwagJewelWatch3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_jewelwatch3")
				end
				if config.ceoSwagMed then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_med")
				end
				if config.ceoSwagMed2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_med2")
				end
				if config.ceoSwagMed3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_med3")
				end
				if config.ceoSwagPills then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_pills")
				end
				if config.ceoSwagPills2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_pills2")
				end
				if config.ceoSwagPills3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_pills3")
				end
				if config.ceoSwagSilver then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_silver")
				end
				if config.ceoSwagSilver2 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_silver2")
				end
				if config.ceoSwagSilver3 then
					ActivateInteriorEntitySet(config.arcadiusId, "swag_silver3")
				end
			end
			if config.mazeBankOldSpiceWarm then
				mazeBankId = config.mazeBankOldSpiceWarmId
			elseif config.mazeBankOldSpiceVintage then
				mazeBankId = config.mazeBankOldSpiceVintageId
			elseif config.mazeBankOldSpiceClassical then
				mazeBankId = config.mazeBankOldSpiceClassicalId
			elseif config.mazeBankExecutiveContrast then
				mazeBankId = config.mazeBankExecutiveContrastId
			elseif config.mazeBankExecutiveRich then
				mazeBankId = config.mazeBankExecutiveRichId
			elseif config.mazeBankExecutiveCool then
				mazeBankId = config.mazeBankExecutiveCoolId
			elseif config.mazeBankPowerBrokerIce then
				mazeBankId = config.mazeBankPowerBrokerIceId
			elseif config.mazeBankPowerBrokerConservative then
				mazeBankId = config.mazeBankPowerBrokerConservativeId
			elseif config.mazeBankPowerBrokerPolished then
				mazeBankId = config.mazeBankPowerBrokerPolishedId
				if config.ceoCashSet1 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_01")
				end
				if config.ceoCashSet2 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_02")
				end
				if config.ceoCashSet3 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_03")
				end
				if config.ceoCashSet4 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_04")
				end
				if config.ceoCashSet5 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_05")
				end
				if config.ceoCashSet6 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_06")
				end
				if config.ceoCashSet7 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_07")
				end
				if config.ceoCashSet8 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_08")
				end
				if config.ceoCashSet9 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_09")
				end
				if config.ceoCashSet10 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_10")
				end
				if config.ceoCashSet11 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_11")
				end
				if config.ceoCashSet12 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_12")
				end
				if config.ceoCashSet13 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_13")
				end
				if config.ceoCashSet14 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_14")
				end
				if config.ceoCashSet15 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_15")
				end
				if config.ceoCashSet16 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_16")
				end
				if config.ceoCashSet17 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_17")
				end
				if config.ceoCashSet18 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_18")
				end
				if config.ceoCashSet19 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_19")
				end
				if config.ceoCashSet20 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_20")
				end
				if config.ceoCashSet21 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_21")
				end
				if config.ceoCashSet22 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_22")
				end
				if config.ceoCashSet23 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_23")
				end
				if config.ceoCashSet24 then
					ActivateInteriorEntitySet(config.mazeBankId, "cash_set_24")
				end
				if config.ceoOfficeBooze then
					ActivateInteriorEntitySet(config.mazeBankId, "office_booze")
				end
				if config.ceoOfficeChairs then
					ActivateInteriorEntitySet(config.mazeBankId, "office_chairs")
				end
				if config.ceoSwagArt1 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_art")
				end
				if config.ceoSwagArt2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_art2")
				end
				if config.ceoSwagArt3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_art3")
				end
				if config.ceoBoozeCigs then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_booze_cigs")
				end
				if config.ceoBoozeCigs2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_booze_cigs2")
				end
				if config.ceoBoozeCigs3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_booze_cigs3")
				end
				if config.ceoSwagCounterfeit then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_counterfeit")
				end
				if config.ceoSwagCounterfeit2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_counterfeit2")
				end
				if config.ceoSwagCounterfeit3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_counterfeit3")
				end
				if config.ceoSwagDrugBags then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_drugbags")
				end
				if config.ceoSwagDrugBags2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_drugbags2")
				end
				if config.ceoSwagDrugBags3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_drugbags3")
				end
				if config.ceoDrugStatue then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_drugstatue")
				end
				if config.ceoDrugStatue2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_drugstatue2")
				end
				if config.ceoDrugStatue3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_drugstatue3")
				end
				if config.ceoElectronic then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_electronic")
				end
				if config.ceoElectronic2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_electronic2")
				end
				if config.ceoElectronic3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_electronic3")
				end
				if config.ceoFurCoats then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_furcoats")
				end	
				if config.ceoFurCoats2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_furcoats2")
				end
				if config.ceoFurCoats3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_furcoats3")
				end
				if config.ceoSwagGems then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_gems")
				end
				if config.ceoSwagGems2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_gems2")
				end
				if config.ceoSwagGems3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_gems3")
				end
				if config.ceoSwagGuns then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_guns")
				end
				if config.ceoSwagGuns2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_guns2")
				end
				if config.ceoSwagGuns3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_guns3")
				end
				if config.ceoSwagIvory then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_ivory")
				end
				if config.ceoSwagIvory2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_ivory2")
				end
				if config.ceoSwagIvory3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_ivory3")
				end
				if config.ceoSwagJewelWatch then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_jewelwatch")
				end
				if config.ceoSwagJewelWatch2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_jewelwatch2")
				end
				if config.ceoSwagJewelWatch3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_jewelwatch3")
				end
				if config.ceoSwagMed then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_med")
				end
				if config.ceoSwagMed2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_med2")
				end
				if config.ceoSwagMed3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_med3")
				end
				if config.ceoSwagPills then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_pills")
				end
				if config.ceoSwagPills2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_pills2")
				end
				if config.ceoSwagPills3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_pills3")
				end
				if config.ceoSwagSilver then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_silver")
				end
				if config.ceoSwagSilver2 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_silver2")
				end
				if config.ceoSwagSilver3 then
					ActivateInteriorEntitySet(config.mazeBankId, "swag_silver3")
				end
			end
			if config.mazeBankWestOldSpiceWarm then
				mazeBankWestId = config.mazeBankWestOldSpiceWarmId
			elseif config.mazeBankWestOldSpiceVintage then
				mazeBankWestId = config.mazeBankWestOldSpiceVintageId
			elseif config.mazeBankWestOldSpiceClassical then
				mazeBankWestId = config.mazeBankWestOldSpiceClassicalId
			elseif config.mazeBankWestExecutiveContrast then
				mazeBankWestId = config.mazeBankWestExecutiveContrastId
			elseif config.mazeBankWestExecutiveRich then
				mazeBankWestId = config.mazeBankWestExecutiveRichId
			elseif config.mazeBankWestExecutiveCool then
				mazeBankWestId = config.mazeBankWestExecutiveCoolId
			elseif config.mazeBankWestPowerBrokerIce then
				mazeBankWestId = config.mazeBankWestPowerBrokerIceId
			elseif config.mazeBankWestPowerBrokerConservative then
				mazeBankWestId = config.mazeBankWestPowerBrokerConservativeId
			elseif config.mazeBankWestPowerBrokerPolished then
				mazeBankWestId = config.mazeBankWestPowerBrokerPolishedId
				if config.ceoCashSet1 then
						ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_01")
				   end
				if config.ceoCashSet2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_02")
				end
				if config.ceoCashSet3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_03")
				end
				if config.ceoCashSet4 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_04")
				end
				if config.ceoCashSet5 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_05")
				end
				if config.ceoCashSet6 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_06")
				end
				if config.ceoCashSet7 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_07")
				end
				if config.ceoCashSet8 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_08")
				end
				if config.ceoCashSet9 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_09")
				end
				if config.ceoCashSet10 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_10")
				end
				if config.ceoCashSet11 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_11")
				end
				if config.ceoCashSet12 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_12")
				end
				if config.ceoCashSet13 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_13")
				end
				if config.ceoCashSet14 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_14")
				end
				if config.ceoCashSet15 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_15")
				end
				if config.ceoCashSet16 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_16")
				end
				if config.ceoCashSet17 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_17")
				end
				if config.ceoCashSet18 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_18")
				end
				if config.ceoCashSet19 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_19")
				end
				if config.ceoCashSet20 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_20")
				end
				if config.ceoCashSet21 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_21")
				end
				if config.ceoCashSet22 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_22")
				end
				if config.ceoCashSet23 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_23")
				end
				if config.ceoCashSet24 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "cash_set_24")
				end
				if config.ceoOfficeBooze then
					ActivateInteriorEntitySet(config.mazeBankWestId, "office_booze")
				end
				if config.ceoOfficeChairs then
					ActivateInteriorEntitySet(config.mazeBankWestId, "office_chairs")
				end
				if config.ceoSwagArt1 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_art")
				end	
				if config.ceoSwagArt2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_art2")
				end
				if config.ceoSwagArt3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_art3")
				end
				if config.ceoBoozeCigs then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_booze_cigs")
				end
				if config.ceoBoozeCigs2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_booze_cigs2")
				end
				if config.ceoBoozeCigs3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_booze_cigs3")
				end
				if config.ceoSwagCounterfeit then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_counterfeit")
				end
				if config.ceoSwagCounterfeit2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_counterfeit2")
				end
				if config.ceoSwagCounterfeit3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_counterfeit3")
				end
				if config.ceoSwagDrugBags then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_drugbags")
				end
				if config.ceoSwagDrugBags2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_drugbags2")
				end
				if config.ceoSwagDrugBags3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_drugbags3")
				end
				if config.ceoDrugStatue then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_drugstatue")
				end
				if config.ceoDrugStatue2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_drugstatue2")
				end
				if config.ceoDrugStatue3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_drugstatue3")
				end
				if config.ceoElectronic then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_electronic")
				end
				if config.ceoElectronic2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_electronic2")
				end
				if config.ceoElectronic3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_electronic3")
				end
				if config.ceoFurCoats then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_furcoats")
				end	
				if config.ceoFurCoats2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_furcoats2")
				end
				if config.ceoFurCoats3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_furcoats3")
				end
				if config.ceoSwagGems then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_gems")
				end
				if config.ceoSwagGems2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_gems2")
				end
				if config.ceoSwagGems3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_gems3")
				end
				if config.ceoSwagGuns then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_guns")
				end
				if config.ceoSwagGuns2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_guns2")
				end
				if config.ceoSwagGuns3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_guns3")
				end
				if config.ceoSwagIvory then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_ivory")
				end
				if config.ceoSwagIvory2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_ivory2")
				end
				if config.ceoSwagIvory3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_ivory3")
				end
				if config.ceoSwagJewelWatch then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_jewelwatch")
				end
				if config.ceoSwagJewelWatch2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_jewelwatch2")
				end
				if config.ceoSwagJewelWatch3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_jewelwatch3")
				end
				if config.ceoSwagMed then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_med")
				end
				if config.ceoSwagMed2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_med2")
				end
				if config.ceoSwagMed3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_med3")
				end
				if config.ceoSwagPills then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_pills")
				end
				if config.ceoSwagPills2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_pills2")
				end
				if config.ceoSwagPills3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_pills3")
				end
				if config.ceoSwagSilver then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_silver")
				end
				if config.ceoSwagSilver2 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_silver2")
				end
				if config.ceoSwagSilver3 then
					ActivateInteriorEntitySet(config.mazeBankWestId, "swag_silver3")
				end
			end
			if config.lomBankOldSpiceWarm then
				lomBankId = config.lomBankOldSpiceWarmId
			elseif config.lomBankOldSpiceVintage then
				lomBankId = config.lomBankOldSpiceVintageId
			elseif config.lomBankOldSpiceClassical then
				lomBankId = config.lomBankOldSpiceClassicalId
			elseif config.lomBankExecutiveContrast then
				lomBankId = config.lomBankExecutiveContrastId
			elseif config.lomBankExecutiveRich then
				lomBankId = config.lomBankExecutiveRichId
			elseif config.lomBankExecutiveCool then
				lomBankId = config.lomBankExecutiveCoolId
			elseif config.lomBankPowerBrokerIce then
				lomBankId = config.lomBankPowerBrokerIceId
			elseif config.lomBankPowerBrokerConservative then
				lomBankId = config.lomBankPowerBrokerConservativeId
			elseif config.lomBankPowerBrokerPolished then
				lomBankId = config.lomBankPowerBrokerPolishedId
				if config.ceoCashSet1 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_01")
				end
				if config.ceoCashSet2 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_02")
				end
				if config.ceoCashSet3 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_03")
				end
				if config.ceoCashSet4 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_04")
				end
				if config.ceoCashSet5 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_05")
				end
				if config.ceoCashSet6 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_06")
				end
				if config.ceoCashSet7 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_07")
				end
				if config.ceoCashSet8 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_08")
				end
				if config.ceoCashSet9 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_09")
				end
				if config.ceoCashSet10 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_10")
				end
				if config.ceoCashSet11 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_11")
				end
				if config.ceoCashSet12 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_12")
				end
				if config.ceoCashSet13 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_13")
				end
				if config.ceoCashSet14 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_14")
				end
				if config.ceoCashSet15 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_15")
				end
				if config.ceoCashSet16 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_16")
				end
				if config.ceoCashSet17 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_17")
				end
				if config.ceoCashSet18 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_18")
				end
				if config.ceoCashSet19 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_19")
				end
				if config.ceoCashSet20 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_20")
				end
				if config.ceoCashSet21 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_21")
				end
				if config.ceoCashSet22 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_22")
				end
				if config.ceoCashSet23 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_23")
				end
				if config.ceoCashSet24 then
					ActivateInteriorEntitySet(config.lomBankId, "cash_set_24")
				end
				if config.ceoOfficeBooze then
					ActivateInteriorEntitySet(config.lomBankId, "office_booze")
				end
				if config.ceoOfficeChairs then
					ActivateInteriorEntitySet(config.lomBankId, "office_chairs")
				end
				if config.ceoSwagArt1 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_art")
				end
				if config.ceoSwagArt2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_art2")
				end
				if config.ceoSwagArt3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_art3")
				end
				if config.ceoBoozeCigs then
					ActivateInteriorEntitySet(config.lomBankId, "swag_booze_cigs")
				end
				if config.ceoBoozeCigs2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_booze_cigs2")
				end
				if config.ceoBoozeCigs3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_booze_cigs3")
				end
				if config.ceoSwagCounterfeit then
					ActivateInteriorEntitySet(config.lomBankId, "swag_counterfeit")
				end
				if config.ceoSwagCounterfeit2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_counterfeit2")
				end
				if config.ceoSwagCounterfeit3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_counterfeit3")
				end
				if config.ceoSwagDrugBags then
					ActivateInteriorEntitySet(config.lomBankId, "swag_drugbags")
				end
				if config.ceoSwagDrugBags2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_drugbags2")
				end
				if config.ceoSwagDrugBags3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_drugbags3")
				end
				if config.ceoDrugStatue then
					ActivateInteriorEntitySet(config.lomBankId, "swag_drugstatue")
				end
				if config.ceoDrugStatue2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_drugstatue2")
				end
				if config.ceoDrugStatue3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_drugstatue3")
				end
				if config.ceoElectronic then
					ActivateInteriorEntitySet(config.lomBankId, "swag_electronic")
				end
				if config.ceoElectronic2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_electronic2")
				end
				if config.ceoElectronic3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_electronic3")
				end
				if config.ceoFurCoats then
					ActivateInteriorEntitySet(config.lomBankId, "swag_furcoats")
				end	
				if config.ceoFurCoats2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_furcoats2")
				end
				if config.ceoFurCoats3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_furcoats3")
				end
				if config.ceoSwagGems then
					ActivateInteriorEntitySet(config.lomBankId, "swag_gems")
				end
				if config.ceoSwagGems2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_gems2")
				end
				if config.ceoSwagGems3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_gems3")
				end
				if config.ceoSwagGuns then
					ActivateInteriorEntitySet(config.lomBankId, "swag_guns")
				end
				if config.ceoSwagGuns2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_guns2")
				end
				if config.ceoSwagGuns3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_guns3")
				end
				if config.ceoSwagIvory then
					ActivateInteriorEntitySet(config.lomBankId, "swag_ivory")
				end
				if config.ceoSwagIvory2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_ivory2")
				end
				if config.ceoSwagIvory3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_ivory3")
				end
				if config.ceoSwagJewelWatch then
					ActivateInteriorEntitySet(config.lomBankId, "swag_jewelwatch")
				end
				if config.ceoSwagJewelWatch2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_jewelwatch2")
				end
				if config.ceoSwagJewelWatch3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_jewelwatch3")
				end
				if config.ceoSwagMed then
					ActivateInteriorEntitySet(config.lomBankId, "swag_med")
				end
				if config.ceoSwagMed2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_med2")
				end
				if config.ceoSwagMed3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_med3")
				end
				if config.ceoSwagPills then
					ActivateInteriorEntitySet(config.lomBankId, "swag_pills")
				end
				if config.ceoSwagPills2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_pills2")
				end
				if config.ceoSwagPills3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_pills3")
				end
				if config.ceoSwagSilver then
					ActivateInteriorEntitySet(config.lomBankId, "swag_silver")
				end
				if config.ceoSwagSilver2 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_silver2")
				end
				if config.ceoSwagSilver3 then
					ActivateInteriorEntitySet(config.lomBankId, "swag_silver3")
				end
			end
		end
		-- CEO Garages
		if config.ceoGaragesDecor1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "garage_decor_01")
		end
		if config.ceoGaragesDecor2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "garage_decor_02")
		end
		if config.ceoGaragesDecor3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "garage_decor_03")
		end
		if config.ceoGaragesDecor4 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "garage_decor_04")
		end
		if config.ceoGaragesLightingOptions1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option01")
		end
		if config.ceoGaragesLightingOptions2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option02")
		end
		if config.ceoGaragesLightingOptions3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option03")
		end
		if config.ceoGaragesLightingOptions4 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option04")
		end
		if config.ceoGaragesLightingOptions5 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option05")
		end
		if config.ceoGaragesLightingOptions6 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option06")
		end
		if config.ceoGaragesLightingOptions7 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option07")
		end
		if config.ceoGaragesLightingOptions8 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option08")
		end
		if config.ceoGaragesLightingOptions9 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "lighting_option09")
		end
		if config.ceoGaragesNumberingStyle1n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style01_n1")
		end
		if config.ceoGaragesNumberingStyle1n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style01_n2")
		end
		if config.ceoGaragesNumberingStyle1n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style01_n3")
		end
		if config.ceoGaragesNumberingStyle2n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style02_n1")
		end
		if config.ceoGaragesNumberingStyle2n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style02_n2")
		end
		if config.ceoGaragesNumberingStyle2n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style02_n3")
		end
		if config.ceoGaragesNumberingStyle3n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style03_n1")
		end
		if config.ceoGaragesNumberingStyle3n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style03_n2")
		end
		if config.ceoGaragesNumberingStyle3n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style03_n3")
		end
		if config.ceoGaragesNumberingStyle4n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style04_n1")
		end
		if config.ceoGaragesNumberingStyle4n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style04_n2")
		end
		if config.ceoGaragesNumberingStyle4n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style04_n3")
		end
		if config.ceoGaragesNumberingStyle5n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style05_n1")
		end
		if config.ceoGaragesNumberingStyle5n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style05_n2")
		end
		if config.ceoGaragesNumberingStyle5n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style05_n3")
		end
		if config.ceoGaragesNumberingStyle6n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style06_n1")
		end
		if config.ceoGaragesNumberingStyle6n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style06_n2")
		end
		if config.ceoGaragesNumberingStyle6n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style06_n3")
		end
		if config.ceoGaragesNumberingStyle7n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style07_n1")
		end
		if config.ceoGaragesNumberingStyle7n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style07_n2")
		end
		if config.ceoGaragesNumberingStyle7n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style07_n3")
		end
		if config.ceoGaragesNumberingStyle8n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style08_n1")
		end
		if config.ceoGaragesNumberingStyle8n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style08_n2")
		end
		if config.ceoGaragesNumberingStyle8n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style08_n3")
		end
		if config.ceoGaragesNumberingStyle9n1 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style09_n1")
		end
		if config.ceoGaragesNumberingStyle9n2 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style09_n2")
		end
		if config.ceoGaragesNumberingStyle9n3 then
    		ActivateInteriorEntitySet(config.ceoGarageId, "numbering_style09_n3")
		end
		if config.ceoGaragesBasicStyleSet then
    		ActivateInteriorEntitySet(config.ceoGarageId, "basic_style_set")
		end
-- CEO Vehicle Shops
if config.ceoVehGaragesFloorVinyl1 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_01")
end
if config.ceoVehGaragesFloorVinyl2 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_02")
end
if config.ceoVehGaragesFloorVinyl3 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_03")
end
if config.ceoVehGaragesFloorVinyl4 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_04")
end
if config.ceoVehGaragesFloorVinyl5 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_05")
end
if config.ceoVehGaragesFloorVinyl6 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_06")
end
if config.ceoVehGaragesFloorVinyl7 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_07")
end
if config.ceoVehGaragesFloorVinyl8 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_08")
end
if config.ceoVehGaragesFloorVinyl9 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_10")
end
if config.ceoVehGaragesFloorVinyl10 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_11")
end
if config.ceoVehGaragesFloorVinyl12 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_12")
end
if config.ceoVehGaragesFloorVinyl13 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_13")
end
if config.ceoVehGaragesFloorVinyl14 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_14")
end
if config.ceoVehGaragesFloorVinyl15 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_15")
end
if config.ceoVehGaragesFloorVinyl16 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_16")
end
if config.ceoVehGaragesFloorVinyl17 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_17")
end
if config.ceoVehGaragesFloorVinyl18 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_18")
end
if config.ceoVehGaragesFloorVinyl19 then
    ActivateInteriorEntitySet(config.ceoVehicleShopId, "floor_vinyl_19")
end
		
		-- Document Forgery Office
		if config.dfoChair1 then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "chair01")
			end
		end
		if config.dfoChair2 then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "chair02")
			end
		end
		if config.dfoChair3 then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "chair03")
			end
		end
		if config.dfoChair4 then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "chair04")
			end
		end
		if config.dfoChair5 then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "chair05")
			end
		end
		if config.dfoChair6 then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "chair06")
			end
		end
		if config.dfoChair7 then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "chair07")
			end
		end
		if config.dfoClutter then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "clutter")
			end
		end
		if config.dfoEquipmentBasic then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "equipment_basic")
			end
		end
		if config.dfoequipmentUpgrade then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "equipment_upgrade")
			end
		end
		if config.dfoInteriorBasic then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "interior_basic")
			end
		end
		if config.dfoInteriorUpgrade then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "interior_upgrade")
			end
		end
		if config.dfoProduction then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "production")
			end
		end
		if config.dfoSecurityHigh then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "security_high")
			end
		end
		if config.dfoSecurityLow then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "security_low")
			end
		end
		if config.dfoSetup then
			if config.wareHouseThree then
				ActivateInteriorEntitySet(config.wareHouseFiveId, "set_up")
			end
		end
		-- Doomsday Facility
		if config.doomsdayFacilityDecal then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_decal_01")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorDecal)
			end
		end
		if config.doomsdayFacilityLounge then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_lounge1")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorLounge)
			end
		end
		if config.doomsdayFacilityCannon then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_cannon")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorCannon)
			end
		end
		if config.doomsdayClutter then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_clutter1")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorClutter)
			end
		end
		if config.doomsdayFacilityCrewEmblem then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_crewemblem")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorCrewEmblem)
			end
		end
		if config.doomsdayFacilityShell then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_shell")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorShell)
			end
		end
		if config.doomsdayFacilitySecurity then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_security")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorSecurity)
			end
		end
		if config.doomsdayFacilitySleep then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_sleep")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorSleep)
			end
		end
		if config.doomsdayFacilityTrophy then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_trophy1")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorTrophy)
			end
		end
		if config.doomsdayFacilityMedicComplete then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_int_02_paramedic_complete")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorMedicComplete)
			end
		end
		if config.doomsdayFacilityMedicOutfit then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_Int_02_outfit_paramedic")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorMedicOutfit)
			end
		end
		if config.doomsdayFacilityServerFarmOutfit then
			if config.doomsday then
				ActivateInteriorEntitySet(config.doomsdayId, "set_Int_02_outfit_serverfarm")
				SetInteriorEntitySetColor(config.doomsdayId, config.doomsdayColorServerFarmOutfit)
			end
		end
		-- Smugglers Run Hangar
        if config.smugglersLighting then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_lighting_hangar_a")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersLightTintPropsColor)
            end
        end
        if config.smugglersShell then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_tint_shell")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersShellColor)
            end
        end
        if config.smugglersBedroomTint then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_bedroom_tint")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglerBedroomTintColor)
            end
        end
        if config.smugglersCraneTint then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_crane_tint")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglerCraneTintColor)
            end
        end
        if config.smugglersModarea then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_modarea")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersModareaColor)
            end
        end
        if config.smugglersLightingTintProps then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_lighting_tint_props")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersLightTintPropsColor)
            end
        end
        if config.smugglersFloor then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_floor_1")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersFloorDecalColor)
            end
        end
        if config.smugglersFloorDecal then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_floor_decal_1")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersFloorDecalColor)
            end
        end
		if config.smugglersBedroomTraditional then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_bedroom_traditional")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersBedRoomModernColor)
            end
        end
        if config.smugglersBedroomModern then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_bedroom_modern")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersBedRoomModernColor)
            end
        end
        if config.smugglersOfficeModern then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_office_modern")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersOfficeModernColor)
            end
        end
		if config.smugglersOfficeBasic then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_office_basic")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersOfficeModernColor)
            end
        end
		if config.smugglersOfficeTraditional then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_office_traditional")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersOfficeModernColor)
            end
        end
        if config.smugglersBedroomBlindsOpen then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_bedroom_blinds_open")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersBedRoomBlindOpenColor)
            end
        end
		if config.smugglersBedroomClutter then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_bedroom_blinds_open")
            end
        end
        if config.smugglersLightingWallTint then
            if config.smugglers then
                ActivateInteriorEntitySet(config.smugglersId, "set_lighting_wall_tint01")
                SetInteriorEntitySetColor(config.smugglersId, config.smugglersLightingWallTintColor)
            end
		end
		-- Penthouse
		if config.penthouseManagerDefault then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "casino_manager_default")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Tint_Shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Tint_Shell", config.penthouseTintShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spax_shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "vw_vwint02_pent_spax_shell", config.penthouseSpaxShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spa_shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "vw_vwint02_pent_spa_shell", config.penthouseSpaShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_sbt_shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "vw_vwint02_pent_sbt_shell", config.penthouseSbtShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_mbt_shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "vw_vwint02_pent_mbt_shell", config.penthouseMbtShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_hal_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_mb_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_lou_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_sb_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_din_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_bar_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_off_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_lv_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_ex_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spax_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spa_window")
				end
			end
		end
		if config.penthouseManagerWorkout then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "casino_manager_workout")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Tint_Shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Tint_Shell", config.penthouseTintShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spax_shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "vw_vwint02_pent_spax_shell", config.penthouseSpaxShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spa_shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "vw_vwint02_pent_spa_shell", config.penthouseSpaShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_sbt_shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "vw_vwint02_pent_sbt_shell", config.penthouseSbtShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_mbt_shell")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "vw_vwint02_pent_mbt_shell", config.penthouseMbtShellColor)
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_hal_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_mb_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_lou_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_sb_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_din_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_bar_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_off_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_lv_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_ex_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spax_window")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spa_window")
				end
			end
		end
		if config.penthousePattern1 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_01")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_01", config.penthousePattern1Color)
				end
			end
		end
		if config.penthousePattern2 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_02")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_02", config.penthousePattern2Color)
				end
			end
		end
		if config.penthousePattern3 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_03")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_03", config.penthousePattern3Color)
				end
			end
		end
		if config.penthousePattern4 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_04")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_04", config.penthousePattern4Color)
				end
			end
		end
		if config.penthousePattern5 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_05")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_05", config.penthousePattern5Color)
				end
			end
		end
		if config.penthousePattern6 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_06")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_06", config.penthousePattern6Color)
				end
			end
		end
		if config.penthousePattern7 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_07")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_07", config.penthousePattern7Color)
				end
			end
		end
		if config.penthousePattern8 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_08")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_08", config.penthousePattern8Color)
				end
			end
		end
		if config.penthousePattern9 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Pattern_09")
					SetInteriorEntitySetColor(config.casinoPenthouseId, "Set_Pent_Pattern_09", config.penthousePattern9Color)
				end
			end
		end
		if config.penthouseSpaBarOpen then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Spa_Bar_Open")
				end
			end
		end
		if config.penthouseSpaBarClosed then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Spa_Bar_Closed")
				end
			end
		end
		if config.penthouseMediaBarOpen then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Media_Bar_Open")
				end
			end
		end
		if config.penthouseMediaBarClosed then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Media_Bar_Closed")
				end
			end
		end
		if config.penthouseDealer then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Dealer")
				end
			end
		end
		if config.penthouseNoDealer then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_NoDealer")
				end
			end
		end
		if config.penthouseArcadeModern then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Arcade_Modern")
				end
			end
		end
		if config.penthouseArcadeRetro then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Arcade_Retro")
				end
			end
		end
		if config.penthouseBarClutter then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Bar_Clutter")
				end
			end
		end
		if config.penthouseBarClutter1 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Clutter_01")
				end
			end
		end
		if config.penthouseBarClutter2 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Clutter_02")
				end
			end
		end
		if config.penthouseBarClutter3 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_Clutter_03")
				end
			end
		end
		if config.penthouseBarLight0 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "set_pent_bar_light_0")
				end
			end
		end
		if config.penthouseBarLight1 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "set_pent_bar_light_01")
				end
			end
		end
		if config.penthouseBarParty0 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "set_pent_bar_party_0")
				end
			end
		end
		if config.penthouseBarParty1 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "set_pent_bar_party_1")
				end
			end
		end
		if config.penthouseBarParty2 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "set_pent_bar_party_2")
				end
			end
		end
		if config.penthouseBarPartyAfter then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "set_pent_bar_party_after")
				end
			end
		end
		if config.penthouseGuestBlocker then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_GUEST_BLOCKER")
				end
			end
		end
		if config.penthouseOfficeBlocker then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_OFFICE_BLOCKER")
				end
			end
		end
		if config.penthouseCineBlocker then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_CINE_BLOCKER")
				end
			end
		end
		if config.penthouseSpaBlocker then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_SPA_BLOCKER")
				end
			end
		end
		if config.penthouseBarBlocker then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "Set_Pent_BAR_BLOCKER")
				end
			end
		end
		if config.penthouseBarBlocker then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "v_ilev_garageliftdoor")
				end
			end
		end
		if config.penthouseBlocker then
			if config.penthouse then
				if config.diamondCasinoAndResort then
				ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_blocker")
				end
			end
		end
		if config.penthouseTvs then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "prop_tv_flat_03b")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "prop_tv_flat_michael")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "prop_tv_flat_01")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_prop_vw_cinema_tv_01")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "v_res_tt_tvremote")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_prop_vw_tv_rt_01a")
				end
			end
		end
		if config.penthouseMirrors then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_mbt_mirror")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_mbx_drframe")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_loux_mirror")
    				ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_sbt_mirror")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_wk_mirror")  
				end
			end
		end
		if config.penthouseEdgeBlend then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_mb_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_hal_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_lou_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_sb_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_din_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_bar_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_off_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_wk_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_lv_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spa_edgeblend")
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_cin_edgeblend")
				end
			end
		end
		if config.penthouseWallArt then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_prop_vw_wallart_47a")
				end
			end
		end
		if config.penthouseSafeDoorOfficeL then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_prop_vw_safedoor_office2a_l")
				end
			end
		end
		if config.penthouseSafeDoorOfficeR then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_prop_vw_safedoor_office2a_r")
				end
			end
		end
		if config.penthouseGunCase1 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "prop_box_guncase_01a")
				end
			end
		end
		if config.penthouseGunCase2 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "prop_box_guncase_02a")
				end
			end
		end
		if config.penthouseSpaWater1 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spa_water_01")
				end
			end
		end
		if config.penthouseSpaWater2 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spa_water_02")
				end
			end
		end
		if config.penthouseSpaWater3 then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_spa_water_03")
				end
			end
		end
		if config.penthouseSigns then
			if config.penthouse then
				if config.diamondCasinoAndResort then
					ActivateInteriorEntitySet(config.casinoPenthouseId, "vw_vwint02_pent_signs")
				end
			end
		end
		-- Arena Wars
		if config.crowdA then
			if config.arenaWars then
				ActivateInteriorEntitySet(config.arenaWarsId, "Set_Crowd_A")
			end
		end
		if config.crowdB then
			if config.arenaWars then
				ActivateInteriorEntitySet(config.arenaWarsId, "Set_Crowd_B")
			end
		end
		if config.crowdC then
			if config.arenaWars then
				ActivateInteriorEntitySet(config.arenaWarsId, "Set_Crowd_C")
			end
		end
		if config.crowdD then
			if config.arenaWars then
				ActivateInteriorEntitySet(config.arenaWarsId, "Set_Crowd_D")
			end
		end
		if config.dystopianScene then
			if config.arenaWars then
				ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_Scene")
				if config.dystopianScene1 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_01")
				elseif config.dystopianScene2 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_02")
			    elseif config.dystopianScene3 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_03")
				elseif config.dystopianScene4 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_04")
				elseif config.dystopianScene5 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_05")
				elseif config.dystopianScene6 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_06")
				elseif config.dystopianScene7 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_07")
				elseif config.dystopianScene8 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_08")
				elseif config.dystopianScene9 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_09")
				elseif config.dystopianScene10 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_10")
				elseif config.dystopianScene11 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_11")
				elseif config.dystopianScene12 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_12")
				elseif config.dystopianScene13 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_13")
				elseif config.dystopianScene14 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_14")
				elseif config.dystopianScene15 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_15")
				elseif config.dystopianScene16 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_16")
				elseif config.dystopianScene17 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Dystopian_17")
				end
			end
		end
		if config.scifiScene then
			if config.arenaWars then
				ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_Scene")
				if config.scifiScene1 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_01")
				elseif config.scifiScene2 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_02")
				elseif config.scifiScene3 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_03")
				elseif config.scifiScene4 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_04")
				elseif config.scifiScene5 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_05")
				elseif config.scifiScene6 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_06")
				elseif config.scifiScene7 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_07")
				elseif config.scifiScene8 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_08")
				elseif config.scifiScene9 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_09")
				elseif config.scifiScene10 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Scifi_10")
				end
			end
		end
		if config.wastelandScene then
			if config.arenaWars then
				ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_Scene")
				if config.wastelandScene1 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_01")
				elseif config.wastelandScene2 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_02")
				elseif config.wastelandScene3 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_03")
				elseif config.wastelandScene4 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_04")
				elseif config.wastelandScene5 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_05")
				elseif config.wastelandScene6 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_06")
				elseif config.wastelandScene7 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_07")
				elseif config.wastelandScene8 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_08")
				elseif config.wastelandScene9 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_09")
				elseif config.wastelandScene10 then
					ActivateInteriorEntitySet(config.arenaWarsId, "Set_Wasteland_10")
				end
			end
		end
		if config.clubNameGalaxy then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_01")
			end
		elseif config.clubNameStudioLosSantos then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_02")
			end
		elseif config.clubNameOmega then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_03")
			end
		elseif config.clubNameTechnoLogie then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_04")
			end
		elseif config.clubNameGefangnis then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_05")
			end
		elseif config.clubNameMaisonette then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_06")
			end
		elseif config.clubNameTonysFunHouse then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_07")
			end
		elseif config.clubNameThePalace then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_08")
			end
		elseif config.clubNameParadise then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_clubname_09")
			end
			end
		if config.nightClubStyle1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_Style01")
			end
		elseif config.nightClubStyle2 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_Style02")
			end
		elseif config.nightClubStyle3 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_Style03")
			end
		end
		if config.nightClubPodium1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_style01_podium")
			end
		elseif config.nightClubPodium2 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_style02_podium")
			end
		elseif config.nightClubPodium3 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_style03_podium")
			end
		end
		if config.nightClubSetup then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_equipment_setup")
			end
		elseif config.nightClubSetupUpgrade then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_equipment_upgrade")
			end
		end
		if config.nightClubSecurityUpgrade then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_security_upgrade")
			end
		end
		if config.nightClubsDjBooth1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_dj01")
			end
		elseif config.nightClubsDjBooth2 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_dj02")
			end
		elseif config.nightClubsDjBooth3 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_dj03")
			end
		elseif config.nightClubsDjBooth4 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_dj04")
			end
		end
		if config.nightClubsLightsOne1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_01_Lights_01")
			end
		end
		if config.nightClubsLightsOne2 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_02_Lights_01")
			end
		end
		if config.nightClubsLightsOne3 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_03_Lights_01")
			end
		end
		if config.nightClubsLightsOne4 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_04_Lights_01")
			end
		end
		if config.nightClubsLightsTwo1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_01_Lights_02")
			end
		end
		if config.nightClubsLightsTwo1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_02_Lights_02")
			end
		end
		if config.nightClubsLightsTwo3 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_03_Lights_02")
			end
		end
		if config.nightClubsLightsTwo4 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_04_Lights_02")
			end
		end
		if config.nightClubsLightsThree1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_01_Lights_03")
			end
		end
		if config.nightClubsLightsThree2 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_02_Lights_03")
			end
		end
		if config.nightClubsLightsThree3 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_03_Lights_03")
			end
		end
		if config.nightClubsLightsThree4 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_04_Lights_03")
			end
		end
		if config.nightClubsLightsFour1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_01_Lights_04")
			end
		end
		if config.nightClubsLightsFour2 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_02_Lights_04")
			end
		end
		if config.nightClubsLightsFour3 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_03_Lights_04")
			end
		end
		if config.nightClubsLightsFour4 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "DJ_04_Lights_04")
			end
		end
		if config.nightClubsBarContent then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_bar_content")
				if config.nightClubBooze1 then
					ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_booze_01")
				end
				if config.nightClubBooze2 then
					ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_booze_02")
				end
				if config.nightClubBooze3 then
					ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_booze_03")
				end
			end
		end
		if config.nightClubTrophy1 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy01")
			end
		end
		if config.nightClubTrophy2 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy02")
			end
		end
		if config.nightClubTrophy3 then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy03")
			end
		end
		if config.nightClubOfficeChest then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy04")
			end
		end
		if config.nightClubOfficeAmmoBoxes then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy05")
			end
		end
		if config.nightClubOfficeMeth then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy07")
			end
		end
		if config.nightClubOfficeFakeIds then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy08")
			end
		end
		if config.nightClubOfficeWeed then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy09")
			end
		end
		if config.nightClubOfficeCoke then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy10")
			end
		end
		if config.nightClubOfficeCash then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trophy11")
			end
		end
		if config.nightClubsOfficeClutter then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_Clutter")
			end
		end
		if config.nightClubsWorkLamps then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_Worklamps")
			end
		end
		if config.nightClubsDeliveryTruck then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_deliverytruck")
			end
		end
		if config.nightClubsDryIce then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_dry_ice")
			end
		end
		if config.nightClubsRigsOff then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "light_rigs_off")
			end
		end
		if config.nightClubsLightGrid then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_lightgrid_01")
			end
		end
		if config.nightClubsTradLights then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "Int01_ba_trad_lights")
			end
		end
		if config.nightClubsForSale then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "ba_caseX_forsale")
			end
		end
		if config.nightClubsDixon then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "ba_caseX_dixon")
			end
		end
		if config.nightClubsMadonna then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "ba_caseX_madonna")
			end
		end
		if config.nightClubsSolomun then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "ba_caseX_solomun")
			end
		end
		if config.nightClubsTaleOfUs then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "ba_caseX_taleofus")
			end
		end
		if config.nightClubsBarriers then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "ba_barriers_caseX")
			end
		end
		if config.nightClubsSmokeMachine then
			if config.nightClubs then
				ActivateInteriorEntitySet(config.nightClubsId, "scr_ba_club")
				UseParticleFxAsset("scr_ba_club")
				StartParticleFxLoopedAtCoord("scr_ba_club_smoke_machine", -1602.932, -3019.1, -79.99, 0.0, -10.0, 66.0, config.nightClubsDryIceScale, false, false, false, true)
				StartParticleFxLoopedAtCoord("scr_ba_club_smoke_machine", -1593.238, -3017.05, -79.99, 0.0, -10.0, 110.0, config.nightClubsDryIceScale, false, false, false, true)
				StartParticleFxLoopedAtCoord("scr_ba_club_smoke_machine", -1597.134, -3008.2, -79.99, 0.0, -10.0, -122.53, config.nightClubsDryIceScale, false, false, false, true)
				StartParticleFxLoopedAtCoord("scr_ba_club_smoke_machine", -1589.966, -3008.518, -79.99, 0.0, -10.0, -166.97, config.nightClubsDryIceScale, false, false, false, true)
			end
		end
		break
	end	
end)



exports('EnableIpl', function(ipl, activate)
    EnableIpl(ipl, activate)
end)

exports('GetPedheadshotTexture', function(ped)
    return GetPedheadshotTexture(ped)
end)

-- Load or remove IPL(s)
function EnableIpl(ipl, activate)
    if IsTable(ipl) then
        for key, value in pairs(ipl) do
            EnableIpl(value, activate)
        end
    else
        if activate then
            if not IsIplActive(ipl) then RequestIpl(ipl) end
        else
            if IsIplActive(ipl) then RemoveIpl(ipl) end
        end
    end
end

exports('GetImportCEOGarage3Object', function()
	return ImportCEOGarage3
end)

ImportCEOGarage3 = {
    Part = {
        Garage1 = {interiorId = 255489, ipl = "imp_sm_13_cargarage_a"},  -- -1581.1120, -567.2450, 85.5000
        Garage2 = {interiorId = 255745, ipl = "imp_sm_13_cargarage_b"},  -- -1568.7390, -562.0455, 85.5000
        Garage3 = {interiorId = 256001, ipl = "imp_sm_13_cargarage_c"},  -- -1563.5570, -574.4314, 85.5000
        ModShop = {interiorId = 256257, ipl = "imp_sm_13_modgarage"},    -- -1578.0230, -576.4251, 104.2000

        Load = function(part) EnableIpl(part.ipl, true) end,
        Remove = function(part) EnableIpl(part.ipl, false) end,
        Clear = function() EnableIpl({ImportCEOGarage3.Part.Garage1.ipl, ImportCEOGarage3.Part.Garage2.ipl, ImportCEOGarage3.Part.Garage3.ipl}, false) end,
    },
    Style = {
        concrete = "garage_decor_01", plain = "garage_decor_02", marble = "garage_decor_03", wooden = "garage_decor_04",
        Set = function(part, style, refresh)
            ImportCEOGarage3.Style.Clear(part)
            SetIplPropState(part.interiorId, style, true, refresh)
        end,
        Clear = function(part)
            SetIplPropState(part.interiorId, {ImportCEOGarage3.Style.concrete, ImportCEOGarage3.Style.plain, ImportCEOGarage3.Style.marble, ImportCEOGarage3.Style.wooden}, false, true)
        end
    },
    Numbering = {
        none = "",
        Level1 = {
            style1 = "numbering_style01_n1", style2 = "numbering_style02_n1", style3 = "numbering_style03_n1",
            style4 = "numbering_style04_n1", style5 = "numbering_style05_n1", style6 = "numbering_style06_n1",
            style7 = "numbering_style07_n1", style8 = "numbering_style08_n1", style9 = "numbering_style09_n1",
        },
        Level2 = {
            style1 = "numbering_style01_n2", style2 = "numbering_style02_n2", style3 = "numbering_style03_n2",
            style4 = "numbering_style04_n2", style5 = "numbering_style05_n2", style6 = "numbering_style06_n2",
            style7 = "numbering_style07_n2", style8 = "numbering_style08_n2", style9 = "numbering_style09_n2",
        },
        Level3 = {
            style1 = "numbering_style01_n3", style2 = "numbering_style02_n3", style3 = "numbering_style03_n3",
            style4 = "numbering_style04_n3", style5 = "numbering_style05_n3", style6 = "numbering_style06_n3",
            style7 = "numbering_style07_n3", style8 = "numbering_style08_n3", style9 = "numbering_style09_n3",
        },
        Set = function(part, num, refresh)
            ImportCEOGarage3.Numbering.Clear(part)
            if (num ~= nil) then
                SetIplPropState(part.interiorId, num, true, refresh)
            else
                if (refresh) then RefreshInterior(part.interiorId) end
            end
        end,
        Clear = function(part)
            SetIplPropState(part.interiorId, {ImportCEOGarage3.Numbering.Level1, ImportCEOGarage3.Numbering.Level2, ImportCEOGarage3.Numbering.Level3}, false, true)
        end
    },
    Lighting = {
        none = "",
        style1 = "lighting_option01", style2 = "lighting_option02", style3 = "lighting_option03",
        style4 = "lighting_option04", style5 = "lighting_option05", style6 = "lighting_option06",
        style7 = "lighting_option07", style8 = "lighting_option08", style9 = "lighting_option09",

        Set = function(part, light, refresh)
            ImportCEOGarage3.Lighting.Clear(part)
            if (light ~= nil) then
                SetIplPropState(part.interiorId, light, true, refresh)
            else
                if (refresh) then RefreshInterior(part.interiorId) end
            end
        end,
        Clear = function(part)
            SetIplPropState(part.interiorId, {
                ImportCEOGarage3.Lighting.style1, ImportCEOGarage3.Lighting.style2, ImportCEOGarage3.Lighting.style3,
                ImportCEOGarage3.Lighting.style4, ImportCEOGarage3.Lighting.style5, ImportCEOGarage3.Lighting.style6,
                ImportCEOGarage3.Lighting.style7, ImportCEOGarage3.Lighting.style8, ImportCEOGarage3.Lighting.style9
            }, false, true)
        end
    },
    ModShop = {
        Floor = {
            default = "",
            city = "floor_vinyl_01", seabed = "floor_vinyl_02", aliens = "floor_vinyl_03",
            clouds = "floor_vinyl_04", money = "floor_vinyl_05", zebra = "floor_vinyl_06",
            blackWhite = "floor_vinyl_07", barcode = "floor_vinyl_08", paintbrushBW = "floor_vinyl_09",
            grid = "floor_vinyl_10", splashes = "floor_vinyl_11", squares = "floor_vinyl_12",
            mosaic = "floor_vinyl_13", paintbrushColor = "floor_vinyl_14", curvesColor = "floor_vinyl_15",
            marbleBrown = "floor_vinyl_16", marbleBlue = "floor_vinyl_17", marbleBW = "floor_vinyl_18",
            maze = "floor_vinyl_19",

            Set = function(floor, refresh)
                ImportCEOGarage3.ModShop.Floor.Clear()
                if (floor ~= nil) then
                    SetIplPropState(ImportCEOGarage3.Part.ModShop.interiorId, floor, true, refresh)
                else
                    if (refresh) then RefreshInterior(ImportCEOGarage3.Part.ModShop.interiorId) end
                end
            end,
            Clear = function()
                SetIplPropState(ImportCEOGarage3.Part.ModShop.interiorId, {
                    ImportCEOGarage3.ModShop.Floor.city, ImportCEOGarage3.ModShop.Floor.seabed, ImportCEOGarage3.ModShop.Floor.aliens,
                    ImportCEOGarage3.ModShop.Floor.clouds, ImportCEOGarage3.ModShop.Floor.money, ImportCEOGarage3.ModShop.Floor.zebra,
                    ImportCEOGarage3.ModShop.Floor.blackWhite, ImportCEOGarage3.ModShop.Floor.barcode, ImportCEOGarage3.ModShop.Floor.paintbrushBW,
                    ImportCEOGarage3.ModShop.Floor.grid, ImportCEOGarage3.ModShop.Floor.splashes, ImportCEOGarage3.ModShop.Floor.squares,
                    ImportCEOGarage3.ModShop.Floor.mosaic, ImportCEOGarage3.ModShop.Floor.paintbrushColor, ImportCEOGarage3.ModShop.Floor.curvesColor,
                    ImportCEOGarage3.ModShop.Floor.marbleBrown, ImportCEOGarage3.ModShop.Floor.marbleBlue, ImportCEOGarage3.ModShop.Floor.marbleBW,
                    ImportCEOGarage3.ModShop.Floor.maze
                }, false, true)
            end
        }
    },

    LoadDefault = function()
        ImportCEOGarage3.Part.Load(ImportCEOGarage3.Part.Garage1)
        ImportCEOGarage3.Style.Set(ImportCEOGarage3.Part.Garage1, ImportCEOGarage3.Style.concrete, false)
        ImportCEOGarage3.Numbering.Set(ImportCEOGarage3.Part.Garage1, ImportCEOGarage3.Numbering.Level1.style1, false)
        ImportCEOGarage3.Lighting.Set(ImportCEOGarage3.Part.Garage1, ImportCEOGarage3.Lighting.style1, false)
        
        -- No mod shop since it overlapses CEO office
        ImportCEOGarage3.Part.Remove(ImportCEOGarage3.Part.ModShop)
    end
}

ImportCEOGarage4 = {
    Part = {
        Garage1 = {interiorId = 256513, ipl = "imp_sm_15_cargarage_a"},  -- -1388.8400, -478.7402, 56.1000
        Garage2 = {interiorId = 256769, ipl = "imp_sm_15_cargarage_b"},  -- -1388.8600, -478.7574, 48.1000
        Garage3 = {interiorId = 257025, ipl = "imp_sm_15_cargarage_c"},  -- -1374.6820, -474.3586, 56.1000
        ModShop = {interiorId = 257281, ipl = "imp_sm_15_modgarage"},    -- -1391.2450, -473.9638, 77.2000

        Load = function(part) EnableIpl(part.ipl, true) end,
        Remove = function(part) EnableIpl(part.ipl, false) end,
        Clear = function() EnableIpl({ImportCEOGarage4.Part.Garage1.ipl, ImportCEOGarage4.Part.Garage2.ipl, ImportCEOGarage4.Part.Garage3.ipl}, false) end,
    },
    Style = {
        concrete = "garage_decor_01", plain = "garage_decor_02", marble = "garage_decor_03", wooden = "garage_decor_04",
        Set = function(part, style, refresh)
            ImportCEOGarage4.Style.Clear(part)
            SetIplPropState(part.interiorId, style, true, refresh)
        end,
        Clear = function(part)
            SetIplPropState(part.interiorId, {ImportCEOGarage4.Style.concrete, ImportCEOGarage4.Style.plain, ImportCEOGarage4.Style.marble, ImportCEOGarage4.Style.wooden}, false, true)
        end
    },
    Numbering = {
        none = "",
        Level1 = {
            style1 = "numbering_style01_n1", style2 = "numbering_style02_n1", style3 = "numbering_style03_n1",
            style4 = "numbering_style04_n1", style5 = "numbering_style05_n1", style6 = "numbering_style06_n1",
            style7 = "numbering_style07_n1", style8 = "numbering_style08_n1", style9 = "numbering_style09_n1",
        },
        Level2 = {
            style1 = "numbering_style01_n2", style2 = "numbering_style02_n2", style3 = "numbering_style03_n2",
            style4 = "numbering_style04_n2", style5 = "numbering_style05_n2", style6 = "numbering_style06_n2",
            style7 = "numbering_style07_n2", style8 = "numbering_style08_n2", style9 = "numbering_style09_n2",
        },
        Level3 = {
            style1 = "numbering_style01_n3", style2 = "numbering_style02_n3", style3 = "numbering_style03_n3",
            style4 = "numbering_style04_n3", style5 = "numbering_style05_n3", style6 = "numbering_style06_n3",
            style7 = "numbering_style07_n3", style8 = "numbering_style08_n3", style9 = "numbering_style09_n3",
        },
        Set = function(part, num, refresh)
            ImportCEOGarage4.Numbering.Clear(part)
            if (num ~= nil) then
                SetIplPropState(part.interiorId, num, true, refresh)
            else
                if (refresh) then RefreshInterior(part.interiorId) end
            end
        end,
        Clear = function(part)
            SetIplPropState(part.interiorId, {ImportCEOGarage4.Numbering.Level1, ImportCEOGarage4.Numbering.Level2, ImportCEOGarage4.Numbering.Level3}, false, true)
        end
    },
    Lighting = {
        none = "",
        style1 = "lighting_option01", style2 = "lighting_option02", style3 = "lighting_option03",
        style4 = "lighting_option04", style5 = "lighting_option05", style6 = "lighting_option06",
        style7 = "lighting_option07", style8 = "lighting_option08", style9 = "lighting_option09",

        Set = function(part, light, refresh)
            ImportCEOGarage4.Lighting.Clear(part)
            if (light ~= nil) then
                SetIplPropState(part.interiorId, light, true, refresh)
            else
                if (refresh) then RefreshInterior(part.interiorId) end
            end
        end,
        Clear = function(part)
            SetIplPropState(part.interiorId, {
                ImportCEOGarage4.Lighting.style1, ImportCEOGarage4.Lighting.style2, ImportCEOGarage4.Lighting.style3,
                ImportCEOGarage4.Lighting.style4, ImportCEOGarage4.Lighting.style5, ImportCEOGarage4.Lighting.style6,
                ImportCEOGarage4.Lighting.style7, ImportCEOGarage4.Lighting.style8, ImportCEOGarage4.Lighting.style9
            }, false, true)
        end
    },
    ModShop = {
        Floor = {
            default = "",
            city = "floor_vinyl_01", seabed = "floor_vinyl_02", aliens = "floor_vinyl_03",
            clouds = "floor_vinyl_04", money = "floor_vinyl_05", zebra = "floor_vinyl_06",
            blackWhite = "floor_vinyl_07", barcode = "floor_vinyl_08", paintbrushBW = "floor_vinyl_09",
            grid = "floor_vinyl_10", splashes = "floor_vinyl_11", squares = "floor_vinyl_12",
            mosaic = "floor_vinyl_13", paintbrushColor = "floor_vinyl_14", curvesColor = "floor_vinyl_15",
            marbleBrown = "floor_vinyl_16", marbleBlue = "floor_vinyl_17", marbleBW = "floor_vinyl_18",
            maze = "floor_vinyl_19",

            Set = function(floor, refresh)
                ImportCEOGarage4.ModShop.Floor.Clear()
                if (floor ~= nil) then
                    SetIplPropState(ImportCEOGarage4.Part.ModShop.interiorId, floor, true, refresh)
                else
                    if (refresh) then RefreshInterior(ImportCEOGarage4.Part.ModShop.interiorId) end
                end
            end,
            Clear = function()
                SetIplPropState(ImportCEOGarage4.Part.ModShop.interiorId, {
                    ImportCEOGarage4.ModShop.Floor.city, ImportCEOGarage4.ModShop.Floor.seabed, ImportCEOGarage4.ModShop.Floor.aliens,
                    ImportCEOGarage4.ModShop.Floor.clouds, ImportCEOGarage4.ModShop.Floor.money, ImportCEOGarage4.ModShop.Floor.zebra,
                    ImportCEOGarage4.ModShop.Floor.blackWhite, ImportCEOGarage4.ModShop.Floor.barcode, ImportCEOGarage4.ModShop.Floor.paintbrushBW,
                    ImportCEOGarage4.ModShop.Floor.grid, ImportCEOGarage4.ModShop.Floor.splashes, ImportCEOGarage4.ModShop.Floor.squares,
                    ImportCEOGarage4.ModShop.Floor.mosaic, ImportCEOGarage4.ModShop.Floor.paintbrushColor, ImportCEOGarage4.ModShop.Floor.curvesColor,
                    ImportCEOGarage4.ModShop.Floor.marbleBrown, ImportCEOGarage4.ModShop.Floor.marbleBlue, ImportCEOGarage4.ModShop.Floor.marbleBW,
                    ImportCEOGarage4.ModShop.Floor.maze
                }, false, true)
            end
        }
    },

    LoadDefault = function()
        ImportCEOGarage4.Part.Load(ImportCEOGarage4.Part.Garage2)

        ImportCEOGarage4.Style.Set(ImportCEOGarage4.Part.Garage2, ImportCEOGarage4.Style.concrete, false)
        ImportCEOGarage4.Numbering.Set(ImportCEOGarage4.Part.Garage2, ImportCEOGarage4.Numbering.Level1.style1, false)
        ImportCEOGarage4.Lighting.Set(ImportCEOGarage4.Part.Garage2, ImportCEOGarage4.Lighting.style1, false)
        
        ImportCEOGarage4.Part.Load(ImportCEOGarage4.Part.ModShop)
        ImportCEOGarage4.ModShop.Floor.Set(ImportCEOGarage4.ModShop.Floor.default, false)
    end
}


-- SmugglerHangar: -1267.0 -3013.135 -49.5

exports('GetSmugglerHangarObject', function()
    return SmugglerHangar
end)

SmugglerHangar = {
    interiorId = 260353,
    Ipl = {
        Interior = {
            ipl = "sm_smugdlc_interior_placement_interior_0_smugdlc_int_01_milo_",
            Load = function() EnableIpl(SmugglerHangar.Ipl.Interior.ipl, true) end,
            Remove = function() EnableIpl(SmugglerHangar.Ipl.Interior.ipl, false) end
        },
    },
    Colors = {
        colorSet1 = 1, -- sable, red, gray
        colorSet2 = 2, -- white, blue, gray
        colorSet3 = 3, -- gray, orange, blue
        colorSet4 = 4, -- gray, blue, orange
        colorSet5 = 5, -- gray, light gray, red
        colorSet6 = 6, -- yellow, gray, light gray
        colorSet7 = 7, -- light Black and white
        colorSet8 = 8, -- dark Black and white
        colorSet9 = 9  -- sable and gray
    },
    Walls = {
        default = "set_tint_shell",
        SetColor = function(color, refresh)
            SetIplPropState(SmugglerHangar.interiorId, SmugglerHangar.Walls.default, true, refresh)
            SetInteriorPropColor(SmugglerHangar.interiorId, SmugglerHangar.Walls.default, color)
        end,
    },
    Floor = {
        Style = {
            raw = "set_floor_1", plain = "set_floor_2",
            Set = function(floor, refresh)
                SmugglerHangar.Floor.Style.Clear(false)
                SetIplPropState(SmugglerHangar.interiorId, floor, true, refresh)
            end,
            Clear = function(refresh)
                SetIplPropState(SmugglerHangar.interiorId, {SmugglerHangar.Floor.Style.raw, SmugglerHangar.Floor.Style.plain}, false, refresh)
            end
        },
        Decals = {
            decal1 = "set_floor_decal_1", decal2 = "set_floor_decal_2", decal4 = "set_floor_decal_3", decal3 = "set_floor_decal_4",
            decal5 = "set_floor_decal_5", decal6 = "set_floor_decal_6", decal7 = "set_floor_decal_7", decal8 = "set_floor_decal_8",
            decal9 = "set_floor_decal_9",
            Set = function(decal, color, refresh)
                if color == nil then color = 1 end
                SmugglerHangar.Floor.Decals.Clear(false)
                SetIplPropState(SmugglerHangar.interiorId, decal, true, refresh)
                SetInteriorPropColor(SmugglerHangar.interiorId, decal, color)
            end,
            Clear = function(refresh)
                SetIplPropState(SmugglerHangar.interiorId, {SmugglerHangar.Floor.Decals.decal1, SmugglerHangar.Floor.Decals.decal2, SmugglerHangar.Floor.Decals.decal3,
                SmugglerHangar.Floor.Decals.decal4, SmugglerHangar.Floor.Decals.decal5, SmugglerHangar.Floor.Decals.decal6, SmugglerHangar.Floor.Decals.decal7,
                SmugglerHangar.Floor.Decals.decal8, SmugglerHangar.Floor.Decals.decal9}, false, refresh)
            end
        }
    },
    Cranes = {
        on = "set_crane_tint", off = "",
        Set = function(crane, color, refresh)
            SmugglerHangar.Cranes.Clear()
            if crane ~= "" then
                SetIplPropState(SmugglerHangar.interiorId, crane, true, refresh)
                SetInteriorPropColor(SmugglerHangar.interiorId, crane, color)
            else
                if (refresh) then RefreshInterior(SmugglerHangar.interiorId) end
            end
        end,
        Clear = function(refresh)
            SetIplPropState(SmugglerHangar.interiorId, SmugglerHangar.Cranes.default, false, refresh)
        end
    },
    ModArea = {
        on = "set_modarea", off = "",
        Set = function(mod, color, refresh)
            if color == nil then color = 1 end
            SmugglerHangar.ModArea.Clear(false)
            if mod ~= "" then 
                SetIplPropState(SmugglerHangar.interiorId, mod, true, refresh)
                SetInteriorPropColor(SmugglerHangar.interiorId, mod, color)
            else
                if (refresh) then RefreshInterior(SmugglerHangar.interiorId) end
            end
        end,
        Clear = function(refresh)
            SetIplPropState(SmugglerHangar.interiorId, SmugglerHangar.ModArea.mod, false, refresh)
        end	
    },
    Office = {
        basic = "set_office_basic", modern = "set_office_modern", traditional = "set_office_traditional",
        Set = function(office, refresh)
            SmugglerHangar.Office.Clear(false)
            SetIplPropState(SmugglerHangar.interiorId, office, true, refresh)
        end,
        Clear = function(refresh)
            SetIplPropState(SmugglerHangar.interiorId, {SmugglerHangar.Office.basic, SmugglerHangar.Office.modern, SmugglerHangar.Office.traditional}, false, refresh)
        end	
    },
    Bedroom = {
        Style = {
            none = "", modern = {"set_bedroom_modern", "set_bedroom_tint"}, traditional = {"set_bedroom_traditional", "set_bedroom_tint"},
            Set = function(bed, color, refresh)
                if color == nil then color = 1 end
                SmugglerHangar.Bedroom.Style.Clear(false)
                if bed ~= "" then
                    SetIplPropState(SmugglerHangar.interiorId, bed, true, refresh)
                    SetInteriorPropColor(SmugglerHangar.interiorId, "set_bedroom_tint", color)
                else
                    if (refresh) then RefreshInterior(SmugglerHangar.interiorId) end
                end
            end,
            Clear = function(refresh)
                SetIplPropState(SmugglerHangar.interiorId, {SmugglerHangar.Bedroom.Style.modern, SmugglerHangar.Bedroom.Style.traditional}, false, refresh)
            end	
        },
        Blinds = {
            none = "", opened = "set_bedroom_blinds_open", closed = "set_bedroom_blinds_closed",
            Set = function(blinds, refresh)
                SmugglerHangar.Bedroom.Blinds.Clear(false)
                if blinds ~= "" then
                    SetIplPropState(SmugglerHangar.interiorId, blinds, true, refresh)
                else
                    if (refresh) then RefreshInterior(SmugglerHangar.interiorId) end
                end
            end,
            Clear = function(refresh)
                SetIplPropState(SmugglerHangar.interiorId, {SmugglerHangar.Bedroom.Blinds.opened, SmugglerHangar.Bedroom.Blinds.closed}, false, refresh)
            end	
        }
    },
    Lighting = {
        FakeLights = {
            none = "", yellow = 2, blue = 1, white = 0,
            Set = function(light, refresh)
                SmugglerHangar.Lighting.FakeLights.Clear(false)
                if light ~= "" then
                    SetIplPropState(SmugglerHangar.interiorId, "set_lighting_tint_props", true, refresh)
                    SetInteriorPropColor(SmugglerHangar.interiorId, "set_lighting_tint_props", light)
                else
                    if (refresh) then RefreshInterior(SmugglerHangar.interiorId) end
                end
            end,
            Clear = function(refresh)
                SetIplPropState(SmugglerHangar.interiorId, "set_lighting_tint_props", false, refresh)
            end	
        },
        Ceiling = {
            none = "", yellow = "set_lighting_hangar_a", blue = "set_lighting_hangar_b", white = "set_lighting_hangar_c",
            Set = function(light, refresh)
                SmugglerHangar.Lighting.Ceiling.Clear(false)
                if light ~= "" then
                    SetIplPropState(SmugglerHangar.interiorId, light, true, refresh)
                else
                    if (refresh) then RefreshInterior(SmugglerHangar.interiorId) end
                end
            end,
            Clear = function(refresh)
                SetIplPropState(SmugglerHangar.interiorId, {SmugglerHangar.Lighting.Ceiling.yellow, SmugglerHangar.Lighting.Ceiling.blue, SmugglerHangar.Lighting.Ceiling.white}, false, refresh)
            end	
        },
        Walls = {
            none = "", neutral = "set_lighting_wall_neutral", blue = "set_lighting_wall_tint01", orange = "set_lighting_wall_tint02",
            lightYellow = "set_lighting_wall_tint03", lightYellow2 = "set_lighting_wall_tint04", dimmed = "set_lighting_wall_tint05",
            strongYellow = "set_lighting_wall_tint06", white = "set_lighting_wall_tint07", lightGreen = "set_lighting_wall_tint08",
            yellow = "set_lighting_wall_tint09",
            Set = function(light, refresh)
                SmugglerHangar.Lighting.Walls.Clear(false)
                if light ~= "" then
                    SetIplPropState(SmugglerHangar.interiorId, light, true, refresh)
                else
                    if (refresh) then RefreshInterior(SmugglerHangar.interiorId) end
                end
            end,
            Clear = function(refresh)
                SetIplPropState(SmugglerHangar.interiorId, {SmugglerHangar.Lighting.Walls.neutral, SmugglerHangar.Lighting.Walls.blue, SmugglerHangar.Lighting.Walls.orange,
                    SmugglerHangar.Lighting.Walls.lightYellow, SmugglerHangar.Lighting.Walls.lightYellow2, SmugglerHangar.Lighting.Walls.dimmed,
                    SmugglerHangar.Lighting.Walls.strongYellow, SmugglerHangar.Lighting.Walls.white, SmugglerHangar.Lighting.Walls.lightGreen,
                    SmugglerHangar.Lighting.Walls.yellow}, false, refresh)
            end	
        }
    },
    Details = {
        bedroomClutter = "set_bedroom_clutter",
        Enable = function (details, state, refresh)
            SetIplPropState(SmugglerHangar.interiorId, details, state, refresh)
        end
    },

    LoadDefault = function()
        SmugglerHangar.Ipl.Interior.Load()
        
        SmugglerHangar.Walls.SetColor(SmugglerHangar.Colors.colorSet5)
        SmugglerHangar.Cranes.Set(SmugglerHangar.Cranes.off, SmugglerHangar.Colors.colorSet1)
        SmugglerHangar.Floor.Style.Set(SmugglerHangar.Floor.Style.plain)
        SmugglerHangar.Floor.Decals.Set(SmugglerHangar.Floor.Decals.decal1, SmugglerHangar.Colors.colorSet8)

        SmugglerHangar.Lighting.Ceiling.Set(SmugglerHangar.Lighting.Ceiling.white)
        SmugglerHangar.Lighting.Walls.Set(SmugglerHangar.Lighting.Walls.neutral)
        SmugglerHangar.Lighting.FakeLights.Set(SmugglerHangar.Lighting.FakeLights.white)

        SmugglerHangar.ModArea.Set(SmugglerHangar.ModArea.on, SmugglerHangar.Colors.colorSet5)

        SmugglerHangar.Office.Set(SmugglerHangar.Office.modern)

        SmugglerHangar.Bedroom.Style.Set(SmugglerHangar.Bedroom.Style.modern, SmugglerHangar.Colors.colorSet5)
        SmugglerHangar.Bedroom.Blinds.Set(SmugglerHangar.Bedroom.Blinds.closed)

        SmugglerHangar.Details.Enable(SmugglerHangar.Details.bedroomClutter, false)

        RefreshInterior(SmugglerHangar.interiorId)
    end
}

exports('GetDiamondCasinoObject', function()
    return DiamondCasino
end)

DiamondCasino = {
    Ipl = {
        Building = {
            ipl = {
                "hei_dlc_windows_casino",
                "hei_dlc_casino_aircon",
                "vw_dlc_casino_door",
                "hei_dlc_casino_door"
            },
            Load = function() EnableIpl(DiamondCasino.Ipl.Building.ipl, true) end,
            Remove = function() EnableIpl(DiamondCasino.Ipl.Building.ipl, false) end
        },
        Main = {
            ipl = "vw_casino_main",
            Load = function() EnableIpl(DiamondCasino.Ipl.Main.ipl, true) end,
            Remove = function() EnableIpl(DiamondCasino.Ipl.Main.ipl, false) end
        },
        Garage = {
            ipl = "vw_casino_garage",
            Load = function() EnableIpl(DiamondCasino.Ipl.Garage.ipl, true) end,
            Remove = function() EnableIpl(DiamondCasino.Ipl.Garage.ipl, false) end
        },
        Carpark = {
            ipl = "vw_casino_carpark",
            Load = function() EnableIpl(DiamondCasino.Ipl.Carpark.ipl, true) end,
            Remove = function() EnableIpl(DiamondCasino.Ipl.Carpark.ipl, false) end
        }
    },

    LoadDefault = function()
        DiamondCasino.Ipl.Building.Load()
        DiamondCasino.Ipl.Main.Load()
        DiamondCasino.Ipl.Carpark.Load()
        DiamondCasino.Ipl.Garage.Load()
    end
} 


exports('GetDiamondPenthouseObject', function()
    return DiamondPenthouse
end)

DiamondPenthouse = {
    interiorId = 274689,

    Ipl = {
        Interior = {
            ipl = "vw_casino_penthouse",
            Load = function()
                EnableIpl(DiamondPenthouse.Ipl.Interior.ipl, true)
                SetIplPropState(DiamondPenthouse.interiorId, "Set_Pent_Tint_Shell", true, true)
            end,
            Remove = function() EnableIpl(DiamondPenthouse.Ipl.Interior.ipl, false) end
        }
    },
    Colors = {
        default = 0,
        sharp = 1,
        vibrant = 2,
        timeless = 3
    },
    Interior = {
        Walls = {
            SetColor = function(color, refresh)
                SetInteriorEntitySetColor(DiamondPenthouse.interiorId, "Set_Pent_Tint_Shell", color)
                if (refresh) then RefreshInterior(DiamondPenthouse.interiorId) end
            end
        },
        Pattern = {
            pattern01 = "Set_Pent_Pattern_01", pattern02 = "Set_Pent_Pattern_02", pattern03 = "Set_Pent_Pattern_03",
            pattern04 = "Set_Pent_Pattern_04", pattern05 = "Set_Pent_Pattern_05", pattern06 = "Set_Pent_Pattern_06",
            pattern07 = "Set_Pent_Pattern_07", pattern08 = "Set_Pent_Pattern_08", pattern09 = "Set_Pent_Pattern_09",
            Set = function(pattern, refresh)
                DiamondPenthouse.Interior.Pattern.Clear(false)
                SetIplPropState(DiamondPenthouse.interiorId, pattern, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.Pattern) do
                    if (type(value) == "string") then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        SpaBar = {
            open = "Set_Pent_Spa_Bar_Open", closed = "Set_Pent_Spa_Bar_Closed",
            Set = function(state, refresh)
                DiamondPenthouse.Interior.SpaBar.Clear(false)
                SetIplPropState(DiamondPenthouse.interiorId, state, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.SpaBar) do
                    if (type(value) == "string") then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        MediaBar = {
            open = "Set_Pent_Media_Bar_Open", closed = "Set_Pent_Media_Bar_Closed",
            Set = function(state, refresh)
                DiamondPenthouse.Interior.MediaBar.Clear(false)
                SetIplPropState(DiamondPenthouse.interiorId, state, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.MediaBar) do
                    if (type(value) == "string") then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        Dealer = {
            open = "Set_Pent_Dealer", closed = "Set_Pent_NoDealer",
            Set = function(state, refresh)
                DiamondPenthouse.Interior.Dealer.Clear(false)
                SetIplPropState(DiamondPenthouse.interiorId, state, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.Dealer) do
                    if (type(value) == "string") then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        Arcade = {
            none = "", retro = "Set_Pent_Arcade_Retro", modern = "Set_Pent_Arcade_Modern",
            Set = function(arcade, refresh)
                DiamondPenthouse.Interior.Arcade.Clear(false)
                SetIplPropState(DiamondPenthouse.interiorId, arcade, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.Arcade) do
                    if (type(value) == "string") then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        Clutter = {
            bar = "Set_Pent_Bar_Clutter", clutter01 = "Set_Pent_Clutter_01", clutter02 = "Set_Pent_Clutter_02", clutter03 = "Set_Pent_Clutter_03",
            Set = function(clutter, refresh)
                DiamondPenthouse.Interior.Clutter.Clear(false)
                SetIplPropState(DiamondPenthouse.interiorId, clutter, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.Clutter) do
                    if (type(value) == "string") then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        BarLight = {
            none = "", light0 = "set_pent_bar_light_0", light1 = "set_pent_bar_light_01", light2 = "set_pent_bar_light_02",
            Set = function(light, refresh)
                DiamondPenthouse.Interior.BarLight.Clear(false)
                SetIplPropState(DiamondPenthouse.interiorId, light, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.BarLight) do
                    if (type(value) == "string") then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        BarParty = {
            none = "", party0 = "set_pent_bar_party_0", party1 = "set_pent_bar_party_1", party2 = "set_pent_bar_party_2", partyafter = "set_pent_bar_party_after",
            Set = function(party, refresh)
                DiamondPenthouse.Interior.BarParty.Clear(false)
                SetIplPropState(DiamondPenthouse.interiorId, party, true, refresh)
            end,
            Clear = function(refresh)
                for key, value in pairs(DiamondPenthouse.Interior.BarParty) do
                    if (type(value) == "string") then
                        SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                    end
                end
            end
        },
        Blockers = {
            Guest = {
                enabled = "Set_Pent_GUEST_BLOCKER", disabled = "",
                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Guest.Clear(false)
                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Guest) do
                        if (type(value) == "string") then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Lounge = {
                enabled = "Set_Pent_LOUNGE_BLOCKER", disabled = "",
                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Lounge.Clear(false)
                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Lounge) do
                        if (type(value) == "string") then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Office = {
                enabled = "Set_Pent_OFFICE_BLOCKER", disabled = "",
                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Office.Clear(false)
                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Office) do
                        if (type(value) == "string") then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Cinema = {
                enabled = "Set_Pent_CINE_BLOCKER", disabled = "",
                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Cinema.Clear(false)
                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Cinema) do
                        if (type(value) == "string") then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Spa = {
                enabled = "Set_Pent_SPA_BLOCKER", disabled = "",
                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Spa.Clear(false)
                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Spa) do
                        if (type(value) == "string") then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            Bar = {
                enabled = "Set_Pent_BAR_BLOCKER", disabled = "",
                Set = function(blocker, refresh)
                    DiamondPenthouse.Interior.Blockers.Bar.Clear(false)
                    SetIplPropState(DiamondPenthouse.interiorId, blocker, true, refresh)
                end,
                Clear = function(refresh)
                    for key, value in pairs(DiamondPenthouse.Interior.Blockers.Bar) do
                        if (type(value) == "string") then
                            SetIplPropState(DiamondPenthouse.interiorId, value, false, refresh)
                        end
                    end
                end
            },
            EnableAllBlockers = function()
                DiamondPenthouse.Interior.Blockers.Bar.Set(DiamondPenthouse.Interior.Blockers.Bar.enabled)
                DiamondPenthouse.Interior.Blockers.Guest.Set(DiamondPenthouse.Interior.Blockers.Guest.enabled)
                DiamondPenthouse.Interior.Blockers.Spa.Set(DiamondPenthouse.Interior.Blockers.Spa.enabled)
                DiamondPenthouse.Interior.Blockers.Cinema.Set(DiamondPenthouse.Interior.Blockers.Cinema.enabled)
                DiamondPenthouse.Interior.Blockers.Lounge.Set(DiamondPenthouse.Interior.Blockers.Lounge.enabled)
                DiamondPenthouse.Interior.Blockers.Office.Set(DiamondPenthouse.Interior.Blockers.Office.enabled)
            end,
            DisableAllBlockers = function()
                DiamondPenthouse.Interior.Blockers.Bar.Set(DiamondPenthouse.Interior.Blockers.Bar.disabled)
                DiamondPenthouse.Interior.Blockers.Guest.Set(DiamondPenthouse.Interior.Blockers.Guest.disabled)
                DiamondPenthouse.Interior.Blockers.Spa.Set(DiamondPenthouse.Interior.Blockers.Spa.disabled)
                DiamondPenthouse.Interior.Blockers.Cinema.Set(DiamondPenthouse.Interior.Blockers.Cinema.disabled)
                DiamondPenthouse.Interior.Blockers.Lounge.Set(DiamondPenthouse.Interior.Blockers.Lounge.disabled)
                DiamondPenthouse.Interior.Blockers.Office.Set(DiamondPenthouse.Interior.Blockers.Office.disabled)
            end
        }
    },

    LoadDefault = function()
        DiamondPenthouse.Ipl.Interior.Load()
		DiamondPenthouse.Interior.Blockers.DisableAllBlockers() -- Invisible Blockers (Keep DISABLED!)

		DiamondPenthouse.Interior.Walls.SetColor(DiamondPenthouse.Colors.sharp)
		DiamondPenthouse.Interior.Pattern.Clear(DiamondPenthouse.Interior.Pattern.pattern09) -- Set/Clear
		DiamondPenthouse.Interior.Arcade.Set(DiamondPenthouse.Interior.Arcade.modern) -- `retro` OR `modern` arcade machines

        DiamondPenthouse.Interior.SpaBar.Set(DiamondPenthouse.Interior.SpaBar.open) -- Leave these open! (Spa)
        DiamondPenthouse.Interior.MediaBar.Set(DiamondPenthouse.Interior.MediaBar.open) -- Leave these open (Movie Theater)
        DiamondPenthouse.Interior.Dealer.Set(DiamondPenthouse.Interior.Dealer.open) -- Leave these open! (Yellow shutters near entrance)

		DiamondPenthouse.Interior.Clutter.Set(DiamondPenthouse.Interior.Clutter.bar) -- Inside room props thrown around
		 
		DiamondPenthouse.Interior.BarLight.Set(DiamondPenthouse.Interior.BarLight.light2) -- Bar lighting and props
		DiamondPenthouse.Interior.BarParty.Set(DiamondPenthouse.Interior.BarParty.none) -- Bar lighting and props

        RefreshInterior(DiamondPenthouse.interiorId)
    end
--[[
WALL PATTERNS
	pattern01 = "Set_Pent_Pattern_01" pattern02 = "Set_Pent_Pattern_02" pattern03 = "Set_Pent_Pattern_03"
    pattern04 = "Set_Pent_Pattern_04" pattern05 = "Set_Pent_Pattern_05" pattern06 = "Set_Pent_Pattern_06"
    pattern07 = "Set_Pent_Pattern_07" pattern08 = "Set_Pent_Pattern_08" pattern09 = "Set_Pent_Pattern_09"

	default = 0 - aids rainbow
    sharp = 1 - Salmon Pink details. White Walls
    vibrant = 2 - Neon Pink rugs/details, with blue and yellow accents. White Walls
    timeless = 3 - Navy Blue details with darker wood. Marine Blue acents. White Walls.
		
BarLight
	none = no lights
	light0 = orange
	light1 = pink
	light2 = blue

BarParty
	none = clean, green ceiling, plain wooden walls
	party0 = red,pink,black balls + blue/black wall effects
	party1 = black,yellow balls + rainbow wall effects
	party2 = white,blue,teal balls + blue/black wall effects
	partyafter = trashed with spills and shit in carpet

CLUTTER
	bar = no clutter
	clutter01 = diamond casino bags
	clutter02 = little bit of trash
	clutter03 = more trash everywhere

]]
}

exports('GetGunrunningBunkerObject', function()
    return GunrunningBunker
end)

GunrunningBunker = {
    interiorId = 258561,
    Ipl = {
        Interior = {
            ipl = "gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_",
            -- Load interiors IPLs.
            Load = function() EnableIpl(GunrunningBunker.Ipl.Interior.ipl, true) end,

            -- Remove interiors IPLs.
            Remove = function() EnableIpl(GunrunningBunker.Ipl.Interior.ipl, false) end
        },
    
        Exterior = {
            ipl = {
                "gr_case0_bunkerclosed",	-- Desert: 848.6175, 2996.567, 45.81612
                "gr_case1_bunkerclosed",	-- SmokeTree: 2126.785, 3335.04, 48.21422
                "gr_case2_bunkerclosed",	-- Scrapyard: 2493.654, 3140.399, 51.28789
                "gr_case3_bunkerclosed",	-- Oilfields: 481.0465, 2995.135, 43.96672
                "gr_case4_bunkerclosed",	-- RatonCanyon: -391.3216, 4363.728, 58.65862
                "gr_case5_bunkerclosed",	-- Grapeseed: 1823.961, 4708.14, 42.4991
                "gr_case6_bunkerclosed",	-- Farmhouse: 1570.372, 2254.549, 78.89397
                "gr_case7_bunkerclosed",	-- Paletto: -783.0755, 5934.686, 24.31475
                "gr_case9_bunkerclosed",	-- Route68: 24.43542, 2959.705, 58.35517
                "gr_case10_bunkerclosed",	-- Zancudo: -3058.714, 3329.19, 12.5844
                "gr_case11_bunkerclosed"	-- Great Ocean Highway: -3180.466, 1374.192, 19.9597
            },
            -- Load exteriors IPLs.
            Load = function() EnableIpl(GunrunningBunker.Ipl.Exterior.ipl, true) end,

            -- Remove exteriors IPLs.
            Remove = function() EnableIpl(GunrunningBunker.Ipl.Exterior.ipl, false) end
        }
    },

    Style = {
        default = "Bunker_Style_A", blue = "Bunker_Style_B", yellow = "Bunker_Style_C",

        -- Set the style (color) of the bunker.
        -- 	style: Wall color (values: GunrunningBunker.Style.default / GunrunningBunker.Style.blue / GunrunningBunker.Style.yellow)
        -- 	refresh: Reload the whole interior (values: true / false)
        Set = function(style, refresh)
            GunrunningBunker.Style.Clear(false)
            SetIplPropState(GunrunningBunker.interiorId, style, true, refresh)
        end,

        -- Removes the style.
        -- 	refresh: Reload the whole interior (values: true / false)
        Clear = function(refresh) SetIplPropState(GunrunningBunker.interiorId, {GunrunningBunker.Style.default, GunrunningBunker.Style.blue, GunrunningBunker.Style.yellow}, false, refresh) end
    },

    Tier = {
        default = "standard_bunker_set", upgrade = "upgrade_bunker_set",

        -- Set the tier (quality) of the bunker.
        -- 	tier: Upgrade state (values: GunrunningBunker.Tier.default / GunrunningBunker.Tier.upgrade)
        -- 	refresh: Reload the whole interior (values: true / false)
        Set = function(tier, refresh)
            GunrunningBunker.Tier.Clear(false)
            SetIplPropState(GunrunningBunker.interiorId, tier, true, refresh)
        end,

        -- Removes the tier.
        -- 	refresh: Reload the whole interior (values: true / false)
        Clear = function(refresh) SetIplPropState(GunrunningBunker.interiorId, {GunrunningBunker.Tier.default, GunrunningBunker.Tier.upgrade}, false, refresh) end
    },

    Security = {
        noEntryGate = "", default = "standard_security_set", upgrade = "security_upgrade",

        -- Set the security stage of the bunker.
        -- 	security: Upgrade state (values: GunrunningBunker.Security.default / GunrunningBunker.Security.upgrade)
        -- 	refresh: Reload the whole interior (values: true / false)
        Set = function(security, refresh)
            GunrunningBunker.Security.Clear(false)
            if (security ~= "") then
                SetIplPropState(GunrunningBunker.interiorId, security, true, refresh)
            else
                if (refresh) then RefreshInterior(GunrunningBunker.interiorId) end
            end
        end,

        -- Removes the security.
        -- 	refresh: Reload the whole interior (values: true / false)
        Clear = function(refresh) SetIplPropState(GunrunningBunker.interiorId, {GunrunningBunker.Security.default, GunrunningBunker.Security.upgrade}, false, refresh) end
    },

    Details = {
        office = "Office_Upgrade_set",				-- Office interior
        officeLocked = "Office_blocker_set",		-- Metal door blocking access to the office
        locker = "gun_locker_upgrade",				-- Locker next to the office door
        rangeLights = "gun_range_lights",			-- Lights next to the shooting range
        rangeWall = "gun_wall_blocker",				-- Wall blocking access to the shooting range
        rangeLocked = "gun_range_blocker_set",		-- Metal door blocking access to the shooting range
        schematics = "Gun_schematic_set",			-- Gun schematic on the table and whiteboard

        -- Enable or disable a detail.
        -- 	details: Prop to enable or disable (values: GunrunningBunker.Details.office / GunrunningBunker.Details.officeLocked / GunrunningBunker.Details.locker...)
        --  state: Enable or Disable (values: true / false)
        -- 	refresh: Reload the whole interior (values: true / false)
        Enable = function (details, state, refresh)
            SetIplPropState(GunrunningBunker.interiorId, details, state, refresh)
        end
    },

    LoadDefault = function()
        GunrunningBunker.Ipl.Interior.Load()
        GunrunningBunker.Ipl.Exterior.Load()

        GunrunningBunker.Style.Set(GunrunningBunker.Style.blue)
        GunrunningBunker.Tier.Set(GunrunningBunker.Tier.upgrade)
        GunrunningBunker.Security.Set(GunrunningBunker.Security.default)
    
        GunrunningBunker.Details.Enable(GunrunningBunker.Details.office, true)
        GunrunningBunker.Details.Enable(GunrunningBunker.Details.officeLocked, false)
        GunrunningBunker.Details.Enable(GunrunningBunker.Details.locker, true)
        GunrunningBunker.Details.Enable(GunrunningBunker.Details.rangeLights, true)
        GunrunningBunker.Details.Enable(GunrunningBunker.Details.rangeWall, false)
        GunrunningBunker.Details.Enable(GunrunningBunker.Details.rangeLocked, false)
        GunrunningBunker.Details.Enable(GunrunningBunker.Details.schematics, true)

        -- Must be called in order to spawn or remove the props
        RefreshInterior(config.bunkerId)
    end
--[[

STYLE
	default = "Bunker_Style_A"
	blue = "Bunker_Style_B"
	yellow = "Bunker_Style_C",

TIER
	default = "standard_bunker_set"
	upgrade = "upgrade_bunker_set"

Security
	noEntryGate = ""
	default = "standard_security_set"
	upgrade = "security_upgrade"

]]

}