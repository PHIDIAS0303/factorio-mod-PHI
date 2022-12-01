local alpha_order = {"b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"}
local base_battery_energy = 5
local base_battery_flow = 300
local base_solar_energy = 60
local graphics_location = "__PHI-EQ__/graphics/"
local items = {"solar-panel", "battery", "fusion-reactor", "personal-laser-defense", "energy-shield", "personal-roboport", "night-vision", "exoskeleton"}

-- equipment
local function EE(source, tier)
    item = {}
    item["name"] = source .. "-mk" .. tier
    item["categories"] = armor
    local w = 1
    local h = 1

    if (source == "solar-panel")
    then
        ty = source .. "-equipment"
        item["power"] = (60 * (2 ^ (tier - 1))) .. "kW"
        item["energy_source"] = {type = "electric", usage_priority = "primary-output"}
    elseif (source == "battery")
    then
        h = 2
        ty = source .. "-equipment"
        item["energy_source"] = {type = "electric", usage_priority = "tertiary", buffer_capacity= (100 * (2 ^ (tier - 1))) .. "MJ"}
    elseif (source == "fusion-reactor")
    then
        w = 4
        h = 4
        ty = "generator-equipment"
        item["power"] = (750 * (2 ^ (tier - 1))) .. "kW"
        item["energy_source"] = {type = "electric", usage_priority = "primary-output"}
    elseif (source == "personal-laser-defense")
    then
        w = 2
        h = 2
        ty = "active-defense-equipment"
        item["energy_source"] = {type = "electric", usage_priority = "secondary-input", buffer_capacity = (250 * (2 ^ (tier - 1))) .. "kJ"}
        -- item["source_direction_count"] = 64
        -- item["source_offset"] = {0, -3.423489 / 4}
        item["attack_parameters"] = {type = "beam", cooldown = 60, range = (18 + tier), damage_modifier = (3 + 1.5 * (tier - 1)), ammo_type = {category = "laser", energy_consumption = (50 * (tier - 1)) .. "kJ", action = {type = "direct", action_delivery = {type = "beam", beam = "laser-beam", max_length = (18 + tier), duration = 60, source_offset = {0, -1.31439}}}}}
        item["automatic"] = true
    elseif (source == "night-vision")
    then
        w = 2
        h = 2
        ty = "night-vision-equipment"
        item["energy_source"] = {type = "electric", usage_priority = "primary-input", buffer_capacity = "1MJ"}
        item["energy_input"] = "10kW"
        item["activate_sound"] = {filename = "__base__/sound/nightvision-on.ogg", volume = 0.5}
        item["deactivate_sound"] = {filename = "__base__/sound/nightvision-off.ogg", volume = 0.5}
        item["darkness_to_turn_on"] = 1
        item["color_lookup"] = {{0, "__core__/graphics/color_luts/lut-sunset.png"}}
    elseif (source == "exoskeleton")
    then
        w = 2
        h = 4
        ty = "movement-bonus-equipment"
        item["energy_source"] = {type = "electric", usage_priority = "secondary-input", buffer_capacity = (250 * (2 ^ (tier - 1))) .. "kJ"}
        item["automatic"] = true
    end

    item["type"] = ty
    item["shape"] = {width = w, height = h, type = "full"}
    item["sprite"] = {filename = graphics_location .. source .. "-equipment-e.png", width = w * 32, height = h * 32, priority = "medium", hr_version = {filename = graphics_location .. source .. "-equipment-eh.png", width = w * 64, height = h *64, priority = "medium", scale = 0.5}}
    
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

for i=1, 8, 1 do
    if (i <= 3)
    then
        for j=2, 8, 1 do
            EE(items[i], j)
            EI(items[i], j)
            ER(items[i], j)
            ET(j)
        end
    elseif (i == 4)
    then
        for j=2, 6, 1 do
            EE(items[i], j)
        end
    elseif (i <= 6)
    then
        for j=3, 6, 1 do
            EE(items[i], j)
        end
    elseif (i <= 8)
    then
        EE(items[i], 2)
    end
end
