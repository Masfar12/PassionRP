local insideDriftSchool = false
local insideJail = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1))
		for _, area in pairs(Config.ClearArea) do
			if GetDistanceBetweenCoords(plyCoords, vector3(area.x, area.y, area.z), true ) < area.dist then
				ClearAreaOfPeds(area.x, area.y, area.z, area.radius, area.flag)
			end
		end
	end
end)

local driftSchool = PolyZone:Create({
    vector2(210.07374572754, -2536.0458984375),
    vector2(146.61747741699, -2573.9255371094),
    vector2(14.569815635681, -2559.7707519531),
    vector2(-69.121536254883, -2571.5832519531),
    vector2(-114.825050354, -2560.146484375),
    vector2(-176.95079040527, -2517.75),
    vector2(-179.06674194336, -2607.1774902344),
    vector2(-212.45495605469, -2610.2861328125),
    vector2(-210.50201416016, -2453.4765625),
    vector2(-249.2979888916, -2417.8229980469),
    vector2(-281.83419799805, -2425.3129882813),
    vector2(-302.69195556641, -2401.9189453125),
    vector2(-283.2268371582, -2382.2077636719),
    vector2(-37.403812408447, -2380.8742675781),
    vector2(116.00241851807, -2477.1823730469),
    vector2(97.418601989746, -2527.5705566406)
}, {
    name = "DriftSchool",
    debugGrid = false,
    maxZ = 32.61,
    gridDivisions = 45
})

local jailBounds = PolyZone:Create({
	vector2(1855.8966064453, 2701.9802246094),
	vector2(1775.4013671875, 2770.5339355469),
	vector2(1646.7535400391, 2765.9870605469),
	vector2(1562.7836914063, 2686.6459960938),
	vector2(1525.3662109375, 2586.5190429688),
	vector2(1533.7038574219, 2465.5300292969),
	vector2(1657.5997314453, 2386.9389648438),
	vector2(1765.8286132813, 2404.4763183594),
	vector2(1830.1740722656, 2472.1193847656),
	vector2(1855.7557373047, 2569.0361328125)
  }, {
	name = "jail_bounds",
	minZ = 30,
	maxZ = 70.5,
	debugGrid = false,
	gridDivisions = 25
})

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local plyPed = PlayerPedId()
        local coord = GetPedBoneCoords(plyPed, 0x796e)
        local inPoly = driftSchool:isPointInside(coord)
        if inPoly and not insideDriftSchool then
            insideDriftSchool = true
            ClearAreaOfPeds(10.28622, -2531.553, 5.147942, 50.0, 1)
            ClearAreaOfPeds(-194.1378, -2509.718, 5.137756, 50.0, 1)
			setScenarioState(false)
        elseif not inPoly and insideDriftSchool then
            insideDriftSchool = false
            setScenarioState(true)
        end
        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local plyPed = PlayerPedId()
        local coord = GetPedBoneCoords(plyPed, 0x796e)
        local inPoly = jailBounds:isPointInside(coord)
        if inPoly and not insideJail then
            insideJail = true
            ClearAreaOfPeds(1695.89, 2595.39, 45.55, 100.0, 1)
			setScenarioState(false)
        elseif not inPoly and insideJail then
            insideJail = false
            setScenarioState(true)
        end
        Citizen.Wait(500)
    end
end)

local scenarios = {
    "WORLD_VEHICLE_DRIVE_SOLO",
    "WORLD_GULL_STANDING",
    "WORLD_HUMAN_CLIPBOARD",
    "WORLD_HUMAN_SEAT_LEDGE",
    "WORLD_HUMAN_SEAT_LEDGE_EATING",
    "WORLD_HUMAN_STAND_MOBILE",
    "WORLD_HUMAN_HANG_OUT_STREET",
    "WORLD_HUMAN_SMOKING",
    "WORLD_HUMAN_DRINKING",
    "WORLD_GULL_FEEDING",
    "WORLD_HUMAN_GUARD_STAND",
    "WORLD_HUMAN_SEAT_STEPS",
    "WORLD_HUMAN_STAND_IMPATIENT",
    "WORLD_HUMAN_SEAT_WALL_EATING",
    "WORLD_HUMAN_WELDING",
}

function setScenarioState(pToggle)
    for i = 1, #scenarios do
        SetScenarioTypeEnabled(scenarios[i], pToggle)
    end
end