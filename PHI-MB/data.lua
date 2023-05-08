local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local graphics_location = '__PHI-MB__/graphics/'
local items = require 'config'

-- entity
local function EE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])

    item.name = source.name .. '-' .. tier
    item.minable.result = source.name .. '-' .. tier
    item.max_health = item.max_health * (2 ^ (tier - source.min + 1))

    if source.type == 'lab' then
        item.researching_speed = item.researching_speed * (2 ^ (tier - source.min + 1))
    else
        item.crafting_speed = item.crafting_speed * (2 ^ (tier - source.min + 1))
        item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - source.min + 1))
    end

    if item.fluid_boxes ~= nil then
        for k, _ in pairs(item.fluid_boxes) do
            if item.fluid_boxes[k] ~= false and item.fluid_boxes[k] ~= true then
                if item.fluid_boxes[k].production_type ~= nil then
                    if item.fluid_boxes[k].base_area == nil then
                        item.fluid_boxes[k].base_area = 20
                    else
                        item.fluid_boxes[k].base_area = item.fluid_boxes[k].base_area * 2
                    end
                    
                    item.fluid_boxes[k].height = 2
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

    if (tier <= source.max - 1) then
        item.next_upgrade = source.name .. '-' .. (tier + 1)
    end

    if (source.new_type ~= nil) then
        item.type = source.new_type
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
    local na = source.name

    if tier > 2 then
        na = na .. '-' .. (tier - 1)
    end

    data:extend({{
        type = 'recipe',
        name = source.name .. '-' .. tier,
        energy_required = 2,
        enabled = false,
        ingredients = {{na, 2}},
        result = source.name .. '-' .. tier,
    }})
end

-- tech
local function ET(source, tier)
    table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=source.name .. '-' .. tier})
end

for _, v in pairs(items) do
    if v.enabled then
        if v.stage == 1 then
            for j=v.min, v.max, 1 do
                EE(v, j)
                EI(v, j)
                ER(v, j)
                ET(v, j)
            end
        end
    end
end
