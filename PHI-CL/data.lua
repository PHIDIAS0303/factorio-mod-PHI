local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
-- local graphics_location = '__PHI-EN__/graphics/'
local items = require 'config'

-- entity
local function EE(source, tier)
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

    else
        if item.crafting_speed then
            item.crafting_speed = item.crafting_speed * (2 ^ (tier - source.min + 1))
        end

        if item.energy_source.emissions_per_minute then
            item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - source.min + 1))
        end
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

-- item
local function EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.ref_name])

    item.name = source.name .. '-' .. tier
    item.place_result = source.name .. '-' .. tier

    -- item.subgroup = 'energy'
    -- item.icons = {{icon = graphics_location .. source.name .. '-i.png', icon_mipmaps = 4, icon_size = 64}}

    item.order = item.order .. tier
    data:extend({item})
end

-- recipe
local function ER(source, tier)
    local ingredient_name = source.name

    if tier > 2 then
        ingredient_name = ingredient_name .. '-' .. (tier - 1)
    end

    local ingredient_amount = 2

    if (source.type == 'solar-panel') or (source.type == 'accumulator') then
        ingredient_amount = 4
    end

    if ((source.type == 'boiler') or (source.type == 'steam-engine') or (source.type == 'nuclear-reactor') or (source.type == 'heat-pipe') or (source.type == 'heat-exchanger') or (source.type == 'steam-turbine')) and (tier > 2) then
        data:extend({{
            type = 'recipe',
            name = source.name .. '-' .. tier,
            energy_required = 2,
            enabled = false,
            ingredients = {{ingredient_name, 1}, {source.name, 1}},
            result = source.name .. '-' .. tier,
        }})

    else
        data:extend({{
            type = 'recipe',
            name = source.name .. '-' .. tier,
            energy_required = 2,
            enabled = false,
            ingredients = {{ingredient_name, ingredient_amount}},
            result = source.name .. '-' .. tier,
        }})
    end
end

-- technology
local function ET(source, tier)
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
        table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=source.name .. '-' .. tier})
    end
end

-- fast replace group
local function EL(source)
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

for k, v in pairs(items['setting']) do
    for k2=1, #v.effect do
        if items[v.effect[k2]] ~= nil then
            if settings.startup[k].value < items[v.effect[k2]].min then
                items[v.effect[k2]].enabled = false
            end

            items[v.effect[k2]][v.type] = settings.startup[k].value
        end
    end
end

for _, v in pairs(items['item']) do
    if v.enabled then
        if v.stage == 1 then
            for j=v.min, v.max, 1 do
                EE(v, j)
                EI(v, j)
                ER(v, j)
                ET(v, j)
            end

            EL(v)
        end
    end
end
