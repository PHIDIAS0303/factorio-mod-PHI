--[[
local inserter_direction = {
    [1] = defines.direction.north,
    [2] = defines.direction.northnortheast,
    [3] = defines.direction.northeast,
    [4] = defines.direction.eastnortheast,
    [5] = defines.direction.east,
    [6] = defines.direction.eastsoutheast,
    [7] = defines.direction.southeast,
    [8] = defines.direction.southsoutheast,
    [9] = defines.direction.south,
    [10] = defines.direction.southsouthwest,
    [11] = defines.direction.southwest,
    [12] = defines.direction.westsouthwest,
    [13] = defines.direction.west,
    [14] = defines.direction.westnorthwest,
    [15] = defines.direction.northwest,
    [16] = defines.direction.northnorthwest,
}

local inserter_direction_reversed = {}

for k, v in pairs(inserter_direction) do
    inserter_direction_reversed[v] = k
end
]]
