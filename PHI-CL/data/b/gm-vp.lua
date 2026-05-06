local items = require('gm-vp-c')
local item_sounds = require('__base__/prototypes/item_sounds')
local mod_tint = {
    [2] = {r=140, g=142, b=200},
    [3] = {r=242, g=161, b=26},
    [4] = {r=255, g=254, b=42},
    [5] = {r=54, g=228, b=255},
    [6] = {r=253, g=0, b=97},
    [7] = {r=0, g=209, b=102},
    [8] = {r=233, g=63, b=233}
}

if not mods['space-age'] then
    return
end

-- GM-VP C 33 BASE ENTITY
-- GM-VP C 6 ELEVATED_RAILS ENTITY
-- GM-VP C 14 SPACE_AGE ENTITY
for k, v in pairs(items['entity_surface_conditions']) do
    data.raw[v][k].surface_conditions = nil
end

-- GM-VP C 1 BASE UTILITY_CONSTANTS
data.raw['utility-constants'].default.default_pipeline_extent = math.max(settings.startup['PHI-MI-PIPE-EXTENT'].value, 960)

-- GM-VP C 5 BASE ENTITY
-- GM-VP C 1 SPACE_AGE ENTITY
local bss = (data.raw['inserter']['stack-inserter'] and data.raw['inserter']['stack-inserter'].max_belt_stack_size) or 1

for _, v in pairs(data.raw['inserter']) do
    v.max_belt_stack_size = bss
    v.grab_less_to_match_belt_stack = true
    v.enter_drop_mode_if_held_stack_spoiled = true
end

-- GM-VP C 1 BASE RESEARCH_EFFECT
if data.raw.technology['rocket-silo'] then
    data.raw.technology['rocket-silo'].effects = {{type = 'unlock-recipe', recipe = 'rocket-silo'}, {type = 'unlock-recipe', recipe = 'rocket-part'}, {type = 'unlock-recipe', recipe = 'cargo-landing-pad'}, {type = 'unlock-recipe', recipe = 'cargo-bay'}}
end

-- GM-VP C 1 BASE TOOL
if data.raw.tool['space-science-pack'] then
    data.raw.tool['space-science-pack'].rocket_launch_products = {{type = 'item', name = 'raw-fish', amount = 1}}
    data.raw.tool['space-science-pack'].send_to_orbit_mode = 'automated'
end

-- GM-VP C 1 BASE ENTITY
if data.raw['rocket-silo'] and data.raw['rocket-silo']['rocket-silo'] then
    data.raw['rocket-silo']['rocket-silo'].launch_to_space_platforms = false
    data.raw['rocket-silo']['rocket-silo'].rocket_parts_required = 100
    data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size = 1
    data.raw['rocket-silo']['rocket-silo'].logistic_trash_inventory_size = 0
end

-- GM-VP C 1 BASE ENTITY
if data.raw['rocket-silo-rocket'] and data.raw['rocket-silo-rocket']['rocket-silo-rocket'] then
    data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size = 0
end

-- GM-VP A 2 BASE RECIPE
data:extend({
    {
        type = 'item',
        name = 'satellite',
        icon = '__base__/graphics/icons/satellite.png',
        subgroup = 'space-related',
        order = 'd[rocket-parts]-e[satellite]',
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        stack_size = 1,
        weight = 1 * tons,
        rocket_launch_products = {{type = 'item', name = 'space-science-pack', amount = 1000}},
        send_to_orbit_mode = 'automated'
    },
    {
        type = 'recipe',
        name = 'satellite',
        energy_required = 5,
        enabled = false,
        category = 'crafting',
        ingredients = {{type = 'item', name = 'low-density-structure', amount = 100}, {type = 'item', name = 'solar-panel', amount = 100}, {type = 'item', name = 'accumulator', amount = 100}, {type = 'item', name = 'radar', amount = 5}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'rocket-fuel', amount = 50}},
        results = {{type = 'item', name = 'satellite', amount = 1}},
        requester_paste_multiplier = 1
    }
})

-- GM-VP A 1 BASE ITEM,ENTITY,RECIPE,RESEARCH_EFFECT
do
    local item = table.deepcopy(data.raw['item']['steel-chest'])
    item.name = 'proxy-cargo-landing-chest'
    item.place_result = item.name
    item.order = 'c[cargo-landing-pad]-2'
    item.icons = {{icon = item.icon or '__base__/graphics/icons/cargo-landing-pad.png', tint = mod_tint[5], icon_size = item.icon_size or 64, icon_mipmaps = item.icon_mipmaps or 4}}
    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.localised_name = {'phi-cl.combine', {'entity-name.cargo-landing-pad'}, ' (II)'}
    item.localised_description = {'entity-description.cargo-landing-pad'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['container']['steel-chest'])
    entity.name = item.name
    entity.minable.result = item.name
    entity.type = 'proxy-container'
    entity.picture.layers[1].tint = mod_tint[5]
    entity.flags = {'placeable-player', 'player-creation', 'no-automated-item-insertion', 'hide-alt-info'}
    entity.localised_name = {'phi-cl.combine', {'entity-name.cargo-landing-pad'}, ' (II)'}
    entity.localised_description = {'entity-description.cargo-landing-pad'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = item.name,
        energy_required = 2,
        enabled = (data.raw.technology['rocket-silo'] and false) or true,
        ingredients = {{type = 'item', name = 'steel-chest', amount = 1}},
        results = {{type = 'item', name = item.name, amount = 1}},
        main_product = item.name
    }})

    if data.raw.technology['rocket-silo'] then
        table.insert(data.raw.technology['rocket-silo'].effects, {type = 'unlock-recipe', recipe = 'proxy-cargo-landing-chest'})
    end
end

-- GM-VP A 9 BASE RESEARCH
for _, v in pairs({'concrete', 'automation', 'electronics', 'advanced-circuit', 'engine', 'sulfur-processing', 'solar-energy', 'railway', 'oil-processing'}) do
    data:extend({{
        type = 'technology',
        name = v .. '-productivity',
        prerequisites = {'electromagnetic-plant'},
        effects = {{type = 'change-recipe-productivity', recipe = v, change = 0.05}},
        unit = {count_formula = '1000 * (1.5 ^ (L - 1))', ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}, time = 60},
        icons = {{icon = '__base__/graphics/technology/' .. v ..'.png', icon_size = 256}, {icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png', icon_size = 128, scale = 0.5, shift = {50, 50}}},
        order = 'a-i-d',
        max_level = 10,
        upgrade = true,
        localised_name = {'technology-name.' .. v}
    }})
end

table.insert(data.raw.technology['concrete-productivity'].prerequisites, 'landfill')
table.insert(data.raw.technology['solar-energy-productivity'].prerequisites, 'electric-energy-accumulators')
table.insert(data.raw.technology['sulfur-processing-productivity'].prerequisites, 'cliff-explosives')
data.raw.technology['concrete-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'refined-concrete', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'landfill', change = 0.05}}
data.raw.technology['engine-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'engine-unit', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'electric-engine-unit', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'flying-robot-frame', change = 0.05}}
data.raw.technology['oil-processing-productivity'].prerequisites = {'cryogenic-plant'}
data.raw.technology['oil-processing-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'basic-oil-processing', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'advanced-oil-processing', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'coal-liquefaction', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'lubricant', change = 0.05}}
data.raw.technology['sulfur-processing-productivity'].prerequisites = {'cryogenic-plant'}
data.raw.technology['sulfur-processing-productivity'].effects[1].recipe = 'sulfur'
data.raw.technology['sulfur-processing-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'sulfur', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'sulfuric-acid', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'explosives', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'cliff-explosives', change = 0.05}}
data.raw.technology['electronics-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'electronic-circuit', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'copper-cable', change = 0.05}}
data.raw.technology['solar-energy-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'solar-panel', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'accumulator', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'battery', change = 0.05}}
data.raw.technology['railway-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'rail', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'iron-stick', change = 0.05}}
data.raw.technology['automation-productivity'].prerequisites[1] = 'logistics-2'
data.raw.technology['automation-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'pipe', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'iron-gear-wheel', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'barrel', change = 0.05}}
data.raw.technology['automation-productivity'].icons[1].icon = '__base__/graphics/technology/automation-2.png'
data.raw.technology['automation-productivity'].localised_name = {'phi-cl.combine', {'technology-name.automation'}, ''}

-- GM-VP C 7 SPACE_AGE RESEARCH
for _, v in pairs({'processing-unit-productivity', 'steel-plate-productivity', 'low-density-structure-productivity', 'plastic-bar-productivity', 'rocket-fuel-productivity', 'rocket-part-productivity', 'research-productivity'}) do
    if data.raw.technology[v] then
        data.raw.technology[v].unit.count_formula = '1000 * (1.5 ^ (L - 1))'
        data.raw.technology[v].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        data.raw.technology[v].max_level = 10
    end
end

-- GM-VP C 1 SPACE_AGE RESEARCH
if data.raw.technology['research-productivity'] then
    data.raw.technology['research-productivity'].unit.count_formula = '1500 * (1.5 ^ L)'
    data.raw.technology['research-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
end

-- GM-VP A 1 SPACE_AGE RESEARCH_EFFECT
if data.raw.technology['automation'] and data.raw.technology['automation'].effects then
    table.insert(data.raw.technology['automation'].effects, {type = 'create-ghost-on-entity-death', modifier = true})
end

-- GM-VP C 9 BASE RESEARCH
-- GM-VP C 14 SPACE_AGE RESEARCH
for k, v in pairs(items['technology_reform']) do
    if data.raw.technology[k] then
        if v.prerequisites then
            data.raw.technology[k].prerequisites = v.prerequisites
        end

        if v.unit then
            data.raw.technology[k].unit = v.unit
        end

        if v.effects then
            data.raw.technology[k].effects = v.effects
        end
    end
end

data.raw.technology['stronger-explosives-5'].prerequisites = {'stronger-explosives-4'}
data.raw.technology['stronger-explosives-5'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['stronger-explosives-6'].prerequisites = {'stronger-explosives-5'}
data.raw.technology['stronger-explosives-6'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['stronger-explosives-7'].prerequisites = {'stronger-explosives-6'}
data.raw.technology['stronger-explosives-7'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['refined-flammables-6'].prerequisites = {'refined-flammables-5'}
data.raw.technology['refined-flammables-6'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['refined-flammables-7'].prerequisites = {'refined-flammables-6'}
data.raw.technology['refined-flammables-7'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['artillery'].prerequisites = {'tank', 'concrete', 'radar'}
data.raw.technology['artillery'].unit.count = 1500
data.raw.technology['artillery'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}}
data.raw.technology['artillery-shell-range-1'].prerequisites = {'artillery', 'space-science-pack'}
data.raw.technology['artillery-shell-range-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['artillery-shell-speed-1'].prerequisites = {'artillery', 'space-science-pack'}
data.raw.technology['artillery-shell-speed-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['railgun'].prerequisites = {'military-4', 'artillery', 'production-science-pack'}
data.raw.technology['railgun'].unit.count = 2500
data.raw.technology['railgun'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['worker-robots-speed-6'].prerequisites = {'worker-robots-speed-5'}
data.raw.technology['worker-robots-speed-6'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['worker-robots-speed-7'].prerequisites = {'worker-robots-speed-6', 'space-science-pack'}
data.raw.technology['worker-robots-speed-7'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['atomic-bomb'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['energy-shield-mk2-equipment'].prerequisites = {'energy-shield-equipment', 'military-4', 'power-armor'}
data.raw.technology['energy-shield-mk2-equipment'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['personal-roboport-mk2-equipment'].prerequisites = {'personal-roboport-equipment'}
data.raw.technology['personal-roboport-mk2-equipment'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['coal-liquefaction'].prerequisites = {'advanced-oil-processing'}
data.raw.technology['coal-liquefaction'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
data.raw.technology['kovarex-enrichment-process'].prerequisites = {'uranium-processing'}
data.raw.technology['kovarex-enrichment-process'].unit = {count = 1500, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
data.raw.technology['fusion-reactor'].prerequisites = {'nuclear-power', 'space-science-pack'}
data.raw.technology['fusion-reactor'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
table.insert(data.raw.technology['fusion-reactor'].effects, {type = 'unlock-recipe', recipe = 'fluoroketone'})
table.insert(data.raw.technology['fusion-reactor'].effects, {type = 'unlock-recipe', recipe = 'fluoroketone-cooling'})
data.raw.technology['fusion-reactor-equipment'].prerequisites = {'fission-reactor-equipment', 'fusion-reactor'}
data.raw.technology['fusion-reactor-equipment'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['battery-mk3-equipment'].prerequisites = {'battery-mk2-equipment'}
data.raw.technology['battery-mk3-equipment'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['rocket-turret'].effects = {{type = 'unlock-recipe', recipe = 'rocket-turret'}}
data.raw.technology['rocket-turret'].prerequisites = {'rocketry', 'stronger-explosives-2', 'processing-unit'}
data.raw.technology['rocket-turret'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}}
data.raw.technology['toolbelt-equipment'].prerequisites = {'power-armor', 'toolbelt'}
data.raw.technology['toolbelt-equipment'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
data.raw.technology['big-mining-drill'].prerequisites = {'electric-mining-drill', 'automation-3'}
data.raw.technology['big-mining-drill'].unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
data.raw.technology['tesla-weapons'].prerequisites = {'military-4', 'processing-unit'}
data.raw.technology['tesla-weapons'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['mech-armor'].prerequisites = {'power-armor-mk2', 'space-science-pack'}
data.raw.technology['mech-armor'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['power-armor-mk2'].prerequisites = {'power-armor', 'military-4', 'speed-module-2', 'efficiency-module-2'}
data.raw.technology['health'].prerequisites = {'utility-science-pack', 'space-science-pack'}
data.raw.technology['health'].unit.ingredients = {{'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['mining-productivity-3'].prerequisites = {'mining-productivity-2', 'production-science-pack', 'utility-science-pack', 'space-science-pack'}
data.raw.technology['mining-productivity-3'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
data.raw.technology['processing-unit-productivity'].prerequisites = {'processing-unit', 'electromagnetic-plant'}
data.raw.technology['processing-unit-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'processing-unit', change = 0.05}}
data.raw.technology['steel-plate-productivity'].prerequisites = {'foundry'}
data.raw.technology['steel-plate-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'steel-plate', change = 0.05}}
data.raw.technology['low-density-structure-productivity'].prerequisites = {'low-density-structure', 'electromagnetic-plant'}
data.raw.technology['low-density-structure-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'low-density-structure', change = 0.05}}
data.raw.technology['plastic-bar-productivity'].prerequisites = {'plastics', 'cryogenic-plant'}
data.raw.technology['plastic-bar-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'plastic-bar', change = 0.05}}
data.raw.technology['rocket-fuel-productivity'].prerequisites = {'rocket-fuel', 'electromagnetic-plant'}
data.raw.technology['rocket-fuel-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'solid-fuel-from-petroleum-gas', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'solid-fuel-from-light-oil', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'solid-fuel-from-heavy-oil', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'rocket-fuel', change = 0.05}}
data.raw.technology['rocket-part-productivity'].prerequisites = {'rocket-silo', 'electromagnetic-plant'}
data.raw.technology['rocket-part-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'rocket-part', change = 0.05}}
data.raw.technology['research-productivity'].prerequisites = {'space-science-pack', 'biolab'}
data.raw.technology['spidertron'].prerequisites = {'exoskeleton-equipment', 'fission-reactor-equipment', 'military-4', 'production-science-pack', 'radar'}
data.raw.technology['spidertron'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['heating-tower'].prerequisites = {'chemical-science-pack'}
data.raw.technology['heating-tower'].effects = {{type = 'unlock-recipe', recipe = 'heating-tower'}}
data.raw.technology['heating-tower'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
data.raw.technology['agriculture'].prerequisites = {'chemical-science-pack'}
data.raw.technology['agriculture'].effects = {{type = 'unlock-recipe', recipe = 'agricultural-tower'}}
data.raw.technology['agriculture'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
data.raw.technology['tree-seeding'].prerequisites = {'agriculture'}
data.raw.technology['tree-seeding'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}

for _, v in pairs({'space-science-pack', 'electromagnetic-plant', 'foundry', 'cryogenic-plant', 'big-mining-drill', 'agriculture', 'heating-tower'}) do
    data.raw.technology[v].research_trigger = nil
end

for _, v in pairs(data.raw.recipe) do
    v.category = nil
    v.surface_conditions = nil

    if items['recipe'][v.name] then
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end

-- TODO: add category to machine instead
data.raw.recipe['big-mining-drill'].ingredients = {{type = 'item', name = 'electric-mining-drill', amount = 1}, {type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electric-engine-unit', amount = 5}, {type = 'item', name = 'advanced-circuit', amount = 10}}
data.raw.recipe['turbo-transport-belt'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'express-transport-belt', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 20}}
data.raw.recipe['turbo-underground-belt'].ingredients = {{type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'express-underground-belt', amount = 2}, {type = 'fluid', name = 'lubricant', amount = 40}}
data.raw.recipe['turbo-splitter'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'express-splitter', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 80}}
data.raw.recipe['stack-inserter'].ingredients = {{type = 'item', name = 'processing-unit', amount = 3}, {type = 'item', name = 'steel-plate', amount = 8}, {type = 'item', name = 'bulk-inserter', amount = 1}}
data.raw.recipe['speed-module-3'].ingredients = {{type = 'item', name = 'advanced-circuit', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'speed-module-2', amount = 4}}
data.raw.recipe['productivity-module-3'].ingredients = {{type = 'item', name = 'advanced-circuit', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'productivity-module-2', amount = 4}}
data.raw.recipe['efficiency-module-3'].ingredients = {{type = 'item', name = 'advanced-circuit', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'efficiency-module-2', amount = 4}}
data.raw.recipe['toolbelt-equipment'].ingredients = {{type = 'item', name = 'advanced-circuit', amount = 3}, {type = 'item', name = 'steel-plate', amount = 4}}
data.raw.recipe['power-armor-mk2'].ingredients = {{type = 'item', name = 'efficiency-module-2', amount = 25}, {type = 'item', name = 'speed-module-2', amount = 25}, {type = 'item', name = 'processing-unit', amount = 60}, {type = 'item', name = 'electric-engine-unit', amount = 40}, {type = 'item', name = 'low-density-structure', amount = 30}}
data.raw.recipe['personal-roboport-mk2-equipment'].ingredients = {{type = 'item', name = 'personal-roboport-equipment', amount = 5}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'low-density-structure', amount = 20}}
data.raw.recipe['battery-mk3-equipment'].ingredients = {{type = 'item', name = 'battery-mk2-equipment', amount = 5}, {type = 'item', name = 'battery', amount = 20}}
data.raw.recipe['artillery-turret'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'concrete', amount = 60}, {type = 'item', name = 'iron-gear-wheel', amount = 40}, {type = 'item', name = 'advanced-circuit', amount = 20}}
data.raw.recipe['artillery-wagon'].ingredients = {{type = 'item', name = 'engine-unit', amount = 64}, {type = 'item', name = 'iron-gear-wheel', amount = 10}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'pipe', amount = 16}, {type = 'item', name = 'advanced-circuit', amount = 20}}
data.raw.recipe['artillery-shell'].ingredients = {{type = 'item', name = 'explosive-cannon-shell', amount = 4}, {type = 'item', name = 'radar', amount = 1}, {type = 'item', name = 'explosives', amount = 8}}
data.raw.recipe['tesla-ammo'].ingredients = {{type = 'item', name = 'battery', amount = 1}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 10}}
data.raw.recipe['teslagun'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
data.raw.recipe['tesla-turret'].ingredients = {{type = 'item', name = 'teslagun', amount = 1}, {type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 500}}
data.raw.recipe['mech-armor'].ingredients = {{type = 'item', name = 'power-armor-mk2', amount = 1}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'battery', amount = 50}}
data.raw.recipe['railgun'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'battery', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 10}}
data.raw.recipe['railgun-turret'].ingredients = {{type = 'item', name = 'steel-plate', amount = 30}, {type = 'item', name = 'processing-unit', amount = 25}, {type = 'item', name = 'battery', amount = 25}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
data.raw.recipe['rocket-turret'].ingredients = {{type = 'item', name = 'rocket-launcher', amount = 4}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'processing-unit', amount = 4}, {type = 'item', name = 'iron-gear-wheel', amount = 20}}
data.raw.recipe['fusion-reactor'].ingredients = {{type = 'item', name = 'nuclear-reactor', amount = 1}, {type = 'item', name = 'steel-plate', amount = 300}, {type = 'item', name = 'processing-unit', amount = 400}}
data.raw.recipe['fusion-generator'].ingredients = {{type = 'item', name = 'steam-turbine', amount = 1}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'processing-unit', amount = 200}}
data.raw.recipe['fusion-power-cell'].ingredients = {{type = 'item', name = 'steel-plate', amount = 20}, {type = 'fluid', name = 'petroleum-gas', amount = 200}}
data.raw.recipe['fusion-power-cell'].results = {{type = 'item', name = 'fusion-power-cell', amount = 4}}
data.raw.recipe['fusion-reactor-equipment'].ingredients = {{type = 'item', name = 'fission-reactor-equipment', amount = 1}, {type = 'item', name = 'fusion-power-cell', amount = 10}, {type = 'item', name = 'steel-plate', amount = 350}, {type = 'item', name = 'processing-unit', amount = 275}}
data.raw.recipe['fluoroketone'].ingredients = {{type = 'fluid', name = 'light-oil', amount = 50}, {type = 'fluid', name = 'petroleum-gas', amount = 50}, {type = 'item', name = 'steel-plate', amount = 1}}
data.raw.recipe['agricultural-tower'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electronic-circuit', amount = 3}, {type = 'item', name = 'landfill', amount = 1}}
data.raw.recipe['electromagnetic-plant'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'assembling-machine-3', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'fluid', name = 'sulfuric-acid', amount = 60}}
data.raw.recipe['cryogenic-plant'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'chemical-plant', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'fluid', name = 'water', amount = 60}}
data.raw.recipe['biolab'].ingredients = {{type = 'item', name = 'lab', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'item', name = 'processing-unit', amount = 60}, {type = 'item', name = 'uranium-235', amount = 3}}
data.raw.recipe['foundry'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'coal', amount = 60}, {type = 'item', name = 'refined-concrete', amount = 40}, {type = 'item', name = 'electric-furnace', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 60}}





data.raw['agricultural-tower']['agricultural-tower'].energy_source.emissions_per_minute = { pollution = -1 }
data.raw['assembling-machine']['electromagnetic-plant'].effect_receiver = nil
data.raw['assembling-machine']['electromagnetic-plant'].crafting_categories = {table.unpack(data.raw['assembling-machine']['assembling-machine-3'].crafting_categories)}
data.raw['assembling-machine']['electromagnetic-plant'].crafting_speed = 2.5
data.raw['assembling-machine']['electromagnetic-plant'].energy_usage = '872kW'
data.raw['assembling-machine']['electromagnetic-plant'].energy_source.emissions_per_minute.pollution = 4
data.raw['assembling-machine']['foundry'].effect_receiver = nil
data.raw['assembling-machine']['foundry'].crafting_categories = {table.unpack(data.raw['furnace']['electric-furnace'].crafting_categories)}
data.raw['assembling-machine']['foundry'].crafting_speed = 6
data.raw['assembling-machine']['foundry'].energy_usage = '930kW'
data.raw['assembling-machine']['foundry'].energy_source.emissions_per_minute.pollution = 3
data.raw['assembling-machine']['cryogenic-plant'].crafting_categories = {table.unpack(data.raw['assembling-machine']['oil-refinery'].crafting_categories), table.unpack(data.raw['assembling-machine']['chemical-plant'].crafting_categories)}
data.raw['assembling-machine']['cryogenic-plant'].crafting_speed = 3
data.raw['assembling-machine']['cryogenic-plant'].energy_usage = '1302kW'
data.raw['assembling-machine']['cryogenic-plant'].energy_source.emissions_per_minute.pollution = 12
data.raw['lab']['biolab'].science_pack_drain_rate_percent = 100
data.raw['lab']['biolab'].researching_speed = 3
data.raw['lab']['biolab'].energy_usage = '180kW'
data.raw['lab']['biolab'].energy_source.emissions_per_minute = nil
data.raw['electric-turret']['tesla-turret'].energy_source.drain = '250kW'
data.raw['chain-active-trigger']['chain-tesla-turret-chain'].fork_chance = 0.3

data.raw['unit-spawner']['biter-spawner'].captured_spawner_entity = nil
data.raw['unit-spawner']['spitter-spawner'].captured_spawner_entity = nil

for _, v in pairs(data.raw.lab) do
    v.inputs = {'automation-science-pack', 'logistic-science-pack', 'military-science-pack', 'chemical-science-pack', 'production-science-pack', 'utility-science-pack', 'space-science-pack'}
end







for _, v in pairs({'vulcanus', 'gleba', 'fulgora', 'aquilo'}) do
    data.raw.planet[v].map_gen_settings = nil
    data.raw.planet[v].hidden = true
    data.raw.planet[v].hidden_in_factoriopedia = true
    data.raw['change-surface-achievement']['visit-' .. v] = nil
end

for _, v in pairs(data.raw['space-location']) do
    v.hidden = true
    v.hidden_in_factoriopedia = true
end

for _, v in pairs(data.raw['space-connection']) do
    v.hidden = true
    v.hidden_in_factoriopedia = true
end

for _, v in pairs({'platform_science', 'platform_moving', 'platform_messy_nuclear', 'vulcanus_lava_forge', 'vulcanus_crossing', 'vulcanus_punishmnent', 'vulcanus_sulfur_drop', 'gleba_agri_towers', 'gleba_pentapod_ponds', 'gleba_egg_escape', 'gleba_farm_attack', 'gleba_grotto', 'fulgora_city_crossing', 'fulgora_recycling_hell', 'fulgora_nightfall', 'fulgora_race', 'aquilo_send_help', 'aquilo_starter'}) do
    data.raw['utility-constants']['default']['main_menu_simulations'][v] = nil
end

data.raw['dont-build-entity-achievement']['logistic-network-embargo'].research_with = nil
data.raw['create-platform-achievement']['reach-for-the-stars'] = nil
data.raw['complete-objective-achievement']['second-star-to-the-right-and-straight-on-till-morning'] = nil
data.raw['dont-research-before-researching-achievement']['rush-to-space'] = nil

for _, v in pairs({'shattered-planet-1', 'shattered-planet-2', 'shattered-planet-3'}) do
    data.raw['space-connection-distance-traveled-achievement'][v] = nil
end

for _, v in pairs({'calcite', 'fluorine-vent', 'lithium-brine', 'scrap', 'tungsten-ore'}) do
    data.raw.planet['nauvis'].map_gen_settings.autoplace_controls[v:gsub('-', '_')] = nil
    data.raw.planet['nauvis'].map_gen_settings.autoplace_settings.entity.settings[v] = nil
    data.raw.resource[v].hidden = true
    data.raw.resource[v].hidden_in_factoriopedia = true
end

data.raw.resource['sulfuric-acid-geyser'].hidden = true
data.raw.resource['sulfuric-acid-geyser'].hidden_in_factoriopedia = true

for _, v in pairs({'vulcanus_coal', 'tungsten_ore', 'calcite', 'sulfuric_acid_geyser', 'scrap', 'fluorine_vent', 'lithium_brine', 'gleba_stone', 'aquilo_crude_oil', 'gleba_cliff', 'fulgora_cliff', 'vulcanus_volcanism', 'gleba_water', 'gleba_plants', 'gleba_enemy_base', 'fulgora_islands'}) do
    data.raw['autoplace-control'][v].hidden = true
    data.raw['autoplace-control'][v].hidden_in_factoriopedia = true

    -- TODO it will show blackscreen if it is nil
    -- data.raw['autoplace-control'][v] = nil

    local r = v:gsub('_', '-')

    if data.raw['resource'][r] then
        data.raw['resource'][r].autoplace = nil
    end
end

for _, v in pairs({'lichen-decal', 'shroom-decal', 'pink-lichen-decal', 'red-lichen-decal', 'yellow-lettuce-lichen-1x1', 'yellow-lettuce-lichen-3x3', 'yellow-lettuce-lichen-6x6', 'yellow-lettuce-lichen-cups-1x1', 'yellow-lettuce-lichen-cups-3x3', 'yellow-lettuce-lichen-cups-6x6', 'honeycomb-fungus', 'honeycomb-fungus-1x1', 'honeycomb-fungus-decayed', 'green-lettuce-lichen-1x1', 'green-lettuce-lichen-3x3', 'green-lettuce-lichen-6x6', 'green-lettuce-lichen-water-1x1', 'green-lettuce-lichen-water-3x3', 'green-lettuce-lichen-water-6x6', 'split-gill-1x1', 'split-gill-2x2', 'split-gill-dying-1x1', 'split-gill-dying-2x2', 'split-gill-red-1x1', 'split-gill-red-2x2', 'fuchsia-pita', 'wispy-lichen', 'coral-land', 'coral-water', 'black-sceptre', 'pink-phalanges', 'green-cup', 'mycelium', 'veins', 'veins-small', 'brambles', 'blood-grape', 'blood-grape-vibrant', 'brown-cup', 'polycephalum-slime', 'polycephalum-balloon', 'grey-cracked-mud-decal', 'yellow-coral', 'solo-barnacle', 'curly-roots-orange', 'curly-roots-grey', 'pale-lettuce-lichen-cups-1x1', 'pale-lettuce-lichen-cups-3x3', 'pale-lettuce-lichen-cups-6x6', 'pale-lettuce-lichen-1x1', 'pale-lettuce-lichen-3x3', 'pale-lettuce-lichen-6x6', 'pale-lettuce-lichen-water-1x1', 'pale-lettuce-lichen-water-3x3', 'pale-lettuce-lichen-water-6x6', 'matches-small', 'nerve-roots-dense', 'nerve-roots-sparse', 'red-nerve-roots-veins-dense', 'red-nerve-roots-veins-sparse', 'purple-nerve-roots-veins-dense', 'purple-nerve-roots-veins-sparse', 'cream-nerve-roots-veins-dense', 'cream-nerve-roots-veins-sparse', 'white-carpet-grass', 'barnacles-decal', 'coral-stunted-grey', 'coral-stunted', 'gleba-spawner-slime', 'knobbly-roots', 'knobbly-roots-orange', 'fulgoran-ruin-tiny', 'fulgoran-gravewort', 'urchin-cactus', 'medium-fulgora-rock', 'small-fulgora-rock', 'tiny-fulgora-rock', 'aqulio-ice-decal-blue', 'aqulio-snowy-decal', 'floating-iceberg-large', 'floating-iceberg-small', 'lithium-iceberg-medium', 'lithium-iceberg-small', 'lithium-iceberg-tiny', 'snow-drift-decal', 'v-green-hairy-grass', 'v-brown-hairy-grass', 'v-brown-carpet-grass', 'v-red-pita', 'vulcanus-rock-decal-large', 'vulcanus-crack-decal', 'vulcanus-crack-decal-large', 'vulcanus-crack-decal-huge-warm', 'vulcanus-crack-decal-warm', 'calcite-stain', 'calcite-stain-small', 'sulfur-stain', 'sulfur-stain-small', 'sulfuric-acid-puddle', 'sulfuric-acid-puddle-small', 'crater-small', 'crater-large', 'pumice-relief-decal', 'vulcanus-sand-decal', 'vulcanus-dune-decal', 'waves-decal', 'medium-volcanic-rock', 'small-volcanic-rock', 'tiny-volcanic-rock', 'tiny-rock-cluster', 'small-sulfur-rock', 'tiny-sulfur-rock', 'sulfur-rock-cluster', 'vulcanus-lava-fire'}) do
    data.raw['optimized-decorative'][v].autoplace = nil
end

data.raw['lightning-attractor']['fulgoran-ruin-attractor'].autoplace = nil

for _, v in pairs({'ashland-lichen-tree', 'ashland-lichen-tree-flaming', 'cuttlepop', 'slipstack', 'funneltrunk', 'hairyclubnub', 'teflilly', 'lickmaw', 'stingfrond', 'boompuff', 'sunnycomb', 'water-cane'}) do
    data.raw['tree'][v].autoplace = nil
end

for _, v in pairs({'yumako-tree', 'jellystem'}) do
    data.raw['plant'][v].autoplace = nil
end

for _, v in pairs({'natural-yumako-soil', 'natural-jellynut-soil', 'wetland-yumako', 'wetland-jellynut', 'lowland-brown-blubber', 'lowland-olive-blubber', 'lowland-olive-blubber-2', 'lowland-olive-blubber-3', 'lowland-cream-red', 'lowland-red-vein', 'lowland-red-vein-2', 'lowland-red-vein-3', 'lowland-red-vein-4', 'lowland-red-vein-dead', 'lowland-red-infection', 'ammoniacal-ocean', 'ammoniacal-ocean-2'}) do
    data.raw['planet']['nauvis'].map_gen_settings.autoplace_settings.tile.settings[v] = nil
end

for k, v in pairs(items['technology']) do
    if data.raw.technology[k] then
        data.raw.technology[k].hidden = v
        data.raw.technology[k].hidden_in_factoriopedia = v
        data.raw.technology[k].effects = nil

        if data.raw.technology[k].research_trigger then
            data.raw.technology[k].research_trigger = nil
            data.raw.technology[k].unit = {count = 1000, time = 30, ingredients = {{'automation-science-pack', 1}}}
        end

        if data.raw.technology[k].unit and data.raw.technology[k].unit.ingredients then
            data.raw.technology[k].unit.ingredients = {{'space-science-pack', 1}}
        end
    end
end

for k, v in pairs(items['item']) do
    if data.raw.item[k] then
        data.raw.item[k].hidden = v
        data.raw.item[k].hidden_in_factoriopedia = v
    end
end

for k, v in pairs(items['hidden_data']) do
    if data.raw[v] and data.raw[v][k] then
        data.raw[v][k].hidden = true
        data.raw[v][k].hidden_in_factoriopedia = true
    end
end

for _, v in pairs({'lithium-brine', 'fluorine', 'ammonia', 'ammoniacal-solution', 'electrolyte', 'holmium-solution', 'molten-copper', 'molten-iron', 'lava'}) do
    data.raw.fluid[v].hidden = true
    data.raw.fluid[v].hidden_in_factoriopedia = true
end

for _, v in pairs(data.raw['tile']) do
    if v.subgroup and (v.subgroup == 'vulcanus-tiles' or v.subgroup == 'gleba-tiles' or v.subgroup == 'gleba-water-tiles' or v.subgroup == 'fulgora-tiles' or v.subgroup == 'aquilo-tiles') then
        v.autoplace = nil
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end

for _, v in pairs({'cliff-fulgora', 'cliff-gleba', 'cliff-vulcanus', 'crater-cliff'}) do
    data.raw['cliff'][v].hidden = true
    data.raw['cliff'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-wriggler-pentapod-premature', 'medium-wriggler-pentapod-premature', 'big-wriggler-pentapod-premature'}) do
    data.raw['unit'][v].absorptions_to_join_attack = {pollution = 0}
    data.raw['unit'][v].hidden = true
    data.raw['unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-wriggler-pentapod', 'medium-wriggler-pentapod', 'big-wriggler-pentapod'}) do
    data.raw['unit'][v].absorptions_to_join_attack = {pollution = 2}
    data.raw['unit'][v].hidden = true
    data.raw['unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-strafer-pentapod', 'medium-strafer-pentapod', 'big-strafer-pentapod'}) do
    data.raw['spider-unit'][v].absorptions_to_join_attack = {pollution = 20}
    data.raw['spider-unit'][v].hidden = true
    data.raw['spider-unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-stomper-pentapod', 'medium-stomper-pentapod', 'big-stomper-pentapod'}) do
    data.raw['spider-unit'][v].absorptions_to_join_attack = {pollution = 25}
    table.remove(data.raw['spider-unit'][v].dying_trigger_effect, 1)
    data.raw['spider-unit'][v].hidden = true
    data.raw['spider-unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'gleba-spawner', 'gleba-spawner-small'}) do
    data.raw['unit-spawner'][v].loot = nil
    data.raw['unit-spawner'][v].collision_mask = nil
    data.raw['unit-spawner'][v].autoplace = nil
    data.raw['unit-spawner'][v].hidden = true
    data.raw['unit-spawner'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-demolisher', 'medium-demolisher', 'big-demolisher'}) do
    data.raw['segmented-unit'][v].hidden = true
    data.raw['segmented-unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'bioflux', 'jelly', 'jellynut', 'yumako', 'yumako-mash'}) do
    data.raw['capsule'][v].hidden = true
    data.raw['capsule'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-stomper-shell', 'medium-stomper-shell', 'big-stomper-shell', 'big-volcanic-rock', 'huge-volcanic-rock', 'copper-stromatolite', 'iron-stromatolite', 'vulcanus-chimney-short', 'vulcanus-chimney-truncated', 'vulcanus-chimney', 'vulcanus-chimney-cold', 'vulcanus-chimney-faded', 'big-fulgora-rock', 'fulgurite', 'fulgurite-small', 'fulgoran-ruin-small', 'fulgoran-ruin-medium', 'fulgoran-ruin-stonehenge', 'fulgoran-ruin-big', 'fulgoran-ruin-colossal', 'fulgoran-ruin-huge', 'fulgoran-ruin-vault', 'lithium-iceberg-big', 'lithium-iceberg-huge', 'small-demolisher-corpse', 'medium-demolisher-corpse', 'big-demolisher-corpse'}) do
    data.raw['simple-entity'][v].autoplace = nil
    data.raw['simple-entity'][v].hidden = true
    data.raw['simple-entity'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'ashland-lichen-tree', 'ashland-lichen-tree-flaming', 'slipstack', 'funneltrunk', 'hairyclubnub', 'teflilly', 'lickmaw', 'stingfrond', 'boompuff', 'sunnycomb', 'cuttlepop', 'water-cane'}) do
    data.raw['tree'][v].hidden = true
    data.raw['tree'][v].hidden_in_factoriopedia = true
end

data.raw.ammo['capture-robot-rocket'].hidden = true
data.raw.ammo['capture-robot-rocket'].hidden_in_factoriopedia = true

data.raw['tips-and-tricks-item']['agriculture'] = nil
data.raw['tips-and-tricks-item']['lava-processing'] = nil

for _, v in pairs({'research-with-metallurgics', 'research-with-agriculture', 'research-with-electromagnetics', 'research-with-cryogenics', 'research-with-promethium'}) do
    data.raw['research-with-science-pack-achievement'][v] = nil
end

data.raw['group-attack-achievement']['it-stinks-and-they-do-like-it'] = nil
data.raw['group-attack-achievement']['get-off-my-lawn'] = nil
data.raw['kill-achievement']['if-it-bleeds'] = nil
data.raw['kill-achievement']['we-need-bigger-guns'] = nil
data.raw['kill-achievement']['size-doesnt-matter'] = nil

for _, v in pairs(data.raw.tree) do
    if v.minable and v.minable.results then
        v.minable.results = {{type = 'item', name = 'wood', amount = 4}}
    end
end

data.raw['tile']['empty-space'].hidden = true
data.raw['tile']['empty-space'].hidden_in_factoriopedia = true
data.raw['tile']['space-platform-foundation'].hidden = true
data.raw['tile']['space-platform-foundation'].hidden_in_factoriopedia = true
data.raw['tile']['foundation'].hidden = true
data.raw['tile']['foundation'].hidden_in_factoriopedia = true

for _, v in pairs({'carbonic', 'metallic', 'promethium', 'oxide'}) do
    data.raw.item[v .. '-asteroid-chunk'].hidden = true
    data.raw.item[v .. '-asteroid-chunk'].hidden_in_factoriopedia = true
end

for _, a in pairs({'asteroid', 'asteroid-chunk'}) do
    for _, v in pairs(data.raw[a]) do
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end

for _, v in pairs({'thruster-oxidizer', 'thruster-fuel'}) do
    data.raw.fluid[v].hidden = true
    data.raw.fluid[v].hidden_in_factoriopedia = true
end
