local alpha_order = {'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'}
local graphics_location = '__PHI-EN__/graphics/'
local items = require 'config'

-- entity
local function EE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.name])
    item.name = source.name .. '-' .. tier
    item.minable.result = source.name .. '-' .. tier
    item.max_health = 200 * (2 ^ (tier - 1))

    --[[
    item.picture.layers[1].filename = graphics_location .. source.name .. '-e.png'
    item.picture.layers[1].hr_version.filename = graphics_location .. source.name ..'-eh.png'
    item.icon = graphics_location .. source.type .. '-i.png'
    item.icon_size = 64
    item.icon_mipmaps = 4
    ]]

    if (source.type == 'accumulator') then
        item.energy_source.buffer_capacity = (source.base * 4 ^ (tier - 1)) .. 'MJ'
        item.energy_source.input_flow_limit = (source.base * 60 * (4 ^ (tier - 1))) .. 'kW'
        item.energy_source.output_flow_limit = (source.base * 60 * (4 ^ (tier - 1))) .. 'kW'

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
        item.production = (source.base * (4 ^ (tier - 1))) .. 'kW'

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
    end

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
    item.max_health = 200 * (2 ^ (tier - 1))
    -- item.subgroup = 'energy'
    -- item.stack_size = 50
    -- item.default_request_amount = 50
    -- item.icons = {{icon = graphics_location .. source.name .. '-i.png', icon_mipmaps = 4, icon_size = 64}}
    item.order = item.order .. tier
    data:extend({item})
end

-- recipe
local function ER(source, tier)
    local na = source.name

    if tier > 2 then
        na = na .. '-' .. (tier - 1)
    end

    if source.type == 'solar-panel' or source.type == 'accumulator' then
        data:extend({{
            type = 'recipe',
            name = source.name .. '-' .. tier,
            energy_required = 2,
            enabled = false,
            ingredients = {{na, 4}},
            result = source.name .. '-' .. tier,
        }})
    else
        if tier == 2 then
            data:extend({{
                type = 'recipe',
                name = source.name .. '-' .. tier,
                energy_required = 2,
                enabled = false,
                ingredients = {{na, 2}},
                result = source.name .. '-' .. tier,
            }})
        else
            data:extend({{
                type = 'recipe',
                name = source.name .. '-' .. tier,
                energy_required = 2,
                enabled = false,
                ingredients = {{na, 1}, {source.name, 1}},
                result = source.name .. '-' .. tier,
            }})
        end
    end
end

-- technology
local function ET(source, tier)
    if data.raw.technology['compound-energy-' .. (tier - 1)] == nil then
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

for k, v in pairs(items) do
    if k ~= 'setting' then
        if v.enabled then
            for j=v.min, v.max, 1 do
                EE(v, j)
                EI(v, j)
                ER(v, j)
                ET(v, j)
            end
        end
    end
end

