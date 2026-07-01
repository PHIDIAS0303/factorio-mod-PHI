local items = {
    ['recipe_reform'] = {
        -- BASE 0
        ['atomic-bomb'] = {
            ingredients = {{type = 'item', name = 'explosives', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'uranium-235', amount = 30}}
        },
        ['cliff-explosives'] = {
            ingredients = {{type = 'item', name = 'explosives', amount = 10}, {type = 'item', name = 'grenade', amount = 1}, {type = 'item', name = 'barrel', amount = 1}}
        },
        ['artillery-turret'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'concrete', amount = 60}, {type = 'item', name = 'iron-gear-wheel', amount = 40}, {type = 'item', name = 'advanced-circuit', amount = 20}}
        },
        ['artillery-shell'] = {
            ingredients = {{type = 'item', name = 'explosive-cannon-shell', amount = 4}, {type = 'item', name = 'radar', amount = 1}, {type = 'item', name = 'explosives', amount = 8}}
        },
        ['artillery-wagon'] = {
            ingredients = {{type = 'item', name = 'engine-unit', amount = 64}, {type = 'item', name = 'iron-gear-wheel', amount = 10}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'pipe', amount = 16}, {type = 'item', name = 'advanced-circuit', amount = 20}}
        },
        -- BASE 5
        -- SPACE_AGE 0
        ['foundation'] = {
            categories = {'crafting'},
            ingredients = {{type = 'item', name = 'landfill', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 10}, {type = 'item', name = 'steel-plate', amount = 10}},
            results = {{type = 'item', name = 'foundation', amount = 1}}
        }
    },
    ['technology_reform'] = {
        -- BASE 0
        ['cliff-explosives'] = {
            prerequisites = {'explosives', 'military-2'},
            unit = {count = 200, time = 15, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'cliff-explosives'}, {type = 'cliff-deconstruction-enabled', modifier = true}}
        },
        -- ELEVATED_RAIL 0
        ['elevated-rail'] = {
            prerequisites = {'concrete', 'railway'},
            unit_count = 400,
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}
        },
        -- SPACE_AGE 0
        ['foundation'] = {
            prerequisites = {'rail-support-foundations'},
            unit_count = 1000,
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        },
        ['rail-support-foundations'] = {
            prerequisites = {'elevated-rail', 'planet-discovery-fulgora'},
            unit_count = 600,
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        },
    },
    ['technology'] = {
        -- SPACE_AGE 0
        ['artillery-shell-damage-1'] = true,
        ['railgun-damage-1'] = true,
        ['railgun-shooting-speed-1'] = true,
        ['electric-weapons-damage-1'] = true,
        ['electric-weapons-damage-2'] = true,
        -- SPACE_AGE 5
        ['electric-weapons-damage-3'] = true,
        ['electric-weapons-damage-4'] = true,
    }
}

return items
