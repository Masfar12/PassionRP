Config = Config or {}

Config.MinZOffset = 30

Config.RamsNeeded = 1

Config.Houses = {}

Config.Locations = {
	["main"]    = {
		label  = "Real Estate Agency",
		coords = { x = -1581.2638, y = -558.26746, z = 34.95318, h = 214.45571 },
	},
	["inside"]  = {
		label  = "Real Estate Agency Enter",
		coords = { x = -1583.89087, y = -559.72156, z = 108.52294, h = 299.55422 },
	},
	["outside"] = {
		label  = "Real Estate Agency Exit",
		coords = { x = -1581.1659, y = -558.39606, z = 34.9532, h = 33.83111 },
	},
}

Config.Objects = {
    {
        obj = 3043770296,
        name = "Safe"
    },
}

Config.Furniture = {

	["sofas"] = {

		label = "Sofas",

		items = {

			[1] = { ["object"] = "miss_rub_couch_01", ["price"] = 300, ["label"] = "Old Sofa" },

			[2] = { ["object"] = "prop_fib_3b_bench", ["price"] = 700, ["label"] = "3 seater sofa" },

			[3] = { ["object"] = "prop_ld_farm_chair01", ["price"] = 250, ["label"] = "Old chair" },

			[4] = { ["object"] = "prop_ld_farm_couch01", ["price"] = 300, ["label"] = "Old 3 seater sofa" },

			[5] = { ["object"] = "prop_ld_farm_couch02", ["price"] = 300, ["label"] = "Old striped sofa" },

			[6] = { ["object"] = "v_res_d_armchair", ["price"] = 300, ["label"] = "Old 1 Seat Couch Yellow" },

			[7] = { ["object"] = "v_res_fh_sofa", ["price"] = 3700, ["label"] = "Corner sofa" },

			[8] = { ["object"] = "v_res_mp_sofa", ["price"] = 3700, ["label"] = "Corner sofa 2" },

			[9] = { ["object"] = "v_res_d_sofa", ["price"] = 700, ["label"] = "Sofa 1" },

			[10] = { ["object"] = "v_res_j_sofa", ["price"] = 700, ["label"] = "Sofa 2" },

			[11] = { ["object"] = "v_res_mp_stripchair", ["price"] = 700, ["label"] = "Sofa 3" },

			[12] = { ["object"] = "v_res_m_h_sofa_sml", ["price"] = 700, ["label"] = "Sofa 4" },

			[13] = { ["object"] = "v_res_r_sofa", ["price"] = 700, ["label"] = "Sofa 5" },

			[14] = { ["object"] = "v_res_tre_sofa", ["price"] = 700, ["label"] = "Sofa 6" },

			[15] = { ["object"] = "v_res_tre_sofa_mess_a", ["price"] = 700, ["label"] = "Sofa 7" },

			[16] = { ["object"] = "v_res_tre_sofa_mess_b", ["price"] = 700, ["label"] = "Sofa 8" },

			[17] = { ["object"] = "v_res_tre_sofa_mess_c", ["price"] = 700, ["label"] = "Sofa 9" },

			[18] = { ["object"] = "v_res_tt_sofa", ["price"] = 700, ["label"] = "Sofa 10" },

			[19] = { ["object"] = "prop_rub_couch02", ["price"] = 700, ["label"] = "Sofa 11" },

			[20] = { ["object"] = "v_ilev_m_sofa", ["price"] = 2000, ["label"] = "White sofa" },

			[21] = { ["object"] = "v_med_p_sofa", ["price"] = 1000, ["label"] = "Leather sofa brown" },

			[22] = { ["object"] = "v_club_officesofa", ["price"] = 500, ["label"] = "pimp sofa" },

			[23] = { ["object"] = "imp_impexp_sofa_01", ["price"] = 2000, ["label"] = "Leather sofa white" },

			[24] = { ["object"] = "bkr_prop_clubhouse_sofa_01a", ["price"] = 1000, ["label"] = "black sofa" },

			[25] = { ["object"] = "ba_daybed3", ["price"] = 2000, ["label"] = "lounge chair" },

			[26] = { ["object"] = "ba_daybed1", ["price"] = 2000, ["label"] = "lounge chair 2" },

			[27] = { ["object"] = "ba_daybed2", ["price"] = 2000, ["label"] = "lounge chair 3" },

			[28] = { ["object"] = "ba_sofa3", ["price"] = 3000, ["label"] = "luxury sofa" },

			[29] = { ["object"] = "ba_sofa1", ["price"] = 3000, ["label"] = "luxury sofa 2" },

			[30] = { ["object"] = "ba_sofa2", ["price"] = 3000, ["label"] = "luxury sofa 3" },

			[31] = { ["object"] = "apa_mp_h_stn_sofacorn_01", ["price"] = 5000, ["label"] = "corner sofa 3" },

			[32] = { ["object"] = "prop_couch_lg_02", ["price"] = 1000, ["label"] = "wooden sofa" },

			[33] = { ["object"] = "apa_mp_h_stn_sofacorn_10", ["price"] = 5000, ["label"] = "corner sofa 4" }

		},

	},

	["chairs"] = {

		label = "Chairs",

		items = {

			[1] = { ["object"] = "v_res_d_highchair", ["price"] = 700, ["label"] = "High chair" },

			[2] = { ["object"] = "apa_mp_h_stn_chairstrip_03", ["price"] = 500, ["label"] = "Sit chair 4" },

			[3] = { ["object"] = "v_res_fa_chair01", ["price"] = 700, ["label"] = "Chair" },

			[4] = { ["object"] = "v_res_fa_chair02", ["price"] = 700, ["label"] = "Chair 2" },

			[5] = { ["object"] = "v_res_fh_barcchair", ["price"] = 700, ["label"] = "High chair 2" },

			[6] = { ["object"] = "v_res_fh_dineeamesa", ["price"] = 700, ["label"] = "Kitchen Chair 1" },

			[7] = { ["object"] = "v_res_fh_dineeamesb", ["price"] = 700, ["label"] = "Kitchen Chair 2" },

			[8] = { ["object"] = "v_res_fh_dineeamesc", ["price"] = 700, ["label"] = "Kitchen Chair 3" },

			[9] = { ["object"] = "v_res_fh_easychair", ["price"] = 700, ["label"] = "Chair 3" },

			[10] = { ["object"] = "v_res_fh_kitnstool", ["price"] = 700, ["label"] = "Chair 4" },

			[11] = { ["object"] = "v_res_fh_singleseat", ["price"] = 700, ["label"] = "High chair 3" },

			[12] = { ["object"] = "v_res_jarmchair", ["price"] = 700, ["label"] = "Arm Chair" },

			[13] = { ["object"] = "v_res_j_dinechair", ["price"] = 700, ["label"] = "Kitchen Chair 4" },

			[14] = { ["object"] = "v_res_j_stool", ["price"] = 700, ["label"] = "Chair 5" },

			[15] = { ["object"] = "v_res_mbchair", ["price"] = 700, ["label"] = "MB Chair" },

			[16] = { ["object"] = "v_res_m_armchair", ["price"] = 700, ["label"] = "Arm Chair 2" },

			[17] = { ["object"] = "v_res_m_dinechair", ["price"] = 700, ["label"] = "Kitchen Chair 5" },

			[18] = { ["object"] = "v_res_study_chair", ["price"] = 700, ["label"] = "Study Chair" },

			[19] = { ["object"] = "v_res_trev_framechair", ["price"] = 700, ["label"] = "Chair frame" },

			[20] = { ["object"] = "v_res_tre_chair", ["price"] = 700, ["label"] = "Chair 5" },

			[21] = { ["object"] = "v_res_tre_officechair", ["price"] = 700, ["label"] = "Office Chair" },

			[22] = { ["object"] = "v_res_tre_stool", ["price"] = 700, ["label"] = "Chair 6" },

			[23] = { ["object"] = "v_res_tre_stool_leather", ["price"] = 700, ["label"] = "Leather Chair" },

			[24] = { ["object"] = "v_res_tre_stool_scuz", ["price"] = 700, ["label"] = "Chair Scuz" },

			[25] = { ["object"] = "v_med_p_deskchair", ["price"] = 700, ["label"] = "Office chair" },

			[26] = { ["object"] = "v_med_p_easychair", ["price"] = 700, ["label"] = "Easy Chair" },

			[27] = { ["object"] = "v_med_whickerchair1", ["price"] = 700, ["label"] = "Whicker Chair" },

			[28] = { ["object"] = "prop_direct_chair_01", ["price"] = 700, ["label"] = "Directive Chair" },

			[29] = { ["object"] = "prop_direct_chair_02", ["price"] = 700, ["label"] = "Directive Chair 2" },

			[30] = { ["object"] = "prop_yacht_lounger", ["price"] = 700, ["label"] = "Yacht Chair 1" },

			[31] = { ["object"] = "prop_yacht_seat_01", ["price"] = 700, ["label"] = "Yacht Chair 2" },

			[32] = { ["object"] = "prop_yacht_seat_02", ["price"] = 700, ["label"] = "Yacht Chair 3" },

			[33] = { ["object"] = "prop_yacht_seat_03", ["price"] = 700, ["label"] = "Yacht Chair 4" },

			[34] = { ["object"] = "v_ret_chair_white", ["price"] = 100, ["label"] = "White Chair" },

			[35] = { ["object"] = "v_ret_chair", ["price"] = 100, ["label"] = "Chair 7" },

			[36] = { ["object"] = "v_ret_ta_stool", ["price"] = 100, ["label"] = "TA Chair" },

			[37] = { ["object"] = "prop_cs_office_chair", ["price"] = 100, ["label"] = "Office Chair 2" },

			[38] = { ["object"] = "v_24_llga_mesh_coffeetable", ["price"] = 3000, ["label"] = "set Chairs + table" },

			[39] = { ["object"] = "v_club_barchair", ["price"] = 300, ["label"] = "Chair 8" },

			[40] = { ["object"] = "prop_off_chair_04", ["price"] = 300, ["label"] = "Office chair 2" },

			[41] = { ["object"] = "v_club_stagechair", ["price"] = 500, ["label"] = "Stage chair" },

			[42] = { ["object"] = "v_club_officechair", ["price"] = 500, ["label"] = "Office chair 3" },

			[43] = { ["object"] = "prop_armchair_01", ["price"] = 500, ["label"] = "Sit chair" },

			[44] = { ["object"] = "prop_bar_stool_01", ["price"] = 300, ["label"] = "Bar stool" },

			[45] = { ["object"] = "bkr_int_02_strip_chair", ["price"] = 300, ["label"] = "Sit chair 2" },

			[46] = { ["object"] = "apa_mp_h_stn_chairarm_12", ["price"] = 500, ["label"] = "Sit chair 3" },

			[47] = { ["object"] = "apa_mp_h_stn_chairstool_12", ["price"] = 300, ["label"] = "Chair stool" },

		},

	},

	["beds"] = {

		label = "Beds",

		items = {

			[1] = { ["object"] = "v_res_d_bed", ["price"] = 700, ["label"] = "Bed 1" },	

			[2] = { ["object"] = "v_res_lestersbed", ["price"] = 700, ["label"] = "Bed 2" },	

			[3] = { ["object"] = "v_res_mbbed", ["price"] = 700, ["label"] = "MB Bed" },	

			[4] = { ["object"] = "v_res_mdbed", ["price"] = 700, ["label"] = "MD Bed" },	

			[5] = { ["object"] = "v_res_msonbed", ["price"] = 700, ["label"] = "Bed 3" },	

			[6] = { ["object"] = "v_res_tre_bed1", ["price"] = 700, ["label"] = "Bed 4" },	

			[7] = { ["object"] = "v_res_tre_bed2", ["price"] = 700, ["label"] = "T Bed" },	

			[8] = { ["object"] = "v_res_tt_bed", ["price"] = 700, ["label"] = "TT Bed" },

			[9] = { ["object"] = "apa_mp_h_bed_with_table_02", ["price"] = 5000, ["label"] = "fancy bed" }

		},	

	},

	["general"] = {

		label = "General",

		items = {

			[1] = { ["object"] = "v_corp_facebeanbag", ["price"] = 100, ["label"] = "Bean Bag 1" },

			[2] = { ["object"] = "v_res_cherubvase", ["price"] = 2500, ["label"] = "White Vase" },

			[3] = { ["object"] = "v_res_d_paddedwall", ["price"] = 300, ["label"] = "Padded Wall" },

			[4] = { ["object"] = "v_res_d_ramskull", ["price"] = 300, ["label"] = "Item" },

			[5] = { ["object"] = "v_res_d_whips", ["price"] = 300, ["label"] = "Whips" },

			[6] = { ["object"] = "v_res_fashmag1", ["price"] = 300, ["label"] = "Mags" },

			[7] = { ["object"] = "v_res_fashmagopen", ["price"] = 300, ["label"] = "Mags Open" },

			[8] = { ["object"] = "v_res_fa_magtidy", ["price"] = 300, ["label"] = "Mag Tidy" },

			[9] = { ["object"] = "v_res_fa_yogamat002", ["price"] = 300, ["label"] = "Yoga Mat 1" },

			[10] = { ["object"] = "v_res_fa_yogamat1", ["price"] = 300, ["label"] = "Yoga Mat 2" },

			[11] = { ["object"] = "v_res_fh_aftershavebox", ["price"] = 300, ["label"] = "Aftershave" },

			[12] = { ["object"] = "v_res_fh_flowersa", ["price"] = 300, ["label"] = "Flowers" },

			[13] = { ["object"] = "v_res_fh_fruitbowl", ["price"] = 300, ["label"] = "Fruitbowl" },

			[14] = { ["object"] = "v_res_fh_laundrybasket", ["price"] = 300, ["label"] = "Laundry Basket" },

			[15] = { ["object"] = "v_res_fh_pouf", ["price"] = 300, ["label"] = "Pouf" },

			[16] = { ["object"] = "v_res_fh_sculptmod", ["price"] = 300, ["label"] = "Sculpture" },

			[17] = { ["object"] = "v_res_j_magrack", ["price"] = 300, ["label"] = "Mag Rack" },

			[18] = { ["object"] = "v_res_jewelbox", ["price"] = 300, ["label"] = "Jewel Box" },

			[19] = { ["object"] = "v_res_mbbin", ["price"] = 300, ["label"] = "Bin" },

			[20] = { ["object"] = "v_res_mbowlornate", ["price"] = 300, ["label"] = "Ornate Bowl" },

			[21] = { ["object"] = "v_res_mbronzvase", ["price"] = 300, ["label"] = "Bronze Vase" },

			[22] = { ["object"] = "v_res_mchalkbrd", ["price"] = 300, ["label"] = "Chalk Board" },

			[23] = { ["object"] = "v_res_mddresser", ["price"] = 300, ["label"] = "Dresser" },

			[24] = { ["object"] = "v_res_mplinth", ["price"] = 300, ["label"] = "Linth" },

			[25] = { ["object"] = "v_res_mp_ashtrayb", ["price"] = 300, ["label"] = "Ashtray" },

			[26] = { ["object"] = "v_res_m_candle", ["price"] = 300, ["label"] = "Candle" },

			[27] = { ["object"] = "v_res_m_candlelrg", ["price"] = 300, ["label"] = "Candle Large" },

			[28] = { ["object"] = "v_res_m_kscales", ["price"] = 300, ["label"] = "Scales" },

			[29] = { ["object"] = "v_res_tt_bedpillow", ["price"] = 300, ["label"] = "Bed Pillow" },

			[30] = { ["object"] = "v_med_cor_whiteboard", ["price"] = 300, ["label"] = "whiteboard" },

			[31] = { ["object"] = "prop_ashtray_01", ["price"] = 100, ["label"] = "ashtray black" },

			[32] = { ["object"] = "v_ret_fh_ashtray", ["price"] = 100, ["label"] = "ashtray stone" },

			[33] = { ["object"] = "v_24_wdr_mesh_rugs", ["price"] = 500, ["label"] = "Rug" },

			[34] = { ["object"] = "imp_impexp_mod_int01_rug", ["price"] = 500, ["label"] = "Rug 2" },

			[35] = { ["object"] = "ex_mp_h_acc_rugwoolm_04", ["price"] = 500, ["label"] = "Rug 3" },

			[36] = { ["object"] = "ex_office_03c_rug008", ["price"] = 500, ["label"] = "Rug 4" },

			[37] = { ["object"] = "apa_mp_stilts_b_livingrug", ["price"] = 500, ["label"] = "Rug 5" },

			[38] = { ["object"] = "apa_mp_h_acc_rugwooll_03", ["price"] = 500, ["label"] = "Rug 6" },

			[39] = { ["object"] = "apa_mp_h_acc_rugwoolm_04", ["price"] = 500, ["label"] = "Rug 7" },

			[40] = { ["object"] = "v_club_rack", ["price"] = 500, ["label"] = "Clothes rack" },

			[41] = { ["object"] = "v_24_hangingclothes", ["price"] = 500, ["label"] = "Clothes" },

			[42] = { ["object"] = "v_24_hangingclothes1", ["price"] = 500, ["label"] = "Clothes 2" },

			[43] = { ["object"] = "v_24_wrd_mesh_tux", ["price"] = 500, ["label"] = "Clothes 3" },

			[44] = { ["object"] = "v_19_strmncrt3", ["price"] = 500, ["label"] = "Red curtains" },

			[45] = { ["object"] = "v_61_lng_mesh_fireplace", ["price"] = 500, ["label"] = "Fire place" }

		},

	},

	["general2"] = {

		label = "Props",

		items = {

			[1] = { ["object"] = "prop_a4_pile_01", ["price"] = 100, ["label"] = "A4 Pile" },

			[2] = { ["object"] = "prop_amb_40oz_03", ["price"] = 100, ["label"] = "40 oz" },

			[3] = { ["object"] = "prop_amb_beer_bottle", ["price"] = 100, ["label"] = "Beer" },

			[4] = { ["object"] = "prop_aviators_01", ["price"] = 100, ["label"] = "Aviators" },

			[5] = { ["object"] = "prop_barry_table_detail", ["price"] = 100, ["label"] = "Detail" },

			[6] = { ["object"] = "prop_beer_box_01", ["price"] = 100, ["label"] = "Beers" },

			[7] = { ["object"] = "prop_binoc_01", ["price"] = 100, ["label"] = "Binoculars" },

			[8] = { ["object"] = "prop_blox_spray", ["price"] = 100, ["label"] = "Blox Spray" },

			[9] = { ["object"] = "prop_bongos_01", ["price"] = 100, ["label"] = "Bongos" },

			[10] = { ["object"] = "prop_bong_01", ["price"] = 100, ["label"] = "Bong" },

			[11] = { ["object"] = "prop_boombox_01", ["price"] = 100, ["label"] = "Boombox" },

			[12] = { ["object"] = "prop_bowl_crisps", ["price"] = 100, ["label"] = "Bowl Crisps" },

			[13] = { ["object"] = "prop_candy_pqs", ["price"] = 100, ["label"] = "Candy" },

			[14] = { ["object"] = "prop_carrier_bag_01", ["price"] = 100, ["label"] = "Carrier bag" },

			[15] = { ["object"] = "prop_ceramic_jug_01", ["price"] = 100, ["label"] = "Ceramic Jug" },

			[16] = { ["object"] = "prop_cigar_pack_01", ["price"] = 100, ["label"] = "Cigar Pack 1" },

			[17] = { ["object"] = "prop_cigar_pack_02", ["price"] = 100, ["label"] = "Cigar Pack 2" },

			[18] = { ["object"] = "prop_cs_beer_box", ["price"] = 100, ["label"] = "Beer Box 2" },

			[19] = { ["object"] = "prop_cs_binder_01", ["price"] = 100, ["label"] = "Binder" },

			[20] = { ["object"] = "prop_cs_bs_cup", ["price"] = 100, ["label"] = "Cup" },

			[21] = { ["object"] = "prop_cs_cashenvelope", ["price"] = 100, ["label"] = "Envelope" },

			[22] = { ["object"] = "prop_cs_champ_flute", ["price"] = 100, ["label"] = "Flute" },

			[23] = { ["object"] = "prop_cs_duffel_01", ["price"] = 100, ["label"] = "Duffel Bag" },

			[24] = { ["object"] = "prop_cs_dvd", ["price"] = 50, ["label"] = "DVD" },

			[25] = { ["object"] = "prop_cs_dvd_case", ["price"] = 50, ["label"] = "DVD Case" },

			[26] = { ["object"] = "prop_cs_film_reel_01", ["price"] = 100, ["label"] = "Film Reel" },

			[27] = { ["object"] = "prop_cs_ilev_blind_01", ["price"] = 100, ["label"] = "Blind" },

			[28] = { ["object"] = "p_ld_bs_bag_01", ["price"] = 100, ["label"] = "Bag" },

			[29] = { ["object"] = "prop_cs_ironing_board", ["price"] = 100, ["label"] = "Ironing Board" },

			[30] = { ["object"] = "prop_cs_katana_01", ["price"] = 100, ["label"] = "Katana" },

			[31] = { ["object"] = "prop_cs_kettle_01", ["price"] = 100, ["label"] = "Kettle" },

			[32] = { ["object"] = "prop_cs_lester_crate", ["price"] = 100, ["label"] = "Crate" },

			[33] = { ["object"] = "prop_cs_petrol_can", ["price"] = 100, ["label"] = "Petrol Can" },

			[34] = { ["object"] = "prop_cs_sack_01", ["price"] = 100, ["label"] = "Sack" },

			[35] = { ["object"] = "prop_cs_script_bottle_01", ["price"] = 100, ["label"] = "Script Bottle" },

			[36] = { ["object"] = "prop_cs_script_bottle", ["price"] = 100, ["label"] = "Script Bottle 2" },

			[37] = { ["object"] = "prop_cs_street_binbag_01", ["price"] = 100, ["label"] = "Bin Bag" },

			[38] = { ["object"] = "prop_cs_whiskey_bottle", ["price"] = 100, ["label"] = "Whiskey Bottle" },

			[39] = { ["object"] = "prop_sh_bong_01", ["price"] = 100, ["label"] = "Bong" },

			[40] = { ["object"] = "prop_peanut_bowl_01", ["price"] = 100, ["label"] = "Peanuts" },

			[41] = { ["object"] = "prop_tumbler_01", ["price"] = 100, ["label"] = "Tumbler" },

			[42] = { ["object"] = "prop_weed_bottle", ["price"] = 100, ["label"] = "Weed bottle" },

			[43] = { ["object"] = "p_cs_lighter_01", ["price"] = 100, ["label"] = "lighter" },

			[44] = { ["object"] = "p_cs_papers_01", ["price"] = 100, ["label"] = "papers" },

			[45] = { ["object"] = "v_res_d_dildo_f", ["price"] = 100, ["label"] = "dildo black" },

			[46] = { ["object"] = "v_res_d_dildo_c", ["price"] = 100, ["label"] = "dildo white" },

			[47] = { ["object"] = "v_res_d_dildo_a", ["price"] = 100, ["label"] = "dildo" },

			[48] = { ["object"] = "prop_champ_cool", ["price"] = 100, ["label"] = "champagne cooler" },

			[49] = { ["object"] = "prop_champ_01b", ["price"] = 100, ["label"] = "champagne bottle" },

			[50] = { ["object"] = "prop_champ_flute", ["price"] = 100, ["label"] = "champagne flute" },

			[51] = { ["object"] = "ba_prop_club_champset", ["price"] = 300, ["label"] = "champagneset" },

			[52] = { ["object"] = "v_61_bed2_mesh_drugstuff001", ["price"] = 100, ["label"] = "junkystuff" },

			[53] = { ["object"] = "v_res_fa_candle01", ["price"] = 100, ["label"] = "Blue candle" },

			[54] = { ["object"] = "v_res_fa_candle02", ["price"] = 100, ["label"] = "Red candle" },

			[55] = { ["object"] = "v_res_fa_candle03", ["price"] = 100, ["label"] = "Green candle" },

			[56] = { ["object"] = "v_res_fa_candle04", ["price"] = 100, ["label"] = "Small candle" },

			[57] = { ["object"] = "v_57_livstuff_incense", ["price"] = 100, ["label"] = "incense" },

			[58] = { ["object"] = "v_24_lnb_coffeestuff", ["price"] = 100, ["label"] = "tafel clutter" },

			[59] = { ["object"] = "v_med_bottles2", ["price"] = 100, ["label"] = "chemicals" },

			[60] = { ["object"] = "v_res_desktidy", ["price"] = 100, ["label"] = "desk stuff" },

			[61] = { ["object"] = "v_med_p_notebook", ["price"] = 100, ["label"] = "notebook" },

			[62] = { ["object"] = "bkr_prop_weed_dry_01a", ["price"] = 100, ["label"] = "weed" },

			[63] = { ["object"] = "ba_prop_battle_trophy_battler", ["price"] = 100, ["label"] = "fist trofee" },

			[64] = { ["object"] = "ba_prop_battle_trophy_no1", ["price"] = 100, ["label"] = "star trofee" },

			[65] = { ["object"] = "prop_golf_bag_01c", ["price"] = 100, ["label"] = "golf bag" },

			[66] = { ["object"] = "hei_heist_kit_bin_01", ["price"] = 100, ["label"] = "trash bin" },

			[67] = { ["object"] = "prop_wooden_barrel", ["price"] = 100, ["label"] = "wooden barrel" }

		},

	},

	["general3"] = {

		label = "Random",

		items = {

			[1] = { ["object"] = "v_ret_csr_bin", ["price"] = 100, ["label"] = "CSR Bin" },

			[2] = { ["object"] = "v_ret_fh_wickbskt", ["price"] = 100, ["label"] = "Basket" },

			[3] = { ["object"] = "v_ret_gc_bag01", ["price"] = 100, ["label"] = "GC Bag 1" },

			[4] = { ["object"] = "v_ret_gc_bag02", ["price"] = 100, ["label"] = "GC Bag 2" },

			[5] = { ["object"] = "v_ret_gc_bin", ["price"] = 100, ["label"] = "GC Bin" },

			[6] = { ["object"] = "v_ret_gc_cashreg", ["price"] = 100, ["label"] = "Cash Register" },

			[7] = { ["object"] = "v_ret_gc_chair01", ["price"] = 100, ["label"] = "GC Chair 01" },

			[8] = { ["object"] = "v_ret_gc_chair02", ["price"] = 100, ["label"] = "GC Chair 02" },

			[9] = { ["object"] = "v_ret_gc_clock", ["price"] = 100, ["label"] = "Clock" },

			[10] = { ["object"] = "v_ret_hd_prod1_", ["price"] = 100, ["label"] = "Prod 1" },

			[11] = { ["object"] = "v_ret_hd_prod2_", ["price"] = 100, ["label"] = "Prod 2" },

			[12] = { ["object"] = "v_ret_hd_prod3_", ["price"] = 100, ["label"] = "Prod 3" },

			[13] = { ["object"] = "v_ret_hd_prod4_", ["price"] = 100, ["label"] = "Prod 4" },

			[14] = { ["object"] = "v_ret_hd_prod5_", ["price"] = 100, ["label"] = "Prod 5" },

			[15] = { ["object"] = "v_ret_hd_prod6_", ["price"] = 100, ["label"] = "Prod 6" },

			[16] = { ["object"] = "v_ret_hd_unit1_", ["price"] = 100, ["label"] = "HD Unit 1" },

			[17] = { ["object"] = "v_ret_hd_unit2_", ["price"] = 100, ["label"] = "HD Unit 2" },

			[18] = { ["object"] = "v_ret_ml_fridge02", ["price"] = 100, ["label"] = "Fridge" },

			[19] = { ["object"] = "v_ret_ps_bag_01", ["price"] = 100, ["label"] = "Bag 1" },

			[20] = { ["object"] = "v_ret_ps_bag_02", ["price"] = 100, ["label"] = "Bag 2" },

			[21] = { ["object"] = "v_ret_ta_book1", ["price"] = 100, ["label"] = "Book 1" },

			[22] = { ["object"] = "v_ret_ta_book2", ["price"] = 100, ["label"] = "Book 2" },

			[23] = { ["object"] = "v_ret_ta_book3", ["price"] = 100, ["label"] = "Book 3" },

			[24] = { ["object"] = "v_ret_ta_book4", ["price"] = 100, ["label"] = "Book 4" },

			[25] = { ["object"] = "v_ret_ta_camera", ["price"] = 100, ["label"] = "Cam" },

			[26] = { ["object"] = "v_ret_ta_firstaid", ["price"] = 100, ["label"] = "First Aid" },

			[27] = { ["object"] = "v_ret_ta_hero", ["price"] = 100, ["label"] = "Hero" },

			[28] = { ["object"] = "v_ret_ta_mag1", ["price"] = 100, ["label"] = "Mag 1" },

			[29] = { ["object"] = "v_ret_ta_mag2", ["price"] = 100, ["label"] = "Mag 2" },

			[30] = { ["object"] = "v_ret_ta_skull", ["price"] = 100, ["label"] = "Skull" },

			[31] = { ["object"] = "prop_acc_guitar_01", ["price"] = 100, ["label"] = "Guitar" },

			[32] = { ["object"] = "prop_amb_handbag_01", ["price"] = 100, ["label"] = "Handbag" },

			[33] = { ["object"] = "prop_attache_case_01", ["price"] = 100, ["label"] = "Case" },

			[34] = { ["object"] = "prop_big_bag_01", ["price"] = 100, ["label"] = "Big Bag" },

			[35] = { ["object"] = "prop_bonesaw", ["price"] = 100, ["label"] = "Bonesaw" },

			[36] = { ["object"] = "prop_cs_fertilizer", ["price"] = 100, ["label"] = "Fertilizer" },

			[37] = { ["object"] = "prop_cs_shopping_bag", ["price"] = 100, ["label"] = "Shopping Bag" },

			[38] = { ["object"] = "prop_cs_vial_01", ["price"] = 100, ["label"] = "Vial" },

			[39] = { ["object"] = "prop_defilied_ragdoll_01", ["price"] = 100, ["label"] = "Ragdoll" }, 

			[40] = { ["object"] = "v_res_fa_book03", ["price"] = 100, ["label"] = "Kamastura book" },

			[41] = { ["object"] = "prop_weight_rack_02", ["price"] = 500, ["label"] = "weight rack" },

			[42] = { ["object"] = "prop_weight_bench_02", ["price"] = 500, ["label"] = "weight bench" },

			[43] = { ["object"] = "prop_tool_broom", ["price"] = 100, ["label"] = "broom" },

			[44] = { ["object"] = "prop_fire_exting_2a", ["price"] = 100, ["label"] = "extinguisher" },

			[45] = { ["object"] = "v_res_vacuum", ["price"] = 100, ["label"] = "vacuum" },

			[46] = { ["object"] = "v_ret_gc_fan", ["price"] = 100, ["label"] = "fan" },

			[47] = { ["object"] = "prop_paint_stepl01b", ["price"] = 100, ["label"] = "step" },

			[48] = { ["object"] = "bkr_prop_weed_bucket_01b", ["price"] = 100, ["label"] = "weed bucket" },

			[49] = { ["object"] = "v_club_vusnaketank", ["price"] = 500, ["label"] = "snake tank" },

			[50] = { ["object"] = "prop_pooltable_02", ["price"] = 1500, ["label"] = "pool table" },

			[51] = { ["object"] = "prop_pool_rack_02", ["price"] = 100, ["label"] = "pool rack" },

			[52] = { ["object"] = "v_club_vu_deckcase", ["price"] = 1000, ["label"] = "dj set" },

			[53] = { ["object"] = "v_corp_servercln", ["price"] = 1000, ["label"] = "serverrack" }

		},

	},

	["general4"] = {

		label = "Random 2",

		items = {

			[1] = { ["object"] = "prop_dummy_01", ["price"] = 100, ["label"] = "Dummy" },

			[2] = { ["object"] = "prop_egg_clock_01", ["price"] = 100, ["label"] = "Egg Clock" },

			[3] = { ["object"] = "prop_el_guitar_01", ["price"] = 100, ["label"] = "E Guitar 1" },

			[4] = { ["object"] = "prop_el_guitar_02", ["price"] = 100, ["label"] = "E Guitar 2" },

			[5] = { ["object"] = "prop_el_guitar_03", ["price"] = 100, ["label"] = "E Guitar 2" },

			[6] = { ["object"] = "prop_feed_sack_01", ["price"] = 100, ["label"] = "Feed Sack" },

			[7] = { ["object"] = "prop_floor_duster_01", ["price"] = 100, ["label"] = "Floor Duster" },

			[8] = { ["object"] = "prop_fruit_basket", ["price"] = 100, ["label"] = "Fruit Basket" },

			[9] = { ["object"] = "prop_f_duster_02", ["price"] = 100, ["label"] = "Duster" },

			[10] = { ["object"] = "prop_grapes_02", ["price"] = 100, ["label"] = "Grapes" },

			[11] = { ["object"] = "prop_hotel_clock_01", ["price"] = 100, ["label"] = "Hotel Clock" },

			[12] = { ["object"] = "prop_idol_case_01", ["price"] = 100, ["label"] = "Idol Case" },

			[13] = { ["object"] = "prop_jewel_02a", ["price"] = 100, ["label"] = "Jewels" },

			[14] = { ["object"] = "prop_jewel_02b", ["price"] = 100, ["label"] = "Jewels" },

			[15] = { ["object"] = "prop_jewel_02c", ["price"] = 100, ["label"] = "Jewels" },

			[16] = { ["object"] = "prop_jewel_03a", ["price"] = 100, ["label"] = "Jewels" },

			[17] = { ["object"] = "prop_jewel_03b", ["price"] = 100, ["label"] = "Jewels" },

			[18] = { ["object"] = "prop_jewel_04a", ["price"] = 100, ["label"] = "Jewels" },

			[19] = { ["object"] = "prop_jewel_04b", ["price"] = 100, ["label"] = "Jewels" },

			[20] = { ["object"] = "prop_j_disptray_01", ["price"] = 100, ["label"] = "Display Tray" },

			[21] = { ["object"] = "prop_j_disptray_01b", ["price"] = 100, ["label"] = "Display Tray" },

			[22] = { ["object"] = "prop_j_disptray_02", ["price"] = 100, ["label"] = "Display Tray" },

			[23] = { ["object"] = "prop_j_disptray_03", ["price"] = 100, ["label"] = "Display Tray" },

			[24] = { ["object"] = "prop_j_disptray_04", ["price"] = 100, ["label"] = "Display Tray" },

			[25] = { ["object"] = "prop_j_disptray_04b", ["price"] = 100, ["label"] = "Display Tray" },

			[26] = { ["object"] = "prop_j_disptray_05", ["price"] = 100, ["label"] = "Display Tray" },

			[27] = { ["object"] = "prop_j_disptray_05b", ["price"] = 100, ["label"] = "Display Tray" },

			[28] = { ["object"] = "prop_ld_greenscreen_01", ["price"] = 100, ["label"] = "Green Screen" },

			[29] = { ["object"] = "prop_ld_handbag", ["price"] = 100, ["label"] = "Handbag" },

			[30] = { ["object"] = "prop_ld_jerrycan_01", ["price"] = 100, ["label"] = "Jerry Can" },

			[31] = { ["object"] = "prop_ld_keypad_01", ["price"] = 100, ["label"] = "Keypad 1" },

			[32] = { ["object"] = "prop_ld_keypad_01b", ["price"] = 100, ["label"] = "Keypad 2" },

			[33] = { ["object"] = "prop_ld_suitcase_01", ["price"] = 100, ["label"] = "Suitcase 1" },

			[34] = { ["object"] = "prop_ld_suitcase_02", ["price"] = 100, ["label"] = "Suitcase 2" },

			[35] = { ["object"] = "hei_p_attache_case_shut", ["price"] = 100, ["label"] = "Suitcase 3"},

			[36] = { ["object"] = "prop_mr_rasberryclean", ["price"] = 100, ["label"] = "Rasberry Clean" },

			[37] = { ["object"] = "prop_paper_bag_01", ["price"] = 100, ["label"] = "Paper Bag" },

			[38] = { ["object"] = "prop_shopping_bags01", ["price"] = 100, ["label"] = "Shopping Bags" },

			[39] = { ["object"] = "prop_shopping_bags02", ["price"] = 100, ["label"] = "Shopping Bags 2" },

			[40] = { ["object"] = "prop_yoga_mat_01", ["price"] = 100, ["label"] = "Yoga Mat 1" },

			[41] = { ["object"] = "prop_yoga_mat_02", ["price"] = 100, ["label"] = "Yoga Mat 2" },

			[42] = { ["object"] = "prop_yoga_mat_03", ["price"] = 100, ["label"] = "Yoga Mat 3" },

			[43] = { ["object"] = "p_ld_sax", ["price"] = 100, ["label"] = "Sax" },

			[44] = { ["object"] = "p_ld_soc_ball_01", ["price"] = 100, ["label"] = "SOCCER Ball" },

			[45] = { ["object"] = "p_watch_01", ["price"] = 100, ["label"] = "Watch 1" },

			[46] = { ["object"] = "p_watch_02", ["price"] = 100, ["label"] = "Watch 2" },

			[47] = { ["object"] = "p_watch_03", ["price"] = 100, ["label"] = "Watch 3" },

			[48] = { ["object"] = "p_watch_04", ["price"] = 100, ["label"] = "Watch 4" },

			[49] = { ["object"] = "p_watch_05", ["price"] = 100, ["label"] = "Watch 5" },

			[50] = { ["object"] = "p_watch_06", ["price"] = 100, ["label"] = "Watch 6" },

		},

	},

	["small"] = {
 
        label = "Details",
 
        items = {
 
            [1] = { ["object"] = "v_res_r_figcat", ["price"] = 300, ["label"] = "Fig Cat" },
 
            [2] = { ["object"] = "v_res_r_figclown", ["price"] = 300, ["label"] = "Fig Clown" },
 
            [3] = { ["object"] = "v_res_r_figauth2", ["price"] = 300, ["label"] = "Fig Auth" },
 
            [4] = { ["object"] = "v_res_r_figfemale", ["price"] = 300, ["label"] = "Fig Female" },
 
            [5] = { ["object"] = "v_res_r_figflamenco", ["price"] = 300, ["label"] = "Fig Flamenco" },
 
            [6] = { ["object"] = "v_res_r_figgirl", ["price"] = 300, ["label"] = "Fig Girl" },
 
            [7] = { ["object"] = "v_res_r_figgirlclown", ["price"] = 300, ["label"] = "Fig Girl Clown" },
 
            [8] = { ["object"] = "v_res_r_figoblisk", ["price"] = 300, ["label"] = "Fig Oblisk" },
 
            [9] = { ["object"] = "v_res_r_figpillar", ["price"] = 300, ["label"] = "Fig Pillar" },
 
            [10] = { ["object"] = "v_res_r_teapot", ["price"] = 300, ["label"] = "Teapot" },
 
            [11] = { ["object"] = "v_res_sculpt_dec", ["price"] = 300, ["label"] = "Sculpture 1" },
 
            [12] = { ["object"] = "v_res_sculpt_decd", ["price"] = 300, ["label"] = "Sculpture 2" },
 
            [13] = { ["object"] = "v_res_sculpt_dece", ["price"] = 300, ["label"] = "Sculpture 3" },
 
            [14] = { ["object"] = "v_res_sculpt_decf", ["price"] = 300, ["label"] = "Sculpture 4" },
 
            [15] = { ["object"] = "v_res_skateboard", ["price"] = 300, ["label"] = "Skateboard" },
 
            [16] = { ["object"] = "v_res_sketchpad", ["price"] = 300, ["label"] = "Sketchpad" },
 
            [17] = { ["object"] = "v_res_tissues", ["price"] = 300, ["label"] = "Tissues" },
 
            [18] = { ["object"] = "v_res_tre_basketmess", ["price"] = 300, ["label"] = "Basket" },
 
            [19] = { ["object"] = "v_res_tre_bin", ["price"] = 300, ["label"] = "Bin" },
 
            [20] = { ["object"] = "v_res_tre_cushiona", ["price"] = 300, ["label"] = "Cushion 1" },
 
            [21] = { ["object"] = "v_res_tre_cushionb", ["price"] = 300, ["label"] = "Cushion 2" },
 
            [22] = { ["object"] = "v_res_tre_cushionc", ["price"] = 300, ["label"] = "Cushion 3" },
 
            [23] = { ["object"] = "v_res_tre_cushiond", ["price"] = 300, ["label"] = "Cushion 4" },
 
            [24] = { ["object"] = "v_res_tre_cushnscuzb", ["price"] = 300, ["label"] = "Cushion 5" },
 
            [25] = { ["object"] = "v_res_tre_cushnscuzd", ["price"] = 300, ["label"] = "Cushion 6" },
 
            [26] = { ["object"] = "v_res_tre_fruitbowl", ["price"] = 300, ["label"] = "Fruitbowl" },
 
            [27] = { ["object"] = "v_med_p_sideboard", ["price"] = 300, ["label"] = "Sideboard" },
 
            [28] = { ["object"] = "prop_idol_01", ["price"] = 100, ["label"] = "Idol 1" },
 
            [29] = { ["object"] = "v_res_r_fighorsestnd", ["price"] = 300, ["label"] = "figurine black horse" },
 
            [30] = { ["object"] = "v_56_fighorse_scale", ["price"] = 300, ["label"] = "figurine big horse" },
 
            [31] = { ["object"] = "v_res_r_fighorse", ["price"] = 300, ["label"] = "figurine big horse" },
 
            [32] = { ["object"] = "v_res_r_figdancer", ["price"] = 300, ["label"] = "elephant figurine" },
 
            [33] = { ["object"] = "v_res_fa_idol02", ["price"] = 300, ["label"] = "elephant figurinee" },
 
            [34] = { ["object"] = "v_res_m_statue", ["price"] = 300, ["label"] = "sculpture" },
 
            [35] = { ["object"] = "v_20_ornaeagle", ["price"] = 300, ["label"] = "figurine eagle" },
 
            [36] = { ["object"] = "v_24_lnb_mesh_smallvase", ["price"] = 300, ["label"] = "vases" },
 
            [37] = { ["object"] = "v_med_p_vaseround", ["price"] = 300, ["label"] = "vase round" },
 
            [38] = { ["object"] = "ex_mp_h_acc_vase_05", ["price"] = 300, ["label"] = "vase purple" },
 
            [39] = { ["object"] = "apa_mp_h_acc_dec_head_01", ["price"] = 300, ["label"] = "artwork" },
 
            [40] = { ["object"] = "apa_mp_h_acc_dec_sculpt_02", ["price"] = 300, ["label"] = "artwork 2" },
 
            [41] = { ["object"] = "ex_mp_h_acc_dec_plate_02", ["price"] = 300, ["label"] = "artwork 3" },
 
            [42] = { ["object"] = "apa_mp_h_acc_bowl_ceramic_01", ["price"] = 300, ["label"] = "Scale" }
 
        },
 
    },
 
    ["storage"] = {
 
        label = "Storage",
 
        items = {
 
            [1] = { ["object"] = "v_res_cabinet", ["price"] = 2500, ["label"] = "Cabinet Large" },
 
            [2] = { ["object"] = "v_res_d_dressingtable", ["price"] = 2500, ["label"] = "Dressing Table" },
 
            [3] = { ["object"] = "v_res_d_sideunit", ["price"] = 2500, ["label"] = "Side Unit" },
 
            [4] = { ["object"] = "v_res_fh_sidebrddine", ["price"] = 2500, ["label"] = "Side Unit" },
 
            [5] = { ["object"] = "v_res_fh_sidebrdlngb", ["price"] = 2500, ["label"] = "Side Unit" },
 
            [6] = { ["object"] = "v_res_mbbedtable", ["price"] = 2500, ["label"] = "Bed Unit" },
 
            [7] = { ["object"] = "v_res_j_tvstand", ["price"] = 2500, ["label"] = "Tv Unit" },
 
            [8] = { ["object"] = "v_res_mbdresser", ["price"] = 2500, ["label"] = "Dresser Unit" },
 
            [9] = { ["object"] = "v_res_mbottoman", ["price"] = 2500, ["label"] = "Bottoman Unit" },
 
            [10] = { ["object"] = "v_res_mconsolemod", ["price"] = 2500, ["label"] = "Console Unit" },
 
            [11] = { ["object"] = "v_res_mcupboard", ["price"] = 2500, ["label"] = "Cupboard Unit" },
 
            [12] = { ["object"] = "v_res_mdchest", ["price"] = 2500, ["label"] = "Chest Unit" },
 
            [13] = { ["object"] = "v_res_msoncabinet", ["price"] = 2500, ["label"] = "Mason Unit" },
 
            [14] = { ["object"] = "v_res_m_armoire", ["price"] = 2500, ["label"] = "Armoire Unit" },
 
            [15] = { ["object"] = "v_res_m_sidetable", ["price"] = 2500, ["label"] = "Side Unit" },
 
            [16] = { ["object"] = "v_res_son_desk", ["price"] = 2500, ["label"] = "Desk Unit" },
 
            [17] = { ["object"] = "v_res_tre_bedsidetable", ["price"] = 2500, ["label"] = "Side Unit" },
 
            [18] = { ["object"] = "v_res_tre_bedsidetableb", ["price"] = 2500, ["label"] = "Side Unit 2" },
 
            [19] = { ["object"] = "v_res_tre_smallbookshelf", ["price"] = 2500, ["label"] = "Book Unit" },
 
            [20] = { ["object"] = "v_res_tre_storagebox", ["price"] = 2500, ["label"] = "Box Unit" },
 
            [21] = { ["object"] = "v_res_tre_storageunit", ["price"] = 2500, ["label"] = "Storage Unit" },
 
            [22] = { ["object"] = "v_res_tre_wardrobe", ["price"] = 2500, ["label"] = "Wardrobe Unit" },
 
            [23] = { ["object"] = "v_res_tre_wdunitscuz", ["price"] = 2500, ["label"] = "Wood Unit" },
 
            [24] = { ["object"] = "prop_devin_box_closed", ["price"] = 100, ["label"] = "Bean Bag 1" },
 
            [25] = { ["object"] = "prop_mil_crate_01", ["price"] = 100, ["label"] = "Mil Crate 1" },
 
            [26] = { ["object"] = "prop_mil_crate_02", ["price"] = 100, ["label"] = "Mil Crate 2" },
 
            [27] = { ["object"] = "prop_ld_int_safe_01", ["price"] = 25000, ["label"] = "Safe" },
 
            [28] = { ["object"] = "prop_toolchest_05", ["price"] = 5000, ["label"] = "Crafting Bench" },
 
            [29] = { ["object"] = "v_corp_filecablow", ["price"] = 500, ["label"] = "filing cabinet low" },
 
            [30] = { ["object"] = "v_corp_filecabtall", ["price"] = 500, ["label"] = "bathroom furniture" },
 
            [31] = { ["object"] = "v_23_pointsale01", ["price"] = 500, ["label"] = "bathroom furniture" },
 
            [32] = { ["object"] = "v_61_fnt_mesh_hooks", ["price"] = 100, ["label"] = "coat rack" },
 
            [33] = { ["object"] = "v_ilev_frnkwarddr1", ["price"] = 500, ["label"] = "wardrobe franklin" },
 
            [34] = { ["object"] = "prop_coathook_01", ["price"] = 100, ["label"] = "coat rack" },
 
            [35] = { ["object"] = "v_corp_lowcabdark01", ["price"] = 500, ["label"] = "filing cabinet low black" },
 
            [36] = { ["object"] = "v_corp_tallcabdark01", ["price"] = 500, ["label"] = "filing cabinet high black" },
 
            [37] = { ["object"] = "v_corp_cabshelves01", ["price"] = 1000, ["label"] = "filing cabinet black" },
 
            [38] = { ["object"] = "v_corp_offshelf", ["price"] = 1000, ["label"] = "filing cabinet large" },
 
            [39] = { ["object"] = "v_24_bdrm_mesh_bookcase", ["price"] = 500, ["label"] = "closet" },
 
            [40] = { ["object"] = "v_61_lng_mesh_unitc", ["price"] = 500, ["label"] = "bookcase white" },
 
            [41] = { ["object"] = "ba_wardrobe", ["price"] = 500, ["label"] = "wardrobe" },
 
            [42] = { ["object"] = "ex_office_03c_sideboardpower_018", ["price"] = 750, ["label"] = "cabinet modern" },
 
            [43] = { ["object"] = "apa_int_mp_h_stilts_b_sideboard2", ["price"] = 750, ["label"] = "cabinet modern 2" },
 
            [44] = { ["object"] = "apa_mp_h_str_shelfwallm_01", ["price"] = 750, ["label"] = "cabinet modern" },
 
            [45] = { ["object"] = "apa_mp_h_str_sideboardl_11", ["price"] = 750, ["label"] = "cabinet modern 3" },
 
            [46] = { ["object"] = "apa_int_mp_h_stilts_b_sideboard1", ["price"] = 750, ["label"] = "cabinet modern 4" }
 
        },
 
    },
 
    ["electronics"] = {
 
        label = "Electronics",
 
        items = {
 
            [1] = { ["object"] = "prop_trailr_fridge", ["price"] = 300, ["label"] = "Old Fridge" },
 
            [2] = { ["object"] = "v_res_fh_speaker", ["price"] = 300, ["label"] = "Speaker" },
 
            [3] = { ["object"] = "v_res_fh_speakerdock", ["price"] = 300, ["label"] = "Speaker Dock" },
 
            [4] = { ["object"] = "v_res_fh_bedsideclock", ["price"] = 300, ["label"] = "Bedside Clock" },
 
            [5] = { ["object"] = "v_res_fa_phone", ["price"] = 300, ["label"] = "Phone" },
 
            [6] = { ["object"] = "v_res_fh_towerfan", ["price"] = 300, ["label"] = "Tower Fan" },
 
            [7] = { ["object"] = "v_res_fa_fan", ["price"] = 300, ["label"] = "Fan" },
 
            [8] = { ["object"] = "v_res_lest_bigscreen", ["price"] = 300, ["label"] = "Bigscreen" },
 
            [9] = { ["object"] = "v_res_lest_monitor", ["price"] = 300, ["label"] = "Monitor" },
 
            [10] = { ["object"] = "v_res_tre_mixer", ["price"] = 300, ["label"] = "Mixer" },
 
            [11] = { ["object"] = "prop_cs_cctv", ["price"] = 100, ["label"] = "CCTV" },
 
            [12] = { ["object"] = "prop_ld_lap_top", ["price"] = 100, ["label"] = "Laptop" },
 
            [13] = { ["object"] = "prop_ld_monitor_01", ["price"] = 100, ["label"] = "Monitor" },
 
            [14] = { ["object"] = "prop_speaker_05", ["price"] = 500, ["label"] = "mounted speaker" },
 
            [15] = { ["object"] = "prop_tv_flat_03b", ["price"] = 1000, ["label"] = "Small flat screen top" },
 
            [16] = { ["object"] = "prop_laptop_01a", ["price"] = 750, ["label"] = "Small flat screen top" },
 
            [17] = { ["object"] = "prop_tv_flat_michael", ["price"] = 3000, ["label"] = "flat hanging" },
 
            [18] = { ["object"] = "prop_dyn_pc", ["price"] = 1000, ["label"] = "pc" },
 
            [19] = { ["object"] = "prop_keyboard_01b", ["price"] = 100, ["label"] = "keyboard" },
 
            [20] = { ["object"] = "prop_mouse_01b", ["price"] = 100, ["label"] = "computer mouse" },
 
            [21] = { ["object"] = "v_ret_gc_phone", ["price"] = 100, ["label"] = "office phone" },
 
            [22] = { ["object"] = "prop_tv_flat_01", ["price"] = 5000, ["label"] = "large flat screen" },
 
            [23] = { ["object"] = "prop_arcade_01", ["price"] = 5000, ["label"] = "arcade" },
 
            [24] = { ["object"] = "prop_console_01", ["price"] = 250, ["label"] = "game console" },
 
            [25] = { ["object"] = "v_res_tre_dvdplayer", ["price"] = 250, ["label"] = "DVD player" },
 
            [26] = { ["object"] = "prop_speaker_08", ["price"] = 500, ["label"] = "wooden speaker" },
 
            [27] = { ["object"] = "prop_cctv_mon_02", ["price"] = 300, ["label"] = "cctv monitor" },
 
            [28] = { ["object"] = "prop_tv_flat_02", ["price"] = 2500, ["label"] = "flatscreen stand" },
 
            [29] = { ["object"] = "v_54_lng_cctv", ["price"] = 1000, ["label"] = "creep equipment" },
 
            [30] = { ["object"] = "prop_cctv_cam_01a", ["price"] = 300, ["label"] = "cctv 2" },
 
            [31] = { ["object"] = "prop_dest_cctv_02", ["price"] = 300, ["label"] = "cctv monitor 2" },
 
            [32] = { ["object"] = "prop_cctv_cam_07a", ["price"] = 300, ["label"] = "cctv 3" },
 
            [33] = { ["object"] = "apa_mp_h_str_avunits_04", ["price"] = 5500, ["label"] = "flatscreen furniture" },
 
            [34] = { ["object"] = "apa_mp_h_str_avunits_01", ["price"] = 5500, ["label"] = "flatscreen furniture 2" },
 
            [35] = { ["object"] = "v_club_vu_deckcase", ["price"] = 1000, ["label"] = "dj set" },
 
            [36] = { ["object"] = "v_corp_servercln", ["price"] = 1000, ["label"] = "serverrack" }
 
        },
 
    },
 
    ["lighting"] = {
 
        label = "Lighting",
 
        items = {
 
            [1] = { ["object"] = "v_corp_cd_desklamp", ["price"] = 100, ["label"] = "Desk Corp Lamp" },
 
            [2] = { ["object"] = "v_res_desklamp", ["price"] = 100, ["label"] = "Desk Lamp" },
 
            [3] = { ["object"] = "v_res_d_lampa", ["price"] = 100, ["label"] = "Lamp AA" },
 
            [4] = { ["object"] = "v_res_fa_lamp1on", ["price"] = 100, ["label"] = "Lamp 1" },
 
            [5] = { ["object"] = "v_res_fh_floorlamp", ["price"] = 100, ["label"] = "Floor Lamp" },
 
            [6] = { ["object"] = "v_res_fh_lampa_on", ["price"] = 100, ["label"] = "Lamp 2" },
 
            [7] = { ["object"] = "v_res_j_tablelamp1", ["price"] = 100, ["label"] = "Table Lamp" },
 
            [8] = { ["object"] = "v_res_j_tablelamp2", ["price"] = 100, ["label"] = "Table Lamp 2" },
 
            [9] = { ["object"] = "v_res_mdbedlamp", ["price"] = 100, ["label"] = "Bed Lamp" },
 
            [10] = { ["object"] = "v_res_mplanttongue", ["price"] = 100, ["label"] = "Plant Tongue Lamp" },
 
            [11] = { ["object"] = "v_res_mtblelampmod", ["price"] = 100, ["label"] = "Table Lamp 3" },
 
            [12] = { ["object"] = "v_res_m_lampstand", ["price"] = 100, ["label"] = "Lamp Stand" },
 
            [13] = { ["object"] = "v_res_m_lampstand2", ["price"] = 100, ["label"] = "Lamp Stand 2" },
 
            [14] = { ["object"] = "v_res_m_lamptbl", ["price"] = 100, ["label"] = "Table Lamp 4" },
 
            [15] = { ["object"] = "v_res_tre_lightfan", ["price"] = 100, ["label"] = "Light Fan" },
 
            [16] = { ["object"] = "v_res_tre_talllamp", ["price"] = 100, ["label"] = "Tall Lamp" },
 
            [17] = { ["object"] = "v_ret_fh_walllighton", ["price"] = 100, ["label"] = "Wall Light" },
 
            [18] = { ["object"] = "v_ret_gc_lamp", ["price"] = 100, ["label"] = "GC Lamp" },
 
            [19] = { ["object"] = "prop_dummy_light", ["price"] = 100, ["label"] = "Flickering Light" },
 
            [20] = { ["object"] = "prop_ld_cont_light_01", ["price"] = 100, ["label"] = "Side Wall Light" },
 
            [21] = { ["object"] = "V_44_D_emis", ["price"] = 100, ["label"] = "Test Light" },
 
            [22] = { ["object"] = "prop_wall_light_07a", ["price"] = 100, ["label"] = "lantaarn" },
 
            [23] = { ["object"] = "prop_wall_light_01a", ["price"] = 100, ["label"] = "skeere lamp" },
 
            [24] = { ["object"] = "v_serv_tu_light2_", ["price"] = 100, ["label"] = "industrial light" },
 
            [25] = { ["object"] = "v_serv_tu_light3_", ["price"] = 100, ["label"] = "industrial light 2" },
 
            [26] = { ["object"] = "v_44_1_master_chan", ["price"] = 500, ["label"] = "chandelier" },
 
            [27] = { ["object"] = "v_57_lavalamp", ["price"] = 300, ["label"] = "lava lamp" },
 
            [28] = { ["object"] = "v_club_vu_lamp", ["price"] = 100, ["label"] = "small lamp" },
 
            [29] = { ["object"] = "ex_office_01c_lamptable_recept2", ["price"] = 100, ["label"] = "lamp" },
 
            [30] = { ["object"] = "ex_off01a_floorlamp_recept01", ["price"] = 300, ["label"] = "lamp 2" },
 
            [31] = { ["object"] = "ex_office_01b_lamptable_02", ["price"] = 100, ["label"] = "lamp 3" },
 
            [32] = { ["object"] = "ba_prop_battle_lights_ceiling_l_c", ["price"] = 300, ["label"] = "hanging lamp" },
 
            [33] = { ["object"] = "ba_prop_battle_lights_ceiling_l_b", ["price"] = 300, ["label"] = "chandelier 2" },
 
            [34] = { ["object"] = "ba_prop_battle_lights_wall_l_c", ["price"] = 100, ["label"] = "wall lamp" },
 
            [35] = { ["object"] = "ba_prop_battle_lights_wall_l_b", ["price"] = 100, ["label"] = "wall lamp 2" },
 
            [36] = { ["object"] = "hei_heist_lit_lightpendant_02", ["price"] = 300, ["label"] = "wall lamp 2" },
 
            [37] = { ["object"] = "prop_oldlight_01b", ["price"] = 100, ["label"] = "wall lamp 3" }
 
        },
 
    },
 
    ["tables"] = {
 
        label = "Tables",
 
        items = {
 
            [1] = { ["object"] = "v_res_d_coffeetable", ["price"] = 500, ["label"] = "Coffee Table 1" },
 
            [2] = { ["object"] = "v_res_d_roundtable", ["price"] = 500, ["label"] = "Round Table" },
 
            [3] = { ["object"] = "v_res_d_smallsidetable", ["price"] = 500, ["label"] = "Small Side Table" },
 
            [4] = { ["object"] = "v_res_fh_coftablea", ["price"] = 500, ["label"] = "Table A" },
 
            [5] = { ["object"] = "v_res_fh_coftableb", ["price"] = 500, ["label"] = "Table B" },
 
            [6] = { ["object"] = "v_res_fh_coftbldisp", ["price"] = 500, ["label"] = "Table C" },
 
            [7] = { ["object"] = "v_res_fh_diningtable", ["price"] = 500, ["label"] = "Dining Table" },
 
            [8] = { ["object"] = "v_res_j_coffeetable", ["price"] = 500, ["label"] = "Coffee Table 2" },
 
            [9] = { ["object"] = "v_res_j_lowtable", ["price"] = 500, ["label"] = "Low Table" },
 
            [10] = { ["object"] = "v_res_mdbedtable", ["price"] = 500, ["label"] = "Bed Table" },
 
            [11] = { ["object"] = "v_res_mddesk", ["price"] = 500, ["label"] = "Desk" },
 
            [12] = { ["object"] = "v_res_msidetblemod", ["price"] = 500, ["label"] = "Side Table" },
 
            [13] = { ["object"] = "v_res_m_console", ["price"] = 500, ["label"] = "Console Table" },
 
            [14] = { ["object"] = "v_res_m_dinetble_replace", ["price"] = 500, ["label"] = "Dining Table 2" },
 
            [15] = { ["object"] = "v_res_m_h_console", ["price"] = 500, ["label"] = "Console H Table" },
 
            [16] = { ["object"] = "v_res_m_stool", ["price"] = 500, ["label"] = "Stool?" },
 
            [17] = { ["object"] = "v_res_tre_sideboard", ["price"] = 500, ["label"] = "Sideboard Table" },
 
            [18] = { ["object"] = "v_res_tre_table2", ["price"] = 500, ["label"] = "Table 2" },
 
            [19] = { ["object"] = "v_res_tre_tvstand", ["price"] = 500, ["label"] = "Tv Table" },
 
            [20] = { ["object"] = "v_res_tre_tvstand_tall", ["price"] = 500, ["label"] = "Tv Table Tall" },
 
            [21] = { ["object"] = "v_med_p_coffeetable", ["price"] = 500, ["label"] = "Med Coffee Table" },
 
            [22] = { ["object"] = "v_med_p_desk", ["price"] = 500, ["label"] = "Med Desk" },
 
            [23] = { ["object"] = "prop_yacht_table_01", ["price"] = 100, ["label"] = "Yacht Table 1" },
 
            [24] = { ["object"] = "prop_yacht_table_02", ["price"] = 100, ["label"] = "Yacht Table 2" },
 
            [25] = { ["object"] = "prop_yacht_table_03", ["price"] = 100, ["label"] = "Yacht Table 3" },
 
            [26] = { ["object"] = "v_ret_csr_table", ["price"] = 100, ["label"] = "CSR Table" },
 
            [27] = { ["object"] = "v_res_mconsoletrad", ["price"] = 250, ["label"] = "high side table" },
 
            [28] = { ["object"] = "v_ilev_liconftable_sml", ["price"] = 500, ["label"] = "conference table" },
 
            [29] = { ["object"] = "v_ret_tablesml", ["price"] = 350, ["label"] = "side table marillaux" },
 
            [30] = { ["object"] = "v_61_lng_mesh_smalltable", ["price"] = 100, ["label"] = "pauper table" },
 
            [31] = { ["object"] = "v_57_coffeetable", ["price"] = 300, ["label"] = "coffee table glass" },
 
            [32] = { ["object"] = "v_54_lng_mesh_maindesk", ["price"] = 1000, ["label"] = "office reaguurder large" },
 
            [33] = { ["object"] = "v_54_lng_smalldesk", ["price"] = 750, ["label"] = "desk reaguurder small" },
 
            [34] = { ["object"] = "v_club_vu_table", ["price"] = 300, ["label"] = "set table" },
 
            [35] = { ["object"] = "ex_office3a_desk", ["price"] = 1000, ["label"] = "bureau modern" },
 
            [36] = { ["object"] = "bkr_int_02_coffee_table", ["price"] = 500, ["label"] = "coffee table" },
 
            [37] = { ["object"] = "bkr_prop_weed_table_01b", ["price"] = 100, ["label"] = "folding table" },
 
            [38] = { ["object"] = "ba_prop_int_trad_table", ["price"] = 300, ["label"] = "standing table" },
 
            [39] = { ["object"] = "ba_vip_table1", ["price"] = 750, ["label"] = "coffee table 2" },
 
            [40] = { ["object"] = "ba_vip_table2", ["price"] = 750, ["label"] = "coffee table 3" },
 
            [41] = { ["object"] = "ba_vip_table3", ["price"] = 750, ["label"] = "coffee table 4" },
 
            [42] = { ["object"] = "apa_mp_h_str_sideboards_02", ["price"] = 750, ["label"] = "side table glass" },
 
            [43] = { ["object"] = "mp_b_din_table_06", ["price"] = 2500, ["label"] = "dining table with chairs" }
 
        },
 
    },
 
    ["plants"] = {
 
        label = "Plants",
 
        items = {
 
            [1] = { ["object"] = "prop_fib_plant_01", ["price"] = 150, ["label"] = "Plant Fib" },
 
            [2] = { ["object"] = "v_corp_bombplant", ["price"] = 170, ["label"] = "Plant Bomb" },      
 
            [3] = { ["object"] = "v_res_mflowers", ["price"] = 170, ["label"] = "Plant Flowers" }, 
 
            [4] = { ["object"] = "v_res_mvasechinese", ["price"] = 170, ["label"] = "Plant Chinese" }, 
 
            [5] = { ["object"] = "v_res_m_bananaplant", ["price"] = 170, ["label"] = "Plant Banana" }, 
 
            [6] = { ["object"] = "v_res_m_palmplant1", ["price"] = 170, ["label"] = "Plant Palm" },
 
            [7] = { ["object"] = "v_res_m_palmstairs", ["price"] = 170, ["label"] = "Plant Palm 2" },  
 
            [8] = { ["object"] = "v_res_m_urn", ["price"] = 170, ["label"] = "Plant Urn" },
 
            [9] = { ["object"] = "v_res_rubberplant", ["price"] = 170, ["label"] = "Plant Rubber" },   
 
            [10] = { ["object"] = "v_res_tre_plant", ["price"] = 170, ["label"] = "Plant" },   
 
            [11] = { ["object"] = "v_res_tre_tree", ["price"] = 170, ["label"] = "Plant Tree" },   
 
            [12] = { ["object"] = "v_med_p_planter", ["price"] = 170, ["label"] = "Planter" }, 
 
            [13] = { ["object"] = "v_ret_flowers", ["price"] = 100, ["label"] = "Flowers" },
 
            [14] = { ["object"] = "v_ret_j_flowerdisp", ["price"] = 100, ["label"] = "Flowers 1" },
 
            [15] = { ["object"] = "v_ret_j_flowerdisp_white", ["price"] = 100, ["label"] = "Flowers 2" },  
 
            [16] = { ["object"] = "v_res_m_vasefresh", ["price"] = 300, ["label"] = "flower vase" },
 
            [17] = { ["object"] = "v_res_rosevasedead", ["price"] = 300, ["label"] = "flower vase 2" },
 
            [18] = { ["object"] = "v_res_exoticvase", ["price"] = 300, ["label"] = "flower vase 2" },
 
            [19] = { ["object"] = "v_res_rosevase", ["price"] = 300, ["label"] = "rose vase" },
 
            [20] = { ["object"] = "prop_pot_plant_6a", ["price"] = 300, ["label"] = "hangende plant" },
 
            [21] = { ["object"] = "prop_pot_plant_02a", ["price"] = 300, ["label"] = "plant pot" }
 
        },
 
    },
 
    ["kitchen"] = {
 
        label = "Kitchen",
 
        items = {
 
            [1] = { ["object"] = "prop_washer_01", ["price"] = 150, ["label"] = "Washer 1" },
 
            [2] = { ["object"] = "prop_washer_02", ["price"] = 150, ["label"] = "Washer 2" },
 
            [3] = { ["object"] = "prop_washer_03", ["price"] = 150, ["label"] = "Washer 3" },
 
            [4] = { ["object"] = "prop_washing_basket_01", ["price"] = 150, ["label"] = "Washing Basket" },
 
            [5] = { ["object"] = "v_res_fridgemoda", ["price"] = 150, ["label"] = "Fridge 1" },
 
            [6] = { ["object"] = "v_res_fridgemodsml", ["price"] = 150, ["label"] = "Fridge 2" },
 
            [7] = { ["object"] = "prop_fridge_01", ["price"] = 150, ["label"] = "Fridge 3" },
 
            [8] = { ["object"] = "prop_fridge_03", ["price"] = 150, ["label"] = "Fridge 4" },
 
            [9] = { ["object"] = "prop_cooker_03", ["price"] = 150, ["label"] = "Cooker" },
 
            [10] = { ["object"] = "prop_micro_01", ["price"] = 150, ["label"] = "Microwave 1" },
 
            [11] = { ["object"] = "prop_micro_02", ["price"] = 150, ["label"] = "Microwave 2" },
 
            [12] = { ["object"] = "prop_wok", ["price"] = 150, ["label"] = "Wok" },
 
            [13] = { ["object"] = "v_res_cakedome", ["price"] = 150, ["label"] = "Cake Plate" },
 
            [14] = { ["object"] = "v_res_fa_chopbrd", ["price"] = 150, ["label"] = "Chopping Board" },
 
            [15] = { ["object"] = "v_res_mutensils", ["price"] = 150, ["label"] = "Utensils" },
 
            [16] = { ["object"] = "v_res_pestle", ["price"] = 150, ["label"] = "Pestle" },
 
            [17] = { ["object"] = "v_ret_ta_paproll", ["price"] = 150, ["label"] = "PaperRoll 1" },
 
            [18] = { ["object"] = "v_ret_ta_paproll2", ["price"] = 150, ["label"] = "PaperRoll 2" },
 
            [19] = { ["object"] = "v_ret_fh_pot01", ["price"] = 150, ["label"] = "Pot 1" },
 
            [20] = { ["object"] = "v_ret_fh_pot02", ["price"] = 150, ["label"] = "Pot 2" },
 
            [21] = { ["object"] = "v_ret_fh_pot05", ["price"] = 150, ["label"] = "Pot 3" },
 
            [22] = { ["object"] = "prop_pot_03", ["price"] = 150, ["label"] = "Pot 4" },
 
            [23] = { ["object"] = "prop_pot_04", ["price"] = 150, ["label"] = "Pot 5" },
 
            [24] = { ["object"] = "prop_pot_05", ["price"] = 150, ["label"] = "Pot 6" },
 
            [25] = { ["object"] = "prop_pot_06", ["price"] = 150, ["label"] = "Pot 7" },
 
            [26] = { ["object"] = "prop_pot_rack", ["price"] = 150, ["label"] = "Pot Rack" },
 
            [27] = { ["object"] = "prop_kitch_juicer", ["price"] = 150, ["label"] = "Juicer" },
 
            [28] = { ["object"] = "v_9_kitchen_unit", ["price"] = 500, ["label"] = "Pot sink white" },
 
            [29] = { ["object"] = "v_9_kitchen_unit2", ["price"] = 500, ["label"] = "kitchen cabinets white" },
 
            [30] = { ["object"] = "v_2_tplt_mesh_kitchen", ["price"] = 1500, ["label"] = "large kitchen unit" },
 
            [31] = { ["object"] = "v_res_ovenhobmod", ["price"] = 1000, ["label"] = "stove" },
 
            [32] = { ["object"] = "v_res_mkniferack", ["price"] = 100, ["label"] = "knives" },
 
            [33] = { ["object"] = "v_res_mchopboard", ["price"] = 100, ["label"] = "cutting board" },
 
            [34] = { ["object"] = "prop_cs_kitchen_cab_l", ["price"] = 750, ["label"] = "kitchen cabinet wide" },
 
            [35] = { ["object"] = "prop_cs_kitchen_cab_r", ["price"] = 500, ["label"] = "kitchen cabinet narrow" },
 
            [36] = { ["object"] = "ex_office_03c_kitchen", ["price"] = 1000, ["label"] = "kitchen set" },
 
            [37] = { ["object"] = "prop_cs_kitchen_cab_r", ["price"] = 500, ["label"] = "kitchencab smal" }
 
        },
 
    },
 
    ["bathroom"] = {
 
        label = "Bathroom",
 
        items = {
 
            [1] = { ["object"] = "prop_ld_toilet_01", ["price"] = 100, ["label"] = "Toilet 1" },
 
            [2] = { ["object"] = "prop_toilet_01", ["price"] = 100, ["label"] = "Toilet 2" },
 
            [3] = { ["object"] = "prop_toilet_02", ["price"] = 100, ["label"] = "Toilet 3" },
 
            [4] = { ["object"] = "prop_sink_02", ["price"] = 100, ["label"] = "Sink 1" },
 
            [5] = { ["object"] = "prop_sink_04", ["price"] = 100, ["label"] = "Sink 2" },
 
            [6] = { ["object"] = "prop_sink_05", ["price"] = 100, ["label"] = "Sink 3" },
 
            [7] = { ["object"] = "prop_sink_06", ["price"] = 100, ["label"] = "Sink 4" },
 
            [8] = { ["object"] = "prop_soap_disp_01", ["price"] = 100, ["label"] = "Soap Dispenser" },
 
            [9] = { ["object"] = "prop_shower_rack_01", ["price"] = 100, ["label"] = "Shower Rack" },
 
            [10] = { ["object"] = "prop_handdry_01", ["price"] = 100, ["label"] = "Hand Dryer 1" },
 
            [11] = { ["object"] = "prop_handdry_02", ["price"] = 100, ["label"] = "Hand Dryer 2" },
 
            [12] = { ["object"] = "prop_towel_rail_01", ["price"] = 100, ["label"] = "Towel Rail 1" },
 
            [13] = { ["object"] = "prop_towel_rail_02", ["price"] = 100, ["label"] = "Towel Rail 2" },
 
            [14] = { ["object"] = "prop_towel_01", ["price"] = 100, ["label"] = "Towel 1" },
 
            [15] = { ["object"] = "v_res_mbtowel", ["price"] = 100, ["label"] = "Towel 2" },
 
            [16] = { ["object"] = "v_res_mbtowelfld", ["price"] = 100, ["label"] = "Towel 3" },
 
            [17] = { ["object"] = "v_res_mbath", ["price"] = 100, ["label"] = "Bath" },
 
            [18] = { ["object"] = "v_res_mbsink", ["price"] = 100, ["label"] = "Sink" },
 
            [19] = { ["object"] = "v_ilev_mm_faucet", ["price"] = 100, ["label"] = "crane" },
 
            [20] = { ["object"] = "v_res_tre_washbasket", ["price"] = 250, ["label"] = "laundry basket" },
 
            [21] = { ["object"] = "v_61_bth_mesh_toilet_clean", ["price"] = 500, ["label"] = "toilet clean" },
 
            [22] = { ["object"] = "prop_toilet_soap_02", ["price"] = 100, ["label"] = "cup of soap" },
 
            [23] = { ["object"] = "prop_bar_sink_01", ["price"] = 100, ["label"] = "sink" },
 
            [24] = { ["object"] = "ex_office_01c_radiator", ["price"] = 300, ["label"] = "radiator" },
 
            [25] = { ["object"] = "apa_mp_h_bathtub_01", ["price"] = 1000, ["label"] = "bathtub" }
 
        }
 
    },
 
    ["medical"] = {
 
        label = "Medical",
 
        items = {
 
            [1] = { ["object"] = "v_med_barrel", ["price"] = 750, ["label"] = "Barrel" },
 
            [2] = { ["object"] = "v_med_apecrate", ["price"] = 750, ["label"] = "Ape Crate" },
 
            [3] = { ["object"] = "v_med_apecratelrg", ["price"] = 750, ["label"] = "Ape Crate Large" },
 
            [4] = { ["object"] = "v_med_bed1", ["price"] = 750, ["label"] = "Bed 1" },
 
            [5] = { ["object"] = "v_med_bed2", ["price"] = 750, ["label"] = "Bed 2" },
 
            [6] = { ["object"] = "v_med_bedtable", ["price"] = 750, ["label"] = "Bed Table" },
 
            [7] = { ["object"] = "v_med_bench1", ["price"] = 750, ["label"] = "Bench 1" },
 
            [8] = { ["object"] = "v_med_bench2", ["price"] = 750, ["label"] = "Bench 2" },
 
            [9] = { ["object"] = "v_med_benchcentr", ["price"] = 750, ["label"] = "Bench Center" },
 
            [10] = { ["object"] = "v_med_benchset1", ["price"] = 750, ["label"] = "Bench Set" },
 
            [11] = { ["object"] = "v_med_bigtable", ["price"] = 750, ["label"] = "Big Table" },
 
            [12] = { ["object"] = "v_med_bin", ["price"] = 150, ["label"] = "Bin" },
 
            [13] = { ["object"] = "v_med_centrifuge1", ["price"] = 750, ["label"] = "Centrifuge" },
 
            [14] = { ["object"] = "v_med_cooler", ["price"] = 750, ["label"] = "Cooler" },
 
            [15] = { ["object"] = "v_med_cor_ceilingmonitor", ["price"] = 750, ["label"] = "Monitor" },
 
            [16] = { ["object"] = "v_med_cor_autopsytbl", ["price"] = 750, ["label"] = "Autopsy Table" },
 
            [17] = { ["object"] = "v_med_cor_cembin", ["price"] = 750, ["label"] = "Bin" },
 
            [18] = { ["object"] = "v_med_cor_cemtrolly2", ["price"] = 750, ["label"] = "Trolley" },
 
            [19] = { ["object"] = "v_med_cor_chemical", ["price"] = 750, ["label"] = "Chem" },
 
            [20] = { ["object"] = "v_med_cor_emblmtable", ["price"] = 750, ["label"] = "BLM Table" },
 
            [21] = { ["object"] = "v_med_cor_fileboxa", ["price"] = 750, ["label"] = "File Box" },
 
            [22] = { ["object"] = "v_med_cor_filingcab", ["price"] = 750, ["label"] = "File Cab" },
 
            [23] = { ["object"] = "v_med_cor_hose", ["price"] = 750, ["label"] = "Hose" },
 
            [24] = { ["object"] = "v_med_cor_largecupboard", ["price"] = 750, ["label"] = "Large Cupboard" },
 
            [25] = { ["object"] = "v_med_cor_lightbox", ["price"] = 750, ["label"] = "Lightbox" },
 
            [26] = { ["object"] = "v_med_cor_medstool", ["price"] = 750, ["label"] = "Medstool" },
 
            [27] = { ["object"] = "v_med_cor_minifridge", ["price"] = 750, ["label"] = "Minifridge" },
 
            [28] = { ["object"] = "v_med_cor_papertowels", ["price"] = 750, ["label"] = "Papertowels" },
 
            [29] = { ["object"] = "v_med_cor_photocopy", ["price"] = 750, ["label"] = "Photocopy" },
 
            [30] = { ["object"] = "v_med_cor_tvstand", ["price"] = 750, ["label"] = "TV Stand" },
 
            [31] = { ["object"] = "v_med_cor_wallunita", ["price"] = 750, ["label"] = "Wall Unit" },
 
            [32] = { ["object"] = "v_med_examlight", ["price"] = 750, ["label"] = "Exam light" },
 
            [33] = { ["object"] = "v_med_gastank", ["price"] = 750, ["label"] = "Gas Tank" },
 
            [34] = { ["object"] = "v_med_hazmatscan", ["price"] = 750, ["label"] = "Hazmat Scan" },
 
            [35] = { ["object"] = "v_med_hospheadwall1", ["price"] = 750, ["label"] = "Head Wall" },
 
            [36] = { ["object"] = "v_med_hospseating1", ["price"] = 750, ["label"] = "Seating" },
 
            [37] = { ["object"] = "v_med_hosptable", ["price"] = 750, ["label"] = "Hosp Table" },
 
            [38] = { ["object"] = "v_med_latexgloveboxblue", ["price"] = 50, ["label"] = "Glove Box" },
 
            [39] = { ["object"] = "v_med_medwastebin", ["price"] = 750, ["label"] = "Wastebin" },
 
            [40] = { ["object"] = "v_med_oscillator3", ["price"] = 750, ["label"] = "Oscillator" },
 
            [41] = { ["object"] = "prop_ld_health_pack", ["price"] = 100, ["label"] = "Health Pack" },
 
        },
 
    },
 
    ["walldecoration"] = {
 
        label = "Wall Deco",
 
        items = {
 
            [1] = { ["object"] = "v_61_hall_mesh_frames", ["price"] = 100, ["label"] = "paintings" },
 
            [2] = { ["object"] = "v_24_lnb_mesh_goldrecords", ["price"] = 750, ["label"] = "gold plates" },
 
            [3] = { ["object"] = "v_24_bdrm_mesh_arta", ["price"] = 750, ["label"] = "fartsy painting" },
 
            [4] = { ["object"] = "v_24_sta_mesh_props", ["price"] = 750, ["label"] = "orange painting" },
 
            [5] = { ["object"] = "v_24_sta_painting", ["price"] = 750, ["label"] = "black and white painting" },
 
            [6] = { ["object"] = "v_44_m_premier", ["price"] = 100, ["label"] = "movie poster" },
 
            [7] = { ["object"] = "v_15_shrm_delta_photos", ["price"] = 750, ["label"] = "movie poster" },
 
            [8] = { ["object"] = "v_ind_cs_toolboard", ["price"] = 500, ["label"] = "car photos" },
 
            [9] = { ["object"] = "bkr_int03_toilet_posters", ["price"] = 100, ["label"] = "posters" },
 
            [10] = { ["object"] = "ex_office_swag_paintings03", ["price"] = 1000, ["label"] = "paintings ground" },
 
            [11] = { ["object"] = "ex_mp_h_acc_artwallm_03", ["price"] = 750, ["label"] = "abstract painting" },
 
            [12] = { ["object"] = "ex_p_h_acc_artwallm_04", ["price"] = 750, ["label"] = "abstract painting 2" },
 
            [13] = { ["object"] = "ex_p_h_acc_artwalll_01", ["price"] = 1250, ["label"] = "abstract painting big" },
 
            [14] = { ["object"] = "ex_office_03c_toiletart", ["price"] = 750, ["label"] = "abstract painting 3" },
 
            [15] = { ["object"] = "ex_mp_h_acc_artwallm_02", ["price"] = 750, ["label"] = "abstract painting 4" },
 
            [16] = { ["object"] = "ex_office_03c_waitingart", ["price"] = 1000, ["label"] = "abstract painting" },
 
            [17] = { ["object"] = "ex_p_h_acc_artwallm_03", ["price"] = 750, ["label"] = "abstract painting 5" },
 
            [18] = { ["object"] = "ba_maisn_poster", ["price"] = 100, ["label"] = "club poster" },
 
            [19] = { ["object"] = "apa_mp_stilits_b_study_pics", ["price"] = 500, ["label"] = "paintings" },
 
            [20] = { ["object"] = "apa_mp_h_acc_artwallm_02", ["price"] = 750, ["label"] = "abstract painting 6" },
 
            [21] = { ["object"] = "apa_mp_h_acc_artwalll_02", ["price"] = 750, ["label"] = "abstract painting 7" },
 
            [22] = { ["object"] = "apa_mp_h_acc_artwallm_04", ["price"] = 750, ["label"] = "abstract painting 8" },
 
            [23] = { ["object"] = "bkr_int_02_trophy_shelves", ["price"] = 500, ["label"] = "trophy boards" },
 
            [24] = { ["object"] = "prop_dart_bd_cab_01", ["price"] = 250, ["label"] = "dartbord" },
 
            [25] = { ["object"] = "v_61_bd2_mesh_darts", ["price"] = 250, ["label"] = "dartbord 2" },
 
            [26] = { ["object"] = "prop_dart_bd_01", ["price"] = 250, ["label"] = "dartbord 3" }
 
        },
 
    },
}