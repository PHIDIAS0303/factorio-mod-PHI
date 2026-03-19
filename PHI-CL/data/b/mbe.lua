local param = require 'config'
local main = require 'main'
local items = require 'mbe-c'

-- MBE C 1 BASE FLUID
data.raw['fluid']['steam'].max_temperature = ((settings.startup['PHI-MB-ENERGY-POWER-TIER'].value > 1) and 5000) or data.raw['fluid']['steam'].max_temperature

-- MBE A 7 BASE RESEARCH
for i = 1, 7 do
    data:extend({{
        type = 'technology',
        name = 'compound-energy-' .. i,
        enabled = (i <= tonumber(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value)),
        prerequisites = ((i > 1) and {'compound-energy-' .. (i - 1)}) or {'solar-energy', 'advanced-circuit', 'electric-energy-accumulators'},
        effects = {},
        upgrade = true,
        unit = {count = math.floor(125 * (i ^ 2)), ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}, time = 30},
        icons = {{icon = '__base__/graphics/technology/solar-energy.png', icon_size = 256, tint = param['tint'][i]}},
        order = 'a-h-' .. i,
        localised_name = {'phi-cl.combine', {'technology-name.compound-energy'}, tostring(i)},
        localised_description = {'technology-description.compound-energy'}
    }})
end

-- MBE A 38 BASE ENTITY,RECIPE,RESEARCH_EFFECT
-- MBE A 12 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
for _, v in pairs(items) do
    v.mod = v.mod or 'base'
    v.min = v.min or 2

    if (v.mod and mods[v.mod]) and (v.max >= v.min) then
        v.category = v.category or 'item'
        v.ref_name = v.ref_name or v.name
        v.tech = v.tech or 'compound-energy'

        for j=v.min, v.max, 1 do
            main.EEE(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end

        main.EL(v)
    end
end
