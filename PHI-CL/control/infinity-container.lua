local main = {}
local chest_filter = {}
local hide = {
    ['parameters'] = true,
    ['spawnables'] = true,
}

do
    for _, q in pairs(prototypes.quality) do
        chest_filter[q.name] = {}
    end

    local j = 1

    for _, i in pairs(prototypes.item) do
        if not (i.hidden or (i.subgroup and hide[i.subgroup])) then
            for _, q in pairs(prototypes.quality) do
                table.insert(chest_filter[q.name], {index = j, name = i.name, quality = q.name, mode = 'exactly', count = i.stack_size})
            end

            j = j + 1
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
    event.entity.get_inventory(defines.inventory.chest).set_bar()
end

return main
