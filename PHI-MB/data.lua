local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local graphics_location = '__PHI-MB__/graphics/'

local items = {
    ['assembling-machine'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'assembling-machine',
        ref_name = 'assembling-machine-3',
        tech = 'automation-3',
        min = 4,
        max = 5
    },
    ['electric-furnace'] = {
        enabled = true,
        type = 'furnace',
        name = 'electric-furnace',
        ref_name = 'electric-furnace',
        tech = 'advanced-material-processing-2',
        min = 2,
        max = 3
    },
    ['oil-refinery'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'oil-refinery',
        ref_name = 'oil-refinery',
        tech = 'oil-processing',
        min = 2,
        max = 3
    },
    ['chemical-plant'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'chemical-plant',
        ref_name = 'chemical-plant',
        tech = 'oil-processing',
        min = 2,
        max = 3
    },
    ['centrifuge'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'centrifuge',
        ref_name = 'centrifuge',
        tech = 'uranium-processing',
        min = 2,
        max = 3
    },
    ['lab'] = {
        enabled = true,
        type = 'lab',
        name = 'lab',
        ref_name = 'lab',
        tech = 'automation',
        min = 2,
        max = 3
    }
}

if mods['aai-industry'] then
    items['industrial-furnace'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'industrial-furnace',
        ref_name = 'industrial-furnace',
        tech = 'automation-3',
        min = 2,
        max = 3
    }

    items['fuel-processor'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'fuel-processor',
        ref_name = 'fuel-processor',
        tech = 'automation',
        min = 2,
        max = 3
    }
end

if mods['space-exploration'] then
    items['se-space-assembling-machine'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'se-space-assembling-machine',
        ref_name = 'se-space-assembling-machine',
        tech = 'automation-3',
        min = 2,
        max = 3
    }

    items['se-space-manufactory'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'se-space-manufactory',
        ref_name = 'se-space-manufactory',
        tech = 'automation-3',
        min = 2,
        max = 3
    }

    items['se-casting-machine'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'se-casting-machine',
        ref_name = 'se-casting-machine',
        tech = 'automation-3',
        min = 2,
        max = 3
    }

    items['se-pulveriser'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'se-pulveriser',
        ref_name = 'se-pulveriser',
        tech = 'automation-2',
        min = 2,
        max = 3
    }

    items['se-lifesupport-facility'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'se-lifesupport-facility',
        ref_name = 'se-lifesupport-facility',
        tech = 'automation-2',
        min = 2,
        max = 3
    }

    items['se-fuel-refinery'] = {
        enabled = true,
        type = 'assembling-machine',
        name = 'se-fuel-refinery',
        ref_name = 'se-fuel-refinery',
        tech = 'automation',
        min = 2,
        max = 3
    }
end

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

    item.energy_usage = tonumber(string.match(item.energy_usage, '%d+')) * (2 ^ (tier - source.min + 1)) .. 'kW'
    -- item.animation.layers[1].filename = graphics_location .. source .. '-e.png'
    -- item.animation.layers[1].hr_version.filename = graphics_location .. source ..'-eh.png'
    -- item.icon = graphics_location .. source .. '-i.png'
    -- item.icon_size = 64
    -- item.icon_mipmaps = 4

    if (tier <= source.max - 1) then
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
        for j=v.min, v.max, 1 do
            EE(v, j)
            EI(v, j)
            ER(v, j)
            ET(v, j)
        end
    end
end
