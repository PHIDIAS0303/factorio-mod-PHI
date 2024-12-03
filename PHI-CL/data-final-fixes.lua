local items = require 'config'
local main = require 'main'

if mods['space-age'] then
    for i=2, settings.startup['PHI-EN-SOLAR-TIER'].value do
        data.raw.recipe['accumulator-' .. i].category = 'electronics'
        data.raw.recipe['solar-panel-' .. i].category = 'electronics'
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
