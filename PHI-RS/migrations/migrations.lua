for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    if technologies['advanced-material-processing-2'].researched then
        recipes['electric-filter-furnace'].enabled = true
        recipes['electric-filter-furnace'].reload()
    end
end
