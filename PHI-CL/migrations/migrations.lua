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

    if technologies['power-armor-mk2'].researched and settings.startup['PHI-EQ-ARMOR'].value then
        recipes['power-armor-mk3'].enabled = true
        recipes['power-armor-mk3'].reload()
    end
end
