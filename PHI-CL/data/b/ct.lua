local param = require 'config'

-- CT U 3 BASE ITEM
-- CT A 3 BASE RECIPE
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

-- CT C 1 BASE ENTITY,ITEM
-- CT A 1 BASE RECIPE
if data.raw['linked-container']['linked-chest'] then
    data.raw['item']['linked-chest'].subgroup = 'storage'
    data.raw['item']['linked-chest'].order = 'a[items]-d[linked-chest]'
    data.raw['item']['linked-chest'].stack_size = 50

    data.raw['linked-container']['linked-chest'].circuit_connector = table.deepcopy(data.raw['container']['steel-chest'].circuit_connector)
    data.raw['linked-container']['linked-chest'].circuit_wire_max_distance = data.raw['container']['steel-chest'].circuit_wire_max_distance
    -- data.raw['linked-container']['linked-chest'].quality_affects_inventory_size = false
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

-- CT A 1 BASE ENTITY,ITEM,RECIPE
if data.raw['radar']['radar'] then
    local item = table.deepcopy(data.raw['item']['radar'])
    item.name = 'super-radar'
    item.place_result = item.name
    item.order = 'd[radar]-b[radar]'
    item.icons = {{icon = item.icon or '__base__/graphics/icons/radar.png', tint = param['tint'][8], icon_size = item.icon_size or 64, icon_mipmaps = item.icon_mipmaps or 4}}
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
    entity.pictures.layers[1].tint = param['tint'][8]
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

-- CT A 2 BASE ENTITY,ITEM,RECIPE
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

    item = table.deepcopy(data.raw['item']['electric-energy-interface'])
    item.name = 'active-energy-void'
    item.place_result = item.name
    item.subgroup = 'energy'
    item.localised_name = {'name.active-energy-void'}
    data:extend({item})

    entity = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])
    entity.name = item.name
    entity.minable.result = item.name
    entity.energy_source.usage_priority = 'primary-input'
    entity.energy_source.emissions_per_minute = {pollution = 0}
    entity.energy_source.input_flow_limit = '1PW'
    entity.energy_source.output_flow_limit = '0W'
    entity.energy_source.buffer_capacity = '1PJ'
    entity.energy_production = '0W'
    entity.energy_usage = '1PW'
    entity.gui_mode = 'none'
    entity.localised_name = {'name.active-energy-void'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = item.name,
        energy_required = 2,
        enabled = false,
        ingredients = {{type = 'item', name = 'accumulator', amount = 1}},
        results = {{type = 'item', name = item.name, amount = 1}},
        main_product = item.name,
        localised_name = {'name.active-energy-void'}
    }})
end

-- CT A 8 BASE RECIPE
-- CT A 14 SPACE_AGE RECIPE
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
