local items = require '../config'

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for _, v in pairs(items) do
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

--[[
if technologies['automation'].researched then
    recipes['lab-2'].enabled = true
    recipes['lab-2'].reload()
    recipes['lab-3'].enabled = true
    recipes['lab-3'].reload()
end

if technologies['automation-3'].researched then
    recipes['assembling-machine-4'].enabled = true
    recipes['assembling-machine-4'].reload()
    recipes['assembling-machine-5'].enabled = true
    recipes['assembling-machine-5'].reload()
end

if technologies['advanced-material-processing-2'].researched then
    recipes['electric-furnace-2'].enabled = true
    recipes['electric-furnace-2'].reload()
    recipes['electric-furnace-3'].enabled = true
    recipes['electric-furnace-3'].reload()
end

if technologies['oil-processing'].researched then
    recipes['oil-refinery-2'].enabled = true
    recipes['oil-refinery-2'].reload()
    recipes['oil-refinery-3'].enabled = true
    recipes['oil-refinery-3'].reload()

    recipes['chemical-plant-2'].enabled = true
    recipes['chemical-plant-2'].reload()
    recipes['chemical-plant-3'].enabled = true
    recipes['chemical-plant-3'].reload()
end

if technologies['uranium-processing'].researched then
    recipes['centrifuge-2'].enabled = true
    recipes['centrifuge-2'].reload()
    recipes['centrifuge-3'].enabled = true
    recipes['centrifuge-3'].reload()
end

if technologies['industrial-furnace'] ~= nil then
    if technologies['industrial-furnace'].researched then
        recipes['industrial-furnace-2'].enabled = true
        recipes['industrial-furnace-2'].reload()
        recipes['industrial-furnace-3'].enabled = true
        recipes['industrial-furnace-3'].reload()
    end
end

if technologies['fuel-processing'] ~= nil then
    if technologies['fuel-processing'].researched then
        recipes['fuel-processor-2'].enabled = true
        recipes['fuel-processor-2'].reload()
        recipes['fuel-processor-3'].enabled = true
        recipes['fuel-processor-3'].reload()
    end
end

if technologies['se-space-assembling'] ~= nil then
    if technologies['se-space-assembling'].researched then
        recipes['se-space-assembling-machine-2'].enabled = true
        recipes['se-space-assembling-machine-2'].reload()
        recipes['se-space-assembling-machine-3'].enabled = true
        recipes['se-space-assembling-machine-3'].reload()
    end
end

if technologies['se-space-manufactory'] ~= nil then
    if technologies['se-space-manufactory'].researched then
        recipes['se-space-manufactory-2'].enabled = true
        recipes['se-space-manufactory-2'].reload()
        recipes['se-space-manufactory-3'].enabled = true
        recipes['se-space-manufactory-3'].reload()
    end
end

if technologies['se-pyroflux-smelting'] ~= nil then
    if technologies['se-pyroflux-smelting'].researched then
        recipes['se-casting-machine-2'].enabled = true
        recipes['se-casting-machine-2'].reload()
        recipes['se-casting-machine-3'].enabled = true
        recipes['se-casting-machine-3'].reload()
    end
end

if technologies['se-pulveriser'] ~= nil then
    if technologies['se-pulveriser'].researched then
        recipes['se-pulveriser-2'].enabled = true
        recipes['se-pulveriser-2'].reload()
        recipes['se-pulveriser-3'].enabled = true
        recipes['se-pulveriser-3'].reload()
    end
end

if technologies['se-lifesupport-facility'] ~= nil then
    if technologies['se-lifesupport-facility'].researched then
        recipes['se-lifesupport-facility-2'].enabled = true
        recipes['se-lifesupport-facility-2'].reload()
        recipes['se-lifesupport-facility-3'].enabled = true
        recipes['se-lifesupport-facility-3'].reload()
    end
end

if technologies['se-fuel-refining'] ~= nil then
    if technologies['se-fuel-refining'].researched then
        recipes['se-fuel-refinery-2'].enabled = true
        recipes['se-fuel-refinery-2'].reload()
        recipes['se-fuel-refinery-3'].enabled = true
        recipes['se-fuel-refinery-3'].reload()
    end
end
]]