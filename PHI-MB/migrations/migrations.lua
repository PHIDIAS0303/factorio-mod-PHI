for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes
    
    if technologies['compound-energy-1'].researched then
        recipes['assembling-machine-4'].enabled = true
        recipes['assembling-machine-4'].reload()
        recipes['electric-furnace-2'].enabled = true
        recipes['electric-furnace-2'].reload()
        recipes['chemical-plant-2'].enabled = true
        recipes['chemical-plant-2'].reload()
        recipes['oil-refinery-2'].enabled = true
        recipes['centrifuge-2'].enabled = true
        recipes['centrifuge-2'].reload()
        recipes['oil-refinery-2'].reload()
        recipes['lab-2'].enabled = true
        recipes['lab-2'].reload()
    elseif technologies['compound-energy-2'].researched then
        recipes['assembling-machine-5'].enabled = true
        recipes['assembling-machine-5'].reload()
        recipes['electric-furnace-3'].enabled = true
        recipes['electric-furnace-3'].reload()
        recipes['chemical-plant-3'].enabled = true
        recipes['chemical-plant-3'].reload()
        recipes['oil-refinery-3'].enabled = true
        recipes['oil-refinery-3'].reload()
        recipes['centrifuge-3'].enabled = true
        recipes['centrifuge-3'].reload()
        recipes['lab-3'].enabled = true
        recipes['lab-3'].reload()
    end
end
