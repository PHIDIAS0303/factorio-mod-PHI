local main = require 'main'
local items = require 'mbq-c'

-- MBQ A 48 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
for _, v in pairs(items) do
    v.mod = v.mod or 'base'
    v.min = v.min or 2

    if v.enabled and (v.mod and mods[v.mod]) and (v.max >= v.min) then
        v.category = 'equipment'
        v.ref_name = v.ref_name or v.name .. '-equipment'

        for j=v.min, v.max, 1 do
            main.EEQ(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end
    end
end

-- MBQ C 11 BASE ARMOR_EQUIPMENT
if settings.startup['PHI-MB-EQUIPMENT-SIZE'].value then
    for _, e in pairs({'night-vision-equipment', 'energy-shield-equipment', 'battery-equipment', 'solar-panel-equipment', 'generator-equipment','active-defense-equipment', 'movement-bonus-equipment', 'roboport-equipment', 'belt-immunity-equipment', 'inventory-bonus-equipment'}) do
        if data.raw[e] then
            for _, v in pairs(data.raw[e]) do
                v.shape = {width = 1, height = 1, type = 'full', points = {{0, 0}}}
            end
        end
    end
end
