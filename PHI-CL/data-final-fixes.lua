
if mods['space-age'] and settings.startup['PHI-MB-ENERGY'].value > 1 then
    for i=2, settings.startup['PHI-MB-ENERGY'].value do
        if data.raw.recipe['accumulator-' .. i] then
            data.raw.recipe['accumulator-' .. i].category = 'electronics'
        end

        if data.raw.recipe['solar-panel-' .. i] then
            data.raw.recipe['solar-panel-' .. i].category = 'electronics'
        end
    end
end
