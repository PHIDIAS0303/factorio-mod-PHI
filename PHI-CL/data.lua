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

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-BOILER'].value then
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
    entity.buffer_capacity = '14400kJ'
    entity.target_temperature = 165
    entity.emissions_per_minute = 0

    entity.minable = {
        hardness = 0.2,
        mining_time = 0.5,
        result = 'electric-boiler'
    }

    entity.energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input',
        buffer_capacity = '14400kJ',
        light_flicker = {
            color = {r=0.5, g=1, b=1, a=0.5},
            minimum_light_size = 0.1,
            light_intensity_to_size_coefficient = 1
        }
    }

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

    for _, c in pairs(chests) do
        local item = table.deepcopy(data.raw['item'][c])
        local entity

        if c == 'steel-chest' then
            entity = table.deepcopy(data.raw['container'][c])

        else
            entity = table.deepcopy(data.raw['logistic-container'][c])
        end

        item.name = 'basic-' .. c
        item.place_result = 'basic-' .. c
        item.order = 'b[storage]-h[basic-' .. c .. ']'
        item.localised_name = {'name.basic-'.. c}
        item.localised_description = {'description.basic-'.. c}
        data:extend({item})

        entity.inventory_type = 'with_filters_and_bar'
        entity.inventory_size = 1
        entity.max_logistic_slots = 1
        entity.name = 'basic-' .. c
        entity.minable.result = 'basic-' .. c
        entity.localised_name = {'name.basic-'.. c}
        entity.localised_description = {'description.basic-'.. c}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'basic-' .. c,
            energy_required = 2,
            enabled = false,
            ingredients = {{c, 1}},
            results = {{name = 'basic-' .. c, amount = 1}},
            localised_name = {'name.basic-'.. c},
            localised_description = {'description.basic-'.. c}
        }})
    end

    table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='basic-steel-chest'})

    for _, t in pairs({'construction', 'logistic'}) do
        for _, r in pairs({'passive-provider', 'storage'}) do
            table.insert(data.raw.technology[t .. '-robotics'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-' .. r})
        end
    end

    for _, r in pairs({'active-provider', 'buffer', 'requester'}) do
        table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='basic-logistic-chest-' .. r})
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
