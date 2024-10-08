local items = require 'config'
local main = require 'main'
local file_stage = 2

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
if settings.startup['PHI-EN'].value and settings.startup['PHI-EN-NUCLEAR-TIER'].value > 1 then
    data.raw['fluid']['steam'].max_temperature = 5000
end

if settings.startup['PHI-MB'].value then
    for i=2, 3 do
        item = table.deepcopy(data.raw['item']['satellite'])
        item.name = 'satellite-' .. i

        if mods['space-exploration'] then
            item.rocket_launch_product = {'se-satellite-telemetry', 100 * (2 ^ (i - 1))}

        else
            item.rocket_launch_product[2] = item.rocket_launch_product[2] * (2 ^ (i - 1))
        end

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
    for _, v in pairs(data.raw['repair-tool']) do
        v.speed = v.speed * settings.startup['PHI-MI-REPAIR'].value
        v.durability = v.durability * settings.startup['PHI-MI-REPAIR'].value
    end
end

if settings.startup['PHI-MI'].value and (tonumber(settings.startup['PHI-MI-LANDFILL'].value) ~= 20) then
    data.raw.recipe['landfill'].ingredients = {
        {'stone', tonumber(settings.startup['PHI-MI-LANDFILL'].value)}
    }
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
    local s = (1 + settings.startup['PHI-MI-PIPE'].value) / 2

    for _, t in pairs({data.raw['pipe'], data.raw['pipe-to-ground']}) do
        for _, v in pairs(t) do
            if v.fluid_box.height then
                v.fluid_box.height = v.fluid_box.height * s

            else
                v.fluid_box.height = s
            end
        end
    end

    for _, v in pairs(data.raw['pump']) do
        if v.fluid_box.height then
            v.fluid_box.height = v.fluid_box.height * s

        else
            v.fluid_box.height = s
        end

        v.pumping_speed = v.pumping_speed * s
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-ROBOT'].value then
    local s = (1 + settings.startup['PHI-MI-ROBOT'].value) / 2
    local sn = (17 - settings.startup['PHI-MI-ROBOT'].value) / 16

    for _, t in pairs({data.raw['construction-robot'], data.raw['logistic-robot']}) do
        for _, v in pairs(t) do
            v.speed = v.speed * s
            v.energy_per_tick = tostring(tonumber(string.match(v.energy_per_tick, '[%d%.]+')) * sn) .. string.match(v.energy_per_tick, '%a+')
            v.energy_per_move = tostring(tonumber(string.match(v.energy_per_move, '[%d%.]+')) * sn) .. string.match(v.energy_per_move, '%a+')
        end
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-TRAIN'].value then
    local s = (7 + settings.startup['PHI-MI-TRAIN'].value) / 8

    for _, t in pairs({data.raw['locomotive'], data.raw['cargo-wagon'], data.raw['fluid-wagon'], data.raw['artillery-wagon']}) do
        for _, v in pairs(t) do
            v.max_health = v.max_health * s
            v.max_speed = v.max_speed * s
            v.braking_force = v.braking_force * s

            if v.max_power then
                v.max_power = tostring(tonumber(string.match(v.max_power, '[%d%.]+')) * s) .. string.match(v.max_power, '%a+')
                v.reversing_power_modifier = 1
            end
        end
    end
end

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

if settings.startup['PHI-EQ'].value and settings.startup['PHI-EQ-ARMOR'].value then
    data:extend({
        {
            type = 'equipment-grid',
            name = 'equipment-grid-14x14',
            width = 14,
            height = 14,
            equipment_categories = {'armor'}
        },
        {
            type = 'armor',
            name = 'power-armor-mk3',
            icons = {
                {
                    icon = '__base__/graphics/icons/power-armor-mk2.png',
                    tint = items['tint'][2],
                    icon_size = 64,
                    icon_mipmaps = 4
                }
            },
            resistances = {
                {
                    type = 'physical',
                    decrease = 20,
                    percent = 50
                },
                {
                    type = 'acid',
                    decrease = 20,
                    percent = 80
                },
                {
                    type = 'explosion',
                    decrease = 70,
                    percent = 60
                },
                {
                    type = 'fire',
                    decrease = 20,
                    percent = 80
                },
                {
                    type = 'laser',
                    decrease = 20,
                    percent = 50
                },
                {
                    type = 'electric',
                    decrease = 20,
                    percent = 50
                },
                {
                    type = 'impact',
                    decrease = 20,
                    percent = 50
                },
                {
                    type = 'poison',
                    decrease = 20,
                    percent = 50
                }
            },
            subgroup = 'armor',
            order = 'eb[power-armor-mk3]',
            stack_size = 1,
            infinite = true,
            equipment_grid = 'equipment-grid-14x14',
            inventory_size_bonus = 40,
            open_sound = {filename =  '__base__/sound/armor-open.ogg', volume = 1},
            close_sound = {filename = '__base__/sound/armor-close.ogg', volume = 1},
            localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, 3},
            localised_description = {'description.power-armor-mk2'}
        }
    })

    data:extend({{
        type = 'recipe',
        name = 'power-armor-mk3',
        energy_required = 2,
        enabled = false,
        ingredients = {{name='power-armor-mk2', amount=2}},
        result = 'power-armor-mk3',
        localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, 3},
        localised_description = {'description.power-armor-mk2'}
    }})

    for _, animation in ipairs(data.raw['character']['character']['animations']) do
        if animation.armors then
            for _, armor in ipairs(animation.armors) do
                if armor == 'power-armor-mk2' then
                    animation.armors[#animation.armors + 1] = 'power-armor-mk3'
                    break
                end
            end
        end
    end

    table.insert(data.raw.technology['power-armor-mk2'].effects, {type='unlock-recipe', recipe='power-armor-mk3'})
end

if settings.startup['PHI-RS'].value then
    local other_recipe_name = {
        ['basic-oil-processing'] = true,
        ['advanced-oil-processing'] = true,
        ['light-oil-cracking'] = true,
        ['heavy-oil-cracking'] = true,
        ['uranium-processing'] = true,
        ['kovarex-enrichment-process'] = true,
        ['nuclear-fuel-reprocessing'] = true,
        ['coal-liquefaction'] = true
    }

    local item = table.deepcopy(data.raw.item['electric-furnace'])
    item.name = 'electric-filter-furnace'
    item.place_result = 'electric-filter-furnace'
    item.order = item.order .. '2'
    item.localised_name = {'name.electric-filter-furnace'}
    item.localised_description = {'description.electric-filter-furnace'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['furnace']['electric-furnace'])
    entity.name = 'electric-filter-furnace'
    entity.minable.result = 'electric-filter-furnace'
    entity.type = 'assembling-machine'
    entity.localised_name = {'name.electric-filter-furnace'}
    entity.localised_description = {'description.electric-filter-furnace'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'electric-filter-furnace',
        energy_required = 2,
        enabled = false,
        ingredients = {{name='electric-furnace', amount=1}},
        result = 'electric-filter-furnace',
        localised_name = {'name.electric-filter-furnace'},
        localised_description = {'description.electric-filter-furnace'}
    }})

    table.insert(data.raw.technology[items['item']['electric-filter-furnace'].tech].effects, {type='unlock-recipe', recipe='electric-filter-furnace'})
    data.raw['furnace']['electric-furnace'].fast_replaceable_group = 'electric-furnace'
    data.raw['assembling-machine']['electric-filter-furnace'].fast_replaceable_group = data.raw['furnace']['electric-furnace'].fast_replaceable_group
    data.raw['assembling-machine']['electric-filter-furnace'].crafting_categories = data.raw['furnace']['electric-furnace'].crafting_categories

    if settings.startup['PHI-RS-RECIPE-DROF'].value == 1 then
        data.raw['utility-constants'].default.dynamic_recipe_overload_factor = 1.17

    else
        data.raw['utility-constants'].default.dynamic_recipe_overload_factor = settings.startup['PHI-RS-RECIPE-DROF'].value
    end

    data.raw['utility-constants'].default.minimum_recipe_overload_multiplier = settings.startup['PHI-RS-RECIPE-MINROM'].value
    data.raw['utility-constants'].default.maximum_recipe_overload_multiplier = settings.startup['PHI-RS-RECIPE-MAXROM'].value

    if settings.startup['PHI-RS-MODULE'].value then
        items['recipe']['speed-module'].enabled = true
        items['recipe']['speed-module-2'].enabled = true
        items['recipe']['speed-module-3'].enabled = true
        items['recipe']['productivity-module'].enabled = true
        items['recipe']['productivity-module-2'].enabled = true
        items['recipe']['productivity-module-3'].enabled = true
        items['recipe']['effectivity-module'].enabled = true
        items['recipe']['effectivity-module-2'].enabled = true
        items['recipe']['effectivity-module-3'].enabled = true
    end

    local recipe_multiplier = {}

    if settings.startup['PHI-RS-RECIPE-1'].value > 1 then
        table.insert(recipe_multiplier, settings.startup['PHI-RS-RECIPE-1'].value)
    end

    if settings.startup['PHI-RS-RECIPE-2'].value > 1 then
        if settings.startup['PHI-RS-RECIPE-1'].value ~= settings.startup['PHI-RS-RECIPE-2'].value then
            table.insert(recipe_multiplier, settings.startup['PHI-RS-RECIPE-2'].value)
        end
    end

    if #recipe_multiplier > 0 then
        local prod_module_list = {}

        for k, v in pairs(data.raw.module) do
            if v.limitation and string.find(v.name, 'productivity', 1, true) then
                table.insert(prod_module_list, k)
            end
        end

        for k, v in pairs(items['recipe']) do
            if v.enabled and data.raw.recipe[k] then
                for j=1, #recipe_multiplier, 1 do
                    item = table.deepcopy(data.raw.recipe[k])
                    item.enabled = false
                    item.name = k .. '-s' .. j

                    if other_recipe_name[k] then
                        item.localised_name = {'phi-cl.combine', {'name.' .. k}, j}
                        item.localised_description = {'description.' .. k}
                    end

                    if item.normal then
                        item.normal.hide_from_player_crafting = true

                        if item.normal.ingredients then
                            for ik, iv in pairs(item.normal.ingredients) do
                                if iv[1] and iv[2] then
                                    item.normal.ingredients[ik][2] = iv[2] * recipe_multiplier[j]

                                else
                                    item.normal.ingredients[ik].amount = iv.amount * recipe_multiplier[j]
                                end
                            end
                        end

                        if item.normal.results then
                            for rk, rv in pairs(item.normal.results) do
                                if rv[1] and rv[2] then
                                    item.normal.results[rk][2] = rv[2] * recipe_multiplier[j]

                                else
                                    item.normal.results[rk].amount = rv.amount * recipe_multiplier[j]
                                end
                            end

                        else
                            if item.normal.result_count then
                                item.normal.result_count = item.normal.result_count * recipe_multiplier[j]

                            else
                                item.normal.result_count = recipe_multiplier[j]
                            end
                        end

                        if item.normal.energy_required then
                            item.normal.energy_required = item.normal.energy_required * recipe_multiplier[j]

                        else
                            item.normal.energy_required = recipe_multiplier[j]
                        end

                    else
                        item.hide_from_player_crafting = true

                        if item.energy_required then
                            item.energy_required = item.energy_required * recipe_multiplier[j]

                        else
                            item.energy_required = recipe_multiplier[j]
                        end
                    end

                    if item.expensive then
                        item.expensive.hide_from_player_crafting = true

                        if item.expensive.ingredients then
                            for ik, iv in pairs(item.expensive.ingredients) do
                                if iv[1] and iv[2] then
                                    item.expensive.ingredients[ik][2] = iv[2] * recipe_multiplier[j]

                                else
                                    item.expensive.ingredients[ik].amount = iv.amount * recipe_multiplier[j]
                                end
                            end
                        end

                        if item.expensive.results then
                            for rk, rv in pairs(item.expensive.results) do
                                if rv[1] and rv[2] then
                                    item.expensive.results[rk][2] = rv[2] * recipe_multiplier[j]

                                else
                                    item.expensive.results[rk].amount = rv.amount * recipe_multiplier[j]
                                end
                            end

                        else
                            if item.expensive.result_count then
                                item.expensive.result_count = item.expensive.result_count * recipe_multiplier[j]

                            else
                                item.expensive.result_count = recipe_multiplier[j]
                            end
                        end

                        if item.expensive.energy_required then
                            item.expensive.energy_required = item.expensive.energy_required * recipe_multiplier[j]

                        else
                            item.expensive.energy_required = recipe_multiplier[j]
                        end
                    end

                    if item.ingredients then
                        for ik, iv in pairs(item.ingredients) do
                            if iv[1] and iv[2] then
                                item.ingredients[ik][2] = iv[2] * recipe_multiplier[j]

                            else
                                item.ingredients[ik].amount = iv.amount * recipe_multiplier[j]
                            end
                        end
                    end

                    if item.results then
                        for rk, rv in pairs(item.results) do
                            if rv[1] and rv[2] then
                                item.results[rk][2] = rv[2] * recipe_multiplier[j]

                            else
                                item.results[rk].amount = rv.amount * recipe_multiplier[j]
                            end
                        end

                    else
                        if item.result_count then
                            item.result_count = item.result_count * recipe_multiplier[j]

                        else
                            item.result_count = recipe_multiplier[j]
                        end
                    end

                    data:extend({item})
                    table.insert(data.raw.technology[v.tech].effects, {type='unlock-recipe', recipe=item.name})

                    for l=1, #prod_module_list, 1 do
                        table.insert(data.raw.module[prod_module_list[l]].limitation, item.name)
                    end
                end
            end
        end
    end
end

if settings.startup['PHI-XW-WATER'].value > 0 then
    local ocfs = 'offshore-pump'

    data.raw[ocfs][ocfs].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
    data.raw[ocfs][ocfs].flags = {'placeable-neutral', 'player-creation'}
    data.raw[ocfs][ocfs].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
    data.raw[ocfs][ocfs].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
    data.raw[ocfs][ocfs].adjacent_tile_collision_mask = nil
    data.raw[ocfs][ocfs].placeable_position_visualization = nil
    data.raw[ocfs][ocfs].se_allow_in_space = true

    if mods['angelsrefining'] then
        local ofs = 'seafloor-pump'

        data.raw[ocfs][ofs].pumping_speed = settings.startup['PHI-XW-WATER'].value * 2
        data.raw[ocfs][ofs].flags = {'placeable-neutral', 'player-creation', 'filter-directions'}
        data.raw[ocfs][ofs].adjacent_tile_collision_box = {{-2, -3}, {2, -2}}
        data.raw[ocfs][ofs].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
        data.raw[ocfs][ofs].adjacent_tile_collision_mask = nil
        data.raw[ocfs][ofs].placeable_position_visualization = nil
    end

    if mods['exotic-industries'] then
        local ofs = 'ei_gaia-pump'

        data.raw[ocfs][ofs].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
        data.raw[ocfs][ofs].flags = {'placeable-neutral', 'player-creation'}
        data.raw[ocfs][ofs].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
        data.raw[ocfs][ofs].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
        data.raw[ocfs][ofs].adjacent_tile_collision_mask = nil
        data.raw[ocfs][ofs].placeable_position_visualization = nil
    end
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
