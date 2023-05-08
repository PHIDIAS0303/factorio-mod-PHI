local items = {
    ['solar-panel'] = {
        enabled = true,
        type = 'solar-panel',
        name = 'solar-panel',
        ref_name = 'solar-panel',
        min = 2,
        max = 8,
        base = 60
    },
    ['accumulator'] = {
        enabled = true,
        type = 'accumulator',
        name = 'accumulator',
        ref_name = 'accumulator',
        min = 2,
        max = 8,
        base = 5
    },
    ['boiler'] = {
        enabled = true,
        type = 'boiler',
        name = 'boiler',
        ref_name = 'boiler',
        min = 2,
        max = 5
    },
    ['steam-engine'] = {
        enabled = true,
        type = 'generator',
        name = 'steam-engine',
        ref_name = 'steam-engine',
        min = 2,
        max = 5
    }
}

if mods ~= nil then
    if mods['Krastorio2'] then
        items['solar-panel'].base = 100
        items['accumulator'].base = 10
    elseif mods['space-exploration'] then
        items['solar-panel'].base = 60
        items['accumulator'].base = 5
    end
end

return items