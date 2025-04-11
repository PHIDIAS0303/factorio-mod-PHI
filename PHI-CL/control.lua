local items = require 'config'

local inserter_direction = {
    [1] = defines.direction.north,
    [2] = defines.direction.northnortheast,
    [3] = defines.direction.northeast,
    [4] = defines.direction.eastnortheast,
    [5] = defines.direction.east,
    [6] = defines.direction.eastsoutheast,
    [7] = defines.direction.southeast,
    [8] = defines.direction.southsoutheast,
    [9] = defines.direction.south,
    [10] = defines.direction.southsouthwest,
    [11] = defines.direction.southwest,
    [12] = defines.direction.westsouthwest,
    [13] = defines.direction.west,
    [14] = defines.direction.westnorthwest,
    [15] = defines.direction.northwest,
    [16] = defines.direction.northnorthwest,
}

local inserter_direction_reversed = {}

for k, v in pairs(inserter_direction) do
    inserter_direction_reversed[v] = k
end

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
end

if settings.startup['PHI-CT'].value or settings.startup['PHI-MI'].value or (settings.startup['PHI-SA'].value and settings.startup['PHI-SA-RESTRICTION'].value) or (settings.startup['PHI-VP'].value and settings.startup['PHI-VP-MAIN'].value) then
    function gui_create(player)
        if player.gui.relative.inserter_config then
            player.gui.relative.inserter_config.destroy()
        end

        local frame = player.gui.relative.add({type = 'frame', name = 'inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right}})
        frame.add({type = 'drop-down', name = 'i_direction', items = {'[virtual-signal=down-arrow]', '[virtual-signal=left-arrow]', '[virtual-signal=up-arrow]', '[virtual-signal=right-arrow]'}, selected_index = 1})
        frame.add({type = 'drop-down', name = 'i_sub_direction', items = {'[virtual-signal=signal-0]', '[virtual-signal=signal-1]', '[virtual-signal=signal-2]', '[virtual-signal=signal-3]'}, selected_index = 1})
    end

    function gui_update(player, inserter)
        if not (inserter.supports_direction or ((inserter.prototype and inserter.prototype.allow_custom_vectors) or (inserter.ghost_prototype and inserter.ghost_prototype.allow_custom_vectors))) then
            return
        end

        local gui = player.gui.relative.inserter_config
        local d, ds = math.fmod(inserter_direction_reversed[inserter.direction], 4)
        gui['i_direction'].selected_index = d or 1
        gui['i_sub_direction'].selected_index = ((ds or 0) + ((inserter.mirroring and 2) or 0)) % 4 + 1
    end

    script.on_init(function(_)
        for _, player in pairs(game.players) do
            gui_create(player)
        end
    end)

    script.on_configuration_changed(function(_)
        for _, player in pairs(game.players) do
            gui_create(player)

            if player.opened and player.opened.object_name == 'LuaEntity' and (player.opened.entity.type == 'inserter' or (player.opened.entity.type == 'entity-ghost' and player.opened.entity.ghost_type == 'inserter')) then
                gui_update(player, player.opened.entity)
            end
        end
    end)

    script.on_event(defines.events.on_player_created, function(e)
        gui_create(game.players[e.player_index])
    end)

    script.on_event(defines.events.on_gui_opened, function(e)
        if e.entity and (e.entity.type == 'inserter' or (e.entity.type == 'entity-ghost' and e.entity.ghost_type == 'inserter')) then
            gui_update(game.players[e.player_index], e.entity)
        end
    end)

    script.on_event(defines.events.on_gui_selection_state_changed, function(e)
        local player = game.players[e.player_index]
        local gui = player.gui.relative.inserter_config

        if player.opened and player.opened.object_name == 'LuaEntity' and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) and gui[e.element.name] then
            player.opened.direction = inserter_direction[(e.element.parent['i_direction'].selected_index - 1) * 4 + (e.element.parent['i_sub_direction'].selected_index - 1) + 1]
        end
    end)

    script.on_event(defines.events.on_player_rotated_entity, function(e)
        local player = game.players[e.player_index]

        if e.entity and player.opened == e.entity and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) then
            gui_update(player, player.opened)
        end
    end)

    script.on_event(defines.events.on_player_flipped_entity, function(e)
        local player = game.players[e.player_index]

        if e.entity and player.opened == e.entity and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) then
            gui_update(player, player.opened)
        end
    end)

    script.on_event(defines.events.on_entity_settings_pasted, function(e)
        local player = game.players[e.player_index]

        if e.destination and (e.destination.type == 'inserter' or (e.destination.type == 'entity-ghost' and e.destination.ghost_type == 'inserter')) and player.opened == e.destination and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) then
            gui_update(player, player.opened)
        end
    end)
end
