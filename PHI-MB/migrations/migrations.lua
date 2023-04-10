for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes
    
    if technologies['automation-3'].researched then
        recipes['assembling-machine-4'].enabled = true
        recipes['assembling-machine-4'].reload()
        recipes['assembling-machine-5'].enabled = true
        recipes['assembling-machine-5'].reload()

    elseif technologies['advanced-material-processing-2'].researched then
        recipes['electric-furnace-2'].enabled = true
        recipes['electric-furnace-2'].reload()
        recipes['electric-furnace-3'].enabled = true
        recipes['electric-furnace-3'].reload()

    elseif technologies['oil-processing'].researched then
        recipes['oil-refinery-2'].enabled = true
        recipes['oil-refinery-2'].reload()
        recipes['oil-refinery-3'].enabled = true
        recipes['oil-refinery-3'].reload()
        recipes['chemical-plant-2'].enabled = true
        recipes['chemical-plant-2'].reload()
        recipes['chemical-plant-3'].enabled = true
        recipes['chemical-plant-3'].reload()

    elseif technologies['uranium-processing'].researched then
        recipes['centrifuge-2'].enabled = true
        recipes['centrifuge-2'].reload()
        recipes['centrifuge-3'].enabled = true
        recipes['centrifuge-3'].reload()

    elseif technologies['automation'].researched then
        recipes['lab-2'].enabled = true
        recipes['lab-2'].reload()
        recipes['lab-3'].enabled = true
        recipes['lab-3'].reload()

    end
end
