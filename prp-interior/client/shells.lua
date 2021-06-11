function CreateHotel(spawn)
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":2.5,"y":-15.901171875,"x":4.251012802124,"h":2.2633972168}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`playerhouse_hotel`)
	while not HasModelLoaded(`playerhouse_hotel`) do
	    Citizen.Wait(1000)
	end
    local shell = CreateObject(`playerhouse_hotel`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(shell, true)
    table.insert(objects, shell)

    local curtains = CreateObject(`V_49_MotelMP_Curtains`, spawn.x + 1.55156000, spawn.y + (-3.83100100), spawn.z + 2.23457500)
    table.insert(objects, curtains)
    local window = CreateObject(`V_49_MotelMP_Curtains`, spawn.x + 1.43190000, spawn.y + (-3.92315100), spawn.z + 2.29329600)
    table.insert(objects, window)

    TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.5, POIOffsets.exit.h)

    return { objects, POIOffsets }
end

function CreateTier1House(spawn, isBackdoor)
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":2.5,"y":-15.901171875,"x":4.251012802124,"h":2.2633972168}')
	POIOffsets.clothes = json.decode('{"z":2.5,"y":-3.9233189,"x":-7.84363671,"h":2.2633972168}')
	POIOffsets.stash = json.decode('{"z":2.5,"y":1.33868212,"x":-9.084908691,"h":2.2633972168}')
	POIOffsets.logout = json.decode('{"z":2.0,"y":-1.1463337,"x":-6.69117089,"h":2.2633972168}')
    POIOffsets.backdoor = json.decode('{"z":2.5,"y":4.3798828125,"x":0.88999176025391,"h":182.2633972168}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`playerhouse_tier1`)
	while not HasModelLoaded(`playerhouse_tier1`) do
	    Citizen.Wait(1000)
	end
    local shell = CreateObject(`playerhouse_tier1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(shell, true)
    table.insert(objects, shell)

    local dt = CreateObject(`V_16_DT`, spawn.x-1.21854400, spawn.y-1.04389600, spawn.z + 1.39068600, false, false, false)
    table.insert(objects, dt)

    if not isBackdoor then
        TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.5, POIOffsets.exit.h)
        Citizen.Wait(100)
        TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.5, POIOffsets.exit.h)
        Citizen.Wait(100)
        TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.5, POIOffsets.exit.h)
    else
        TeleportToInterior(spawn.x + POIOffsets.backdoor.x, spawn.y + POIOffsets.backdoor.y, spawn.z + 1.5, POIOffsets.backdoor.h + 180)
    end

    return { objects, POIOffsets }
end

function CreateTier2House(spawn, isBackdoor)
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":2.5,"y":-15.901171875,"x":4.251012802124}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`playerhouse_tier1`)
	while not HasModelLoaded(`playerhouse_tier1`) do
	    Citizen.Wait(1000)
	end
    local shell = CreateObject(`playerhouse_tier1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(shell, true)

    table.insert(objects, shell)

    local dt = CreateObject(`V_16_DT`, spawn.x-1.21854400, spawn.y-1.04389600, spawn.z + 1.39068600, false, false, false)
    table.insert(objects, dt)


    if not isBackdoor then
        TeleportToInterior(spawn.x + 3.69693000, spawn.y - 15.080020100, spawn.z + 1.5, spawn.h)
    else
        TeleportToInterior(spawn.x + 0.88999176025391, spawn.y + 4.3798828125, spawn.z + 1.5, spawn.h)
    end

    return { objects, POIOffsets }
end

function CreateTier3House(spawn, isBackdoor)
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"y":7.7457427978516,"z":7.2074546813965,"x":-17.097534179688}')
    POIOffsets.backdoor = json.decode('{"z":5.8048210144043,"y":12.009414672852,"x":12.690063476563}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`playerhouse_tier3`)
	while not HasModelLoaded(`playerhouse_tier3`) do
	    Citizen.Wait(1000)
	end
    local shell = CreateObject(`playerhouse_tier3`, spawn.x, spawn.y, spawn.z, false, false, false)
    table.insert(objects, shell)
    RequestModel(`v_16_high_lng_over_shadow`)
	while not HasModelLoaded(`v_16_high_lng_over_shadow`) do
	    Citizen.Wait(1000)
	end
    local windows1 = CreateObject(`v_16_high_lng_over_shadow`, spawn.x + 10.16043000, spawn.y + -4.83294600, spawn.z + 4.99192700, false, false, false)
    table.insert(objects, windows1)

    FreezeEntityPosition(shell, true)
    FreezeEntityPosition(windows1, true)

    if not isBackdoor then
        TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, spawn.h)
    else
        TeleportToInterior(spawn.x + POIOffsets.backdoor.x, spawn.y + POIOffsets.backdoor.y, spawn.z + POIOffsets.backdoor.z, spawn.h)
    end

    return { objects, POIOffsets }
end

function CreateDeluxeShell(spawn) -- Deluxe Shell 
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":7.6,"y":-0.394,"x":-22.395,"h":271.0}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`shell_highend`)
    while not HasModelLoaded(`shell_highend`) do
        Citizen.Wait(1000)
    end
    local house = CreateObject(`shell_highend`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    table.insert(objects, house)
    TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 8.8, POIOffsets.exit.h)
    
    return { objects, POIOffsets }
end

function CreateTrailerShell(spawn) 
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":3.09115000,"y":-2.01262690,"x":-1.59115000,"h":352.34}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`shell_trailer`)
    while not HasModelLoaded(`shell_trailer`) do
        Citizen.Wait(1000)
    end
    local house = CreateObject(`shell_trailer`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    table.insert(objects, house)
    TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.8, POIOffsets.exit.h)
    
    return { objects, POIOffsets }
end

function CreateLesterShell(spawn) 
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":1.09115000,"y":-6.01262690,"x":-1.59115000,"h":352.34}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`shell_lester`)
    while not HasModelLoaded(`shell_lester`) do
        Citizen.Wait(1000)
        print("Waiting for Model")
    end
    local house = CreateObject(`shell_lester`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    table.insert(objects, house)
    TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.8, POIOffsets.exit.h)
    
    return { objects, POIOffsets }
end

function CreateHighEnd2Shell(spawn) 
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":6.89115000,"y":1.01262690,"x":-10.09115000,"h":352.34}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`shell_highendv2`)
    while not HasModelLoaded(`shell_highendv2`) do
        Citizen.Wait(1000)
        print("Waiting for Model")
    end
    local house = CreateObject(`shell_highendv2`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    table.insert(objects, house)
    TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 4.8, POIOffsets.exit.h)
    
    return { objects, POIOffsets }
end

function CreateHighEndApartment1(spawn) 
    local objects = {}

    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":8.89115000,"y":9.01262690,"x":-2.09115000,"h":172.34}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`shell_apartment1`)
    while not HasModelLoaded(`shell_apartment1`) do
        Citizen.Wait(1000)
        print("Waiting for Model")
    end
    local house = CreateObject(`shell_apartment1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    table.insert(objects, house)
    TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 8.8, POIOffsets.exit.h)
    
    return { objects, POIOffsets }
end