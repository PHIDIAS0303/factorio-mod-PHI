local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local graphics_location = '__PHI-MB__/graphics/'

local items = {'assembling-machine', 'electric-furnace', 'chemical-plant', 'oil-refinery', 'centrifuge'}

local item_min = {
    ['assembling-machine'] = 4,
    ['electric-furnace'] = 2,
    ['chemical-plant'] = 2,
    ['oil-refinery'] = 2,
    ['centrifuge'] = 2
}

local item_max = {
    ['assembling-machine'] = 5,
    ['electric-furnace'] = 3,
    ['chemical-plant'] = 3,
    ['oil-refinery'] = 3,
    ['centrifuge'] = 3
}

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
    'stack-inserter',
    'stack-filter-inserter',
    'filter-inserter',

    'underground-belt',
    'fast-transport-belt',
    'fast-underground-belt',
    'fast-splitter',
    'express-transport-belt',
    'express-underground-belt',
    'express-splitter',

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
    else
        item = table.deepcopy(data.raw['assembling-machine'][source])
    end
    
    item.name = source .. '-' .. tier
    item.minable.result = source .. '-' .. tier
    item.max_health = item.max_health * (2 ^ (tier - item_min[source] + 1))
    item.crafting_speed = item.crafting_speed * (2 ^ (tier - item_min[source] + 1))
    item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - item_min[source] + 1))
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

table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='assembling-machine-5'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='electric-furnace-3'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='chemical-plant-3'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='oil-refinery-3'})
table.insert(data.raw.technology['compound-energy-2'].effects, {type='unlock-recipe', recipe='centrifuge-3'})

for i=1, #recipe_list, 1 do
    if data.raw.recipe[recipe_list[i]] ~= nil then
        local item = table.deepcopy(data.raw.recipe[recipe_list[i]])
        local item_1 = item

        if item.energy_required ~= nil then
            item.energy_required = item.energy_required * 4
            item_1.energy_required = item_1.energy_required * 16
        else
            item.energy_required = 2
            item_1.energy_required = 8
        end
        
        if item.ingredients ~= nil then
            for k, v in pairs(item.ingredients) do
                if (v[1] ~= nil) and (v[2] ~= nil) then
                    item.ingredients[k][2] = v[2] * 4
                    item_1.ingredients[k][2] = v[2] * 16
                else
                    item.ingredients[k].amount = v.amount * 4
                    item_1.ingredients[k].amount = v.amount * 16
                end
            end
        elseif (item.normal ~= nil) and (item.normal ~= false) then
            for k, v in pairs(item.normal.ingredients) do
                item.normal.ingredients[k][2] = v[2] * 4
                item_1.normal.ingredients[k][2] = v[2] * 16
            end
        elseif (item.expensive) ~= nil and (item.expensive ~= false) then
            for k, v in pairs(item.expensive.ingredients) do
                item.expensive.ingredients[k][2] = v[2] * 4
                item_1.expensive.ingredients[k][2] = v[2] * 16
            end
        end
        
        item.name = item.name .. '-4x'
        item.enabled = true
        item_1.name = item_1.name .. '-16x'
        item_1.enabled = true

        if item.results ~= nil then
            for k, v in pairs(item.results) do
                if (v[1] ~= nil) and (v[2] ~= nil) then
                    item.results[k][2] = v[2] * 4
                    item_1.results[k][2] = v[2] * 16
                else
                    item.results[k].amount = v.amount * 4
                    item_1.results[k].amount = v.amount * 16         
                end
            end

            data:extend({item})
            data:extend({item_1})
        else
            local result_count

            if item.result_count ~= nil then
                item.result_count = item.result_count * 4
                item_1.result_count = item_1.result_count * 16
            else
                item.result_count = 4
                item_1.result_count = 16
            end

            data:extend({item})
            data:extend({item_1})
        end
    end
end

data.raw.recipe['loader'].hidden = false
data.raw.recipe['fast-loader'].hidden = false
data.raw.recipe['express-loader'].hidden = false
table.insert(data.raw.technology['logistics'].effects, {type='unlock-recipe', recipe='loader'})
table.insert(data.raw.technology['logistics-2'].effects, {type='unlock-recipe', recipe='fast-loader'})
table.insert(data.raw.technology['logistics-3'].effects, {type='unlock-recipe', recipe='express-loader'})
