local hide = {
    ['parameters'] = true,
    ['spawnables'] = true,
}

if data.raw['infinity-container']['super-infinity-chest'] then
    local sc = 1

    for _, i in pairs(data.raw.item) do
        if not (i.hidden or (i.subgroup and hide[i.subgroup])) then
            sc = sc + 1
        end
    end

    data.raw['infinity-container']['super-infinity-chest'].inventory_size = sc
end
