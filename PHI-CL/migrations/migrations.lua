local items = require '__PHI-CL__/config'

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for _, v in pairs(items['item']) do
        if v.enabled then
            if (v.tech == 'compound-energy') then
                for j=v.min, v.max, 1 do
                    if technologies['compound-energy-' .. j] ~= nil then
                        if technologies['compound-energy-' .. j].researched then
                            if recipes[v.name .. '-' .. j] ~= nil then
                                recipes[v.name .. '-' .. j].enabled = true
                                recipes[v.name .. '-' .. j].reload()
                            end
                        end
                    end
                end

            else
                if technologies[v.tech] then
                    if technologies[v.tech].researched then
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
    end

    if technologies['power-armor-mk2'].researched then
        if settings.startup['PHI-EQ'].value and settings.startup['PHI-EQ-ARMOR'].value then
            recipes['power-armor-mk3'].enabled = true
            recipes['power-armor-mk3'].reload()
        end
    end

    if technologies['steel-processing'].researched then
        if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-CHEST'].value then
            recipes['basic-steel-chest'].enabled = true
            recipes['basic-steel-chest'].reload()
        end
    end

    if technologies['construction-robotics'].researched then
        if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-CHEST'].value then
            recipes['basic-logistic-chest-passive-provider'].enabled = true
            recipes['basic-logistic-chest-passive-provider'].reload()
            recipes['basic-logistic-chest-storage'].enabled = true
            recipes['basic-logistic-chest-storage'].reload()
        end
    end

    if technologies['logistic-robotics'].researched then
        if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-CHEST'].value then
            recipes['basic-logistic-chest-passive-provider'].enabled = true
            recipes['basic-logistic-chest-passive-provider'].reload()
            recipes['basic-logistic-chest-storage'].enabled = true
            recipes['basic-logistic-chest-storage'].reload()
        end
    end

    if technologies['logistic-system'].researched then
        if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-CHEST'].value then
            recipes['basic-logistic-chest-active-provider'].enabled = true
            recipes['basic-logistic-chest-active-provider'].reload()
            recipes['basic-logistic-chest-buffer'].enabled = true
            recipes['basic-logistic-chest-buffer'].reload()
            recipes['basic-logistic-chest-requester'].enabled = true
            recipes['basic-logistic-chest-requester'].reload()
        end
    end

    if settings.startup['PHI-CT'].value then
        if settings.startup['PHI-CT-RECIPE'].value then
            recipes['wood-production'].enabled = true
            recipes['wood-production'].reload()
            recipes['fish-production'].enabled = true
            recipes['fish-production'].reload()
        end

        if settings.startup['PHI-CT-OIL'].value then
            recipes['oil-pump'].enabled = true
            recipes['oil-pump'].reload()
        end

        if settings.startup['PHI-CT-RADAR'].value then
            recipes['super-radar'].enabled = true
            recipes['super-radar'].reload()
        end

        if settings.startup['PHI-CT-TRASH'].value then
            recipes['trash-chest'].enabled = true
            recipes['trash-chest'].reload()
            recipes['trash-pipe'].enabled = true
            recipes['trash-pipe'].reload()
        end

        if settings.startup['PHI-CT-MINER'].value then
            recipes['large-area-electric-mining-drill'].enabled = true
            recipes['large-area-electric-mining-drill'].reload()
        end

        if settings.startup['PHI-CT-LOADER'].value then
            if technologies['logistics'].researched then
                recipes['loader'].enabled = true
                recipes['loader'].reload()
            end

            if technologies['logistics-2'].researched then
                recipes['fast-loader'].enabled = true
                recipes['fast-loader'].reload()
            end

            if technologies['logistics-3'].researched then
                recipes['express-loader'].enabled = true
                recipes['express-loader'].reload()
            end
        end

        if settings.startup['PHI-CT-ENERGY'].value then
            if technologies['electric-energy-accumulators'].researched then
                recipes['passive-energy-void'].enabled = true
                recipes['passive-energy-void'].reload()
            end
        end
    end

    if settings.startup['PHI-RS'].value then
        recipes['electric-filter-furnace'].enabled = true
        recipes['electric-filter-furnace'].reload()
    end

    if settings.startup['PHI-MB'].value then
        recipes['satellite-2'].enabled = true
        recipes['satellite-2'].reload()
        recipes['satellite-3'].enabled = true
        recipes['satellite-3'].reload()

        if script.active_mods['space-exploration'] then
            if technologies['se-core-miner'].researched then
                for i=2, settings.startup['PHI-MB-MINING-TIER'].value do
                    recipes['se-core-miner-' .. i].enabled = true
                    recipes['se-core-miner-' .. i].reload()
                end
            end
        end
    end
end
