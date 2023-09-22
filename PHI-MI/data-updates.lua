-- electric boiler
data.raw['boiler']['boiler'].fast_replaceable_group = 'boiler'
data.raw['boiler']['electric-boiler'].fast_replaceable_group = data.raw['boiler']['electric-boiler'].fast_replaceable_group

for k, _ in pairs(data.raw) do
    if data.raw[k] ~= nil then
        if data.raw[k].fluid_box ~= nil then
            if data.raw[k].fluid_box.height < 4 then
                data.raw[k].fluid_box.height = 4
            end
            if data.raw[k].fluid_box.base_level < 5 then
                data.raw[k].fluid_box.base_level = 5
            end
        end
        if data.raw[k].output_fluid_box ~= nil then
            if data.raw[k].output_fluid_box.height < 4 then
                data.raw[k].output_fluid_box.height = 4
            end
            if data.raw[k].output_fluid_box.base_level > -5 then
                data.raw[k].output_fluid_box.base_level = -5
            end
        end

        if data.raw[k].fluid_boxes ~= nil then
            for k1, _ in pairs(data.raw[k].fluid_boxes) do
                if data.raw[k].fluid_boxes[k1] ~= false and data.raw[k].fluid_boxes[k1] ~= true then
                    if data.raw[k].fluid_boxes[k1].production_type ~= nil then
                        data.raw[k].fluid_boxes[k1].height = 4

                        if data.raw[k].fluid_boxes[k1].base_level ~= nil then
                            data.raw[k].fluid_boxes[k1].base_level = data.raw[k].fluid_boxes[k1].base_level * 4
                        end
                    end
                end
            end
        end
    end
end
