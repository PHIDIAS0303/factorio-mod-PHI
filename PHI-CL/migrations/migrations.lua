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

    if settings.startup['PHI-EQ'].value and settings.startup['PHI-EQ-ARMOR'].value then
        if (not technologies['power-armor-mk2']) or technologies['power-armor-mk2'].researched then
            recipes['power-armor-mk3'].enabled = true
            recipes['power-armor-mk3'].reload()
        end

        if (not technologies['mech-armor']) or technologies['mech-armor'].researched then
            recipes['mech-armor-mk2'].enabled = true
            recipes['mech-armor-mk2'].reload()
        end
    end

    if settings.startup['PHI-CT'].value then
        if settings.startup['PHI-CT-UTILITY'].value then
            if (not technologies['steel-processing']) or technologies['steel-processing'].researched then
                recipes['basic-steel-chest'].enabled = true
                recipes['basic-steel-chest'].reload()
            end

            if ((not technologies['construction-robotics']) or technologies['construction-robotics'].researched) or ((not technologies['logistic-robotics']) or technologies['logistic-robotics'].researched) then
                recipes['basic-passive-provider-chest'].enabled = true
                recipes['basic-passive-provider-chest'].reload()
                recipes['basic-storage-chest'].enabled = true
                recipes['basic-storage-chest'].reload()
            end

            if (not technologies['logistic-system']) or technologies['logistic-system'].researched then
                recipes['basic-active-provider-chest'].enabled = true
                recipes['basic-active-provider-chest'].reload()
                recipes['basic-buffer-chest'].enabled = true
                recipes['basic-buffer-chest'].reload()
                recipes['basic-requester-chest'].enabled = true
                recipes['basic-requester-chest'].reload()
            end
        end

        if settings.startup['PHI-CT-TOOL'].value then
            recipes['super-pump'].enabled = true
            recipes['super-pump'].reload()

            recipes['super-radar'].enabled = true
            recipes['super-radar'].reload()

            if (not technologies['electric-energy-accumulators']) or technologies['electric-energy-accumulators'].researched then
                recipes['passive-energy-void'].enabled = true
                recipes['passive-energy-void'].reload()
            end
        end

        if settings.startup['PHI-CT-UTILITY'].value then
            if (not technologies['automation']) or technologies['automation'].researched then
                recipes['trash-chest'].enabled = true
                recipes['trash-chest'].reload()
                recipes['trash-pipe'].enabled = true
                recipes['trash-pipe'].reload()
            end

            if (not technologies['logistics']) or technologies['logistics'].researched then
                recipes['underground-belt-A'].enabled = true
                recipes['underground-belt-A'].reload()
            end

            if (not technologies['logistics-2']) or technologies['logistics-2'].researched then
                recipes['fast-underground-belt-A'].enabled = true
                recipes['fast-underground-belt-A'].reload()
            end

            if (not technologies['logistics-3']) or technologies['logistics-3'].researched then
                recipes['express-underground-belt-A'].enabled = true
                recipes['express-underground-belt-A'].reload()
            end

            --[[
            if (not technologies['turbo-transport-belt']) or technologies['turbo-transport-belt'].researched then
                recipes['turbo-underground-belt-A'].enabled = true
                recipes['turbo-underground-belt-A'].reload()
            end
            ]]
        end

        if settings.startup['PHI-CT-HIDDEN'].value then
            if (not technologies['logistics']) or technologies['logistics'].researched then
                recipes['loader'].enabled = true
                recipes['loader'].reload()
            end

            if (not technologies['logistics-2']) or technologies['logistics-2'].researched then
                recipes['fast-loader'].enabled = true
                recipes['fast-loader'].reload()
            end

            if (not technologies['logistics-3']) or technologies['logistics-3'].researched then
                recipes['express-loader'].enabled = true
                recipes['express-loader'].reload()
            end

            if (not technologies['turbo-transport-belt']) or technologies['turbo-transport-belt'].researched then
                recipes['turbo-loader'].enabled = true
                recipes['turbo-loader'].reload()
            end
        end
    end
end
