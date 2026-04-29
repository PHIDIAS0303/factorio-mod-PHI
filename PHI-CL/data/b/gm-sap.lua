local items = require 'config'

-- GM-SAP C 2 SPACE_AGE RESOURCE
data.raw.resource['lithium-brine'].infinite = true
data.raw.resource['lithium-brine'].minimum = math.max(60000, data.raw.resource['lithium-brine'].minimum or 0)
data.raw.resource['lithium-brine'].normal = math.max(300000, data.raw.resource['lithium-brine'].normal or 0)
data.raw.resource['lithium-brine'].infinite_depletion_amount = math.min(10, data.raw.resource['lithium-brine'].infinite_depletion_amount or 999)
data.raw.resource['fluorine-vent'].minimum = math.max(60000, data.raw.resource['fluorine-vent'].minimum or 0)
data.raw.resource['fluorine-vent'].normal = math.max(300000, data.raw.resource['fluorine-vent'].normal or 0)

-- GM-SAP C 16 SPACE_AGE ENTITY
for _, asteroid in pairs(data.raw['asteroid']) do
    if asteroid.dying_trigger_effect then
        for _, trigger in pairs(asteroid.dying_trigger_effect) do
            if trigger.type == 'create-asteroid-chunk' then
                trigger.probability = (trigger.probability or 1) / 4
            end
        end
    end

    for _, r in pairs(asteroid.resistances) do
        r.percent = (r.percent > 98 and 98) or r.percent
    end
end

-- GM-SAP C 4 SPACE_AGE ENTITY
for _, chunk in pairs({'carbonic-asteroid-chunk', 'metallic-asteroid-chunk', 'promethium-asteroid-chunk', 'oxide-asteroid-chunk'}) do
    data.raw['asteroid-chunk'][chunk].minable.count = (data.raw['asteroid-chunk'][chunk].minable.count or 1) * 4
    data.raw.item[chunk].stack_size = data.raw['inserter']['stack-inserter'].max_belt_stack_size
end

-- GM-SAP A 2 SPACE_AGE RESEARCH_EFFECT
table.insert(data.raw.technology['cryogenic-science-pack'].effects, {type = 'unlock-space-location', space_location = 'solar-system-edge'})
table.insert(data.raw.technology['cryogenic-science-pack'].effects, {type = 'unlock-space-location', space_location = 'shattered-planet'})

-- GM-SAP C 1 BASE ENTITY
-- GM-SAP C 1 SPACE_AGE ENTITY
for _, v in pairs(data.raw.lab) do
    v.inputs = {'automation-science-pack', 'logistic-science-pack', 'military-science-pack', 'chemical-science-pack', 'production-science-pack', 'utility-science-pack', 'space-science-pack', 'agricultural-science-pack', 'cryogenic-science-pack', 'electromagnetic-science-pack', 'metallurgic-science-pack'}
end

-- GM-SAP A 1 BASE RESEARCH
data:extend({{
    type = 'technology',
    name = 'cargo-landing-pad',
    prerequisites = {'space-science-pack'},
    effects = {{type = 'cargo-landing-pad-count', modifier = 1}},
    unit = {count_formula = '1000 * L', ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}, time = 60},
    icons = {{icon = '__base__/graphics/technology/rocket-silo.png', icon_size = 256}, {icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png', icon_size = 128, scale = 0.5, shift = {50, 50}}},
    order = 'a-i-a',
    max_level = 'infinite',
    upgrade = true,
    localised_name = {'entity-name.cargo-landing-pad'}
}})
