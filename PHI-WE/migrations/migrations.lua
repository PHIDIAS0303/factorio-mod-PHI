local items = require '__PHI-WE__/config'

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for k, v in pairs(items) do
        if k ~= 'setting' then
            if v.enabled then
                if technologies[v.tech] ~= nil then
                    if technologies[v.tech].researched then
                        for j=v.min, v.max, 1 do
                            recipes[v.name .. '-' .. j].enabled = true
                            recipes[v.name .. '-' .. j].reload()
                        end
                    end
                end
            end
        end
    end
end
