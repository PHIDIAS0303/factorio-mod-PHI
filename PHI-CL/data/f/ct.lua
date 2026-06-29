
if data.raw['infinity-container']['super-infinity-chest'] then
    local sc = 2

    for _, i in pairs(prototypes.item) do
        if not i.hidden and not (i.subgroup and (i.subgroup == 'parameters' or i.subgroup == 'spawnables')) then
            sc = sc + 1
        end
    end

    data.raw['infinity-container']['super-infinity-chest'].inventory_size = sc
end
