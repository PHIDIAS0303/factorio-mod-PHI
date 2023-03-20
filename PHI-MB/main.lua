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

local recipe_multiplier = {4, 8}
local recipe_display = {true, false}

local recipe_list = {
    'sulfuric-acid',
    'basic-oil-processing',
    'advanced-oil-processing',
    'coal-liquefaction',
    'heavy-oil-cracking',
    'light-oil-cracking',
    'solid-fuel-from-light-oil',
    'solid-fuel-from-heavy-oil',
    'solid-fuel-from-petroleum-gas',
    'lubricant',

    'iron-plate',
    'copper-plate',
    'steel-plate',
    'stone-brick',

    'sulfur',
    'plastic-bar',
    'explosives',
    'battery',

    'empty-barrel',
    'copper-cable',
    'iron-stick',
    'iron-gear-wheel',

    'electronic-circuit',
    'advanced-circuit',
    'processing-unit',

    'engine-unit',
    'electric-engine-unit',
    'flying-robot-frame',

    'low-density-structure',
    'rocket-fuel',
    'rocket-control-unit',
    'rocket-part',

    'automation-science-pack',
    'logistic-science-pack',
    'chemical-science-pack',
    'military-science-pack',
    'production-science-pack',
    'utility-science-pack',

    'uranium-processing',
    'kovarex-enrichment-process',
    'uranium-fuel-cell',
    'nuclear-fuel',
    'nuclear-fuel-reprocessing',

    'inserter',
    'transport-belt',
    'grenade',
    'firearm-magazine',
    'piercing-rounds-magazine',
    'stone-wall',
    'rail',
    'electric-furnace',
    'solid-fuel-from-heavy-oil',
    'solid-fuel-from-light-oil',
    'solid-fuel-from-petroleum-gas',

    'speed-module',
    'speed-module-2',
    'speed-module-3',
    'productivity-module',
    'productivity-module-2',
    'productivity-module-3',
    'effectivity-module',
    'effectivity-module-2',
    'effectivity-module-3',

    'pipe',
    'fast-inserter',
    'long-handed-inserter',
    'filter-inserter',
    'stack-inserter',
    'stack-filter-inserter',

    'underground-belt',
    'fast-transport-belt',
    'fast-underground-belt',
    'fast-splitter',
    --'express-transport-belt',
    --'express-underground-belt',
    --'express-splitter',

    'uranium-rounds-magazine',
    'explosive-cannon-shell',
    'artillery-shell',
    'rocket',
    'explosive-rocket'
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

for i=1, #recipe_list, 1 do
    if data.raw.recipe[recipe_list[i]] ~= nil then
        for j=1, #recipe_multiplier, 1 do
            local item = table.deepcopy(data.raw.recipe[recipe_list[i]])
            item.enabled = false

            if (item.normal ~= nil) and (item.normal ~= false) then
                for k, v in pairs(item.normal.ingredients) do
                    if (v[1] ~= nil) and (v[2] ~= nil) then
                        item.normal.ingredients[k][2] = v[2] * recipe_multiplier[j]
                    else
                        item.normal.ingredients[k].amount = v.amount * recipe_multiplier[j]
                    end
                end

                if item.normal.results ~= nil then
                    for k, v in pairs(item.normal.results) do
                        if (v[1] ~= nil) and (v[2] ~= nil) then
                            item.normal.results[k][2] = v[2] * recipe_multiplier[j]
                        else
                            item.normal.results[k].amount = v.amount * recipe_multiplier[j]        
                        end
                    end

                else
                    if item.normal.result_count ~= nil then
                        item.normal.result_count = item.normal.result_count * recipe_multiplier[j]
                    else
                        item.normal.result_count = recipe_multiplier[j]
                    end
                end

                if item.normal.energy_required ~= nil then
                    item.normal.energy_required = item.normal.energy_required * recipe_multiplier[j]
                else
                    item.normal.energy_required = recipe_multiplier[j] / 2
                end

            elseif (item.expensive) ~= nil and (item.expensive ~= false) then
                for k, v in pairs(item.expensive.ingredients) do
                    if (v[1] ~= nil) and (v[2] ~= nil) then
                        item.expensive.ingredients[k][2] = v[2] * recipe_multiplier[j]
                    else
                        item.expensive.ingredients[k].amount = v.amount * recipe_multiplier[j]
                    end
                end

                if item.expensive.results ~= nil then
                    for k, v in pairs(item.expensive.results) do
                        if (v[1] ~= nil) and (v[2] ~= nil) then
                            item.expensive.results[k][2] = v[2] * recipe_multiplier[j]
                        else
                            item.expensive.results[k].amount = v.amount * recipe_multiplier[j]        
                        end
                    end

                else
                    if item.expensive.result_count ~= nil then
                        item.expensive.result_count = item.expensive.result_count * recipe_multiplier[j]
                    else
                        item.expensive.result_count = recipe_multiplier[j]
                    end
                end

                if item.expensive.energy_required ~= nil then
                    item.expensive.energy_required = item.expensive.energy_required * recipe_multiplier[j]
                else
                    item.expensive.energy_required = recipe_multiplier[j] / 2
                end

            else
                for k, v in pairs(item.ingredients) do
                    if (v[1] ~= nil) and (v[2] ~= nil) then
                        item.ingredients[k][2] = v[2] * recipe_multiplier[j]
                    else
                        item.ingredients[k].amount = v.amount * recipe_multiplier[j]
                    end
                end

                if item.results ~= nil then
                    for k, v in pairs(item.results) do
                        if (v[1] ~= nil) and (v[2] ~= nil) then
                            item.results[k][2] = v[2] * recipe_multiplier[j]
                        else
                            item.results[k].amount = v.amount * recipe_multiplier[j]        
                        end
                    end

                else
                    if item.result_count ~= nil then
                        item.result_count = item.result_count * recipe_multiplier[j]
                    else
                        item.result_count = recipe_multiplier[j]
                    end
                end

                if item.energy_required ~= nil then
                    item.energy_required = item.energy_required * recipe_multiplier[j]
                else
                    item.energy_required = recipe_multiplier[j] / 2
                end
            end
            
            item.name = item.name .. '-' .. j
            data:extend({item})
        end
    end
end

for t=1, #data.raw.technology, 1 do
    for k, _ in pairs(data.raw.technology[t].effects) do
        if data.raw.technology[t].effects[k].type == 'unlock-recipe' then
            if data.raw.recipe[data.raw.technology[t].effects[k].recipe] ~= nil then
                for j=1, #recipe_multiplier, 1 do
                    table.insert(data.raw.technology[t].effects, {type='unlock-recipe', recipe= data.raw.technology[t].effects[k].recipe .. '-' .. j})
                end
            end
        end
    end
end

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
data.raw['roboport']['roboport'].robot_slots_count = 10,
data.raw['roboport']['roboport'].material_slots_count = 2,
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
