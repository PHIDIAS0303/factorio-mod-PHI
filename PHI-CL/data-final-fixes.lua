-- local items = require 'config'
-- local main = require 'main'

do
    local sa = settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'SAP'
    local p = (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP') or sa

    for k, v in pairs(data.raw.recipe) do
        if (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP') and v.category == 'recycling' then
            data.raw.recipe[k] = nil
        end

        if p and v.maximum_productivity then
            v.maximum_productivity = nil
        end
    end

    for _, v in pairs(data.raw['lamp']) do
        if v.light then
            v.light.color = {1, 1, 1}
            v.light_when_colored.color = {1, 1, 1}
        end
    end

    for _, v in pairs(data.raw['land-mine']) do
        if v.flags then
            for fk, fv in ipairs(v.flags) do
                if fv == 'placeable-off-grid' then
                    table.remove(v.flags, fk)
                    break
                end
            end
        end
    end
end

if mods['space-age'] then
    for i=2, settings.startup['PHI-MB-ENERGY-POWER-TIER'].value do
        if data.raw.recipe['accumulator-' .. i] then
            data.raw.recipe['accumulator-' .. i].category = 'electronics'
        end

        if data.raw.recipe['solar-panel-' .. i] then
            data.raw.recipe['solar-panel-' .. i].category = 'electronics'
        end
    end

    data.raw['bool-setting']['PHI-MB-EQUIPMENT-ARMOR'].localised_description = {'', '[item=power-armor-mk2] 3, [item=mech-armor] 2'}
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
