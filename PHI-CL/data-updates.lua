local items = require 'config'
local main = require 'main'
local file_stage = 2

if mods['space-age'] and settings.startup['PHI-VP'].value and settings.startup['PHI-VP-MAIN'].value then
    for k, v in pairs(data.raw.recipe) do
        if v.category == 'recycling' then
            data.raw.recipe[k] = nil
        end
    end
end

for _, v in pairs(items['item']) do
    if (v.stage == file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'item'

        for j=v.min, v.max, 1 do
            main.EEE(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end

        main.EL(v)
    end
end

for _, v in pairs(items['equipment']) do
    if (v.stage == file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'equipment'

        for j=v.min, v.max, 1 do
            main.EEQ(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end
    end
end
