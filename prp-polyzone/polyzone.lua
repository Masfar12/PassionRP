local DEBUG_ENABLED = false
local comboZone = nil
local insideZone = false
local createdZones = {}

local function addToComboZone(zone)
    if comboZone ~= nil then
        comboZone:AddZone(zone)
    else
        comboZone = ComboZone:Create({ zone }, { name = "prp-polyzone" })
        comboZone:onPlayerInOutExhaustive(function(isPointInside, point, insideZones, enteredZones, leftZones)
            if leftZones ~= nil then
                for i = 1, #leftZones do
                    TriggerEvent("prp-polyzone:exit", leftZones[i].name)
                end
            end
            if enteredZones ~= nil then
                for i = 1, #enteredZones do
                    TriggerEvent("prp-polyzone:enter", enteredZones[i].name, enteredZones[i].data, enteredZones[i].center)
                end
            end
        end, 500)
    end
end
local toggle = false

Citizen.CreateThread(function()
    while true do
        if toggle then
            comboZone:draw()
            Wait(0)
        else
            Wait(250)
        end

    end
end)

RegisterCommand('drawpoly',function(source,args)
        toggle = not toggle
end)
RegisterCommand('debugpoly', function()
    comboZone:printInfo()
end)

local function doCreateZone(options)
    if options.data and options.data.name then
        local key = options.name .. "_" .. tostring(options.data.name)
        if not createdZones[key] then
            createdZones[key] = true
            return true
        else
            print('polyzone with name/id already added, skipping: ', key)
            return false
        end
    end
    return true
end

-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function tprint (tbl, indent)
    if not indent then indent = 0 end
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            tprint(v, indent+1)
        elseif type(v) == 'boolean' then
            print(formatting .. tostring(v))
        else
            print(formatting .. v)
        end
    end
end

exports("AddBoxZone", function(name, vectors, length, width, options)
    if not options then options = {} end
    options.name = name
    options.debugPoly = DEBUG_ENABLED or options.debugPoly
    if not doCreateZone(options) then return end
    local boxCenter = type(vectors) ~= 'vector3' and vector3(vectors.x, vectors.y, vectors.z) or vectors
    local zone = BoxZone:Create(boxCenter, length, width, options)
    addToComboZone(zone)
end)

local function addCircleZone(name, center, radius, options)
    if not options then options = {} end
    options.name = name
    options.debugPoly = DEBUG_ENABLED or options.debugPoly
    if not doCreateZone(options) then return end
    local circleCenter = type(center) ~= 'vector3' and vector3(center.x, center.y, center.z) or center
    local zone = CircleZone:Create(circleCenter, radius, options)
    addToComboZone(zone)
end
exports("AddCircleZone", addCircleZone)

exports("AddPolyZone", function(name, vectors, options)
    if not options then options = {} end
    options.name = name
    options.debugPoly = DEBUG_ENABLED or options.debugPoly
    if not doCreateZone(options) then return end
    local zone = PolyZone:Create(vectors, options)
    addToComboZone(zone)
end)

RegisterNetEvent("prp-polyzone:createCircleZone")
AddEventHandler("prp-polyzone:createCircleZone", function(name, ...)
    addCircleZone(name, ...)
end)
