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

-- GM-VP C 26 BASE RESEARCH
-- GM-VP C 35 SPACE_AGE RESEARCH
if items['technology_reform'] then
    for k, v in pairs(items['technology_reform']) do
        if data.raw.technology[k] then
            data.raw.technology[k].prerequisites = (v.prerequisites and v.prerequisites) or data.raw.technology[k].prerequisites
            data.raw.technology[k].unit = (v.unit and v.unit) or data.raw.technology[k].unit
            data.raw.technology[k].effects = (v.effects and v.effects) or data.raw.technology[k].effects

            if data.raw.technology[k].unit then
                data.raw.technology[k].unit.count = (v.unit_count and v.unit_count) or data.raw.technology[k].unit.count
                data.raw.technology[k].unit.ingredients = (v.unit_ingredients and v.unit_ingredients) or data.raw.technology[k].unit.ingredients
            end
        end
    end
end

-- GM-VP H 38 SPACE_AGE RESEARCH
if items['technology'] then
    for _, v in pairs(items['technology']) do
        if data.raw.technology[v] then
            data.raw.technology[v].hidden = true
            data.raw.technology[v].hidden_in_factoriopedia = true
            data.raw.technology[v].effects = nil

            if data.raw.technology[v].research_trigger then
                data.raw.technology[v].research_trigger = nil
                data.raw.technology[v].unit = {count = 1000, time = 30, ingredients = {{'automation-science-pack', 1}}}
            end

            if data.raw.technology[v].unit and data.raw.technology[v].unit.ingredients then
                data.raw.technology[v].unit.ingredients = {{'space-science-pack', 1}}
            end
        end
    end
end

local lab_ingredient_removal = {
    ['metallurgic-science-pack'] = true,
    ['agricultural-science-pack'] = true,
    ['electromagnetic-science-pack'] = true,
    ['cryogenic-science-pack'] = true,
    ['promethium-science-pack'] = true,
}

for _, tech in pairs(data.raw.technology) do
    if tech.unit and tech.unit.ingredients then
        for i = #tech.unit.ingredients, 1, -1 do
            if lab_ingredient_removal[tech.unit.ingredients[i][1]] then
                table.remove(tech.unit.ingredients, i)
            end
        end
    end
end

-- GM-VP A 2 SPACE_AGE RESEARCH_EFFECT
table.insert(data.raw.technology['fusion-reactor'].effects, {type = 'unlock-recipe', recipe = 'fluoroketone'})
table.insert(data.raw.technology['fusion-reactor'].effects, {type = 'unlock-recipe', recipe = 'fluoroketone-cooling'})

-- GM-VP C 1 BASE RESEARCH
-- GM-VP C 6 SPACE_AGE RESEARCH
for _, v in pairs({'space-science-pack', 'electromagnetic-plant', 'foundry', 'cryogenic-plant', 'big-mining-drill', 'agriculture', 'heating-tower'}) do
    if data.raw.technology[v] then
        data.raw.technology[v].research_trigger = nil
    end
end

-- GM-VP H 2 SPACE_AGE RESEARCH_EFFECT
if data.raw.quality then
    for _, v in pairs(data.raw.quality) do
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end

-- GM-VP C 1 BASE ENTITY
-- GM-VP C 1 SPACE_AGE ENTITY
for _, v in pairs(data.raw.lab) do
    v.inputs = {'automation-science-pack', 'logistic-science-pack', 'military-science-pack', 'chemical-science-pack', 'production-science-pack', 'utility-science-pack', 'space-science-pack'}
end

-- GM-VP H 4 SPACE_AGE ITEM
for _, v in pairs({'carbonic', 'metallic', 'promethium', 'oxide'}) do
    local l = v .. '-asteroid-chunk'

    if data.raw.item[l] then
        data.raw.item[l].hidden = true
        data.raw.item[l].hidden_in_factoriopedia = true
    end
end

-- GM-VP H 11 SPACE_AGE FLUID
for _, v in pairs({'thruster-oxidizer', 'thruster-fuel', 'lithium-brine', 'fluorine', 'ammonia', 'ammoniacal-solution', 'electrolyte', 'holmium-solution', 'molten-copper', 'molten-iron', 'lava'}) do
    if data.raw.fluid[v] then
        data.raw.fluid[v].hidden = true
        data.raw.fluid[v].hidden_in_factoriopedia = true
    end
end

-- GM-VP C 8 BASE RESEARCH
-- GM-VP C 23 SPACE_AGE RESEARCH
if items['recipe_reform'] then
    for k, v in pairs(items['recipe_reform']) do
        if data.raw.recipe[k] then
            data.raw.recipe[k].ingredients = (v.ingredients and v.ingredients) or data.raw.recipe[k].ingredients
            data.raw.recipe[k].results = (v.results and v.results) or data.raw.recipe[k].results
        end
    end
end

-- GM-VP H 4 QUALITY TIP_AND_TRICK
-- GM-VP H 16 SPACE_AGE TIP_AND_TRICK
if items['tips_and_tricks_item'] then
    for _, v in pairs(data.raw['tips-and-tricks-item']) do
        if v.category and items['tips_and_tricks_item'][v.category] then
            v.hidden = true
            v.hidden_in_factoriopedia = true
        end
    end
end

-- GM-VP H 21 SPACE_AGE ACHIEVEMENT
if items['achievement'] then
    for k, v in pairs(items['achievement']) do
        if data.raw[v][k] then
            data.raw[v][k].hidden = true
            data.raw[v][k].hidden_in_factoriopedia = true
        end
    end
end

-- GM-VP C 2 BASE ENTITY
if data.raw['unit-spawner'] then
    for _, v in pairs(data.raw['unit-spawner']) do
        v.captured_spawner_entity = nil
    end
end

-- GM-VP H 20 SPACE_AGE ENTITY
-- GM-VP H 9 SPACE_AGE SPACE_CONNECTION
-- GM-VP H 3 SPACE_AGE SPACE_LOCATION
for _, c in pairs({'space-connection', 'space-location', 'asteroid', 'asteroid-chunk'}) do
    if data.raw[c] then
        for _, v in pairs(data.raw[c]) do
            v.hidden = true
            v.hidden_in_factoriopedia = true
        end
    end
end

if not items['recipe'] then
    items['recipe'] = {}
end

-- GM-VP H 1 QUALITY RECIPE
-- GM-VP H 92 SPACE_AGE RECIPE
for _, v in pairs(data.raw.recipe) do
    v.surface_conditions = nil
    v.maximum_productivity = nil
    v.auto_recycle = false

    if items['recipe'][v.name] then
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end

if items['item'] then
    items['item'] = {}
end

-- GM-VP H 1 QUALITY ITEM
-- GM-VP H 36 SPACE_AGE ITEM
for _, v in pairs(data.raw.item) do
    v.auto_recycle = false

    if items['item'][v.name] then
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end

-- GM-VP H 18 SPACE_AGE MENU_SIMULATION
if data.raw['utility-constants'] and data.raw['utility-constants']['default'] and data.raw['utility-constants']['default']['main_menu_simulations'] then
    for _, v in pairs({'platform_science', 'platform_moving', 'platform_messy_nuclear', 'vulcanus_lava_forge', 'vulcanus_crossing', 'vulcanus_punishmnent', 'vulcanus_sulfur_drop', 'gleba_agri_towers', 'gleba_pentapod_ponds', 'gleba_egg_escape', 'gleba_farm_attack', 'gleba_grotto', 'fulgora_city_crossing', 'fulgora_recycling_hell', 'fulgora_nightfall', 'fulgora_race', 'aquilo_send_help', 'aquilo_starter'}) do
        if data.raw['utility-constants']['default']['main_menu_simulations'][v] then
            data.raw['utility-constants']['default']['main_menu_simulations'][v] = nil
        end
    end
end

-- GM-VP C 1 SPACE_AGE ENTITY
if data.raw['agricultural-tower'] and data.raw['agricultural-tower']['agricultural-tower'] then
    data.raw['agricultural-tower']['agricultural-tower'].energy_source.emissions_per_minute = { pollution = -1 }
end

-- GM-VP C 1 SPACE_AGE ENTITY
if data.raw['assembling-machine'] and data.raw['assembling-machine']['electromagnetic-plant'] then
    data.raw['assembling-machine']['electromagnetic-plant'].effect_receiver = nil
    data.raw['assembling-machine']['electromagnetic-plant'].crafting_categories = {table.unpack(data.raw['assembling-machine']['assembling-machine-3'].crafting_categories)}
    data.raw['assembling-machine']['electromagnetic-plant'].crafting_speed = 2.5
    data.raw['assembling-machine']['electromagnetic-plant'].energy_usage = '872kW'
    data.raw['assembling-machine']['electromagnetic-plant'].energy_source.emissions_per_minute.pollution = 4
end

-- GM-VP C 1 SPACE_AGE ENTITY
if data.raw['assembling-machine'] and data.raw['assembling-machine']['foundry'] then
    data.raw['assembling-machine']['foundry'].effect_receiver = nil
    data.raw['assembling-machine']['foundry'].crafting_categories = {table.unpack(data.raw['furnace']['electric-furnace'].crafting_categories)}
    data.raw['assembling-machine']['foundry'].crafting_speed = 6
    data.raw['assembling-machine']['foundry'].energy_usage = '930kW'
    data.raw['assembling-machine']['foundry'].energy_source.emissions_per_minute.pollution = 3
end

-- GM-VP C 1 SPACE_AGE ENTITY
if data.raw['assembling-machine'] and data.raw['assembling-machine']['cryogenic-plant'] then
    data.raw['assembling-machine']['cryogenic-plant'].crafting_categories = {table.unpack(data.raw['assembling-machine']['oil-refinery'].crafting_categories), table.unpack(data.raw['assembling-machine']['chemical-plant'].crafting_categories)}
    data.raw['assembling-machine']['cryogenic-plant'].crafting_speed = 3
    data.raw['assembling-machine']['cryogenic-plant'].energy_usage = '1302kW'
    data.raw['assembling-machine']['cryogenic-plant'].energy_source.emissions_per_minute.pollution = 12
end

-- GM-VP C 1 SPACE_AGE ENTITY
if data.raw['lab'] and data.raw['lab']['biolab'] then
    data.raw['lab']['biolab'].science_pack_drain_rate_percent = 100
    data.raw['lab']['biolab'].researching_speed = 3
    data.raw['lab']['biolab'].energy_usage = '180kW'
    data.raw['lab']['biolab'].energy_source.emissions_per_minute = nil
end

-- GM-VP C 1 SPACE_AGE ENTITY
if data.raw['electric-turret'] and data.raw['electric-turret']['tesla-turret'] then
    data.raw['electric-turret']['tesla-turret'].energy_source.drain = '250kW'
end

-- GM-VP C 1 SPACE_AGE ENTITY
if data.raw['chain-active-trigger'] and data.raw['chain-active-trigger']['chain-tesla-turret-chain'] then
    data.raw['chain-active-trigger']['chain-tesla-turret-chain'].fork_chance = 0.3
end

-- GM-VP C 4 SPACE_AGE MAP_GEN_SETTING
-- GM-VP H 4 SPACE_AGE PLANET
if data.raw.planet then
    for _, v in pairs({'vulcanus', 'gleba', 'fulgora', 'aquilo'}) do
        if data.raw.planet[v] then
            data.raw.planet[v].map_gen_settings = nil
            data.raw.planet[v].hidden = true
            data.raw.planet[v].hidden_in_factoriopedia = true
        end
    end
end

-- GM-VP H 1 QUALITY ENTITY
-- GM-VP H 12 SPACE_AGE ENTITY
-- GM-VP H 27 SPACE_AGE ENTITY_GENERATION
-- GM-VP H 7 SPACE_AGE ITEM
-- GM-VP H 21 SPACE_AGE MAP_GENERATION
-- GM-VP H 3 SPACE_AGE TILE
-- GM-VP H 4 SPACE_AGE TOOL
if items['hidden'] then
    for k, v in pairs(items['hidden']) do
        if data.raw[v] and data.raw[v][k] then
            data.raw[v][k].hidden = true
            data.raw[v][k].hidden_in_factoriopedia = true
        end
    end
end

local nauvis_control = data.raw.planet and data.raw.planet['nauvis'] and data.raw.planet['nauvis'].map_gen_settings and data.raw.planet['nauvis'].map_gen_settings.autoplace_controls
local nauvis_setting = data.raw.planet and data.raw.planet['nauvis'] and data.raw.planet['nauvis'].map_gen_settings and data.raw.planet['nauvis'].map_gen_settings.autoplace_settings and data.raw.planet['nauvis'].map_gen_settings.autoplace_settings.entity and data.raw.planet['nauvis'].map_gen_settings.autoplace_settings.entity.settings

-- GM-VP H 16 SPACE_AGE RESOURCE_GENERATION
if items['hidden'] and data.raw['resource'] then
    for _, v in pairs(items['hidden_resource']) do
        if data.raw['resource'][v] then
            data.raw['resource'][v].hidden = true
            data.raw['resource'][v].hidden_in_factoriopedia = true
            data.raw['resource'][v].autoplace = nil

            if nauvis_control then
                data.raw.planet['nauvis'].map_gen_settings.autoplace_controls[v:gsub('-', '_')] = nil
            end

            if nauvis_setting then
                data.raw.planet['nauvis'].map_gen_settings.autoplace_settings.entity.settings[v] = nil
            end
        end
    end
end

-- GM-VP H 95 SPACE_AGE TILE
for _, v in pairs(data.raw['tile']) do
    if v.subgroup and (v.subgroup == 'vulcanus-tiles' or v.subgroup == 'gleba-tiles' or v.subgroup == 'gleba-water-tiles' or v.subgroup == 'fulgora-tiles' or v.subgroup == 'aquilo-tiles') then
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end
