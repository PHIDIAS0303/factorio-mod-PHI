local items = require 'config'
local math2d = require('math2d')

if settings.startup['PHI-CT'].value then
    local function trash_creation(event)
        local entity = event.created_entity or event.entity

        if not (entity and entity.valid) then
            return
        end
        if entity.name == 'trash-chest' then
            entity.infinity_container_filters = {}
            entity.remove_unfiltered_items = true

        elseif entity.name == 'trash-pipe' then
            entity.set_infinity_pipe_filter(nil)
        end
    end

    local function trash_check()
        for _, surface in pairs(game.surfaces) do
            for _, e in pairs(surface.find_entities_filtered{name='trash-chest'}) do
                e.infinity_container_filters = {}
                e.remove_unfiltered_items = true
            end

            for _, e in pairs(surface.find_entities_filtered{name='trash-pipe'}) do
                e.set_infinity_pipe_filter(nil)
            end
        end
    end

    script.on_event(defines.events.on_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
    script.on_event(defines.events.on_robot_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
    script.on_event(defines.events.script_raised_built, trash_creation)
    script.on_event(defines.events.script_raised_revive, trash_creation)

    local function hidden_recipe_enable(e)
        local enable = (e.name == defines.events.on_player_cheat_mode_enabled and true) or false
        local force = game.players[e.player_index].force

        for _, v in pairs(prototypes.fluid) do
            force.recipes['pump-' .. v.name].enabled = enable
        end

        force.recipes['super-radar'].enabled = enable
        force.recipes['passive-energy-void'].enabled = enable
        force.recipes['linked-chest'].enabled = enable
        force.recipes['infinity-chest'].enabled = enable
        force.recipes['infinity-cargo-wagon'].enabled = enable
        force.recipes['infinity-pipe'].enabled = enable
    end

    script.on_event(defines.events.on_player_cheat_mode_enabled, hidden_recipe_enable)
    script.on_event(defines.events.on_player_cheat_mode_disabled, hidden_recipe_enable)

    local gui = {}
    local inserter_utils = {}
    math2d.direction = {vectors = {{x = 0, y = -1}, {x = 1, y = -1}, {x = 1, y = 0}, {x = 1, y = 1}, {x = 0, y = 1}, {x = -1, y = 1}, {x = -1, y = 0}, {x = -1, y = -1}}}

    function inserter_utils.get_arm_positions(inserter)
        local pos = math2d.position.ensure_xy(inserter.position)
        local x_int, x_frac, y_int, y_frac = math.modf(pos.x), math.modf(pos.y)
        local base_tile = {x = x_frac < 0 and (x_int - 1) or x_int, y = y_frac < 0 and (y_int - 1) or y_int}
        local pos2 = math2d.position.ensure_xy(inserter.drop_position)
        local x_int2, x_frac2, y_int2, y_frac2 = math.modf(pos2.x), math.modf(pos2.y)
        local pos3 = math2d.position.ensure_xy(inserter.pickup_position)
        local x_int3, x_frac3, y_int3, y_frac3 = math.modf(pos3.x), math.modf(pos3.y)

        return {
            base = base_tile,
            base_offset = {x = x_frac < 0 and (x_frac + 1) or x_frac, y = y_frac < 0 and (y_frac + 1) or y_frac},
            drop = math2d.position.subtract({x = x_frac2 < 0 and (x_int2 - 1) or x_int2, y = y_frac2 < 0 and (y_int2 - 1) or y_int2}, base_tile),
            drop_offset = {x = (((x_frac2 < 0 and (x_frac2 + 1) or x_frac2) > 0.5 and 1) or ((x_frac2 < 0 and (x_frac2 + 1) or x_frac2) < 0.5 and -1)) or 0, y = (((y_frac2 < 0 and (y_frac2 + 1) or y_frac2) > 0.5 and 1) or ((y_frac2 < 0 and (y_frac2 + 1) or y_frac2) < 0.5 and -1)) or 0},
            pickup = math2d.position.subtract({x = x_frac3 < 0 and (x_int3 - 1) or x_int3, y = y_frac3 < 0 and (y_int3 - 1) or y_int3}, base_tile)
        }
    end

    function inserter_utils.set_arm_positions(inserter, positions)
        inserter.pickup_position = (positions.pickup and math2d.position.add(inserter.position, positions.pickup)) or nil

        if positions.drop or positions.drop_offset then
            local pos = math2d.position.ensure_xy(inserter.position)
            local x_int, x_frac, y_int, y_frac = math.modf(pos.x), math.modf(pos.y)
            local pos2 = math2d.position.ensure_xy(inserter.drop_position)
            local x_int2, x_frac2, y_int2, y_frac2 = math.modf(pos2.x), math.modf(pos2.y)
            local old_drop_tile, old_drop_offset = {x = x_frac2 < 0 and (x_int2 - 1) or x_int2, y = y_frac2 < 0 and (y_int2 - 1) or y_int2}, {x = x_frac2 < 0 and (x_frac2 + 1) or x_frac2, y = y_frac2 < 0 and (y_frac2 + 1) or y_frac2}
            inserter.drop_position = math2d.position.add((positions.drop and math2d.position.add({x = x_frac < 0 and (x_int - 1) or x_int, y = y_frac < 0 and (y_int - 1) or y_int}, positions.drop)) or old_drop_tile, (positions.drop_offset and math2d.position.add(math2d.position.multiply_scalar(positions.drop_offset, 0.2), {0.5, 0.5})) or old_drop_offset)
        end
    end

    function gui.create(player)
        if player.gui.relative.inserter_config then
            player.gui.relative.inserter_config.destroy()
        end

        local frame_main = player.gui.relative.add({type = 'frame', name = 'inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right}})
        local frame_content = frame_main.add({type = 'frame', name = 'frame_content', style = 'entity_frame'})
        local flow_content = frame_content.add({type = 'flow', name = 'flow_content', direction = 'vertical'})
        local table_range = 1

        for _, inserter in pairs(prototypes.get_entity_filtered({{filter = 'type', type = 'inserter'}})) do
            local pickup_pos = math2d.position.ensure_xy(math2d.position.add(inserter.inserter_pickup_position, {0.5, 0.5}))
            local drop_pos = math2d.position.ensure_xy(math2d.position.add(inserter.inserter_drop_position, {0.5, 0.5}))
            table_range =  math.max(table_range, math.abs(math.floor(pickup_pos.x)), math.abs(math.floor(pickup_pos.y)), math.abs(math.floor(drop_pos.x)), math.abs(math.floor(drop_pos.y)))
        end

        local table_position = flow_content.add({type = 'table', name = 'table_position', column_count = 1 + table_range * 2})
        table_position.style.horizontal_spacing = 1
        table_position.style.vertical_spacing = 1

        for y = -table_range, table_range, 1 do
            for x = -table_range, table_range, 1 do
                local sprite = ((x == 0 and y == 0) and table_position.add({type = 'sprite', name = 'sprite_inserter', sprite = 'item/bulk-inserter'})) or table_position.add({type = 'sprite-button', name = 'button_position_' .. tostring(x + table_range + 1) .. '_' .. tostring(y + table_range + 1), style = 'slot_sized_button'})

                if (x == 0 and y == 0) then
                    sprite.style.stretch_image_to_widget_size = true
                end

                sprite.style.size = {32, 32}
            end
        end

        local line = flow_content.add({type = 'line', name = 'line', style = 'inside_shallow_frame_with_padding_line'})
        line.style.top_margin = 8
        table_position = flow_content.add({type = 'table', name = 'table_offset', column_count = 3})
        table_position.style.horizontal_spacing = 1
        table_position.style.vertical_spacing = 1

        for y = 1, 3, 1 do
            for x = 1, 3, 1 do
                local sprite = table_position.add({type = 'sprite-button', name = 'button_offset_' .. tostring(x + table_range + 1) .. '_' .. tostring(y + table_range + 1), style = 'slot_sized_button'})
                sprite.style.size = {32, 32}
            end
        end
    end

    function gui.update(player, inserter)
        local gui_instance = player.gui.relative.inserter_config.frame_content.flow_content
        local table_range = (gui_instance.table_position.column_count - 1) / 2
        local pickup_pos = math2d.position.ensure_xy(math2d.position.add((inserter.prototype or inserter.ghost_prototype).inserter_pickup_position, {0.5, 0.5}))
        local drop_pos = math2d.position.ensure_xy(math2d.position.add((inserter.prototype or inserter.ghost_prototype).inserter_drop_position, {0.5, 0.5}))
        local inserter_range = math.max(math.abs(math.floor(pickup_pos.x)), math.abs(math.floor(pickup_pos.y)), math.abs(math.floor(drop_pos.x)), math.abs(math.floor(drop_pos.y)))
        local arm_positions = inserter_utils.get_arm_positions(inserter)
        local idx = 0

        for y = -table_range, table_range, 1 do
            for x = -table_range, table_range, 1 do
                idx = idx + 1

                if gui_instance.table_position.children[idx].type == 'sprite-button' then
                    p1, p2 = math2d.position.ensure_xy(arm_positions.drop), math2d.position.ensure_xy({x, y})
                    p3, p4 = math2d.position.ensure_xy(arm_positions.pickup), math2d.position.ensure_xy({x, y})
                    gui_instance.table_position.children[idx].sprite = (((p1.x == p2.x and p1.y == p2.y) and 'virtual-signal/down-arrow') or ((p3.x == p4.x and p3.y == p4.y) and 'virtual-signal/up-arrow')) or ((x ~= 0 or y ~= 0) and nil)
                    gui_instance.table_position.children[idx].enabled = math.abs(x) < inserter_range or math.abs(y) < inserter_range
                end
            end
        end

        local prototype = (inserter.object_name == 'LuaEntity' and ((inserter.type == 'entity-ghost' and inserter.ghost_prototype) or inserter.prototype)) or ((inserter.object_name == 'LuaEntityPrototype' and inserter) or nil)
        gui_instance.table_position.sprite_inserter.sprite = ((prototype and prototype.items_to_place_this) and 'item/' .. prototype.items_to_place_this[1].name) or 'item/inserter'
        idx = 0

        for y = -1, 1, 1 do
            for x = -1, 1, 1 do
                idx = idx + 1
                p1, p2 = math2d.position.ensure_xy(arm_positions.drop_offset), math2d.position.ensure_xy({x, y})
                gui_instance.table_offset.children[idx].sprite = ((p1.x == p2.x and p1.y == p2.y) and 'virtual-signal/down-arrow') or nil
            end
        end
    end

    script.on_init(function(_)
        trash_check()

        for _, player in pairs(game.players) do
            gui.create(player)
        end
    end)

    script.on_configuration_changed(function(_)
        for _, player in pairs(game.players) do
            gui.create(player)

            if player.opened and player.opened.object_name == 'LuaEntity' and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) then
                gui.update(player, player.opened)
            end
        end
    end)

    script.on_event(defines.events.on_player_created, function(e)
        gui.create(game.players[e.player_index])
    end)

    script.on_event(defines.events.on_gui_opened, function(e)
        if e.entity and (e.entity.type == 'inserter' or (e.entity.type == 'entity-ghost' and e.entity.ghost_type == 'inserter')) then
            gui.update(game.players[e.player_index], e.entity)
        end
    end)

    script.on_event(defines.events.on_gui_click, function(e)
        local player = game.players[e.player_index]
        local gui_instance = player.gui.relative.inserter_config.frame_content.flow_content

        if e.element.parent == gui_instance.table_position and e.element ~= gui_instance.table_position.sprite_inserter then
            local new_pos = math2d.position.add({(e.element.get_index_in_parent() - 1) % e.element.parent.column_count, math.floor((e.element.get_index_in_parent() - 1) / e.element.parent.column_count)}, {(e.element.parent.column_count - 1) * -0.5, (e.element.parent.column_count - 1) * -0.5})

            if (e.button == defines.mouse_button_type.left and (not e.control or e.shift)) and e.element.sprite == 'virtual-signal/up-arrow' then
                local new_positions = {drop = new_pos, pickup = (e.element.sprite == 'virtual-signal/up-arrow' and inserter_utils.get_arm_positions(player.opened).drop) or nil}
                local old_positions = inserter_utils.get_arm_positions(player.opened)
                local vec = math2d.position.ensure_xy(new_positions.drop)
                local new_drop_dir = math.floor(math.atan2(vec.x, -vec.y) * (4 / math.pi) + 0.5) % 8
                vec = math2d.position.ensure_xy(old_positions.drop)
                local delta = (new_drop_dir - math.floor(math.atan2(vec.x, -vec.y) * (4 / math.pi) + 0.5) % 8) % 8
                new_positions.drop_offset = (not new_positions.drop and old_positions.drop_offset) or (((delta % 2 == 0) and {x = ((delta == 0 or delta == 6) and old_positions.drop_offset.y) or -old_positions.drop_offset.y, y = ((delta == 0 or delta == 2) and old_positions.drop_offset.x) or -old_positions.drop_offset.x}) or math2d.direction.vectors[(new_drop_dir + (new_drop_dir % 2) * 4 % 8) + 1])
                inserter_utils.set_arm_positions(player.opened, new_positions)

            elseif (e.button == defines.mouse_button_type.right or (e.button == defines.mouse_button_type.left and (e.control or e.shift))) and e.element.sprite == 'virtual-signal/down-arrow' then
                inserter_utils.set_arm_positions(player.opened, {pickup = new_pos, drop = (e.element.sprite == 'virtual-signal/down-arrow' and inserter_utils.get_arm_positions(player.opened).pickup) or nil})
            end

            for _, p in pairs(game.players) do
                if p.opened and ((p.opened == player.opened) or (p.opened.object_name == 'LuaEntity' and (p.opened.type == 'inserter' or (p.opened.type == 'entity-ghost' and p.opened.ghost_type == 'inserter')))) then
                    gui.update(p, p.opened)
                end
            end

        elseif e.element.parent == gui_instance.table_offset then
            inserter_utils.set_arm_positions(player.opened, {drop_offset = math2d.position.add({(e.element.get_index_in_parent() - 1) % e.element.parent.column_count, math.floor((e.element.get_index_in_parent() - 1) / e.element.parent.column_count)}, {(e.element.parent.column_count - 1) * -0.5, (e.element.parent.column_count - 1) * -0.5})})
            gui.update(player, player.opened)
        end
    end)

    script.on_event(defines.events.on_player_rotated_entity, function(e)
        if e.entity and (e.entity.type == 'inserter' or (e.entity.type == 'entity-ghost' and e.entity.ghost_type == 'inserter')) then
            for _, player in pairs(game.players) do
                if player.opened == e.entity then
                    gui.update(player, player.opened)
                end
            end
        end
    end)

    script.on_event(defines.events.on_entity_settings_pasted, function(e)
        if e.destination.type == 'inserter' or (e.destination.type == 'entity-ghost' and e.destination.ghost_type == 'inserter') then
            e.destination.direction = e.source.direction
            local arm_positions = inserter_utils.get_arm_positions(e.destination)
            local pickup_pos = math2d.position.ensure_xy(math2d.position.add((e.destination.prototype or e.destination.ghost_prototype).inserter_pickup_position, {0.5, 0.5}))
            local drop_pos = math2d.position.ensure_xy(math2d.position.add((e.destination.prototype or e.destination.ghost_prototype).inserter_drop_position, {0.5, 0.5}))
            local max_range = math.max(math.abs(math.floor(pickup_pos.x)), math.abs(math.floor(pickup_pos.y)), math.abs(math.floor(drop_pos.x)), math.abs(math.floor(drop_pos.y)))

            for _, v in pairs({'drop', 'pickup'}) do
                if math.max(math.abs(arm_positions[v].x), math.abs(arm_positions[v].y)) > max_range then
                    local vec = math2d.position.ensure_xy(arm_positions[v])
                    arm_positions[v] = math2d.position.multiply_scalar(math2d.direction.vectors[(math.floor(math.atan2(vec.x, -vec.y) * (4 / math.pi) + 0.5) % 8) + 1], max_range)
                end
            end

            p1, p2 = math2d.position.ensure_xy(arm_positions.pickup), math2d.position.ensure_xy(arm_positions.drop)
            arm_positions.pickup = ((p1.x == p2.x and p1.y == p2.y) and {x = -arm_positions.drop.x , y = -arm_positions.drop.y}) or arm_positions.pickup
            inserter_utils.set_arm_positions(e.destination, arm_positions)

            for _, player in pairs(game.players) do
                if player.opened == e.destination then
                    gui.update(player, player.opened)
                end
            end
        end
    end)
end
