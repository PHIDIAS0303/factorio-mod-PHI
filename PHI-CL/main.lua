local main = {}

-- entity
function main.EEE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])

    item.name = source.name .. '-' .. tier
    item.minable.result = source.name .. '-' .. tier
    item.max_health = item.max_health * (2 ^ (tier - source.min + 1))

    if (source.type == 'accumulator') then
        item.energy_source.buffer_capacity = (source.base * 4 ^ (tier - source.min + 1)) .. 'MJ'
        item.energy_source.input_flow_limit = (source.base * 60 * (4 ^ (tier - source.min + 1))) .. 'kW'
        item.energy_source.output_flow_limit = (source.base * 60 * (4 ^ (tier - source.min + 1))) .. 'kW'

        --[[
        item.charge_animation.layers[1].layers[1].filename = item.picture.layers[1].filename
        item.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
        item.charge_animation.layers[1].layers[1].hr_version.filename = item.picture.layers[1].hr_version.filename
        item.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
        item.discharge_animation.layers[1].layers[1].filename = item.picture.layers[1].filename
        item.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
        item.discharge_animation.layers[1].layers[1].hr_version.filename = item.picture.layers[1].hr_version.filename
        item.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
        ]]

    elseif (source.type == 'solar-panel') then
        item.production = (source.base * (4 ^ (tier - source.min + 1))) .. 'kW'

    elseif (source.type == 'boiler') then
        item.fluid_box.height = 4
        item.output_fluid_box.height = 4
        item.output_fluid_box.base_level = 5
        item.energy_consumption = source.base * tier .. 'kW'
        item.target_temperature = 15 + (source.temp * tier)
        item.fluid_usage_per_tick = source.fluid

        if (source.name == 'heat-exchanger') then
            item.energy_source.min_working_temperature = 15 + (source.temp * tier)
            item.energy_source.max_temperature = source.temp * (tier + 1)
            item.energy_source.max_transfer = 2000 + (2000 * tier) .. 'MW'
        end

    elseif (source.type == 'generator') then
        item.fluid_box.height = 4
        item.maximum_temperature = 15 + (source.base * tier)
        item.fluid_usage_per_tick = source.fluid

    elseif (source.type == 'reactor') then
        item.consumption = source.base * tier .. 'MW'
        item.neighbour_bonus = source.bonus
        item.heat_buffer.max_temperature = source.temp * (tier + 1)
        item.heat_buffer.max_transfer = source.temp * (tier + 1) * 0.02 .. 'GW'

    elseif (source.type == 'heat-pipe') then
        item.heat_buffer.max_temperature = source.temp * (tier + 1)
        item.heat_buffer.max_transfer = source.temp * (tier + 1) * 0.01 .. 'GW'

    elseif (source.type == 'lab') then
        item.researching_speed = item.researching_speed * (2 ^ (tier - source.min + 1))

    elseif (source.type == 'mining-drill') then
        item.mining_speed = item.mining_speed * (2 ^ (tier - source.min + 1))

    elseif source.type == 'electric-turret' then
        item.attack_parameters.damage_modifier = item.attack_parameters.damage_modifier * 2
        item.glow_light_intensity = 1
        item.attack_parameters.ammo_type.action.action_delivery.max_length = source.range + (2 * (tier - source.min + 1))
        -- item.attack_parameters.ammo_type.energy_consumption = 800 * (2 ^ (tier - source.min + 1)) .. 'kJ'
        item.energy_source.input_flow_limit = 9600 * (2 ^ (tier - source.min + 1)) .. 'kW'
        item.energy_source.buffer_capacity = 12816 * (2 ^ (tier - source.min + 1)) .. 'kJ'

    elseif source.type == 'fluid-turret' then
        item.prepare_range = 35 + (2 * (tier - source.min + 1))

    elseif source.type == 'radar' then
        item.max_distance_of_sector_revealed = item.max_distance_of_sector_revealed + (2 * tier)
        item.max_distance_of_nearby_sector_revealed = item.max_distance_of_nearby_sector_revealed + (2 * tier)
        item.energy_usage = 300 * (1 + (0.5 * (tier - source.min + 1))) .. 'kW'

    else
        if item.crafting_speed then
            item.crafting_speed = item.crafting_speed * (2 ^ (tier - source.min + 1))
        end

        if item.energy_source.emissions_per_minute then
            item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - source.min + 1))
        end
    end

    if source.type == 'electric-turret' or source.type == 'ammo-turret' or source.type == 'fluid-turret' then
        item.attack_parameters.damage_modifier = (2 ^ (tier - source.min + 1))
        item.attack_parameters.range = source.range + (2 * (tier - source.min + 1))
        item.call_for_help_radius = 40 + (2 * (tier - source.min + 1))
    end

    if item.fluid_boxes then
        for k, _ in pairs(item.fluid_boxes) do
            if (item.fluid_boxes[k] and (not item.fluid_boxes[k])) then
                if item.fluid_boxes[k].production_type then
                    item.fluid_boxes[k].height = 4

                    if item.fluid_boxes[k].base_level then
                        item.fluid_boxes[k].base_level = item.fluid_boxes[k].base_level * 4
                    end
                end
            end
        end
    end

    if item.energy_usage then
        item.energy_usage = tonumber(string.match(item.energy_usage, '%d+')) * (2 ^ (tier - source.min + 1)) .. 'kW'
    end

    -- item.animation.layers[1].filename = graphics_location .. source .. '-e.png'
    -- item.animation.layers[1].hr_version.filename = graphics_location .. source ..'-eh.png'
    -- item.icon = graphics_location .. source .. '-i.png'
    -- item.icon_size = 64
    -- item.icon_mipmaps = 4

    if (tier < source.max) then
        item.next_upgrade = source.name .. '-' .. (tier + 1)
    end

    data:extend({item})
end

-- equipment
function main.EEQ(source, tier)
    local item = {}
    item['name'] = source.name .. '-mk' .. tier .. '-equipment'
    item['categories'] = {'armor'}
    local w = 1
    local h = 1

    if (source.name == 'solar-panel') then
        item['power'] = (source.base * (2 ^ (tier - source.min + 1))) .. 'kW'
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-output'}

    elseif (source.name == 'battery') then
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'tertiary', buffer_capacity= (source.base * (2 ^ (tier - source.min + 1))) .. 'MJ'}

    elseif (source.type == 'fusion-reactor') then
        w = 4
        h = 4
        item['power'] = (source.base * (2 ^ (tier - source.min + 1))) .. 'kW'
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-output'}

    elseif (source.type == 'personal-laser-defense') then
        w = 2
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'secondary-input', buffer_capacity = (250 * (2 ^ (tier - source.min + 1))) .. 'kJ'}
        -- item['source_direction_count'] = 64
        -- item['source_offset'] = {0, -3.423489 / 4}
        item['attack_parameters'] = {type = 'beam', cooldown = 40, range = (18 + tier), damage_modifier = (source.base * (2 ^ (tier - source.min + 1))), ammo_type = {category = 'laser', energy_consumption = (50 * (2 ^ (tier - 1))) .. 'kJ', action = {type = 'direct', action_delivery = {type = 'beam', beam = 'laser-beam', max_length = (18 + tier), duration = 60, source_offset = {0, -1.31439}}}}}
        item['automatic'] = true

    elseif (source.type == 'energy-shield') then
        w = 2
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-input', input_flow_limit = (source.base * 4 * (2 ^ (tier - source.min + 1))) .. 'kW', buffer_capacity = (source.base * 2 * (2 ^ (tier - 1))) .. 'kJ'}
        item['max_shield_value'] = (source.base * (2 ^ (tier - 2)))
        item['energy_per_shield'] = '80kJ'

    elseif (source.type == 'personal-roboport') then
        w = 2
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'secondary-input', buffer_capacity = (source.base * 32 * (2 ^ (tier - source.min + 1))) .. 'MJ'}
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
        item['charging_energy'] = (source.base * (2 ^ (tier - source.min + 1))) .. 'MW'
        item['charging_distance'] = 1.6
        item['charging_threshold_distance'] = 5

    elseif (source.type == 'night-vision') then
        w = 2
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-input', buffer_capacity = '1MJ'}
        item['energy_input'] = '20kW'
        item['activate_sound'] = {filename = '__base__/sound/nightvision-on.ogg', volume = 0.5}
        item['deactivate_sound'] = {filename = '__base__/sound/nightvision-off.ogg', volume = 0.5}
        item['darkness_to_turn_on'] = source.base
        item['color_lookup'] = {{0, '__core__/graphics/color_luts/lut-sunset.png'}}

    elseif (source.type == 'exoskeleton') then
        w = 2
        h = 4
        item['energy_source'] = {type = 'electric', usage_priority = 'secondary-input', buffer_capacity = '10MJ'}
        item['energy_consumption'] = '400kW'
        item['movement_bonus'] = source.base
    end

    item['shape'] = {width = w, height = h, type = 'full'}
    item['sprite'] = {filename = '__base__/graphics/equipment/' .. source.graphics_name .. '.png', width = w * 32, height = h * 32, priority = 'medium', hr_version = {filename = '__base__/graphics/equipment/hr-' .. source.graphics_name .. '.png', width = w * 64, height = h * 64, priority = 'medium', scale = 0.5}}

    data:extend({item})
end

-- item
function main.EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.ref_name])

    if source.category == 'equipment' then
        item.name = source.name .. '-mk' .. tier .. '-equipment'
        item.placed_as_equipment_result = source.name .. '-mk' .. tier .. '-equipment'

    else
        item.name = source.name .. '-' .. tier
        item.place_result = source.name .. '-' .. tier

        -- item.icons = {{icon = graphics_location .. source.name .. '-i.png', icon_mipmaps = 4, icon_size = 64}}
    end

    item.order = item.order .. tier
    data:extend({item})
end

-- recipe
function main.ER(source, tier)
    local new_name = source.name
    local ingredient_name = source.name
    local result_name = source.name

    if source.category == 'equipment' then
        if (tier == 1) then
            ingredient_name = ingredient_name .. '-equipment'

        else
            ingredient_name = ingredient_name .. '-mk' .. (tier - 1) .. '-equipment'
        end

        new_name = new_name .. '-mk' .. tier .. '-equipment'
        result_name = result_name .. '-mk' .. tier .. '-equipment'

    else
        if tier > 2 then
            ingredient_name = ingredient_name .. '-' .. (tier - 1)
        end

        new_name = new_name .. '-' .. tier
        result_name = result_name .. '-' .. tier
    end

    local ingredient_amount = 2

    if (source.type == 'solar-panel') or (source.type == 'accumulator') then
        ingredient_amount = 4
    end

    if ((source.type == 'boiler') or (source.type == 'steam-engine') or (source.type == 'nuclear-reactor') or (source.type == 'heat-pipe') or (source.type == 'heat-exchanger') or (source.type == 'steam-turbine')) and (tier > 2) then
        data:extend({{
            type = 'recipe',
            name = new_name ,
            energy_required = 2,
            enabled = false,
            ingredients = {{ingredient_name, 1}, {source.name, 1}},
            result = result_name,
        }})

    else
        data:extend({{
            type = 'recipe',
            name = new_name,
            energy_required = 2,
            enabled = false,
            ingredients = {{ingredient_name, ingredient_amount}},
            result = result_name,
        }})
    end
end

-- technology
function main.ET(source, tier)
    if (source.tech == 'compound-energy') then
        if not data.raw.technology['compound-energy-' .. (tier - 1)] then
            local prereq

            if (tier == 2) then
                prereq = {'solar-energy', 'advanced-electronics', 'electric-energy-accumulators'}

            else
                prereq = {'compound-energy-' .. (tier - 2)}
            end

            local item = {
                type = 'technology',
                name = 'compound-energy-' .. (tier - 1),
                icon_size = 256,
                icon = '__base__/graphics/technology/solar-energy.png',
                effects = {
                    {type='unlock-recipe', recipe=source.name .. '-' .. tier}
                },
                prerequisites = prereq,
                unit = {
                    count = 100,
                    ingredients = {
                        {'automation-science-pack', 2},
                        {'logistic-science-pack', 2}
                    },
                    time = 120
                },
                order = 'a-h-' .. alpha_order[tier + 1]
            }

            data:extend({item})
        else
            if tier <= source.max then
                table.insert(data.raw.technology['compound-energy-' .. (tier - 1)].effects, {type='unlock-recipe', recipe=source.name .. '-' .. tier})
            end
        end

    elseif data.raw.technology[source.tech] then
        if source.category == 'equipment' then
            table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=source.name .. '-mk' .. tier .. '-equipment'})

        else
            table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=source.name .. '-' .. tier})

            if source.type == 'ammo-turret' or source.type == 'fluid-turret' then
                for i=1, #items['research_modifier'][source.type], 1 do
                    for j=1, #data.raw.technology[items['research_modifier'][source.type][i]].effects, 1 do
                        if (data.raw.technology[items['research_modifier'][source.type][i]].effects[j].type == 'turret-attack') then
                            if (data.raw.technology[items['research_modifier'][source.type][i]].effects[j].turret_id == source.ref_name) then
                                table.insert(data.raw.technology[items['research_modifier'][source.type][i]].effects, {type='turret-attack', turret_id=source.name .. '-' .. tier, modifier=data.raw.technology[items['research_modifier'][source.type][i]].effects[j].modifier})
                            end
                        end
                    end
                end
            end
        end
    end
end

-- fast replace group
function main.EL(source)
    if not data.raw[source.type][source.ref_name].fast_replaceable_group then
        data.raw[source.type][source.ref_name].fast_replaceable_group = source.type
    end

    if source.max > 2 then
        data.raw[source.type][source.name .. '-' .. 2].fast_replaceable_group = data.raw[source.type][source.ref_name].fast_replaceable_group
    end

    if source.max > source.min then
        for j=source.min + 1, source.max do
            data.raw[source.type][source.name .. '-' .. j].fast_replaceable_group = data.raw[source.type][source.name .. '-' .. (j - 1)].fast_replaceable_group
        end
    end
end

return main
