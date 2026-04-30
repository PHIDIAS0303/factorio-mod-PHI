local mbe = require 'mbe-c'
local mbm = require 'mbm-c'
local mbq = require 'mbq-c'

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

    if settings.startup['PHI-CT'].value then
        recipes['electric-boiler'].enabled = true
        recipes['electric-boiler'].reload()

        recipes['super-pump'].enabled = true
        recipes['super-pump'].reload()

        recipes['super-radar'].enabled = true
        recipes['super-radar'].reload()

        recipes['passive-energy-void'].enabled = true
        recipes['passive-energy-void'].reload()

        if (not technologies['steel-processing']) or technologies['steel-processing'].researched then
            if recipes['trash-chest'] then
                recipes['trash-chest'].enabled = true
                recipes['trash-chest'].reload()
            end
        end

        if (not technologies['automation']) or technologies['automation'].researched and recipes['trash-pipe'] then
            recipes['trash-pipe'].enabled = true
            recipes['trash-pipe'].reload()
        end

        if (not technologies['heating-tower']) or technologies['heating-tower'].researched and recipes['electric-heating-tower'] then
            recipes['electric-heating-tower'].enabled = true
            recipes['electric-heating-tower'].reload()
        end

        if (not technologies['logistics']) or technologies['logistics'].researched and recipes['underground-belt-a'] then
            recipes['underground-belt-a'].enabled = true
            recipes['underground-belt-a'].reload()
        end

        if (not technologies['logistics-2']) or technologies['logistics-2'].researched and recipes['fast-underground-belt-a'] then
            recipes['fast-underground-belt-a'].enabled = true
            recipes['fast-underground-belt-a'].reload()
        end

        if (not technologies['logistics-3']) or technologies['logistics-3'].researched and recipes['express-underground-belt-a'] then
            recipes['express-underground-belt-a'].enabled = true
            recipes['express-underground-belt-a'].reload()
        end

        if (not technologies['turbo-transport-belt']) or technologies['turbo-transport-belt'].researched and recipes['turbo-underground-belt-a'] then
            recipes['turbo-underground-belt-a'].enabled = true
            recipes['turbo-underground-belt-a'].reload()
        end

        if (not technologies['steel-processing']) or technologies['steel-processing'].researched and recipes['linked-chest'] then
            recipes['linked-chest'].enabled = true
            recipes['linked-chest'].reload()
        end

        if (not technologies['logistics']) or technologies['logistics'].researched and recipes['loader'] then
            recipes['loader'].enabled = true
            recipes['loader'].reload()
        end

        if (not technologies['logistics-2']) or technologies['logistics-2'].researched and recipes['fast-loader'] then
            recipes['fast-loader'].enabled = true
            recipes['fast-loader'].reload()
        end

        if (not technologies['logistics-3']) or technologies['logistics-3'].researched and recipes['express-loader'] then
            recipes['express-loader'].enabled = true
            recipes['express-loader'].reload()
        end

        if (not technologies['turbo-transport-belt']) or technologies['turbo-transport-belt'].researched and recipes['turbo-loader'] then
            recipes['turbo-loader'].enabled = true
            recipes['turbo-loader'].reload()
        end
    end

    if settings.startup['PHI-MB'].value and script.active_mods['space-exploration'] then
        if technologies['se-core-miner'].researched then
            for i = 2, settings.startup['PHI-MB-MACHINE-TIER'].value do
                recipes['se-core-miner-drill-' .. i].enabled = true
                recipes['se-core-miner-drill-' .. i].reload()
            end
        end
    end
end
