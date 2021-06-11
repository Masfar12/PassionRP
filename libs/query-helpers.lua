--[[
    USAGE:

    exports.libs.QueryHelpers:FUNCTION()
]]--

_queryHelpers = {}

--[[
This function is designed to help query JSON with SQL.

An example usage, is like so:

Let's say we have a database table, named `people` with the following structure

| id | chardata |
| 1  | { "names" : { "first" : "John", "last" : "Doe" } } |

and we want to select the first and last name of all people with the surname "Doe"

We can do:

local sql = exports.libs:QueryHelpers():formatJsonColumns([[
    SELECT  id,
            {{firstName}}   AS first_name,
            {{lastName}}    AS last_name
    FROM    people
    WHERE   {{lastName}} = "@lastNameSearch"
] ], {
    firstName   = {"chardata", "names.first"},
    lastName    = {"chardata", "names.last"},
})

exports.ghmattimysql:execute(sql, {
    ["@lastNameSearch"] = "Doe",
}, function(results)
    -- stuff here
end)
]]--
function _queryHelpers:formatJsonColumns(sql, params)
    local out = sql

    for tpl, data in pairs(params) do
        local col, path = table.unpack(data)

        out             = self:formatTemplate(out, { [tpl] = self:formatJsonColumn(col, path) })
    end

    return out
end

function _queryHelpers:formatJsonColumn(column, path)
    return ('JSON_UNQUOTE(JSON_EXTRACT("%s", "$.%s"))'):format(column, path)
end

function _queryHelpers:formatTemplate(str, vals)
    local out = str

    for tpl, rep in pairs(vals) do
        local search = ("{{%s}}"):format(tpl)
        out          = out:gsub(search, rep)
    end

    return out
end

function QueryHelpers()
    return _queryHelpers
end