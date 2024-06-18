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
end
