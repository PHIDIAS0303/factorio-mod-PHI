local mod_tint = {
    [2] = {r=140, g=142, b=200},
    [3] = {r=242, g=161, b=26},
    [4] = {r=255, g=254, b=42},
    [5] = {r=54, g=228, b=255},
    [6] = {r=253, g=0, b=97},
    [7] = {r=0, g=209, b=102},
    [8] = {r=233, g=63, b=233}
}

-- CT U 3 BASE ITEM
-- CT A 3 BASE RECIPE
for _, v in pairs({'infinity-chest', 'infinity-cargo-wagon', 'infinity-pipe'}) do
    data.raw['item'][v].hidden = false
    data.raw['item'][v].hidden_in_factoriopedia = false

    data:extend({{
        type = 'recipe',
        name = data.raw['item'][v].name,
        energy_required = 2,
        enabled = true,
        categories = {'crafting'},
        hidden = true,
        hidden_in_factoriopedia = true,
        ingredients = {},
        results = {{type = 'item', name = data.raw['item'][v].name, amount = 1}},
        main_product = data.raw['item'][v].name
    }})
end

-- CT C 1 BASE ENTITY,ITEM
-- CT A 1 BASE RECIPE
if data.raw['linked-container'] and data.raw['linked-container']['linked-chest'] then
    data.raw['item']['linked-chest'].subgroup = 'storage'
    data.raw['item']['linked-chest'].order = 'a[items]-d[linked-chest]'
    data.raw['item']['linked-chest'].stack_size = 50

    data.raw['linked-container']['linked-chest'].circuit_connector = table.deepcopy(data.raw['container']['steel-chest'].circuit_connector)
    data.raw['linked-container']['linked-chest'].circuit_wire_max_distance = data.raw['container']['steel-chest'].circuit_wire_max_distance
    data.raw['linked-container']['linked-chest'].inventory_type = 'with_filters_and_bar'
    data.raw['linked-container']['linked-chest'].inventory_size = data.raw['container']['steel-chest'].inventory_size
    data.raw['linked-container']['linked-chest'].gui_mode = 'all'
    data.raw['linked-container']['linked-chest'].surface_conditions = nil

    data:extend({{
        type = 'recipe',
        name = 'linked-chest',
        energy_required = 2,
        enabled = true,
        categories = {'crafting'},
        hidden = true,
        hidden_in_factoriopedia = true,
        ingredients = {{type = 'item', name = 'steel-chest', amount = 1}},
        results = {{type = 'item', name = 'linked-chest', amount = 1}},
        main_product = 'linked-chest'
    }})
end

-- CT A 1 BASE ENTITY,ITEM,RECIPE
if data.raw['radar'] and data.raw['radar']['radar'] then
    local item = table.deepcopy(data.raw['item']['radar'])
    item.name = 'super-radar'
    item.place_result = item.name
    item.order = 'd[radar]-b[radar]'
    item.icons = {{icon = item.icon or '__base__/graphics/icons/radar.png', tint = mod_tint[8], icon_size = item.icon_size or 64, icon_mipmaps = item.icon_mipmaps or 4}}
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
    entity.pictures.layers[1].tint = mod_tint[8]
    entity.localised_name = {'', {'name.super-entity'}, {'entity-name.radar'}}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = item.name,
        energy_required = 2,
        enabled = true,
        categories = {'crafting'},
        hidden = true,
        hidden_in_factoriopedia = true,
        ingredients = {{type = 'item', name = 'electronic-circuit', amount = 5}, {type = 'item', name = 'iron-gear-wheel', amount = 5}, {type = 'item', name = 'iron-plate', amount = 10}},
        results = {{type = 'item', name = item.name, amount = 1}},
        main_product = item.name,
        localised_name = {'', {'name.super-entity'}, {'entity-name.radar'}}
    }})
end

-- CT A 2 BASE ENTITY,ITEM,RECIPE
if data.raw['electric-energy-interface'] and data.raw['electric-energy-interface']['electric-energy-interface'] then
    for _, v in pairs({'active', 'passive'}) do
        local item = table.deepcopy(data.raw['item']['electric-energy-interface'])
        item.name = v .. '-energy-void'
        item.place_result = item.name
        item.subgroup = 'energy'
        item.localised_name = {'name.' .. item.name}
        data:extend({item})

        local entity = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.energy_source.usage_priority = (v == 'passive' and 'tertiary') or 'primary-input'
        entity.energy_source.emissions_per_minute = {pollution = 0}
        entity.energy_source.input_flow_limit = '1PW'
        entity.energy_source.output_flow_limit = '0W'
        entity.energy_source.buffer_capacity = '1PJ'
        entity.energy_production = '0W'
        entity.energy_usage = '1PW'
        entity.gui_mode = 'none'
        entity.localised_name = {'name.' .. item.name}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            categories = {'crafting'},
            hidden = true,
            hidden_in_factoriopedia = true,
            ingredients = {{type = 'item', name = 'accumulator', amount = 1}},
            results = {{type = 'item', name = item.name, amount = 1}},
            main_product = item.name,
            localised_name = {'name.' .. item.name}
        }})
    end
end

-- CT A 1 BASE ENTITY,ITEM
-- CT C 1 BASE ENTITY
if data.raw['loader-1x1'] and data.raw['loader-1x1']['loader-1x1'] then
    local max_belt_speed = 0

    for _, b in pairs(data.raw['transport-belt']) do
        if b.speed then
            max_belt_speed = math.max(max_belt_speed, b.speed)
        end
    end

    data.raw['loader-1x1']['loader-1x1'].hidden = false
    data.raw['loader-1x1']['loader-1x1'].hidden_in_factoriopedia = false
    data.raw['loader-1x1']['loader-1x1'].filter_count = 2
    data.raw['loader-1x1']['loader-1x1'].per_lane_filters = true
    data.raw['loader-1x1']['loader-1x1'].adjustable_belt_stack_size = (data.raw['inserter']['stack-inserter'] and true) or false
    data.raw['loader-1x1']['loader-1x1'].max_belt_stack_size = (data.raw['inserter']['stack-inserter'] and data.raw['inserter']['stack-inserter'].max_belt_stack_size) or 1

    if data.raw.item['loader'] then
        local item = table.deepcopy(data.raw.item['loader'])
        item.name = 'loader-1x1'
        item.place_result = item.name
        item.hidden = false
        item.hidden_in_factoriopedia = false
    end

    if data.raw.recipe['loader'] then
        local recipe = table.deepcopy(data.raw.recipe['loader'])
        recipe.name = 'loader-1x1'
        recipe.enabled = false
        recipe.results = {{type = 'item', name = recipe.name, amount = 1}}
        recipe.main_product = recipe.name
        recipe.hidden = false
        recipe.hidden_in_factoriopedia = false
        recipe.localised_name = {'?', data.raw['loader-1x1']['loader-1x1'].localised_name, ''}
        recipe.localised_description = {'?', data.raw['loader-1x1']['loader-1x1'].localised_description, ''}
    end

    if data.raw['infinity-container'] and data.raw['infinity-container']['infinity-chest'] then
        local entity = table.deepcopy(data.raw['infinity-container']['infinity-chest'])
        entity.name = 'loader-1x1-infinity-chest'
        entity.enabled = false
        entity.hidden = true
        entity.hidden_in_factoriopedia = true
        entity.gui_mode = 'none'
        entity.inventory_type = 'with_custom_stack_size'

        if not entity.inventory_properties then
            entity.inventory_properties = {}
        end

        entity.inventory_properties.stack_size_min = 100
        entity.minable.result = nil
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

-- CT A 1 BASE MAP_GEN_PRESET
if settings.startup['PHI-CT-TILE'].value then
    data.raw['map-gen-presets']['default']['empty-world'] = {
        order = 'zz',
        basic_settings = {
            default_enable_all_autoplace_controls = false,
            autoplace_controls = {},
            autoplace_settings = {
                tile = {treat_missing_as_default = false, settings = {[settings.startup['PHI-CT-TILE-CHOICE'].value] = {frequency = 1.0, size = 1.0, richness = 1.0}}},
                entity = {treat_missing_as_default = false},
                decorative = {treat_missing_as_default = false}
            },
            no_enemies_mode = true
        },
        advanced_settings = {pollution = {enabled = false}, enemy_evolution = {enabled = false}, enemy_expansion = {enabled = false}}
    }
end
