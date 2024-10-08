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

    if source.tech == 'compound-energy' then
        if (source.type == 'accumulator') then
            item.energy_source.buffer_capacity = tostring(tonumber(string.match(item.energy_source.buffer_capacity, '[%d%.]+')) * (4 ^ (tier - source.min + 1))) .. string.match(item.energy_source.buffer_capacity, '%a+')
            item.energy_source.input_flow_limit = tostring(tonumber(string.match(item.energy_source.input_flow_limit, '[%d%.]+')) * (4 ^ (tier - source.min + 1))) .. string.match(item.energy_source.input_flow_limit, '%a+')
            item.energy_source.output_flow_limit = tostring(tonumber(string.match(item.energy_source.output_flow_limit, '[%d%.]+')) * (4 ^ (tier - source.min + 1))) .. string.match(item.energy_source.output_flow_limit, '%a+')

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
                item.production = tostring(tonumber(string.match(item.production, '[%d%.]+')) * (4 ^ (tier - source.min + 1))) .. string.match(item.production, '%a+')


            elseif (source.ref_name == 'se-space-solar-panel') then
                item.production = tostring(tonumber(string.match(item.production, '[%d%.]+')) * (4 ^ (tier - source.min + 2))) .. string.match(item.production, '%a+')
            end

        elseif (source.type == 'boiler') then
            item.energy_consumption = tostring(tonumber(string.match(item.energy_consumption, '[%d%.]+')) * tier) .. string.match(item.energy_consumption, '%a+')
            item.target_temperature = 15 + ((item.target_temperature - 15) * tier)

            if (source.name == 'heat-exchanger') then
                item.energy_source.min_working_temperature = 15 + ((item.energy_source.min_working_temperature - 15) * tier)
                item.energy_source.max_temperature = item.energy_source.max_temperature * tier
                item.energy_source.max_transfer = tostring(tonumber(string.match(item.energy_source.max_transfer, '[%d%.]+')) * tier) .. string.match(item.energy_source.max_transfer, '%a+')
            end

        elseif (source.type == 'generator') then
            if item.max_power_output then
                item.max_power_output = (tonumber(string.match(item.max_power_output, '[%d%.]+')) * (tier - source.min + 2)) .. string.match(item.max_power_output, '%a+')
            end

            if source.name == 'kr-gas-power-station' then
                item.fluid_usage_per_tick = item.fluid_usage_per_tick * (tier - source.min + 2)

            else
                item.maximum_temperature = 15 + ((item.maximum_temperature - 15) * tier)
            end

        elseif (source.type == 'reactor') then
            item.consumption = tostring(tonumber(string.match(item.consumption, '[%d%.]+')) * tier) .. string.match(item.consumption, '%a+')
            item.heat_buffer.max_temperature = item.heat_buffer.max_temperature * tier
            item.heat_buffer.max_transfer = tostring(tonumber(string.match(item.heat_buffer.max_transfer, '[%d%.]+')) * tier)  .. string.match(item.heat_buffer.max_transfer, '%a+')

            tint_handle(item, tier, {'connection_patches_connected', 'connection_patches_disconnected', 'heat_connection_patches_connected', 'heat_connection_patches_disconnected', 'lower_layer_picture'})

        elseif (source.type == 'heat-pipe') then
            item.heat_buffer.max_temperature = item.heat_buffer.max_temperature * tier
            item.heat_buffer.max_transfer = tostring(tonumber(string.match(item.heat_buffer.max_transfer, '[%d%.]+')) * tier)  .. string.match(item.heat_buffer.max_transfer, '%a+')

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
        item.rocket_parts_required = item.rocket_parts_required * (tier - source.min + 2)
        item.rocket_result_inventory_size = math.ceil(data.raw['item']['satellite'].rocket_launch_product[2] * 3 * (tier - source.min + 1) / data.raw['tool']['space-science-pack'].stack_size)

        tint_handle(item, tier, {'arm_01_back_animation', 'arm_02_right_animation', 'arm_03_front_animation', 'base_day_sprite', 'base_front_sprite', 'door_back_sprite', 'door_front_sprite', 'hole_sprite', 'rocket_glow_overlay_sprite', 'rocket_shadow_overlay_sprite', 'satellite_animation'})
    end

    if item.crafting_speed then
        item.crafting_speed = item.crafting_speed * (2 ^ (tier - source.min + 1))
    end
    if item.energy_source then
        if item.energy_source.emissions_per_minute then
            if source.tech == 'compound-energy' then
                if (source.type == 'boiler') or (source.name == 'kr-gas-power-station') then
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

    if tier > 1 then
        item.localised_name = {'phi-cl.combine', {'name.' .. source.ref_name}, tier}

    else
        item.localised_name = {'name.' .. source.ref_name}
    end

    item.localised_description = {'description.' .. source.ref_name}

    data:extend({item})
end

-- equipment
function main.EEQ(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])

    item.name = source.name .. '-mk' .. tier .. '-equipment'

    if item.power then
        item.power = tostring(tonumber(string.match(item.power, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.power, '%a+')
    end

    if item.energy_source then
        if item.energy_source.buffer_capacity then
            item.energy_source.buffer_capacity = tostring(tonumber(string.match(item.energy_source.buffer_capacity, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_source.buffer_capacity, '%a+')
        end

        if item.energy_source.input_flow_limit then
            item.energy_source.input_flow_limit = tostring(tonumber(string.match(item.energy_source.input_flow_limit, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_source.input_flow_limit, '%a+')
        end
    end

    if item.energy_consumption then
        item.energy_consumption = tostring(tonumber(string.match(item.energy_consumption, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_consumption, '%a+')

    elseif item.energy_input then
        item.energy_input = tostring(tonumber(string.match(item.energy_input, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_input, '%a+')
    end

    if item.darkness_to_turn_on and item.color_lookup then
        item.darkness_to_turn_on = 0
        item.color_lookup = {{0, '__core__/graphics/color_luts/lut-sunset.png'}}

    elseif item.attack_parameters then
        if item.attack_parameters.cooldown then
            item.attack_parameters.cooldown = math.floor(item.attack_parameters.cooldown * ((32 - tier) / 32))
        end

        if item.attack_parameters.damage_modifier then
            item.attack_parameters.damage_modifier = item.attack_parameters.damage_modifier * (2 ^ (tier - source.min + 1))
        end

        if item.attack_parameters.ammo_type then
            if item.attack_parameters.ammo_type.energy_consumption then
                item.attack_parameters.ammo_type.energy_consumption = tostring(tonumber(string.match(item.attack_parameters.ammo_type.energy_consumption, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.attack_parameters.ammo_type.energy_consumption, '%a+')
            end

            if item.attack_parameters.ammo_type.action_delivery then

                if item.attack_parameters.ammo_type.action_delivery then
                    item.attack_parameters.ammo_type.action_delivery.max_length = item.attack_parameters.ammo_type.action_delivery.max_length + tier - 1
                end
            end
        end

        if item.attack_parameters.range then
            item.attack_parameters.range = item.attack_parameters.range + tier - 1
        end

    elseif item.max_shield_value and item.energy_per_shield then
        item.max_shield_value = item.max_shield_value * (2 ^ (tier - source.min + 1))
        item.energy_per_shield = math.floor(item.energy_per_shield * ((32 - tier) / 32))

    elseif item.movement_bonus then
        item.movement_bonus = item.movement_bonus * (2 ^ (tier - source.min + 1))

    elseif item.charging_energy and item.charging_station_count then
        item.charging_energy = tostring(tonumber(string.match(item.charging_energy, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.charging_energy, '%a+')
        item.charging_station_count = math.max(item.charging_station_count, 8)
    end

    if item.sprite then
        item.sprite.tint = items['tint'][tier]

        if item.sprite.hr_version then
            item.sprite.hr_version.tint = items['tint'][tier]
        end
    end

    item.localised_name = {'phi-cl.combine-gen', {'name.' .. source.ref_name}, tier}
    item.localised_description = {'description.' .. source.ref_name}

    data:extend({item})
end

-- item
function main.EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.ref_name])

    if source.category == 'equipment' then
        item.name = source.name .. '-mk' .. tier .. '-equipment'
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

    if tier > 1 then
        item.localised_name = {'phi-cl.combine', {'name.' .. source.ref_name}, tier}

    else
        item.localised_name = {'name.' .. source.ref_name}
    end

    item.localised_description = {'description.' .. source.ref_name}

    data:extend({item})
end

-- recipe
function main.ER(source, tier)
    local new_name = source.name
    local ingredient_name = source.name
    local result_name = source.name
    local localised_name
    local localised_description = {'description.' .. source.ref_name}

    if source.category == 'equipment' then
        if (tier == 2) then
            ingredient_name = ingredient_name .. '-equipment'

        else
            ingredient_name = ingredient_name .. '-mk' .. (tier - 1) .. '-equipment'
        end

        new_name = new_name .. '-mk' .. tier .. '-equipment'
        result_name = result_name .. '-mk' .. tier .. '-equipment'

        localised_name = {'phi-cl.combine-gen', {'name.' .. source.ref_name}, tier}

    else
        if tier > 2 then
            ingredient_name = ingredient_name .. '-' .. (tier - 1)
        end

        new_name = new_name .. '-' .. tier
        result_name = result_name .. '-' .. tier

        if tier > 1 then
            localised_name = {'phi-cl.combine', {'name.' .. source.ref_name}, tier}

        else
            localised_name = {'name.' .. source.ref_name}
        end
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
                localised_name = localised_name,
                localised_description = localised_description
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
                    localised_name = localised_name,
                    localised_description = localised_description
                }})

            else
                data:extend({{
                    type = 'recipe',
                    name = new_name ,
                    energy_required = 2,
                    enabled = false,
                    ingredients = {{name=ingredient_name, amount=2}},
                    result = result_name,
                    localised_name = localised_name,
                    localised_description = localised_description
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
            localised_name = localised_name,
            localised_description = localised_description
        }})
    end
end

-- technology
function main.ET(source, tier)
    if (source.tech == 'compound-energy') then
        table.insert(data.raw.technology['compound-energy-' .. (tier - 1)].effects, {type='unlock-recipe', recipe=source.name .. '-' .. tier})

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

-- entity category
function main.EEEC(source, tier)
    local category_name = source.type

    if source.name == 'electric-filter-furnace' then
        category_name = 'assembling-machine'
    end

    local item_name = source.name .. '-' .. tier

    if not data.raw[category_name][source.ref_name] then
        return
    end

    if data.raw[category_name][source.ref_name].crafting_categories then
        data.raw[category_name][item_name].crafting_categories = {}

        for i=1, #data.raw[category_name][source.ref_name].crafting_categories do
            table.insert(data.raw[category_name][item_name].crafting_categories, data.raw[category_name][source.ref_name].crafting_categories[i])
        end
    end

    if data.raw[category_name][source.ref_name].resource_categories then
        data.raw[category_name][item_name].resource_categories = {}

        for i=1, #data.raw[category_name][source.ref_name].resource_categories do
            table.insert(data.raw[category_name][item_name].resource_categories, data.raw[category_name][source.ref_name].resource_categories[i])
        end
    end

    if data.raw[category_name][source.ref_name].fuel_categories then
        data.raw[category_name][item_name].fuel_categories = table.deepcopy(data.raw[category_name][source.ref_name].fuel_categories)
    end

    if data.raw[category_name][source.ref_name].allowed_effects then
        data.raw[category_name][item_name].allowed_effects = table.deepcopy(data.raw[category_name][source.ref_name].allowed_effects)
    end
end

return main
