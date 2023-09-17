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
        max = 5,
        base = 1800,
        temp = 150,
        fluid = 1
    },
    ['steam-engine'] = {
        enabled = true,
        type = 'generator',
        name = 'steam-engine',
        ref_name = 'steam-engine',
        min = 2,
        max = 5,
        base = 150,
        fluid = 1 / 2
    },
    ['nuclear-reactor'] = {
        enabled = true,
        type = 'reactor',
        name = 'nuclear-reactor',
        ref_name = 'nuclear-reactor',
        min = 2,
        max = 5,
        base = 40,
        bonus = 1,
        temp = 500
    },
    ['heat-pipe'] = {
        enabled = true,
        type = 'heat-pipe',
        name = 'heat-pipe',
        ref_name = 'heat-pipe',
        min = 2,
        max = 5,
        temp = 500
    },
    ['heat-exchanger'] = {
        enabled = true,
        type = 'boiler',
        name = 'heat-exchanger',
        ref_name = 'heat-exchanger',
        min = 2,
        max = 5,
        base = 10000,
        temp = 485,
        fluid = 103 / 60
    },
    ['steam-turbine'] = {
        enabled = true,
        type = 'generator',
        name = 'steam-turbine',
        ref_name = 'steam-turbine',
        min = 2,
        max = 5,
        base = 485,
        fluid = 1
    }
}

if mods ~= nil then
    if mods['Krastorio2'] then
        items['solar-panel'].base = 100
        items['accumulator'].base = 10
        items['boiler'].base = 1500
        items['boiler'].temp = 150
        items['boiler'].fluid = 1 / 3
        items['steam-engine'].fluid = 1 / 6
        items['nuclear-reactor'].base = 250
        items['nuclear-reactor'].bonus = 0.25
        items['heat-exchanger'].base = 50000
        items['heat-exchanger'].temp = 400
        items['heat-exchanger'].fluid = 25 / 6
        items['steam-turbine'].base = 400
        items['steam-turbine'].fluid = 5 / 6
        items['heat-pipe'].temp = 400
    elseif mods['space-exploration'] then
        items['solar-panel'].base = 60
        items['accumulator'].base = 5
    end
end

return items