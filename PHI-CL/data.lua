local items = require 'config'
local main = require 'main'
local file_stage = 1

if settings.startup['PHI-MI'].value then
    data.raw['arithmetic-combinator']['arithmetic-combinator'].energy_source.usage_priority = 'primary-input'
    data.raw['decider-combinator']['decider-combinator'].energy_source.usage_priority = 'primary-input'
    --data.raw['repair-tool']['repair-pack'].speed = 4
    --data.raw['repair-tool']['repair-pack'].durability = 600

    if settings.startup['PHI-MI-LOADER'].value then
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

    data.raw.recipe['landfill'].ingredients = {{'stone', tonumber(settings.startup['PHI-MI-LANDFILL'].value)}}

    if settings.startup['PHI-MI-EFFCY'].value then
        data.raw['module']['effectivity-module'].effect = {consumption = {bonus = -0.5}, pollution = {bonus = -0.1}}
        data.raw['module']['effectivity-module-2'].effect = {consumption = {bonus = -1.0}, pollution = {bonus = -0.15}}
        data.raw['module']['effectivity-module-3'].effect = {consumption = {bonus = -1.5}, pollution = {bonus = -0.2}}
    end

    if settings.startup['PHI-MI-NUCLEAR'].value then
        data.raw['reactor']['nuclear-reactor'].scale_energy_usage = true
    end

    --[[
    data.raw['pipe']['pipe'].fluid_box.height = 4
    data.raw['pipe-to-ground']['pipe-to-ground'].fluid_box.height = 4
    data.raw['pipe-to-ground']['pipe-to-ground'].fluid_box.pipe_connections = {{position = {0, -1}}, {position = {0, 1}, max_underground_distance = 20}}
    data.raw['pump']['pump'].fluid_box.height = 16
    data.raw['pump']['pump'].pumping_speed = 800
    -- data.raw['storage-tank']['storage-tank'].fluid_box.base_area = 500
    data.raw['storage-tank']['storage-tank'].fluid_box.height = 2

    data.raw['locomotive']['locomotive'].max_health = 2000
    data.raw['locomotive']['locomotive'].max_speed = 2
    data.raw['locomotive']['locomotive'].max_power = '1200kW'
    data.raw['locomotive']['locomotive'].reversing_power_modifier = 1
    data.raw['locomotive']['locomotive'].braking_force = 20
    data.raw['locomotive']['locomotive'].friction_force = 0.25
    data.raw['locomotive']['locomotive'].air_resistance = 0.004
    data.raw['locomotive']['locomotive'].burner.effectivity = 2
    data.raw['locomotive']['locomotive'].burner.fuel_inventory_size = 3
    data.raw['cargo-wagon']['cargo-wagon'].max_health = 1000
    data.raw['cargo-wagon']['cargo-wagon'].inventory_size = 80
    data.raw['cargo-wagon']['cargo-wagon'].max_speed = 3.5
    data.raw['cargo-wagon']['cargo-wagon'].braking_force = 5
    data.raw['cargo-wagon']['cargo-wagon'].friction_force = 0.25
    data.raw['cargo-wagon']['cargo-wagon'].air_resistance = 0.005
    data.raw['fluid-wagon']['fluid-wagon'].max_health = 1000
    data.raw['fluid-wagon']['fluid-wagon'].capacity = 50000
    data.raw['fluid-wagon']['fluid-wagon'].max_speed = 3.5
    data.raw['fluid-wagon']['fluid-wagon'].braking_force = 5
    data.raw['fluid-wagon']['fluid-wagon'].friction_force = 0.25
    data.raw['fluid-wagon']['fluid-wagon'].air_resistance = 0.005

    data.raw['construction-robot']['construction-robot'].max_health = 600
    data.raw['construction-robot']['construction-robot'].max_payload_size = 3
    data.raw['construction-robot']['construction-robot'].max_energy = '6MJ'
    data.raw['construction-robot']['construction-robot'].speed = 0.12
    data.raw['construction-robot']['construction-robot'].speed_multiplier_when_out_of_energy = 0.4
    data.raw['construction-robot']['construction-robot'].energy_per_move = '1kJ'

    data.raw['logistic-robot']['logistic-robot'].max_health = 600
    data.raw['logistic-robot']['logistic-robot'].max_payload_size = 3
    data.raw['logistic-robot']['logistic-robot'].max_energy = '6MJ'
    data.raw['logistic-robot']['logistic-robot'].speed = 0.12
    data.raw['logistic-robot']['logistic-robot'].speed_multiplier_when_out_of_energy = 0.4
    data.raw['logistic-robot']['logistic-robot'].energy_per_move = '1kJ'

    data.raw['roboport']['roboport'].max_health = 1000
    data.raw['roboport']['roboport'].energy_usage = '100kW'
    data.raw['roboport']['roboport'].energy_source.input_flow_limit = '40MW'
    data.raw['roboport']['roboport'].energy_source.buffer_capacity = '200MJ'
    data.raw['roboport']['roboport'].recharge_minimum = '40MJ'
    data.raw['roboport']['roboport'].charging_energy = '4000kW'
    data.raw['roboport']['roboport'].robot_slots_count = 10
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
    ]]

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
        entity.fluid_box.height = 4
        entity.output_fluid_box.height = 4
        entity.output_fluid_box.base_level = 5
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
            ingredients = {{'boiler', 1}, {'electronic-circuit', 1}},
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

            data:extend({{
                type = 'recipe',
                name = 'basic-' .. chests[i] .. '-return',
                energy_required = 2,
                enabled = false,
                ingredients = {{'basic-' .. chests[i], 1}},
                result = chests[i],
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
        if items[v.effect[k2]] ~= nil then
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
