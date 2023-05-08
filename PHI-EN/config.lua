local items = {
    ['solar-panel'] = {
        enabled = true,
        type = 'solar-panel',
        name = 'solar-panel',
        min = 2,
        max = 8,
        base = 60
    },
    ['accumulator'] = {
        enabled = true,
        type = 'accumulator',
        name = 'accumulator',
        min = 2,
        max = 8,
        base = 5
    },
    ['boiler'] = {
        enabled = true,
        type = 'boiler',
        name = 'boiler',
        min = 2,
        max = 8
    },
    ['steam-engine'] = {
        enabled = true,
        type = 'accumulator',
        name = 'accumulator',
        min = 2,
        max = 8,
        base = 5
    }
}

if mods['Krastorio2'] then
    items['solar-panel'].base = 100
    items['accumulator'].base = 10
elseif mods['space-exploration'] then
    items['solar-panel'].base = 60
    items['accumulator'].base = 5
end

return items