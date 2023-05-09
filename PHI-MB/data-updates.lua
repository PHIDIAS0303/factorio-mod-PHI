local items = require 'config'

-- entity
local function EE(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])

    item.name = source.name .. '-' .. tier
    item.minable.result = source.name .. '-' .. tier
    item.max_health = item.max_health * (2 ^ (tier - source.min + 1))

    if source.type == 'lab' then
        item.researching_speed = item.researching_speed * (2 ^ (tier - source.min + 1))
    elseif source.type == 'mining-drill' then
        item.mining_speed = item.mining_speed * (2 ^ (tier - source.min + 1))
    else
        item.crafting_speed = item.crafting_speed * (2 ^ (tier - source.min + 1))
        item.energy_source.emissions_per_minute = item.energy_source.emissions_per_minute * (2 ^ (tier - source.min + 1))
    end

    item.energy_usage = tonumber(string.match(item.energy_usage, '%d+')) * (2 ^ (tier - source.min + 1)) .. 'kW'
    -- item.animation.layers[1].filename = graphics_location .. source .. '-e.png'
    -- item.animation.layers[1].hr_version.filename = graphics_location .. source ..'-eh.png'
    -- item.icon = graphics_location .. source .. '-i.png'
    -- item.icon_size = 64
    -- item.icon_mipmaps = 4

    if (tier <= source.max - 1) then
        item.next_upgrade = source.name .. '-' .. (tier + 1)
    end

    if (source.new_type ~= nil) then
        item.type = source.new_type
    end

    data:extend({item})
end

-- item
local function EI(source, tier)
    local item = table.deepcopy(data.raw.item[source.ref_name])

    item.name = source.name .. '-' .. tier
    item.place_result = source.name .. '-' .. tier
    -- item.icons = {{icon = graphics_location .. source .. '-i.png', icon_mipmaps = 4, icon_size = 64}}
    item.order = item.order .. tier
    data:extend({item})
end

-- recipe
local function ER(source, tier)
    local na = source.name

    if tier > 2 then
        na = na .. '-' .. (tier - 1)
    end

    data:extend({{
        type = 'recipe',
        name = source.name .. '-' .. tier,
        energy_required = 2,
        enabled = false,
        ingredients = {{na, 2}},
        result = source.name .. '-' .. tier,
    }})
end

-- tech
local function ET(source, tier)
    table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=source.name .. '-' .. tier})
end

for _, v in pairs(items) do
    if v.enabled then
        if v.stage == 2 then
            for j=v.min, v.max, 1 do
                EE(v, j)
                EI(v, j)
                ER(v, j)
                ET(v, j)
            end
        end
    end
end

-- assembling machine
data.raw['assembling-machine']['assembling-machine-4'].fast_replaceable_group = data.raw['assembling-machine']['assembling-machine-3'].fast_replaceable_group
data.raw['assembling-machine']['assembling-machine-5'].fast_replaceable_group = data.raw['assembling-machine']['assembling-machine-4'].fast_replaceable_group

-- electric furnace
data.raw['furnace']['electric-furnace'].fast_replaceable_group = 'electric-furnace'
data.raw['furnace']['electric-furnace-2'].fast_replaceable_group = data.raw['furnace']['electric-furnace'].fast_replaceable_group
data.raw['furnace']['electric-furnace-3'].fast_replaceable_group = data.raw['furnace']['electric-furnace-2'].fast_replaceable_group

-- chemical plant
data.raw['assembling-machine']['chemical-plant'].fast_replaceable_group = 'chemical-plant'
data.raw['assembling-machine']['chemical-plant-2'].fast_replaceable_group = data.raw['assembling-machine']['chemical-plant'].fast_replaceable_group
data.raw['assembling-machine']['chemical-plant-3'].fast_replaceable_group = data.raw['assembling-machine']['chemical-plant-2'].fast_replaceable_group

-- oil refinery
data.raw['assembling-machine']['oil-refinery'].fast_replaceable_group = 'oil-refinery'
data.raw['assembling-machine']['oil-refinery-2'].fast_replaceable_group = data.raw['assembling-machine']['oil-refinery'].fast_replaceable_group
data.raw['assembling-machine']['oil-refinery-3'].fast_replaceable_group = data.raw['assembling-machine']['oil-refinery-2'].fast_replaceable_group

-- centrifuge
data.raw['assembling-machine']['centrifuge'].fast_replaceable_group = 'centrifuge'
data.raw['assembling-machine']['centrifuge-2'].fast_replaceable_group = data.raw['assembling-machine']['centrifuge'].fast_replaceable_group
data.raw['assembling-machine']['centrifuge-3'].fast_replaceable_group = data.raw['assembling-machine']['centrifuge-2'].fast_replaceable_group

-- lab
data.raw['lab']['lab'].fast_replaceable_group = 'lab'
data.raw['lab']['lab-2'].fast_replaceable_group = data.raw['lab']['lab'].fast_replaceable_group
data.raw['lab']['lab-3'].fast_replaceable_group = data.raw['lab']['lab-2'].fast_replaceable_group

-- electric-mining-drill
data.raw['mining-drill']['electric-mining-drill'].fast_replaceable_group = 'mining-drill'
data.raw['mining-drill']['electric-mining-drill-2'].fast_replaceable_group = data.raw['mining-drill']['electric-mining-drill'].fast_replaceable_group
data.raw['mining-drill']['electric-mining-drill-3'].fast_replaceable_group = data.raw['mining-drill']['electric-mining-drill-2'].fast_replaceable_group

-- pumpjack
data.raw['mining-drill']['pumpjack'].fast_replaceable_group = 'pumpjack'
data.raw['mining-drill']['pumpjack-2'].fast_replaceable_group = data.raw['mining-drill']['pumpjack'].fast_replaceable_group
data.raw['mining-drill']['pumpjack-3'].fast_replaceable_group = data.raw['mining-drill']['pumpjack-2'].fast_replaceable_group


if mods['PHI-RS'] then
    data.raw['assembling-machine']['electric-filter-furnace-2'].fast_replaceable_group = data.raw['assembling-machine']['electric-filter-furnace'].fast_replaceable_group
    data.raw['assembling-machine']['electric-filter-furnace-3'].fast_replaceable_group = data.raw['assembling-machine']['electric-filter-furnace-2'].fast_replaceable_group

    data.raw['assembling-machine']['electric-filter-furnace-2'].crafting_categories = data.raw['furnace']['electric-furnace'].crafting_categories
    data.raw['assembling-machine']['electric-filter-furnace-3'].crafting_categories = data.raw['furnace']['electric-furnace'].crafting_categories
end

-- aai
if mods['aai-industry'] then
    -- industrial furnace
    data.raw['assembling-machine']['industrial-furnace'].fast_replaceable_group = 'industrial-furnace'
    data.raw['assembling-machine']['industrial-furnace-2'].fast_replaceable_group = data.raw['assembling-machine']['industrial-furnace'].fast_replaceable_group
    data.raw['assembling-machine']['industrial-furnace-3'].fast_replaceable_group = data.raw['assembling-machine']['industrial-furnace-2'].fast_replaceable_group

    -- fuel processor
    data.raw['assembling-machine']['fuel-processor'].fast_replaceable_group = 'fuel-processor'
    data.raw['assembling-machine']['fuel-processor-2'].fast_replaceable_group = data.raw['assembling-machine']['fuel-processor'].fast_replaceable_group
    data.raw['assembling-machine']['fuel-processor-3'].fast_replaceable_group = data.raw['assembling-machine']['fuel-processor-2'].fast_replaceable_group
end

-- se
if mods['space-exploration'] then
    -- electric furnace
    data.raw['furnace']['electric-furnace-2'].crafting_categories = data.raw['furnace']['electric-furnace'].crafting_categories
    data.raw['furnace']['electric-furnace-3'].crafting_categories = data.raw['furnace']['electric-furnace'].crafting_categories

    -- space assembling machine
    data.raw['assembling-machine']['se-space-assembling-machine'].fast_replaceable_group  = 'space-assembling-machine'
    data.raw['assembling-machine']['se-space-assembling-machine-2'].fast_replaceable_group = data.raw['assembling-machine']['se-space-assembling-machine'].fast_replaceable_group
    data.raw['assembling-machine']['se-space-assembling-machine-3'].fast_replaceable_group = data.raw['assembling-machine']['se-space-assembling-machine-2'].fast_replaceable_group

    -- space manufactory
    data.raw['assembling-machine']['se-space-manufactory'].fast_replaceable_group  = 'space-manufactory'
    data.raw['assembling-machine']['se-space-manufactory-2'].fast_replaceable_group = data.raw['assembling-machine']['se-space-manufactory'].fast_replaceable_group
    data.raw['assembling-machine']['se-space-manufactory-3'].fast_replaceable_group = data.raw['assembling-machine']['se-space-manufactory-2'].fast_replaceable_group

    -- casting machine
    data.raw['assembling-machine']['se-casting-machine'].fast_replaceable_group  = 'casting-machine'
    data.raw['assembling-machine']['se-casting-machine-2'].fast_replaceable_group = data.raw['assembling-machine']['se-casting-machine'].fast_replaceable_group
    data.raw['assembling-machine']['se-casting-machine-3'].fast_replaceable_group = data.raw['assembling-machine']['se-casting-machine-2'].fast_replaceable_group

    -- pulveriser
    data.raw['assembling-machine']['se-pulveriser'].fast_replaceable_group  = 'pulveriser'
    data.raw['assembling-machine']['se-pulveriser-2'].fast_replaceable_group = data.raw['assembling-machine']['se-pulveriser'].fast_replaceable_group
    data.raw['assembling-machine']['se-pulveriser-3'].fast_replaceable_group = data.raw['assembling-machine']['se-pulveriser-2'].fast_replaceable_group

    -- lifesupport facility
    data.raw['assembling-machine']['se-lifesupport-facility'].fast_replaceable_group  = 'lifesupport-facility'
    data.raw['assembling-machine']['se-lifesupport-facility-2'].fast_replaceable_group = data.raw['assembling-machine']['se-lifesupport-facility'].fast_replaceable_group
    data.raw['assembling-machine']['se-lifesupport-facility-3'].fast_replaceable_group = data.raw['assembling-machine']['se-lifesupport-facility-2'].fast_replaceable_group

    -- fuel refinery
    data.raw['assembling-machine']['se-fuel-refinery'].fast_replaceable_group  = 'fuel-refinery'
    data.raw['assembling-machine']['se-fuel-refinery-2'].fast_replaceable_group = data.raw['assembling-machine']['se-fuel-refinery'].fast_replaceable_group
    data.raw['assembling-machine']['se-fuel-refinery-3'].fast_replaceable_group = data.raw['assembling-machine']['se-fuel-refinery-2'].fast_replaceable_group

    -- electric mining drill
    data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group = 'core-miner-drill'
    data.raw['mining-drill']['se-core-miner-drill-2'].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group
    data.raw['mining-drill']['se-core-miner-drill-3'].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill-2'].fast_replaceable_group
end
