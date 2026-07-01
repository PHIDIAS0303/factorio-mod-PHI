local items = require('mbm-c')

local mod_tint = {
    [2] = {r=140, g=142, b=200},
    [3] = {r=242, g=161, b=26},
    [4] = {r=255, g=254, b=42},
    [5] = {r=54, g=228, b=255},
    [6] = {r=253, g=0, b=97},
    [7] = {r=0, g=209, b=102},
    [8] = {r=233, g=63, b=233}
}

function main_entity(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])
    item.name = source.name .. '-' .. tier
    item.minable.result = item.name
    item.max_health = item.max_health * (tier - source.min + 2)
    item.next_upgrade = ((tier < source.max) and source.name .. '-' .. (tier + 1)) or nil

    for _, v in pairs({'energy_usage', 'heating_energy', 'energy_per_shot'}) do
        if item[v] then
            item[v] = (tonumber(string.match(item[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. (string.match(item[v], '%a+') or '')
        end
    end

    if item.energy_source then
        for _, v in pairs({'buffer_capacity', 'input_flow_limit', 'output_flow_limit'}) do
            if item.energy_source[v] then
                item.energy_source[v] = tonumber(string.match(item.energy_source[v], '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. string.match(item.energy_source[v], '%a+')
            end
        end

        if item.energy_source.emissions_per_minute then
            for k, _ in pairs(item.energy_source.emissions_per_minute) do
                item.energy_source.emissions_per_minute[k] = item.energy_source.emissions_per_minute[k] * (2 ^ (tier - source.min + 1))
            end
        end
    end

    if item.attack_parameters then
        if item.attack_parameters.damage_modifier then
            item.attack_parameters.damage_modifier = 2 ^ (tier - source.min + 1)
        end

        if item.attack_parameters.range then
            item.attack_parameters.range = item.attack_parameters.range + (2 * (tier - source.min + 1))
        end

        if item.attack_parameters.cooldown then
            item.attack_parameters.cooldown = item.attack_parameters.cooldown * ((24 - tier + source.min) / 25)
        end
    end

    if item.call_for_help_radius then
        item.call_for_help_radius = item.call_for_help_radius + (2 * (tier - source.min + 1))
    end

    if (source.type == 'assembling-machine') then
        if item['crafting_speed'] then
            item['crafting_speed'] = tonumber(string.match(item['crafting_speed'], '[%d%.]+')) * (2 ^ (tier - source.min + 1))
        end

        if (source.name == 'assembling-machine' or source.name == 'biochamber' or source.name == 'foundry' or source.name == 'cryogenic-plant') then
            if item['graphics_set'] and item['graphics_set']['animation'] and item['graphics_set']['animation'].layers then
                for _, l in pairs(item['graphics_set']['animation'].layers) do
                    if not l.draw_as_shadow then
                        l.tint = mod_tint[tier]
                    end
                end
            end

        elseif (source.name == 'oil-refinery' or source.name == 'chemical-plant' or source.name == 'crusher') then
            if item['graphics_set'] and item['graphics_set']['animation'] then
                for _, d in pairs({'north', 'east', 'south', 'west'}) do
                    if item['graphics_set']['animation'][d] and item['graphics_set']['animation'][d].layers then
                        for _, l in pairs(item['graphics_set']['animation'][d].layers) do
                            if not l.draw_as_shadow then
                                l.tint = mod_tint[tier]
                            end
                        end
                    end
                end
            end

        elseif (source.name == 'centrifuge' or source.name == 'electromagnetic-plant') then
            if item['graphics_set'] and item['graphics_set']['idle_animation'] and item['graphics_set']['idle_animation'].layers then
                for _, l in pairs(item['graphics_set']['idle_animation'].layers) do
                    if not l.draw_as_shadow then
                        l.tint = mod_tint[tier]
                    end
                end
            end

            if (source.name == 'electromagnetic-plant') then
                if item['graphics_set'] and item['graphics_set']['working_visualisations'] then
                    for _, d in pairs(item['graphics_set']['working_visualisations']) do
                        if d.animation and d.animation.layers then
                            for _, l in pairs(d.animation.layers) do
                                if not l.draw_as_shadow then
                                    l.tint = mod_tint[tier]
                                end
                            end
                        end
                    end
                end
            end
        end

    elseif (source.type == 'furnace') then
        if item['crafting_speed'] then
            item['crafting_speed'] = tonumber(string.match(item['crafting_speed'], '[%d%.]+')) * (2 ^ (tier - source.min + 1))
        end

        if (source.name == 'electric-furnace') then
            if item['graphics_set'] and item['graphics_set']['animation'] and item['graphics_set']['animation'].layers then
                for _, l in pairs(item['graphics_set']['animation'].layers) do
                    if not l.draw_as_shadow then
                        l.tint = mod_tint[tier]
                    end
                end
            end

        elseif (source.name == 'recycler') then
            if item['graphics_set'] and item['graphics_set']['animation'] then
                for _, d in pairs({'north', 'east', 'south', 'west'}) do
                    if item['graphics_set']['animation'][d] and item['graphics_set']['animation'][d].layers then
                        for _, l in pairs(item['graphics_set']['animation'][d].layers) do
                            if not l.draw_as_shadow then
                                l.tint = mod_tint[tier]
                            end
                        end
                    end
                end
            end
        end

    elseif (source.type == 'lab') then
        if item['researching_speed'] then
            item['researching_speed'] = tonumber(string.match(item['researching_speed'], '[%d%.]+')) * (2 ^ (tier - source.min + 1))
        end

        for _, c in pairs({'on_animation', 'off_animation'}) do
            if item[c] and item[c].layers then
                for _, l in pairs(item[c].layers) do
                    if not l.draw_as_shadow then
                        l.tint = mod_tint[tier]
                    end
                end
            end
        end

    elseif (source.type == 'mining-drill') then
        if item['mining_speed'] then
            item['mining_speed'] = tonumber(string.match(item['mining_speed'], '[%d%.]+')) * (2 ^ (tier - source.min + 1))
        end

        if (source.name == 'mining-drill' or source.name == 'big-mining-drill') then
            for _, e in pairs({'graphics_set', 'wet_mining_graphics_set'}) do
                if item[e] and item[e]['animation'] then
                    for _, d in pairs(item[e]['animation']) do
                        if d.layers then
                            for _, l in pairs(d.layers) do
                                if not l.draw_as_shadow then
                                    l.apply_runtime_tint = true
                                    l.tint = mod_tint[tier]
                                end
                            end
                        end
                    end
                end
            end

        elseif (source.name == 'pumpjack') then
            if item['graphics_set'] and item['graphics_set']['animation'] then
                for _, d in pairs({'north', 'east', 'south', 'west'}) do
                    if item['graphics_set']['animation'][d] and item['graphics_set']['animation'][d].layers then
                        for _, l in pairs(item['graphics_set']['animation'][d].layers) do
                            if not l.draw_as_shadow then
                                l.apply_runtime_tint = true
                                l.tint = mod_tint[tier]
                            end
                        end
                    end
                end
            end

            if item['base_picture'] and item['base_picture']['sheets'] then
                for _, l in pairs(item['base_picture']['sheets']) do
                    if not l.draw_as_shadow then
                        l.tint = mod_tint[tier]
                    end
                end
            end
        end

    elseif source.type == 'radar' then
        if item.max_distance_of_sector_revealed then
            item.max_distance_of_sector_revealed = item.max_distance_of_sector_revealed + (2 * (tier - source.min + 1))
        end

        if item.max_distance_of_nearby_sector_revealed then
            item.max_distance_of_nearby_sector_revealed = item.max_distance_of_nearby_sector_revealed + (2 * (tier - source.min + 1))
        end

        if item['pictures'] and item['pictures'].layers then
            for _, l in pairs(item['pictures'].layers) do
                if not l.draw_as_shadow then
                    l.tint = mod_tint[tier]
                end
            end
        end

        if item['integration_patch'] then
            item['integration_patch'].tint = mod_tint[tier]
        end

    elseif source.type == 'thruster' then
        for _, v in pairs({'min_performance', 'max_performance'}) do
            if item[v] and item[v].fluid_usage then
                item[v].fluid_usage = item[v].fluid_usage * (2 ^ (tier - source.min + 1))
            end
        end

        if item['graphics_set'] then
            if item['graphics_set']['animation'] then
                item['graphics_set']['animation'].tint = mod_tint[tier]
            end

            if item['graphics_set']['integration_patch'] then
                item['graphics_set']['integration_patch'].tint = mod_tint[tier]
            end
        end

    elseif source.type == 'agricultural-tower' then
        if item['crane_energy_usage'] then
            item['crane_energy_usage'] = (tonumber(string.match(item['crane_energy_usage'], '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. (string.match(item['crane_energy_usage'], '%a+') or '')
        end

        if item['radius'] then
            item['radius'] = item['radius'] + (1 * (tier - source.min + 1))
        end

        if item['graphics_set'] and item['graphics_set']['animation'] and item['graphics_set']['animation'].layers then
            for _, l in pairs(item['graphics_set']['animation'].layers) do
                if not l.draw_as_shadow then
                    l.tint = mod_tint[tier]
                end
            end
        end

    elseif source.type == 'electric-turret' then
        if (source.name == 'laser-turret') then
            if item['graphics_set'] and item['graphics_set']['base_visualisation'] and item['graphics_set']['base_visualisation']['animation'] and item['graphics_set']['base_visualisation']['animation'].layers then
                for _, l in pairs(item['graphics_set']['base_visualisation']['animation'].layers) do
                    if not l.draw_as_shadow then
                        l.tint = mod_tint[tier]
                    end
                end
            end

        elseif (source.name == 'tesla-turret') then
            if item['graphics_set'] and item['graphics_set']['base_visualisation'] then
                for _, v in pairs(item['graphics_set']['base_visualisation']) do
                    if v.animation and v.animation.layers then
                        for _, l in pairs(v.animation.layers) do
                            if not l.draw_as_shadow then
                                l.tint = mod_tint[tier]
                            end
                        end
                    end
                end
            end
        end

        item.glow_light_intensity = 1

        if item.attack_parameters then
            item.attack_parameters.damage_modifier = (item.attack_parameters.damage_modifier and (item.attack_parameters.damage_modifier * 2)) or (2 ^ (tier - source.min + 1))

            if item.attack_parameters.ammo_type then
                if item.attack_parameters.ammo_type.action and item.attack_parameters.ammo_type.action.action_delivery and item.attack_parameters.ammo_type.action.action_delivery.max_length then
                    item.attack_parameters.ammo_type.action.action_delivery.max_length = item.attack_parameters.ammo_type.action.action_delivery.max_length + (2 * (tier - source.min + 1))
                end

                if item.attack_parameters.ammo_type.energy_consumption then
                    item.attack_parameters.ammo_type.energy_consumption = tonumber(string.match(item.attack_parameters.ammo_type.energy_consumption, '[%d%.]+')) * (2 ^ (tier - source.min + 1)) .. string.match(item.attack_parameters.ammo_type.energy_consumption, '%a+')
                end
            end
        end

    elseif source.type == 'ammo-turret' then
        if item.attack_parameters then
            item.attack_parameters.damage_modifier = (item.attack_parameters.damage_modifier and (item.attack_parameters.damage_modifier * 2)) or (2 ^ (tier - source.min + 1))
        end

        if (source.name == 'gun-turret' or source.name == 'rocket-turret') then
            if item['graphics_set'] and item['graphics_set']['base_visualisation'] and item['graphics_set']['base_visualisation']['animation'] and item['graphics_set']['base_visualisation']['animation'].layers then
                for _, l in pairs(item['graphics_set']['base_visualisation']['animation'].layers) do
                    if not l.draw_as_shadow then
                        l.tint = mod_tint[tier]
                    end
                end
            end

        elseif (source.name == 'railgun-turret') then
            if item['graphics_set'] and item['graphics_set']['base_visualisation'] and item['graphics_set']['base_visualisation']['animation'] then
                for _, d in pairs({'north', 'north_east', 'east', 'south_east', 'south', 'south_west', 'west', 'north_west'}) do
                    if item['graphics_set']['base_visualisation']['animation'][d] then
                        for _, l in pairs(item['graphics_set']['base_visualisation']['animation'][d].layers) do
                            if not l.draw_as_shadow then
                                l.tint = mod_tint[tier]
                            end
                        end
                    end
                end
            end
        end

    elseif source.type == 'fluid-turret' then
        if item.attack_parameters then
            item.attack_parameters.damage_modifier = (item.attack_parameters.damage_modifier and (item.attack_parameters.damage_modifier * 2)) or (2 ^ (tier - source.min + 1))
        end

        item.prepare_range = item.prepare_range + (2 * (tier - source.min + 1))

        if item['graphics_set'] and item['graphics_set']['base_visualisation'] and item['graphics_set']['base_visualisation']['animation'] then
            for _, d in pairs({'north', 'north_east', 'east', 'south_east', 'south', 'south_west', 'west', 'north_west'}) do
                if item['graphics_set']['base_visualisation']['animation'][d] then
                    for _, l in pairs(item['graphics_set']['base_visualisation']['animation'][d].layers) do
                        if not l.draw_as_shadow then
                            l.tint = mod_tint[tier]
                        end
                    end
                end
            end
        end
    end

    if item.icons and item.icons[1] then
        item.icons[1].tint = mod_tint[tier]

    elseif item.icon then
        item.icons = {{icon = item.icon, icon_size = (item.icon_size and item.icon_size) or nil, tint = mod_tint[tier]}}
        item.icon = nil
    end

    table.insert(item.icons, {icon = '__base__/graphics/icons/signal/signal_' .. tier .. '.png', icon_size = 64, floating = true, scale = 0.25, shift = {-12, 12}})
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

    table.insert(item.icons, {icon = '__base__/graphics/icons/signal/signal_' .. tier .. '.png', icon_size = 64, floating = true, scale = 0.25, shift = {-12, 12}})
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
    recipe.ingredients = {{type = 'item', name = (tier > source.min and (source.name .. '-' .. (tier - 1))) or source.ref_name, amount = 2}}
    recipe.results = {{type = 'item', name = recipe.name, amount = 1}}
    recipe.main_product = recipe.name
    recipe.localised_name = {'?', data.raw[source.type][recipe.name].localised_name, ''}
    recipe.localised_description = {'?', data.raw[source.type][recipe.name].localised_description, ''}

    data:extend({recipe})
end

function main_technology(source, tier)
    if not data.raw.technology[source.tech] then
        return
    end

    if not data.raw.technology[source.tech].effects then
        data.raw.technology[source.tech].effects = {}
    end

    table.insert(data.raw.technology[source.tech].effects, {type = 'unlock-recipe', recipe = source.name .. '-' .. tier})
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

-- MBE A 24 BASE ENTITY,RECIPE,RESEARCH_EFFECT
-- MBE A 24 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
-- MBE A 2 RECYCLER ENTITY,RECIPE,RESEARCH_EFFECT
for _, v in pairs(items) do
    v.mod = v.mod or 'base'
    v.min = v.min or 2
    v.max = v.max or settings.startup['PHI-MB-MACHINE'].value
    v.ref_name = v.ref_name or v.name

    if (v.mod and mods[v.mod]) and (v.max >= v.min) and data.raw[v.type] and data.raw[v.type][v.ref_name] and not data.raw[v.type][v.ref_name].hidden then
        v.category = v.category or 'item'

        for j=v.min, v.max, 1 do
            main_entity(v, j)
            main_item(v, j)
            main_recipe(v, j)
            main_technology(v, j)
        end

        main_replace_group(v)
    end
end

if data.raw['assembling-machine'] and data.raw['assembling-machine']['assembling-machine-1'] and settings.startup['PHI-MB-MACHINE'].value > 1 then
    for i = 4, settings.startup['PHI-MB-MACHINE'].value + 2 do
        if data.raw['assembling-machine']['assembling-machine-' .. i] then
            data.raw['assembling-machine']['assembling-machine-' .. i].localised_name = {'phi-cl.combine', {'entity-name.assembling-machine-1'}, tostring(i)}
            data.raw['item']['assembling-machine-' .. i].localised_name = {'phi-cl.combine', {'entity-name.assembling-machine-1'}, tostring(i)}
            data.raw['recipe']['assembling-machine-' .. i].localised_name = {'phi-cl.combine', {'entity-name.assembling-machine-1'}, tostring(i)}
        end
    end
end

if data.raw['ammo-turret'] and data.raw['ammo-turret']['gun-turret'] and settings.startup['PHI-MB-MACHINE'].value > 1 then
    for i = 1, 7 do
        if data.raw.technology['physical-projectile-damage-' .. i] and data.raw.technology['physical-projectile-damage-' .. i].effects then
            for _, j in pairs(data.raw.technology['physical-projectile-damage-' .. i].effects) do
                if j.type and j.turret_id and j.type == 'turret-attack' and j.turret_id == 'gun-turret' then
                    for k = 2, settings.startup['PHI-MB-MACHINE'].value do
                        if data.raw['ammo-turret']['gun-turret-' .. k] then
                            table.insert(data.raw.technology['physical-projectile-damage-' .. i].effects, {type = 'turret-attack', turret_id = 'gun-turret-' .. k, modifier = j.modifier})
                        end
                    end
                end
            end
        end
    end
end

if data.raw['fluid-turret'] and data.raw['fluid-turret']['flamethrower-turret'] and settings.startup['PHI-MB-MACHINE'].value > 1 then
    for i = 1, 7 do
        if data.raw.technology['refined-flammables-' .. i] and data.raw.technology['refined-flammables-' .. i].effects then
            for _, j in pairs(data.raw.technology['refined-flammables-' .. i].effects) do
                if j.type and j.turret_id and j.type == 'turret-attack' and j.turret_id == 'flamethrower-turret' then
                    for k = 2, settings.startup['PHI-MB-MACHINE'].value do
                        if data.raw['fluid-turret']['flamethrower-turret-' .. k] then
                            table.insert(data.raw.technology['refined-flammables-' .. i].effects, {type = 'turret-attack', turret_id = 'flamethrower-turret-' .. k, modifier = j.modifier})
                        end
                    end
                end
            end
        end
    end
end
