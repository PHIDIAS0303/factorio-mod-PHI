local items = require 'config'
local main = require 'main'
local file_stage = 1

if settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value then
    data.raw['fluid']['steam'].max_temperature = ((settings.startup['PHI-MB-ENERGY-POWER-TIER'].value > 1) and 5000) or data.raw['fluid']['steam'].max_temperature
    local ml = math.max(tonumber(settings.startup['PHI-MB-ENERGY-SOLAR-TIER'].value) or 1, tonumber(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value) or 1)

    for i=1, 7 do
        data:extend({{
            type = 'technology',
            name = 'compound-energy-' .. i,
            enabled = (i <= ml),
            prerequisites = ((i > 1) and {'compound-energy-' .. (i - 1)}) or {'solar-energy', 'advanced-circuit', 'electric-energy-accumulators'},
            effects = {},
            unit = {
                count = math.floor(75 * (i ^ 2)),
                ingredients = {
                    {'automation-science-pack', 1},
                    {'logistic-science-pack', 1}
                },
                time = 30
            },
            icons = {
                {
                    icon = '__base__/graphics/technology/solar-energy.png',
                    icon_size = 256,
                    tint = items['tint'][i]
                }
            },
            order = 'a-h-' .. i,
            localised_name = {'phi-cl.combine', {'technology-name.compound-energy'}, tostring(i)},
            localised_description = {'technology-description.compound-energy'}
        }})
    end
end

if settings.startup['PHI-EQ'].value and settings.startup['PHI-EQ-ARMOR'].value then
    local grid = table.deepcopy(data.raw['equipment-grid']['large-equipment-grid'])
    grid.name = 'equipment-grid-14x14'
    grid.width = 14
    grid.height = 14
    data:extend({grid})

    local armor = table.deepcopy(data.raw['armor']['power-armor-mk2'])
    armor.name = 'power-armor-mk3'
    armor.icons = {
        {
            icon = armor.icon,
            tint = items['tint'][2],
            icon_size = armor.icon_size
        }
    }
    armor.icon = nil
    armor.icon_size = nil

    for _, v in pairs(armor.resistances) do
        v.decrease = v.decrease + 10
        v.percent = ((v.percent < 90) and v.percent + 10) or v.percent
    end

    armor.order = armor.order .. '2'
    armor.equipment_grid = grid.name
    armor.inventory_size_bonus = armor.inventory_size_bonus + 10
    armor.localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, '3'}
    data:extend({armor})

    data:extend({{
        type = 'recipe',
        name = armor.name,
        energy_required = 2,
        enabled = false,
        ingredients = {{type = 'item', name = 'power-armor-mk2', amount = 2}},
        results = {{type = 'item', name = armor.name, amount = 1}},
        main_product = armor.name,
        localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, '3'}
    }})

    for _, an in ipairs(data.raw['character']['character']['animations']) do
        if an.armors then
            for _, ar in ipairs(an.armors) do
                if ar == 'power-armor-mk2' then
                    an.armors[#an.armors + 1] = armor.name
                    break
                end
            end
        end
    end

    table.insert(data.raw.technology['power-armor-mk2'].effects, {type = 'unlock-recipe', recipe = armor.name})

    if mods['space-age'] then
        grid = table.deepcopy(data.raw['equipment-grid']['large-equipment-grid'])
        grid.name = 'equipment-grid-15x16'
        grid.width = 15
        grid.height = 16
        data:extend({grid})

        armor = table.deepcopy(data.raw['armor']['mech-armor'])
        armor.name = 'mech-armor-mk2'
        armor.icons = {
            {
                icon = armor.icon,
                tint = items['tint'][2],
                icon_size = armor.icon_size
            }
        }
        armor.icon = nil
        armor.icon_size = nil

        for _, v in pairs(armor.resistances) do
            v.decrease = v.decrease + 10
            v.percent = ((v.percent < 90) and v.percent + 10) or v.percent
        end

        armor.order = armor.order .. '2'
        armor.equipment_grid = grid.name
        armor.inventory_size_bonus = armor.inventory_size_bonus + 10
        armor.localised_name = {'phi-cl.combine-gen', {'name.mech-armor'}, '2'}
        data:extend({armor})

        data:extend({{
            type = 'recipe',
            name = armor.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'mech-armor', amount = 2}},
            results = {{type = 'item', name = armor.name, amount = 1}},
            main_product = armor.name,
            localised_name = {'phi-cl.combine-gen', {'name.mech-armor'}, '2'}
        }})

        for _, an in ipairs(data.raw['character']['character']['animations']) do
            if an.armors then
                for _, ar in ipairs(an.armors) do
                    if ar == 'mech-armor' then
                        an.armors[#an.armors + 1] = armor.name
                        break
                    end
                end
            end
        end

        table.insert(data.raw.technology['mech-armor'].effects, {type = 'unlock-recipe', recipe = armor.name})
    end
end

if settings.startup['PHI-MI'].value or (settings.startup['PHI-SA'].value and settings.startup['PHI-SA-VANILLA'].value) then
    data.raw['mining-drill']['electric-mining-drill'].filter_count = 5

    if mods['space-age'] then
        data.raw['mining-drill']['big-mining-drill'].filter_count = 5
    end
end

if settings.startup['PHI-MI'].value then
    for _, v in pairs(data.raw['active-defense-equipment']) do
        v.automatic = true
    end

    for _, v in pairs({data.raw['module']['efficiency-module'], data.raw['module']['efficiency-module-2'], data.raw['module']['efficiency-module-3']}) do
        for _, v2 in pairs(v.effect) do
            v2 = v2 * settings.startup['PHI-MI-EFFCY'].value / 100
        end
    end

    data.raw.recipe['landfill'].ingredients = {{type = 'item', name = 'stone', amount = tonumber(settings.startup['PHI-MI-LANDFILL'].value) or 50}}

    if settings.startup['PHI-MI-NUCLEAR'].value then
        for _, v in pairs(data.raw['reactor']) do
            v.scale_energy_usage = settings.startup['PHI-MI-NUCLEAR'].value
        end
    end

    if settings.startup['PHI-MI-PIPE'].value then
        local s = (1 + settings.startup['PHI-MI-ROBOT'].value) / 2

        for _, t in pairs({data.raw['offshore-pump'], data.raw['pump']}) do
            for _, v in pairs(t) do
                v.pumping_speed = v.pumping_speed * s
            end
        end

        data.raw['utility-constants'].default.max_fluid_flow = 100 * s
    end

    if settings.startup['PHI-MI-ROBOT'].value then
        local s = (1 + settings.startup['PHI-MI-ROBOT'].value) / 2
        local sn = (17 - settings.startup['PHI-MI-ROBOT'].value) / 16

        for _, t in pairs({data.raw['construction-robot'], data.raw['logistic-robot']}) do
            for _, v in pairs(t) do
                v.speed = v.speed * s

                if settings.startup['PHI-MI-ROBOT-ENERGY'].value then
                    if v.energy_per_tick then
                        v.energy_per_tick = '0J'
                    end

                    if v.energy_per_move then
                        v.energy_per_move = '0J'
                    end

                    if v.speed_multiplier_when_out_of_energy then
                        v.speed_multiplier_when_out_of_energy = 1
                    end

                else
                    if v.energy_per_tick then
                        v.energy_per_tick = tostring(tonumber(string.match(v.energy_per_tick, '[%d%.]+')) * sn) .. string.match(v.energy_per_tick, '%a+')
                    end

                    if v.energy_per_move then
                        v.energy_per_move = tostring(tonumber(string.match(v.energy_per_move, '[%d%.]+')) * sn) .. string.match(v.energy_per_move, '%a+')
                    end
                end
            end
        end
    end

    if settings.startup['PHI-MI-TRAIN'].value then
        local item = table.deepcopy(data.raw['item']['depleted-uranium-fuel-cell'])
        item.name = 'empty-train-battery'
        item.icon = items['general']['graphics_location'] .. 'battery.png'
        item.order = 'qa'
        item.stack_size = 100
        item.localised_name = {'name.empty-train-battery'}
        item.localised_description = {'description.empty-train-battery'}
        data:extend({item})

        data:extend({{
            type = 'recipe',
            name = 'empty-train-battery',
            energy_required = 30,
            enabled = true,
            icon = items['general']['graphics_location'] .. 'battery.png',
            icon_size = 64,
            subgroup = 'intermediate-product',
            order = 'zc',
            allow_productivity = true,
            ingredients = {{type = 'item', name = 'battery', amount = 50}},
            results = {{type = 'item', name = 'empty-train-battery', amount = 1}},
            main_product = 'empty-train-battery',
            localised_name = {'name.empty-train-battery'},
            localised_description = {'description.empty-train-battery'}
        }})

        item = table.deepcopy(data.raw['item']['nuclear-fuel'])
        item.name = 'charged-train-battery'
        item.burnt_result = 'empty-train-battery'
        item.fuel_value = '1GJ'
        item.icon = items['general']['graphics_location'] .. 'battery.png'
        item.stack_size = 10
        item.localised_name = {'name.charged-train-battery'}
        item.localised_description = {'description.charged-train-battery'}
        data:extend({item})

        data:extend({{
            type = 'recipe',
            name = 'charged-train-battery',
            energy_required = 60,
            enabled = true,
            icon = items['general']['graphics_location'] .. 'battery.png',
            icon_size = 64,
            subgroup = 'intermediate-product',
            ingredients = {{type = 'item', name = 'empty-train-battery', amount = 1}},
            results = {{type = 'item', name = 'charged-train-battery', probability = 0.995, amount = 1}, {type = 'item', name = 'battery', probability = 0.005, amount = 5}},
            main_product = 'charged-train-battery',
            localised_name = {'name.charged-train-battery'},
            localised_description = {'description.charged-train-battery'}
        }})

        local s = (7 + settings.startup['PHI-MI-TRAIN'].value) / 8

        for _, t in pairs({data.raw['locomotive'], data.raw['cargo-wagon'], data.raw['fluid-wagon'], data.raw['artillery-wagon']}) do
            for _, v in pairs(t) do
                v.max_health = (v.max_health and (v.max_health * s)) or nil
                v.max_speed = (v.max_speed and (v.max_speed * s)) or nil
                v.braking_force = (v.braking_force and (v.braking_force * s)) or nil
                v.inventory_size = (v.inventory_size and math.ceil(v.inventory_size * s)) or nil
                v.capacity = (v.capacity and math.ceil(v.capacity * s)) or nil

                if v.max_power then
                    v.max_power = tostring(tonumber(string.match(v.max_power, '[%d%.]+')) * s) .. string.match(v.max_power, '%a+')
                    v.reversing_power_modifier = 1

                    if v.energy_source then
                        v.energy_source.burnt_inventory_size = 1
                    end
                end
            end
        end
    end

    data.raw['utility-constants'].default.default_pipeline_extent = settings.startup['PHI-MI-PIPE-EXTENT'].value
    data.raw['utility-constants'].default.rocket_lift_weight = settings.startup['PHI-MI-ROCKET-CAPACITY'].value * 1000000
    data.raw['utility-constants'].default.default_item_weight = settings.startup['PHI-MI-CARGO-WEIGHT'].value
end

if (settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TOOL'].value) or (settings.startup['PHI-MI'].value) or (settings.startup['PHI-SA'].value and (settings.startup['PHI-SA-RESTRICTION'].value or settings.startup['PHI-SA-VANILLA'].value)) then
    data:extend({{type = 'recipe-category', name = 'fluid'}})

    item = table.deepcopy(data.raw['item']['offshore-pump'])
    item.name = 'super-pump'
    item.place_result = item.name
    item.order = 'b[fluids]-a[super-pump]-o'

    item.icons = {
        {
            icon = '__base__/graphics/icons/offshore-pump.png',
            tint = items['tint'][2],
            icon_size = 64,
            icon_mipmaps = 4
        }
    }

    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.localised_name = {'name.super-pump'}
    data:extend({item})

    entity = table.deepcopy(data.raw['offshore-pump']['offshore-pump'])
    entity.name = item.name
    entity.minable.result = item.name
    entity.type = 'assembling-machine'
    entity.crafting_categories = {'fluid'}
    entity.crafting_speed = 1
    entity.energy_source = {type = 'void'}

    entity.fluid_boxes = {{
        production_type = 'output',
        pipe_covers = table.deepcopy(entity.fluid_box.pipe_covers),
        volume = 6000,
        pipe_connections = {{
            flow_direction = 'output',
            connection_category = (mods['space-age'] and {'default', 'fusion-plasma'}) or {'default'},
            direction = defines.direction.south,
            position = {0, 0}
        }}
    }}

    entity.fluid_box = nil
    entity.fluid_boxes_off_when_no_fluid_recipe = false
    entity.effect_receiver = {uses_module_effects=false, uses_beacon_effects=false}
    entity.allowed_effects = {'consumption'}
    entity.tile_buildability_rules = nil
    entity.fluid_source_offset = nil
    entity.localised_name = {'phi-cl.combine', item.localised_name, ''}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = item.name,
        energy_required = 2,
        enabled = true,
        ingredients = {{type = 'item', name = 'electronic-circuit', amount = 2}, {type = 'item', name = 'pipe', amount = 1}, {type = 'item', name = 'iron-gear-wheel', amount = 1}},
        results = {{type = 'item', name = item.name, amount = 1}},
        main_product = item.name,
        localised_name = {'phi-cl.combine', item.localised_name, ''}
    }})

    if data.raw.fluid['water'] then
        data:extend({{
            type = 'recipe',
            name = 'pump-water',
            category = 'fluid',
            energy_required = 1,
            enabled = true,
            ingredients = {},
            results = {{type = 'fluid', name = 'water', amount = 12000, temperature = data.raw.fluid['water'].default_temperature}},
            main_product = 'water',
            hide_from_player_crafting = true,
            allow_productivity = false,
            crafting_machine_tint = {primary=data.raw.fluid['water'].flow_color},
            localised_name = {'phi-cl.combine', data.raw.fluid['water'].localised_name, ''}
        }})
    end
end

if settings.startup['PHI-SA'].value then
    if settings.startup['PHI-SA-SPOIL-FREEZE'].value and settings.startup['PHI-SA-SPOIL'].value and mods['space-age'] then
        local function spoil_handle(i)
            item = table.deepcopy(i)
            item.name = 'frozen-' .. i.name
            item.order = item.order .. '-f'

            item.icons = {
                {
                    icon = item.icon,
                    icon_size = 64,
                    icon_mipmaps = 4
                }, {
                    icon = data.raw['item']['ice'].icon,
                    tint = {r=1, g=1, b=1, a=0.5},
                    icon_size = 64,
                    icon_mipmaps = 4
                }
            }

            item.icon = nil
            item.icon_size = nil
            item.icon_mipmaps = nil
            item.spoil_ticks = math.floor(i.spoil_ticks * settings.startup['PHI-SA-SPOIL-FREEZE-RATIO'].value / 10)
            item.spoil_result = i.name
            item.spoil_to_trigger_result = nil
            item.localised_name = {'phi-cl.combine', 'item-name.' .. i.name, ''}
            data:extend({item})

            data:extend({{
                type = 'recipe',
                name = item.name,
                energy_required = 2,
                enabled = false,
                category = 'cryogenics',
                ingredients = {{type = 'item', name = i.name, amount = 1}, {type = 'fluid', name = 'fluoroketone-cold', amount = 2, ignored_by_stats = 2}},
                results = {{type = 'item', name = item.name, amount = 1}, {type = 'fluid', name = 'fluoroketone-hot', amount = 2, ignored_by_stats=2, ignored_by_productivity = 2}},
                allow_productivity = false,
                main_product = item.name,
                localised_name = {'phi-cl.combine', 'item-name.' .. i.name, ''}
            }})

            data:extend({{
                type = 'recipe',
                name = 'unfreeze-' .. i.name,
                energy_required = 2,
                enabled = false,
                category = 'cryogenics',
                ingredients = {{type = 'item', name = item.name, amount = 1}},
                results = {{type = 'item', name = i.name, amount = 1}},
                allow_productivity = false,
                main_product = i.name,
                localised_name = {'phi-cl.combine', 'item-name.' .. i.name, ''}
            }})

            table.insert(data.raw.technology['cryogenic-plant'].effects, {type = 'unlock-recipe', recipe = item.name})
            table.insert(data.raw.technology['cryogenic-plant'].effects, {type = 'unlock-recipe', recipe = 'unfreeze-' .. i.name})
        end

        for _, v in pairs({'nutrients', 'captive-biter-spawner', 'biter-egg', 'pentapod-egg'}) do
            spoil_handle(data.raw['item'][v])
        end

        for _, v in pairs({'raw-fish', 'yumako-mash', 'yumako', 'jelly', 'jellynut', 'bioflux'}) do
            spoil_handle(data.raw['capsule'][v])
        end

        spoil_handle(data.raw.tool['agricultural-science-pack'])
    end

    if (not settings.startup['PHI-SA-SPOIL'].value) and mods['space-age'] then
        local function spoil_handle(i)
            i.spoil_ticks = nil
            i.spoil_result = nil
            i.spoil_to_trigger_result = nil
        end

        for _, v in pairs({'nutrients', 'captive-biter-spawner', 'biter-egg', 'pentapod-egg'}) do
            spoil_handle(data.raw['item'][v])
        end

        for _, v in pairs({'raw-fish', 'yumako-mash', 'yumako', 'jelly', 'jellynut', 'bioflux'}) do
            spoil_handle(data.raw['capsule'][v])
        end

        spoil_handle(data.raw.tool['agricultural-science-pack'])

        data:extend({{
            type = 'recipe',
            name = 'spoilage-from-nutrients',
            energy_required = 1,
            enabled = false,
            ingredients = {{type = 'item', name = 'nutrients', amount = 1}},
            results = {{type = 'item', name = 'spoilage', amount = 10}},
            main_product = 'spoilage',
            localised_name = {'phi-cl.combine', 'item-name.spoilage', ''}
        }})

        table.insert(data.raw.technology['agriculture'].effects, {type = 'unlock-recipe', recipe = 'spoilage-from-nutrients'})

        for _, v in pairs({'spoilables', 'spoilables-result', 'spoilables-research'}) do
            data.raw['tips-and-tricks-item'][v] = nil
        end
    end

    if (settings.startup['PHI-SA-RESTRICTION'].value or settings.startup['PHI-SA-VANILLA'].value) and mods['space-age'] then
        for k, v in pairs(items['space-age']['PHI-SA-RESTRICTION']['surface_conditions']) do
            data.raw[v][k].surface_conditions = nil
        end

        for _, v in pairs(data.raw.recipe) do
            v.surface_conditions = nil
        end
    end

    if settings.startup['PHI-SA-RESTRICTION'].value and mods['space-age'] then
        data.raw['character']['character']['mining_categories'] = {'basic-solid', 'hard-solid'}

        for _, v in pairs({'heavy-oil', 'lava', 'ammoniacal-solution'}) do
            if data.raw.fluid[v] then
                data:extend({{
                    type = 'recipe',
                    name = 'pump-' .. v,
                    category = 'fluid',
                    energy_required = 1,
                    enabled = true,
                    ingredients = {},
                    results = {{type = 'fluid', name = v, amount = 16000, temperature = data.raw.fluid[v].default_temperature}},
                    main_product = v,
                    hide_from_player_crafting = true,
                    allow_productivity = false,
                    crafting_machine_tint = {primary=data.raw.fluid[v].flow_color},
                    localised_name = data.raw.fluid[v].localised_name
                }})
            end
        end

        for _, v in pairs({'artificial-yumako-soil', 'overgrowth-yumako-soil', 'artificial-jellynut-soil', 'overgrowth-jellynut-soil'}) do
            data.raw.tile[v].sprite_usage_surface = 'any'
            data.raw.item[v].place_as_tile.condition = {layers = {water_tile = true}}
            data.raw.item[v].place_as_tile.tile_condition = nil
        end

        for _, v in pairs({'tree-plant', 'yumako-tree', 'jellystem'}) do
            data.raw['plant'][v].autoplace.tile_restriction = nil
        end

        local asteroid_util = require('__space-age__.prototypes.planet.asteroid-spawn-definitions')
        data.raw.planet['nauvis'].asteroid_spawn_influence = 1

        local pb = {
            has_promethium_asteroids = true,
            type_ratios = {},
            probability_on_range_chunk = {},
            probability_on_range_small = {},
            probability_on_range_medium = {},
            probability_on_range_big = {},
            probability_on_range_huge = {},
        }

        local distance = {0.001, 0.199, 0.399, 0.599, 0.799, 0.999}

        for i = 1, 6 do
            table.insert(pb.type_ratios, {position = distance[i], ratios = {1, 1, 1, 1}})
            table.insert(pb.probability_on_range_chunk, {position = distance[i], probability = 0.0312 - (0.0031 * i), angle_when_stopped = asteroid_util.chunk_angle})
            table.insert(pb.probability_on_range_small, {position = distance[i], probability = 0.0273 - (0.0027 * i), angle_when_stopped = asteroid_util.small_angle})
            table.insert(pb.probability_on_range_medium, {position = distance[i], probability = 0.0234, angle_when_stopped = asteroid_util.medium_angle})
            table.insert(pb.probability_on_range_big, {position = distance[i], probability = 0.0195 + (0.0027 * i), angle_when_stopped = asteroid_util.big_angle})
            table.insert(pb.probability_on_range_huge, {position = distance[i], probability = 0.0156 + (0.0031 * i), angle_when_stopped = asteroid_util.huge_angle})
        end

        data.raw.planet['nauvis'].asteroid_spawn_definitions = asteroid_util.spawn_definitions(pb, 0.001)

        for _, v in pairs(data.raw['asteroid']) do
            v.mass = 1

            for _, v2 in pairs(v.resistances) do
                v2.percent = (v2.percent > 98 and 98) or v2.percent
            end
        end
    end

    if settings.startup['PHI-SA-QUALITY'].value and mods['quality'] then
        for _, v in pairs(data.raw.module) do
            if v.category and v.category == 'quality' then
                v.effect.quality = v.effect.quality * settings.startup['PHI-SA-QUALITY'].value / 10

            elseif v.category and v.category == 'speed' then
                v.effect.quality = nil
            end
        end
    end

    if (settings.startup['PHI-SA-MAX-QUALITY'].value or settings.startup['PHI-SA-VANILLA'].value) and mods['space-age'] then
        for _, v in pairs({'quality-module', 'quality-module-2', 'quality-module-3'}) do
            data.raw.technology[v] = nil
            data.raw.module[v] = nil
            data.raw.recipe[v] = nil
            data.raw.recipe[v .. '-recycling'] = nil
        end

        data.raw.technology['epic-quality'] = nil
        data.raw.technology['legendary-quality'] = nil

        for _, v in pairs({'uncommon', 'rare', 'epic', 'legendary'}) do
            data.raw.quality[v].hidden = true
            data.raw.quality[v].hidden_in_factoriopedia = true
        end

        data.raw.quality.normal.next = nil
        data.raw.quality.normal.next_probability = nil
        data.raw.quality.normal.hidden = true
        data.raw.quality.normal.hidden_in_factoriopedia = true

        data.raw['tips-and-tricks-item']['quality'] = nil
        data.raw['tips-and-tricks-item']['quality-modules'] = nil
        data.raw['tips-and-tricks-item']['quality-factoriopedia'] = nil
        data.raw['tips-and-tricks-item']['quality-probabilities'] = nil

        data.raw['produce-achievement']['crafting-with-quality'] = nil
        data.raw['module-transfer-achievement']['make-it-better'] = nil
        data.raw['produce-achievement']['my-modules-are-legendary'] = nil
        data.raw['equip-armor-achievement']['look-at-my-shiny-rare-armor'] = nil
        data.raw['use-item-achievement']['todays-fish-is-trout-a-la-creme'] = nil
        data.raw['place-equipment-achievement']['no-room-for-more'] = nil
    end

    if settings.startup['PHI-SA-MAX-QUALITY'].value and mods['quality'] then
        data.raw.quality.normal.level = 5
        data.raw.quality.normal.beacon_power_usage_multiplier = 1 / 6
        data.raw.quality.normal.mining_drill_resource_drain_multiplier = 1 / 6
        data.raw.quality.normal.science_pack_drain_multiplier = 19 / 20

        for _, v in pairs(data.raw['inserter']) do
            v.extension_speed = v.extension_speed * 2.5
            v.rotation_speed = v.rotation_speed * 2.5
        end
    end

    if settings.startup['PHI-SA-HEAT-RADIUS'].value and mods['space-age'] then
        for _, v in pairs({data.raw['heat-pipe'], data.raw['reactor']}) do
            for _, v2 in pairs(v) do
                v2.heating_radius = settings.startup['PHI-SA-HEAT-RADIUS'].value
            end
        end
    end

    if (settings.startup['PHI-SA-GENERIC'].value or settings.startup['PHI-SA-VANILLA'].value) and mods['space-age'] then
        data.raw.resource['lithium-brine'].infinite = true
        data.raw.resource['lithium-brine'].minimum = 60000
        data.raw.resource['lithium-brine'].normal = 300000
        data.raw.resource['lithium-brine'].infinite_depletion_amount = 10
        data.raw.resource['fluorine-vent'].minimum = 60000
        data.raw.resource['fluorine-vent'].normal = 300000

        data.raw['roboport']['roboport'].charging_station_count_affected_by_quality = true
        data.raw['roboport-equipment']['personal-roboport-equipment'].charging_station_count_affected_by_quality = true
        data.raw['space-platform-hub']['space-platform-hub'].platform_repair_speed_modifier = 2
        data.raw['space-platform-hub']['space-platform-hub'].inventory_size = 119
        data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus = 40
        data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size = 60
        data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size = 60

        data.raw.technology['foundation'].prerequisites = {'elevated-rail', 'rail-support-foundations'}
        data.raw.technology['foundation'].unit.count_formula = '1000'
        data.raw.technology['foundation'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        data.raw.technology['rail-support-foundations'].prerequisites = {'elevated-rail'}
        data.raw.technology['rail-support-foundations'].unit.count = 600
        data.raw.technology['rail-support-foundations'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        data.raw.technology['elevated-rail'].prerequisites = {'concrete'}
        data.raw.technology['elevated-rail'].unit.count = 200
        data.raw.technology['elevated-rail'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}

        data.raw.recipe['foundation'].ingredients = {{type = 'item', name = 'stone', amount = 40}, {type = 'item', name = 'refined-concrete', amount = 20}, {type = 'item', name = 'steel-plate', amount = 20}}
        data.raw.recipe['foundation'].results = {{type = 'item', name = 'foundation', amount = 10}}
        data.raw.recipe['atomic-bomb'].ingredients[3] = {type = 'item', name = 'uranium-235', amount = 30}
        data.raw.recipe['artillery-turret'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'concrete', amount = 60}, {type = 'item', name = 'iron-gear-wheel', amount = 40}, {type = 'item', name = 'advanced-circuit', amount = 20}}
        data.raw.recipe['artillery-shell'].ingredients = {{type = 'item', name = 'explosive-cannon-shell', amount = 4}, {type = 'item', name = 'radar', amount = 1}, {type = 'item', name = 'explosives', amount = 8}}
        data.raw.recipe['artillery-wagon'].ingredients = {{type = 'item', name = 'engine-unit', amount = 64}, {type = 'item', name = 'iron-gear-wheel', amount = 10}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'pipe', amount = 16}, {type = 'item', name = 'advanced-circuit', amount = 20}}

        table.insert(data.raw['thruster']['thruster'].fuel_fluid_box.pipe_connections, {flow_direction = 'input-output', direction = defines.direction.west, position = {-1.5, 2}})
        table.insert(data.raw['thruster']['thruster'].oxidizer_fluid_box.pipe_connections, {flow_direction = 'input-output', direction = defines.direction.east, position = {1.5, 2}})

        for _, v in pairs(data.raw['cargo-wagon']) do
            v.quality_affects_inventory_size = true
        end

        for _, v in pairs(data.raw['fluid-wagon']) do
            v.quality_affects_inventory_size = true
        end

        data.raw.tile['space-platform-foundation'].max_health = data.raw.tile['space-platform-foundation'].max_health * 2
        data.raw.item['space-platform-foundation'].stack_size = 100

        data.raw['ammo-turret']['railgun-turret'].starting_attack_speed = 1
        data.raw['ammo-turret']['railgun-turret'].starting_attack_speed_secondary = 1
        data.raw['ammo-turret']['railgun-turret'].starting_attack_speed_when_killed = 1
        data.raw['ammo-turret']['railgun-turret'].preparing_speed = 1
        data.raw['ammo-turret']['railgun-turret'].attacking_speed = 1
        data.raw['ammo-turret']['railgun-turret'].ending_attack_speed = 1
        data.raw['ammo-turret']['railgun-turret'].folding_speed = 1
        data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit = tonumber(string.match(data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit, '[%d%.]+')) * 32 .. string.match(data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit, '%a+')

        for _, v in pairs({'carbonic-asteroid-chunk', 'metallic-asteroid-chunk', 'promethium-asteroid-chunk', 'oxide-asteroid-chunk', 'artillery-shell'}) do
            if data.raw.item[v] then
                data.raw.item[v].stack_size = data.raw['inserter']['stack-inserter'].max_belt_stack_size
            end
        end

        for _, v in pairs(data.raw.tile) do
            if v.fluid then
                v.destroys_dropped_items = true
                v.default_destroyed_dropped_item_trigger = nil
            end
        end

        for _, v in pairs(data.raw.recipe) do
            if v.maximum_productivity then
                v.maximum_productivity = nil
            end
        end
    end

    if settings.startup['PHI-SA-VANILLA'].value then
        if mods['space-age'] then
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
                data.raw['utility-constants']['default'].main_menu_simulations[v] = nil
            end

            data.raw['dont-build-entity-achievement']['logistic-network-embargo'].research_with = nil
            data.raw['create-platform-achievement']['reach-for-the-stars'] = nil
            data.raw['complete-objective-achievement']['second-star-to-the-right-and-straight-on-till-morning'] = nil
            data.raw['dont-research-before-researching-achievement']['rush-to-space'] = nil

            for _, v in pairs({'shattered-planet-1', 'shattered-planet-2', 'shattered-planet-3'}) do
                data.raw['space-connection-distance-traveled-achievement'][v] = nil
            end

            data.raw.technology['rocket-silo'].effects = {{type = 'unlock-recipe', recipe = 'rocket-silo'}, {type = 'unlock-recipe', recipe = 'rocket-part'}, {type = 'unlock-recipe', recipe = 'cargo-landing-pad'}}
            data.raw['rocket-silo']['rocket-silo'].launch_to_space_platforms = false
            data.raw['rocket-silo']['rocket-silo'].rocket_parts_required = 100
            data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size = 1
            data.raw['rocket-silo']['rocket-silo'].logistic_trash_inventory_size = 0
            data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size = 0

            local item_sounds = require('__base__/prototypes/item_sounds')

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
                    ingredients = {
                        {type = 'item', name = 'low-density-structure', amount = 100},
                        {type = 'item', name = 'solar-panel', amount = 100},
                        {type = 'item', name = 'accumulator', amount = 100},
                        {type = 'item', name = 'radar', amount = 5},
                        {type = 'item', name = 'processing-unit', amount = 100},
                        {type = 'item', name = 'rocket-fuel', amount = 50}
                    },
                    results = {{type = 'item', name = 'satellite', amount = 1}},
                    requester_paste_multiplier = 1
                }
            })

            data:extend({{
                type = 'technology',
                name = 'cargo-landing-pad-count',
                prerequisites = {'rocket-silo', 'space-science-pack'},
                effects = {{type = 'cargo-landing-pad-count', modifier = 1}},
                unit = {
                    count_formula = '1000 * L',
                    ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}},
                    time = 60
                },
                icons = {
                    {
                        icon = '__base__/graphics/technology/rocket-silo.png',
                        icon_size = 256,
                        tint = items['tint'][8]
                    },
                    {
                      icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png',
                      icon_size = 128,
                      scale = 0.5,
                      shift = {50, 50}
                    }
                },
                order = 'a-i-a',
                max_level = 'infinite',
                upgrade = true,
                localised_name = {'phi-cl.combine', {'entity-name.cargo-landing-pad'}, ''}
            }})

            data:extend({{
                type = 'technology',
                name = 'concrete-productivity',
                prerequisites = {'concrete', 'production-science-pack'},
                effects = {{type = 'change-recipe-productivity', recipe = 'concrete', change = 0.1}, {type = 'change-recipe-productivity', recipe = 'refined-concrete', change = 0.1}},
                unit = {
                    count_formula = '500 * (1.2 ^ L)',
                    ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}},
                    time = 30
                },
                icons = {
                    {
                        icon = '__base__/graphics/technology/concrete.png',
                        icon_size = 256,
                        tint = items['tint'][8]
                    },
                    {
                      icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png',
                      icon_size = 128,
                      scale = 0.5,
                      shift = {50, 50}
                    }
                },
                order = 'a-i-b',
                max_level = 10,
                upgrade = true,
                localised_name = {'phi-cl.combine', {'item-name.concrete'}, ''}
            }})

            data:extend({{
                type = 'technology',
                name = 'landfill-productivity',
                prerequisites = {'landfill', 'production-science-pack'},
                effects = {{type = 'change-recipe-productivity', recipe = 'landfill', change = 0.1}},
                unit = {
                    count_formula = '500 * (1.2 ^ L)',
                    ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}},
                    time = 30
                },
                icons = {
                    {
                        icon = '__base__/graphics/technology/concrete.png',
                        icon_size = 256,
                        tint = items['tint'][8]
                    },
                    {
                      icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png',
                      icon_size = 128,
                      scale = 0.5,
                      shift = {50, 50}
                    }
                },
                order = 'a-i-c',
                max_level = 10,
                upgrade = true,
                localised_name = {'phi-cl.combine', {'item-name.landfill'}, ''}
            }})

            for _, v in pairs({'calcite', 'fluorine_vent', 'lithium_brine', 'scrap', 'tungsten_ore'}) do
                data.raw.planet['nauvis'].map_gen_settings.autoplace_controls[v] = nil
                data.raw.planet['nauvis'].map_gen_settings.autoplace_settings.entity.settings[v:gsub('_', '-')] = nil
            end

            for _, v in pairs({'tungsten-ore', 'calcite'}) do
                if data.raw.resource[v] then
                    data.raw.resource[v].hidden = true
                    data.raw.resource[v].hidden_in_factoriopedia = true
                end
            end

            data.raw.planet['nauvis'].map_gen_settings.autoplace_controls['gleba_enemy_base'] = nil
            data.raw.planet['nauvis'].map_gen_settings.autoplace_controls['gleba_plants'] = nil

            for _, v in pairs({'natural-yumako-soil', 'natural-jellynut-soil', 'wetland-yumako', 'wetland-jellynut', 'lowland-brown-blubber', 'lowland-olive-blubber', 'lowland-olive-blubber-2', 'lowland-olive-blubber-3', 'lowland-cream-red', 'lowland-red-vein', 'lowland-red-vein-2', 'lowland-red-vein-3', 'lowland-red-vein-4', 'lowland-red-vein-dead', 'lowland-red-infection', 'ammoniacal-ocean', 'ammoniacal-ocean-2'}) do
                data.raw.planet['nauvis'].map_gen_settings.autoplace_settings.tile.settings[v] = nil
            end

            data.raw.recipe['landfill'].ingredients = {{type = 'item', name = 'stone', amount = math.min(20, tonumber(settings.startup['PHI-MI-LANDFILL'].value) or 20)}}

            data.raw.technology['cliff-explosives'].prerequisites = {'explosives', 'military-2'}
            data.raw.technology['cliff-explosives'].unit.count = 200
            data.raw.technology['cliff-explosives'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}
            data.raw.technology['space-science-pack'].research_trigger = nil
            data.raw.technology['space-science-pack'].prerequisites = {'rocket-silo'}
            data.raw.technology['space-science-pack'].effects = {{type = 'unlock-recipe', recipe = 'satellite'}}
            data.raw.technology['space-science-pack'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
            data.raw.technology['space-science-pack'].unit = {count = 2000, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
            data.raw.technology['cliff-explosives'].effects = {{type = 'unlock-recipe', recipe = 'cliff-explosives'}, {type = 'cliff-deconstruction-enabled', modifier = true}}
            data.raw.technology['logistic-system'].prerequisites = {'logistic-robotics'}
            data.raw.technology['logistic-system'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
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
            data.raw.technology['coal-liquefaction'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}
            data.raw.technology['speed-module-2'].prerequisites = {'speed-module'}
            data.raw.technology['speed-module-2'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['speed-module-3'].prerequisites = {'speed-module-2'}
            data.raw.technology['speed-module-3'].unit.count = 400
            data.raw.technology['speed-module-3'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['productivity-module-2'].prerequisites = {'productivity-module'}
            data.raw.technology['productivity-module-2'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['productivity-module-3'].prerequisites = {'productivity-module-2'}
            data.raw.technology['productivity-module-3'].unit.count = 400
            data.raw.technology['productivity-module-3'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['efficiency-module-2'].prerequisites = {'efficiency-module'}
            data.raw.technology['efficiency-module-2'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['efficiency-module-3'].prerequisites = {'efficiency-module-2'}
            data.raw.technology['efficiency-module-3'].unit.count = 400
            data.raw.technology['efficiency-module-3'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['kovarex-enrichment-process'].prerequisites = {'uranium-processing'}
            data.raw.technology['kovarex-enrichment-process'].unit = {count = 1500, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
            data.raw.technology['fusion-reactor'].prerequisites = {'nuclear-power', 'space-science-pack'}
            data.raw.technology['fusion-reactor'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            table.insert(data.raw.technology['fusion-reactor'].effects, {type = 'unlock-recipe', recipe = 'fluoroketone'})
            table.insert(data.raw.technology['fusion-reactor'].effects, {type = 'unlock-recipe', recipe = 'fluoroketone-cooling'})
            data.raw.technology['fusion-reactor-equipment'].prerequisites = {'fission-reactor-equipment', 'fusion-reactor'}
            data.raw.technology['fusion-reactor-equipment'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['artillery'].prerequisites = {'military-4', 'radar'}
            data.raw.technology['artillery'].prerequisites = {'military-4', 'tank', 'concrete', 'radar'}
            data.raw.technology['artillery'].unit.count = 2000
            data.raw.technology['artillery'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
            data.raw.technology['artillery-shell-range-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['artillery-shell-speed-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['artillery-shell-damage-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['battery-mk3-equipment'].prerequisites = {'battery-mk2-equipment'}
            data.raw.technology['battery-mk3-equipment'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['rocket-turret'].effects = {{type = 'unlock-recipe', recipe = 'rocket-turret'}}
            data.raw.technology['rocket-turret'].prerequisites = {'rocketry', 'stronger-explosives-2'}
            data.raw.technology['rocket-turret'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['toolbelt-equipment'].prerequisites = {'power-armor', 'toolbelt'}
            data.raw.technology['toolbelt-equipment'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['big-mining-drill'].prerequisites = {'electric-mining-drill', 'automation-3'}
            data.raw.technology['big-mining-drill'].unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
            data.raw.technology['big-mining-drill'].research_trigger = nil
            data.raw.technology['turbo-transport-belt'].prerequisites = {'logistics-3'}
            data.raw.technology['turbo-transport-belt'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
            data.raw.technology['railgun'].prerequisites = {'military-4'}
            data.raw.technology['railgun'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['railgun-damage-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['railgun-shooting-speed-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['tesla-weapons'].prerequisites = {'military-4'}
            data.raw.technology['tesla-weapons'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
            data.raw.technology['mech-armor'].prerequisites = {'power-armor-mk2'}
            data.raw.technology['mech-armor'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['stack-inserter'].prerequisites = {'bulk-inserter'}
            data.raw.technology['stack-inserter'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
            data.raw.technology['power-armor-mk2'].prerequisites = {'power-armor', 'military-4', 'speed-module-2', 'efficiency-module-2'}
            data.raw.technology['health'].prerequisites = {'utility-science-pack'}
            data.raw.technology['health'].unit.ingredients = {{'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
            data.raw.technology['processing-unit-productivity'].prerequisites = {'processing-unit'}
            data.raw.technology['processing-unit-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}
            data.raw.technology['processing-unit-productivity'].max_level = 10
            data.raw.technology['steel-plate-productivity'].prerequisites = {'steel-processing'}
            data.raw.technology['steel-plate-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'steel-plate', change = 0.1}}
            data.raw.technology['steel-plate-productivity'].max_level = 10
            data.raw.technology['low-density-structure-productivity'].prerequisites = {'low-density-structure'}
            data.raw.technology['low-density-structure-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'low-density-structure', change = 0.1}}
            data.raw.technology['low-density-structure-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}
            data.raw.technology['low-density-structure-productivity'].max_level = 10
            data.raw.technology['plastic-bar-productivity'].prerequisites = {'plastics'}
            data.raw.technology['plastic-bar-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'plastic-bar', change = 0.1}}
            data.raw.technology['plastic-bar-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}
            data.raw.technology['plastic-bar-productivity'].max_level = 10
            data.raw.technology['rocket-fuel-productivity'].prerequisites = {'rocket-fuel'}
            data.raw.technology['rocket-fuel-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'rocket-fuel', change = 0.1}}
            data.raw.technology['rocket-fuel-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}
            data.raw.technology['rocket-fuel-productivity'].max_level = 10
            data.raw.technology['rocket-part-productivity'].prerequisites = {'rocket-silo'}
            data.raw.technology['rocket-part-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}
            data.raw.technology['rocket-part-productivity'].max_level = 10
            data.raw.technology['research-productivity'].prerequisites = {'space-science-pack'}
            data.raw.technology['research-productivity'].unit.count_formula = '1.5^L*2000'
            data.raw.technology['research-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['research-productivity'].max_level = 10
            data.raw.technology['transport-belt-capacity-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['transport-belt-capacity-2'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['electric-weapons-damage-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['electric-weapons-damage-2'].prerequisites = {'electric-weapons-damage-1'}
            data.raw.technology['electric-weapons-damage-2'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['electric-weapons-damage-3'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
            data.raw.technology['electric-weapons-damage-4'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
            data.raw.technology['spidertron'].prerequisites = {'exoskeleton-equipment', 'fission-reactor-equipment', 'military-4', 'production-science-pack', 'radar'}
            data.raw.technology['spidertron'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
            data.raw.technology['heating-tower'].prerequisites = {'automation-2'}
            data.raw.technology['heating-tower'].research_trigger = nil
            data.raw.technology['heating-tower'].effects = {{type = 'unlock-recipe', recipe = 'heating-tower'}}
            data.raw.technology['heating-tower'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
            data.raw.technology['agriculture'].prerequisites = {'chemical-science-pack'}
            data.raw.technology['agriculture'].research_trigger = nil
            data.raw.technology['agriculture'].effects = {{type = 'unlock-recipe', recipe = 'agricultural-tower'}}
            data.raw.technology['agriculture'].unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
            data.raw.technology['tree-seeding'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
            data.raw.technology['electromagnetic-plant'].prerequisites = {'automation-3'}
            data.raw.technology['electromagnetic-plant'].research_trigger = nil
            data.raw.technology['electromagnetic-plant'].effects = {{type = 'unlock-recipe', recipe = 'electromagnetic-plant'}}
            data.raw.technology['electromagnetic-plant'].unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
            data.raw.technology['cryogenic-plant'].prerequisites = {'automation-3'}
            data.raw.technology['cryogenic-plant'].research_trigger = nil
            data.raw.technology['cryogenic-plant'].effects = {{type = 'unlock-recipe', recipe = 'cryogenic-plant'}}
            data.raw.technology['cryogenic-plant'].unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
            data.raw.technology['foundry'].prerequisites = {'automation-3'}
            data.raw.technology['foundry'].research_trigger = nil
            data.raw.technology['foundry'].effects = {{type = 'unlock-recipe', recipe = 'foundry'}}
            data.raw.technology['foundry'].unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
            data.raw.technology['biolab'].prerequisites = {'production-science-pack', 'utility-science-pack'}
            data.raw.technology['biolab'].unit = {count = 800, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}

            for k, v in pairs(items['space-age']['PHI-SA-VANILLA']['technology']) do
                data.raw.technology[k].hidden = v
                data.raw.technology[k].hidden_in_factoriopedia = v

                if data.raw.technology[k].unit and data.raw.technology[k].unit.ingredients then
                    data.raw.technology[k].unit.ingredients = {{'space-science-pack', 1}}
                end
            end

            for k, v in pairs(items['space-age']['PHI-SA-VANILLA']['recipe']) do
                if data.raw.recipe[k] then
                    data.raw.recipe[k].hidden = v
                    data.raw.recipe[k].hidden_in_factoriopedia = v
                end
            end

            data.raw.recipe['cliff-explosives'].ingredients = {{type = 'item', name = 'explosives', amount = 10}, {type = 'item', name = 'grenade', amount = 1}, {type = 'item', name = 'barrel', amount = 1}}
            data.raw.recipe['big-mining-drill'].category = nil
            data.raw.recipe['big-mining-drill'].ingredients = {{type = 'item', name = 'electric-mining-drill', amount = 1}, {type = 'item', name = 'steel-plate', amount = 20}, {type = 'item', name = 'electric-engine-unit', amount = 10}, {type = 'item', name = 'advanced-circuit', amount = 10}}
            data.raw.recipe['turbo-transport-belt'].category = 'crafting-with-fluid'
            data.raw.recipe['turbo-transport-belt'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'express-transport-belt', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 20}}
            data.raw.recipe['turbo-underground-belt'].category = 'crafting-with-fluid'
            data.raw.recipe['turbo-underground-belt'].ingredients = {{type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'express-underground-belt', amount = 2}, {type = 'fluid', name = 'lubricant', amount = 40}}
            data.raw.recipe['turbo-splitter'].category = 'crafting-with-fluid'
            data.raw.recipe['turbo-splitter'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'express-splitter', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 80}}
            data.raw.recipe['express-transport-belt'].category = 'crafting-with-fluid'
            data.raw.recipe['express-underground-belt'].category = 'crafting-with-fluid'
            data.raw.recipe['express-splitter'].category = 'crafting-with-fluid'
            data.raw.recipe['stack-inserter'].ingredients = {{type = 'item', name = 'processing-unit', amount = 2}, {type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'bulk-inserter', amount = 1}}
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
            data.raw.recipe['cliff-explosives'].ingredients = {{type = 'item', name = 'explosives', amount = 10}, {type = 'item', name = 'grenade', amount = 1}, {type = 'item', name = 'barrel', amount = 1}}
            data.raw.recipe['tesla-ammo'].category = 'crafting-with-fluid'
            data.raw.recipe['tesla-ammo'].ingredients = {{type = 'item', name = 'battery', amount = 1}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 10}}
            data.raw.recipe['teslagun'].category = 'crafting-with-fluid'
            data.raw.recipe['teslagun'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
            data.raw.recipe['tesla-turret'].category = 'crafting-with-fluid'
            data.raw.recipe['tesla-turret'].ingredients = {{type = 'item', name = 'teslagun', amount = 1}, {type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 500}}
            data.raw.recipe['mech-armor'].ingredients = {{type = 'item', name = 'power-armor-mk2', amount = 1}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'battery', amount = 50}}
            data.raw.recipe['railgun'].category = 'crafting-with-fluid'
            data.raw.recipe['railgun'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 20}, {type = 'item', name = 'battery', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 10}}
            data.raw.recipe['railgun-turret'].category = 'crafting-with-fluid'
            data.raw.recipe['railgun-turret'].ingredients = {{type = 'item', name = 'steel-plate', amount = 30}, {type = 'item', name = 'processing-unit', amount = 50}, {type = 'item', name = 'battery', amount = 50}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
            data.raw.recipe['rocket-turret'].category = 'crafting'
            data.raw.recipe['rocket-turret'].ingredients = {{type = 'item', name = 'rocket-launcher', amount = 4}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'processing-unit', amount = 4}, {type = 'item', name = 'iron-gear-wheel', amount = 20}}
            data.raw.recipe['fusion-reactor'].category = 'crafting'
            data.raw.recipe['fusion-reactor'].ingredients = {{type = 'item', name = 'nuclear-reactor', amount = 1}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'processing-unit', amount = 450}}
            data.raw.recipe['fusion-generator'].category = 'crafting'
            data.raw.recipe['fusion-generator'].ingredients = {{type = 'item', name = 'steam-turbine', amount = 1}, {type = 'item', name = 'steel-plate', amount = 100}, {type = 'item', name = 'processing-unit', amount = 150}}
            data.raw.recipe['fusion-power-cell'].category = 'crafting-with-fluid'
            data.raw.recipe['fusion-power-cell'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'fluid', name = 'petroleum-gas', amount = 100}}
            data.raw.recipe['fusion-reactor-equipment'].category = 'crafting'
            data.raw.recipe['fusion-reactor-equipment'].ingredients = {{type = 'item', name = 'fission-reactor-equipment', amount = 1}, {type = 'item', name = 'fusion-power-cell', amount = 10}, {type = 'item', name = 'steel-plate', amount = 350}, {type = 'item', name = 'processing-unit', amount = 275}}
            data.raw.recipe['fluoroketone'].category = 'chemistry'
            data.raw.recipe['fluoroketone'].ingredients = {{type = 'fluid', name = 'light-oil', amount = 50}, {type = 'fluid', name = 'petroleum-gas', amount = 50}, {type = 'item', name = 'steel-plate', amount = 1}}
            data.raw.recipe['fluoroketone-cooling'].category = 'chemistry'
            data.raw.recipe['fusion-power-cell'].category = 'crafting-with-fluid'
            data.raw.recipe['fusion-power-cell'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'fluid', name = 'petroleum-gas', amount = 100}}
            data.raw.recipe['agricultural-tower'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electronic-circuit', amount = 3}, {type = 'item', name = 'landfill', amount = 1}}
            data.raw.recipe['electromagnetic-plant'].category = 'crafting'
            data.raw.recipe['electromagnetic-plant'].ingredients = {{type = 'item', name = 'steel-plate', amount = 50}, {type = 'item', name = 'processing-unit', amount = 50}, {type = 'item', name = 'refined-concrete', amount = 50}}
            data.raw.recipe['cryogenic-plant'].category = 'crafting'
            data.raw.recipe['cryogenic-plant'].ingredients = {{type = 'item', name = 'steel-plate', amount = 20}, {type = 'item', name = 'processing-unit', amount = 20}, {type = 'item', name = 'refined-concrete', amount = 40}}
            data.raw.recipe['biolab'].ingredients = {{type = 'item', name = 'lab', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 25}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'uranium-235', amount = 3}}

            data.raw['agricultural-tower']['agricultural-tower'].energy_source.emissions_per_minute = { pollution = -1 }
            data.raw['assembling-machine']['electromagnetic-plant'].effect_receiver = nil
            data.raw['lab']['biolab'].science_pack_drain_rate_percent = 100
            data.raw['assembling-machine']['foundry'].effect_receiver = nil
            data.raw['assembling-machine']['foundry'].crafting_categories = {table.unpack(data.raw['furnace']['electric-furnace'].crafting_categories)}

            data.raw['plant']['yumako-tree'].hidden = true
            data.raw['plant']['yumako-tree'].hidden_in_factoriopedia = true
            data.raw['plant']['jellystem'].hidden = true
            data.raw['plant']['jellystem'].hidden_in_factoriopedia = true

            data.raw['unit-spawner']['biter-spawner'].captured_spawner_entity = nil
            data.raw['unit-spawner']['spitter-spawner'].captured_spawner_entity = nil

            data.raw.fluid['fluoroketone-cold'].auto_barrel = false
            data.raw.fluid['fluoroketone-hot'].auto_barrel = false

            data.raw.tool['agricultural-science-pack'].hidden = true
            data.raw.tool['agricultural-science-pack'].hidden_in_factoriopedia = true
            data.raw.tool['cryogenic-science-pack'].hidden = true
            data.raw.tool['cryogenic-science-pack'].hidden_in_factoriopedia = true
            data.raw.tool['electromagnetic-science-pack'].hidden = true
            data.raw.tool['electromagnetic-science-pack'].hidden_in_factoriopedia = true
            data.raw.tool['metallurgic-science-pack'].hidden = true
            data.raw.tool['metallurgic-science-pack'].hidden_in_factoriopedia = true
            data.raw.tool['promethium-science-pack'].hidden = true
            data.raw.tool['promethium-science-pack'].hidden_in_factoriopedia = true

            for _, v in pairs(data.raw.lab) do
                v.inputs = {'automation-science-pack', 'logistic-science-pack', 'military-science-pack', 'chemical-science-pack', 'production-science-pack', 'utility-science-pack', 'space-science-pack'}
            end

            data.raw.capsule['bioflux'].hidden = true
            data.raw.capsule['bioflux'].hidden_in_factoriopedia = true
            data.raw.capsule['jelly'].hidden = true
            data.raw.capsule['jelly'].hidden_in_factoriopedia = true
            data.raw.capsule['jellynut'].hidden = true
            data.raw.capsule['jellynut'].hidden_in_factoriopedia = true
            data.raw.capsule['yumako'].hidden = true
            data.raw.capsule['yumako'].hidden_in_factoriopedia = true
            data.raw.capsule['yumako-mash'].hidden = true
            data.raw.capsule['yumako-mash'].hidden_in_factoriopedia = true

            data.raw['tips-and-tricks-item']['agriculture'] = nil
            data.raw['tips-and-tricks-item']['lava-processing'] = nil

            data.raw['group-attack-achievement']['it-stinks-and-they-do-like-it'] = nil
            data.raw['group-attack-achievement']['get-off-my-lawn'] = nil
            data.raw['research-with-science-pack-achievement']['research-with-metallurgics'] = nil
            data.raw['research-with-science-pack-achievement']['research-with-agriculture'] = nil
            data.raw['research-with-science-pack-achievement']['research-with-electromagnetics'] = nil
            data.raw['research-with-science-pack-achievement']['research-with-cryogenics'] = nil
            data.raw['research-with-science-pack-achievement']['research-with-promethium'] = nil
            data.raw['kill-achievement']['if-it-bleeds'] = nil
            data.raw['kill-achievement']['we-need-bigger-guns'] = nil
            data.raw['kill-achievement']['size-doesnt-matter'] = nil

            for _, v in pairs(data.raw.tree) do
                if v.minable and v.minable.results then
                    v.minable.results = {{type = 'item', name = 'wood', amount = 4}}
                end
            end
        end

        if mods['quality'] and (not settings.startup['PHI-SA-MAX-QUALITY'].value) then
            data.raw.quality.normal.level = 0
            data.raw.quality.normal.beacon_power_usage_multiplier = 1
            data.raw.quality.normal.mining_drill_resource_drain_multiplier = 1
            data.raw.quality.normal.science_pack_drain_multiplier = 1
        end
    end
end

if settings.startup['PHI-CT'].value then
    if settings.startup['PHI-CT-TOOL'].value then
        local item = table.deepcopy(data.raw['item']['radar'])
        item.name = 'super-radar'
        item.place_result = item.name
        item.order = 'd[radar]-b[radar]'

        item.icons = {
            {
                icon = item.icon or '__base__/graphics/icons/radar.png',
                tint = items['tint'][8],
                icon_size = item.icon_size or 64,
                icon_mipmaps = item.icon_mipmaps or 4
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'name.super-radar'}
        data:extend({item})

        local entity = table.deepcopy(data.raw['radar']['radar'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.max_distance_of_sector_revealed = 35
        entity.max_distance_of_nearby_sector_revealed = 35
        entity.pictures.layers[1].tint = items['tint'][8]
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            ingredients = {{type = 'item', name = 'electronic-circuit', amount = 5}, {type = 'item', name = 'iron-gear-wheel', amount = 5}, {type = 'item', name = 'iron-plate', amount = 10}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'name.' .. item.name}
        }})

        item = table.deepcopy(data.raw['item']['electric-energy-interface'])
        item.name = 'passive-energy-void'
        item.place_result = item.name
        item.localised_name = {'name.passive-energy-void'}
        data:extend({item})

        entity = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.energy_source.usage_priority = 'tertiary'
        entity.energy_source.emissions_per_minute = {pollution = 0}
        entity.energy_source.input_flow_limit = '1PW'
        entity.energy_source.output_flow_limit = '0W'
        entity.energy_source.buffer_capacity = '1PJ'
        entity.energy_production = '0W'
        entity.energy_usage = '1PW'
        entity.gui_mode = 'none'
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'accumulator', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        table.insert(data.raw.technology['electric-energy-accumulators'].effects, {type = 'unlock-recipe', recipe = item.name})

        for _, v in pairs(data.raw.fluid) do
            if v.subgroup == 'fluid' and (not data.raw[v.name]) then
                data:extend({{
                    type = 'recipe',
                    name = 'pump-' .. v.name,
                    category = 'fluid',
                    energy_required = 1,
                    enabled = true,
                    ingredients = {},
                    results = {{type = 'fluid', name = v.name, amount = 16000, temperature=v.max_temperature or v.default_temperature}},
                    main_product = v.name,
                    hide_from_player_crafting = true,
                    allow_productivity = false,
                    crafting_machine_tint = {primary=v.flow_color},
                    localised_name = v.localised_name
                }})
            end
        end
    end

    if settings.startup['PHI-CT-UTILITY'].value then
        for _, t in pairs({'arithmetic-combinator', 'decider-combinator', 'programmable-speaker', 'selector-combinator'}) do
            data.raw[t][t].energy_source.usage_priority = 'primary-input'
        end

        local item = table.deepcopy(data.raw['item']['steel-chest'])
        item.name = 'trash-chest'
        item.place_result = item.name
        item.order = 'b[storage]-h[trash-chest]'

        item.icons = {
            {
                icon = item.icon or '__base__/graphics/icons/steel-chest.png',
                tint = items['tint'][8],
                icon_size = item.icon_size or 64,
                icon_mipmaps = item.icon_mipmaps or 4
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'name.trash-chest'}
        data:extend({item})

        local entity = table.deepcopy(data.raw['container']['steel-chest'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.inventory_type = 'with_filters_and_bar'
        entity.inventory_size = 1
        entity.type = 'infinity-container'
        entity.gui_mode = 'none'
        entity.erase_contents_when_mined = true
        entity.quality_affects_inventory_size = false
        entity.logistic_mode = nil
        entity.next_upgrade = nil
        entity.surface_conditions = nil
        entity.picture.layers[1].tint = items['tint'][8]
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'steel-chest', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        table.insert(data.raw.technology['steel-processing'].effects, {type = 'unlock-recipe', recipe = item.name})

        item = table.deepcopy(data.raw['item']['pipe'])
        item.name = 'trash-pipe'
        item.place_result = item.name
        item.order = 'a[pipe]-c[trash-pipe]'

        item.icons = {
            {
                icon = item.icon or '__base__/graphics/icons/pipe.png',
                tint = items['tint'][8],
                icon_size = item.icon_size or 64,
                icon_mipmaps = item.icon_mipmaps or 4
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'name.trash-pipe'}
        data:extend({item})

        entity = table.deepcopy(data.raw['pipe']['pipe'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.inventory_size = 1
        entity.type = 'infinity-pipe'
        entity.gui_mode = 'none'
        entity.erase_contents_when_mined = true
        entity.next_upgrade = nil

        for _, v in pairs(entity.pictures) do
            v.tint = items['tint'][8]

            if v.hr_version then
                v.hr_version.tint = items['tint'][8]
            end
        end

        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'iron-plate', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        table.insert(data.raw.technology['automation'].effects, {type = 'unlock-recipe', recipe = item.name})

        item = table.deepcopy(data.raw['item']['boiler'])
        item.name = 'electric-boiler'
        item.place_result = item.name
        item.order = 'b[steam-power]-a[electric-boiler]'
        item.localised_name = {'name.electric-boiler'}
        data:extend({item})

        entity = table.deepcopy(data.raw['boiler']['boiler'])
        entity.name = item.name
        entity.energy_consumption = '7200kW'
        entity.buffer_capacity = '14400kJ'
        entity.target_temperature = 165
        entity.emissions_per_minute = {pollution = 0}
        entity.minable.result = entity.name
        entity.energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            buffer_capacity = entity.buffer_capacity,
            light_flicker = {
                color = {r=0.5, g=1, b=1, a=0.5},
                minimum_light_size = 0.1,
                light_intensity_to_size_coefficient = 1
            }
        }

        entity.fire_flicker_enabled = false
        entity.fire_glow_flicker_enabled = false
        entity.fire = {}
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            ingredients = {{type = 'item', name = 'boiler', amount = 1}, {type = 'item', name = 'electronic-circuit', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        -- electric boiler
        data.raw['boiler']['boiler'].fast_replaceable_group = 'boiler'
        data.raw['boiler']['electric-boiler'].fast_replaceable_group = data.raw['boiler']['electric-boiler'].fast_replaceable_group

        local chests = {
            'steel-chest',
            'passive-provider-chest',
            'active-provider-chest',
            'storage-chest',
            'buffer-chest',
            'requester-chest'
        }

        for _, c in pairs(chests) do
            item = table.deepcopy(data.raw['item'][c])
            item.name = 'basic-' .. c
            item.place_result = item.name
            item.order = 'b[storage]-h[basic-' .. c .. ']'
            item.localised_name = {'name.basic-' .. c}
            data:extend({item})

            entity = (c == 'steel-chest' and table.deepcopy(data.raw['container'][c])) or table.deepcopy(data.raw['logistic-container'][c])
            entity.name = item.name
            entity.minable.result = item.name
            entity.inventory_type = 'with_filters_and_bar'
            entity.inventory_size = 1
            entity.quality_affects_inventory_size = false
            entity.max_logistic_slots = (c == 'steel-chest' and nil) or 1
            entity.trash_inventory_size = (c == 'steel-chest' and nil) or 1

            entity.localised_name = item.localised_name
            data:extend({entity})

            data:extend({{
                type = 'recipe',
                name = item.name,
                energy_required = 2,
                enabled = false,
                ingredients = {{type = 'item', name =c, amount = 1}},
                results = {{type = 'item', name = item.name, amount = 1}},
                main_product = item.name,
                localised_name = item.localised_name
            }})
        end

        table.insert(data.raw.technology['steel-processing'].effects, {type = 'unlock-recipe', recipe = 'basic-steel-chest'})

        for _, t in pairs({'construction', 'logistic'}) do
            for _, r in pairs({'passive-provider', 'storage'}) do
                table.insert(data.raw.technology[t .. '-robotics'].effects, {type = 'unlock-recipe', recipe = 'basic-' .. r .. '-chest'})
            end
        end

        for _, r in pairs({'active-provider', 'buffer', 'requester'}) do
            table.insert(data.raw.technology['logistic-system'].effects, {type = 'unlock-recipe', recipe = 'basic-' .. r .. '-chest'})
        end
    end

    if settings.startup['PHI-CT-HIDDEN'].value then
        local item = table.deepcopy(data.raw['item']['linked-chest'])
        item.supgroup = 'storage'
        item.order = 'a[items]-d[linked-chest]'
        data:extend({item})

        local entity = table.deepcopy(data.raw['linked-container']['linked-chest'])
        entity.circuit_connector = table.deepcopy(data.raw['container']['steel-chest'].circuit_connector)
        entity.circuit_wire_max_distance = data.raw['container']['steel-chest'].circuit_wire_max_distance
        entity.quality_affects_inventory_size = false
        entity.inventory_type = 'with_filters_and_bar'
        entity.inventory_size = 48
        entity.gui_mode = 'all'
        entity.surface_conditions = nil
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'steel-chest', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name
        }})

        table.insert(data.raw.technology['steel-processing'].effects, {type = 'unlock-recipe', recipe = item.name})

        local s = data.raw['inserter']['stack-inserter'].max_belt_stack_size

        for _, l in pairs({'loader', 'fast-loader', 'express-loader', 'turbo-loader'}) do
            if data.raw.recipe[l] then
                data.raw.recipe[l].hidden = false
            end

            if data.raw['loader'][l] then
                data.raw['loader'][l].filter_count = 2
                data.raw['loader'][l].per_lane_filters = true
                data.raw['loader'][l].adjustable_belt_stack_size = true
                data.raw['loader'][l].max_belt_stack_size = s
            end
        end

        table.insert(data.raw.technology['logistics'].effects, {type = 'unlock-recipe', recipe = 'loader'})
        table.insert(data.raw.technology['logistics-2'].effects, {type = 'unlock-recipe', recipe = 'fast-loader'})
        table.insert(data.raw.technology['logistics-3'].effects, {type = 'unlock-recipe', recipe = 'express-loader'})

        if mods['space-age'] then
            table.insert(data.raw.technology['turbo-transport-belt'].effects, {type = 'unlock-recipe', recipe = 'turbo-loader'})
        end
    end

    if settings.startup['PHI-CT-TILE'].value then
        for _, v in pairs(data.raw.planet) do
            if v.map_gen_settings and v.map_gen_settings.autoplace_settings then
                if v.map_gen_settings.autoplace_settings.tile and v.map_gen_settings.autoplace_settings.tile.settings then
                    for _, e in pairs (v.map_gen_settings.autoplace_settings.tile.settings) do
                        e.frequency = 0.0
                        e.size = 0.0
                        e.richness = 0.0
                    end

                    v.map_gen_settings.autoplace_settings.tile.settings[settings.startup['PHI-CT-TILE-CHOICE'].value] = {
                        frequency = 1.0,
                        size = 1.0,
                        richness = 1.0
                    }
                end

                if v.map_gen_settings.autoplace_settings.decorative and v.map_gen_settings.autoplace_settings.decorative.settings then
                    for _, e in pairs(v.map_gen_settings.autoplace_settings.decorative.settings) do
                        e.frequency = 0.0
                        e.size = 0.0
                        e.richness = 0.0
                    end
                end

                if v.map_gen_settings.autoplace_settings.entity and v.map_gen_settings.autoplace_settings.entity.settings then
                    for _, e in pairs(v.map_gen_settings.autoplace_settings.entity.settings) do
                        e.frequency = 0.0
                        e.size = 0.0
                        e.richness = 0.0
                    end
                end
            end
        end

        local autoplace_controls = {}

        for k, _ in pairs (data.raw['autoplace-control']) do
            autoplace_controls[k] = { frequency = 0.0, size = 0.0, richness = 0.0}
        end

        data.raw['map-gen-presets']['default']['empty-world'] = {
            order = 'zz',
            basic_settings = {
                autoplace_controls = autoplace_controls,
                cliff_settings = {
                    name = 'none',
                    cliff_elevation_interval = 100,
                    cliff_elevation_0 = 100,
                    richness = 0
                }
            },
            advanced_settings = {
                pollution = {enabled = false},
                enemy_evolution = {enabled = false},
                enemy_expansion = {enabled = false}
            }
        }
    end
end

for _, v in pairs(items['item']) do
    if v.enabled and v.mod and (v.mod == 'space-age' or v.mod == 'quality') then
        if (data.raw.technology[v.tech] and data.raw.technology[v.tech].hidden) or (data.raw.recipe[v.name] and data.raw.recipe[v.name].hidden) then
            v.enabled = false
        end
    end
end

for _, v in pairs(items['item']) do
    if (v.stage == file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'item'

        for j=v.min, v.max, 1 do
            main.EEE(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end

        main.EL(v)
    end
end

for _, v in pairs(items['equipment']) do
    if (v.stage == file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'equipment'

        for j=v.min, v.max, 1 do
            main.EEQ(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end
    end
end
