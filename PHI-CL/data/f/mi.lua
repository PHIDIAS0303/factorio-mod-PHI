local items = require('mi-c')

function status_number_position(entity)
    local box = entity.selection_box or entity.collision_box

    if not box then
        return
    end

    if not box.left_top and not box.right_bottom and type(box[1]) == 'table' and type(box[2]) == 'table' then
        box = {
            left_top = {x = box[1][1], y = box[1][2]},
            right_bottom = {x = box[2][1], y = box[2][2]}
        }
    end

    local w = box.right_bottom.x - box.left_top.x
    local h = box.right_bottom.y - box.left_top.y
    local cx = (box.left_top.x + box.right_bottom.x) / 2
    local cy = (box.left_top.y + box.right_bottom.y) / 2

    local positions = {
        [1] = {
            x = cx - 0.2 * w,
            y = cy + h / 2 - 0.25
        },
        [2] = {
            x = cx - 0.2 * h,
            y = cy + w / 2 - 0.25
        }
    }

    return positions
end

function status_apply(entity_graphic, positions)
    entity_graphic.status_colors = items['status']

    if not entity_graphic.working_visualisations then
        entity_graphic.working_visualisations = {}
    end

    if not positions then
        return
    end

    entity_graphic.working_visualisations[#entity_graphic.working_visualisations + 1] = {
        always_draw = true,
        apply_tint = 'status',
        render_layer = 'light-effect',
        animation = {
            filename = '__base__/graphics/icons/signal/signal_white.png',
            flags = {'icon'},
            size = 64,
            scale = 0.15,
            line_length = 1,
            frame_count = 1,
            animation_speed = 1,
            draw_as_glow = true
        },
        north_position = positions[1],
        east_position = positions[2],
        south_position = positions[1],
        west_position = positions[2],
    }
end

function status(entity)
    if entity.bottleneck_ignore or items['status_ignore'][entity.name] then
        return
    end

    local pos = status_number_position(entity)

    for _, a in pairs({'graphics_set', 'wet_mining_graphics_set', 'graphics_set_flipped'}) do
        if entity[a] then
            status_apply(entity[a], pos)
        end
    end
end

-- MI C 11 BASE ENTITY
-- MI C 1 RECYCLER ENTITY
-- MI C 9 SPACE_AGE ENTITY
if settings.startup['PHI-MI-STATUS'].value and items['status'] and items['status_ignore'] then
    for _, c in pairs({'assembling-machine', 'furnace', 'mining-drill', 'thruster', 'agricultural-tower'}) do
        if data.raw[c] then
            for _, v in pairs(data.raw[c]) do
                status(v)
            end
        end
    end
end
