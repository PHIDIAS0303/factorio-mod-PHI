local items = require '__PHI-EN__/config'

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for k, v in pairs(items) do
        if k ~= 'setting' then
            if v.enabled then
                for j=v.min, v.max, 1 do
                    if technologies['compound-energy-' .. j] ~= nil then
                        if technologies['compound-energy-' .. j].researched then
                            recipes[v.name .. '-' .. j].enabled = true
                            recipes[v.name .. '-' .. j].reload()
                        end
                    end
                end
            end
        end
    end
end
