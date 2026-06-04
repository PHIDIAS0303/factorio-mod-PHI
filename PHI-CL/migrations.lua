local mbe = require('data.b.mbe-c')
local mbm = require('data.b.mbm-c')
local mbq = require('data.b.mbq-c')

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for _, v in pairs(mbe) do
        v.mod = v.mod or 'base'

        if (v.mod and mods[v.mod]) and (v.max >= (v.min or 2)) then
            v.tech = v.tech or 'compound-energy'

            if (v.tech == 'compound-energy') then
                for j=v.min, v.max, 1 do
                    local vn = (v.ref_name or v.name) .. '-' .. j

                    if ((not technologies['compound-energy-' .. j]) or technologies['compound-energy-' .. j].researched) and recipes[vn] then
                        recipes[vn].enabled = true
                        recipes[vn].reload()
                    end
                end

            elseif (not technologies[v.tech]) or technologies[v.tech].researched then
                for j=v.min, v.max, 1 do
                    local vn = (v.ref_name or v.name) .. '-' .. j

                    if recipes[vn] then
                        recipes[vn].enabled = true
                        recipes[vn].reload()
                    end
                end
            end
        end
    end

    for _, v in pairs(mbm) do
        v.mod = v.mod or 'base'

        if (v.mod and mods[v.mod]) and (v.max >= (v.min or 2)) then
            if (not technologies[v.tech]) or technologies[v.tech].researched then
                for j=v.min, v.max, 1 do
                    local vn = (v.ref_name or v.name) .. '-' .. j

                    if recipes[vn] then
                        recipes[vn].enabled = true
                        recipes[vn].reload()
                    end
                end
            end
        end
    end

    for _, v in pairs(mbq) do
        v.mod = v.mod or 'base'

        if (v.mod and mods[v.mod]) and (v.max >= (v.min or 2)) then
            v.category = 'equipment'

            if (not technologies[v.tech]) or technologies[v.tech].researched then
                for j=v.min, v.max, 1 do
                    local vn = (v.ref_name or v.name) .. '-' .. j .. '-equipment'

                    if recipes[vn] then
                        recipes[vn].enabled = true
                        recipes[vn].reload()
                    end
                end
            end
        end
    end

    if settings.startup['PHI-MB-EQUIPMENT-ARMOR'].value then
        if technologies['power-armor-mk2'] and technologies['power-armor-mk2'].researched and recipes['power-armor-mk3'] then
            recipes['power-armor-mk3'].enabled = true
            recipes['power-armor-mk3'].reload()
        end

        if technologies['mech-armor'] and technologies['mech-armor'].researched and recipes['mech-armor-mk2'] then
            recipes['mech-armor-mk2'].enabled = true
            recipes['mech-armor-mk2'].reload()
        end
    end

    if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        if technologies['steel-processing'] and technologies['steel-processing'].researched then
            if recipes['trash-chest'] then
                recipes['trash-chest'].enabled = true
                recipes['trash-chest'].reload()
            end

            if recipes['linked-chest'] then
                recipes['linked-chest'].enabled = true
                recipes['linked-chest'].reload()
            end
        end

        if technologies['automation'] and technologies['automation'].researched and recipes['trash-pipe'] then
            recipes['trash-pipe'].enabled = true
            recipes['trash-pipe'].reload()
        end

        if technologies['heating-tower'] and technologies['heating-tower'].researched and recipes['electric-heating-tower'] then
            recipes['electric-heating-tower'].enabled = true
            recipes['electric-heating-tower'].reload()
        end

        for _, v in pairs({{'logistics', 'loader'}, {'logistics-2', 'fast-loader'}, {'logistics-3', 'express-loader'}, {'turbo-transport-belt', 'turbo-loader'}}) do
            if technologies[v[1]] and technologies[v[1]].researched and recipes[v[2]] then
                recipes[v[2]].enabled = true
                recipes[v[2]].reload()
            end
        end
    end

    if recipes['electric-boiler'] then
        recipes['electric-boiler'].enabled = true
        recipes['electric-boiler'].reload()
    end

    if recipes['super-pump'] then
        recipes['super-pump'].enabled = true
        recipes['super-pump'].reload()
    end
end
