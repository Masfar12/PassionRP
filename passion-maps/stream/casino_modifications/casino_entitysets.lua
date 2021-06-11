Citizen.CreateThread(function()

        interiorID = GetInteriorAtCoords(2483.5, -267.75, -70.69)
        
        if IsValidInterior(interiorID) then
            ActivateInteriorEntitySet(interiorID, "set_spawn_group1")
            --ActivateInteriorEntitySet(interiorID, "set_vault_door_broken") -- Broken vault door on floor
            ActivateInteriorEntitySet(interiorID, "set_vault_dressing")
            ActivateInteriorEntitySet(interiorID, "set_vault_cash_02")
            ActivateInteriorEntitySet(interiorID, "set_vault_art_01") -- Art in rooms
            ActivateInteriorEntitySet(interiorID, "set_vault_art_02") -- Art in rooms
            ActivateInteriorEntitySet(interiorID, "set_vault_gold_01") -- Gold piles
            ActivateInteriorEntitySet(interiorID, "set_vault_gold_02") -- Gold piles
            ActivateInteriorEntitySet(interiorID, "set_vault_diamonds_02")
                
        RefreshInterior(interiorID)
    
        end
    
    end)