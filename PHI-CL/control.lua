local items = require 'config'
local math2d = require('math2d')

if settings.startup['PHI-CT'].value then
    local gui = {}
    local inserter_utils = {}

    local function trash_creation(event)
        local entity = event.created_entity or event.entity

        if not entity then
            return
        end

        if not entity.valid then
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

    local function hidden_recipe_enable(e, enable)
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

    function math2d.position.equal(p1, p2)
        p1, p2 = math2d.position.ensure_xy(p1), math2d.position.ensure_xy(p2)
        return p1.x == p2.x and p1.y == p2.y
    end

    function math2d.position.split(pos)
        local function split_coord(v)
            local int, frac = math.modf(v)

            if frac < 0 then
                return int - 1, frac + 1
            end

            return int, frac
        end

        pos = math2d.position.ensure_xy(pos)
        local x_int, x_frac = split_coord(pos.x)
        local y_int, y_frac = split_coord(pos.y)
        return {x = x_int, y = y_int}, {x = x_frac, y = y_frac}
    end

    function math2d.position.tilepos(pos)
        pos = math2d.position.ensure_xy(pos)
        return {x = math.floor(pos.x), y = math.floor(pos.y)}
    end

    math2d.direction = {vectors = {{x = 0, y = -1}, {x = 1, y = -1}, {x = 1, y = 0}, {x = 1, y = 1}, {x = 0, y = 1}, {x = -1, y = 1}, {x = -1, y = 0}, {x = -1, y = -1}}}

    function inserter_utils.get_arm_positions(inserter)
        local base_tile, base_offset = math2d.position.split(inserter.position)
        local drop_tile, drop_offset = math2d.position.split(inserter.drop_position)
        local pickup_tile, _ = math2d.position.split(inserter.pickup_position)

        return {
            base = base_tile,
            base_offset = base_offset,
            drop = math2d.position.subtract(drop_tile, base_tile),
            drop_offset = {
                x = ((drop_offset.x > 0.5 and 1) or (drop_offset.x < 0.5 and -1)) or 0,
                y = ((drop_offset.y > 0.5 and 1) or (drop_offset.y < 0.5 and -1)) or 0
            },
            pickup = math2d.position.subtract(pickup_tile, base_tile)
        }
    end

    function inserter_utils.set_arm_positions(inserter, positions)
        inserter.pickup_position = (positions.pickup and math2d.position.add(inserter.position, positions.pickup)) or nil

        if positions.drop or positions.drop_offset then
            local base_tile, _ = math2d.position.split(inserter.position)
            local old_drop_tile, old_drop_offset = math2d.position.split(inserter.drop_position)
            inserter.drop_position = math2d.position.add((positions.drop and math2d.position.add(base_tile, positions.drop)) or old_drop_tile, (positions.drop_offset and math2d.position.add(math2d.position.multiply_scalar(positions.drop_offset, 0.2), {0.5, 0.5})) or old_drop_offset)
        end
    end

    function inserter_utils.get_max_range(inserter)
        local prototype = (inserter.object_name == 'LuaEntity' and ((inserter.type == 'entity-ghost' and inserter.ghost_prototype) or inserter.prototype)) or ((inserter.object_name == 'LuaEntityPrototype' and inserter) or nil)
        local pickup_pos = math2d.position.tilepos(math2d.position.add(prototype.inserter_pickup_position, {0.5, 0.5}))
        local drop_pos = math2d.position.tilepos(math2d.position.add(prototype.inserter_drop_position, {0.5, 0.5}))
        return math.max(math.abs(pickup_pos.x), math.abs(pickup_pos.y), math.abs(drop_pos.x), math.abs(drop_pos.y))
    end

    function gui.create(player)
        local frame_main = player.gui.relative.add({type = 'frame', name = 'inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right}})
        local frame_content = frame_main.add({type = 'frame', name = 'frame_content', style = 'entity_frame'})
        local flow_content = frame_content.add({type = 'flow', name = 'flow_content', direction = 'vertical'})
        local table_range = 1
        local inserter_prototyes = prototypes.get_entity_filtered({{filter = 'type', type = 'inserter'}})

        for _, prototype in pairs(inserter_prototyes) do
            table_range = math.max(table_range, inserter_utils.get_max_range(prototype))
        end

        local table_position = flow_content.add({type = 'table', name = 'table_position', column_count = 1 + table_range * 2})
        table_position.style.horizontal_spacing = 1
        table_position.style.vertical_spacing = 1
        local sprite

        for y = -table_range, table_range, 1 do
            for x = -table_range, table_range, 1 do
                if (x == 0 and y == 0) then
                    sprite = table_position.add({type = 'sprite', name = 'sprite_inserter', sprite = 'item/bulk-inserter'})
                    sprite.style.stretch_image_to_widget_size = true
                else
                    sprite = table_position.add({type = 'sprite-button', name = 'button_position_' .. tostring(x + table_range + 1) .. '_' .. tostring(y + table_range + 1), style = 'slot_sized_button'})
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
                sprite = table_position.add({type = 'sprite-button', name = 'button_offset_' .. tostring(x + table_range + 1) .. '_' .. tostring(y + table_range + 1), style = 'slot_sized_button'})
                sprite.style.size = {32, 32}
            end
        end
    end

    function gui.update(player, inserter)
        local gui_instance = player.gui.relative.inserter_config.frame_content.flow_content
        local table_range = (gui_instance.table_position.column_count - 1) / 2
        local inserter_range = inserter_utils.get_max_range(inserter)
        local arm_positions = inserter_utils.get_arm_positions(inserter)
        local idx = 0

        for y = -table_range, table_range, 1 do
            for x = -table_range, table_range, 1 do
                idx = idx + 1

                if gui_instance.table_position.children[idx].type == 'sprite-button' then
                    gui_instance.table_position.children[idx].sprite = ((math2d.position.equal(arm_positions.drop, {x, y}) and 'virtual-signal/down-arrow') or (math2d.position.equal(arm_positions.pickup, {x, y}) and 'virtual-signal/up-arrow')) or ((x ~= 0 or y ~= 0) and nil)
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
                gui_instance.table_offset.children[idx].sprite = (math2d.position.equal(arm_positions.drop_offset, {x, y}) and 'virtual-signal/down-arrow') or nil
            end
        end
    end

    function gui.get_button_pos(button)
        local idx = button.get_index_in_parent() - 1
        local len = button.parent.column_count
        local center = (len - 1) * -0.5
        return math2d.position.add({idx % len, math.floor(idx / len)}, {center, center})
    end

    function gui.on_button_position(player, event)
        local inserter = player.opened
        local new_pos = gui.get_button_pos(event.element)

        if event.button == defines.mouse_button_type.left and (not event.control) and (not event.shift) then
            local new_positions = {drop = new_pos}

            if event.element.sprite == 'virtual-signal/down-arrow' then
                return
            end

            if event.element.sprite == 'virtual-signal/up-arrow' then
                new_positions.pickup = inserter_utils.get_arm_positions(inserter).drop
            end

            local old_positions = inserter_utils.get_arm_positions(inserter)
            local vec = math2d.position.ensure_xy(new_positions.drop)
            local new_drop_dir = math.floor(math.atan2(vec.x, -vec.y) * (4 / math.pi) + 0.5) % 8
            vec = math2d.position.ensure_xy(old_positions.drop)
            local delta = (new_drop_dir - math.floor(math.atan2(vec.x, -vec.y) * (4 / math.pi) + 0.5) % 8) % 8
            new_positions.drop_offset = (not new_positions.drop and old_positions.drop_offset) or (((delta % 2 == 0) and {x = ((delta == 0 or delta == 6) and old_positions.drop_offset.y) or -old_positions.drop_offset.y, y = ((delta == 0 or delta == 2) and old_positions.drop_offset.x) or -old_positions.drop_offset.x}) or math2d.direction.vectors[(new_drop_dir + (new_drop_dir % 2) * 4 % 8) + 1])
            inserter_utils.set_arm_positions(inserter, new_positions)

        elseif event.button == defines.mouse_button_type.right or (event.button == defines.mouse_button_type.left and (event.control or event.shift)) then
            local new_positions = {pickup = new_pos}

            if event.element.sprite == 'virtual-signal/up-arrow' then
                return
            end

            if event.element.sprite == 'virtual-signal/down-arrow' then
                new_positions.drop = inserter_utils.get_arm_positions(inserter).pickup
            end

            inserter_utils.set_arm_positions(inserter, new_positions)
        end

        for _, p in pairs(game.players) do
            if (inserter and p.opened == inserter) or (not inserter and (p.opened and p.opened.object_name == 'LuaEntity' and (p.opened.type == 'inserter' or (p.opened.type == 'entity-ghost' and p.opened.ghost_type == 'inserter')))) then
                gui.update(p, p.opened)
            end
        end
    end

    function gui.on_button_offset(player, event)
        inserter_utils.set_arm_positions(player.opened, {drop_offset = gui.get_button_pos(event.element)})
        gui.update(player, player.opened)
    end

    script.on_event(defines.events.on_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
    script.on_event(defines.events.on_robot_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
    script.on_event(defines.events.script_raised_built, trash_creation)
    script.on_event(defines.events.script_raised_revive, trash_creation)

    script.on_event(defines.events.on_player_cheat_mode_enabled, function(e)
        hidden_recipe_enable(e, true)
    end)

    script.on_event(defines.events.on_player_cheat_mode_disabled, function(e)
        hidden_recipe_enable(e, false)
    end)

    script.on_init(function(_)
        trash_check()

        for _, player in pairs(game.players) do
            if player.gui.relative.inserter_config then
                player.gui.relative.inserter_config.destroy()
            end

            gui.create(player)
        end
    end)

    script.on_configuration_changed(function(_)
        for _, player in pairs(game.players) do
            if player.gui.relative.inserter_config then
                player.gui.relative.inserter_config.destroy()
            end

            gui.create(player)
        end

        for _, player in pairs(game.players) do
            if player.opened and player.opened.object_name == 'LuaEntity' and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) then
                gui.update(player, player.opened)
            end
        end
    end)

    script.on_event(defines.events.on_player_created, function(e)
        gui.create(game.players[e.player_index])
    end)

    script.on_event(defines.events.on_gui_opened, function(e)
        if e.entity and e.entity.opened and (e.entity.opened.type == 'inserter' or (e.entity.opened.type == 'entity-ghost' and e.entity.opened.ghost_type == 'inserter')) then
            gui.update(game.players[e.player_index], e.entity)
        end
    end)

    script.on_event(defines.events.on_gui_click, function(e)
        local player = game.players[e.player_index]
        local gui_instance = player.gui.relative.inserter_config.frame_content.flow_content

        if e.element.parent == gui_instance.table_position and e.element ~= gui_instance.table_position.sprite_inserter then
            gui.on_button_position(player, e)
        elseif e.element.parent == gui_instance.table_offset then
            gui.on_button_offset(player, e)
        end
    end)

    script.on_event(defines.events.on_player_rotated_entity, function(e)
        if e.entity and (e.entity.type == 'inserter' or (e.entity.type == 'entity-ghost' and e.entity.ghost_type == 'inserter')) then
            for _, player in pairs(game.players) do
                if (e.entity and player.opened == e.entity) or (not e.entity and (player.opened and player.opened.object_name == 'LuaEntity' and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')))) then
                    gui.update(player, player.opened)
                end
            end
        end
    end)

    script.on_event(defines.events.on_entity_settings_pasted, function(e)
        if e.destination.type == 'inserter' or (e.destination.type == 'entity-ghost' and e.destination.ghost_type == 'inserter') then
            e.destination.direction = e.source.direction
            local arm_positions = inserter_utils.get_arm_positions(e.destination)
            local max_range = inserter_utils.get_max_range(e.destination)

            if math.max(math.abs(arm_positions.drop.x), math.abs(arm_positions.drop.y)) > max_range then
                local vec = math2d.position.ensure_xy(arm_positions.drop)
                arm_positions.drop = math2d.position.multiply_scalar(math2d.direction.vectors[(math.floor(math.atan2(vec.x, -vec.y) * (4 / math.pi) + 0.5) % 8) + 1], max_range)
            end

            if math.max(math.abs(arm_positions.pickup.x), math.abs(arm_positions.pickup.y)) > max_range then
                local vec = math2d.position.ensure_xy(arm_positions.drop)
                arm_positions.pickup = math2d.position.multiply_scalar(math2d.direction.vectors[(math.floor(math.atan2(vec.x, -vec.y) * (4 / math.pi) + 0.5) % 8) + 1], max_range)
            end

            if math2d.position.equal(arm_positions.pickup, arm_positions.drop) then
                arm_positions.pickup = {x = -arm_positions.drop.x , y = -arm_positions.drop.y}
            end

            inserter_utils.set_arm_positions(e.destination, arm_positions)

            for _, player in pairs(game.players) do
                if (e.destination and player.opened == e.destination) or (not e.destination and (player.opened and player.opened.object_name == 'LuaEntity' and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')))) then
                    gui.update(player, player.opened)
                end
            end
        end
    end)
end
