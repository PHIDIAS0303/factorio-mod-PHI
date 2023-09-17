local items = require 'config'

for k, v in pairs(items['setting']) do
    for k2=1, #v.effect do
        items[v.effect[k2]][v.type] = settings.startup[k].value
    end
end

for k, v in pairs(items) do
    if k ~= 'setting' then
        if v.enabled then
            data.raw[v.type][v.ref_name].fast_replaceable_group = v.type

            if v.max > 2 then
                data.raw[v.type][v.name .. '-' .. 2].fast_replaceable_group = data.raw[v.type][v.ref_name].fast_replaceable_group
            end

            if v.max > v.min then
                for j=v.min + 1, v.max do
                    data.raw[v.type][v.name .. '-' .. j].fast_replaceable_group = data.raw[v.type][v.name .. '-' .. (j - 1)].fast_replaceable_group
                end
            end
        end
    end
end
