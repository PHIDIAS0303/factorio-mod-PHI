local hide = {
    ['parameters'] = true,
    ['spawnables'] = true,
}

if data.raw['infinity-container']['super-infinity-chest'] then
    --[[
        3 planner, book
    ]]
    local sc = 5

    for _, c in pairs({'ammo', 'armor', 'capsule', 'gun', 'item', 'item-with-entity-data', 'repair-tool'}) do
        if data.raw[c] then
            for _, i in pairs(data.raw[c]) do
                if not (i.hidden or (i.subgroup and hide[i.subgroup])) then
                    sc = sc + 1
                end
            end
        end
    end

    data.raw['infinity-container']['super-infinity-chest'].inventory_size = sc
end
