local items = require('gm-vp-c')
local mbm = require('mbm-c')
local mc = require('mc')
local item_sounds = require('__base__/prototypes/item_sounds')

mc.space_age()

-- GM-VP C 33 BASE ENTITY
-- GM-VP C 6 ELEVATED_RAILS ENTITY
-- GM-VP C 17 SPACE_AGE ENTITY
if items['entity_surface_conditions'] then
    for _, v in pairs(items['entity_surface_conditions']) do
        if data.raw[v] then
            for _, v2 in pairs(data.raw[v]) do
                v2.surface_conditions = nil
            end
        end
    end
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

-- GM-VP A 9 BASE RESEARCH
-- GM-VP A 1 SPACE_AGE RESEARCH
if items['technology_productivity'] then
    for k, v in pairs(items['technology_productivity']) do
        local base_prerequisites = v.prerequisites
        local base_ingredient = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        local base_effect = {}

        for _, v2 in pairs(v.ingredients) do
            table.insert(base_ingredient, {v2, 1})
            table.insert(base_prerequisites, v2)
        end

        for _, v2 in pairs(v.effect) do
            table.insert(base_effect, {type = 'change-recipe-productivity', recipe = v2, change = 0.05})
        end

        local icon = ((v.mod and v.mod == 'base') and '__base__/graphics/technology/' .. k ..'.png') or ('__space-age__/graphics/technology/' .. k ..'.png')

        data:extend({{
            type = 'technology',
            name = k .. '-productivity',
            prerequisites = base_prerequisites,
            effects = base_effect,
            unit = {count_formula = '1000 * (1.5 ^ (L - 1))', ingredients = base_ingredient, time = 60},
            icons = {{icon = icon, icon_size = 256}, {icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png', icon_size = 128, scale = 0.5, shift = {50, 50}}},
            order = 'a-i-d',
            max_level = 10,
            upgrade = true,
            localised_name = {'technology-name.' .. k}
        }})
    end
end

data.raw.technology['automation-productivity'].icons[1].icon = '__base__/graphics/technology/automation-2.png'

-- GM-VP A 1 SPACE_AGE RESEARCH_EFFECT
if data.raw.technology['automation'] and data.raw.technology['automation'].effects then
    table.insert(data.raw.technology['automation'].effects, {type = 'create-ghost-on-entity-death', modifier = true})
end

-- GM-VP C 2 BASE ENTITY
if data.raw['unit-spawner'] then
    for _, v in pairs(data.raw['unit-spawner']) do
        v.captured_spawner_entity = nil
    end
end

-- GM-VP H 20 SPACE_AGE ENTITY
-- GM-VP H 4 SPACE_AGE QUALITY
-- GM-VP H 9 SPACE_AGE SPACE_CONNECTION
-- GM-VP H 3 SPACE_AGE SPACE_LOCATION
for _, c in pairs({'space-connection', 'space-location', 'asteroid', 'asteroid-chunk', 'quality'}) do
    if data.raw[c] then
        for _, v in pairs(data.raw[c]) do
            v.hidden = true
            v.hidden_in_factoriopedia = true
        end
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
    data.raw['agricultural-tower']['agricultural-tower'].energy_source.emissions_per_minute = {pollution = -1}
end

-- GM-VP C 3 SPACE_AGE ENTITY
if data.raw['plant'] and data.raw['plant']['tree-plant'] and data.raw['plant']['tree-plant'].autoplace then
    data.raw['plant']['tree-plant'].autoplace.tile_restriction = nil

    if data.raw['plant']['tree-plant'].minable then
        data.raw['plant']['tree-plant'].minable.results = {{type = 'item', name = 'wood', amount = 20}}
    end

    if data.raw['plant']['yumako-tree'] and data.raw['plant']['yumako-tree'] then
        data.raw['plant']['yumako-tree'].autoplace.tile_restriction = nil
        data.raw['plant']['yumako-tree'].harvest_emissions = nil

        if data.raw['plant']['yumako-tree'].minable then
            data.raw['plant']['yumako-tree'].minable.results = {{type = 'item', name = 'yumako', amount = 100}}
        end
    end

    if data.raw['plant']['jellystem'] and data.raw['plant']['jellystem'] then
        data.raw['plant']['jellystem'].autoplace.tile_restriction = nil
        data.raw['plant']['jellystem'].harvest_emissions = nil

        if data.raw['plant']['jellystem'].minable then
            data.raw['plant']['jellystem'].minable.results = {{type = 'item', name = 'jellynut', amount = 100}}
        end
    end
end

-- GM-VP C 3 SPACE_AGE ENTITY
if data.raw['assembling-machine'] then
    if data.raw['assembling-machine']['electromagnetic-plant'] then
        data.raw['assembling-machine']['electromagnetic-plant'].effect_receiver = nil
        data.raw['assembling-machine']['electromagnetic-plant'].crafting_speed = 2.5
        data.raw['assembling-machine']['electromagnetic-plant'].energy_usage = '872kW'
        data.raw['assembling-machine']['electromagnetic-plant'].energy_source.emissions_per_minute.pollution = 4
        local cc = {}

        if data.raw['assembling-machine']['assembling-machine-3'] and data.raw['assembling-machine']['assembling-machine-3'].crafting_categories then
            for _, v in pairs(data.raw['assembling-machine']['assembling-machine-3'].crafting_categories) do
                table.insert(cc, v)
            end
        end

        table.insert(cc, 'electromagnetics')
        data.raw['assembling-machine']['electromagnetic-plant'].crafting_categories = cc
    end

    if data.raw['assembling-machine']['foundry'] then
        data.raw['assembling-machine']['foundry'].effect_receiver = nil
        data.raw['assembling-machine']['foundry'].crafting_speed = 6
        data.raw['assembling-machine']['foundry'].energy_usage = '930kW'
        data.raw['assembling-machine']['foundry'].energy_source.emissions_per_minute.pollution = 3
        local cc = {}

        if data.raw['furnace'] and data.raw['furnace']['electric-furnace'] and data.raw['furnace']['electric-furnace'].crafting_categories then
            for _, v in pairs(data.raw['furnace']['electric-furnace'].crafting_categories) do
                table.insert(cc, v)
            end
        end

        table.insert(cc, 'metallurgy')
        data.raw['assembling-machine']['foundry'].crafting_categories = cc
    end

    if data.raw['assembling-machine']['cryogenic-plant'] then
        data.raw['assembling-machine']['cryogenic-plant'].crafting_speed = 3
        data.raw['assembling-machine']['cryogenic-plant'].energy_usage = '1302kW'
        data.raw['assembling-machine']['cryogenic-plant'].energy_source.emissions_per_minute.pollution = 12
        local cct = {}
        local cc = {}

        if data.raw['assembling-machine']['oil-refinery'] and data.raw['assembling-machine']['oil-refinery'].crafting_categories then
            for _, v in pairs(data.raw['assembling-machine']['oil-refinery'].crafting_categories) do
                cct[v] = true
                table.insert(cc, v)
            end
        end

        if data.raw['assembling-machine']['chemical-plant'] and data.raw['assembling-machine']['chemical-plant'].crafting_categories then
            for _, v in pairs(data.raw['assembling-machine']['chemical-plant'].crafting_categories) do
                if not cct[v] then
                    cct[v] = true
                    table.insert(cc, v)
                end
            end
        end

        table.insert(cc, 'cryogenics')
        data.raw['assembling-machine']['cryogenic-plant'].crafting_categories = cc
    end
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
-- GM-VP H 66 SPACE_AGE ENTITY
-- GM-VP H 8 SPACE_AGE FLUID
-- GM-VP H 2 SPACE_AGE ITEM
-- GM-VP H 20 SPACE_AGE MAP_GENERATION
-- GM-VP H 3 SPACE_AGE TILE
-- GM-VP H 1 SPACE_AGE TOOL
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

-- GM-VP H 13 SPACE_AGE RESOURCE_GENERATION
if items['hidden_resource'] and data.raw['resource'] then
    for _, v in pairs(items['hidden_resource']) do
        if data.raw['resource'][v] then
            data.raw['resource'][v].hidden = true
            data.raw['resource'][v].hidden_in_factoriopedia = true
            data.raw['resource'][v].autoplace = nil
            nauvis_control[v:gsub('-', '_')] = nil
            nauvis_setting[v] = nil
        end
    end
end

-- GM-VP C 1 SPACE_AGE RESOURCE_GENERATION
if data.raw['resource'] and data.raw['resource']['tungsten-ore'] and data.raw['resource']['tungsten-ore'].autoplace then
    data.raw['resource']['tungsten-ore'].autoplace.probability_expression = "(control:tungsten_ore:size > 0) * (1000 * ((1 + vulcanus_tungsten_ore_region) * random_penalty_between(0.9, 1, 1) - 1))"
    data.raw['resource']['tungsten-ore'].autoplace.richness_expression = "vulcanus_tungsten_ore_region * random_penalty_between(0.9, 1, 1) * 10000 * vulcanus_starting_area_multiplier * control:tungsten_ore:richness / vulcanus_tungsten_ore_size"
    nauvis_control['tungsten_ore'] = {}
    nauvis_setting['tungsten-ore'] = {}
end

-- GM-VP C 1 SPACE_AGE RESOURCE_GENERATION
if data.raw['resource'] and data.raw['resource']['lithium-brine'] and data.raw['resource']['lithium-brine'].autoplace then
    data.raw['resource']['lithium-brine'].autoplace.probability_expression = "(control:lithium_brine:size > 0) * (max(aquilo_starting_lithium_brine * 0.02, min(aquilo_starting_mask, aquilo_lithium_brine_spots) * 0.012))"
    data.raw['resource']['lithium-brine'].autoplace.richness_expression = "max(aquilo_starting_lithium_brine * 480000, aquilo_lithium_brine_spots * 720000) * control:lithium_brine:richness"
    nauvis_control['lithium_brine'] = {}
    nauvis_setting['lithium-brine'] = {}
end

-- GM-VP C 1 SPACE_AGE RESOURCE_GENERATION
if data.raw['resource'] and data.raw['resource']['fluorine-vent'] and data.raw['resource']['fluorine-vent'].autoplace then
    data.raw['resource']['fluorine-vent'].autoplace.probability_expression = "(control:fluorine_vent:size > 0) * (max(aquilo_starting_flourine_vent * 0.02, aquilo_starting_flourine_vent_tiny > 0, min(aquilo_starting_mask, aquilo_flourine_vent_spots) * 0.008))"
    data.raw['resource']['fluorine-vent'].autoplace.richness_expression = "max(aquilo_starting_flourine_vent * 420000, (aquilo_starting_flourine_vent_tiny > 0) * 420000, aquilo_flourine_vent_spots * 520000) * control:fluorine_vent:richness"
    nauvis_control['fluorine_vent'] = {}
    nauvis_setting['fluorine-vent'] = {}
end


-- GM-VP H 95 SPACE_AGE TILE
if data.raw['tile'] then
    for _, v in pairs(data.raw['tile']) do
        if v.subgroup and (v.subgroup == 'vulcanus-tiles' or v.subgroup == 'gleba-tiles' or v.subgroup == 'gleba-water-tiles' or v.subgroup == 'fulgora-tiles' or v.subgroup == 'aquilo-tiles') then
            v.hidden = true
            v.hidden_in_factoriopedia = true
        end
    end
end

-- GM-VP C 1 SPACE_AGE RECIPE
if data.raw.recipe['ice-melting'] then
    data.raw.recipe['ice-melting'].enabled = true
    data.raw.recipe['ice-melting'].energy_required = 0.5
    data.raw.recipe['ice-melting'].allow_productivity = false
    data.raw.recipe['ice-melting'].results = {{type = 'fluid', name = 'water', amount = 10}}
end

-- GM-VP A 1 SPACE_AGE RECIPE
if data.raw.item['ice'] then
    data:extend({{
        type = 'recipe',
        name = 'ice',
        energy_required = 0.5,
        enabled = true,
        icon = data.raw.item['ice'].icon,
        category = 'chemistry',
        ingredients = {{type = 'fluid', name = 'water', amount = 10, fluidbox_multiplier = 10}},
        results = {{type = 'item', name = 'ice', amount = 1}},
        main_product = 'ice',
        allow_productivity = false,
        localised_name = {'item-name.ice'}
    }})
end

-- GM-VP C 1 BASE ENTITY
-- GM-VP C 1 SPACE_AGE ENTITY
if data.raw['lab'] then
    for _, v in pairs(data.raw['lab']) do
        v.inputs = {}

        for _, v2 in pairs(data.raw['tool']) do
            if not v2.hidden then
                table.insert(v.inputs, v2.name)
            end
        end
    end
end

-- GM-VP C 26 BASE RESEARCH
-- GM-VP C 36 SPACE_AGE RESEARCH
-- GM-VP H 31 SPACE_AGE RESEARCH
if data.raw.technology and items['technology'] and items['technology_reform'] then
    for _, v in pairs(data.raw.technology) do
        if items['technology_reform'][v.name] then
            v.prerequisites = (items['technology_reform'][v.name].prerequisites and items['technology_reform'][v.name].prerequisites) or v.prerequisites
            v.effects = (items['technology_reform'][v.name].effects and items['technology_reform'][v.name].effects) or v.effects
            v.max_level = (items['technology_reform'][v.name].max_level and items['technology_reform'][v.name].max_level) or v.max_level

            if items['technology_reform'][v.name].unit then
                v.unit = items['technology_reform'][v.name].unit
            end

            if v.unit then
                v.research_trigger = nil
                v.unit.ingredients = (items['technology_reform'][v.name].unit_ingredients and items['technology_reform'][v.name].unit_ingredients) or v.unit.ingredients
                v.unit.count = (items['technology_reform'][v.name].unit_count and items['technology_reform'][v.name].unit_count) or v.unit.count
                v.unit.count_formula = (items['technology_reform'][v.name].unit_count_formula and items['technology_reform'][v.name].unit_count_formula) or v.unit.count_formula
            end

        elseif items['technology'][v.name] then
            v.hidden = true
            v.hidden_in_factoriopedia = true
            v.effects = nil
            v.research_trigger = nil
            v.unit = {count = 1000, time = 30, ingredients = {{'automation-science-pack', 1}}}

        elseif v.unit and v.unit.ingredients then
            for i = #v.unit.ingredients, 1, -1 do
                if data.raw['tool'][v.unit.ingredients[i][1]].hidden then
                    table.remove(v.unit.ingredients, i)
                end
            end
        end
    end
end

if settings.startup['PHI-MB-MACHINE'].value and settings.startup['PHI-MB-MACHINE'].value > 1 and mbm and data.raw.technology and data.raw.recipe then
    for i = 2, settings.startup['PHI-MB-MACHINE'].value do
        for _, v in pairs({'foundry', 'electromagnetic-plant', 'cryogenic-plant'}) do
            if mbm[v] and mbm[v].max and mbm[v].max >= i and mbm[v].tech and data.raw.technology[mbm[v].tech] and data.raw.recipe[v .. '-' .. i] then
                table.insert(data.raw.technology[mbm[v].tech].effects, {type = 'unlock-recipe', recipe = v .. '-' .. i})
            end
        end
    end
end

-- GM-VP H 1 QUALITY ITEM
-- GM-VP H 33 SPACE_AGE ITEM
for _, v in pairs(data.raw.item) do
    v.auto_recycle = false

    if items['item'][v.name] then
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end

-- GM-VP C 12 BASE RECIPE
-- GM-VP C 51 SPACE_AGE RECIPE
-- GM-VP H 1 QUALITY RECIPE
-- GM-VP H 64 SPACE_AGE RECIPE
for _, v in pairs(data.raw.recipe) do
    v.surface_conditions = nil
    v.maximum_productivity = nil
    v.auto_recycle = false

    if items['recipe_reform'][v.name] then
        v.category = (items['recipe_reform'][v.name].category and items['recipe_reform'][v.name].category) or v.category
        v.ingredients = (items['recipe_reform'][v.name].ingredients and items['recipe_reform'][v.name].ingredients) or v.ingredients
        v.results = (items['recipe_reform'][v.name].results and items['recipe_reform'][v.name].results) or v.results
        v.allow_productivity = (items['recipe_reform'][v.name].allow_productivity and items['recipe_reform'][v.name].allow_productivity) or v.allow_productivity
        v.energy_required = (items['recipe_reform'][v.name].energy_required and items['recipe_reform'][v.name].energy_required) or v.energy_required

    elseif items['recipe'][v.name] then
        v.hidden = true
        v.hidden_in_factoriopedia = true
    end
end
