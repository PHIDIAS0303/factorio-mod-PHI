local items = require '__PHI-EQ__/config'

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for k, v in pairs(items) do
        if k ~= 'setting' then
            if v.enabled then
                if technologies[v.tech] ~= nil then
                    if technologies[v.tech].researched then
                        for j=v.min, v.max, 1 do
                            recipes[v.name .. '-mk' .. j .. '-equipment'].enabled = true
                            recipes[v.name .. '-mk' .. j .. '-equipment'].reload()
                        end
                    end
                end
            end
        end
    end

    if technologies['power-armor-mk2'].researched then
        recipes['power-armor-mk3'].enabled = true
        recipes['power-armor-mk3'].reload()
    end
end
