local _tableHelper = {
    tbl = {},
}

function _tableHelper:with(tbl)
    self.tbl = tbl
    return self
end

function _tableHelper:count()
    local out = 0

    for _ in ipairs(self.tbl) do
        out = out + 1
    end

    return out
end

function _tableHelper:elem(x)
    for _, v in ipairs(self.tbl) do
        if v == x then
            return true
        end
    end

    return false
end

function _tableHelper:filter(fn)
    local out = {}

    for _, v in ipairs(self.tbl) do
        if fn(v) then
            table.insert(out, v)
        end
    end

    return self:with(out)
end

function _tableHelper:map(fn)
    local out = {}

    for _, v in ipairs(self.tbl) do
        table.insert(out, fn(v))
    end

    return self:with(out)
end

function _tableHelper:max()
    local out = 0

    for _, v in ipairs(self.tbl) do
        v = v > out and v or out
    end

    return v
end

function TableHelper()
    return _tableHelper
end