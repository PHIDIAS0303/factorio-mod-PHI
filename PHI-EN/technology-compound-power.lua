data:extend(
    {
        {
            type = "technology",
            name = "compound-energy",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-energy.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-mk2"
                },
                {
                    type = "unlock-recipe",
                    recipe = "accumulator-mk2"
                }
            },
            prerequisites = {"solar-energy", "advanced-electronics", "electric-energy-accumulators"},
            unit = {
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1}
                },
                time = 30
            },
            order = "a-h-d"
        },
        {
            type = "technology",
            name = "compound-energy-2",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-energy.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-mk3"
                },
                {
                    type = "unlock-recipe",
                    recipe = "accumulator-mk3"
                }
            },
            prerequisites = {"compound-energy"},
            unit = {
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                time = 30
            },
            order = "a-h-e"
        },
        {
            type = "technology",
            name = "compound-energy-3",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-energy.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-mk4"
                },
                {
                    type = "unlock-recipe",
                    recipe = "accumulator-mk4"
                }
            },
            prerequisites = {"compound-energy-2"},
            unit = {
                count = 600,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                time = 45
            },
            order = "a-h-f"
        },
        {
            type = "technology",
            name = "compound-energy-4",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-energy.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-mk5"
                },
                {
                    type = "unlock-recipe",
                    recipe = "accumulator-mk5"
                }
            },
            prerequisites = {"compound-energy-3"},
            unit = {
                count = 600,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                time = 60
            },
            order = "a-h-g"
        },
        {
            type = "technology",
            name = "compound-energy-5",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-energy.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-mk6"
                },
                {
                    type = "unlock-recipe",
                    recipe = "accumulator-mk6"
                }
            },
            prerequisites = {"compound-energy-4"},
            unit = {
                count = 800,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 60
            },
            order = "a-h-h"
        },
        {
            type = "technology",
            name = "compound-energy-6",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-energy.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-mk7"
                },
                {
                    type = "unlock-recipe",
                    recipe = "accumulator-mk7"
                }
            },
            prerequisites = {"compound-energy-5"},
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
            order = "a-h-i"
        },
        {
            type = "technology",
            name = "compound-energy-7",
            icon_size = 256,
            icon = "__base__/graphics/technology/solar-energy.png",
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "solar-panel-mk8"
                },
                {
                    type = "unlock-recipe",
                    recipe = "accumulator-mk8"
                }
            },
            prerequisites = {"compound-energy-6"},
            unit = {
                count = 1200,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
            },
            order = "a-h-f"
        }
    }
)