local main = require('main')
local items = require('mbm-c')

-- MBE A 24 BASE ENTITY,RECIPE,RESEARCH_EFFECT
-- MBE A 24 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
-- MBE A 2 QUALITY ENTITY,RECIPE,RESEARCH_EFFECT
for _, v in pairs(items) do
    v.mod = v.mod or 'base'
    v.min = v.min or 2
    v.ref_name = v.ref_name or v.name

    if (v.mod and mods[v.mod]) and (v.max >= v.min) and data.raw[v.type] and data.raw[v.type][v.ref_name] and not data.raw[v.type][v.ref_name].hidden then
        v.category = v.category or 'item'

        for j=v.min, v.max, 1 do
            main.EEE(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end

        main.EL(v)
    end
end

if data.raw['assembling-machine'] and data.raw['assembling-machine']['assembling-machine-1'] and settings.startup['PHI-MB-MACHINE'].value > 1 then
    for i = 4, settings.startup['PHI-MB-MACHINE'].value + 2 do
        if data.raw['assembling-machine']['assembling-machine-' .. i] then
            data.raw['assembling-machine']['assembling-machine-' .. i].localised_name = {'phi-cl.combine', {'entity-name.assembling-machine-1'}, tostring(i)}
            data.raw['item']['assembling-machine-' .. i].localised_name = {'phi-cl.combine', {'entity-name.assembling-machine-1'}, tostring(i)}
            data.raw['recipe']['assembling-machine-' .. i].localised_name = {'phi-cl.combine', {'entity-name.assembling-machine-1'}, tostring(i)}
        end
    end
end
