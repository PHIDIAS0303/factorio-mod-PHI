local main = require 'main'
local items = require 'mbe-c'

-- MBE A 5 SPACE_EXPLORATION ENTITY,RECIPE,RESEARCH_EFFECT
for _, v in pairs(items) do
    v.mod = v.mod or 'base'
    v.min = v.min or 2

    if (v.mod and mods[v.mod]) and (v.max >= v.min) then
        v.category = v.category or 'item'
        v.ref_name = v.ref_name or v.name
        v.tech = v.tech or 'compound-energy'

        for j=v.min, v.max, 1 do
            main.EEE(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end

        main.EL(v)
    end
end
