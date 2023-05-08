for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    if technologies['steel-processing'].researched then
        recipes['ups-steel-chest'].enabled = true
        recipes['ups-steel-chest'].reload()

    elseif technologies['construction-robotics'].researched then
        recipes['ups-logistic-chest-passive-provider'].enabled = true
        recipes['ups-logistic-chest-passive-provider'].reload()
        recipes['ups-logistic-chest-storage'].enabled = true
        recipes['ups-logistic-chest-storage'].reload()

    elseif technologies['logistic-robotics'].researched then
        recipes['ups-logistic-chest-passive-provider'].enabled = true
        recipes['ups-logistic-chest-passive-provider'].reload()
        recipes['ups-logistic-chest-storage'].enabled = true
        recipes['ups-logistic-chest-storage'].reload()

    elseif technologies['logistic-system'].researched then
        recipes['ups-logistic-chest-active-provider'].enabled = true
        recipes['ups-logistic-chest-active-provider'].reload()
        recipes['ups-logistic-chest-buffer'].enabled = true
        recipes['ups-logistic-chest-buffer'].reload()
        recipes['ups-logistic-chest-requester'].enabled = true
        recipes['ups-logistic-chest-requester'].reload()
    end
end
