local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local graphics_location = '__PHI-MB__/graphics/'

local items = {'assembling-machine', 'electric-furnace', 'chemical-plant', 'oil-refinery', 'centrifuge', 'lab'}

local item_min = {
    ['assembling-machine'] = 4,
    ['electric-furnace'] = 2,
    ['chemical-plant'] = 2,
    ['oil-refinery'] = 2,
    ['centrifuge'] = 2,
    ['lab'] = 2
}

local item_max = {
    ['assembling-machine'] = 5,
    ['electric-furnace'] = 3,
    ['chemical-plant'] = 3,
    ['oil-refinery'] = 3,
    ['centrifuge'] = 3,
    ['lab'] = 3
}

local ups_chests = {
    'steel-chest',
    'logistic-chest-passive-provider',
    'logistic-chest-active-provider',
    'logistic-chest-storage',
    'logistic-chest-buffer',
    'logistic-chest-requester'
}

-- entity
local function EE(source, tier)
    local item

    if source == 'assembling-machine' then
        item = table.deepcopy(data.raw['assembling-machine']['assembling-machine-3'])
    elseif source == 'electric-furnace' then
        item = table.deepcopy(data.raw['furnace']['electric-furnace'])
    elseif source == 'lab' then
        item = table.deepcopy(data.raw['lab']['lab'])
    else
        item = table.deepcopy(data.raw['assembling-machine'][source])
    end
    
    item.name = source .. '-' .. tier
    item.minable.result = source .. '-' .. tier
    item.max_health = item.max_health * (2 ^ (tier - item_min[source] + 1))

    if source == 'lab' then
        item.researching_speed = item.researching_speed * (2 ^ (tier - item_min[source] + 1))
    else
        item.crafting_speed = item.crafting_speed * (2 ^ (tier - item_min[source] + 1))
        item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - item_min[source] + 1))
    end

    item.energy_usage = tonumber(string.match(item.energy_usage, '%d+')) * (2 ^ (tier - item_min[source] + 1)) .. 'kW'
    -- item.animation.layers[1].filename = graphics_location .. source .. '-e.png'
    -- item.animation.layers[1].hr_version.filename = graphics_location .. source ..'-eh.png'
    -- item.icon = graphics_location .. source .. '-i.png'
    -- item.icon_size = 64
    -- item.icon_mipmaps = 4

    if (tier <= item_max[source] - 1) then
        item.next_upgrade = source .. '-' .. (tier + 1)
    end
    
    data:extend({item})
end

-- item
local function EI(source, tier)
    local item

    if source == 'assembling-machine' then
        item = table.deepcopy(data.raw.item['assembling-machine-3'])
    else
        item = table.deepcopy(data.raw.item[source])
    end

    item.name = source .. '-' .. tier
    item.place_result = source .. '-' .. tier
    -- item.icons = {{icon = graphics_location .. source .. '-i.png', icon_mipmaps = 4, icon_size = 64}}
    item.order = item.order .. tier
    data:extend({item})
end

-- recipe
local function ER(source, tier)
    local na = source

    if (tier >= 3) then
        na = na .. '-' .. (tier - 1)
    end

    data:extend({{
        type = 'recipe',
        name = source .. '-' .. tier,
        energy_required = 2,
        enabled = false,
        ingredients = {{na, 2}},
        result = source .. '-' .. tier,
    }})
end

for i=1, #items, 1 do
    for j=item_min[items[i]], item_max[items[i]], 1 do
        EE(items[i], j)
        EI(items[i], j)
        ER(items[i], j)
    end
end

table.insert(data.raw.technology['compound-energy-1'].effects, {type='unlock-recipe', recipe='assembling-machine-4'})
table.insert(data.raw.technology['compound-energy-1'].effects, {type='unlock-recipe', recipe='electric-furnace-2'})
table.insert(data.raw.technology['compound-energy-1'].effects, {type='unlock-recipe', recipe='chemical-plant-2'})
table.insert(data.raw.technology['compound-energy-1'].effects, {type='unlock-recipe', recipe='oil-refinery-2'})
table.insert(data.raw.technology['compound-energy-1'].effects, {type='unlock-recipe', recipe='centrifuge-2'})
table.insert(data.raw.technology['compound-energy-1'].effects, {type='unlock-recipe', recipe='lab-2'})

table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='assembling-machine-5'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='electric-furnace-3'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='chemical-plant-3'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='oil-refinery-3'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='centrifuge-3'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='lab-3'})

data.raw.recipe['loader'].hidden = false
data.raw.recipe['fast-loader'].hidden = false
data.raw.recipe['express-loader'].hidden = false

table.insert(data.raw.technology['logistics'].effects, {type='unlock-recipe', recipe='loader'})
table.insert(data.raw.technology['logistics-2'].effects, {type='unlock-recipe', recipe='fast-loader'})
table.insert(data.raw.technology['logistics-3'].effects, {type='unlock-recipe', recipe='express-loader'})

data.raw['module']['effectivity-module'].effect = {consumption = {bonus = -0.5}, pollution = {bonus = -0.1}}
data.raw['module']['effectivity-module-2'].effect = {consumption = {bonus = -1.0}, pollution = {bonus = -0.15}}
data.raw['module']['effectivity-module-3'].effect = {consumption = {bonus = -1.5}, pollution = {bonus = -0.2}}

data.raw['pipe']['pipe'].fluid_box.height = 4
data.raw['pipe-to-ground']['pipe-to-ground'].fluid_box.height = 4
data.raw['offshore-pump']['offshore-pump'].pumping_speed = 80
data.raw['offshore-pump']['offshore-pump'].flags = {'placeable-neutral', 'player-creation'}
data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_mask = nil
data.raw['offshore-pump']['offshore-pump'].placeable_position_visualization = nil
data.raw['storage-tank']['storage-tank'].fluid_box.base_area = 1000

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
data.raw['fluid-wagon']['fluid-wagon'].capacity = 100000
data.raw['fluid-wagon']['fluid-wagon'].max_speed = 3.5
data.raw['fluid-wagon']['fluid-wagon'].braking_force = 5
data.raw['fluid-wagon']['fluid-wagon'].friction_force = 0.25
data.raw['fluid-wagon']['fluid-wagon'].air_resistance = 0.005

data.raw['construction-robot']['construction-robot'].max_health = 400
data.raw['construction-robot']['construction-robot'].max_payload_size = 3
data.raw['construction-robot']['construction-robot'].max_energy = '6MJ'
data.raw['construction-robot']['construction-robot'].speed = 0.12
data.raw['construction-robot']['construction-robot'].speed_multiplier_when_out_of_energy = 0.4
data.raw['construction-robot']['construction-robot'].energy_per_move = '10kJ'

data.raw['logistic-robot']['logistic-robot'].max_health = 400
data.raw['logistic-robot']['logistic-robot'].max_payload_size = 3
data.raw['logistic-robot']['logistic-robot'].max_energy = '6MJ'
data.raw['logistic-robot']['logistic-robot'].speed = 0.12
data.raw['logistic-robot']['logistic-robot'].speed_multiplier_when_out_of_energy = 0.4
data.raw['logistic-robot']['logistic-robot'].energy_per_move = '10kJ'

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

local item = table.deepcopy(data.raw['item']['boiler'])
item.name = 'electric-boiler'
item.place_result = 'electric-boiler'
item.order = 'b[steam-power]-b[electric-boiler]'
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
data:extend({entity})

data:extend({{
    type = 'recipe',
    name = 'electric-boiler',
    energy_required = 2,
    enabled = true,
    ingredients = {{'boiler', 1}, {'electronic-circuit', 1}},
    result = 'electric-boiler',
}})

for i=1, #ups_chests, 1 do
    local item = table.deepcopy(data.raw['item'][ups_chests[i]])
    local entity

    if ups_chests[i] == 'steel-chest' then
        entity = table.deepcopy(data.raw['container'][ups_chests[i]])
    else
        entity = table.deepcopy(data.raw['logistic-container'][ups_chests[i]])
    end

    item.name = 'ups-' .. ups_chests[i]
    item.place_result = 'ups-' .. ups_chests[i]
    item.order = item.order .. '-ups'
    data:extend({item})

    entity.inventory_size = 1
    entity.name = 'ups-' .. ups_chests[i]
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'ups-' .. ups_chests[i],
        energy_required = 2,
        enabled = false,
        ingredients = {{'steel-plate', 8}},
        result = 'ups-' .. ups_chests[i],
    }})
end

table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='ups-steel-chest'})
table.insert(data.raw.technology['construction-robotics'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-passive-provider'})
table.insert(data.raw.technology['construction-robotics'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-storage'})
table.insert(data.raw.technology['logistic-robotics'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-passive-provider'})
table.insert(data.raw.technology['logistic-robotics'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-storage'})
table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-active-provider'})
table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-buffer'})
table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-requester'})
