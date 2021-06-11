
Citizen.CreateThread(function()

local Besra1min, Besra1max = vec3(-2492.4, 3263.94, 30.1), vec3(-2477.72, 3274.76, 38.34)
local Besra2min, Besra2max = vec3(-2046.96, 3159.83, 28.82), vec3(-2038.12, 3161.5, 34.43)
local EastTankmin, EastTankmax = vec3(-1697.71, 3023.9, 29.3), vec3(-1689.33, 3013.34, 34.64)
local WestTankmin, WestTankmax = vec3(-2203.88, 3233.6, 35.95), vec3(-2054.21, 3134.44, 28.33)
local HangarLazermin, HangarLazermax = vec3(-2268.82, 3165.96, 39.95), vec3(-2290.03, 3188.42, 29.09)
local Zancudomin, Zancudomax = vec3(-1819.64, 2697.52, 446.56), vec3(-2411.21, 3659.95, -2.66)
if not DoesScenarioBlockingAreaExist(Zancudomin, Zancudomax) then
        AddScenarioBlockingArea(Zancudomin, Zancudomax, 0, 1, 1, 1)
    end
end)


--[[ Seperately disabled some scenarios here, just enable and disable ^^ if you want to use these lul
if not DoesScenarioBlockingAreaExist(Besra1min, Besra1max) then
    AddScenarioBlockingArea(Besra1min, Besra1max, 0, 1, 1, 1)
    print('West Besra Scenario successfully blocked!')
else 
    print("didn't work removing west besra!")
end
if not DoesScenarioBlockingAreaExist(Besra2min, Besra2max) then
    AddScenarioBlockingArea(Besra2min, Besra2max, 0, 1, 1, 1)
    print("Right Besra Scenario successfully blocked!")
else
    print("didn't work removing right besra!")
end
if not DoesScenarioBlockingAreaExist(EastTankmin, EastTankmax) then
    AddScenarioBlockingArea(EastTankmin, EastTankmax, 0, 1, 1, 1)
    print("East Tank Scenario successfully blocked!")
else
    print("didn't work removing east tank!")
end
if not DoesScenarioBlockingAreaExist(WestTankmin, WestTankmax) then
    AddScenarioBlockingArea(WestTankmin, WestTankmax, 0, 1, 1, 1)
    print("West Tank Scenario successfully blocked!")
else 
    print("didn't work removing west tank!")
if not DoesScenarioBlockingAreaExist(HangarLazermin, HangarLazermax) then
    AddScenarioBlockingArea(HangarLazermin, HangarLazermax, 0, 1, 1, 1)
    print("Hangar Lazer Scenario successfully blocked!")
else 
    print("didn't work removing hangar lazer!")
end
]]
