local mod_graphic_location = '__PHI-CL__/graphics/'

local mod_tint = {
    [2] = {r=140, g=142, b=200},
    [3] = {r=242, g=161, b=26},
    [4] = {r=255, g=254, b=42},
    [5] = {r=54, g=228, b=255},
    [6] = {r=253, g=0, b=97},
    [7] = {r=0, g=209, b=102},
    [8] = {r=233, g=63, b=233}
}

-- MIG C 1 BASE ARMOR_EQUIPMENT
if data.raw['active-defense-equipment'] and data.raw['active-defense-equipment']['discharge-defense-equipment'] then
    data.raw['active-defense-equipment']['discharge-defense-equipment'].automatic = true
end

-- MIG C 2 BASE ENTITY
if data.raw['programmable-speaker'] and data.raw['programmable-speaker']['programmable-speaker'] then
    data.raw['programmable-speaker']['programmable-speaker'].energy_source.usage_priority = 'primary-input'
end

if data.raw['fluid-turret'] and data.raw['fluid-turret']['flamethrower-turret'] then
    table.insert(data.raw['fluid-turret']['flamethrower-turret'].attack_parameters.fluids, {type = 'sulfuric-acid', damage_modifier = 1.2})
end

-- MIG C 8 BASE ENTITY
for _, t in pairs({'container', 'logistic-container'}) do
    if data.raw[t] then
        for _, v in pairs(data.raw[t]) do
            v.inventory_type = 'with_filters_and_bar'
        end
    end
end

-- MI C 4 BASE ENTITY
for _, t in pairs({'cargo-wagon', 'fluid-wagon'}) do
    if data.raw[t] then
        for _, v in pairs(data.raw[t]) do
            v.quality_affects_inventory_size = true
        end
    end
end

-- MI C 1 BASE ENTITY
if data.raw['lamp'] then
    for _, v in pairs(data.raw['lamp']) do
        if v.light then
            v.light.color = {1, 1, 1}
        end

        if v.light_when_colored then
            v.light_when_colored.color = {1, 1, 1}
        end
    end
end

-- MI C 1 BASE ENTITY
if data.raw['land-mine'] then
    for _, v in pairs(data.raw['land-mine']) do
        v.flags = {'placeable-player', 'placeable-enemy', 'player-creation', 'not-on-map'}
    end
end

-- MI C 1 BASE ENTITY
if data.raw['locomotive'] then
    for _, v in pairs(data.raw['locomotive']) do
        v.reversing_power_modifier = 1
    end
end

-- MIG C 1 BASE ENTITY
if data.raw['reactor'] then
    for _, v in pairs(data.raw['reactor']) do
        v.scale_energy_usage = (v.fast_replaceable_group and v.fast_replaceable_group == 'reactor')
    end
end

-- MIG C 3 BASE ENTITY,ITEM
-- MIG A 1 BASE RECIPE
if data.raw['valve'] then
    for _, v in pairs(data.raw['valve']) do
        v.hidden = false
        v.heating_energy = nil
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
end

-- MIG A 1 BASE ENTITY,ITEM,RECIPE
if data.raw['offshore-pump'] and data.raw['offshore-pump']['offshore-pump'] then
    local item = table.deepcopy(data.raw['item']['offshore-pump'])
    item.name = 'super-pump'
    item.place_result = item.name
    item.order = 'b[fluids]-a[super-pump]-o'
    item.icons = {{icon = '__base__/graphics/icons/offshore-pump.png', tint = mod_tint[2], icon_size = 64, icon_mipmaps = 4}}
    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.localised_name = {'', {'name.super-entity'}, {'entity-name.pump'}}
    data:extend({item})

    local entity = table.deepcopy(data.raw['offshore-pump']['offshore-pump'])
    entity.name = item.name
    entity.minable.result = item.name
    entity.type = 'assembling-machine'
    entity.crafting_categories = {'super-pump-fluid'}
    entity.crafting_speed = 1
    entity.energy_source = {type = 'void'}

    entity.fluid_boxes = {{
        production_type = 'output',
        pipe_covers = table.deepcopy(entity.fluid_box.pipe_covers),
        volume = 100,
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

-- MIG C 1 BASE ENTITY
-- MIG C 1 SPACE_AGE ENTITY
if data.raw['mining-drill'] then
    for _, v in pairs(data.raw['mining-drill']) do
        v.filter_count = 5
        v.drops_full_belt_stacks = (mods['space-age'] and true) or nil
    end
end

-- MIG C 3 BASE MODULE
if data.raw['module'] then
    if data.raw['module']['efficiency-module'] then
        data.raw['module']['efficiency-module'].effect.consumption = math.min(-0.3, data.raw['module']['efficiency-module'].effect.consumption)
    end

    if data.raw['module']['efficiency-module-2'] then
        data.raw['module']['efficiency-module-2'].effect.consumption = math.min(-0.6, data.raw['module']['efficiency-module-2'].effect.consumption)
    end

    if data.raw['module']['efficiency-module-3'] then
        data.raw['module']['efficiency-module-3'].effect.consumption = math.min(-0.9, data.raw['module']['efficiency-module-3'].effect.consumption)
    end
end

-- MIG C 1 BASE RECIPE
if data.raw.recipe['landfill'] then
    for _, v in pairs(data.raw.recipe['landfill'].ingredients) do
        if v.type == 'item' and v.name == 'stone' then
            v.amount = math.min(20, v.amount)
            break
        end
    end
end

-- MIG C 1 BASE RECIPE
if data.raw.recipe['selector-combinator'] then
    data.raw.recipe['selector-combinator'].ingredients = {{type = 'item', name = 'advanced-circuit', amount = 5}, {type = 'item', name = 'decider-combinator', amount = 2}}
end

-- MIG A 1 BASE RECIPE_CATEGORY
data:extend({{type='recipe-category', name='super-pump-fluid'}})

-- MIG A 8 BASE RECIPE
-- MIG A 14 SPACE_AGE RECIPE
for _, v in pairs(data.raw.fluid) do
    if v.subgroup == 'fluid' then
        data:extend({{
            type = 'recipe',
            name = 'super-pump-' .. v.name,
            category = 'super-pump-fluid',
            energy_required = 1,
            enabled = false,
            ingredients = {},
            results = {{type = 'fluid', name = v.name, amount = 12000, temperature = v.default_temperature or 15}},
            main_product = v.name,
            hide_from_player_crafting = true,
            hidden = false,
            hidden_in_factoriopedia = true,
            allow_productivity = false,
            localised_name = {'fluid-name.' .. v.name}
        }})
    end
end

if data.raw.fluid['water'] and data.raw.recipe['super-pump-water'] then
    data.raw.recipe['super-pump-water'].enabled = true
end

-- MIG C 5 BASE ENTITY
-- MIG C 1 SPACE_AGE ENTITY
if data.raw['inserter'] then
    for _, v in pairs(data.raw['inserter']) do
        if v.energy_source and v.energy_source.type and (v.energy_source.type == 'electric' or v.energy_source.type == 'void' or v.energy_source.type == 'burner') then
            v.allow_custom_vectors = true
            v.flags = {'placeable-neutral', 'placeable-player', 'player-creation', ((v.hand_size and v.hand_size > 0.8) and 'building-direction-16-way') or 'building-direction-8-way'}

            if v.energy_source.type == 'burner' then
                v.allow_burner_leech = true
            end
        end
    end
end

-- MIG A 36 BASE VIRTUAL_SIGNAL
local vir_sig = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
local s = {}

for i = 1, #vir_sig do
    local char = vir_sig:sub(i, i)
    table.insert(s, {
        type = 'virtual-signal',
        name = 'signal-' .. char .. 'A',
        icon = '__PHI-CL__/graphics/signal/signal_' .. char .. '.png',
        subgroup = (i < 11 and 'virtual-signal-number') or 'virtual-signal-letter',
        order = ((i < 11 and 'b[numbers]2-[') or 'c[letters]2-[') .. char .. ']',
        localised_name = {'phi-cl.combine', {'virtual-signal-name.signal-' .. char}, '(II)'}
    })
end

data:extend(s)

-- MIG A 1 ELEVATED_RAILS ENTITY
if mods['elevated-rails'] and data.raw['electric-pole'] and data.raw['electric-pole']['big-electric-pole'] then
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
end

-- MIG A 1 SPACE_AGE ENTITY
if mods['space-age'] and data.raw['lightning-attractor'] and data.raw['lightning-attractor']['lightning-rod'] then
    local entity = table.deepcopy(data.raw['lightning-attractor']['lightning-rod'])
    entity.name = 'rail-support-pole-lightning'
    entity.enabled = false
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

-- MIG A 1 BASE ENTITY,ITEM,RECIPE,RESEARCH_EFFECT
if data.raw['container'] and data.raw['container']['steel-chest'] then
    local item = table.deepcopy(data.raw['item']['steel-chest'])
    item.name = 'trash-chest'
    item.place_result = item.name
    item.subgroup = 'storage'
    item.order = 'b[storage]-h[trash-chest]'
    item.icons = {{icon = item.icon or '__base__/graphics/icons/steel-chest.png', tint = mod_tint[8], icon_size = item.icon_size or 64, icon_mipmaps = item.icon_mipmaps or 4}}
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
    entity.picture.layers[1].tint = mod_tint[8]
    entity.localised_name = {'', {'name.trash-entity'}, {'entity-name.steel-chest'}}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = item.name,
        energy_required = 2,
        enabled = (data.raw.technology['steel-processing'] and false) or true,
        ingredients = {{type = 'item', name = 'steel-chest', amount = 1}},
        results = {{type = 'item', name = item.name, amount = 1}},
        main_product = item.name,
        localised_name = {'', {'name.trash-entity'}, {'entity-name.steel-chest'}}
    }})

    if data.raw.technology['steel-processing'] then
        table.insert(data.raw.technology['steel-processing'].effects, {type = 'unlock-recipe', recipe = item.name})
    end
end

-- MIG A 1 BASE ENTITY,ITEM,RECIPE,RESEARCH_EFFECT
if data.raw['pipe'] and data.raw['pipe']['pipe'] then
    local item = table.deepcopy(data.raw['item']['pipe'])
    item.name = 'trash-pipe'
    item.place_result = item.name
    item.subgroup = 'energy-pipe-distribution'
    item.order = 'a[pipe]-c[trash-pipe]'
    item.icons = {{icon = item.icon or '__base__/graphics/icons/pipe.png', tint = mod_tint[8], icon_size = item.icon_size or 64, icon_mipmaps = item.icon_mipmaps or 4}}
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
        v.tint = mod_tint[8]

        if v.hr_version then
            v.hr_version.tint = mod_tint[8]
        end
    end

    entity.localised_name = {'', {'name.trash-entity'}, {'entity-name.pipe'}}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = item.name,
        energy_required = 2,
        enabled = (data.raw.technology['automation'] and false) or true,
        ingredients = {{type = 'item', name = 'iron-plate', amount = 1}},
        results = {{type = 'item', name = item.name, amount = 1}},
        main_product = item.name,
        localised_name = {'', {'name.trash-entity'}, {'entity-name.pipe'}}
    }})

    if data.raw.technology['automation'] then
        table.insert(data.raw.technology['automation'].effects, {type = 'unlock-recipe', recipe = item.name})
    end
end

-- MIG A 1 BASE ENTITY,ITEM,RECIPE
if data.raw['boiler'] and data.raw['boiler']['boiler'] then
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

-- MIG C 3 BASE ENTITY,ITEM,RECIPE
-- MIG C 1 SPACE_AGE ENTITY,ITEM,RECIPE
if data.raw['loader'] then
    for _, ln in pairs(data.raw['loader']) do
        local l = ln.name

        ln.filter_count = 2
        ln.per_lane_filters = true
        ln.adjustable_belt_stack_size = (data.raw['inserter']['stack-inserter'] and true) or false
        ln.max_belt_stack_size = (data.raw['inserter']['stack-inserter'] and data.raw['inserter']['stack-inserter'].max_belt_stack_size) or 1

        if data.raw.item[l] then
            data.raw.item[l].hidden = false
            data.raw.item[l].hidden_in_factoriopedia = false
        end

        if data.raw.recipe[l] then
            data.raw.recipe[l].hidden = false
            data.raw.recipe[l].hidden_in_factoriopedia = false
        end
    end
end

-- MIG A 3 BASE RESEARCH_EFFECT
-- MIG A 1 SPACE_AGE RESEARCH_EFFECT
for _, v in pairs({{'logistics', 'loader'}, {'logistics-2', 'fast-loader'}, {'logistics-3', 'express-loader'}, {'turbo-transport-belt', 'turbo-loader'}}) do
    if data.raw['loader'] and data.raw['loader'][v[2]] then
        if data.raw.technology[v[1]] then
            table.insert(data.raw.technology[v[1]].effects, {type = 'unlock-recipe', recipe = v[2]})

        else
            data.raw.recipe[v[2]].enabled = true
        end
    end
end

-- MIG C 1 BASE ENTITY
if data.raw['proxy-container'] and data.raw['proxy-container']['proxy-container'] then
    data.raw['proxy-container']['proxy-container'].flags = {'not-blueprintable', 'hide-alt-info', 'not-deconstructable', 'not-flammable', 'not-on-map', 'placeable-off-grid', 'placeable-player', 'no-automated-item-insertion', 'no-automated-item-removal'}
    data.raw['proxy-container']['proxy-container'].draw_inventory_content = false
end

-- MIG C 18 BASE ENTITY
-- MIG C 5 SPACE_AGE ENTITY
for _, w in pairs({'storage-tank', 'generator', 'furnace', 'roboport', 'assembling-machine', 'offshore-pump', 'pump', 'pipe', 'pipe-to-ground', 'infinity-pipe'}) do
    if data.raw[w] then
        for _, v in pairs(data.raw[w]) do
            v.heating_energy = nil
        end
    end
end

-- 1 ENTITY FROM ABOVE
-- MIG C 0 BASE ENTITY
-- MIG C 1 BASE ARMOR_EQUIPMENT
for _, w in pairs({'roboport', 'roboport-equipment'}) do
    if data.raw[w] then
        for _, v in pairs(data.raw[w]) do
            if v.energy_source then
                v.energy_source.input_flow_limit = nil
            end

            if w == 'roboport' then
                v.robot_slots_count = 10
                v.material_slots_count = 2
            end

            v.charging_energy = tostring(tonumber(string.match(v.charging_energy, '[%d%.]+')) * 2) .. string.match(v.charging_energy, '%a+')
            v.charging_station_count = 8
            v.charging_station_count_affected_by_quality = true
        end
    end
end

-- MIG C 1 SPAGE_AGE ENTITY
if data.raw['thruster'] and data.raw['thruster']['thruster'] then
    if data.raw['thruster']['thruster'].fuel_fluid_box then
        table.insert(data.raw['thruster']['thruster'].fuel_fluid_box.pipe_connections, {flow_direction = 'input-output', direction = defines.direction.west, position = {-1.5, 2}})
    end

    if data.raw['thruster']['thruster'].oxidizer_fluid_box then
        table.insert(data.raw['thruster']['thruster'].oxidizer_fluid_box.pipe_connections, {flow_direction = 'input-output', direction = defines.direction.east, position = {1.5, 2}})
    end
end

-- MIG C 1 SPAGE_AGE ENTITY
if data.raw['fusion-generator'] and data.raw['fusion-generator']['fusion-generator'] then
    for _, fb in pairs({'input_fluid_box', 'output_fluid_box'}) do
        for _, v in pairs(data.raw['fusion-generator']['fusion-generator'][fb].pipe_connections) do
            v.flow_direction = 'input-output'
        end
    end
end

-- MIG A 1 SPACE_AGE ENTITY,ITEM,RECIPE,RESEARCH_EFFECT
if data.raw['reactor'] and data.raw['reactor']['heating-tower'] then
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

-- MIG A 2 BASE ITEM,RECIPE
-- MIG C 1 BASE ENTITY
if data.raw.item['depleted-uranium-fuel-cell'] and data.raw.item['nuclear-fuel'] then
    local item = table.deepcopy(data.raw.item['depleted-uranium-fuel-cell'])
    item.name = 'empty-train-battery'
    item.icon = mod_graphic_location .. 'battery.png'
    item.order = 'qa'
    item.stack_size = 100
    item.localised_name = {'name.empty-train-battery'}
    item.localised_description = {'description.empty-train-battery'}
    data:extend({item})

    data:extend({{
        type = 'recipe',
        name = 'empty-train-battery',
        energy_required = 20,
        enabled = true,
        icon = mod_graphic_location .. 'battery.png',
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

    item = table.deepcopy(data.raw.item['nuclear-fuel'])
    item.name = 'charged-train-battery'
    item.burnt_result = 'empty-train-battery'
    item.fuel_value = '1GJ'
    item.icon = mod_graphic_location .. 'battery.png'
    item.stack_size = 10
    item.localised_name = {'name.charged-train-battery'}
    item.localised_description = {'description.charged-train-battery'}
    data:extend({item})

    data:extend({{
        type = 'recipe',
        name = 'charged-train-battery',
        energy_required = 30,
        enabled = true,
        icon = mod_graphic_location .. 'battery.png',
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

    if data.raw['locomotive'] then
        for _, v in pairs(data.raw['locomotive']) do
            if v.energy_source then
                v.energy_source.burnt_inventory_size = (v.energy_source.burnt_inventory_size and math.max(v.energy_source.burnt_inventory_size, 1)) or 1
            end
        end
    end
end
