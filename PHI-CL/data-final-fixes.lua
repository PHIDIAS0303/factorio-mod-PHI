if settings.startup['PHI-CT'].value then
    if data.raw['infinity-container']['super-infinity-chest'] then
        local sc = 2

        for c in pairs(defines.prototypes.item) do
            sc = sc + table_size(data.raw[c] or {})
        end

        data.raw['infinity-container']['super-infinity-chest'].inventory_size = sc
    end
end