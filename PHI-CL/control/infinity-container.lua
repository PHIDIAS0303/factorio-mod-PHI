local main = {}
local chest_filter = {}

do
    for _, q in pairs(prototypes.quality) do
        local q_name = q.name
        local j = 0
        chest_filter[q_name] = {}

        for _, i in pairs(prototypes.item) do
            if not i.hidden and not (i.subgroup and i.subgroup == 'parameters') then
                j = j + 1
                table.insert(chest_filter[q_name], {index = j, name = i.name, quality = q_name, mode = 'exactly', count = i.stack_size})
            end
        end
    end
end

function main.build(event)
    if event.entity.type ~= 'infinity-container' then
        return
    end

    if event.entity.name ~= 'super-infinity-chest' then
        return
    end

    event.entity.remove_unfiltered_items = true
    event.entity.infinity_container_filters = chest_filter[event.entity.quality.name]
end

return main
