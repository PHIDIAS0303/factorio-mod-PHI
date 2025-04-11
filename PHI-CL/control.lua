local items = require 'config'
local math2d = require('math2d')

local inserter_vectors = {
    ['near'] = {
        [defines.direction.north] = {0.01, -0.2},
        [defines.direction.east] = {0.2, 0.01},
        [defines.direction.south] = {-0.01, 0.2},
        [defines.direction.west] = {-0.2, -0.01},
    },
    ['far'] = {
        [defines.direction.north] = {0.0, 0.2},
        [defines.direction.east] = {-0.2, 0.0},
        [defines.direction.south] = {0.0, -0.2},
        [defines.direction.west] = {0.2, 0.0},
    }
}

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

    script.on_event(defines.events.on_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
    script.on_event(defines.events.on_robot_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
    script.on_event(defines.events.script_raised_built, trash_creation)
    script.on_event(defines.events.script_raised_revive, trash_creation)

    local function hidden_recipe_enable(e)
        local enable = (e.name == defines.events.on_player_cheat_mode_enabled)
        local force = game.players[e.player_index].force

        for _, v in pairs(prototypes.fluid) do
            if force.recipes['pump-' .. v.name] then
                force.recipes['pump-' .. v.name].enabled = enable
            end
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

    script.on_init(function(_)
        for _, surface in pairs(game.surfaces) do
            for _, e in pairs(surface.find_entities_filtered{name='trash-chest'}) do
                e.infinity_container_filters = {}
                e.remove_unfiltered_items = true
            end

            for _, e in pairs(surface.find_entities_filtered{name='trash-pipe'}) do
                e.set_infinity_pipe_filter(nil)
            end
        end
    end)

    function gui_create(player)
        if player.gui.relative.inserter_config then
            player.gui.relative.inserter_config.destroy()
        end

        local frame = player.gui.relative.add({type = 'frame', name = 'inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right}})
        frame.add({type = 'label', name = 'label_info', caption = 'Inserter direction', style = 'heading_2_label'})
        frame.add({type = 'drop-down', name = 'direction', items = {'virtual-signal/down-arrow', 'virtual-signal/left-arrow', 'virtual-signal/up-arrow', 'virtual-signal/right-arrow'}, selected_index = 1})
        frame.add({type = 'drop-down', name = 'sub-direction', items = {'virtual-signal/signal-0', 'virtual-signal/signal-1', 'virtual-signal/signal-2', 'virtual-signal/signal-3'}, selected_index = 1})
    end

    function gui_update(player, inserter)
        if not (inserter.allow_custom_vectors or inserter.supports_direction) then
            return
        end

        local gui = player.gui.relative.inserter_config
        local d, ds = math.fmod(inserter.direction, 4)
        gui['direction'].selected_index = d
        gui['sub-direction'].selected_index = ds
    end

    script.on_init(function(_)
        for _, surface in pairs(game.surfaces) do
            for _, e in pairs(surface.find_entities_filtered{name='trash-chest'}) do
                e.infinity_container_filters = {}
                e.remove_unfiltered_items = true
            end

            for _, e in pairs(surface.find_entities_filtered{name='trash-pipe'}) do
                e.set_infinity_pipe_filter(nil)
            end
        end

        for _, player in pairs(game.players) do
            gui_create(player)
        end
    end)

    script.on_configuration_changed(function(_)
        for _, player in pairs(game.players) do
            gui_create(player)

            if player.opened and player.opened.object_name == 'LuaEntity' then
                if player.opened.type == 'inserter' then
                    gui_update(player, player.opened.prototype)

                elseif player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter' then
                    gui_update(player, player.opened.ghost_prototype)
                end
            end
        end
    end)

    script.on_event(defines.events.on_player_created, function(e)
        gui_create(game.players[e.player_index])
    end)

    script.on_event(defines.events.on_gui_opened, function(e)
        if e.entity then
            if e.entity.type == 'inserter' then
                gui_update(game.players[e.player_index], e.entity.prototype)

            elseif e.entity.type == 'entity-ghost' and e.entity.ghost_type == 'inserter' then
                gui_update(game.players[e.player_index], e.entity.ghost_prototype)
            end
        end
    end)

    script.on_event(defines.events.on_gui_selection_state_changed, function(e)
        local player = game.players[e.player_index]
        local gui = player.gui.relative.inserter_config

        if gui[e.element.name] and e.element.entity and (e.element.entity.type == 'inserter' or (e.element.entity.type == 'entity-ghost' and e.element.entity.ghost_type == 'inserter')) then
            e.element.entity.direction = (e.element.parent.direction.selected_index - 1) * 4 + (e.element.parent.sub_direction.selected_index - 1)
        end
    end)

    script.on_event(defines.events.on_player_rotated_entity, function(e)
        if e.entity then
            for _, player in pairs(game.players) do
                if player.opened == e.entity then
                    if player.opened.type == 'inserter' then
                        gui_update(player, player.opened.prototype)

                    elseif player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter' then
                        gui_update(player, player.opened.ghost_prototype)
                    end

                    return
                end
            end
        end
    end)

    script.on_event(defines.events.on_entity_settings_pasted, function(e)
        if e.destination and e.destination.type == 'inserter' or (e.destination.type == 'entity-ghost' and e.destination.ghost_type == 'inserter') then
            for _, player in pairs(game.players) do
                if player.opened == e.destination then
                    if player.opened.type == 'inserter' then
                        gui_update(player, player.opened.prototype)

                    elseif player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter' then
                        gui_update(player, player.opened.ghost_prototype)
                    end

                    return
                end
            end
        end
    end)
end
