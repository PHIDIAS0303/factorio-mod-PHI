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