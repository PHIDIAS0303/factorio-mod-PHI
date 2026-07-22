local main = {}

function main.toggle(event)
    if event.prototype_name ~= 'phi-cl-toggle-editor' then
        return
    end

    game.players[event.player_index].toggle_map_editor()
end

function main.toggle_editor(event)
    local player = game.players[event.player_index]
    player.set_shortcut_toggled('phi-cl-toggle-editor', player.physical_controller_type == defines.controllers.editor)
    game.tick_paused = false
end

function main.available(player)
    player.set_shortcut_available('phi-cl-toggle-editor', player.admin and player.permission_group and player.permission_group.allows_action(defines.input_action.toggle_map_editor) or false)
end

return main
