local items = require 'config'

data.raw.recipe['landfill'].ingredients[1].amount = math.min(20, data.raw.recipe['landfill'].ingredients[1].amount)
data.raw['inserter']['burner-inserter'].allow_burner_leech = true
data.raw['programmable-speaker']['programmable-speaker'].energy_source.usage_priority = 'primary-input'
data.raw['active-defense-equipment']['discharge-defense-equipment'].automatic = true
table.insert(data.raw['fluid-turret']['flamethrower-turret'].attack_parameters.fluids, {type = 'sulfuric-acid', damage_modifier = 1.2})
data.raw.recipe['selector-combinator'].ingredients = {{type = 'item', name = 'advanced-circuit', amount = 5}, {type = 'item', name = 'decider-combinator', amount = 2}}
data.raw['module']['efficiency-module'].effect.consumption = math.min(-0.3, data.raw['module']['efficiency-module'].effect.consumption)
data.raw['module']['efficiency-module-2'].effect.consumption = math.min(-0.6, data.raw['module']['efficiency-module'].effect.consumption)
data.raw['module']['efficiency-module-3'].effect.consumption = math.min(-0.9, data.raw['module']['efficiency-module'].effect.consumption)

for _, v in pairs(data.raw['container']) do
    v.inventory_type = 'with_filters_and_bar'
end

for _, v in pairs(data.raw['logistic-container']) do
    v.inventory_type = 'with_filters_and_bar'
end

for _, v in pairs(data.raw['reactor']) do
    v.scale_energy_usage = (v.fast_replaceable_group and v.fast_replaceable_group == 'reactor')
end

for _, v in pairs(data.raw['pump']) do
    v.pumping_speed = math.max(50, v.pumping_speed) * settings.startup['PHI-MI-PIPE'].value / 10
end

for _, v in pairs(data.raw['mining-drill']) do
    v.filter_count = 5
end

data:extend({{type='recipe-category', name='fluid'}})

for _, v in pairs(data.raw['valve']) do
    v.flow_rate = math.max(50, v.flow_rate) * settings.startup['PHI-MI-PIPE'].value / 10
    v.hidden = false
    data.raw.item[v.name].hidden = false
    data.raw.item[v.name].subgroup = 'energy-pipe-distribution'

    data:extend({{
        type = 'recipe',
        name = v.name,
        energy_required = 1,
        enabled = true,
        icon = data.raw.item[v.name].icon,
        icon_size = 64,
        order = 'zc',
        allow_productivity = false,
        ingredients = {{type = 'item', name = 'pipe', amount = 2}, {type = 'item', name = 'electronic-circuit', amount = 3}},
        results = {{type = 'item', name = v.name, amount = 1}},
        main_product = v.name,
        localised_name = {'entity-name.' .. v.name},
        localised_description = {'entity-description.' .. v.name}
    }})
end

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

for _, v in pairs(data.raw['inserter']) do
    if v.energy_source and v.energy_source.type and (v.energy_source.type == 'electric' or v.energy_source.type == 'void' or v.energy_source.type == 'burner') then
        v.allow_custom_vectors = true
        v.flags = {'placeable-neutral', 'placeable-player', 'player-creation', 'building-direction-8-way'}
    end
end

if data.raw['inserter']['long-handed-inserter'] and data.raw['inserter']['long-handed-inserter'].allow_custom_vectors then
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
        name = 'signal-' .. char .. 'A',
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

for _, r in pairs({'passive-provider', 'storage'}) do
    if data.raw.recipe['basic-' .. r .. '-chest'] then
        for _, t in pairs({'construction', 'logistic'}) do
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

if mods['space-age'] then
    data.raw['character']['character']['mining_categories'] = {'basic-solid', 'hard-solid'}

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

    table.insert(data.raw['thruster']['thruster'].fuel_fluid_box.pipe_connections, {flow_direction = 'input-output', direction = defines.direction.west, position = {-1.5, 2}})
    table.insert(data.raw['thruster']['thruster'].oxidizer_fluid_box.pipe_connections, {flow_direction = 'input-output', direction = defines.direction.east, position = {1.5, 2}})

    for _, fb in pairs({'input_fluid_box', 'output_fluid_box'}) do
        for _, v in pairs(data.raw['fusion-generator']['fusion-generator'][fb].pipe_connections) do
            v.flow_direction = 'input-output'
        end
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
end
