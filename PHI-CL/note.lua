--[[
** CONFIG  
    if mods['Krastorio2'] then
        items['item']['kr-mineral-water-pumpjack'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'mining-drill',
            name = 'kr-mineral-water-pumpjack',
            ref_name = 'kr-mineral-water-pumpjack',
            tech = 'kr-mineral-water-gathering',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
        }

        items['item']['kr-gas-power-station'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 2,
            type = 'generator',
            name = 'kr-gas-power-station',
            ref_name = 'kr-gas-power-station',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-STEAM-TIER'].value
        }

        items['item']['kr-crusher'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-crusher',
            ref_name = 'kr-crusher',
            tech = 'kr-crusher',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-fluid-burner'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-fluid-burner',
            ref_name = 'kr-fluid-burner',
            tech = 'kr-fluid-excess-handling',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-air-purifier'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-air-purifier',
            ref_name = 'kr-air-purifier',
            tech = 'kr-air-purification',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-advanced-furnace'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-furnace',
            ref_name = 'kr-advanced-furnace',
            tech = 'kr-advanced-furnace',
            min = 2,
            max = settings.startup['PHI-MB-FURNACE-TIER'].value
        }

        items['item']['kr-advanced-chemical-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-chemical-plant',
            ref_name = 'kr-advanced-chemical-plant',
            tech = 'kr-advanced-chemical-plant',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        }

        items['item']['kr-advanced-assembling-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-assembling-machine',
            ref_name = 'kr-advanced-assembling-machine',
            tech = 'kr-automation',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-greenhouse'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-greenhouse',
            ref_name = 'kr-greenhouse',
            tech = 'kr-greenhouse',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-bio-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-bio-lab',
            ref_name = 'kr-bio-lab',
            tech = 'kr-bio-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-electrolysis-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-electrolysis-plant',
            ref_name = 'kr-electrolysis-plant',
            tech = 'kr-fluids-chemistry',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-filtration-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-filtration-plant',
            ref_name = 'kr-filtration-plant',
            tech = 'kr-fluids-chemistry',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-fuel-refinery'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-fuel-refinery',
            ref_name = 'kr-fuel-refinery',
            tech = 'kr-fuel',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-atmospheric-condenser'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-atmospheric-condenser',
            ref_name = 'kr-atmospheric-condenser',
            tech = 'kr-atmosphere-condensation',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-advanced-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'lab',
            name = 'biusart-lab',
            ref_name = 'biusart-lab',
            tech = 'kr-advanced-lab',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        }

        items['item']['kr-singularity-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'lab',
            name = 'kr-singularity-lab',
            ref_name = 'kr-singularity-lab',
            tech = 'kr-singularity-lab',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        }

        items['item']['kr-research-server'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-research-server',
            ref_name = 'kr-research-server',
            tech = 'kr-research-server',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-quantum-computer'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-quantum-computer',
            ref_name = 'kr-quantum-computer',
            tech = 'kr-quantum-computer',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-matter-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-matter-plant',
            ref_name = 'kr-matter-plant',
            tech = 'kr-matter-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-matter-assembler'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-matter-assembler',
            ref_name = 'kr-matter-assembler',
            tech = 'kr-matter-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-quarry-drill'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'mining-drill',
            name = 'kr-quarry-drill',
            ref_name = 'kr-quarry-drill',
            tech = 'kr-quarry-minerals-extraction',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
        }
    end

** MAIN
    if source.name == 'kr-gas-power-station' then
        item.fluid_usage_per_tick = item.fluid_usage_per_tick * (tier - source.min + 2)

    elseif (source.ref_name == 'se-space-solar-panel') then
        item.production = tostring(tonumber(string.match(item.production, '[%d%.]+')) * (4 ^ (tier - source.min + 2))) .. string.match(item.production, '%a+')
        end

    if item.energy_per_shield then
        item.energy_per_shield = tostring(math.floor(tonumber(string.match(item.energy_per_shield, '[%d%.]+')) * ((32 - (tier - source.min + 1)) / 32))) .. string.match(item.energy_per_shield, '%a+')
    end

** DATA
    data.raw.technology['agriculture'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'space-science-pack', 1}}}
    data.raw.technology['yumako'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'space-science-pack', 1}}}
    data.raw.technology['jellynut'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'space-science-pack', 1}}}
    data.raw.technology['bacteria-cultivation'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'space-science-pack', 1}}}
    data.raw.technology['heating-tower'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'space-science-pack', 1}}}
    data.raw.technology['tungsten-carbide'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'space-science-pack', 1}}}
    data.raw.technology['recycling'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'space-science-pack', 1}}}
    data.raw.technology['lithium-processing'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'space-science-pack', 1}}}
    data.raw.technology['promethium-science-pack'].effects = {{type = 'unlock-recipe', recipe = 'promethium-science-pack'}}
    data.raw.technology['railgun'].prerequisites = {'military-3', 'utility-science-pack'}
    data.raw.technology['railgun'].unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}}

    local resource_autoplace = require('resource-autoplace')

    for k, v in pairs({['fluorine-vent'] = 'b', ['lithium-brine'] = 'a-b-a', ['sulfuric-acid-geyser'] = 'a-b-b'}) do
        data.raw.resource[k].autoplace = resource_autoplace.resource_autoplace_settings{
            name = k,
            order = v,
            control = k:gsub('-', '_'),
            base_density = 8.2,
            base_spots_per_km2 = 1.8,
            random_probability = 1 / 48,
            random_spot_size_minimum = 1,
            random_spot_size_maximum = 1,
            additional_richness = 220000,
            has_starting_area_placement = false,
            regular_rq_factor_multiplier = 1
        }
    end

    for k, v in pairs({['calcite'] = 'b', ['tungsten-ore'] = 'b', ['scrap'] = 'c'}) do
        data.raw.resource[k].autoplace = resource_autoplace.resource_autoplace_settings{
            name = k,
            order = v,
            base_density = 0.9,
            base_spots_per_km2 = 1.25,
            has_starting_area_placement = false,
            random_spot_size_minimum = 2,
            random_spot_size_maximum = 4,
            regular_rq_factor_multiplier = 1
        }
    end

    for _, v in pairs({'calcite', 'fluorine_vent', 'lithium_brine', 'scrap', 'sulfuric_acid_geyser', 'tungsten_ore'}) do
        data.raw.planet['nauvis'].map_gen_settings.autoplace_controls[v] = {}
        data.raw.planet['nauvis'].map_gen_settings.autoplace_settings.entity.settings[v:gsub('_', '-')] = {}
    end

    data.raw.planet['nauvis'].map_gen_settings.autoplace_controls['gleba_enemy_base'] = {}
    
    local pen = {
        ['entity:tungsten-ore:probability'] = 'vulcanus_tungsten_ore_probability',
        ['entity:tungsten-ore:richness'] = 'vulcanus_tungsten_ore_richness',
        ['entity:calcite:probability'] = 'vulcanus_calcite_probability',
        ['entity:calcite:richness'] = 'vulcanus_calcite_richness',
        ['entity:sulfuric-acid-geyser:probability'] = 'vulcanus_sulfuric_acid_geyser_probability',
        ['entity:sulfuric-acid-geyser:richness'] = 'vulcanus_sulfuric_acid_geyser_richness'
    }

    for k, v in pairs(pen) do
        data.raw.planet['nauvis'].map_gen_settings.property_expression_names[k] = v
    end

    data.raw['unit-spawner']['gleba-spawner'].autoplace = data.raw['unit-spawner']['biter-spawner'].autoplace
    data.raw['unit-spawner']['gleba-spawner-small'].autoplace = data.raw['unit-spawner']['spitter-spawner'].autoplace

    for _, v in pairs({'artificial-yumako-soil', 'overgrowth-yumako-soil', 'artificial-jellynut-soil', 'overgrowth-jellynut-soil', 'ice-platform', 'foundation', 'turbo-transport-belt', turbo-underground-belt', 'turbo-splitter', 'big-mining-drill', 'railgun-turret', 'tesla-turret', 'stack-inserter', 'fusion-reactor', 'fusion-generator'}) do
        data.raw.item[v].default_import_location = nil
    end
    
    data.raw.gun['teslagun'].default_import_location = nil
    data.raw.ammo['tesla-ammo'].default_import_location = nil

** DATA UPDATE
if settings.startup['PHI-MB'].value and mods['space-exploration'] and settings.startup['PHI-MB-MINING-TIER'].value > 1 then
    data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group = 'se-core-miner-drill'

    local se = {
        type = 'mining-drill',
        name = 'se-core-miner-drill',
        ref_name = 'se-core-miner-drill',
        min = 2,
        max = 3
    }

    for i=2, settings.startup['PHI-MB-MINING-TIER'].value do
        local miner_name = 'se-core-miner-' .. i
        local drill_name = 'se-core-miner-drill-' .. i

        main.EEE(se, i)
        data.raw['mining-drill'][drill_name].minable.result = miner_name
        data.raw['mining-drill'][drill_name].placeable_by.item = miner_name

        local item = table.deepcopy(data.raw['item']['se-core-miner'])
        item.name = 'se-core-miner-' .. i
        item.place_result = drill_name
        item.order = 'zzzz-core-miner-' .. i

        item.icons = {
            {
                icon = '__space-exploration-graphics__/graphics/icons/core-miner.png',
                tint = items['tint'][i],
                icon_size = 64,
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.localised_name = {'name.se-core-miner-drill'}
        item.localised_description = {'description.se-core-miner-drill'}
        data:extend({item})

        if i > 2 then
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{name='se-core-miner-' .. (i - 1), amount=1}, {name='se-core-miner', amount=1}},
                result = miner_name,
                localised_name = {'name.se-core-miner-drill'},
                localised_description = {'description.se-core-miner-drill'}
            }})

        else
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{name='se-core-miner', amount=2}},
                result = miner_name,
                localised_name = {'name.se-core-miner-drill'},
                localised_description = {'description.se-core-miner-drill'}
            }})
        end

        data.raw['mining-drill'][drill_name].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group
        table.insert(data.raw.technology['se-core-miner'].effects, {type='unlock-recipe', recipe=miner_name})
    end
end

** DATA FINAL FIXES
data.raw['utility-constants'].default.train_inactivity_wait_condition_default = 60

data.raw['gui-style'].default.machine_slots_scroll_pane.maximal_height = nil
data.raw['gui-style'].default.machine_ingredients_scroll_pane.maximal_height = nil
data.raw['gui-style'].default.machine_outputs_scroll_pane.maximal_height = nil
data.raw['gui-style'].default.module_inventory_scroll_pane.maximal_height = nil
data.raw['utility-constants'].select_group_row_count

for _,name in pairs({'furnace', 'lab', 'beacon'}) do
	local entities = {}

	for _, entity in pairs(data.raw[name]) do
		table.insert(entities, entity.name)
	end

	for _, entity in pairs(data.raw[name]) do
		entity.additional_pastable_entities = entities
	end
end

for _, t in pairs(data.raw['tree']) do
	t.collision_box = {{-0.05, -0.05}, {0.05, 0.05}}
end

** MIGRATION
if script.active_mods['space-exploration'] then
    if technologies['se-core-miner'].researched then
        for i=2, settings.startup['PHI-MB-MACHINE-TIER'].value do
            recipes['se-core-miner-' .. i].enabled = true
            recipes['se-core-miner-' .. i].reload()
        end
    end
end
            
** SETTING
localised_description = {'phi-cl.combine', {'phi-cl.default'}, {'mod-setting-description.PHI-MB-ENERGY-SOLAR-TIER'}},

{type = 'laser', decrease = 20, percent = 50},
{type = 'electric', decrease = 20, percent = 50},
{type = 'impact', decrease = 20, percent = 50},
{type = 'poison', decrease = 20, percent = 50}
                
"? aai-industry >= 0.5.0",
"? Krastorio2 >= 1.3.0",
"? space-exploration >= 0.6.0",
"(?) angelsrefining >= 0.12.0",
]]
