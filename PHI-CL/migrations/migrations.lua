local items = require '__PHI-CL__/config'

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for _, v in pairs(items['item']) do
        if v.enabled then
            if (v.tech == 'compound-energy') then
                for j=v.min, v.max, 1 do
                    if ((not technologies['compound-energy-' .. j]) or technologies['compound-energy-' .. j].researched) and recipes[v.name .. '-' .. j] then
                        recipes[v.name .. '-' .. j].enabled = true
                        recipes[v.name .. '-' .. j].reload()
                    end
                end

            else
                if (not technologies[v.tech]) or technologies[v.tech].researched then
                    if string.find(v.type, '-equipment') then
                        for j=v.min, v.max, 1 do
                            if recipes[v.name .. '-mk' .. j .. '-equipment'] then
                                recipes[v.name .. '-mk' .. j .. '-equipment'].enabled = true
                                recipes[v.name .. '-mk' .. j .. '-equipment'].reload()
                            end
                        end

                    else
                        for j=v.min, v.max, 1 do
                            if recipes[v.name .. '-' .. j] then
                                recipes[v.name .. '-' .. j].enabled = true
                                recipes[v.name .. '-' .. j].reload()
                            end
                        end
                    end
                end
            end
        end
    end

    if ((not technologies['power-armor-mk2']) or technologies['power-armor-mk2'].researched) and recipes['power-armor-mk3'] then
        recipes['power-armor-mk3'].enabled = true
        recipes['power-armor-mk3'].reload()
    end

    if ((not technologies['mech-armor']) or technologies['mech-armor'].researched) and recipes['mech-armor'] then
        recipes['mech-armor-mk2'].enabled = true
        recipes['mech-armor-mk2'].reload()
    end

    if settings.startup['PHI-CT'].value then
        recipes['electric-boiler'].enabled = true
        recipes['electric-boiler'].reload()

        recipes['super-pump'].enabled = true
        recipes['super-pump'].reload()

        recipes['super-radar'].enabled = true
        recipes['super-radar'].reload()

        recipes['passive-energy-void'].enabled = true
        recipes['passive-energy-void'].reload()

        if (not technologies['steel-processing']) or technologies['steel-processing'].researched then
            if recipes['basic-steel-chest'] then
                recipes['basic-steel-chest'].enabled = true
                recipes['basic-steel-chest'].reload()
            end

            if recipes['trash-chest'] then
                recipes['trash-chest'].enabled = true
                recipes['trash-chest'].reload()
            end
        end

        if ((not technologies['construction-robotics']) or technologies['construction-robotics'].researched) or ((not technologies['logistic-robotics']) or technologies['logistic-robotics'].researched) then
            for _, r in pairs({'passive-provider', 'storage'}) do
                if recipes['basic-' .. r .. '-chest'] then
                    recipes['basic-' .. r .. '-chest'].enabled = true
                    recipes['basic-' .. r .. '-chest'].reload()
                end
            end
        end

        if (not technologies['logistic-system']) or technologies['logistic-system'].researched then
            for _, r in pairs({'active-provider', 'buffer', 'requester'}) do
                if recipes['basic-' .. r .. '-chest'] then
                    recipes['basic-' .. r .. '-chest'].enabled = true
                    recipes['basic-' .. r .. '-chest'].reload()
                end
            end
        end

        if (not technologies['automation']) or technologies['automation'].researched and recipes['trash-pipe'] then
            recipes['trash-pipe'].enabled = true
            recipes['trash-pipe'].reload()
        end

        if (not technologies['heating-tower']) or technologies['heating-tower'].researched and recipes['electric-heating-tower'] then
            recipes['electric-heating-tower'].enabled = true
            recipes['electric-heating-tower'].reload()
        end

        if (not technologies['logistics']) or technologies['logistics'].researched and recipes['underground-belt-a'] then
            recipes['underground-belt-a'].enabled = true
            recipes['underground-belt-a'].reload()
        end

        if (not technologies['logistics-2']) or technologies['logistics-2'].researched and recipes['fast-underground-belt-a'] then
            recipes['fast-underground-belt-a'].enabled = true
            recipes['fast-underground-belt-a'].reload()
        end

        if (not technologies['logistics-3']) or technologies['logistics-3'].researched and recipes['express-underground-belt-a'] then
            recipes['express-underground-belt-a'].enabled = true
            recipes['express-underground-belt-a'].reload()
        end

        if (not technologies['turbo-transport-belt']) or technologies['turbo-transport-belt'].researched and recipes['turbo-underground-belt-a'] then
            recipes['turbo-underground-belt-a'].enabled = true
            recipes['turbo-underground-belt-a'].reload()
        end

        if (not technologies['steel-processing']) or technologies['steel-processing'].researched and recipes['linked-chest'] then
            recipes['linked-chest'].enabled = true
            recipes['linked-chest'].reload()
        end

        if (not technologies['logistics']) or technologies['logistics'].researched and recipes['loader'] then
            recipes['loader'].enabled = true
            recipes['loader'].reload()
        end

        if (not technologies['logistics-2']) or technologies['logistics-2'].researched and recipes['fast-loader'] then
            recipes['fast-loader'].enabled = true
            recipes['fast-loader'].reload()
        end

        if (not technologies['logistics-3']) or technologies['logistics-3'].researched and recipes['express-loader'] then
            recipes['express-loader'].enabled = true
            recipes['express-loader'].reload()
        end

        if (not technologies['turbo-transport-belt']) or technologies['turbo-transport-belt'].researched and recipes['turbo-loader'] then
            recipes['turbo-loader'].enabled = true
            recipes['turbo-loader'].reload()
        end
    end

    if settings.startup['PHI-MB'].value and script.active_mods['space-exploration'] then
        if technologies['se-core-miner'].researched then
            for i = 2, settings.startup['PHI-MB-MACHINE-TIER'].value do
                recipes['se-core-miner-drill-' .. i].enabled = true
                recipes['se-core-miner-drill-' .. i].reload()
            end
        end
    end
end
