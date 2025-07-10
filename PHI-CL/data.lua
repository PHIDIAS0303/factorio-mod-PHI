local items = require 'config'
local main = require 'main'
local file_stage = 1

if settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value then
    data.raw['fluid']['steam'].max_temperature = ((settings.startup['PHI-MB-ENERGY-POWER-TIER'].value > 1) and 5000) or data.raw['fluid']['steam'].max_temperature

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
end

if settings.startup['PHI-MB-EQUIPMENT'].value and settings.startup['PHI-MB-EQUIPMENT-ARMOR'].value then
    local grid = table.deepcopy(data.raw['equipment-grid']['large-equipment-grid'])
    grid.name = 'equipment-grid-14x14'
    grid.width = 14
    grid.height = 14
    data:extend({grid})

    grid = table.deepcopy(data.raw['equipment-grid']['large-equipment-grid'])
    grid.name = 'equipment-grid-15x16'
    grid.width = 15
    grid.height = 16
    data:extend({grid})

    local armor = table.deepcopy(data.raw['armor']['power-armor-mk2'])
    armor.name = 'power-armor-mk3'
    armor.icons = {{icon = armor.icon, tint = items['tint'][2], icon_size = armor.icon_size}}
    armor.icon = nil
    armor.icon_size = nil

    for _, v in pairs(armor.resistances) do
        v.decrease = v.decrease + 10
        v.percent = ((v.percent < 90) and v.percent + 10) or v.percent
    end

    armor.order = armor.order .. '-2'
    armor.equipment_grid = 'equipment-grid-14x14'
    armor.inventory_size_bonus = armor.inventory_size_bonus + 10
    armor.localised_name = {'phi-cl.combine-gen', {'item-name.power-armor-mk2'}, '3'}
    data:extend({armor})

    data:extend({{
        type = 'recipe',
        name = armor.name,
        energy_required = 2,
        enabled = false,
        ingredients = {{type = 'item', name = 'power-armor-mk2', amount = 2}},
        results = {{type = 'item', name = armor.name, amount = 1}},
        main_product = armor.name,
        localised_name = {'phi-cl.combine-gen', {'item-name.power-armor-mk2'}, '3'}
    }})

    table.insert(data.raw.technology['power-armor-mk2'].effects, {type = 'unlock-recipe', recipe = armor.name})

    if mods['space-age'] then
        armor = table.deepcopy(data.raw['armor']['mech-armor'])
        armor.name = 'mech-armor-mk2'
        armor.icons = {{icon = armor.icon, tint = items['tint'][2], icon_size = armor.icon_size}}
        armor.icon = nil
        armor.icon_size = nil

        for _, v in pairs(armor.resistances) do
            v.decrease = v.decrease + 10
            v.percent = ((v.percent < 90) and v.percent + 10) or v.percent
        end

        armor.order = armor.order .. '-2'
        armor.equipment_grid = 'equipment-grid-15x16'
        armor.inventory_size_bonus = armor.inventory_size_bonus + 10
        armor.localised_name = {'phi-cl.combine-gen', {'item-name.mech-armor'}, '2'}
        data:extend({armor})

        data:extend({{
            type = 'recipe',
            name = armor.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'mech-armor', amount = 2}},
            results = {{type = 'item', name = armor.name, amount = 1}},
            main_product = armor.name,
            localised_name = {'phi-cl.combine-gen', {'item-name.mech-armor'}, '2'}
        }})

        table.insert(data.raw.technology['mech-armor'].effects, {type = 'unlock-recipe', recipe = armor.name})
    end

    for _, an in ipairs(data.raw['character']['character']['animations']) do
        if an.armors then
            for _, ar in ipairs(an.armors) do
                if ar == 'power-armor-mk2' then
                    table.insert(an.armors, 'power-armor-mk3')

                elseif ar == 'mech-armor' then
                    table.insert(an.armors, 'mech-armor-mk2')
                end
            end
        end
    end
end

if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    data.raw.recipe['landfill'].ingredients[1].amount = math.min(20, data.raw.recipe['landfill'].ingredients[1].amount)
    data.raw['inserter']['burner-inserter'].allow_burner_leech = true
    data.raw['character']['character']['mining_categories'] = {'basic-solid', 'hard-solid'}

    for _, t in pairs({'arithmetic-combinator', 'decider-combinator', 'programmable-speaker', 'selector-combinator'}) do
        data.raw[t][t].energy_source.usage_priority = 'primary-input'
    end

    for _, v in pairs(data.raw['container']) do
        v.inventory_type = 'with_filters_and_bar'
    end

    for _, v in pairs(data.raw['logistic-container']) do
        v.inventory_type = 'with_filters_and_bar'
    end

    for _, v in pairs(data.raw['active-defense-equipment']) do
        v.automatic = true
    end

    for _, v in pairs(data.raw['reactor']) do
        v.scale_energy_usage = (v.fast_replaceable_group and v.fast_replaceable_group == 'reactor')
    end

    table.insert(data.raw['fluid-turret']['flamethrower-turret'].attack_parameters.fluids, {type = 'sulfuric-acid', damage_modifier = 1.2})

    for _, v in pairs(data.raw['pump']) do
        v.pumping_speed = math.max(50, v.pumping_speed) * settings.startup['PHI-MI-PIPE'].value / 10
    end

    for _, v in pairs(data.raw['valve']) do
        v.flow_rate = math.max(50, v.flow_rate) * settings.startup['PHI-MI-PIPE'].value / 10
    end

    data.raw.recipe['selector-combinator'].ingredients = {{type = 'item', name = 'advanced-circuit', amount = 5}, {type = 'item', name = 'decider-combinator', amount = 2}}

    for _, v in pairs(data.raw['mining-drill']) do
        v.filter_count = 5
    end

    if mods['space-age'] then
        for _, v in pairs(data.raw['mining-drill']) do
            v.drops_full_belt_stacks = true
        end

        for _, w in pairs({data.raw['valve'], data.raw['pipe'], data.raw['pipe-to-ground'], data.raw['pump'], data.raw['storage-tank'], data.raw['generator'], data.raw['furnace'], data.raw['assembling-machine'], data.raw['roboport']}) do
            for _, v in pairs(w) do
                v.heating_energy = nil
            end
        end

        for _, w in pairs({data.raw['roboport'], data.raw['roboport-equipment']}) do
            for _, v in pairs(w) do
                v.charging_station_count_affected_by_quality = true
            end
        end

        for _, v in pairs(data.raw['lab']) do
            v.uses_quality_drain_modifier = true
        end

        for _, w in pairs({data.raw['cargo-wagon'], data.raw['fluid-wagon']}) do
            for _, v in pairs(w) do
                v.quality_affects_inventory_size = true
            end
        end
    end

    table.insert(data.raw['thruster']['thruster'].fuel_fluid_box.pipe_connections, {flow_direction = 'input-output', direction = defines.direction.west, position = {-1.5, 2}})
    table.insert(data.raw['thruster']['thruster'].oxidizer_fluid_box.pipe_connections, {flow_direction = 'input-output', direction = defines.direction.east, position = {1.5, 2}})

    for _, fb in pairs({'input_fluid_box', 'output_fluid_box'}) do
        for _, v in pairs(data.raw['fusion-generator']['fusion-generator'][fb].pipe_connections) do
            v.flow_direction = 'input-output'
        end
    end

    data.raw['module']['efficiency-module'].effect.consumption = math.min(-0.3, data.raw['module']['efficiency-module'].effect.consumption)
    data.raw['module']['efficiency-module-2'].effect.consumption = math.min(-0.6, data.raw['module']['efficiency-module'].effect.consumption)
    data.raw['module']['efficiency-module-3'].effect.consumption = math.min(-0.9, data.raw['module']['efficiency-module'].effect.consumption)

    for _, v in pairs({'one-way-valve', 'overflow-valve', 'top-up-valve'}) do
        data.raw['valve'][v].hidden = false
        data.raw.item[v].hidden = false
        data.raw.item[v].subgroup = 'energy-pipe-distribution'

        data:extend({{
            type = 'recipe',
            name = v,
            energy_required = 1,
            enabled = true,
            icon = data.raw.item[v].icon,
            icon_size = 64,
            order = 'zc',
            allow_productivity = false,
            ingredients = {{type = 'item', name = 'pipe', amount = 2}, {type = 'item', name = 'electronic-circuit', amount = 3}},
            results = {{type = 'item', name = v, amount = 1}},
            main_product = v,
            localised_name = {'entity-name.' .. v},
            localised_description = {'entity-description.' .. v}
        }})
    end

    data:extend({{type = 'recipe-category', name = 'fluid'}})

    if data.raw['offshore-pump']['offshore-pump'] then
        local item = table.deepcopy(data.raw['item']['offshore-pump'])
        item.name = 'super-pump'
        item.place_result = item.name
        item.order = 'b[fluids]-a[super-pump]-o'
        item.icons = {{icon = '__base__/graphics/icons/offshore-pump.png', tint = items['tint'][2], icon_size = 64, icon_mipmaps = 4}}
        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'', {'name.super-entity'}, {'entity-name.pump'}}
        data:extend({item})

        local entity = table.deepcopy(data.raw['offshore-pump']['offshore-pump'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.type = 'assembling-machine'
        entity.crafting_categories = {'fluid'}
        entity.crafting_speed = 1
        entity.energy_source = {type = 'void'}

        entity.fluid_boxes = {{
            production_type = 'output',
            pipe_covers = table.deepcopy(entity.fluid_box.pipe_covers),
            volume = 100 * settings.startup['PHI-MI-PIPE'].value / 10,
            pipe_connections = {{
                flow_direction = 'output',
                connection_category = (mods['space-age'] and {'default', 'fusion-plasma'}) or {'default'},
                direction = defines.direction.south,
                position = {0, 0}
            }}
        }}

        entity.fluid_box = nil
        entity.fluid_boxes_off_when_no_fluid_recipe = false
        entity.effect_receiver = {uses_module_effects = false, uses_beacon_effects = false}
        entity.allowed_effects = {'consumption'}
        entity.tile_buildability_rules = nil
        entity.fluid_source_offset = nil
        entity.localised_name = {'', {'name.super-entity'}, {'entity-name.pump'}}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            ingredients = {{type = 'item', name = 'electronic-circuit', amount = 2}, {type = 'item', name = 'pipe', amount = 1}, {type = 'item', name = 'iron-gear-wheel', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'', {'name.super-entity'}, {'entity-name.pump'}}
        }})
    end

    if data.raw.fluid['water'] then
        data:extend({{
            type = 'recipe',
            name = 'pump-water',
            category = 'fluid',
            energy_required = 1,
            enabled = true,
            ingredients = {},
            results = {{type = 'fluid', name = 'water', amount = 12000 * settings.startup['PHI-MI-PIPE'].value / 10, temperature = data.raw.fluid['water'].default_temperature}},
            main_product = 'water',
            hide_from_player_crafting = true,
            hidden_in_factoriopedia = true,
            allow_productivity = false,
            crafting_machine_tint = {primary = data.raw.fluid['water'].flow_color},
            localised_name = {'fluid-name.water'}
        }})
    end

    if data.raw['constant-combinator']['constant-combinator'] then
        local item = table.deepcopy(data.raw['item']['constant-combinator'])
        item.name = 'super-combinator'
        item.place_result = item.name
        item.order = 'c[combinators]-e[super-combinator]'
        item.icons = {{icon = '__base__/graphics/icons/constant-combinator.png', tint = items['tint'][2], icon_size = 64, icon_mipmaps = 4}}
        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'', {'name.super-entity'}, {'entity-name.constant-combinator'}}
        data:extend({item})

        local entity = table.deepcopy(data.raw['constant-combinator']['constant-combinator'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.localised_name = {'', {'name.super-entity'}, {'entity-name.constant-combinator'}}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            ingredients = {{type = 'item', name = 'electronic-circuit', amount = 5}, {type = 'item', name = 'copper-cable', amount = 5}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'', {'name.super-entity'}, {'entity-name.constant-combinator'}}
        }})

        local s = {}

        for _, v in pairs(data.raw['technology']) do
            if v.max_level and v.max_level == 'infinite' then
                table.insert(s, {
                    type = 'virtual-signal',
                    name = 'signal-' .. v.name,
                    icon = (v.icon and v.icon) or (v.icons and v.icons[1]),
                    subgroup = 'pictographs',
                    order = 'z[tech]-[' .. v.name .. ']',
                    localised_name = {'technology-name.' .. v.name}
                })
            end
        end

        data:extend(s)
    end

    for _, v in pairs(data.raw['inserter']) do
        if v.energy_source and (v.energy_source == 'electric' or v.energy_source == 'void' or v.energy_source == 'burner') then
            v.allow_custom_vectors = true
            v.flags = {'placeable-neutral', 'placeable-player', 'player-creation', 'building-direction-8-way'}
        end
    end

    if data.raw['inserter']['long-handed-inserter'] then
        data.raw['inserter']['long-handed-inserter'].flags = {'placeable-neutral', 'placeable-player', 'player-creation', 'building-direction-16-way'}
    end

    if mods['elevated-rails'] then
        local entity = table.deepcopy(data.raw['electric-pole']['big-electric-pole'])
        entity.name = 'rail-support-pole-electric'
        entity.hidden = true
        entity.hidden_in_factoriopedia = true
        entity.minable.result = nil
        entity.maximum_wire_distance = math.floor(data.raw['rail-support']['rail-support'].support_range * 2)
        entity.supply_area_distance = 0
        entity.water_reflection = nil
        entity.pictures = nil
        entity.active_picture = nil
        entity.collision_box = {{0, 0}, {0, 0}}
        entity.selection_box = nil
        entity.collision_mask = {colliding_with_tiles_only = true, layers = {}, not_colliding_with_itself = true}
        entity.flags = {'hide-alt-info', 'not-blueprintable', 'not-deconstructable', 'not-flammable', 'not-on-map', 'not-selectable-in-game', 'placeable-off-grid', 'placeable-player'}
        entity.next_upgrade = nil
        entity.selection_priority = 49
        entity.order = 'zz'
        data:extend({entity})

        if (not (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP')) and mods['space-age'] and data.raw['lightning-attractor']['lightning-rod'] then
            entity = table.deepcopy(data.raw['lightning-attractor']['lightning-rod'])
            entity.name = 'rail-support-pole-lightning'
            entity.hidden = true
            entity.hidden_in_factoriopedia = true
            entity.minable.result = nil
            entity.range_elongation = math.floor(data.raw['rail-support']['rail-support'].support_range * 2)
            entity.water_reflection = nil
            entity.chargable_graphics = nil
            entity.collision_box = {{0, 0}, {0, 0}}
            entity.selection_box = nil
            entity.collision_mask = {colliding_with_tiles_only = true, layers = {}, not_colliding_with_itself = true}
            entity.flags = {'hide-alt-info', 'not-blueprintable', 'not-deconstructable', 'not-flammable', 'not-on-map', 'not-selectable-in-game', 'placeable-off-grid', 'placeable-player'}
            entity.next_upgrade = nil
            entity.selection_priority = 49
            entity.order = 'zz'
            data:extend({entity})
        end
    end

    local vir_sig = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    local s = {}

    for i = 1, #vir_sig do
        local char = vir_sig:sub(i, i)
        table.insert(s, {
            type = 'virtual-signal',
            name = char .. 'A',
            icon = items['general']['graphics_location'] .. 'signal/signal_' .. char .. '.png',
            subgroup = string.match(char, '%d') and 'virtual-signal-number' or 'virtual-signal-letter',
            order = (string.match(char, '%d') and 'b[numbers]2-[' or 'c[letters]2-[') .. char .. ']',
            localised_name = {'phi-cl.combine', {'virtual-signal-name.signal-' .. char}, '(II)'}
        })
    end

    data:extend(s)

    if data.raw['container']['steel-chest'] then
        local item = table.deepcopy(data.raw['item']['steel-chest'])
        item.name = 'trash-chest'
        item.place_result = item.name
        item.subgroup = 'storage'
        item.order = 'b[storage]-h[trash-chest]'
        item.icons = {{icon = item.icon or '__base__/graphics/icons/steel-chest.png', tint = items['tint'][8], icon_size = item.icon_size or 64, icon_mipmaps = item.icon_mipmaps or 4}}
        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'', {'name.trash-entity'}, {'entity-name.steel-chest'}}
        data:extend({item})

        local entity = table.deepcopy(data.raw['container']['steel-chest'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.inventory_type = 'with_filters_and_bar'
        entity.inventory_size = 1
        entity.max_logistic_slots = 0
        entity.trash_inventory_size = 0
        entity.type = 'infinity-container'
        entity.gui_mode = 'none'
        entity.erase_contents_when_mined = true
        entity.preserve_contents_when_created = true
        entity.quality_affects_inventory_size = false
        entity.logistic_mode = nil
        entity.next_upgrade = nil
        entity.surface_conditions = nil
        entity.picture.layers[1].tint = items['tint'][8]
        entity.localised_name = {'', {'name.trash-entity'}, {'entity-name.steel-chest'}}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'steel-chest', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'', {'name.trash-entity'}, {'entity-name.steel-chest'}}
        }})

        table.insert(data.raw.technology['steel-processing'].effects, {type = 'unlock-recipe', recipe = item.name})
    end

    if data.raw['pipe']['pipe'] then
        local item = table.deepcopy(data.raw['item']['pipe'])
        item.name = 'trash-pipe'
        item.place_result = item.name
        item.subgroup = 'energy-pipe-distribution'
        item.order = 'a[pipe]-c[trash-pipe]'
        item.icons = {{icon = item.icon or '__base__/graphics/icons/pipe.png', tint = items['tint'][8], icon_size = item.icon_size or 64, icon_mipmaps = item.icon_mipmaps or 4}}
        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'', {'name.trash-entity'}, {'entity-name.pipe'}}
        data:extend({item})

        local entity = table.deepcopy(data.raw['pipe']['pipe'])
        entity.name = item.name
        entity.minable.result = item.name
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

        entity.localised_name = {'', {'name.trash-entity'}, {'entity-name.pipe'}}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'iron-plate', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'', {'name.trash-entity'}, {'entity-name.pipe'}}
        }})

        table.insert(data.raw.technology['automation'].effects, {type = 'unlock-recipe', recipe = item.name})
    end

    if data.raw['boiler']['boiler'] then
        local item = table.deepcopy(data.raw['item']['boiler'])
        item.name = 'electric-boiler'
        item.place_result = item.name
        item.subgroup = 'energy'
        item.order = 'b[steam-power]-a[electric-boiler]'
        item.localised_name = {'', {'name.electric-entity'}, {'entity-name.boiler'}}
        data:extend({item})

        local entity = table.deepcopy(data.raw['boiler']['boiler'])
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
                color = {r = 0.5, g = 1, b = 1, a = 0.5},
                minimum_light_size = 0.1,
                light_intensity_to_size_coefficient = 1
            }
        }

        entity.fire_flicker_enabled = false
        entity.fire_glow_flicker_enabled = false
        entity.localised_name = {'', {'name.electric-entity'}, {'entity-name.boiler'}}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            ingredients = {{type = 'item', name = 'boiler', amount = 1}, {type = 'item', name = 'electronic-circuit', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'', {'name.electric-entity'}, {'entity-name.boiler'}}
        }})

        data.raw['boiler']['boiler'].fast_replaceable_group = 'boiler'
        data.raw['boiler']['electric-boiler'].fast_replaceable_group = data.raw['boiler']['boiler'].fast_replaceable_group
    end

    if data.raw['reactor']['heating-tower'] then
        local item = table.deepcopy(data.raw['item']['heating-tower'])
        item.name = 'electric-heating-tower'
        item.place_result = item.name
        item.subgroup = 'environmental-protection'
        item.order = 'c[heating-tower]-e'
        item.localised_name = {'', {'name.electric-entity'}, {'entity-name.heating-tower'}}
        data:extend({item})

        local entity = table.deepcopy(data.raw['reactor']['heating-tower'])
        entity.name = item.name
        entity.consumption = '160MW'
        entity.buffer_capacity = '320MJ'
        entity.heat_buffer.max_temperature = 500
        entity.scale_energy_usage = true
        entity.minable.result = entity.name
        entity.energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            buffer_capacity = entity.buffer_capacity,
            light_flicker = {
                color = {r = 0.5, g = 1, b = 1, a = 0.5},
                minimum_light_size = 0.1,
                light_intensity_to_size_coefficient = 1
            }
        }
        entity.localised_name = {'', {'name.electric-entity'}, {'entity-name.heating-tower'}}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'heating-tower', amount = 1}, {type = 'item', name = 'electronic-circuit', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'', {'name.electric-entity'}, {'entity-name.heating-tower'}}
        }})

        data.raw['reactor']['heating-tower'].fast_replaceable_group = 'heating-tower'
        data.raw['reactor']['electric-heating-tower'].fast_replaceable_group = data.raw['reactor']['heating-tower'].fast_replaceable_group

        table.insert(data.raw.technology['heating-tower'].effects, {type = 'unlock-recipe', recipe = item.name})
    end

    for _, c in pairs({'steel-chest', 'passive-provider-chest', 'active-provider-chest', 'storage-chest', 'buffer-chest', 'requester-chest'}) do
        if (c == 'steel-chest' and data.raw['container'][c]) or data.raw['logistic-container'][c] then
            local item = table.deepcopy(data.raw['item'][c])
            item.name = 'basic-' .. c
            item.place_result = item.name
            item.subgroup = 'storage'
            item.order = 'b[storage]-h[basic-' .. c .. ']'
            item.localised_name = {'', {'name.basic-entity'}, {'entity-name.' .. c}}
            data:extend({item})

            local entity = (c == 'steel-chest' and table.deepcopy(data.raw['container'][c])) or table.deepcopy(data.raw['logistic-container'][c])
            entity.name = item.name
            entity.minable.result = item.name
            entity.inventory_type = 'with_filters_and_bar'
            entity.inventory_size = 1
            entity.quality_affects_inventory_size = false
            entity.max_logistic_slots = (c == 'steel-chest' and nil) or 1
            entity.trash_inventory_size = (c == 'steel-chest' and nil) or 1
            entity.localised_name = {'', {'name.basic-entity'}, {'entity-name.' .. c}}
            data:extend({entity})

            data:extend({{
                type = 'recipe',
                name = item.name,
                energy_required = 2,
                enabled = false,
                ingredients = {{type = 'item', name =c, amount = 1}},
                results = {{type = 'item', name = item.name, amount = 1}},
                main_product = item.name,
                localised_name = {'', {'name.basic-entity'}, {'entity-name.' .. c}}
            }})
        end
    end

    if data.raw.recipe['basic-steel-chest'] then
        table.insert(data.raw.technology['steel-processing'].effects, {type = 'unlock-recipe', recipe = 'basic-steel-chest'})
    end

    for _, t in pairs({'construction', 'logistic'}) do
        for _, r in pairs({'passive-provider', 'storage'}) do
            if data.raw.recipe['basic-' .. r .. '-chest'] then
                table.insert(data.raw.technology[t .. '-robotics'].effects, {type = 'unlock-recipe', recipe = 'basic-' .. r .. '-chest'})
            end
        end
    end

    for _, r in pairs({'active-provider', 'buffer', 'requester'}) do
        if data.raw.recipe['basic-' .. r .. '-chest'] then
            table.insert(data.raw.technology['logistic-system'].effects, {type = 'unlock-recipe', recipe = 'basic-' .. r .. '-chest'})
        end
    end

    for _, l in pairs({'loader', 'fast-loader', 'express-loader', 'turbo-loader'}) do
        if data.raw.recipe[l] and data.raw['loader'][l] then
            data.raw.item[l].hidden = false
            data.raw.item[l].hidden_in_factoriopedia = false
            data.raw.recipe[l].hidden = false
            data.raw.recipe[l].hidden_in_factoriopedia = false
            data.raw['loader'][l].filter_count = 2
            data.raw['loader'][l].per_lane_filters = true
            data.raw['loader'][l].adjustable_belt_stack_size = (data.raw['inserter']['stack-inserter'] and true) or false
            data.raw['loader'][l].max_belt_stack_size = (data.raw['inserter']['stack-inserter'] and data.raw['inserter']['stack-inserter'].max_belt_stack_size) or 1
            data.raw['loader'][l].wait_for_full_stack = (data.raw['inserter']['stack-inserter'] and true) or false
        end
    end

    if data.raw['loader']['loader'] and data.raw['loader']['fast-loader'] and data.raw['loader']['express-loader'] then
        table.insert(data.raw.technology['logistics'].effects, {type = 'unlock-recipe', recipe = 'loader'})
        table.insert(data.raw.technology['logistics-2'].effects, {type = 'unlock-recipe', recipe = 'fast-loader'})
        table.insert(data.raw.technology['logistics-3'].effects, {type = 'unlock-recipe', recipe = 'express-loader'})
    end

    if data.raw['loader']['loader'] and data.raw['loader']['turbo-loader'] then
        table.insert(data.raw.technology['turbo-transport-belt'].effects, {type = 'unlock-recipe', recipe = 'turbo-loader'})
    end

    for _, v in pairs({'underground-belt', 'fast-underground-belt', 'express-underground-belt', 'turbo-underground-belt'}) do
        if data.raw.item[v] then
            local item = table.deepcopy(data.raw.item[v])
            item.name = v .. '-a'
            item.place_result = item.name
            item.localised_name = {'phi-cl.combine', {'entity-name.' .. v}, '(II)'}
            item.localised_description = {'entity-description.' .. v}
            data:extend({item})

            local entity = table.deepcopy(data.raw['underground-belt'][v])
            entity.name = item.name
            entity.minable.result = item.name
            entity.next_upgrade = nil
            entity.surface_conditions = nil
            entity.localised_name = {'phi-cl.combine', {'entity-name.' .. v}, '(II)'}
            entity.localised_description = {'entity-description.' .. v}

            for _, st in pairs({'direction_in', 'direction_out', 'direction_in_side_loading', 'direction_out_side_loading'}) do
                entity.structure[st].sheet.filename = items['general']['graphics_location'] .. v .. '.png'
                entity.structure[st].sheet.width = 106
                entity.structure[st].sheet.height = 85
                entity.structure[st].sheetshift = {0.15625, 0.0703125}
            end

            entity.structure.direction_in.sheet.y = 85
            entity.structure.direction_out.sheet.y = nil
            entity.structure.direction_in_side_loading.sheet.y = 85
            entity.structure.direction_out_side_loading.sheet.y = nil
            data:extend({entity})

            data:extend({{
                type = 'recipe',
                name = item.name,
                energy_required = 2,
                enabled = false,
                ingredients = {{type = 'item', name = v, amount = 2}},
                results = {{type = 'item', name = item.name, amount = 2}},
                main_product = item.name,
                hide_from_player_crafting = true,
                allow_productivity = false,
                localised_name = {'phi-cl.combine', {'entity-name.' .. v}, '(II)'}
            }})
        end
    end

    if data.raw['underground-belt']['underground-belt'] and data.raw['underground-belt']['fast-underground-belt'] and data.raw['underground-belt']['express-underground-belt'] then
        data.raw['underground-belt']['underground-belt-a'].next_upgrade = 'fast-underground-belt-a'
        data.raw['underground-belt']['fast-underground-belt-a'].next_upgrade = 'express-underground-belt-a'
        table.insert(data.raw.technology['logistics'].effects, {type = 'unlock-recipe', recipe = 'underground-belt-a'})
        table.insert(data.raw.technology['logistics-2'].effects, {type = 'unlock-recipe', recipe = 'fast-underground-belt-a'})
        table.insert(data.raw.technology['logistics-3'].effects, {type = 'unlock-recipe', recipe = 'express-underground-belt-a'})
    end

    if data.raw['underground-belt']['underground-belt'] and data.raw['underground-belt']['turbo-underground-belt'] then
        data.raw['underground-belt']['express-underground-belt-a'].next_upgrade = 'turbo-underground-belt-a'
        table.insert(data.raw.technology['turbo-transport-belt'].effects, {type = 'unlock-recipe', recipe = 'turbo-underground-belt-a'})
    end

    data.raw['proxy-container']['proxy-container'].flags = {'not-blueprintable', 'hide-alt-info', 'not-deconstructable', 'not-flammable', 'not-on-map', 'placeable-off-grid', 'placeable-player', 'no-automated-item-insertion', 'no-automated-item-removal'}
    data.raw['proxy-container']['proxy-container'].draw_inventory_content = false
end

if settings.startup['PHI-MI'].value then
    if settings.startup['PHI-MI-PIPE'].value then
        local s = settings.startup['PHI-MI-PIPE'].value / 10

        for _, t in pairs({data.raw['offshore-pump'], data.raw['pump']}) do
            for _, v in pairs(t) do
                v.pumping_speed = v.pumping_speed * s
            end
        end

        for _, v in pairs(data.raw['valve']) do
            v.flow_rate = v.flow_rate * s
        end

        for _, t in pairs({data.raw['pipe'], data.raw['pipe-to-ground'], data.raw['infinity-pipe']}) do
            for _, v in pairs(t) do
                v.fluid_box.volume = v.fluid_box.volume * s
            end
        end

        data.raw['utility-constants'].default.max_fluid_flow = 100 * s
    end

    if settings.startup['PHI-MI-ROBOT'].value then
        local s = settings.startup['PHI-MI-ROBOT'].value / 10

        for _, t in pairs({data.raw['construction-robot'], data.raw['logistic-robot']}) do
            for _, v in pairs(t) do
                v.speed = v.speed * s

                if settings.startup['PHI-MI-ROBOT-ENERGY'].value then
                    v.energy_per_tick = (v.energy_per_tick and '0J') or nil
                    v.energy_per_move = (v.energy_per_move and '0J') or nil
                    v.speed_multiplier_when_out_of_energy = (v.speed_multiplier_when_out_of_energy and 1) or nil
                end
            end
        end
    end

    if settings.startup['PHI-MI-TRAIN'].value then
        local s = settings.startup['PHI-MI-TRAIN'].value / 10

        for _, t in pairs({data.raw['locomotive'], data.raw['cargo-wagon'], data.raw['fluid-wagon'], data.raw['artillery-wagon']}) do
            for _, v in pairs(t) do
                v.max_health = (v.max_health and (v.max_health * s)) or nil
                v.max_speed = (v.max_speed and (v.max_speed * s)) or nil
                v.braking_force = (v.braking_force and (v.braking_force * s)) or nil

                if v.max_power then
                    v.max_power = tostring(tonumber(string.match(v.max_power, '[%d%.]+')) * s) .. string.match(v.max_power, '%a+')
                    v.reversing_power_modifier = 1
                end
            end
        end
    end

    data.raw['utility-constants'].default.default_pipeline_extent = settings.startup['PHI-MI-PIPE-EXTENT'].value
end

if mods['space-age'] and (settings.startup['PHI-SA'].value and (not settings.startup['PHI-SA-SPOIL'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP')) then
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
        category = 'organic-or-assembling',
        subgroup = 'agriculture-processes',
        order = 'c[nutrients]-z',
        energy_required = 2,
        enabled = false,
        allow_productivity = true,
        ingredients = {{type = 'item', name = 'nutrients', amount = 1}},
        results = {{type = 'item', name = 'spoilage', amount = 8}},
        main_product = 'spoilage',
        localised_name = {'item-name.spoilage'}
    }})

    table.insert(data.raw.technology['agriculture'].effects, {type = 'unlock-recipe', recipe = 'spoilage-from-nutrients'})

    for _, v in pairs({'spoilables', 'spoilables-result', 'spoilables-research'}) do
        data.raw['tips-and-tricks-item'][v] = nil
    end
end

if settings.startup['PHI-SA'].value and settings.startup['PHI-SA-SPOIL-FREEZE'].value and settings.startup['PHI-SA-SPOIL'].value and mods['space-age'] then
    local function spoil_handle(i)
        local item = table.deepcopy(i)
        item.name = 'frozen-' .. i.name
        item.order = item.order .. '-f'
        item.icons = {{icon = item.icon, icon_size = 64, icon_mipmaps = 4}, {icon = data.raw['item']['ice'].icon, tint = {r = 1, g = 1, b = 1, a = 0.5}, icon_size = 64, icon_mipmaps = 4}}
        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.spoil_ticks = math.floor(i.spoil_ticks * settings.startup['PHI-SA-SPOIL-FREEZE-RATIO'].value / 10)
        item.spoil_result = i.name
        item.spoil_to_trigger_result = nil
        item.localised_name = {'item-name.' .. i.name}
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
            localised_name = {'item-name.' .. i.name}
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
            localised_name = {'item-name.' .. i.name}
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

if mods['space-age'] and settings.startup['PHI-SA'].value and settings.startup['PHI-SA-QUALITY'].value then
    for _, v in pairs(data.raw.module) do
        if v.category and v.category == 'quality' then
            v.effect.quality = v.effect.quality * settings.startup['PHI-SA-QUALITY'].value / 10

        elseif v.category and v.category == 'speed' and settings.startup['PHI-SA-QUALITY'].value ~= 10 then
            v.effect.quality = nil
        end
    end
end

if mods['space-age'] and settings.startup['PHI-SA'].value then
    data.raw['utility-constants'].default.rocket_lift_weight = settings.startup['PHI-SA-ROCKET-CAPACITY'].value * 1000000
end

if mods['space-age'] and ((settings.startup['PHI-SA'].value and (not settings.startup['PHI-SA-ENABLE-QUALITY'].value)) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP')) then
    for _, v in pairs({'quality-module', 'quality-module-2', 'quality-module-3'}) do
        if data.raw.technology[v] then
            data.raw.technology[v].hidden = true
            data.raw.technology[v].hidden_in_factoriopedia = true
            data.raw.technology[v].unit.ingredients = {{'space-science-pack', 1}}
            data.raw.technology[v].effects = nil
        end

        if data.raw.module[v] then
            data.raw.module[v].hidden = true
            data.raw.module[v].hidden_in_factoriopedia = true
        end

        if data.raw.recipe[v] then
            data.raw.recipe[v].hidden = true
            data.raw.recipe[v].hidden_in_factoriopedia = true
        end
    end

    for _, v in pairs({'epic-quality', 'legendary-quality'}) do
        data.raw.technology[v].hidden = true
        data.raw.technology[v].hidden_in_factoriopedia = true
        data.raw.technology[v].unit.ingredients = {{'space-science-pack', 1}}
        data.raw.technology[v].effects = nil
    end

    for _, v in pairs({'normal', 'uncommon', 'rare', 'epic', 'legendary'}) do
        data.raw.quality[v].next = nil
        data.raw.quality[v].next_probability = nil
        data.raw.quality[v].hidden = true
        data.raw.quality[v].hidden_in_factoriopedia = true
    end

    for _, v in pairs({'quality', 'quality-modules', 'quality-factoriopedia', 'quality-probabilities'}) do
        data.raw['tips-and-tricks-item'][v] = nil
    end

    data.raw['produce-achievement']['crafting-with-quality'] = nil
    data.raw['module-transfer-achievement']['make-it-better'] = nil
    data.raw['produce-achievement']['my-modules-are-legendary'] = nil
    data.raw['equip-armor-achievement']['look-at-my-shiny-rare-armor'] = nil
    data.raw['use-item-achievement']['todays-fish-is-trout-a-la-creme'] = nil
    data.raw['place-equipment-achievement']['no-room-for-more'] = nil
end

if mods['space-age'] and (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    data.raw.resource['lithium-brine'].infinite = true
    data.raw.resource['lithium-brine'].minimum = math.max(60000, data.raw.resource['lithium-brine'].minimum or 0)
    data.raw.resource['lithium-brine'].normal = math.max(300000, data.raw.resource['lithium-brine'].normal or 0)
    data.raw.resource['lithium-brine'].infinite_depletion_amount = math.min(10, data.raw.resource['lithium-brine'].infinite_depletion_amount or 999)
    data.raw.resource['fluorine-vent'].minimum = math.max(60000, data.raw.resource['fluorine-vent'].minimum or 0)
    data.raw.resource['fluorine-vent'].normal = math.max(300000, data.raw.resource['fluorine-vent'].normal or 0)

    data.raw['space-platform-hub']['space-platform-hub'].platform_repair_speed_modifier = math.max(2, data.raw['space-platform-hub']['space-platform-hub'].platform_repair_speed_modifier)
    data.raw['space-platform-hub']['space-platform-hub'].inventory_size = math.max(119, data.raw['space-platform-hub']['space-platform-hub'].inventory_size)
    data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus = math.max(40, data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus)
    data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size = math.max(60, data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size)
    data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size = math.max(60, data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size)
    data.raw['cargo-wagon']['cargo-wagon'].inventory_size = math.max(80, data.raw['cargo-wagon']['cargo-wagon'].inventory_size)

    data.raw.technology['foundation'].prerequisites = {'rail-support-foundations'}
    data.raw.technology['foundation'].unit.count_formula = '1000'
    data.raw.technology['foundation'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
    data.raw.technology['rail-support-foundations'].prerequisites = {'elevated-rail', 'planet-discovery-fulgora'}
    data.raw.technology['rail-support-foundations'].unit.count = 600
    data.raw.technology['rail-support-foundations'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
    data.raw.technology['elevated-rail'].prerequisites = {'concrete', 'railway'}
    data.raw.technology['elevated-rail'].unit.count = 400
    data.raw.technology['elevated-rail'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}

    data.raw.recipe['foundation'].ingredients = {{type = 'item', name = 'landfill', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 10}, {type = 'item', name = 'steel-plate', amount = 10}}
    data.raw.recipe['foundation'].results = {{type = 'item', name = 'foundation', amount = 1}}
    data.raw.recipe['atomic-bomb'].ingredients[3] = {type = 'item', name = 'uranium-235', amount = 30}
    data.raw.recipe['cliff-explosives'].ingredients = {{type = 'item', name = 'explosives', amount = 10}, {type = 'item', name = 'grenade', amount = 1}, {type = 'item', name = 'barrel', amount = 1}}
    data.raw.recipe['artillery-turret'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'concrete', amount = 60}, {type = 'item', name = 'iron-gear-wheel', amount = 40}, {type = 'item', name = 'advanced-circuit', amount = 20}}
    data.raw.recipe['artillery-shell'].ingredients = {{type = 'item', name = 'explosive-cannon-shell', amount = 4}, {type = 'item', name = 'radar', amount = 1}, {type = 'item', name = 'explosives', amount = 8}}
    data.raw.recipe['artillery-wagon'].ingredients = {{type = 'item', name = 'engine-unit', amount = 64}, {type = 'item', name = 'iron-gear-wheel', amount = 10}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'pipe', amount = 16}, {type = 'item', name = 'advanced-circuit', amount = 20}}

    data.raw.tile['space-platform-foundation'].max_health = data.raw.tile['space-platform-foundation'].max_health * 2
    data.raw.item['space-platform-foundation'].stack_size = math.max(100, data.raw.item['space-platform-foundation'].stack_size)

    data.raw['ammo-turret']['railgun-turret'].starting_attack_speed = 1
    data.raw['ammo-turret']['railgun-turret'].starting_attack_speed_secondary = 1
    data.raw['ammo-turret']['railgun-turret'].starting_attack_speed_when_killed = 1
    data.raw['ammo-turret']['railgun-turret'].preparing_speed = 1
    data.raw['ammo-turret']['railgun-turret'].attacking_speed = 1
    data.raw['ammo-turret']['railgun-turret'].ending_attack_speed = 1
    data.raw['ammo-turret']['railgun-turret'].folding_speed = 1
    data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit = tonumber(string.match(data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit, '[%d%.]+')) * 32 .. string.match(data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit, '%a+')

    data.raw['roboport']['roboport'].energy_source.input_flow_limit = nil
    data.raw['roboport']['roboport'].charging_energy = tostring(tonumber(string.match(data.raw['roboport']['roboport'].charging_energy, '[%d%.]+')) * 2) .. string.match(data.raw['roboport']['roboport'].charging_energy, '%a+')
    data.raw['roboport']['roboport'].robot_slots_count = 10
    data.raw['roboport']['roboport'].material_slots_count = 2
    data.raw['roboport']['roboport'].charging_station_count = 8
    -- data.raw['roboport']['roboport'].charging_offsets = {{-1.5, -1}, {1.5, -1}, {1.5, 1}, {-1.5, 1}, {-1, -1.5}, {1, -1.5}, {1, 1.5}, {-1, 1.5}}

    for _, chunk in pairs({'carbonic-asteroid-chunk', 'metallic-asteroid-chunk', 'promethium-asteroid-chunk', 'oxide-asteroid-chunk'}) do
        data.raw['asteroid-chunk'][chunk].minable.count = (data.raw['asteroid-chunk'][chunk].minable.count or 1) * 4
        data.raw.item[chunk].stack_size = data.raw['inserter']['stack-inserter'].max_belt_stack_size
        -- can try dying_trigger_effect = nil, not much ups improvement
    end

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

    data.raw.ammo['artillery-shell'].stack_size = data.raw['inserter']['stack-inserter'].max_belt_stack_size

    data.raw.technology['cliff-explosives'].prerequisites = {'explosives', 'military-2'}
    data.raw.technology['cliff-explosives'].unit = {count = 200, time = 15, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
    data.raw.technology['cliff-explosives'].effects = {{type = 'unlock-recipe', recipe = 'cliff-explosives'}, {type = 'cliff-deconstruction-enabled', modifier = true}}
    data.raw.technology['research-productivity'].prerequisites = {'cryogenic-science-pack'}
    data.raw.technology['research-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}, {'agricultural-science-pack', 1}, {'cryogenic-science-pack', 1}, {'electromagnetic-science-pack', 1}, {'metallurgic-science-pack', 1}}

    table.insert(data.raw.technology['cryogenic-science-pack'].effects, {type = 'unlock-space-location', space_location = 'solar-system-edge'})
    table.insert(data.raw.technology['cryogenic-science-pack'].effects, {type = 'unlock-space-location', space_location = 'shattered-planet'})
    table.insert(data.raw.technology['stronger-explosives-4'].effects, {type = 'ammo-damage', ammo_category = 'artillery-shell', modifier = 0.1})
    table.insert(data.raw.technology['stronger-explosives-5'].effects, {type = 'ammo-damage', ammo_category = 'artillery-shell', modifier = 0.1})
    table.insert(data.raw.technology['stronger-explosives-6'].effects, {type = 'ammo-damage', ammo_category = 'artillery-shell', modifier = 0.2})
    table.insert(data.raw.technology['stronger-explosives-7'].effects, {type = 'ammo-damage', ammo_category = 'artillery-shell', modifier = 0.2})
    table.insert(data.raw.technology['laser-weapons-damage-3'].effects, {type = 'ammo-damage', ammo_category = 'beam', modifier = 0.3})
    table.insert(data.raw.technology['laser-weapons-damage-4'].effects, {type = 'ammo-damage', ammo_category = 'beam', modifier = 0.4})
    table.insert(data.raw.technology['laser-shooting-speed-5'].effects, {type = 'gun-speed', ammo_category = 'electric', modifier = 0.2})
    table.insert(data.raw.technology['laser-shooting-speed-6'].effects, {type = 'gun-speed', ammo_category = 'electric', modifier = 0.3})
    table.insert(data.raw.technology['laser-shooting-speed-7'].effects, {type = 'gun-speed', ammo_category = 'electric', modifier = 0.5})

    for i=5, 7 do
        table.insert(data.raw.technology['laser-weapons-damage-' .. i].effects, {type = 'ammo-damage', ammo_category = 'tesla', modifier = 0.7})
        table.insert(data.raw.technology['laser-weapons-damage-' .. i].effects, {type = 'ammo-damage', ammo_category = 'electric', modifier = 0.7})
        table.insert(data.raw.technology['laser-weapons-damage-' .. i].effects, {type = 'ammo-damage', ammo_category = 'beam', modifier = 0.6})
    end

    table.insert(data.raw.technology['physical-projectile-damage-6'].effects, {type = 'ammo-damage', ammo_category = 'railgun', modifier = 0.2})
    table.insert(data.raw.technology['physical-projectile-damage-7'].effects, {type = 'ammo-damage', ammo_category = 'railgun', modifier = 0.4})
    table.insert(data.raw.technology['weapon-shooting-speed-6'].effects, {type = 'gun-speed', ammo_category = 'railgun', modifier = 0.2})
    table.insert(data.raw.technology['artillery-shell-speed-1'].effects, {type = 'gun-speed', ammo_category = 'railgun', modifier = 0.2})

    for _, v in pairs({'artillery-shell-damage-1', 'railgun-damage-1', 'railgun-shooting-speed-1', 'electric-weapons-damage-1', 'electric-weapons-damage-2', 'electric-weapons-damage-3', 'electric-weapons-damage-4', 'promethium-science-pack'}) do
        if data.raw.technology[v] then
            data.raw.technology[v].hidden = true
            data.raw.technology[v].hidden_in_factoriopedia = true
            data.raw.technology[v].effects = nil
        end
    end

    data.raw.tool['promethium-science-pack'].hidden = true
    data.raw.tool['promethium-science-pack'].hidden_in_factoriopedia = true

    for _, v in pairs(data.raw.lab) do
        v.inputs = {'automation-science-pack', 'logistic-science-pack', 'military-science-pack', 'chemical-science-pack', 'production-science-pack', 'utility-science-pack', 'space-science-pack', 'agricultural-science-pack', 'cryogenic-science-pack', 'electromagnetic-science-pack', 'metallurgic-science-pack'}
    end

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
        allow_productivity = false,
        ingredients = {{type = 'item', name = 'battery', amount = 100}},
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
        order = 'zd',
        allow_productivity = false,
        ingredients = {{type = 'item', name = 'empty-train-battery', amount = 1}},
        results = {{type = 'item', name = 'charged-train-battery', probability = 0.995, amount = 1}, {type = 'item', name = 'battery', probability = 0.005, amount = 5}},
        main_product = 'charged-train-battery',
        localised_name = {'name.charged-train-battery'},
        localised_description = {'description.charged-train-battery'}
    }})

    for _, v in pairs(data.raw['locomotive']) do
        if v.energy_source then
            v.energy_source.burnt_inventory_size = (v.energy_source.burnt_inventory_size and math.max(v.energy_source.burnt_inventory_size, 1)) or 1
        end
    end

    data:extend({{
        type = 'technology',
        name = 'cargo-landing-pad-count',
        prerequisites = {'space-science-pack'},
        effects = {{type = 'cargo-landing-pad-count', modifier = 1}},
        unit = {count_formula = '1000 * L', ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}, time = 60},
        icons = {{icon = '__base__/graphics/technology/rocket-silo.png', icon_size = 256}, {icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png', icon_size = 128, scale = 0.5, shift = {50, 50}}},
        order = 'a-i-a',
        max_level = 'infinite',
        upgrade = true,
        localised_name = {'entity-name.cargo-landing-pad'}
    }})

    for _, v in pairs({'coal', 'stone', 'iron-ore', 'copper-ore', 'uranium-ore'}) do
        if data.raw.item[v] then
            data.raw.item[v].stack_size = math.max(data.raw.item[v].stack_size, 100)
        end
    end
end

if settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP' then
    if mods['space-age'] then
        data.raw.quality['normal'].level = 0
        data.raw.quality['normal'].beacon_power_usage_multiplier = 1
        data.raw.quality['normal'].mining_drill_resource_drain_multiplier = 1
        data.raw.quality['normal'].science_pack_drain_multiplier = 1

        data.raw['utility-constants'].default.default_pipeline_extent = math.max(settings.startup['PHI-MI-PIPE-EXTENT'].value, 960)

        local bss = (data.raw['inserter']['stack-inserter'] and data.raw['inserter']['stack-inserter'].max_belt_stack_size) or 1

        for _, v in pairs(data.raw['inserter']) do
            v.max_belt_stack_size = bss
            v.grab_less_to_match_belt_stack = true
            v.enter_drop_mode_if_held_stack_spoiled = true
        end

        for k, v in pairs(items['space-age']['PHI-VP']['surface_conditions']) do
            data.raw[v][k].surface_conditions = nil
        end

        for _, v in pairs(data.raw.recipe) do
            v.surface_conditions = nil
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

        for _, v in pairs({'carbonic', 'metallic', 'promethium', 'oxide'}) do
            data.raw.item[v .. '-asteroid-chunk'].hidden = true
            data.raw.item[v .. '-asteroid-chunk'].hidden_in_factoriopedia = true
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

        data.raw.technology['rocket-silo'].effects = {{type = 'unlock-recipe', recipe = 'rocket-silo'}, {type = 'unlock-recipe', recipe = 'rocket-part'}, {type = 'unlock-recipe', recipe = 'cargo-landing-pad'}, {type = 'unlock-recipe', recipe = 'cargo-bay'}}
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
                ingredients = {{type = 'item', name = 'low-density-structure', amount = 100}, {type = 'item', name = 'solar-panel', amount = 100}, {type = 'item', name = 'accumulator', amount = 100}, {type = 'item', name = 'radar', amount = 5}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'rocket-fuel', amount = 50}},
                results = {{type = 'item', name = 'satellite', amount = 1}},
                requester_paste_multiplier = 1
            }
        })

        data.raw['tool']['space-science-pack'].rocket_launch_products = {{type = 'item', name = 'raw-fish', amount = 1}}
        data.raw['tool']['space-science-pack'].send_to_orbit_mode = 'automated'

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
        table.insert(data.raw.technology['concrete-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'refined-concrete', change = 0.05})
        table.insert(data.raw.technology['concrete-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'landfill', change = 0.05})
        table.insert(data.raw.technology['sulfur-processing-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'sulfuric-acid', change = 0.05})
        table.insert(data.raw.technology['sulfur-processing-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'explosives', change = 0.05})
        table.insert(data.raw.technology['sulfur-processing-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'cliff-explosives', change = 0.05})
        table.insert(data.raw.technology['solar-energy-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'accumulator', change = 0.05})
        table.insert(data.raw.technology['solar-energy-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'battery', change = 0.05})
        table.insert(data.raw.technology['engine-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'electric-engine-unit', change = 0.05})
        table.insert(data.raw.technology['engine-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'flying-robot-frame', change = 0.05})
        data.raw.technology['oil-processing-productivity'].prerequisites = {'cryogenic-plant'}
        data.raw.technology['oil-processing-productivity'].effects[1].recipe = 'basic-oil-processing'
        table.insert(data.raw.technology['oil-processing-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'advanced-oil-processing', change = 0.05})
        table.insert(data.raw.technology['oil-processing-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'coal-liquefaction', change = 0.05})
        table.insert(data.raw.technology['oil-processing-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'lubricant', change = 0.05})
        data.raw.technology['engine-productivity'].effects[1].recipe = 'engine-unit'
        data.raw.technology['sulfur-processing-productivity'].prerequisites = {'cryogenic-plant'}
        data.raw.technology['sulfur-processing-productivity'].effects[1].recipe = 'sulfur'
        data.raw.technology['electronics-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'electronic-circuit', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'copper-cable', change = 0.05}}
        data.raw.technology['solar-energy-productivity'].effects[1].recipe = 'solar-panel'
        data.raw.technology['railway-productivity'].effects[1].recipe = 'rail'
        table.insert(data.raw.technology['railway-productivity'].effects, {type = 'change-recipe-productivity', recipe = 'iron-stick', change = 0.05})
        data.raw.technology['automation-productivity'].prerequisites[1] = 'logistics-2'
        data.raw.technology['automation-productivity'].effects = {{type = 'change-recipe-productivity', recipe = 'pipe', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'iron-gear-wheel', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'barrel', change = 0.05}}
        data.raw.technology['automation-productivity'].icons[1].icon = '__base__/graphics/technology/automation-2.png'
        data.raw.technology['automation-productivity'].localised_name = {'phi-cl.combine', {'technology-name.automation'}, ''}

        for k, v in pairs(items['space-age']['PHI-VP']['technology_reform']) do
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

        table.insert(data.raw.technology['automation'].effects, {type = 'create-ghost-on-entity-death', modifier = true})
        data.raw.technology['space-science-pack'].prerequisites = {'rocket-silo'}
        data.raw.technology['space-science-pack'].effects = {{type = 'unlock-recipe', recipe = 'satellite'}}
        data.raw.technology['space-science-pack'].unit = {count = 2000, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
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
        data.raw.technology['artillery-shell-damage-1'].prerequisites = {'artillery', 'space-science-pack'}
        data.raw.technology['artillery-shell-damage-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        data.raw.technology['electric-weapons-damage-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        data.raw.technology['electric-weapons-damage-2'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        data.raw.technology['electric-weapons-damage-3'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        data.raw.technology['electric-weapons-damage-4'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        data.raw.technology['railgun'].prerequisites = {'military-4', 'artillery', 'production-science-pack'}
        data.raw.technology['railgun'].unit.count = 2500
        data.raw.technology['railgun'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        data.raw.technology['railgun-damage-1'].prerequisites = {'railgun', 'space-science-pack'}
        data.raw.technology['railgun-damage-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        data.raw.technology['railgun-shooting-speed-1'].prerequisites = {'railgun', 'space-science-pack'}
        data.raw.technology['railgun-shooting-speed-1'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        data.raw.technology['worker-robots-speed-6'].prerequisites = {'worker-robots-speed-5'}
        data.raw.technology['worker-robots-speed-6'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        data.raw.technology['worker-robots-speed-7'].prerequisites = {'worker-robots-speed-6', 'space-science-pack'}
        data.raw.technology['worker-robots-speed-7'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        data.raw.technology['coal-liquefaction'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
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

        for _, v in pairs({'processing-unit-productivity', 'steel-plate-productivity', 'low-density-structure-productivity', 'plastic-bar-productivity', 'rocket-fuel-productivity', 'rocket-part-productivity', 'research-productivity'}) do
            data.raw.technology[v].unit.count_formula = '1000 * (1.5 ^ (L - 1))'
            data.raw.technology[v].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
            data.raw.technology[v].max_level = 10
        end

        data.raw.technology['research-productivity'].unit.count_formula = '1500 * (1.5 ^ L)'
        data.raw.technology['research-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}

        for _, v in pairs({'space-science-pack', 'electromagnetic-plant', 'foundry', 'cryogenic-plant', 'big-mining-drill', 'agriculture', 'heating-tower'}) do
            data.raw.technology[v].research_trigger = nil
        end

        for k, v in pairs(items['space-age']['PHI-VP']['technology']) do
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

        for k, v in pairs(items['space-age']['PHI-VP']['recipe']) do
            if data.raw.recipe[k] then
                data.raw.recipe[k].hidden = v
                data.raw.recipe[k].hidden_in_factoriopedia = v
            end
        end

        for k, v in pairs(items['space-age']['PHI-VP']['item']) do
            if data.raw.item[k] then
                data.raw.item[k].hidden = v
                data.raw.item[k].hidden_in_factoriopedia = v
            end
        end

        for k, v in pairs(items['space-age']['PHI-VP']['hidden_data']) do
            if data.raw[v] and data.raw[v][k] then
                data.raw[v][k].hidden = true
                data.raw[v][k].hidden_in_factoriopedia = true
            end
        end

        data.raw.recipe['big-mining-drill'].category = nil
        data.raw.recipe['big-mining-drill'].ingredients = {{type = 'item', name = 'electric-mining-drill', amount = 1}, {type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electric-engine-unit', amount = 5}, {type = 'item', name = 'advanced-circuit', amount = 10}}
        data.raw.recipe['big-mining-drill'].energy_required = 20
        data.raw.recipe['turbo-transport-belt'].category = 'crafting-with-fluid'
        data.raw.recipe['turbo-transport-belt'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'express-transport-belt', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 20}}
        data.raw.recipe['turbo-underground-belt'].category = 'crafting-with-fluid'
        data.raw.recipe['turbo-underground-belt'].ingredients = {{type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'express-underground-belt', amount = 2}, {type = 'fluid', name = 'lubricant', amount = 40}}
        data.raw.recipe['turbo-splitter'].category = 'crafting-with-fluid'
        data.raw.recipe['turbo-splitter'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'express-splitter', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 80}}
        data.raw.recipe['express-transport-belt'].category = 'crafting-with-fluid'
        data.raw.recipe['express-underground-belt'].category = 'crafting-with-fluid'
        data.raw.recipe['express-splitter'].category = 'crafting-with-fluid'
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
        data.raw.recipe['tesla-ammo'].category = 'crafting-with-fluid'
        data.raw.recipe['tesla-ammo'].ingredients = {{type = 'item', name = 'battery', amount = 1}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 10}}
        data.raw.recipe['teslagun'].category = 'crafting-with-fluid'
        data.raw.recipe['teslagun'].energy_required = 10
        data.raw.recipe['teslagun'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
        data.raw.recipe['tesla-turret'].category = 'crafting-with-fluid'
        data.raw.recipe['tesla-turret'].ingredients = {{type = 'item', name = 'teslagun', amount = 1}, {type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 500}}
        data.raw.recipe['mech-armor'].ingredients = {{type = 'item', name = 'power-armor-mk2', amount = 1}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'battery', amount = 50}}
        data.raw.recipe['railgun'].category = 'crafting-with-fluid'
        data.raw.recipe['railgun'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'battery', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 10}}
        data.raw.recipe['railgun-turret'].category = 'crafting-with-fluid'
        data.raw.recipe['railgun-turret'].ingredients = {{type = 'item', name = 'steel-plate', amount = 30}, {type = 'item', name = 'processing-unit', amount = 25}, {type = 'item', name = 'battery', amount = 25}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
        data.raw.recipe['rocket-turret'].category = 'crafting'
        data.raw.recipe['rocket-turret'].ingredients = {{type = 'item', name = 'rocket-launcher', amount = 4}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'processing-unit', amount = 4}, {type = 'item', name = 'iron-gear-wheel', amount = 20}}
        data.raw.recipe['fusion-reactor'].category = 'crafting'
        data.raw.recipe['fusion-reactor'].ingredients = {{type = 'item', name = 'nuclear-reactor', amount = 1}, {type = 'item', name = 'steel-plate', amount = 300}, {type = 'item', name = 'processing-unit', amount = 400}}
        data.raw.recipe['fusion-generator'].category = 'crafting'
        data.raw.recipe['fusion-generator'].ingredients = {{type = 'item', name = 'steam-turbine', amount = 1}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'processing-unit', amount = 200}}
        data.raw.recipe['fusion-power-cell'].category = 'crafting-with-fluid'
        data.raw.recipe['fusion-power-cell'].ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'fluid', name = 'petroleum-gas', amount = 100}}
        data.raw.recipe['fusion-reactor-equipment'].category = 'crafting'
        data.raw.recipe['fusion-reactor-equipment'].ingredients = {{type = 'item', name = 'fission-reactor-equipment', amount = 1}, {type = 'item', name = 'fusion-power-cell', amount = 10}, {type = 'item', name = 'steel-plate', amount = 350}, {type = 'item', name = 'processing-unit', amount = 275}}
        data.raw.recipe['fluoroketone'].category = 'chemistry'
        data.raw.recipe['fluoroketone'].ingredients = {{type = 'fluid', name = 'light-oil', amount = 50}, {type = 'fluid', name = 'petroleum-gas', amount = 50}, {type = 'item', name = 'steel-plate', amount = 1}}
        data.raw.recipe['fluoroketone-cooling'].category = 'chemistry'
        data.raw.recipe['fusion-power-cell'].category = 'crafting-with-fluid'
        data.raw.recipe['fusion-power-cell'].ingredients = {{type = 'item', name = 'steel-plate', amount = 20}, {type = 'fluid', name = 'petroleum-gas', amount = 200}}
        data.raw.recipe['fusion-power-cell'].results = {{type = 'item', name = 'fusion-power-cell', amount = 4}}
        data.raw.recipe['agricultural-tower'].ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electronic-circuit', amount = 3}, {type = 'item', name = 'landfill', amount = 1}}
        data.raw.recipe['electromagnetic-plant'].category = 'crafting-with-fluid'
        data.raw.recipe['electromagnetic-plant'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'assembling-machine-3', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'fluid', name = 'sulfuric-acid', amount = 60}}
        data.raw.recipe['cryogenic-plant'].category = 'crafting-with-fluid'
        data.raw.recipe['cryogenic-plant'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'chemical-plant', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'fluid', name = 'water', amount = 60}}
        data.raw.recipe['biolab'].ingredients = {{type = 'item', name = 'lab', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'item', name = 'processing-unit', amount = 60}, {type = 'item', name = 'uranium-235', amount = 3}}
        data.raw.recipe['foundry'].category = 'crafting-with-fluid'
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

        for _, a in pairs({'asteroid', 'asteroid-chunk'}) do
            for _, v in pairs(data.raw[a]) do
                v.hidden = true
                v.hidden_in_factoriopedia = true
            end
        end

        for _, v in pairs({'lithium-brine', 'fluorine', 'ammonia', 'ammoniacal-solution', 'electrolyte', 'holmium-solution', 'molten-copper', 'molten-iron', 'lava', 'thruster-oxidizer', 'thruster-fuel'}) do
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

        data.raw['tile']['empty-space'].hidden = true
        data.raw['tile']['empty-space'].hidden_in_factoriopedia = true
        data.raw['tile']['space-platform-foundation'].hidden = true
        data.raw['tile']['space-platform-foundation'].hidden_in_factoriopedia = true
        data.raw['tile']['foundation'].hidden = true
        data.raw['tile']['foundation'].hidden_in_factoriopedia = true

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

        -- Normal biters and spitters is 30 times
        --[[
        data.raw['unit-spawner']['biter-spawner'].result_units = {
            {'small-biter', {{0.0, 90}, {0.6, 0}}},
            {'medium-biter', {{0.2, 0}, {0.6, 90}, {0.7, 30}}},
            {'big-biter', {{0.5, 0}, {1.0, 120}}},
            {'small-strafer-pentapod', {{0.6, 8}, {1.0, 4}}},
            {'medium-strafer-pentapod', {{0.7, 0}, {1.0, 2}}},
            {'big-strafer-pentapod', {{0.75, 0}, {1.0, 1}}},
            {'behemoth-biter', {{0.9, 0}, {1.0, 90}}},
        }

        data.raw['unit-spawner']['spitter-spawner'].result_units = {
            {'small-biter', {{0.0, 90}, {0.35, 0}}},
            {'small-spitter', {{0.25, 0}, {0.5, 90}, {0.7, 0}}},
            {'medium-spitter', {{0.4, 0}, {0.7, 90}, {0.9, 30}}},
            {'big-spitter', {{0.5, 0}, {1.0, 120}}},
            {'small-stomper-pentapod', {{0.7, 8}, {1.0, 4}}},
            {'medium-stomper-pentapod', {{0.8, 0}, {1.0, 2}}},
            {'big-stomper-pentapod', {{0.9, 0}, {1.0, 1}}},
            {'behemoth-spitter', {{0.9, 0}, {1.0, 90}}},
        }
        ]]

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
    end
end

if settings.startup['PHI-CT'].value then
    for _, v in pairs({'infinity-chest', 'infinity-cargo-wagon', 'infinity-pipe'}) do
        data.raw['item'][v].hidden = false
        data.raw['item'][v].hidden_in_factoriopedia = false

        data:extend({{
            type = 'recipe',
            name = data.raw['item'][v].name,
            energy_required = 2,
            enabled = false,
            ingredients = {},
            results = {{type = 'item', name = data.raw['item'][v].name, amount = 1}},
            main_product = data.raw['item'][v].name
        }})
    end

    if data.raw['linked-container']['linked-chest'] then
        data.raw['item']['linked-chest'].subgroup = 'storage'
        data.raw['item']['linked-chest'].order = 'a[items]-d[linked-chest]'
        data.raw['item']['linked-chest'].stack_size = 50

        data.raw['linked-container']['linked-chest'].circuit_connector = table.deepcopy(data.raw['container']['steel-chest'].circuit_connector)
        data.raw['linked-container']['linked-chest'].circuit_wire_max_distance = data.raw['container']['steel-chest'].circuit_wire_max_distance
        data.raw['linked-container']['linked-chest'].quality_affects_inventory_size = false
        data.raw['linked-container']['linked-chest'].inventory_type = 'with_filters_and_bar'
        data.raw['linked-container']['linked-chest'].inventory_size = 48
        data.raw['linked-container']['linked-chest'].gui_mode = 'all'
        data.raw['linked-container']['linked-chest'].surface_conditions = nil

        data:extend({{
            type = 'recipe',
            name = 'linked-chest',
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'steel-chest', amount = 1}},
            results = {{type = 'item', name = 'linked-chest', amount = 1}},
            main_product = 'linked-chest'
        }})
    end


    if data.raw['radar']['radar'] then
        local item = table.deepcopy(data.raw['item']['radar'])
        item.name = 'super-radar'
        item.place_result = item.name
        item.order = 'd[radar]-b[radar]'
        item.icons = {{icon = item.icon or '__base__/graphics/icons/radar.png', tint = items['tint'][8], icon_size = item.icon_size or 64, icon_mipmaps = item.icon_mipmaps or 4}}
        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'', {'name.super-entity'}, {'entity-name.radar'}}
        data:extend({item})

        local entity = table.deepcopy(data.raw['radar']['radar'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.max_distance_of_sector_revealed = 35
        entity.max_distance_of_nearby_sector_revealed = 35
        entity.pictures.layers[1].tint = items['tint'][8]
        entity.localised_name = {'', {'name.super-entity'}, {'entity-name.radar'}}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'electronic-circuit', amount = 5}, {type = 'item', name = 'iron-gear-wheel', amount = 5}, {type = 'item', name = 'iron-plate', amount = 10}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'', {'name.super-entity'}, {'entity-name.radar'}}
        }})
    end

    if data.raw['electric-energy-interface']['electric-energy-interface'] then
        local item = table.deepcopy(data.raw['item']['electric-energy-interface'])
        item.name = 'passive-energy-void'
        item.place_result = item.name
        item.subgroup = 'energy'
        item.localised_name = {'name.passive-energy-void'}
        data:extend({item})

        local entity = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])
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
        entity.localised_name = {'name.passive-energy-void'}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'accumulator', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'name.passive-energy-void'}
        }})
    end

    for _, v in pairs(data.raw.fluid) do
        if (not data.raw.recipe['pump-' .. v.name]) and v.subgroup == 'fluid' then
            data:extend({{
                type = 'recipe',
                name = 'pump-' .. v.name,
                category = 'fluid',
                energy_required = 1,
                enabled = false,
                ingredients = {},
                results = {{type = 'fluid', name = v.name, amount = 12000 * settings.startup['PHI-MI-PIPE'].value / 10, temperature = v.default_temperature}},
                main_product = v.name,
                hide_from_player_crafting = true,
                hidden_in_factoriopedia = true,
                allow_productivity = false,
                crafting_machine_tint = {primary = v.flow_color},
                localised_name = {'fluid-name.' .. v.name}
            }})
        end
    end

    if settings.startup['PHI-CT-TILE'].value then
        data.raw['map-gen-presets']['default']['empty-world'] = {
            order = 'zz',
            basic_settings = {
                default_enable_all_autoplace_controls = false,
                autoplace_controls = {},
                autoplace_settings = {
                    tile = {
                        treat_missing_as_default = false,
                        settings = {
                            [settings.startup['PHI-CT-TILE-CHOICE'].value] = {frequency = 1.0, size = 1.0, richness = 1.0}
                        }
                    },
                    entity = {
                        treat_missing_as_default = false
                    },
                    decorative = {
                        treat_missing_as_default = false
                    }
                },
                no_enemies_mode = true
            },
            advanced_settings = {
                pollution = {
                    enabled = false
                },
                enemy_evolution = {
                    enabled = false
                },
                enemy_expansion = {
                    enabled = false
                }
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
