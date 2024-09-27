local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local items = require 'config'
local main = {}

local function tint_handle(item, tier, tl)
    for _, ve in pairs(tl) do
        if item[ve] then
            for _, tc in pairs({'layers', 'sheets'}) do
                if item[ve][tc] and item[ve][tc][1] then
                    item[ve][tc][1].tint = items['tint'][tier]

                    if item[ve][tc][1].hr_version then
                        item[ve][tc][1].hr_version.tint = items['tint'][tier]
                    end
                end

                for _, v in pairs(item[ve]) do
                    if type(v) == 'table' then
                        if v[tc] then
                            if v[tc][1] then
                                v[tc][1].tint = items['tint'][tier]

                                if v[tc][1].hr_version then
                                    v[tc][1].hr_version.tint = items['tint'][tier]
                                end
                            end
                        end

                        for i=1, #v, 1 do
                            if v[i] and type(v[i]) == 'table' then
                                if v[i][tc] and v[i][tc][1] then
                                    v[i][tc][1].tint = items['tint'][tier]

                                    if v[i][tc][1].hr_version then
                                        v[i][tc][1].hr_version.tint = items['tint'][tier]
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- entity
function main.EEE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])

    item.name = source.name .. '-' .. tier
    item.minable.result = item.name
    item.max_health = item.max_health * (tier - source.min + 2)

    if (tier < source.max) then
        item.next_upgrade = source.name .. '-' .. (tier + 1)
    end

    if item.energy_usage then
        local eu = tonumber(string.match(item.energy_usage, '[%d%.]+'))
        local euu = string.match(item.energy_usage, '%a+')
        item.energy_usage = eu * (2 ^ (tier - source.min + 1)) .. euu
    end

    if (source.type == 'electric-turret') or (source.type == 'ammo-turret') or (source.type == 'fluid-turret') then
        item.attack_parameters.damage_modifier = (2 ^ (tier - source.min + 1))
        item.attack_parameters.range = item.attack_parameters.range + (2 * (tier - source.min))
        item.call_for_help_radius = item.call_for_help_radius + (2 * (tier - source.min))

        if source.type == 'electric-turret' then
            item.attack_parameters.damage_modifier = item.attack_parameters.damage_modifier * 2
            item.glow_light_intensity = 1
            item.attack_parameters.ammo_type.action.action_delivery.max_length = item.attack_parameters.ammo_type.action.action_delivery.max_length + (2 * (tier - source.min))
            item.attack_parameters.ammo_type.energy_consumption = tonumber(string.match(item.attack_parameters.ammo_type.energy_consumption, '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. string.match(item.attack_parameters.ammo_type.energy_consumption, '%a+')
            item.energy_source.input_flow_limit = tonumber(string.match(item.energy_source.input_flow_limit, '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. string.match(item.energy_source.input_flow_limit, '%a+')
            item.energy_source.buffer_capacity = tonumber(string.match(item.energy_source.buffer_capacity, '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. string.match(item.energy_source.buffer_capacity, '%a+')

        elseif source.type == 'fluid-turret' then
            item.prepare_range = item.prepare_range + (2 * (tier - source.min))
        end
    end

    if settings.startup['PHI-MI-PIPE'].value then
        if item.fluid_boxes then
            for k, _ in pairs(item.fluid_boxes) do
                if (item.fluid_boxes[k] and (not item.fluid_boxes[k])) then
                    if item.fluid_boxes[k].production_type then
                        item.fluid_boxes[k].height = settings.startup['PHI-MI-PIPE'].value

                        if item.fluid_boxes[k].base_level then
                            item.fluid_boxes[k].base_level = item.fluid_boxes[k].base_level + settings.startup['PHI-MI-PIPE'].value
                        end
                    end
                end
            end
        end
    end

    if source.tech == 'compound-energy' then
        if (source.type == 'accumulator') then
            item.energy_source.buffer_capacity = (source.base * 4 ^ (tier - source.min + 1)) .. 'MJ'
            item.energy_source.input_flow_limit = (source.base * 60 * (4 ^ (tier - source.min + 1))) .. 'kW'
            item.energy_source.output_flow_limit = (source.base * 60 * (4 ^ (tier - source.min + 1))) .. 'kW'

            for _, v in pairs({'charge_animation', 'discharge_animation'}) do
                if item[v] and item[v].layers then
                    if item[v].layers[1] and item[v].layers[1].layers and item[v].layers[1].layers[1] then
                        item[v].layers[1].layers[1].tint = items['tint'][tier]

                        if item[v].layers[1].layers[1].hr_version then
                            item[v].layers[1].layers[1].hr_version.tint = items['tint'][tier]
                        end
                    end

                    if item[v].layers[2] then
                        item[v].layers[2].tint = items['tint'][tier]

                        if item[v].layers[2].hr_version then
                            item[v].layers[2].hr_version.tint = items['tint'][tier]
                        end
                    end
                end
            end

        elseif (source.type == 'solar-panel') then
            if (source.ref_name == 'solar-panel') then
                item.production = (source.base * (4 ^ (tier - source.min + 1))) .. 'kW'

            elseif (source.ref_name == 'se-space-solar-panel') then
                item.production = (source.base * (4 ^ (tier - source.min + 2))) .. 'kW'
            end

        elseif (source.type == 'boiler') then
            if settings.startup['PHI-MI-PIPE'].value then
                item.fluid_box.height = settings.startup['PHI-MI-PIPE'].value
                item.output_fluid_box.height = settings.startup['PHI-MI-PIPE'].value
                item.output_fluid_box.base_level = item.output_fluid_box.base_level + settings.startup['PHI-MI-PIPE'].value
            end

            item.energy_consumption = source.base * tier .. 'kW'
            item.target_temperature = 15 + (source.temp * tier)
            item.fluid_usage_per_tick = source.fluid

            if (source.name == 'heat-exchanger') then
                item.energy_source.min_working_temperature = 15 + (source.temp * tier)
                item.energy_source.max_temperature = source.temp * (tier + 1)
                item.energy_source.max_transfer = 2000 + (2000 * tier) .. 'MW'
            end

        elseif (source.type == 'generator') then
            if settings.startup['PHI-MI-PIPE'].value then
                item.fluid_box.height = settings.startup['PHI-MI-PIPE'].value
            end

            if source.name == 'kr-gas-power-station' then
                item.fluid_usage_per_tick = source.base * tier
                item.max_power_output = (tonumber(string.match(item.max_power_output, '[%d%.]+')) * (tier - source.min + 2)) .. 'kW'

            else
                item.maximum_temperature = 15 + (source.base * tier)
                item.fluid_usage_per_tick = source.fluid
            end

        elseif (source.type == 'reactor') then
            item.consumption = source.base * tier .. 'MW'
            item.neighbour_bonus = source.bonus
            item.heat_buffer.max_temperature = source.temp * (tier + 1)
            item.heat_buffer.max_transfer = source.temp * (tier + 1) * 0.02 .. 'GW'

            tint_handle(item, tier, {'connection_patches_connected', 'connection_patches_disconnected', 'heat_connection_patches_connected', 'heat_connection_patches_disconnected', 'lower_layer_picture'})

        elseif (source.type == 'heat-pipe') then
            item.heat_buffer.max_temperature = source.temp * (tier + 1)
            item.heat_buffer.max_transfer = source.temp * (tier + 1) * 0.01 .. 'GW'

            tint_handle(item, tier, {'connection_sprites', 'heat_glow_sprites'})
        end
    end

    if (source.type == 'lab') then
        item.researching_speed = item.researching_speed * (2 ^ (tier - source.min + 1))

        for _, v in pairs({{['a'] = 'on_animation', ['n'] = 3}, {['a'] = 'off_animation', ['n'] = 2}}) do
            if item[v['a']] and item[v['a']].layers then
                for i=1, v['n'], 1 do
                    if item[v['a']].layers[i] then
                        item[v['a']].layers[i].tint = items['tint'][tier]

                        if item[v['a']].layers[i].hr_version then
                            item[v['a']].layers[i].hr_version.tint = items['tint'][tier]
                        end
                    end
                end
            end
        end

    elseif (source.type == 'mining-drill') then
        item.mining_speed = item.mining_speed * (2 ^ (tier - source.min + 1))

        for _, e in pairs({'graphics_set', 'wet_mining_graphics_set'}) do
            if item[e] and item[e].animation then
                for _, d in pairs(item[e].animation) do
                    if d.layers then
                        d.layers[1].tint = items['tint'][tier]
                        d.layers[2].tint = items['tint'][tier]

                        if d.layers[1].hr_version then
                            d.layers[1].hr_version.tint = items['tint'][tier]
                        end

                        if d.layers[2].hr_version then
                            d.layers[2].hr_version.tint = items['tint'][tier]
                        end
                    end
                end
            end
        end

    elseif source.type == 'radar' then
        item.max_distance_of_sector_revealed = item.max_distance_of_sector_revealed + (2 * tier)
        item.max_distance_of_nearby_sector_revealed = item.max_distance_of_nearby_sector_revealed + (2 * tier)

    elseif (source.type == 'rocket-silo') then
        local eu = tonumber(string.match(item.active_energy_usage, '[%d%.]+'))
        local euu = string.match(item.active_energy_usage, '%a+')
        item.active_energy_usage = eu * (2 ^ (tier - source.min + 1)) .. euu
        item.rocket_parts_required = 200 * (tier - source.min + 1)
        item.rocket_result_inventory_size = math.ceil(data.raw['item']['satellite'].rocket_launch_product[2] * 3 * (tier - source.min + 1) / data.raw['tool']['space-science-pack'].stack_size)

        tint_handle(item, tier, {'arm_01_back_animation', 'arm_02_right_animation', 'arm_03_front_animation', 'base_day_sprite', 'base_front_sprite', 'door_back_sprite', 'door_front_sprite', 'hole_sprite', 'rocket_glow_overlay_sprite', 'rocket_shadow_overlay_sprite', 'satellite_animation'})
    end

    if item.crafting_speed then
        item.crafting_speed = item.crafting_speed * (2 ^ (tier - source.min + 1))
    end
    if item.energy_source then
        if item.energy_source.emissions_per_minute then
            if source.tech == 'compound-energy' then
                if (source.type == 'boiler') then
                    item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (tier - source.min + 2)

                else
                    item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - source.min + 1))
                end

            else
                item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - source.min + 1))
            end
        end
    end

    if source.name == 'electric-filter-furnace' then
        item.type = 'assembling-machine'
    end

    tint_handle(item, tier, {'picture', 'pictures', 'animation', 'horizontal_animation', 'vertical_animation', 'structure', 'integration_patch'})

    if item.idle_animation and item.idle_animation.layers then
        local i = 1

        while i < #item.idle_animation.layers do
            if item.idle_animation.layers[i] then
                item.idle_animation.layers[i].tint = items['tint'][tier]

                if item.idle_animation.layers[i].hr_version then
                    item.idle_animation.layers[i].hr_version.tint = items['tint'][tier]
                end
            end

            i = i + 2

            if not item.idle_animation.layers[i] then
                break
            end
        end
    end

    if item.base_picture and item.base_picture.sheets then
        item.base_picture.sheets[1].tint = items['tint'][tier]

        if item.base_picture.sheets[1].hr_version then
            item.base_picture.sheets[1].hr_version.tint = items['tint'][tier]
        end
    end

    data:extend({item})
end

-- equipment
function main.EEQ(source, tier)
    local item = {}

    item['name'] = source.name .. '-mk' .. tier .. '-equipment'
    item['type'] = source.type
    item['categories'] = {'armor'}

    local w = 1
    local h = 1

    if (source.name == 'solar-panel') then
        item['power'] = (source.base * (2 ^ (tier - source.min + 1))) .. 'kW'
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-output'}

    elseif (source.name == 'battery') then
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'tertiary', buffer_capacity= (source.base * (2 ^ (tier - source.min + 1))) .. 'MJ'}

    elseif (source.name == 'fusion-reactor') then
        w = 4
        h = 4
        item['power'] = (source.base * (2 ^ (tier - source.min + 1))) .. 'kW'
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-output'}

    elseif (source.name == 'personal-laser-defense') then
        w = 2
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'secondary-input', buffer_capacity = (250 * (2 ^ (tier - source.min + 1))) .. 'kJ'}
        -- item['source_direction_count'] = 64
        -- item['source_offset'] = {0, -3.423489 / 4}
        item['attack_parameters'] = {type = 'beam', cooldown = 40, range = (18 + tier), damage_modifier = (source.base * (2 ^ (tier - source.min + 1))), ammo_type = {category = 'laser', energy_consumption = (50 * (2 ^ (tier - 1))) .. 'kJ', action = {type = 'direct', action_delivery = {type = 'beam', beam = 'laser-beam', max_length = (18 + tier), duration = 60, source_offset = {0, -1.31439}}}}}
        item['automatic'] = true

    elseif (source.name == 'energy-shield') then
        w = 2
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-input', input_flow_limit = (source.base * 4 * (2 ^ (tier - source.min + 1))) .. 'kW', buffer_capacity = (source.base * 2 * (2 ^ (tier - 1))) .. 'kJ'}
        item['max_shield_value'] = (source.base * (2 ^ (tier - 2)))
        item['energy_per_shield'] = '80kJ'

    elseif (source.name == 'personal-roboport') then
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

    elseif (source.name == 'night-vision') then
        w = 2
        h = 2
        item['energy_source'] = {type = 'electric', usage_priority = 'primary-input', buffer_capacity = '240kJ'}
        item['energy_input'] = '20kW'
        item['activate_sound'] = {filename = '__base__/sound/nightvision-on.ogg', volume = 0.5}
        item['deactivate_sound'] = {filename = '__base__/sound/nightvision-off.ogg', volume = 0.5}
        item['darkness_to_turn_on'] = 0
        item['color_lookup'] = {{0, '__core__/graphics/color_luts/lut-sunset.png'}}

    elseif (source.name == 'exoskeleton') then
        w = 2
        h = 4
        item['energy_source'] = {type = 'electric', usage_priority = 'secondary-input', buffer_capacity = '10MJ'}
        item['energy_consumption'] = '400kW'
        item['movement_bonus'] = source.base
    end

    item['shape'] = {width = w, height = h, type = 'full'}
    item['sprite'] = {
        filename = '__base__/graphics/equipment/' .. source.graphics_name .. '.png',
        width = w * 32,
        height = h * 32,
        priority = 'medium',
        tint = items['tint'][tier],
        hr_version = {
            filename = '__base__/graphics/equipment/hr-' .. source.graphics_name .. '.png',
            width = w * 64,
            height = h * 64,
            priority = 'medium',
            scale = 0.5,
            tint = items['tint'][tier]
        }
    }

    data:extend({item})
end

-- item
function main.EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.ref_name])

    if source.category == 'equipment' then
        item['name'] = source.name .. '-mk' .. tier .. '-equipment'
        item.placed_as_equipment_result = source.name .. '-mk' .. tier .. '-equipment'

    else
        if tier > 1 then
            item.name = source.name .. '-' .. tier
            item.place_result = source.name .. '-' .. tier

        else
            item.name = source.name
            item.place_result = source.name
        end
    end

    if item.icons and item.icons[1] then
        item.icons[1].tint = items['tint'][tier]

    elseif item.icon then
        item.icons = {
            {
                icon = item.icon,
                tint = items['tint'][tier]
            }
        }

        item.icon = nil

        if item.icon_size then
            item.icons[1].icon_size = item.icon_size
            item.icon_size = nil
        end

        if item.icon_mipmaps then
            item.icons[1].icon_mipmaps = item.icon_mipmaps
            item.icon_mipmaps = nil
        end
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
        if (tier == 2) then
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

    if (source.tech == 'compound-energy') then
        if (source.type == 'solar-panel') or (source.type == 'accumulator') then
            data:extend({{
                type = 'recipe',
                name = new_name ,
                energy_required = 2,
                enabled = false,
                ingredients = {{name=ingredient_name, amount=4}},
                result = result_name,
            }})

        else
            if tier > 2 then
                data:extend({{
                    type = 'recipe',
                    name = new_name ,
                    energy_required = 2,
                    enabled = false,
                    ingredients = {{name=ingredient_name, amount=1}, {name=source.name, amount=1}},
                    result = result_name,
                }})

            else
                data:extend({{
                    type = 'recipe',
                    name = new_name ,
                    energy_required = 2,
                    enabled = false,
                    ingredients = {{name=ingredient_name, amount=2}},
                    result = result_name,
                }})
            end
        end

    else
        data:extend({{
            type = 'recipe',
            name = new_name,
            energy_required = 2,
            enabled = false,
            ingredients = {{name=ingredient_name, amount=2}},
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
                    count = 200 * (tier - 1),
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
        local recipe_name = source.name

        if source.category == 'equipment' then
            recipe_name = recipe_name .. '-mk' .. tier .. '-equipment'

        else
            recipe_name = recipe_name .. '-' .. tier
        end

        table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=recipe_name})

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

-- fast replace group
function main.EL(source)
    if not data.raw[source.type][source.ref_name].fast_replaceable_group then
        data.raw[source.type][source.ref_name].fast_replaceable_group = source.ref_name
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
