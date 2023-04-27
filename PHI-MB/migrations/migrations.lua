for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes
    
    if technologies['automation'].researched then
        recipes['lab-2'].enabled = true
        recipes['lab-2'].reload()
        recipes['lab-3'].enabled = true
        recipes['lab-3'].reload()

        if recipes['se-fuel-processor'] ~= nil then
            if recipes['se-fuel-processor'].enabled then
                recipes['fuel-processor-2'].enabled = true
                recipes['fuel-processor-2'].reload()
                recipes['fuel-processor-3'].enabled = true
                recipes['fuel-processor-3'].reload()
            end
        end

        if recipes['se-fuel-refinery'] ~= nil then
            if recipes['se-fuel-refinery'].enabled then
                recipes['se-fuel-refinery-2'].enabled = true
                recipes['se-fuel-refinery-2'].reload()
                recipes['se-fuel-refinery-3'].enabled = true
                recipes['se-fuel-refinery-3'].reload()
            end
        end

    elseif technologies['automation-2'].researched then
        if recipes['se-pulveriser'] ~= nil then
            if recipes['se-pulveriser'].enabled then
                recipes['se-pulveriser-2'].enabled = true
                recipes['se-pulveriser-2'].reload()
                recipes['se-pulveriser-3'].enabled = true
                recipes['se-pulveriser-3'].reload()
            end
        end

        if recipes['se-lifesupport-facility'] ~= nil then
            if recipes['se-lifesupport-facility'].enabled then
                recipes['se-lifesupport-facility-2'].enabled = true
                recipes['se-lifesupport-facility-2'].reload()
                recipes['se-lifesupport-facility-3'].enabled = true
                recipes['se-lifesupport-facility-3'].reload()
            end
        end

    elseif technologies['automation-3'].researched then
        recipes['assembling-machine-4'].enabled = true
        recipes['assembling-machine-4'].reload()
        recipes['assembling-machine-5'].enabled = true
        recipes['assembling-machine-5'].reload()

        if recipes['industrial-furnace'] ~= nil then
            if recipes['industrial-furnace'].enabled then
                recipes['industrial-furnace-2'].enabled = true
                recipes['industrial-furnace-2'].reload()
                recipes['industrial-furnace-3'].enabled = true
                recipes['industrial-furnace-3'].reload()
            end
        end

        if recipes['se-space-assembling-machine'] ~= nil then
            if recipes['se-space-assembling-machine'].enabled then
                recipes['se-space-assembling-machine-2'].enabled = true
                recipes['se-space-assembling-machine-2'].reload()
                recipes['se-space-assembling-machine-3'].enabled = true
                recipes['se-space-assembling-machine-3'].reload()
            end
        end

        if recipes['se-space-manufactory'] ~= nil then
            if recipes['se-space-manufactory'].enabled then
                recipes['se-space-manufactory-2'].enabled = true
                recipes['se-space-manufactory-2'].reload()
                recipes['se-space-manufactory-3'].enabled = true
                recipes['se-space-manufactory-3'].reload()
            end
        end

        if recipes['se-casting-machine'] ~= nil then
            if recipes['se-casting-machine'].enabled then
                recipes['se-casting-machine-2'].enabled = true
                recipes['se-casting-machine-2'].reload()
                recipes['se-casting-machine-3'].enabled = true
                recipes['se-casting-machine-3'].reload()
            end
        end

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
    end
end
