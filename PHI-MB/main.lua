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
        energy_required = 5,
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

data.raw['module']['effectivity-module'].effect = {consumption = {bonus = -0.8}, pollution = {bonus = -0.1}}
data.raw['module']['effectivity-module-2'].effect = {consumption = {bonus = -1.6}, pollution = {bonus = -0.15}}
data.raw['module']['effectivity-module-3'].effect = {consumption = {bonus = -2.4}, pollution = {bonus = -0.2}}

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
data.raw['roboport']['roboport'].energy_source.input_flow_limit = '80MW'
data.raw['roboport']['roboport'].energy_source.buffer_capacity = '200MJ'
data.raw['roboport']['roboport'].recharge_minimum = '40MJ'
data.raw['roboport']['roboport'].charging_energy = '8000kW'
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

local boiler_item = table.deepcopy(data.raw['item']['boiler'])
boiler_item.name = 'electric-boiler'
boiler_item.place_result = 'electric-boiler'
boiler_item.order = 'b[steam-power]-b[electric-boiler]'

local boiler_entity = table.deepcopy(data.raw['boiler']['boiler'])
boiler_entity.name = 'electric-boiler'
boiler_entity.energy_consumption = '7200kW'
boiler_entity.target_temperature = 165
boiler_entity.minable = {hardness = 0.2, mining_time = 0.5, result = 'electric-boiler'}
boiler_entity.emissions_per_minute = 0
boiler_entity.energy_source.type = 'electric'
boiler_entity.energy_source.fuel_inventory_size = 0
boiler_entity.energy_source.input_priority = 'secondary'
boiler_entity.energy_source.usage_priority = 'secondary-input'
boiler_entity.energy_source.light_flicker.color = {r=0.5, g=1, b=1, a=0.5}
boiler_entity.energy_source.light_flicker.minimum_light_size = 0.1
boiler_entity.energy_source.light_flicker.light_intensity_to_size_coefficient = 1
boiler_entity.fire_flicker_enabled = false
boiler_entity.fire_glow_flicker_enabled = false
boiler_entity.fire = {}

data:extend({{
    type = 'recipe',
    name = 'electric-boiler',
    energy_required = 2,
    enabled = true,
    ingredients = {{'boiler', 1}, {'electronic-circuit', 1}},
    result = 'electric-boiler',
}}, {boiler_item}, {boiler_entity})

for i=1, #ups_chests, 1 do
    local chest_item
    local chest_entity

    if ups_chests[i] == 'steel-chest' then
        chest_item = table.deepcopy(data.raw['item'][ups_chests[i]])
        chest_entity = table.deepcopy(data.raw['container'][ups_chests[i]])
    else
        chest_item = table.deepcopy(data.raw['item'][ups_chests[i]])
        chest_entity = table.deepcopy(data.raw['logistic-container'][ups_chests[i]])
    end

    chest_item.name = 'ups-' .. ups_chests[i]
    chest_item.place_result = 'ups-' .. ups_chests[i]
    chest_item.order = chest_item.order .. '-ups'

    chest_entity.inventory_size = 1
    chest_entity.name = 'ups-' .. ups_chests[i]

    data:extend({{
        type = 'recipe',
        name = 'electric-boiler',
        energy_required = 2,
        enabled = true,
        ingredients = {{'steel-plate', 8}},
        result = 'ups-' .. ups_chests[i],
    }}, {chest_item}, {chest_entity})
end
