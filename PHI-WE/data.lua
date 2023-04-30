local items = {
    ['laser-turret'] = {
        enabled = true,
        type = 'electric-turret',
        name = 'laser-turret',
        ref_name = 'laser-turret',
        tech = 'laser-turret',
        min = 2,
        max = 3,
        range = 24
    },
    ['gun-turret'] = {
        enabled = true,
        type = 'ammo-turret',
        name = 'gun-turret',
        ref_name = 'gun-turret',
        tech = 'gun-turret',
        min = 2,
        max = 3,
        range = 18
    },
    ['flamethrower-turret'] = {
        enabled = true,
        type = 'fluid-turret',
        name = 'flamethrower-turret',
        ref_name = 'flamethrower-turret',
        tech = 'flamethrower',
        min = 2,
        max = 3,
        range = 30
    }
}

-- entity
local function EE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])
    
    item.name = source.name .. '-' .. tier
    item.minable.result = source.name .. '-' .. tier
    item.max_health = item.max_health * tier
    item.attack_parameters.damage_modifier = (2 ^ (tier - 1))
    item.attack_parameters.range = source.range + (2 * (tier - 1))
    item.call_for_help_radius = 40 + (2 * (tier - 1))

    if source.type == 'electric-turret' then
        item.attack_parameters.damage_modifier = item.attack_parameters.damage_modifier * 2
        item.glow_light_intensity = 1
        item.attack_parameters.ammo_type.action.action_delivery.max_length = source.range + (2 * (tier - 1))
        -- item.attack_parameters.ammo_type.energy_consumption = 800 * (2 ^ (tier - 1)) .. 'kJ'
        item.energy_source.input_flow_limit = 9600 * (2 ^ (tier - 1)) .. 'kW'
        item.energy_source.buffer_capacity = 12816 * (2 ^ (tier - 1)) .. 'kJ'
    elseif source.type == 'fluid-turret' then
        item.prepare_range = 35 + (2 * (tier - 1))
    end

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
