local items = require '__PHI-RS__/config'

for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    if technologies['advanced-material-processing-2'].researched then
        recipes['electric-filter-furnace'].enabled = true
        recipes['electric-filter-furnace'].reload()
    end

    for _, v in pairs(items) do
        if technologies[v.tech] then
            if technologies[v.tech].researched then
                if recipes[v.name .. '-s1'] ~= nil then
                    recipes[v.name .. '-s1'].enabled = true
                    recipes[v.name .. '-s1'].reload()
                end
                if recipes[v.name .. '-s2'] ~= nil then
                    recipes[v.name .. '-s2'].enabled = true
                    recipes[v.name .. '-s2'].reload()
                end
            end
        end
    end
end
