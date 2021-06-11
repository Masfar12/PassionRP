Citizen.CreateThread(function()

    Arcade = GetInteriorAtCoords(2727.97, -381.06, -48.99)
    PlanningRoom = GetInteriorAtCoords(2707.95, -361.7, -55.19)

    if IsValidInterior(Arcade) then
        On = EnableInteriorProp
        Off = DisableInteriorProp
        
        --NOTE-- Choose between either these blue walls or brick walls, or go down and enable dirty. Make sure either these 2 or dirty are chosen.
        Off(Arcade, "entity_set_arcade_set_ceiling_flat") -- Blue walls 
        On(Arcade, "entity_set_arcade_set_ceiling_beams") -- Brick walls
        
        On(Arcade, "entity_set_screens") -- Set of TVs in the middle of the room.
        On(Arcade, "entity_set_big_screen") -- Large TV by props (Literally just the TV)
        On(Arcade, "entity_set_constant_geometry") -- Restaurant bar + office props (counter props)
        Off(Arcade, "entity_set_ret_light_no_neon") -- Disable this if you are using a MURAL
        On(Arcade, "ch_chint02_00_dropped_ceiling") -- Not a single clue what this does. Just leave it enabled
        On(Arcade, "entity_set_hip_light_no_neon") -- Not a single clue what this does. Just leave it enabled
        On(Arcade, "entity_set_arcade_set_streetx4") -- Arcade machines
        Off(Arcade, "entity_set_arcade_set_ceiling_mirror") -- mirror ceiling -- Disabling puts it back to original restaurant ceiling.
        
        --NOTE-- ENABLE ALL OF THESE IF YOU WANT A DIRTY BUILDING. DISABLE EVERYTHING ABOVE AND BELOW
        Off(Arcade, "entity_set_arcade_set_derelict_carpet") -- carpets
        Off(Arcade, "entity_set_arcade_set_derelict") -- dirty shell
        Off(Arcade, "entity_set_arcade_set_derelict") -- Mud
        Off(Arcade, "entity_set_arcade_set_derelict_clean_up") -- dirt
        Off(Arcade, "entity_set_arcade_set_derelict_clean_up") -- closed vending machines
        
        --NOTE-- Removes the objects on the shelf, just leave them unless using dirty.
        On(Arcade, "entity_set_arcade_set_trophy_claw") -- pink animal with claw attached
        On(Arcade, "entity_set_arcade_set_trophy_monkey") -- Golden Banana
        On(Arcade, "entity_set_arcade_set_trophy_patriot") -- Golden & Bronze Barrels
        On(Arcade, "entity_set_arcade_set_trophy_retro") -- Golden console
        On(Arcade, "entity_set_arcade_set_trophy_brawler") -- Golden Sword Pencil
        On(Arcade, "entity_set_arcade_set_trophy_racer") -- Golden Rim
        On(Arcade, "entity_set_arcade_set_trophy_love") -- The Love Professor Pink Hour Glass
        On(Arcade, "entity_set_arcade_set_trophy_cabs") -- Golden Arcade Machine
        On(Arcade, "entity_set_arcade_set_trophy_gunner") -- Golden Double-Action Revolver + Floating Bullet
        On(Arcade, "entity_set_arcade_set_trophy_teller")-- Red Fortune Teller
        On(Arcade, "entity_set_arcade_set_trophy_king") -- Coverup Spray Paint Can
        On(Arcade, "entity_set_arcade_set_trophy_strife") -- Golden 8-bit Trophy
        
        --NOTE-- Removies plushies from office room desk, just leave them unless using dirty.
        On(Arcade, "entity_set_plushie_01") -- Pink Plushy on shelf
        On(Arcade, "entity_set_plushie_02") -- Green Plushy behind desk
        On(Arcade, "entity_set_plushie_03") -- Blue Plushy on right side of desk
        On(Arcade, "entity_set_plushie_04") -- Orange Plushy on left side of desk
        On(Arcade, "entity_set_plushie_05") -- Yellow Plushy with a Jamaican hat next to SpaceMonkey
        On(Arcade, "entity_set_plushie_06") -- Red Cat Plushy on shelf
        On(Arcade, "entity_set_plushie_07") -- Pink Bubblegum Space Princess on left side of desk
        On(Arcade, "entity_set_plushie_08") -- Green Girl Plushy on middle of desk
        On(Arcade, "entity_set_plushie_09") -- Old Man Plushy on right side of desk
        
        --NOTE-- If you disable ALL signs, it just takes the sign away and stays with a normal wall.
        -- When disabling this sign, make sure to re-enable `entity_set_ret_light_no_neon` up top!
        Off(Arcade, "entity_set_mural_neon_option_01") -- signboard censored girls
        Off(Arcade, "entity_set_mural_neon_option_02") -- signboard Vaporwave dude on motorcycle
        Off(Arcade, "entity_set_mural_neon_option_03") -- signboard gumball anime shit
        Off(Arcade, "entity_set_mural_neon_option_04") -- signboard Degeneration sign
        Off(Arcade, "entity_set_mural_neon_option_05") -- signboard car with lights
        On(Arcade, "entity_set_mural_neon_option_06") -- Animated wall vaporwave
        Off(Arcade, "entity_set_mural_neon_option_07") -- signboard illuminati shit
        Off(Arcade, "entity_set_mural_neon_option_08") -- signboard thor with hammer or sumthin
        
        --NOTE-- If you disable ALL wall paint, it goes back to default brick walls/default blue walls.
        Off(Arcade, "entity_set_mural_option_01") -- wall paint Censored girls, black and white
        Off(Arcade, "entity_set_mural_option_02") -- wall paint Red/Orange/Yellow lines
        Off(Arcade, "entity_set_mural_option_03") -- wall paint anime furry walls
        Off(Arcade, "entity_set_mural_option_04") -- wall paint 8bit blue lines
        Off(Arcade, "entity_set_mural_option_05") -- wall paint Degenatron 8bit video game stuffs 
        On(Arcade, "entity_set_mural_option_06") -- wall paint modern art lines(vaporwave-ish)
        Off(Arcade, "entity_set_mural_option_07") -- wall paint arcadey-anime
        Off(Arcade, "entity_set_mural_option_08") -- wall paint blue underwater thing
        
        --NOTE-- If you disable ALL painted floors, it goes to a default plain floor.
        Off(Arcade, "entity_set_floor_option_01") -- painted floor 1940s type beat (ugly af)
        Off(Arcade, "entity_set_floor_option_02") -- painted floor yellow/black curved floor
        Off(Arcade, "entity_set_floor_option_03") -- painted floor blue/red/pink/green/peach tiles with paws and splatters
        Off(Arcade, "entity_set_floor_option_04") -- painted floor blue/black tiles
        On(Arcade, "entity_set_floor_option_05") -- painted floor galaxy
        Off(Arcade, "entity_set_floor_option_06") -- painted floor blue plus
        Off(Arcade, "entity_set_floor_option_07") -- painted floor blue gucci shit
        Off(Arcade, "entity_set_floor_option_08") -- painted floor purple thunderbolts        
    RefreshInterior(Arcade)
    end
    if IsValidInterior(PlanningRoom) then
        On = EnableInteriorProp
        Off = DisableInteriorProp
            Off(PlanningRoom, "set_plan_casino") -- casino on the table
            Off(PlanningRoom, "set_plan_computer") -- computers near restaurant entrance
            Off(PlanningRoom, "set_plan_keypad") -- Fingerprint scanner near the Vault Door

            Off(PlanningRoom, "set_plan_hacker") -- Hackermans area
            Off(PlanningRoom, "set_plan_mechanic") -- Mechanic props all over
            Off(PlanningRoom, "set_plan_weapons") -- Weapon area

            Off(PlanningRoom, "set_plan_vault") -- Vault Door
            Off(PlanningRoom, "set_plan_wall") -- brick wall
            On(PlanningRoom, "set_plan_setup") -- light for plan
            On(PlanningRoom, "set_plan_bed") -- Cardboard Wall Room with a bed and gunracks
            Off(PlanningRoom, "set_plan_pre_setup") -- trash everywhere in basement
            Off(PlanningRoom, "set_plan_no_bed") -- trash in cardboard room / don't put on with set_plan_bed(clipping)
            On(PlanningRoom, "set_plan_garage") -- Lighting in the seperate garage
            Off(PlanningRoom, "set_plan_scribbles") -- Lester Scribbles on whiteboard (NEEDED WITH set_plan_setup)
            Off(PlanningRoom, "set_plan_arcade_x4") -- Arcade machines with fans on them
            Off(PlanningRoom, "set_plan_plans") -- Blueprints that go underneath the Police Drone
            Off(PlanningRoom, "set_plan_plastic_explosives") -- Plastic explosives near staircase
            Off(PlanningRoom, "set_plan_cockroaches") -- Tub of cockroaches underneath staircase
            Off(PlanningRoom, "set_plan_electric_drill") -- Toolbox and Drill next to the Casino Blueprint
            Off(PlanningRoom, "set_plan_vault_drill") -- Regular Drill next to the Police Drone
            Off(PlanningRoom, "set_plan_vault_laser") -- Laser Drill next to the Police Drone
            Off(PlanningRoom, "set_plan_stealth_outfits") -- Camo Dufflebag near the staircase
            Off(PlanningRoom, "set_plan_hacking_device") -- USB on `set_plan_hacker`
            Off(PlanningRoom, "set_plan_gruppe_sechs_outfits") -- Dufflebag near the staircase
            Off(PlanningRoom, "set_plan_fireman_helmet") -- Puts a Hard Hat on a shelf near the staircase
            Off(PlanningRoom, "set_plan_drone_parts") -- Adds a Broken Police Drone onto a table
            Off(PlanningRoom, "set_plan_vault_keycard_01a") -- Adds 2 Diamond Casino Keycards (Black)
            Off(PlanningRoom, "set_plan_swipe_card_01b") -- Adds a swipe card onto planning table (Blue)
            Off(PlanningRoom, "set_plan_swipe_card_01a") -- Adds a swipe card onto planning table (Purple)
            Off(PlanningRoom, "set_plan_vault_drill_alt") -- Drill + Bag on floor 
            Off(PlanningRoom, "set_plan_vault_laser_alt") -- Laser Drill + Bag on floor
        RefreshInterior(PlanningRoom)
    end
end)

-- ch_dlc_int_02_ch.ytyp -- Restaurant/Arcade 
-- ch_dlc_int_03_ch.ytyp -- Underground Planning Room
-- Stickerz is just such a good developer oh my gosh