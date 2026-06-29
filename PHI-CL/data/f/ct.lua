local hide = {
    ['parameters'] = true,
    ['spawnables'] = true,
}

if data.raw['infinity-container']['super-infinity-chest'] then
    local sc = 1

    for _, c in pairs({'ammo', 'armor', 'capsule', 'gun', 'item'}) do
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
