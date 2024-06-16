-- local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
-- local graphics_location = '__PHI-MB__/graphics/'
local items = require 'config'

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

-- entity
local function EE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])

    item.name = source.name .. '-' .. tier
    item.minable.result = source.name .. '-' .. tier
    item.max_health = item.max_health * (2 ^ (tier - source.min + 1))

    if source.type == 'lab' then
        item.researching_speed = item.researching_speed * (2 ^ (tier - source.min + 1))

    elseif source.type == 'mining-drill' then
        item.mining_speed = item.mining_speed * (2 ^ (tier - source.min + 1))

    else
        item.crafting_speed = item.crafting_speed * (2 ^ (tier - source.min + 1))
        item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - source.min + 1))
    end

    if item.fluid_boxes ~= nil then
        for k, _ in pairs(item.fluid_boxes) do
            if item.fluid_boxes[k] ~= false and item.fluid_boxes[k] ~= true then
                if item.fluid_boxes[k].production_type ~= nil then
                    item.fluid_boxes[k].height = 4

                    if item.fluid_boxes[k].base_level ~= nil then
                        item.fluid_boxes[k].base_level = item.fluid_boxes[k].base_level * 4
                    end
                end
            end
        end
    end

    item.energy_usage = tonumber(string.match(item.energy_usage, '%d+')) * (2 ^ (tier - source.min + 1)) .. 'kW'
    -- item.animation.layers[1].filename = graphics_location .. source .. '-e.png'
    -- item.animation.layers[1].hr_version.filename = graphics_location .. source ..'-eh.png'
    -- item.icon = graphics_location .. source .. '-i.png'
    -- item.icon_size = 64
    -- item.icon_mipmaps = 4

    if tier < source.max then
        item.next_upgrade = source.name .. '-' .. (tier + 1)
    end

    data:extend({item})
end

-- item
local function EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.ref_name])
    item.name = source.name .. '-' .. tier
    item.place_result = source.name .. '-' .. tier

    -- item.icons = {{icon = graphics_location .. source .. '-i.png', icon_mipmaps = 4, icon_size = 64}}
    item.order = item.order .. tier
    data:extend({item})
end

-- recipe
local function ER(source, tier)
    local ingredient_name = source.name

    if tier > 2 then
        ingredient_name = ingredient_name .. '-' .. (tier - 1)
    end

    data:extend({{
        type = 'recipe',
        name = source.name .. '-' .. tier,
        energy_required = 2,
        enabled = false,
        ingredients = {{ingredient_name, 2}},
        result = source.name .. '-' .. tier,
    }})
end

-- tech
local function ET(source, tier)
    table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=source.name .. '-' .. tier})
end

for _, v in pairs(items) do
    if v.enabled then
        if v.stage == 2 then
            for j=v.min, v.max, 1 do
                EE(v, j)
                EI(v, j)
                ER(v, j)
                ET(v, j)
            end
        end
    end
end

for k, v in pairs(items) do
    if k ~= 'setting' then
        if v.enabled then
            data.raw[v.type][v.ref_name].fast_replaceable_group = v.type

            if v.max > 2 then
                data.raw[v.type][v.name .. '-' .. 2].fast_replaceable_group = data.raw[v.type][v.ref_name].fast_replaceable_group
            end

            if v.max > v.min then
                for j=v.min + 1, v.max do
                    data.raw[v.type][v.name .. '-' .. j].fast_replaceable_group = data.raw[v.type][v.name .. '-' .. (j - 1)].fast_replaceable_group
                end
            end
        end
    end
end
