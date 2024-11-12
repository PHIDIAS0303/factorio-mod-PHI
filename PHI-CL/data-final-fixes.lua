local items = require 'config'
local main = require 'main'

for _, v in pairs(items['item']) do
    if v.enabled and (v.max >= v.min) then
        v.category = 'item'

        for j=v.min, v.max, 1 do
            main.EEEC(v, j)
        end
    end
end
