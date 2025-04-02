local items = require 'config'
local main = require 'main'

if mods['space-age'] and settings.startup['PHI-VP'].value and settings.startup['PHI-VP-MAIN'].value then
    local vp = settings.startup['PHI-VP'].value and settings.startup['PHI-VP-MAIN'].value
    local sa = settings.startup['PHI-SA'].value and settings.startup['PHI-SA-GENERIC'].value

    for k, v in pairs(data.raw.recipe) do
        if vp and v.category == 'recycling' then
            data.raw.recipe[k] = nil
        end

        if (vp or sa) and v.maximum_productivity then
            v.maximum_productivity = nil
        end
    end
end

if mods['space-age'] then
    for i=2, settings.startup['PHI-MB-ENERGY-SOLAR-TIER'].value do
        if data.raw.recipe['accumulator-' .. i] then
            data.raw.recipe['accumulator-' .. i].category = 'electronics'
        end

        if data.raw.recipe['solar-panel-' .. i] then
            data.raw.recipe['solar-panel-' .. i].category = 'electronics'
        end
    end
end

--[[
for _, v in pairs(items['item']) do
    if v.enabled and (v.max >= v.min) then
        v.category = 'item'

        for j=v.min, v.max, 1 do
            main.EEEC(v, j)
        end
    end
end
]]
