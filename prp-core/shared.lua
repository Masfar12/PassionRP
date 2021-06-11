PRPShared           = {}

local StringCharset = {}
local NumberCharset = {}

for i = 48, 57 do
    table.insert(NumberCharset, string.char(i))
end
for i = 65, 90 do
    table.insert(StringCharset, string.char(i))
end
for i = 97, 122 do
    table.insert(StringCharset, string.char(i))
end

PRPShared.RandomStr     = function(length)
    if length > 0 then
        return PRPShared.RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
    else
        return ''
    end
end

PRPShared.RandomInt     = function(length)
    if length > 0 then
        return PRPShared.RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
    else
        return ''
    end
end

PRPShared.SplitStr      = function(str, delimiter)
    local result               = { }
    local from                 = 1
    local delim_from, delim_to = string.find(str, delimiter, from)
    while delim_from do
        table.insert(result, string.sub(str, from, delim_from - 1))
        from                 = delim_to + 1
        delim_from, delim_to = string.find(str, delimiter, from)
    end
    table.insert(result, string.sub(str, from))
    return result
end

PRPShared.Items         = getItems()
PRPShared.Weapons       = getWeapons()
PRPShared.Vehicles      = getVehicles()
PRPShared.VehicleModels = getVehicleHashes()
PRPShared.Jobs          = getJobs()

PRPShared.StarterItems  = {
    ["phone"]          = { amount = 1, item = "phone" },
    ["id_card"]        = { amount = 1, item = "id_card" },
    ["driver_license"] = { amount = 1, item = "driver_license" },
}
