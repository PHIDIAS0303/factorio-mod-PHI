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
}

return items
