local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local graphics_location = '__PHI-EN__/graphics/'

local items = {
    ['solar-panel'] = {
        enabled = true,
        type = 'solar-panel',
        name = 'solar-panel',
        min = 2,
        max = 8,
        base = 60
    },
    ['accumulator'] = {
        enabled = true,
        type = 'accumulator',
        name = 'accumulator',
        min = 2,
        max = 8,
        base = 5
    }
}

if mods['space-exploration'] then
    items['solar-panel'].base = 100
    items['accumulator'].base = 10
end

-- entity
local function EE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.name])
    item.name = source.name .. '-mk' .. tier
    item.minable.result = source.name .. '-mk' .. tier
    item.max_health = 200 * (2 ^ (tier - 1))
    item.picture.layers[1].filename = graphics_location .. source.name .. '-e.png'
    item.picture.layers[1].hr_version.filename = graphics_location .. source.name ..'-eh.png'
    item.icon = graphics_location .. source.type .. '-i.png'
    item.icon_size = 64
    item.icon_mipmaps = 4

    if (source == 'accumulator') then
        item.energy_source.buffer_capacity = (source.base * 4 ^ (tier - 1)) .. 'MJ'
        item.energy_source.input_flow_limit = (source.base * 60 * (4 ^ (tier - 1))) .. 'kW'
        item.energy_source.output_flow_limit = (source.base * 60 * (4 ^ (tier - 1))) .. 'kW'
        item.charge_animation.layers[1].layers[1].filename = item.picture.layers[1].filename
        item.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
        item.charge_animation.layers[1].layers[1].hr_version.filename = item.picture.layers[1].hr_version.filename
        item.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
        item.discharge_animation.layers[1].layers[1].filename = item.picture.layers[1].filename
        item.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
        item.discharge_animation.layers[1].layers[1].hr_version.filename = item.picture.layers[1].hr_version.filename
        item.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
    else
        item.production = (source.base * (4 ^ (tier - 1))) .. 'kW'
    end
    
    if (tier <= 7) then
        item.next_upgrade = source.name .. '-mk' .. (tier + 1)
    end
    
    data:extend({item})
end

-- item
local function EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.type])
    item.name = source.name .. '-mk' .. tier
    item.place_result = source.name .. '-mk' .. tier
    item.max_health = 200 * (2 ^ (tier - 1))
    item.subgroup = 'energy'
    item.stack_size = 50
    item.default_request_amount = 50
    item.icons = {{icon = graphics_location .. source.name .. '-i.png', icon_mipmaps = 4, icon_size = 64}}

    if (source.type == 'accumulator') then
        item.order = 'd[' .. source.type .. ']-a' .. tier .. '[' .. source.name .. '-mk' .. tier .. ']'
    else
        item.order = 'e[' .. source.type .. ']-a' .. tier .. '[' .. source.name .. '-mk' .. tier .. ']'
    end

    data:extend({item})
end

-- recipe
local function ER(source, tier)
    local na = source.name

    if (tier >= 3) then
        na = na .. '-mk' .. (tier - 1)
    end

    data:extend({{
        type = 'recipe',
        name = source.name .. '-mk' .. tier,
        energy_required = 2,
        enabled = false,
        ingredients = {{na, 4}},
        result = source.name .. '-mk' .. tier,
    }})
end

-- technology
local function ET(tier)
    if (tier == 2) then
        local prereq = {'solar-energy', 'advanced-electronics', 'electric-energy-accumulators'}
    else
        local prereq = {'compound-energy-' .. (tier - 2)}
    end

    data:extend({{
        type = 'technology',
        name = 'compound-energy-' .. (tier - 1),
        icon_size = 256,
        icon = graphics_location .. 'solar-energy' .. '-t.png',
        effects = {
            {
                type = 'unlock-recipe',
                recipe = 'solar-panel-mk' .. tier
            },
            {
                type = 'unlock-recipe',
                recipe = 'accumulator-mk' .. tier
            }
        },
        prerequisites = prereq,
        unit = {
            count = 100 * (2 * (tier - 1)),
            ingredients = {
                {'automation-science-pack', 1},
                {'logistic-science-pack', 1}
            },
            time = 60
        },
        order = 'a-h-' .. alpha_order[tier + 1]
    }})
end

for _, v in pairs(items) do
    if v.enabled then
        for j=v.min, v.max, 1 do
            EE(v, j)
            EI(v, j)
            ER(v, j)
            ET(j)
        end
    end
end

