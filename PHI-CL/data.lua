local items = require 'config'
local main = require 'main'
local file_stage = 1

if settings.startup['PHI-CT'].value then
    if settings.startup['PHI-CT-RECIPE'].value then
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
                    probability = 0.5,
                    amount = 10
                },
                {
                    name = 'wood',
                    probability = 0.5,
                    amount = 10
                },
                {
                    name = 'wood',
                    probability = 0.5,
                    amount = 10
                },
                {
                    name = 'wood',
                    probability = 0.5,
                    amount = 10
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
                    probability = 0.5,
                    amount = 10
                },
                {
                    name = 'raw-fish',
                    probability = 0.5,
                    amount = 10
                },
                {
                    name = 'raw-fish',
                    probability = 0.5,
                    amount = 10
                },
                {
                    name = 'raw-fish',
                    probability = 0.5,
                    amount = 10
                }
            }
        }})

        for k, v in pairs(data.raw.module) do
            if v.limitation and string.find(v.name, 'productivity', 1, true) then
                table.insert(v.limitation, 'wood-production')
                table.insert(v.limitation, 'fish-production')
            end
        end
    end
end

if settings.startup['PHI-MI'].value then
    data.raw['arithmetic-combinator']['arithmetic-combinator'].energy_source.usage_priority = 'primary-input'
    data.raw['decider-combinator']['decider-combinator'].energy_source.usage_priority = 'primary-input'

    if settings.startup['PHI-MI-REPAIR'].value then
        data.raw['repair-tool']['repair-pack'].speed = 2 * settings.startup['PHI-MI-REPAIR'].value
        data.raw['repair-tool']['repair-pack'].durability = 300 * settings.startup['PHI-MI-REPAIR'].value
    end

    data.raw.recipe['landfill'].ingredients = {{'stone', tonumber(settings.startup['PHI-MI-LANDFILL'].value)}}

    if settings.startup['PHI-MI-EFFCY'].value then
        data.raw['module']['effectivity-module'].effect = {consumption = {bonus = -0.5}, pollution = {bonus = -0.1}}
        data.raw['module']['effectivity-module-2'].effect = {consumption = {bonus = -1.0}, pollution = {bonus = -0.15}}
        data.raw['module']['effectivity-module-3'].effect = {consumption = {bonus = -1.5}, pollution = {bonus = -0.2}}
    end

    if settings.startup['PHI-MI-NUCLEAR'].value then
        data.raw['reactor']['nuclear-reactor'].scale_energy_usage = true
    end

    if settings.startup['PHI-MI-PIPE'].value then
        data.raw['pipe']['pipe'].fluid_box.height = settings.startup['PHI-MI-PIPE'].value
        data.raw['pipe-to-ground']['pipe-to-ground'].fluid_box.height = settings.startup['PHI-MI-PIPE'].value
        data.raw['pipe-to-ground']['pipe-to-ground'].fluid_box.pipe_connections = {{position = {0, -1}}, {position = {0, 1}, max_underground_distance = 10}}
        data.raw['pump']['pump'].fluid_box.height = 4 * settings.startup['PHI-MI-PIPE'].value
        data.raw['pump']['pump'].pumping_speed = 200 * settings.startup['PHI-MI-PIPE'].value
        data.raw['storage-tank']['storage-tank'].fluid_box.height = settings.startup['PHI-MI-PIPE'].value
    end

    if settings.startup['PHI-MI-ROBOT'].value then
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
        data.raw['roboport']['roboport'].recharge_minimum = (80 * settings.startup['PHI-MI-ROBOT'].value) .. 'MJ'
        data.raw['roboport']['roboport'].charging_energy = (5 * settings.startup['PHI-MI-ROBOT'].value) .. 'MW'
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

    if settings.startup['PHI-MI-TRAIN'].value then
        data.raw['locomotive']['locomotive'].max_health = 500 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['locomotive']['locomotive'].max_speed = 0.6 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['locomotive']['locomotive'].max_power = (600 * settings.startup['PHI-MI-TRAIN'].value) .. 'kW'
        data.raw['locomotive']['locomotive'].reversing_power_modifier = 1
        data.raw['locomotive']['locomotive'].energy_per_hit_point = 4 + settings.startup['PHI-MI-TRAIN'].value
        data.raw['locomotive']['locomotive'].braking_force = 5 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['locomotive']['locomotive'].friction_force = 0.50 - (0.05 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['locomotive']['locomotive'].air_resistance = 0.0075 - (0.0007 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['locomotive']['locomotive'].burner.effectivity = 0.5 + (0.5 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['locomotive']['locomotive'].burner.fuel_inventory_size = 3

        data.raw['cargo-wagon']['cargo-wagon'].max_health = 300 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['cargo-wagon']['cargo-wagon'].max_speed = 0.6 * (2 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['cargo-wagon']['cargo-wagon'].braking_force = 1.5 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['cargo-wagon']['cargo-wagon'].friction_force = 0.50 - (0.05 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['cargo-wagon']['cargo-wagon'].air_resistance = 0.01 - (0.001 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['cargo-wagon']['cargo-wagon'].inventory_size = 5 * (7 + settings.startup['PHI-MI-TRAIN'].value)

        data.raw['fluid-wagon']['fluid-wagon'].max_health = 300 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['fluid-wagon']['fluid-wagon'].max_speed = 0.6 * (2 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['fluid-wagon']['fluid-wagon'].braking_force = 1.5 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['fluid-wagon']['fluid-wagon'].friction_force = 0.50 - (0.05 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['fluid-wagon']['fluid-wagon'].air_resistance = 0.01 - (0.001 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['fluid-wagon']['fluid-wagon'].capacity = 3125 * (7 + settings.startup['PHI-MI-TRAIN'].value)

        data.raw['artillery-wagon']['artillery-wagon'].max_health = 300 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['artillery-wagon']['artillery-wagon'].max_speed = 0.6 * (2 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['artillery-wagon']['artillery-wagon'].braking_force = 1.5 * (1 + settings.startup['PHI-MI-TRAIN'].value)
        data.raw['artillery-wagon']['artillery-wagon'].friction_force = 0.50 - (0.05 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['artillery-wagon']['artillery-wagon'].air_resistance = 0.015 - (0.0015 * settings.startup['PHI-MI-TRAIN'].value)
        data.raw['artillery-wagon']['artillery-wagon'].turret_rotation_speed = 0.0005 * (1 + settings.startup['PHI-MI-TRAIN'].value)
    end

    if settings.startup['PHI-MI-BOILER'].value then
        local item = table.deepcopy(data.raw['item']['boiler'])
        item.name = 'electric-boiler'
        item.place_result = 'electric-boiler'
        item.order = 'b[steam-power]-a[electric-boiler]'
        data:extend({item})

        local entity = table.deepcopy(data.raw['boiler']['boiler'])
        entity.name = 'electric-boiler'
        entity.energy_consumption = '7200kW'
        entity.target_temperature = 165

        if settings.startup['PHI-MI-PIPE'].value then
            entity.fluid_box.height = settings.startup['PHI-MI-PIPE'].value
            entity.output_fluid_box.height = settings.startup['PHI-MI-PIPE'].value
            entity.output_fluid_box.base_level = entity.output_fluid_box.base_level + settings.startup['PHI-MI-PIPE'].value
        end

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
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'electric-boiler',
            energy_required = 2,
            enabled = true,
            ingredients = {{name='boiler', amount=1}, {name='electronic-circuit', amount=1}},
            result = 'electric-boiler',
        }})

        -- electric boiler
        data.raw['boiler']['boiler'].fast_replaceable_group = 'boiler'
        data.raw['boiler']['electric-boiler'].fast_replaceable_group = data.raw['boiler']['electric-boiler'].fast_replaceable_group
    end

    if settings.startup['PHI-MI-CHEST'].value then
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
            item.order = 'b[storage]-d[basic-' .. item.order .. ']'
            data:extend({item})

            entity.inventory_type = 'with_filters_and_bar'
            entity.inventory_size = 1
            entity.name = 'basic-' .. chests[i]
            entity.minable.result = 'basic-' .. chests[i]
            data:extend({entity})

            data:extend({{
                type = 'recipe',
                name = 'basic-' .. chests[i],
                energy_required = 2,
                enabled = false,
                ingredients = {{chests[i], 1}},
                result = 'basic-' .. chests[i],
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
end

for k, v in pairs(items['setting']) do
    for k2=1, #v.effect do
        if items[v.effect[k2]] then
            if settings.startup[k].value < items[v.effect[k2]].min then
                items[v.effect[k2]].enabled = false
            end

            items[v.effect[k2]][v.type] = settings.startup[k].value
        end
    end
end

for _, v in pairs(items['item']) do
    if v.enabled then
        if v.stage == file_stage then
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
end

for _, v in pairs(items['equipment']) do
    if v.enabled then
        if v.stage == file_stage then
            v.category = 'equipment'

            for j=v.min, v.max, 1 do
                main.EEQ(v, j)
                main.EI(v, j)
                main.ER(v, j)
                main.ET(v, j)
            end
        end
    end
end
