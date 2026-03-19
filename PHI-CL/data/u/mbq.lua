
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
