local items = require('mbe-c')

local mod_tint = {
    [2] = {r=140, g=142, b=200},
    [3] = {r=242, g=161, b=26},
    [4] = {r=255, g=254, b=42},
    [5] = {r=54, g=228, b=255},
    [6] = {r=253, g=0, b=97},
    [7] = {r=0, g=209, b=102},
    [8] = {r=233, g=63, b=233}
}

-- MBE C 1 BASE FLUID
if data.raw['fluid'] and data.raw['fluid']['steam'] then
    data.raw['fluid']['steam'].max_temperature = math.max(((settings.startup['PHI-MB-ENERGY'].value > 1) and 5000) or 500, data.raw['fluid']['steam'].max_temperature)
end

-- MBE A 7 BASE RESEARCH
for i = 1, 7 do
    data:extend({{
        type = 'technology',
        name = 'compound-energy-' .. i,
        enabled = (i <= tonumber(settings.startup['PHI-MB-ENERGY'].value)),
        prerequisites = ((i > 1) and {'compound-energy-' .. (i - 1)}) or {'solar-energy', 'advanced-circuit', 'electric-energy-accumulators'},
        effects = {},
        upgrade = true,
        unit = {count = math.floor(125 * (i ^ 2)), ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}, time = 30},
        icons = {{icon = '__base__/graphics/technology/solar-energy.png', icon_size = 256, tint = mod_tint[i]}, {icon = '__base__/graphics/icons/signal/signal_' .. i .. '.png', icon_size = 64, scale = 0.5, shift = {50, 50}}},
        order = 'a-h-' .. i,
        localised_name = {'phi-cl.combine', {'technology-name.compound-energy'}, tostring(i)},
        localised_description = {'technology-description.compound-energy'}
    }})
end

local function tint_handle(item, tier, tl)
    for _, ve in pairs(tl) do
        if item[ve] then
            for _, tc in pairs({'layers', 'sheets', 'structure', 'frames'}) do
                if item[ve][tc] and type(item[ve][tc]) == 'table' then
                    for _, v2 in pairs(item[ve][tc]) do
                        v2.tint = mod_tint[tier]

                        if v2.frames then
                            for _, v3 in pairs(v2.frames) do
                                v3.tint = mod_tint[tier]
                            end
                        end
                    end
                end
            end

            item[ve].tint = mod_tint[tier]
        end
    end
end

function tint_layer(p, t)
    if p and p.layers then
        for _, v in pairs(p.layers) do
            if not v.draw_as_shadow then
                v.tint = mod_tint[t]
            end
        end

        table.insert(p.layers, {icon = '__base__/graphics/icons/signal/signal_' .. t .. '.png', icon_size = 64, scale = 0.25, shift = {12, 12}})
    end
end

function main_entity(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])
    item.name = source.name .. '-' .. tier
    item.minable.result = item.name
    item.max_health = item.max_health * (tier - source.min + 2)
    item.next_upgrade = ((tier < source.max) and source.name .. '-' .. (tier + 1)) or nil
    item.production = item.production and (((source.tech == 'compound-energy' and source.type == 'solar-panel') and (tonumber(string.match(item.production, '[%d%.]+')) * (settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value ^ (tier - source.min + 1)) .. (string.match(item.production, '%a+') or ''))) or (tonumber(string.match(item.production, '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. (string.match(item.production, '%a+') or ''))) or nil

    for _, v in pairs({'energy_usage', 'heating_energy', 'crane_energy_usage', 'energy_per_shot'}) do
        if not (source.tech == 'compound-energy' and (source.type == 'solar-panel' or source.type == 'accumulator')) and item[v] then
            item[v] = (tonumber(string.match(item[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. (string.match(item[v], '%a+') or '')
        end
    end

    if item.energy_source then
        for _, v in pairs({'buffer_capacity', 'input_flow_limit', 'output_flow_limit'}) do
            if not (source.tech == 'compound-energy' and (source.type == 'solar-panel' or source.type == 'accumulator')) and item.energy_source[v] then
                item.energy_source[v] = tonumber(string.match(item.energy_source[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. string.match(item.energy_source[v], '%a+')
            end
        end

        if item.energy_source.emissions_per_minute then
            for k, _ in pairs(item.energy_source.emissions_per_minute) do
                item.energy_source.emissions_per_minute[k] = item.energy_source.emissions_per_minute[k] * (2 ^ (tier - source.min + 1))
            end
        end
    end

    if mods['space-age'] and (not (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP')) then
        if not item.surface_conditions then
            item.surface_conditions = {}
        end

        table.insert(item.surface_conditions, {property = 'gravity', min = 0.01})
    end

    if (source.type == 'accumulator') then
        for _, v in pairs({'buffer_capacity', 'input_flow_limit', 'output_flow_limit'}) do
            item.energy_source[v] = (item.energy_source[v] and (tonumber(string.match(item.energy_source[v], '[%d%.]+')) * (settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value ^ (tier - source.min + 1)) .. string.match(item.energy_source[v], '%a+'))) or nil
        end

    elseif (source.type == 'boiler') then
        item.energy_consumption = tostring(tonumber(string.match(item.energy_consumption, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.energy_consumption, '%a+')
        item.target_temperature = 15 + ((item.target_temperature - 15) * (2 * (tier - source.min + 1)))

        if (source.name == 'heat-exchanger') then
            item.energy_source.min_working_temperature = 15 + ((item.energy_source.min_working_temperature - 15) * (2 * (tier - source.min + 1)))
            item.energy_source.max_temperature = item.energy_source.max_temperature * (2 * (tier - source.min + 1))
            item.energy_source.max_transfer = tostring(tonumber(string.match(item.energy_source.max_transfer, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.energy_source.max_transfer, '%a+')
        end

    elseif (source.type == 'generator') then
        item.max_power_output = (item.max_power_output and (tonumber(string.match(item.max_power_output, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.max_power_output, '%a+')) or nil
        item.maximum_temperature = (item.maximum_temperature and 15 + ((item.maximum_temperature - 15) * (2 * (tier - source.min + 1)))) or nil

    elseif (source.type == 'reactor') then
        item.consumption = tostring(tonumber(string.match(item.consumption, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.consumption, '%a+')
        item.heat_buffer.max_temperature = item.heat_buffer.max_temperature * (2 * (tier - source.min + 1))
        item.heat_buffer.max_transfer = tostring(tonumber(string.match(item.heat_buffer.max_transfer, '[%d%.]+')) * (2 * (tier - source.min + 1)))  .. string.match(item.heat_buffer.max_transfer, '%a+')
        tint_handle(item, tier, {'connection_patches_connected', 'connection_patches_disconnected', 'heat_connection_patches_connected', 'heat_connection_patches_disconnected', 'lower_layer_picture'})

    elseif (source.type == 'fusion-reactor') then
        item.power_input = tostring(tonumber(string.match(item.power_input, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.power_input, '%a+')
        item.max_fluid_usage = item.max_fluid_usage * (2 * (tier - source.min + 1))

    elseif (source.type == 'fusion-generator') then
        item.energy_source.output_flow_limit = tostring(tonumber(string.match(item.energy_source.output_flow_limit, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.energy_source.output_flow_limit, '%a+')
        item.max_fluid_usage = item.max_fluid_usage * (2 * (tier - source.min + 1))

    elseif (source.type == 'heat-pipe') then
        item.heat_buffer.max_temperature = item.heat_buffer.max_temperature * (2 * (tier - source.min + 1))
        item.heat_buffer.max_transfer = tostring(tonumber(string.match(item.heat_buffer.max_transfer, '[%d%.]+')) * (2 * (tier - source.min + 1)))  .. string.match(item.heat_buffer.max_transfer, '%a+')
        tint_handle(item, tier, {'connection_sprites', 'heat_glow_sprites'})
    end

    -- picture: solar-panel
    for _, v in pairs({'picture'}) do
        if item[v] then
            tint_layer(item[v], tier)
        end
    end

    -- chargable_graphics: accumulator
    if item['chargable_graphics'] then
        for _, v in pairs({'picture', 'charge_animation', 'discharge_animation'}) do
            if item['chargable_graphics'][v] then
                tint_layer(item['chargable_graphics'][v], tier)
            end
        end
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
                item.idle_animation.layers[i].tint = mod_tint[tier]
            end

            i = i + 2

            if not item.idle_animation.layers[i] then
                break
            end
        end
    end

    if item.base_picture and item.base_picture.sheets then
        item.base_picture.sheets[1].tint = mod_tint[tier]
    end

    item.localised_name = (tier > 1 and {'phi-cl.combine', {'?', {'entity-name.' .. source.ref_name}, {'name.' .. source.ref_name}}, tostring(tier)}) or {'?', {'entity-name.' .. source.ref_name}, {'name.' .. source.ref_name}}
    item.localised_description = {'?', {'entity-description.' .. source.ref_name}, {'description.' .. source.ref_name}}

    data:extend({item})
end

function main_item(source, tier)
    local item = table.deepcopy(data.raw.item[source.ref_name])
    item.name = source.name .. ((tier > 1 and '-' .. tier) or '')
    item['place_result'] = item.name

    if item.icons and item.icons[1] then
        item.icons[1].tint = mod_tint[tier]

    elseif item.icon then
        item.icons = {{icon = item.icon, icon_size = (item.icon_size and item.icon_size) or nil, tint = mod_tint[tier]}}
        item.icon = nil
    end

    table.insert(item.icons, {icon = '__base__/graphics/icons/signal/signal_' .. tier .. '.png', icon_size = 64, scale = 0.25, shift = {12, 12}})
    item.order = item.order .. tier
    item.localised_name = (tier > 1 and {'phi-cl.combine', {'?', {'entity-name.' .. source.ref_name}, {'equipment-name.' .. source.ref_name}, {'item-name.' .. source.ref_name}, {'name.' .. source.ref_name}}, tostring(tier)}) or {'?', {'entity-name.' .. source.ref_name}, {'equipment-name.' .. source.ref_name}, {'item-name.' .. source.ref_name}, {'name.' .. source.ref_name}}
    item.localised_description = {'?', {'entity-description.' .. source.ref_name}, {'equipment-description.' .. source.ref_name}, {'item-description.' .. source.ref_name}, {'description.' .. source.ref_name}}

    data:extend({item})
end

function main_recipe(source, tier)
    local result_name = source.name .. '-' .. tier

    data:extend({{
        type = 'recipe',
        name = result_name,
        icons = table.deepcopy(data.raw.item[source.ref_name].icons),
        energy_required = 2,
        enabled = false,
        ingredients = {{type = 'item', name = (tier > source.min and (source.name .. '-' .. (tier - 1))) or source.ref_name, amount = ((source.tech == 'compound-energy' and (source.type == 'solar-panel' or source.type == 'accumulator')) and tonumber(settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value) or 4) or 2}},
        results = {{type = 'item', name = result_name, amount = 1}},
        main_product = result_name,
        localised_name = {'?', data.raw[source.type][result_name].localised_name, ''},
        localised_description = {'?', data.raw[source.type][result_name].localised_description, ''}
    }})
end

-- fast replace group
function main_replace_group(source)
    if not data.raw[source.type][source.ref_name].fast_replaceable_group then
        data.raw[source.type][source.ref_name].fast_replaceable_group = source.ref_name
    end

    if source.max > 2 then
        data.raw[source.type][source.name .. '-' .. 2].fast_replaceable_group = data.raw[source.type][source.ref_name].fast_replaceable_group
    end

    if source.max <= source.min then
        return
    end

    for j=source.min + 1, source.max do
        data.raw[source.type][source.name .. '-' .. j].fast_replaceable_group = data.raw[source.type][source.name .. '-' .. (j - 1)].fast_replaceable_group
    end
end

-- MBE A 38 BASE ENTITY,RECIPE,RESEARCH_EFFECT
-- MBE A 12 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
for _, v in pairs(items) do
    v.mod = v.mod or 'base'
    v.min = v.min or 2
    v.ref_name = v.ref_name or v.name

    if (v.mod and mods[v.mod]) and (v.max >= v.min) and data.raw[v.type] and data.raw[v.type][v.ref_name] and not data.raw[v.type][v.ref_name].hidden then
        v.category = v.category or 'item'
        v.tech = v.tech or 'compound-energy'

        for j=v.min, v.max, 1 do
            main_entity(v, j)
            main_item(v, j)
            main_recipe(v, j)

            table.insert(data.raw.technology['compound-energy-' .. (j - 1)].effects, {type='unlock-recipe', recipe=v.name .. '-' .. j})
        end

        main_replace_group(v)
    end
end
