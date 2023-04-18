local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local graphics_location = '__PHI-EQ__/graphics/'

local items = {
    ['solar-panel'] = {
        enabled = true,
        type = 'solar-panel',
        name = 'solar-panel',
        tech = 'solar-panel-equipment',
        min = 2,
        max = 8,
        base = 30,
        graphics_source = nil
    },
    ['fusion-reactor'] = {
        enabled = true,
        type = 'fusion-reactor',
        name = 'fusion-reactor',
        tech = 'fusion-reactor-equipment',
        min = 2,
        max = 8,
        base = 750,
        graphics_source = nil
    },
    ['battery'] = {
        enabled = true,
        type = 'battery',
        name = 'battery',
        tech = 'battery-mk2-equipment',
        min = 3,
        max = 8,
        base = 100,
        graphics_source = nil
    },
    ['personal-laser-defense'] = {
        enabled = true,
        type = 'personal-laser-defense',
        name = 'personal-laser-defense',
        tech = 'personal-laser-defense-equipment',
        min = 2,
        max = 8,
        base = 3,
        graphics_source = nil
    },
    ['energy-shield'] = {
        enabled = true,
        type = 'energy-shield',
        name = 'energy-shield',
        tech = 'energy-shield-mk2-equipment',
        min = 3,
        max = 8,
        base = 150,
        graphics_source = nil
    },
    ['personal-roboport'] = {
        enabled = true,
        type = 'personal-roboport',
        name = 'personal-roboport',
        tech = 'personal-roboport-mk2-equipment',
        min = 3,
        max = 8,
        base = 0.5,
        graphics_source = nil
    },
    ['night-vision'] = {
        enabled = true,
        type = 'night-vision',
        name = 'night-vision',
        tech = 'night-vision-equipment',
        min = 2,
        max = 2,
        base = 1,
        graphics_source = nil
    },
    ['exoskeleton'] = {
        enabled = true,
        type = 'exoskeleton',
        name = 'exoskeleton',
        tech = 'exoskeleton-equipment',
        min = 2,
        max = 2,
        base = 0.6,
        graphics_source = nil
    }
}

if mods['space-exploration'] then
    items['solar-panel'].base = 40

    items['fusion-reactor'].name = 'se-rtg-equipment'
    items['fusion-reactor'].tech = 'se-rtg-equipment'
    items['fusion-reactor'].base = 800

    items['night-vision'].enabled = false
    items['exoskeleton'].enabled = false

    items['battery'].tech = 'battery-equipment'
    items['battery'].base = 25

    items['energy-shield'].tech = 'energy-shield-equipment'

    items['personal-roboport'].tech = 'personal-roboport-equipment' 
else
    data:extend({
        {
            type = 'equipment-grid',
            name = 'equipment-grid-14x14',
            width = 14,
            height = 14,
            equipment_categories = {'armor'}
        },
        {
            type = 'armor',
            name = 'power-armor-mk3',
            icon = '__base__/graphics/icons/power-armor-mk2.png',
            icon_size = 64, icon_mipmaps = 4,
            resistances = {{type = 'physical', decrease = 20, percent = 50}, {type = 'acid', decrease = 20, percent = 80},
            {type = 'explosion', decrease = 70, percent = 60}, {type = 'fire', decrease = 20, percent = 80},
            {type = 'laser', decrease = 20, percent = 50}, {type = 'electric', decrease = 20, percent = 50},
            {type = 'impact', decrease = 20, percent = 50}, {type = 'poison', decrease = 20, percent = 50}},
            subgroup = 'armor',
            order = 'eb[power-armor-mk3]',
            stack_size = 1,
            infinite = true,
            equipment_grid = 'equipment-grid-14x14',
            inventory_size_bonus = 40,
            open_sound = {filename =  '__base__/sound/armor-open.ogg', volume = 1},
            close_sound = {filename = '__base__/sound/armor-close.ogg', volume = 1}
        }
    })

    data:extend({{
        type = 'recipe',
        name = 'power-armor-mk3',
        energy_required = 5,
        enabled = 'false',
        ingredients = {{'power-armor-mk2', 2}},
        result = 'power-armor-mk3'
    }})

    for _, animation in ipairs(data.raw['character']['character']['animations']) do
        if animation.armors then
            for _, armor in ipairs(animation.armors) do
                if armor == 'power-armor-mk2' then
                    animation.armors[#animation.armors + 1] = 'power-armor-mk3'
                    break
                end
            end
        end
    end
    
    table.insert(data.raw.technology['power-armor-mk2'].effects, {type='unlock-recipe', recipe='power-armor-mk3'})
end

-- equipment
local function EE(source, tier)
    local item = {}
    item['name'] = source.name .. '-mk' .. tier .. '-equipment'
    item['categories'] = {'armor'}
    local w = 1
    local h = 1
    
    if (source.type == 'solar-panel') then
        item['type'] = 'solar-panel-equipment'
        item['power'] = (source.base * (2 ^ (tier - 1))) .. 'kW'
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-output'}
    elseif (source.type == 'battery') then
        h = 2
        item['type'] = 'battery-equipment'
        item['energy_source'] = {type = 'electric', usage_priority = 'tertiary', buffer_capacity= (source.base * (2 ^ (tier - 2))) .. 'MJ'}
    elseif (source.type == 'fusion-reactor') then
        w = 4
        h = 4
        item['type'] = 'generator-equipment'
        item['power'] = (source.base * (2 ^ (tier - 1))) .. 'kW'
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-output'}
    elseif (source.type == 'personal-laser-defense') then
        w = 2
        h = 2
        item['type'] = 'active-defense-equipment'
        item['energy_source'] = {type = 'electric', usage_priority = 'secondary-input', buffer_capacity = (250 * (2 ^ (tier - 1))) .. 'kJ'}
        -- item['source_direction_count'] = 64
        -- item['source_offset'] = {0, -3.423489 / 4}
        item['attack_parameters'] = {type = 'beam', cooldown = 60, range = (18 + tier), damage_modifier = (source.base * (2 ^ (tier - 1))), ammo_type = {category = 'laser', energy_consumption = (50 * (2 ^ (tier - 1))) .. 'kJ', action = {type = 'direct', action_delivery = {type = 'beam', beam = 'laser-beam', max_length = (18 + tier), duration = 60, source_offset = {0, -1.31439}}}}}
        item['automatic'] = true
    elseif (source.type == 'energy-shield') then
        w = 2
        h = 2
        item['type'] = 'energy-shield-equipment'
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-input', input_flow_limit = (1000 * (2 ^ (tier - 1))) .. 'kW', buffer_capacity = (480 * (2 ^ (tier - 1))) .. 'kJ'}
        item['max_shield_value'] = (source.base * (2 ^ (tier - 2)))
        item['energy_per_shield'] = '80kJ'
    elseif (source.type == 'personal-roboport') then
        w = 2
        h = 2
        item['type'] = 'roboport-equipment'
        item['energy_source'] = {type = 'electric', usage_priority = 'secondary-input', buffer_capacity = (source.base * 32 * (2 ^ (tier - 1))) .. 'MJ'}
        item['robot_limit'] = 50
        item['construction_radius'] = 32
        item['spawn_and_station_height'] = 0.4
        item['spawn_and_station_shadow_height_offset'] = 0.5
        item['charge_approach_distance'] = 2.6
        item['robots_shrink_when_entering_and_exiting'] = true
        item['recharging_animation'] = {filename = '__base__/graphics/entity/roboport/roboport-recharging.png', draw_as_glow = true, priority = 'high', width = 37, height = 35, frame_count = 16, scale = 1.5, animation_speed = 0.5}
        item['recharging_light'] = {intensity = 0.2, size = 3, color = {r = 0.5, g = 0.5, b = 1.0}}
        item['stationing_offset'] = {0, -0.6}
        item['charging_station_shift'] = {0, 0.5}
        item['charging_station_count'] = 16
        item['charging_energy'] = (source.base * (2 ^ (tier - 2))) .. 'MW'
        item['charging_distance'] = 1.6
        item['charging_threshold_distance'] = 5
    elseif (source.type == 'night-vision') then
        w = 2
        h = 2
        item['type'] = 'night-vision-equipment'
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-input', buffer_capacity = '1MJ'}
        item['energy_input'] = '20kW'
        item['activate_sound'] = {filename = '__base__/sound/nightvision-on.ogg', volume = 0.5}
        item['deactivate_sound'] = {filename = '__base__/sound/nightvision-off.ogg', volume = 0.5}
        item['darkness_to_turn_on'] = source.base
        item['color_lookup'] = {{0, '__core__/graphics/color_luts/lut-sunset.png'}}
    elseif (source.type == 'exoskeleton') then
        w = 2
        h = 4
        item['type'] = 'movement-bonus-equipment'
        item['energy_source'] = {type = 'electric', usage_priority = 'secondary-input', buffer_capacity = '10MJ'}
        item['energy_consumption'] = '400kW'
        item['movement_bonus'] = source.base
    end

    item['shape'] = {width = w, height = h, type = 'full'}

    if source.graphics_source == nil then
        item['sprite'] = {filename = graphics_location .. source.type .. '-equipment-e.png', width = w * 32, height = h * 32, priority = 'medium', hr_version = {filename = graphics_location .. source.type .. '-equipment-eh.png', width = w * 64, height = h *64, priority = 'medium', scale = 0.5}}
    else
        item['sprite'] = {filename = source.graphics_source, width = w * 32, height = h * 32, priority = 'medium'}
    end

    data:extend({item})
end

-- item
local function EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.name .. '-equipment'])
    item.name = source.name .. '-mk' .. tier .. '-equipment'
    item.placed_as_equipment_result = source.name .. '-mk' .. tier .. '-equipment'
    item.subgroup = 'equipment'
    item.stack_size = 20
    item.default_request_amount = 5
    item.icons = {{icon = graphics_location .. source.type .. '-equipment-i.png', icon_mipmaps = 4, icon_size = 64}}

    if (source.type == 'solar-panel') then
        item.order = 'a[energy-source]-a' .. alpha_order[tier - 1] .. '[' .. source.name .. '-mk' .. tier .. ']'
    elseif (source.type == 'battery') then
        item.order = 'b[battery]-b' .. alpha_order[tier] .. '[' .. source.name .. 'equipment-mk' .. tier .. ']'
    elseif (source.type == 'fusion-reactor') then
        item.order = 'a[energy-source]-b' .. alpha_order[tier - 1] .. '[' .. source.name .. '-mk' .. tier .. ']'
    elseif (source.type == 'personal-laser-defense') then
        item.order = 'd[active-defense]-b' .. alpha_order[tier - 1] .. '[' .. source.name .. '-mk' .. tier .. ']'
    elseif (source.type == 'energy-shield') then
        item.order = 'b[shield]-c' .. alpha_order[tier - 1] .. '[' .. source.name .. '-equipment-mk' .. tier .. ']'
    elseif (source.type == 'personal-roboport') then
        item.order = 'e[robotics]-b' .. alpha_order[tier - 1] .. '[' .. source.name .. '-mk' .. tier .. '-equipment]'
    elseif (source.type == 'night-vision') then
        item.order = 'f[night-vision]-a' .. alpha_order[tier - 1] .. '[' .. source.name .. '-mk' .. tier .. ']'
    elseif (source.type == 'exoskeleton') then
        item.order = 'd[exoskeleton]-a' .. alpha_order[tier - 1] .. '[' .. source.name .. 'equipment-mk' .. tier .. ']'
    end

    data:extend({item})
end

-- recipe
local function ER(source, tier)
    na = source.name

    if (tier == 2) then
        na = source.name .. '-equipment'
    elseif (tier >= 3) then
        na = source.name .. '-mk' .. (tier - 1) .. '-equipment'
    end

    data:extend({{
        type = 'recipe',
        name = source.name .. '-mk' .. tier .. '-equipment',
        energy_required = 2,
        enabled = false,
        ingredients = {{na, 2}},
        result = source.name .. '-mk' .. tier .. '-equipment',
    }})
end

-- tech
local function ET(source, tier)
    table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=source.name .. '-mk' .. tier .. '-equipment'})
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
