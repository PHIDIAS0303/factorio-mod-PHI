local items = require 'config'
local main = {}

local function tint_handle(item, tier, tl)
    for _, ve in pairs(tl) do
        if item[ve] then
            for _, tc in pairs({'layers', 'sheets', 'structure', 'frames'}) do
                if item[ve][tc] and type(item[ve][tc]) == 'table' then
                    for _, v2 in pairs(item[ve][tc]) do
                        v2.tint = items['tint'][tier]

                        if v2.frames then
                            for _, v3 in pairs(v2.frames) do
                                v3.tint = items['tint'][tier]
                            end
                        end
                    end
                end
            end

            item[ve].tint = items['tint'][tier]
        end
    end
end

-- entity
function main.EEE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])
    item.name = source.name .. '-' .. tier
    item.minable.result = item.name
    item.max_health = item.max_health * (tier - source.min + 2)
    item.next_upgrade = ((tier < source.max) and source.name .. '-' .. (tier + 1)) or nil
    item.production = item.production and (((source.tech == 'compound-energy' and source.type == 'solar-panel') and (tonumber(string.match(item.production, '[%d%.]+')) * (settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value ^ (tier - source.min + 1)) .. (string.match(item.production, '%a+') or ''))) or (tonumber(string.match(item.production, '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. (string.match(item.production, '%a+') or ''))) or nil

    for _, v in pairs({'researching_speed', 'mining_speed', 'crafting_speed'}) do
        if item[v] then
            item[v] = tonumber(string.match(item[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1))
        end
    end

    for _, v in pairs({'energy_usage', 'heating_energy', 'crane_energy_usage', 'energy_per_shot'}) do
        if not (source.tech == 'compound-energy' and (source.type == 'solar-panel' or source.type == 'accumulator')) and item[v] then
            item[v] = (tonumber(string.match(item[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. (string.match(item[v], '%a+') or '')
        end
    end

    if item.energy_source then
        for _, v in pairs({'buffer_capacity', 'input_flow_limit', 'output_flow_limit'}) do
            if not (source.tech == 'compound-energy' and (source.type == 'solar-panel' or source.type == 'accumulator')) and item[v] then
                item.energy_source[v] = tonumber(string.match(item.energy_source[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. string.match(item.energy_source[v], '%a+')
            end
        end

        if item.energy_source.emissions_per_minute then
            local m = ((source.tech == 'compound-energy' and ((source.type == 'boiler') or (source.name == 'kr-gas-power-station'))) and (tier - source.min + 2)) or (2 ^ (tier - source.min + 1))

            for k, _ in pairs(item.energy_source.emissions_per_minute) do
                item.energy_source.emissions_per_minute[k] = item.energy_source.emissions_per_minute[k] * (tier - source.min + 2)
            end
        end
    end

    if (source.type == 'electric-turret') or (source.type == 'ammo-turret') or (source.type == 'fluid-turret') then
        if item.attack_parameters then
            item.attack_parameters.damage_modifier = 2 ^ (tier - source.min + 1)
            item.attack_parameters.range = item.attack_parameters.range + (2 * (tier - source.min + 1))
            item.attack_parameters.cooldown = (item.attack_parameters.cooldown and (item.attack_parameters.cooldown * ((24 - tier + source.min) / 25))) or nil
        end

        item.call_for_help_radius = (item.call_for_help_radius and (item.call_for_help_radius + (2 * (tier - source.min + 1)))) or nil

        if source.type == 'electric-turret' then
            item.glow_light_intensity = 1

            if item.attack_parameters then
                item.attack_parameters.damage_modifier = (item.attack_parameters.damage_modifier and (item.attack_parameters.damage_modifier * 2)) or nil

                if item.attack_parameters.ammo_type then
                    item.attack_parameters.ammo_type.action.action_delivery.max_length = ((item.attack_parameters.ammo_type.action and item.attack_parameters.ammo_type.action.action_delivery and item.attack_parameters.ammo_type.action.action_delivery.max_length) and (item.attack_parameters.ammo_type.action.action_delivery.max_length + (2 * (tier - source.min + 1)))) or nil
                    item.attack_parameters.ammo_type.energy_consumption = (item.attack_parameters.ammo_type.energy_consumption and (tonumber(string.match(item.attack_parameters.ammo_type.energy_consumption, '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. string.match(item.attack_parameters.ammo_type.energy_consumption, '%a+'))) or nil
                end
            end

        elseif source.type == 'fluid-turret' then
            item.prepare_range = item.prepare_range + (2 * (tier - source.min + 1))
        end
    end

    if source.tech == 'compound-energy' then
        if (source.type == 'accumulator') and item['chargable_graphics'] then
            if item['chargable_graphics']['picture'].layers and item['chargable_graphics']['picture'].layers[1] then
                item['chargable_graphics']['picture'].layers[1].tint = items['tint'][tier]
            end

            for _, v in pairs({item['chargable_graphics']['charge_animation'], item['chargable_graphics']['discharge_animation']}) do
                if v.layers and v.layers[1] and v.layers[1].layers and v.layers[1].layers[1] then
                    v.layers[1].layers[1].tint = items['tint'][tier]
                end
            end

            for _, v in pairs({'buffer_capacity', 'input_flow_limit', 'output_flow_limit'}) do
                item.energy_source[v] = (item.energy_source[v] and (tonumber(string.match(item.energy_source[v], '[%d%.]+')) * (settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value ^ (tier - source.min + 1)) .. string.match(item.energy_source[v], '%a+'))) or nil
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
            item.max_power_output = (item.max_power_output and (tonumber(string.match(item.max_power_output, '[%d%.]+')) * (tier - source.min + 2)) .. string.match(item.max_power_output, '%a+')) or nil
            item.maximum_temperature = (item.maximum_temperature and 15 + ((item.maximum_temperature - 15) * tier)) or nil

        elseif (source.type == 'reactor') then
            item.consumption = tostring(tonumber(string.match(item.consumption, '[%d%.]+')) * tier) .. string.match(item.consumption, '%a+')
            item.heat_buffer.max_temperature = item.heat_buffer.max_temperature * tier
            item.heat_buffer.max_transfer = tostring(tonumber(string.match(item.heat_buffer.max_transfer, '[%d%.]+')) * tier)  .. string.match(item.heat_buffer.max_transfer, '%a+')
            tint_handle(item, tier, {'connection_patches_connected', 'connection_patches_disconnected', 'heat_connection_patches_connected', 'heat_connection_patches_disconnected', 'lower_layer_picture'})

        elseif (source.type == 'fusion-reactor') then
            item.power_input = tostring(tonumber(string.match(item.power_input, '[%d%.]+')) * tier) .. string.match(item.power_input, '%a+')
            item.max_fluid_usage = item.max_fluid_usage * tier

        elseif (source.type == 'fusion-generator') then
            item.energy_source.output_flow_limit = tostring(tonumber(string.match(item.energy_source.output_flow_limit, '[%d%.]+')) * tier) .. string.match(item.energy_source.output_flow_limit, '%a+')
            item.max_fluid_usage = item.max_fluid_usage * tier

        elseif (source.type == 'heat-pipe') then
            item.heat_buffer.max_temperature = item.heat_buffer.max_temperature * tier
            item.heat_buffer.max_transfer = tostring(tonumber(string.match(item.heat_buffer.max_transfer, '[%d%.]+')) * tier)  .. string.match(item.heat_buffer.max_transfer, '%a+')
            tint_handle(item, tier, {'connection_sprites', 'heat_glow_sprites'})
        end
    end

    if (source.type == 'lab') then
        for _, v in pairs({{['a'] = 'on_animation', ['n'] = 3}, {['a'] = 'off_animation', ['n'] = 2}}) do
            if item[v['a']] and item[v['a']].layers then
                for i=1, v['n'], 1 do
                    if item[v['a']].layers[i] then
                        item[v['a']].layers[i].tint = items['tint'][tier]
                    end
                end
            end
        end

    elseif (source.type == 'mining-drill') then
        for _, e in pairs({'graphics_set', 'wet_mining_graphics_set'}) do
            if item[e] and item[e].animation then
                for _, d in pairs(item[e].animation) do
                    if d.layers then
                        d.layers[1].tint = items['tint'][tier]
                        d.layers[2].tint = items['tint'][tier]
                    end
                end
            end
        end

    elseif source.type == 'radar' then
        item.max_distance_of_sector_revealed = item.max_distance_of_sector_revealed + (2 * (tier - source.min + 1))
        item.max_distance_of_nearby_sector_revealed = item.max_distance_of_nearby_sector_revealed + (2 * (tier - source.min + 1))

    elseif source.type == 'thruster' then
        for _, v in pairs({'min_performance', 'max_performance'}) do
            item[v].fluid_usage = (item[v].fluid_usage and item[v].fluid_usage * (2 ^ (tier - source.min + 1))) or nil
        end

    elseif source.type == 'reactor' and source.name == 'heating-tower' then
        item.consumption = tostring(tonumber(string.match(item.consumption, '[%d%.]+')) * tier) .. string.match(item.consumption, '%a+')

    elseif source.type == 'agricultural-tower' then
        item.radius = item.radius + (1 * (tier - source.min + 1))
    end

    tint_handle(item, tier, {'picture', 'pictures', 'animation', 'structure', 'integration_patch', 'horizontal_animation', 'vertical_animation'})

    for _, v in pairs({'graphics_set', 'graphics_set_flipped'}) do
        if item[v] then
            tint_handle(item[v], tier, {'animation', 'idle_animation', 'frozen_patch'})

            if item[v].working_visualisations then
                tint_handle(item[v].working_visualisations, tier, {'north_animation', 'east_animation', 'south_animation', 'west_animation', 'animation'})
            end
        end
    end

    if item.idle_animation and item.idle_animation.layers then
        local i = 1

        while i < #item.idle_animation.layers do
            if item.idle_animation.layers[i] then
                item.idle_animation.layers[i].tint = items['tint'][tier]
            end

            i = i + 2

            if not item.idle_animation.layers[i] then
                break
            end
        end
    end

    if item.base_picture and item.base_picture.sheets then
        item.base_picture.sheets[1].tint = items['tint'][tier]
    end

    item.localised_name = (tier > 1 and {'phi-cl.combine', {'?', {'entity-name.' .. source.ref_name}, {'name.' .. source.ref_name}}, tostring(tier)}) or {'?', {'entity-name.' .. source.ref_name}, {'name.' .. source.ref_name}}
    item.localised_description = {'?', {'entity-description.' .. source.ref_name}, {'description.' .. source.ref_name}}

    data:extend({item})
end

-- equipment
function main.EEQ(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])
    item.name = source.name .. '-mk' .. tier .. '-equipment'
    item.take_result = item.name

    for _, v in pairs({'power', 'energy_consumption', 'energy_input', 'charging_energy'}) do
        item[v] = (item[v] and tostring(tonumber(string.match(item[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item[v], '%a+')) or nil
    end

    if item.energy_source then
        for _, v in pairs({'buffer_capacity', 'input_flow_limit', 'output_flow_limit'}) do
            item.energy_source[v] = (item.energy_source[v] and tostring(tonumber(string.match(item.energy_source[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_source[v], '%a+')) or nil
        end
    end

    for _, v in pairs({'max_shield_value', 'movement_bonus', 'inventory_size_bonus'}) do
        item[v] = (item[v] and item[v] * (2 ^ (tier - source.min + 1))) or nil
    end

    if item.darkness_to_turn_on and item.color_lookup then
        item.darkness_to_turn_on = 0
        item.color_lookup = {{0, '__core__/graphics/color_luts/lut-sunset.png'}}
    end

    if item.attack_parameters then
        item.attack_parameters.cooldown = (item.attack_parameters.cooldown and item.attack_parameters.cooldown * ((24 - tier + source.min) / 25)) or nil
        item.attack_parameters.damage_modifier = (item.attack_parameters.damage_modifier and item.attack_parameters.damage_modifier * (2 ^ (tier - source.min + 1))) or nil
        item.attack_parameters.range = (item.attack_parameters.range and item.attack_parameters.range + (tier - source.min + 1)) or nil

        if item.attack_parameters.ammo_type then
            item.attack_parameters.ammo_type.energy_consumption = (item.attack_parameters.ammo_type.energy_consumption and tostring(tonumber(string.match(item.attack_parameters.ammo_type.energy_consumption, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.attack_parameters.ammo_type.energy_consumption, '%a+')) or nil

            if item.attack_parameters.ammo_type.action_delivery then
                item.attack_parameters.ammo_type.action_delivery.max_length = item.attack_parameters.ammo_type.action_delivery.max_length + (tier - source.min + 1)
            end
        end
    end

    if item.sprite then
        item.sprite.tint = items['tint'][tier]
    end

    item.localised_name = (tier > 1 and {'phi-cl.combine', {'?', {'item-name.' .. source.ref_name}, {'name.' .. source.ref_name}}, tostring(tier)}) or {'?', {'item-name.' .. source.ref_name}, {'name.' .. source.ref_name}}
    item.localised_description = {'?', {'item-description.' .. source.ref_name}, {'description.' .. source.ref_name}}

    if settings.startup['PHI-MB-EQUIPMENT-SIZE'].value then
        item.shape = {width = 1, height = 1, type = 'full', points = {{0, 0}}}
    end

    data:extend({item})
end

-- item
function main.EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.ref_name])
    item.name = (source.category == 'equipment' and (source.name .. '-mk' .. tier .. '-equipment')) or (source.name .. ((tier > 1 and '-' .. tier) or ''))
    item[(source.category == 'equipment' and 'place_as_equipment_result') or 'place_result'] = item.name

    if item.icons and item.icons[1] then
        item.icons[1].tint = items['tint'][tier]

    elseif item.icon then
        item.icons = {{icon = item.icon, tint = items['tint'][tier]}}
        item.icon = nil

        if item.icon_size then
            item.icons[1].icon_size = item.icon_size
            item.icon_size = nil
        end
    end

    item.order = item.order .. tier
    item.localised_name = (tier > 1 and {'phi-cl.combine', {'?', {'entity-name.' .. source.ref_name}, {'item-name.' .. source.ref_name}, {'name.' .. source.ref_name}}, tostring(tier)}) or {'?', {'entity-name.' .. source.ref_name}, {'item-name.' .. source.ref_name}, {'name.' .. source.ref_name}}
    item.localised_description = {'?', {'entity-description.' .. source.ref_name}, {'item-description.' .. source.ref_name}, {'description.' .. source.ref_name}}

    data:extend({item})
end

-- recipe
function main.ER(source, tier)
    local icons = {{icon = data.raw.item[source.ref_name].icon, tint = items['tint'][tier]}}
    local result_name = source.name .. ((source.category == 'equipment' and ('-mk' .. tier .. '-equipment')) or ('-' .. tier))
    local ingredients = {}
    local ingredient_name

    if source.category == 'equipment' then
        ingredient_name = (tier == source.min and source.ref_name) or (source.name .. '-mk' .. (tier - 1) .. '-equipment')

    else
        ingredient_name = (tier > source.min and (source.name .. '-' .. (tier - 1))) or source.ref_name
    end

    if source.tech == 'compound-energy' then
        if source.type == 'solar-panel' or source.type == 'accumulator' then
            table.insert(ingredients, {type = 'item', name = ingredient_name, amount = tonumber(settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value) or 4})

        else
            if tier > source.min then
                table.insert(ingredients, {type = 'item', name = ingredient_name, amount = 1})
                table.insert(ingredients, {type = 'item', name = source.ref_name, amount = 1})


            else
                table.insert(ingredients, {type = 'item', name = source.ref_name, amount = 2})
            end
        end

    else
        table.insert(ingredients, {type = 'item', name = ingredient_name, amount = 2})
    end

    data:extend({{
        type = 'recipe',
        name = result_name,
        icons = icons,
        energy_required = 2,
        enabled = false,
        ingredients = ingredients,
        results = {{type = 'item', name = result_name, amount = 1}},
        main_product = result_name,
        localised_name = {'?', data.raw[source.type][result_name].localised_name, ''},
        localised_description = {'?', data.raw[source.type][result_name].localised_description, ''}
    }})
end

-- technology
function main.ET(source, tier)
    if (source.tech == 'compound-energy') then
        table.insert(data.raw.technology['compound-energy-' .. (tier - 1)].effects, {type='unlock-recipe', recipe=source.name .. '-' .. tier})

    elseif data.raw.technology[source.tech] then
        local recipe_name = (source.category == 'equipment' and (source.name .. '-mk' .. tier .. '-equipment')) or (source.name .. '-' .. tier)
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
    local item_name = source.name .. '-' .. tier

    if not (data.raw[source.type][source.ref_name] and data.raw[source.type][item_name]) then
        return
    end

    if data.raw[source.type][source.ref_name].crafting_categories and data.raw[source.type][item_name].crafting_categories then
        data.raw[source.type][item_name].crafting_categories = {table.unpack(data.raw[source.type][source.ref_name].crafting_categories)}
    end

    if data.raw[source.type][source.ref_name].resource_categories and data.raw[source.type][item_name].resource_categories then
        data.raw[source.type][item_name].resource_categories = {table.unpack(data.raw[source.type][source.ref_name].resource_categories)}
    end

    data.raw[source.type][item_name].fuel_categories = (data.raw[source.type][source.ref_name].fuel_categories and table.deepcopy(data.raw[source.type][source.ref_name].fuel_categories)) or nil
    data.raw[source.type][item_name].allowed_effects = (data.raw[source.type][source.ref_name].allowed_effects and table.deepcopy(data.raw[source.type][source.ref_name].allowed_effects)) or nil
end

return main
