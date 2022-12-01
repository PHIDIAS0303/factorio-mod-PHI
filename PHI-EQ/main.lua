local alpha_order = {"b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"}
local base_battery_energy = 5
local base_battery_flow = 300
local base_solar_energy = 60
local graphics_location = "__PHI-EQ__/graphics/"
local items = {"solar-panel", "battery", "fusion-reactor", "personal-laser-defense", "energy-shield", "personal-roboport", "night-vision", "exoskeleton"}

-- equipment
local function EE(source, tier)
    item = {}
    item["name"] = source .. "-mk" .. tier .. "-equipment"
    item["categories"] = armor
    local w = 1
    local h = 1

    if (source == "solar-panel")
    then
        ty = "solar-panel-equipment"
        item["power"] = (60 * (2 ^ (tier - 1))) .. "kW"
        item["energy_source"] = {type = "electric", usage_priority = "primary-output"}
    elseif (source == "battery")
    then
        h = 2
        ty = "battery-equipment"
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
    elseif (source == "energy-shield")
    then
        w = 2
        h = 2
        ty = "energy-shield-equipment"
        item["energy_source"] = {type = "electric", usage_priority = "primary-input", input_flow_limit = (1000 * (2 ^ (tier - 1))) .. "kW", buffer_capacity = (480 * (2 ^ (tier - 1))) .. "kJ"}
        item["max_shield_value"] = (150 * (2 ^ (tier - 1)))
        item["energy_per_shield"] = "80kJ"
    elseif (source == "personal-roboport")
    then
        w = 2
        h = 2
        ty = "roboport-equipment"
        item["energy_source"] = {type = "electric", usage_priority = "secondary-input", buffer_capacity = (80 * (2 ^ (tier - 1))) .. "MJ"}
        item["robot_limit"] = 50
        item["construction_radius"] = 25
        item["spawn_and_station_height"] = 0.4
        item["spawn_and_station_shadow_height_offset"] = 0.5
        item["robots_shrink_when_entering_and_exiting"] = true
        item["recharging_animation"] = {filename = "__base__/graphics/entity/roboport/roboport-recharging.png", draw_as_glow = true, priority = "high", width = 37, height = 35, frame_count = 16, scale = 1.5, animation_speed = 0.5}
        item["recharging_light"] = {intensity = 0.2, size = 3, color = {r = 0.5, g = 0.5, b = 1.0}}
        item["stationing_offset"] = {0, -0.6}
        item["charging_station_shift"] = {0, 0.5}
        item["charging_station_count"] = 16
        item["charging_energy"] = (8 * (2 ^ (tier - 1))) .. "MW"
        item["charging_distance"] = 1.6
        item["charging_threshold_distance"] = 5
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
        item["energy_source"] = {type = "electric", usage_priority = "secondary-input", buffer_capacity = "10MJ"}
        item["energy_consumption"] = "400kW"
        item["movement_bonus"] = 0.4
    end

    item["type"] = ty
    item["shape"] = {width = w, height = h, type = "full"}
    item["sprite"] = {filename = graphics_location .. source .. "-equipment-e.png", width = w * 32, height = h * 32, priority = "medium", hr_version = {filename = graphics_location .. source .. "-equipment-eh.png", width = w * 64, height = h *64, priority = "medium", scale = 0.5}}
    
    data:extend({item})
end

-- item
local function EI(source, tier)
    local item = table.deepcopy(data.raw.item[source])
    item.name = source .. "-mk" .. tier .. "-equipment"
    item.placed_as_equipment_result = source .. "-mk" .. tier .. "-equipment"
    item.max_health = 1000
    item.subgroup = "equipment"
    item.stack_size = 20
    item.default_request_amount = 5
    item.icons = {{icon = graphics_location .. source .. "-i.png", icon_mipmaps = 4, icon_size = 64}}

    if (source == "solar-panel")
    then
        item.order = "a[energy-source]-a" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
    elseif (source == "battery")
    then
        item.order = "b[battery]-a" .. alpha_order[tier] .. "[" .. source .. "-mk" .. tier .. "]"
    elseif (source == "fusion-reactor")
    then
        item.order = "a[energy-source]-b" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
    elseif (source == "personal-laser-defense")
    then
        item.order = "b[active-defense]-a" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
    elseif (source == "energy-shield")
    then
        item.order = "a[shield]-b" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
    elseif (source == "personal-roboport")
    then
        item.order = "e[robotics]-b" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
    elseif (source == "night-vision")
    then
        item.order = "f[night-vision]-a" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
    elseif (source == "exoskeleton")
    then
        item.order = "d[exoskeleton]-a" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
    end

    data:extend({item})
end

-- recipe
local function ER(source, tier)
    na = source

    if (source == "night-vision")
    then
        na = "night-vision-equipment"
    elseif (source == "exoskeleton")
    then
        na = "exoskeleton-equipment"
    elseif ((source == "solar-panel") or (source == "fusion-reactor") or (source == "personal-laser-defense"))
    then
        na = source
    elseif (tier >= 3)
    then
        na = source .. "-mk" .. (tier - 1)
    end

    data:extend({{
        type = "recipe",
        name = source .. "-mk" .. tier,
        energy_required = 5,
        enabled = "false",
        ingredients = {{na, 2}},
        result = source .. "-mk" .. tier,
    }})
end

-- technology
local function ET(tier)
    if (tier == 2)
    then
        prereq = {"compound-energy", "solar-panel-equipment", "battery-mk2-equipment", "night-vision-equipment"}
    else
        prereq = {"compound-energy-" .. (tier - 2)}
    end

    data:extend({{
        type = "technology",
        name = "compound-equipment-energy-" .. (tier - 1),
        icon_size = 256,
        icon = graphics_location .. "solar-panel-equipment-t.png",
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
        order = "g-e-" .. alpha_order[tier + 1]
    }})
end

for _, animation in ipairs(data.raw["character"]["character"]["animations"]) do
    if animation.armors then
        for _, armor in ipairs(animation.armors) do
            if armor == "power-armor-mk2" then
                animation.armors[#animation.armors + 1] = "power-armor-mk3"
                break
            end
        end
    end
end

data:extend({
    {
        type = "equipment-grid",
        name = "equipment-grid-14x14",
        width = 14,
        height = 14,
        equipment_categories = {"armor"}
    },
    {
        type = "armor",
        name = "power-armor-mk3",
        icon = "__base__/graphics/icons/power-armor-mk2.png",
        icon_size = 64, icon_mipmaps = 4,
        resistances = {{type = "physical", decrease = 20, percent = 50}, {type = "acid", decrease = 20, percent = 80},
        {type = "explosion", decrease = 70, percent = 60}, {type = "fire", decrease = 20, percent = 80},
        {type = "laser", decrease = 20, percent = 50}, {type = "electric", decrease = 20, percent = 50},
        {type = "impact", decrease = 20, percent = 50}, {type = "poison", decrease = 20, percent = 50}},
        subgroup = "armor",
        order = "eb[power-armor-mk3]",
        stack_size = 1,
        infinite = true,
        equipment_grid = "equipment-grid-14x14",
        inventory_size_bonus = 40,
        open_sound = {filename =  "__base__/sound/armor-open.ogg", volume = 1},
        close_sound = {filename = "__base__/sound/armor-close.ogg", volume = 1}
    }
})

data:extend(
    {
        {
            type = "technology",
            name = "compound-equipment-energy",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-equipment-mk2"
                },
                {
                    type = "unlock-recipe",
                    recipe = "night-vision-equipment-mk2"
                }
            },
            prerequisites = {"compound-energy", "solar-panel-equipment", "battery-mk2-equipment", "night-vision-equipment"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-c"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-2",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-equipment-mk3"
                },
                {
                    type = "unlock-recipe",
                    recipe = "battery-mk3-equipment"
                }
            },
            prerequisites = {"compound-energy-2", "compound-equipment-energy", "personal-laser-defense-equipment"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-d"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-3",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-equipment-mk4"
                },
                {
                    type = "unlock-recipe",
                    recipe = "battery-mk4-equipment"
                }
            },
            prerequisites = {"compound-energy-3", "compound-equipment-energy-2"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-e"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-4",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-equipment-mk5"
                },
                {
                    type = "unlock-recipe",
                    recipe = "battery-mk5-equipment"
                },
                {
                    type = "unlock-recipe",
                    recipe = "fusion-reactor-equipment-mk2"
                },
                {
                    type = "unlock-recipe",
                    recipe = "energy-shield-mk3-equipment"
                },
                {
                    type = "unlock-recipe",
                    recipe = "personal-laser-defense-equipment-mk2"
                },
                {
                    type = "unlock-recipe",
                    recipe = "personal-roboport-mk3-equipment"
                },
                {
                    type = "unlock-recipe",
                    recipe = "exoskeleton-equipment-mk2"
                },
            },
            prerequisites = {"compound-energy-4", "compound-equipment-energy-3", "fusion-reactor-equipment", "personal-roboport-mk2-equipment", "energy-shield-mk2-equipment", "exoskeleton-equipment"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-f"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-5",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-equipment-mk6"
                },
                {
                    type = "unlock-recipe",
                    recipe = "battery-mk6-equipment"
                },
                {
                    type = "unlock-recipe",
                    recipe = "fusion-reactor-equipment-mk3"
                },
            },
            prerequisites = {"compound-energy-5", "compound-equipment-energy-4"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-g"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-6",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-equipment-mk7"
                },
                {
                    type = "unlock-recipe",
                    recipe = "battery-mk7-equipment"
                },
                {
                    type = "unlock-recipe",
                    recipe = "fusion-reactor-equipment-mk4"
                },
                {
                    type = "unlock-recipe",
                    recipe = "power-armor-mk3"
                }
            },
            prerequisites = {"compound-energy-6", "compound-equipment-energy-5", "power-armor-mk2"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-h"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-7",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-equipment-mk8"
                },
                {
                    type = "unlock-recipe",
                    recipe = "battery-mk8-equipment"
                },
                {
                    type = "unlock-recipe",
                    recipe = "fusion-reactor-equipment-mk5"
                }
            },
            prerequisites = {"compound-energy-7", "compound-equipment-energy-6"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-i"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-8",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "fusion-reactor-equipment-mk6"
                }
            },
            prerequisites = {"compound-equipment-energy-7"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-j"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-9",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "fusion-reactor-equipment-mk7"
                }
            },
            prerequisites = {"compound-equipment-energy-8"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-k"
        },
        {
            type = "technology",
            name = "compound-equipment-energy-10",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "fusion-reactor-equipment-mk8"
                }
            },
            prerequisites = {"compound-equipment-energy-9"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
            },
            order = "g-e-l"
        }
    }
)

for i=1, 8, 1 do
    if (i <= 3)
    then
        for j=2, 8, 1 do
            EE(items[i], j)
            EI(items[i], j)
            ER(items[i], j)
        end
    elseif (i == 4)
    then
        for j=2, 6, 1 do
            EE(items[i], j)
            EI(items[i], j)
            ER(items[i], j)
        end
    elseif (i <= 6)
    then
        for j=3, 6, 1 do
            EE(items[i], j)
            EI(items[i], j)
            ER(items[i], j)
        end
    elseif (i <= 8)
    then
        EE(items[i], 2)
        EI(items[i], 2)
        ER(items[i], 2)
    end
end
