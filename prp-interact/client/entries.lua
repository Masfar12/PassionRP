Entries = {}

function pushEntries()
    Citizen.CreateThread(function()
        local lookupTable = {
            flag       = function(x)
                AddPeekEntryByFlag(x.group, x.data, x.options)
            end,
            model      = function(x)
                AddPeekEntryByModel(x.group, x.data, x.options)
            end,
            entity     = function(x)
                AddPeekEntryByEntityType(x.group, x.data, x.options)
            end,
            polytarget = function(x)
                AddPeekEntryByPolyTarget(x.group, x.data, x.options)
            end,
        }

        for _, entry in ipairs(Entries) do
            local fn = lookupTable[entry.type]
            if fn ~= nil then
                fn(entry)
            end
        end
    end)
end

function addEntry(entry)
    table.insert(Entries, entry)
end