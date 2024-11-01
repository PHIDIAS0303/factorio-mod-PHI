local items = require 'config'
local main = require 'main'
local file_stage = 2

if items['handle'][file_stage]['item'] then
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
end

if items['handle'][file_stage]['equipment'] then
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
end
