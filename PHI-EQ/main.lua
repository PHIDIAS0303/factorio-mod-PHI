local alpha_order = {"b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"}
local base_battery_energy = 5
local base_battery_flow = 300
local base_solar_energy = 60
local graphics_location = "__PHI-EQ__/graphics/"

-- equipment
local function EE(source, tier)
    item = {}
    item["type"] = source
    item["name"] = source .. "-mk" .. tier
    item["sprite"] = {filename = graphics_location .. source .. "-e.png", width = 32, height = 32, priority = "medium", hr_version = {filename = graphics_location .. source .. "-eh.png", width = 64, height = 64, priority = "medium", scale = 0.5}}
    item["categories"] = armor

    if (source == "solar-panel-equipment")
    then
        item["shape"] = {width = 1, height = 1, type = "full"}
        item["power"] = (60 * (2 ^ (tier - 1))) .. "kW"
        item["energy_source"] = {type = "electric", usage_priority = "primary-output"}
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

items = {"solar-panel-equipment"}

for i=1, 2, 1 do
    for j=2, 8, 1 do
        EE(items[i], j)
        EI(items[i], j)
        ER(items[i], j)
        ET(j)
    end
end
                                                                                                                     