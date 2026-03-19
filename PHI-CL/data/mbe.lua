local items = require 'config'

-- MBE C 1 FLUID
data.raw['fluid']['steam'].max_temperature = ((settings.startup['PHI-MB-ENERGY-POWER-TIER'].value > 1) and 5000) or data.raw['fluid']['steam'].max_temperature

-- MBE A 7 RESEARCH
for i = 1, 7 do
    data:extend({{
        type = 'technology',
        name = 'compound-energy-' .. i,
        enabled = (i <= tonumber(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value)),
        prerequisites = ((i > 1) and {'compound-energy-' .. (i - 1)}) or {'solar-energy', 'advanced-circuit', 'electric-energy-accumulators'},
        effects = {},
        upgrade = true,
        unit = {count = math.floor(125 * (i ^ 2)), ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}, time = 30},
        icons = {{icon = '__base__/graphics/technology/solar-energy.png', icon_size = 256, tint = items['tint'][i]}},
        order = 'a-h-' .. i,
        localised_name = {'phi-cl.combine', {'technology-name.compound-energy'}, tostring(i)},
        localised_description = {'technology-description.compound-energy'}
    }})
end
