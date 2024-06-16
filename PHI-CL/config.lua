local items = {
    ['setting'] = {
        ['PHI-EN'] = {
            type = 'enabled',
            effect = {'solar-panel', 'accumulator', 'boiler', 'steam-engine', 'nuclear-reactor', 'heat-pipe', 'heat-exchanger', 'steam-turbine'}
        },
        ['PHI-EN-SOLAR-TIER'] = {
            type = 'max',
            effect = {'solar-panel', 'accumulator'}
        },
        ['PHI-EN-STEAM-TIER'] = {
            type = 'max',
            effect = {'boiler', 'steam-engine'}
        },
        ['PHI-EN-NUCLEAR-TIER'] = {
            type = 'max',
            effect = {'nuclear-reactor', 'heat-pipe', 'heat-exchanger', 'steam-turbine'}
        }
    },
    ['item'] = {
        ['solar-panel'] = {
            enabled = true,
            stage = 1,
            type = 'solar-panel',
            name = 'solar-panel',
            ref_name = 'solar-panel',
            min = 2,
            max = 8,
            base = 60
        },
        ['accumulator'] = {
            enabled = true,
            stage = 1,
            type = 'accumulator',
            name = 'accumulator',
            ref_name = 'accumulator',
            min = 2,
            max = 8,
            base = 5
        },
        ['boiler'] = {
            enabled = true,
            stage = 1,
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
            stage = 1,
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
            stage = 1,
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
            stage = 1,
            type = 'heat-pipe',
            name = 'heat-pipe',
            ref_name = 'heat-pipe',
            min = 2,
            max = 5,
            temp = 500
        },
        ['heat-exchanger'] = {
            enabled = true,
            stage = 1,
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
            stage = 1,
            type = 'generator',
            name = 'steam-turbine',
            ref_name = 'steam-turbine',
            min = 2,
            max = 5,
            base = 485,
            fluid = 1
        }
    }
}

if mods ~= nil then
    if mods['Krastorio2'] then
        items['item']['solar-panel'].base = 100
        items['item']['accumulator'].base = 10
        items['item']['boiler'].base = 1500
        items['item']['boiler'].temp = 150
        items['item']['boiler'].fluid = 1 / 3
        items['item']['steam-engine'].fluid = 1 / 6
        items['item']['nuclear-reactor'].base = 250
        items['item']['nuclear-reactor'].bonus = 0.25
        items['item']['heat-exchanger'].base = 50000
        items['item']['heat-exchanger'].temp = 400
        items['item']['heat-exchanger'].fluid = 25 / 6
        items['item']['steam-turbine'].base = 400
        items['item']['steam-turbine'].fluid = 5 / 6
        items['item']['heat-pipe'].temp = 400

    elseif mods['space-exploration'] then
        items['item']['solar-panel'].base = 60
        items['item']['accumulator'].base = 5
    end
end

return items