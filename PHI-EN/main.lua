local alpha_order = {"b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"}
local base_battery_energy = 5
local base_battery_flow = 300
local base_solar_energy = 60
local graphics_location = "__PHI-EN__/graphics/"

-- entity
local function EE(source, tier)
    local item = table.deepcopy(data.raw[source][source])
    item.name = source .. "-mk" .. tier
    item.minable.result = source .. "-mk" .. tier
    item.max_health = 1000
    item.picture.layers[1].filename = graphics_location .. source .. "-e.png"
    item.picture.layers[1].hr_version.filename = graphics_location .. source .."-eh.png"
    item.icon = graphics_location .. source .. "-i.png"
    item.icon_size = 64
    item.icon_mipmaps = 4

    if (source == "accumulator")
    then
        item.energy_source.buffer_capacity = (base_battery_energy * 4 ^ (tier - 1)) .. "MJ"
        item.energy_source.input_flow_limit = (base_battery_flow * (4 ^ (tier - 1))) .. "kW"
        item.energy_source.output_flow_limit = (base_battery_flow * (4 ^ (tier - 1))) .. "kW"
        item.charge_animation.layers[1].layers[1].filename = item.picture.layers[1].filename
        item.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
        item.charge_animation.layers[1].layers[1].hr_version.filename = item.picture.layers[1].hr_version.filename
        item.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
        item.discharge_animation.layers[1].layers[1].filename = item.picture.layers[1].filename
        item.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
        item.discharge_animation.layers[1].layers[1].hr_version.filename = item.picture.layers[1].hr_version.filename
        item.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
    else
        item.production = (base_solar_energy * (4 ^ (tier - 1))) .. "kW"
    end
    
    if (tier <= 7)
    then
        item.next_upgrade = source .. "-mk" .. (tier + 1)
    end
    
    data:extend({item})
end

-- item
local function EI(source, tier)
    local item = table.deepcopy(data.raw.item[source])
    item.name = source .. "-mk" .. tier
    item.place_result = source .. "-mk" .. tier
    item.max_health = 1000
    item.subgroup = "energy"
    item.stack_size = 50
    item.default_request_amount = 50
    item.icons = {{icon = graphics_location .. source .. "-i.png", icon_mipmaps = 4, icon_size = 64}}

    if (source == "accumulator")
    then
        item.order = "d[" .. source .. "]-a" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"

    else
        item.order = "e[" .. source .. "]-a" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
    end

    data:extend({item})
end

-- recipe
local function ER(source, tier)
    na = source

    if (tier >= 3)
    then
        na = na .. "-mk" .. (tier - 1)
    end

    data:extend({{
        type = "recipe",
        name = source .. "-mk" .. tier,
        energy_required = 5,
        enabled = "false",
        ingredients = {{na, 4}},
        result = source .. "-mk" .. tier,
    }})
end

-- technology
local function ET(tier)
    if (tier == 2)
    then
        prereq = {"solar-energy", "advanced-electronics", "electric-energy-accumulators"}
    else
        prereq = {"compound-energy-" .. (tier - 2)}
    end

    data:extend({{
        type = "technology",
        name = "compound-energy-" .. (tier - 1),
        icon_size = 256,
        icon = graphics_location .. "solar-energy" .. "-t.png",
        effects = {
            {
                type = "unlock-recipe",
                recipe = "solar-panel-mk" .. tier
            },
            {
                type = "unlock-recipe",
                recipe = "accumulator-mk" .. tier
            }
        },
        prerequisites = prereq,
        unit = {
            count = 200 * (tier - 1),
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 10 * (tier - 1)
        },
        order = "a-h-" .. alpha_order[tier + 1]
    }})
end

items = {"accumulator", "solar-panel"}

for i=1, 2, 1 do
    for j=2, 8, 1 do
        EE(items[i], j)
        EI(items[i], j)
        ER(items[i], j)
        ET(j)
    end
end
