local items = require '__PHI-CL__/config'

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for _, v in pairs(items['item']) do
        if v.enabled then
            if (v.type == 'solar-panel') or (v.type == 'accumulator') or (v.type == 'boiler') or (v.type == 'steam-engine') or (v.type == 'nuclear-reactor') or (v.type == 'heat-pipe') or (v.type == 'heat-exchanger') or (v.type == 'steam-turbine') then
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
                        for j=v.min, v.max, 1 do
                            if recipes[v.name .. '-' .. j] ~= nil then
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
