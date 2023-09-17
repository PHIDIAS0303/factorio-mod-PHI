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
    },
    ['nuclear-reactor'] = {
        enabled = true,
        type = 'reactor',
        name = 'nuclear-reactor',
        ref_name = 'nuclear-reactor',
        min = 2,
        max = 5
    },
    ['heat-pipe'] = {
        enabled = true,
        type = 'heat-pipe',
        name = 'heat-pipe',
        ref_name = 'heat-pipe',
        min = 2,
        max = 5
    },
    ['heat-exchanger'] = {
        enabled = true,
        type = 'boiler',
        name = 'heat-exchanger',
        ref_name = 'heat-exchanger',
        min = 2,
        max = 5
    },
    ['steam-turbine'] = {
        enabled = true,
        type = 'generator',
        name = 'steam-turbine',
        ref_name = 'steam-turbine',
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