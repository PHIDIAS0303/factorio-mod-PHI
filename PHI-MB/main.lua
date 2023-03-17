local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local graphics_location = '__PHI-MB__/graphics/'

local items = {'assembling-machine', 'electric-furnace', 'chemical-plant', 'oil-refinery'}

local item_min = {
    ['assembling-machine'] = 4,
    ['electric-furnace'] = 2,
    ['chemical-plant'] = 2,
    ['oil-refinery'] = 2
}

local item_max = {
    ['assembling-machine'] = 5,
    ['electric-furnace'] = 3,
    ['chemical-plant'] = 3,
    ['oil-refinery'] = 3
}

-- entity
local function EE(source, tier)
    if source == 'assembling-machine' then
        local item = table.deepcopy(data.raw['assembling-machine']['assembling-machine-3'])
    elseif source == 'electric-furnace' then
        local item = table.deepcopy(data.raw['furnace']['electric-furnace'])
    elseif (source == 'chemical-plant') or (source == 'oil-refinery') then
        local item = table.deepcopy(data.raw['assembling-machine'][source])
    else
        local item = table.deepcopy(data.raw[source][source])
    end
    
    item.name = source .. '-' .. tier
    item.minable.result = source .. '-' .. tier
    item.max_health = item.max_health * (2 ^ (tier - 1))
    item.crafting_speed = item.crafting_speed * (2 ^ (tier - 1))
    item.energy_usage = tonumber(string.match(item.energy_usage, '%d+')) * (2 ^ (tier - 1)) .. string.match(item.energy_usage, '%a')
    item.picture.layers[1].filename = graphics_location .. source .. '-e.png'
    item.picture.layers[1].hr_version.filename = graphics_location .. source ..'-eh.png'
    item.icon = graphics_location .. source .. '-i.png'
    item.icon_size = 64
    item.icon_mipmaps = 4

    if (tier <= item_max[source] - 1) then
        item.next_upgrade = source .. '-' .. (tier + 1)
    end
    
    data:extend({item})
end

-- item
local function EI(source, tier)
    local item = table.deepcopy(data.raw.item[source])
    item.name = source .. '-' .. tier
    item.place_result = source .. '-' .. tier
    item.icons = {{icon = graphics_location .. source .. '-i.png', icon_mipmaps = 4, icon_size = 64}}
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
        enabled = 'false',
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
