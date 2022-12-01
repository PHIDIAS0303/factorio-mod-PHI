data:extend(
{
    {
        type = "energy-shield-equipment",
        name = "energy-shield-mk3-equipment",
        sprite = {filename = "__base__/graphics/equipment/energy-shield-mk2-equipment.png", width = 64, height = 64, priority = "medium", hr_version = {filename = "__base__/graphics/equipment/hr-energy-shield-mk2-equipment.png", width = 128, height = 128, priority = "medium", scale = 0.5}},
        shape = {width = 2, height = 2, type = "full"},
        max_shield_value = 300,
        energy_source = {type = "electric", buffer_capacity = "480kJ", input_flow_limit = "960kW", usage_priority = "primary-input"},
        energy_per_shield = "40kJ",
        categories = {"armor"}
    },
    {
        type = "movement-bonus-equipment",
        name = "exoskeleton-equipment-mk2",
        sprite = {filename = "__base__/graphics/equipment/exoskeleton-equipment.png", width = 64, height = 128, priority = "medium", hr_version = { filename = "__base__/graphics/equipment/hr-exoskeleton-equipment.png", width = 128, height = 256, priority = "medium", scale = 0.5}},
        shape = {width = 2, height = 4, type = "full"},
        energy_source = {type = "electric", usage_priority = "secondary-input"},
        energy_consumption = "400kW",
        movement_bonus = 0.45,
        categories = {"armor"}
    },
    {
        type = "roboport-equipment",
        name = "personal-roboport-mk3-equipment",
        take_result = "personal-roboport-mk3-equipment",
        sprite = {filename = "__base__/graphics/equipment/personal-roboport-mk2-equipment.png", width = 64, height = 64, priority = "medium", hr_version = {filename = "__base__/graphics/equipment/hr-personal-roboport-mk2-equipment.png", width = 128, height = 128, priority = "medium", scale = 0.5}},
        shape = {width = 2, height = 2, type = "full"},
        energy_source = {type = "electric", buffer_capacity = "160MJ", input_flow_limit = "16000KW", usage_priority = "secondary-input"},
        charging_energy = "2000kW",
        robot_limit = 50,
        construction_radius = 25,
        spawn_and_station_height = 0.4,
        spawn_and_station_shadow_height_offset = 0.5,
        charge_approach_distance = 2.6,
        robots_shrink_when_entering_and_exiting = true,
        recharging_animation = {filename = "__base__/graphics/entity/roboport/roboport-recharging.png", draw_as_glow = true, priority = "high", width = 37, height = 35, frame_count = 16, scale = 1.5, animation_speed = 0.5},
        recharging_light = {intensity = 0.2, size = 3, color = {r = 0.5, g = 0.5, b = 1.0}},
        stationing_offset = {0, -0.6},
        charging_station_shift = {0, 0.5},
        charging_station_count = 8,
        charging_distance = 1.6,
        charging_threshold_distance = 5,
        categories = {"armor"}
    },
}
)
