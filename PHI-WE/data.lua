local items = require 'config'

local research_modifier = {
    --[[
    ['electric-turret'] = {
        'energy-weapons-damage-1',
        'energy-weapons-damage-2',
        'energy-weapons-damage-3',
        'energy-weapons-damage-4',
        'energy-weapons-damage-5',
        'energy-weapons-damage-6',
        'energy-weapons-damage-7'
    },
    ]]
    ['ammo-turret'] = {
        'physical-projectile-damage-1',
        'physical-projectile-damage-2',
        'physical-projectile-damage-3',
        'physical-projectile-damage-4',
        'physical-projectile-damage-5',
        'physical-projectile-damage-6',
        'physical-projectile-damage-7'
    },
    ['fluid-turret'] = {
        'refined-flammables-1',
        'refined-flammables-2',
        'refined-flammables-3',
        'refined-flammables-4',
        'refined-flammables-5',
        'refined-flammables-6',
        'refined-flammables-7'
    }
}

-- entity
local function EE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])
    
    item.name = source.name .. '-' .. tier
    item.minable.result = source.name .. '-' .. tier
    item.max_health = item.max_health * tier

    if source.type == 'electric-turret' or source.type == 'ammo-turret' or source.type == 'fluid-turret' then
        item.attack_parameters.damage_modifier = (2 ^ (tier - 1))
        item.attack_parameters.range = source.range + (2 * (tier - 1))
        item.call_for_help_radius = 40 + (2 * (tier - 1))
    end

    if source.type == 'electric-turret' then
        item.attack_parameters.damage_modifier = item.attack_parameters.damage_modifier * 2
        item.glow_light_intensity = 1
        item.attack_parameters.ammo_type.action.action_delivery.max_length = source.range + (2 * (tier - 1))
        -- item.attack_parameters.ammo_type.energy_consumption = 800 * (2 ^ (tier - 1)) .. 'kJ'
        item.energy_source.input_flow_limit = 9600 * (2 ^ (tier - 1)) .. 'kW'
        item.energy_source.buffer_capacity = 12816 * (2 ^ (tier - 1)) .. 'kJ'
    elseif source.type == 'fluid-turret' then
        item.prepare_range = 35 + (2 * (tier - 1))
    elseif source.type == 'radar' then
        item.max_distance_of_sector_revealed = item.max_distance_of_sector_revealed + (2 * tier)
        item.max_distance_of_nearby_sector_revealed = item.max_distance_of_nearby_sector_revealed + (2 * tier)
        item.energy_usage = 300 * (1 + (0.5 * (tier - 1))) .. 'kW'
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

    if source.type == 'ammo-turret' or source.type == 'fluid-turret' then
        for i=1, #research_modifier[source.type], 1 do
            for j=1, #data.raw.technology[research_modifier[source.type][i]].effects, 1 do
                if (data.raw.technology[research_modifier[source.type][i]].effects[j].type == 'turret-attack') then
                    if (data.raw.technology[research_modifier[source.type][i]].effects[j].turret_id == source.ref_name) then
                        table.insert(data.raw.technology[research_modifier[source.type][i]].effects, {type='turret-attack', turret_id=source.name .. '-' .. tier, modifier=data.raw.technology[research_modifier[source.type][i]].effects[j].modifier})
                    end
                end
            end
        end
    end
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
