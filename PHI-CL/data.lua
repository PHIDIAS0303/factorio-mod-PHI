local items = require 'config'
local graphics_location = '__PHI-CL__/graphics/'
local main = require 'main'
local file_stage = 1

if settings.startup['PHI-EN'].value and settings.startup['PHI-EN-SOLAR-TIER'].value and settings.startup['PHI-EN-STEAM-TIER'].value and settings.startup['PHI-EN-NUCLEAR-TIER'].value then
    local ml = math.max(settings.startup['PHI-EN-SOLAR-TIER'].value, settings.startup['PHI-EN-STEAM-TIER'].value, settings.startup['PHI-EN-NUCLEAR-TIER'].value)

    for i=1, 7 do
        local tn = 'compound-energy-' .. i
        local prereq
        local e = true

        if i > 1 then
            prereq = {'compound-energy-' .. (i - 1)}

        else
            prereq = {'solar-energy', 'advanced-electronics', 'electric-energy-accumulators'}
        end

        if i > ml then
            e = false
        end

        data:extend({{
            type = 'technology',
            name = tn,
            enabled = e,
            prerequisites = prereq,
            effects = {},
            unit = {
                count = math.floor(100 * (i ^ 1.6)),
                ingredients = {
                    {'automation-science-pack', 1},
                    {'logistic-science-pack', 1}
                },
                time = 60
            },
            icons = {
                {
                    icon = '__base__/graphics/technology/solar-energy.png',
                    icon_size = 256,
                    tint = items['tint'][i]
                }
            },
            order = 'a-h-' .. i,
            localised_name = {'phi-cl.combine', {'technology-name.compound-energy'}, i},
            localised_description = {'technology-description.compound-energy'}
        }})
    end
end

if settings.startup['PHI-XW-WATER'].value > 0 then
    data.raw['offshore-pump']['offshore-pump'].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
    data.raw['offshore-pump']['offshore-pump'].flags = {'placeable-neutral', 'player-creation'}
    data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
    data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
    data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_mask = nil
    data.raw['offshore-pump']['offshore-pump'].placeable_position_visualization = nil
    data.raw['offshore-pump']['offshore-pump'].se_allow_in_space = true
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-OIL'].value then
    local item = table.deepcopy(data.raw['item']['offshore-pump'])
    item.name = 'oil-pump'
    item.place_result = 'oil-pump'
    item.order = 'b[fluids]-a[offshore-pump]-o'

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
    item.localised_name = {'name.oil-pump'}
    item.localised_description = {'description.oil-pump'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['offshore-pump']['offshore-pump'])
    entity.name = 'oil-pump'
    entity.minable.result = 'oil-pump'
    entity.fluid = 'crude-oil'
    entity.fluid_box.filter = 'crude-oil'
    entity.se_allow_in_space = true
    entity.localised_name = {'name.oil-pump'}
    entity.localised_description = {'description.oil-pump'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'oil-pump',
        energy_required = 2,
        enabled = true,
        ingredients = {{'electronic-circuit', 2}, {'pipe', 1}, {'iron-gear-wheel', 1}},
        result = 'oil-pump',
        localised_name = {'name.oil-pump'},
        localised_description = {'description.oil-pump'}
    }})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-RADAR'].value then
    local item = table.deepcopy(data.raw['item']['radar'])
    item.name = 'super-radar'
    item.place_result = 'super-radar'
    item.order = 'd[radar]-b[radar]'

    item.icons = {
        {
            icon = '__base__/graphics/icons/radar.png',
            tint = items['tint'][8],
            icon_size = 64,
            icon_mipmaps = 4
        }
    }

    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.localised_name = {'name.super-radar'}
    item.localised_description = {'description.super-radar'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['radar']['radar'])
    entity.name = 'super-radar'
    entity.minable.result = 'super-radar'
    entity.max_distance_of_sector_revealed = 35
    entity.max_distance_of_nearby_sector_revealed = 35
    entity.pictures.layers[1].tint = items['tint'][8]
    entity.pictures.layers[1].hr_version.tint = items['tint'][8]
    entity.se_allow_in_space = true
    entity.localised_name = {'name.super-radar'}
    entity.localised_description = {'description.super-radar'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'super-radar',
        energy_required = 2,
        enabled = true,
        ingredients = {{'electronic-circuit', 5}, {'iron-gear-wheel', 5}, {'iron-plate', 10}},
        result = 'super-radar',
        localised_name = {'name.super-radar'},
        localised_description = {'description.super-radar'}
    }})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TRASH'].value then
    local item = table.deepcopy(data.raw['item']['steel-chest'])
    item.name = 'trash-chest'
    item.place_result = 'trash-chest'
    item.order = 'b[storage]-h[trash-chest]'

    item.icons = {
        {
            icon = '__base__/graphics/icons/steel-chest.png',
            tint = items['tint'][8],
            icon_size = 64,
            icon_mipmaps = 4
        }
    }

    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.localised_name = {'name.trash-chest'}
    item.localised_description = {'description.trash-chest'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['container']['steel-chest'])
    entity.name = 'trash-chest'
    entity.minable.result = 'trash-chest'
    entity.inventory_type = 'with_filters_and_bar'
    entity.inventory_size = 1
    entity.type = 'infinity-container'
    entity.gui_mode = 'none'
    entity.erase_contents_when_mined = true
    entity.logistic_mode = nil
    entity.next_upgrade = nil
    entity.fast_replaceable_group = nil
    entity.picture.layers[1].tint = items['tint'][8]
    entity.picture.layers[1].hr_version.tint = items['tint'][8]
    entity.se_allow_in_space = true
    entity.localised_name = {'name.trash-chest'}
    entity.localised_description = {'description.trash-chest'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'trash-chest',
        energy_required = 2,
        enabled = false,
        ingredients = {{'steel-chest', 1}},
        result = 'trash-chest',
        localised_name = {'name.trash-chest'},
        localised_description = {'description.trash-chest'}
    }})

    table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='trash-chest'})

    item = table.deepcopy(data.raw['item']['pipe'])
    item.name = 'trash-pipe'
    item.place_result = 'trash-pipe'
    item.order = 'a[pipe]-c[trash-pipe]'

    item.icons = {
        {
            icon = '__base__/graphics/icons/pipe.png',
            tint = items['tint'][8],
            icon_size = 64,
            icon_mipmaps = 4
        }
    }

    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.localised_name = {'name.trash-pipe'}
    item.localised_description = {'description.trash-pipe'}
    data:extend({item})

    entity = table.deepcopy(data.raw['pipe']['pipe'])
    entity.name = 'trash-pipe'
    entity.minable.result = 'trash-pipe'
    entity.inventory_size = 1
    entity.type = 'infinity-pipe'
    entity.gui_mode = 'none'
    entity.erase_contents_when_mined = true
    entity.next_upgrade = nil
    entity.fast_replaceable_group = nil

    for _, v in pairs(entity.pictures) do
        v.tint = items['tint'][8]

        if v.hr_version then
            v.hr_version.tint = items['tint'][8]
        end
    end

    entity.se_allow_in_space = true
    entity.localised_name = {'name.trash-pipe'}
    entity.localised_description = {'description.trash-pipe'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'trash-pipe',
        energy_required = 2,
        enabled = false,
        ingredients = {{'iron-plate', 1}},
        result = 'trash-pipe',
        localised_name = {'name.trash-pipe'},
        localised_description = {'description.trash-pipe'}
    }})

    table.insert(data.raw.technology['automation'].effects, {type='unlock-recipe', recipe='trash-pipe'})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-MINER'].value then
    local item = table.deepcopy(data.raw['item']['electric-mining-drill'])
    item.name = 'large-area-electric-mining-drill'
    item.place_result = 'large-area-electric-mining-drill'
    item.order = 'zc'
    item.localised_name = {'name.large-area-electric-mining-drill'}
    item.localised_description = {'description.large-area-electric-mining-drill'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['mining-drill']['electric-mining-drill'])
    entity.name = 'large-area-electric-mining-drill'
    entity.minable.result = 'large-area-electric-mining-drill'
    entity.max_health = entity.max_health * 16
    entity.energy_usage = (tonumber(string.match(entity.energy_usage, '%d+')) * 16) .. 'kW'
    entity.resource_searching_radius = 9.99
    entity.mining_speed = entity.mining_speed * 16
    entity.energy_source.emissions_per_minute = entity.energy_source.emissions_per_minute * 16
    entity.module_specification.module_slots = 8
    entity.se_allow_in_space = true
    entity.localised_name = {'name.large-area-electric-mining-drill'}
    entity.localised_description = {'description.large-area-electric-mining-drill'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'large-area-electric-mining-drill',
        energy_required = 2,
        enabled = true,
        ingredients = {{'electric-mining-drill', 16}},
        result = 'large-area-electric-mining-drill',
        localised_name = {'name.large-area-electric-mining-drill'},
        localised_description = {'description.large-area-electric-mining-drill'}
    }})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-LINKED'].value then
    local item = table.deepcopy(data.raw['item']['linked-chest'])
    item.supgroup = 'storage'
    item.order = 'a[items]-d[linked-chest]'
    data:extend({item})

    local entity = table.deepcopy(data.raw['linked-container']['linked-chest'])
    entity.circuit_wire_connection_point = data.raw['container']['steel-chest'].circuit_wire_connection_point
    entity.circuit_connector_sprites = data.raw['container']['steel-chest'].circuit_connector_sprites
    entity.circuit_wire_max_distance = data.raw['container']['steel-chest'].circuit_wire_max_distance
    entity.inventory_type = 'with_filters_and_bar'
    entity.inventory_size = 48
    entity.gui_mode = 'all'
    entity.se_allow_in_space = true
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'linked-chest',
        energy_required = 2,
        enabled = false,
        ingredients = {{'steel-chest', 1}},
        result = 'linked-chest'
    }})

    table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='linked-chest'})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-LOADER'].value then
    data.raw.recipe['loader'].hidden = false
    data.raw.recipe['fast-loader'].hidden = false
    data.raw.recipe['express-loader'].hidden = false

    data.raw.recipe['loader'].ingredients = {
        {'iron-plate', 5},
        {'electronic-circuit', 5},
        {'transport-belt', 2},
        {'inserter', 2}
    }
    data.raw.recipe['fast-loader'].ingredients = {
        {'iron-gear-wheel', 10},
        {'electronic-circuit', 10},
        {'advanced-circuit', 1},
        {'loader', 1}
    }

    data.raw.recipe['express-loader'].ingredients = {
        {'iron-gear-wheel', 10},
        {'advanced-circuit', 10},
        {'fast-loader', 1}
    }

    table.insert(data.raw.technology['logistics'].effects, {type='unlock-recipe', recipe='loader'})
    table.insert(data.raw.technology['logistics-2'].effects, {type='unlock-recipe', recipe='fast-loader'})
    table.insert(data.raw.technology['logistics-3'].effects, {type='unlock-recipe', recipe='express-loader'})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-RECIPE'].value then
    data:extend({{
        type = 'recipe',
        name = 'wood-production',
        energy_required = 10,
        enabled = true,
        icon = '__base__/graphics/icons/wood.png',
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = 'intermediate-product',
        order = 'za',
        ingredients = {{'wood', 10}},
        results = {
            {
                name = 'wood',
                amount_min = 5,
                amount_max = 40
            }
        }
    }})

    data:extend({{
        type = 'recipe',
        name = 'fish-production',
        energy_required = 10,
        enabled = true,
        icon = '__base__/graphics/icons/fish.png',
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = 'intermediate-product',
        order = 'zb',
        ingredients = {{'raw-fish', 10}},
        results = {
            {
                name = 'raw-fish',
                amount_min = 5,
                amount_max = 40
            }
        }
    }})

    for _, v in pairs(data.raw.module) do
        if v.limitation and string.find(v.name, 'productivity', 1, true) then
            table.insert(v.limitation, 'wood-production')
            table.insert(v.limitation, 'fish-production')
        end
    end
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-ENERGY'].value then
    local item = table.deepcopy(data.raw['item']['electric-energy-interface'])
    item.name = 'passive-energy-void'
    item.place_result = 'passive-energy-void'
    item.localised_name = {'name.passive-energy-void'}
    item.localised_description = {'description.passive-energy-void'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])
    entity.name = 'passive-energy-void'
    entity.minable.result = 'passive-energy-void'
    entity.energy_source.usage_priority = 'tertiary'
    entity.energy_source.emissions_per_minute = 0
    entity.energy_source.input_flow_limit = '1TW'
    entity.energy_source.output_flow_limit = '0W'
    entity.energy_production = '0W'
    entity.energy_usage = '1TW'
    entity.gui_mode = 'none'
    entity.se_allow_in_space = true
    entity.localised_name = {'name.passive-energy-void'}
    entity.localised_description = {'description.passive-energy-void'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'passive-energy-void',
        energy_required = 2,
        enabled = false,
        ingredients = {{'accumulator', 1}},
        result = 'passive-energy-void',
        localised_name = {'name.passive-energy-void'},
        localised_description = {'description.passive-energy-void'}
    }})

    table.insert(data.raw.technology['electric-energy-accumulators'].effects, {type='unlock-recipe', recipe='passive-energy-void'})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-LAMP'].value then
    data.raw['lamp']['small-lamp'].darkness_for_all_lamps_on = 0
    data.raw['lamp']['small-lamp'].darkness_for_all_lamps_off = 0
    data.raw['lamp']['small-lamp'].always_on = true
    table.insert(data.raw['lamp']['small-lamp'].signal_to_color_mapping, {type='virtual', name='signal-grey', color={r=128, g=128, b=128}})
    table.insert(data.raw['lamp']['small-lamp'].signal_to_color_mapping, {type='virtual', name='signal-black', color={r=0, g=0, b=0}})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TRAIN'].value then
    local item = table.deepcopy(data.raw['item']['used-up-uranium-fuel-cell'])
    item.name = 'empty-train-battery'
    item.icon = graphics_location .. 'battery.png'
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
        icon = graphics_location .. 'battery.png',
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = 'intermediate-product',
        order = 'zc',
        ingredients = {{'battery', 50}},
        results = {
            {
                name = 'empty-train-battery',
                amount = 1
            }
        },
        localised_name = {'name.empty-train-battery'},
        localised_description = {'description.empty-train-battery'}
    }})

    for _, v in pairs(data.raw.module) do
        if v.limitation and string.find(v.name, 'productivity', 1, true) then
            table.insert(v.limitation, 'empty-train-battery')
        end
    end

    item = table.deepcopy(data.raw['item']['nuclear-fuel'])
    item.name = 'charged-train-battery'
    item.burnt_result = 'empty-train-battery'
    item.fuel_value = '1GJ'
    item.icon = graphics_location .. 'battery.png'
    item.stack_size = 10
    item.localised_name = {'name.charged-train-battery'}
    item.localised_description = {'description.charged-train-battery'}
    data:extend({item})

    data:extend({{
        type = 'recipe',
        name = 'charged-train-battery',
        energy_required = 60,
        enabled = true,
        icon = graphics_location .. 'battery.png',
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = 'intermediate-product',
        ingredients = {{'empty-train-battery', 1}},
        results = {
            {
                name = 'charged-train-battery',
                probability = 0.995,
                amount = 1
            },
            {
                name = 'battery',
                probability = 0.005,
                amount = 5
            }
        },
        localised_name = {'name.charged-train-battery'},
        localised_description = {'description.charged-train-battery'}
    }})

    data.raw['locomotive']['locomotive'].burner.burnt_inventory_size = 1
end

if settings.startup['PHI-MB'].value then
    for i=2, 3 do
        item = table.deepcopy(data.raw['item']['satellite'])
        item.name = 'satellite-' .. i
        item.rocket_launch_product = {type='item', name='space-science-pack', amount=1000 * (2 ^ (i - 1))}
        item.icons = {
            {
                icon = '__base__/graphics/icons/satellite.png',
                tint = items['tint'][i],
                icon_size = 64,
                icon_mipmaps = 4
            }
        }
        item.order = 'm[satellite]-' .. i
        item.localised_name = {'name.satellite'}
        item.localised_description = {'description.satellite'}
        data:extend({item})

        local inn

        if i == 2 then
            inn = 'satellite'

        else
            inn = 'satellite-' .. (i - 1)
        end

        data:extend({{
            type = 'recipe',
            name = 'satellite-' .. i,
            energy_required = 5,
            enabled = false,
            icon = '__base__/graphics/icons/satellite.png',
            icon_size = 64,
            icon_mipmaps = 4,
            category = 'crafting',
            ingredients = {{inn, 2}},
            results = {{name = 'satellite-' .. i, amount = 1}},
            localised_name = {'name.satellite'},
            localised_description = {'description.satellite'}
        }})

        table.insert(data.raw.technology['space-science-pack'].effects, {type='unlock-recipe', recipe='satellite-' .. i})
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-REPAIR'].value then
    data.raw['repair-tool']['repair-pack'].speed = 2 * settings.startup['PHI-MI-REPAIR'].value
    data.raw['repair-tool']['repair-pack'].durability = 300 * settings.startup['PHI-MI-REPAIR'].value
end

if settings.startup['PHI-MI'].value and (tonumber(settings.startup['PHI-MI-LANDFILL'].value) ~= 20) then
    data.raw.recipe['landfill'].ingredients = {{'stone', tonumber(settings.startup['PHI-MI-LANDFILL'].value)}}
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-EFFCY'].value then
    data.raw['module']['effectivity-module'].effect = {consumption = {bonus = -0.5}, pollution = {bonus = -0.1}}
    data.raw['module']['effectivity-module-2'].effect = {consumption = {bonus = -1.0}, pollution = {bonus = -0.15}}
    data.raw['module']['effectivity-module-3'].effect = {consumption = {bonus = -1.5}, pollution = {bonus = -0.2}}
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-NUCLEAR'].value then
    data.raw['reactor']['nuclear-reactor'].scale_energy_usage = true
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-PIPE'].value then
    data.raw['pump']['pump'].fluid_box.height = 4 * settings.startup['PHI-MI-PIPE'].value
    data.raw['pump']['pump'].pumping_speed = 200 * settings.startup['PHI-MI-PIPE'].value
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-ROBOT'].value then
    data.raw['construction-robot']['construction-robot'].speed = 0.06 * settings.startup['PHI-MI-ROBOT'].value
    data.raw['construction-robot']['construction-robot'].max_health = 100 * settings.startup['PHI-MI-ROBOT'].value
    data.raw['construction-robot']['construction-robot'].max_payload_size = settings.startup['PHI-MI-ROBOT'].value
    data.raw['construction-robot']['construction-robot'].max_energy = (1.5 * settings.startup['PHI-MI-ROBOT'].value) .. 'MJ'

    data.raw['logistic-robot']['logistic-robot'].speed = 0.06 * settings.startup['PHI-MI-ROBOT'].value
    data.raw['logistic-robot']['logistic-robot'].max_health = 100 * settings.startup['PHI-MI-ROBOT'].value
    data.raw['logistic-robot']['logistic-robot'].max_payload_size = settings.startup['PHI-MI-ROBOT'].value
    data.raw['logistic-robot']['logistic-robot'].max_energy = (1.5 * settings.startup['PHI-MI-ROBOT'].value) .. 'MJ'

    data.raw['roboport']['roboport'].max_health = 500 * settings.startup['PHI-MI-ROBOT'].value
    data.raw['roboport']['roboport'].energy_usage = 50 * settings.startup['PHI-MI-ROBOT'].value .. 'kW'
    data.raw['roboport']['roboport'].energy_source.input_flow_limit = (10 * settings.startup['PHI-MI-ROBOT'].value) .. 'MW'
    data.raw['roboport']['roboport'].energy_source.buffer_capacity = (200 * settings.startup['PHI-MI-ROBOT'].value) .. 'MJ'
    data.raw['roboport']['roboport'].recharge_minimum = (40 * settings.startup['PHI-MI-ROBOT'].value) .. 'MJ'
    data.raw['roboport']['roboport'].charging_energy = (5 * settings.startup['PHI-MI-ROBOT'].value) .. 'MW'
    data.raw['roboport']['roboport'].material_slots_count = 2
    -- data.raw['roboport']['roboport'].logistics_radius = 25
    -- data.raw['roboport']['roboport'].construction_radius = 55
    data.raw['roboport']['roboport'].charging_offsets = {
        {-1.5, -0.5},
        {1.5, -0.5},
        {1.5, 1.5},
        {-1.5, 1.5},
        {-2.5, -1.5},
        {2.5, -1.5},
        {2.5, 2.5},
        {-2.5, 2.5}
    }
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-PIPE'].value then
    data.raw['locomotive']['locomotive'].max_health = 250 * (3 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['locomotive']['locomotive'].max_speed = 0.3 * (3 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['locomotive']['locomotive'].max_power = 300 * (1 + settings.startup['PHI-MI-TRAIN'].value) .. 'kW'
    data.raw['locomotive']['locomotive'].reversing_power_modifier = 1
    data.raw['locomotive']['locomotive'].energy_per_hit_point = 2.5 * (1 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['locomotive']['locomotive'].braking_force = 1.25 * (7 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['locomotive']['locomotive'].friction_force = 0.50 - (0.05 * settings.startup['PHI-MI-TRAIN'].value)
    data.raw['locomotive']['locomotive'].air_resistance = 0.0075 - (0.0007 * settings.startup['PHI-MI-TRAIN'].value)
    data.raw['locomotive']['locomotive'].burner.effectivity = 0.10 * (9 + settings.startup['PHI-MI-TRAIN'].value)

    data.raw['cargo-wagon']['cargo-wagon'].max_health = 200 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['cargo-wagon']['cargo-wagon'].max_speed = 0.6 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['cargo-wagon']['cargo-wagon'].braking_force = 1 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['cargo-wagon']['cargo-wagon'].friction_force = 0.50 - (0.05 * settings.startup['PHI-MI-TRAIN'].value)
    data.raw['cargo-wagon']['cargo-wagon'].air_resistance = 0.01 - (0.001 * settings.startup['PHI-MI-TRAIN'].value)
    data.raw['cargo-wagon']['cargo-wagon'].inventory_size = 5 * (7 + settings.startup['PHI-MI-TRAIN'].value)

    data.raw['fluid-wagon']['fluid-wagon'].max_health = 200 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['fluid-wagon']['fluid-wagon'].max_speed = 0.6 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['fluid-wagon']['fluid-wagon'].braking_force = 1 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['fluid-wagon']['fluid-wagon'].friction_force = 0.50 - (0.05 * settings.startup['PHI-MI-TRAIN'].value)
    data.raw['fluid-wagon']['fluid-wagon'].air_resistance = 0.01 - (0.001 * settings.startup['PHI-MI-TRAIN'].value)
    data.raw['fluid-wagon']['fluid-wagon'].capacity = 3125 * (7 + settings.startup['PHI-MI-TRAIN'].value)

    data.raw['artillery-wagon']['artillery-wagon'].max_health = 200 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['artillery-wagon']['artillery-wagon'].max_speed = 0.6 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['artillery-wagon']['artillery-wagon'].braking_force = 1 * (2 + settings.startup['PHI-MI-TRAIN'].value)
    data.raw['artillery-wagon']['artillery-wagon'].friction_force = 0.50 - (0.05 * settings.startup['PHI-MI-TRAIN'].value)
    data.raw['artillery-wagon']['artillery-wagon'].air_resistance = 0.015 - (0.0015 * settings.startup['PHI-MI-TRAIN'].value)
    data.raw['artillery-wagon']['artillery-wagon'].turret_rotation_speed = 0.0005 * (1 + settings.startup['PHI-MI-TRAIN'].value)
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-PIPE'].value then
    local item = table.deepcopy(data.raw['item']['boiler'])
    item.name = 'electric-boiler'
    item.place_result = 'electric-boiler'
    item.order = 'b[steam-power]-a[electric-boiler]'
    item.localised_name = {'name.electric-boiler'}
    item.localised_description = {'description.electric-boiler'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['boiler']['boiler'])
    entity.name = 'electric-boiler'
    entity.energy_consumption = '7200kW'
    entity.target_temperature = 165

    entity.minable = {hardness = 0.2, mining_time = 0.5, result = 'electric-boiler'}
    entity.emissions_per_minute = 0
    entity.energy_source.type = 'electric'
    entity.energy_source.fuel_inventory_size = 0
    entity.energy_source.input_priority = 'secondary'
    entity.energy_source.usage_priority = 'secondary-input'
    entity.energy_source.light_flicker.color = {r=0.5, g=1, b=1, a=0.5}
    entity.energy_source.light_flicker.minimum_light_size = 0.1
    entity.energy_source.light_flicker.light_intensity_to_size_coefficient = 1
    entity.fire_flicker_enabled = false
    entity.fire_glow_flicker_enabled = false
    entity.fire = {}
    entity.localised_name = {'name.electric-boiler'}
    entity.localised_description = {'description.electric-boiler'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'electric-boiler',
        energy_required = 2,
        enabled = true,
        ingredients = {{name='boiler', amount=1}, {name='electronic-circuit', amount=1}},
        result = 'electric-boiler',
        localised_name = {'name.electric-boiler'},
        localised_description = {'description.electric-boiler'}
    }})

    -- electric boiler
    data.raw['boiler']['boiler'].fast_replaceable_group = 'boiler'
    data.raw['boiler']['electric-boiler'].fast_replaceable_group = data.raw['boiler']['electric-boiler'].fast_replaceable_group
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-CHEST'].value then
    local chests = {
        'steel-chest',
        'logistic-chest-passive-provider',
        'logistic-chest-active-provider',
        'logistic-chest-storage',
        'logistic-chest-buffer',
        'logistic-chest-requester'
    }

    for i=1, #chests, 1 do
        local item = table.deepcopy(data.raw['item'][chests[i]])
        local entity

        if chests[i] == 'steel-chest' then
            entity = table.deepcopy(data.raw['container'][chests[i]])

        else
            entity = table.deepcopy(data.raw['logistic-container'][chests[i]])
        end

        item.name = 'basic-' .. chests[i]
        item.place_result = 'basic-' .. chests[i]
        item.order = 'b[storage]-h[basic-' .. chests[i] .. ']'
        item.localised_name = {'name.'} .. chests[i]
        item.localised_description = {'description.'} .. chests[i]
        data:extend({item})

        entity.inventory_type = 'with_filters_and_bar'
        entity.inventory_size = 1
        entity.max_logistic_slots = 1
        entity.name = 'basic-' .. chests[i]
        entity.minable.result = 'basic-' .. chests[i]
        entity.localised_name = {'name.'} .. chests[i]
        entity.localised_description = {'description.'} .. chests[i]
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'basic-' .. chests[i],
            energy_required = 2,
            enabled = false,
            ingredients = {{chests[i], 1}},
            result = 'basic-' .. chests[i],
            localised_name = {'name.'} .. chests[i],
            localised_description = {'description.'} .. chests[i]
        }})
    end

    table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='basic-steel-chest'})
    table.insert(data.raw.technology['construction-robotics'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-passive-provider'})
    table.insert(data.raw.technology['construction-robotics'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-storage'})
    table.insert(data.raw.technology['logistic-robotics'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-passive-provider'})
    table.insert(data.raw.technology['logistic-robotics'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-storage'})
    table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-active-provider'})
    table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-buffer'})
    table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-requester'})
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
