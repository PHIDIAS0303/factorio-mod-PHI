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
    data.raw['fluid']['steam'].max_temperature = math.max(((settings.startup['PHI-MB-ENERGY'].value > 1) and 2000) or 500, data.raw['fluid']['steam'].max_temperature)
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

function main_entity(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])
    item.name = source.name .. '-' .. tier
    item.minable.result = item.name
    item.max_health = item.max_health * (tier - source.min + 2)
    item.next_upgrade = ((tier < source.max) and source.name .. '-' .. (tier + 1)) or nil

    for _, v in pairs({'energy_usage'}) do
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

    if (source.type == 'solar-panel') then
        item.production = tonumber(string.match(item.production, '[%d%.]+')) * (settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value ^ (tier - source.min + 1)) .. (string.match(item.production, '%a+') or '')

        if item['picture'] and item['picture'].layers then
            for _, l in pairs(item['picture'].layers) do
                if not l.draw_as_shadow then
                    l.tint = mod_tint[tier]
                end
            end
        end

    elseif (source.type == 'accumulator') then
        for _, v in pairs({'buffer_capacity', 'input_flow_limit', 'output_flow_limit'}) do
            item.energy_source[v] = (item.energy_source[v] and (tonumber(string.match(item.energy_source[v], '[%d%.]+')) * (settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value ^ (tier - source.min + 1)) .. string.match(item.energy_source[v], '%a+'))) or nil
        end

        if item['chargable_graphics'] then
            if item['chargable_graphics']['picture'] and item['chargable_graphics']['picture'].layers then
                for _, l in pairs(item['chargable_graphics']['picture'].layers) do
                    if not l.draw_as_glow then
                        l.tint = mod_tint[tier]
                    end
                end
            end

            for _, c in pairs({'charge_animation', 'discharge_animation'}) do
                if item['chargable_graphics'][c] and item['chargable_graphics'][c].layers then
                    for _, l in pairs(item['chargable_graphics'][c].layers) do
                        if l.layers then
                            for _, ll in pairs(l.layers) do
                                if not ll.draw_as_glow then
                                    ll.tint = mod_tint[tier]
                                end
                            end
                        end

                        if not l.draw_as_glow then
                            l.tint = mod_tint[tier]
                        end
                    end
                end
            end
        end

    elseif (source.type == 'boiler') then
        item.energy_consumption = tostring(tonumber(string.match(item.energy_consumption, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.energy_consumption, '%a+')
        item.target_temperature = 15 + ((item.target_temperature - 15) * (2 * (tier - source.min + 1)))

        if (source.name == 'heat-exchanger') then
            item.energy_source.min_working_temperature = 15 + ((item.energy_source.min_working_temperature - 15) * (2 * (tier - source.min + 1)))
            item.energy_source.max_temperature = item.energy_source.max_temperature * (2 * (tier - source.min + 1))
            item.energy_source.max_transfer = tostring(tonumber(string.match(item.energy_source.max_transfer, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.energy_source.max_transfer, '%a+')
        end

        if item['pictures'] then
            for _, c in pairs({'north', 'east', 'south', 'west'}) do
                if item['pictures'][c] and item['pictures'][c].structure and item['pictures'][c].structure.layers then
                    for _, l in pairs(item['pictures'][c].structure.layers) do
                        if not l.draw_as_shadow then
                            l.tint = mod_tint[tier]
                        end
                    end
                end
            end
        end

    elseif (source.type == 'generator') then
        item.max_power_output = (item.max_power_output and (tonumber(string.match(item.max_power_output, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.max_power_output, '%a+')) or nil
        item.maximum_temperature = (item.maximum_temperature and 15 + ((item.maximum_temperature - 15) * (2 * (tier - source.min + 1)))) or nil

        if item['pictures'] then
            for _, c in pairs({'north', 'east'}) do
                if item['pictures'][c] and item['pictures'][c].animation and item['pictures'][c].animation.layers then
                    for _, l in pairs(item['pictures'][c].animation.layers) do
                        if not l.draw_as_shadow then
                            l.tint = mod_tint[tier]
                        end
                    end
                end
            end
        end

    elseif (source.type == 'reactor') then
        item.consumption = tostring(tonumber(string.match(item.consumption, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.consumption, '%a+')
        item.heat_buffer.max_temperature = item.heat_buffer.max_temperature * (2 * (tier - source.min + 1))
        item.heat_buffer.max_transfer = tostring(tonumber(string.match(item.heat_buffer.max_transfer, '[%d%.]+')) * (2 * (tier - source.min + 1)))  .. string.match(item.heat_buffer.max_transfer, '%a+')

        if item['picture'] and item['picture'].layers then
            for _, l in pairs(item['picture'].layers) do
                if not l.draw_as_shadow then
                    l.tint = mod_tint[tier]
                end
            end
        end

    elseif (source.type == 'fusion-reactor') then
        item.power_input = tostring(tonumber(string.match(item.power_input, '[%d%.]+')) * (2 * (tier - source.min + 1))) .. string.match(item.power_input, '%a+')
        item.max_fluid_usage = item.max_fluid_usage * (2 * (tier - source.min + 1))

        if item['graphics_set'] and item['graphics_set']['structure'] and item['graphics_set']['structure'].layers then
            for _, l in pairs(item['graphics_set']['structure'].layers) do
                if not l.draw_as_shadow then
                    l.tint = mod_tint[tier]
                end
            end
        end

    elseif (source.type == 'fusion-generator') then
        item.max_fluid_usage = item.max_fluid_usage * (2 * (tier - source.min + 1))

        if item['graphics_set'] then
            for _, c in pairs({'north_graphics_set', 'east_graphics_set', 'south_graphics_set', 'west_graphics_set'}) do
                if item['graphics_set'][c] and item['graphics_set'][c].animation and item['graphics_set'][c].animation.layers then
                    for _, l in pairs(item['graphics_set'][c].animation.layers) do
                        if not l.draw_as_shadow then
                            l.tint = mod_tint[tier]
                        end
                    end
                end
            end
        end

    elseif (source.type == 'heat-pipe') then
        if item['connection_sprites'] then
            for _, c in pairs({'single', 'straight_vertical', 'straight_horizontal', 'corner_right_up', 'corner_left_up', 'corner_right_down', 'corner_left_down', 't_up', 't_down', 't_right', 't_left', 'cross', 'ending_up', 'ending_down', 'ending_right', 'ending_left'}) do
                if item['connection_sprites'][c] then
                    for _, l in pairs(item['connection_sprites'][c]) do
                        l.tint = mod_tint[tier]
                    end
                end
            end
        end

        item.heat_buffer.max_temperature = item.heat_buffer.max_temperature * (2 * (tier - source.min + 1))
        item.heat_buffer.max_transfer = tostring(tonumber(string.match(item.heat_buffer.max_transfer, '[%d%.]+')) * (2 * (tier - source.min + 1)))  .. string.match(item.heat_buffer.max_transfer, '%a+')
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
    local recipe = table.deepcopy(data.raw.recipe[source.ref_name])
    recipe.name = source.name .. '-' .. tier
    recipe.icons = table.deepcopy(data.raw.item[source.ref_name].icons)
    recipe.energy_required = 2
    recipe.enabled = false
    recipe.categories = {'crafting'}
    recipe.ingredients = {{type = 'item', name = (tier > source.min and (source.name .. '-' .. (tier - 1))) or source.ref_name, amount = ((source.tech == 'compound-energy' and (source.type == 'solar-panel' or source.type == 'accumulator')) and tonumber(settings.startup['PHI-MB-ENERGY-SOLAR-RATIO'].value) or 4) or 2}}
    recipe.results = {{type = 'item', name = recipe.name, amount = 1}}
    recipe.main_product = recipe.name
    recipe.localised_name = {'?', data.raw[source.type][recipe.name].localised_name, ''}
    recipe.localised_description = {'?', data.raw[source.type][recipe.name].localised_description, ''}

    data:extend({recipe})
end

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
