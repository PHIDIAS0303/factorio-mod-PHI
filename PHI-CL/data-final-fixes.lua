local items = require 'config'
local main = require 'main'

if mods['space-age'] then
    for i=2, settings.startup['PHI-EN-SOLAR-TIER'].value do
        if data.raw.recipe['accumulator-' .. i] then
            data.raw.recipe['accumulator-' .. i].category = 'electronics'
        end

        if data.raw.recipe['solar-panel-' .. i] then
            data.raw.recipe['solar-panel-' .. i].category = 'electronics'
        end
    end
end

for _, v in pairs(items['item']) do
    if v.enabled and (v.max >= v.min) then
        v.category = 'item'

        for j=v.min, v.max, 1 do
            main.EEEC(v, j)
        end
    end
end
