local main = {}

function main.toggle(event)
    if event.prototype_name ~= 'phi-cl-toggle-editor' then
        return
    end

    local player = game.players[event.player_index]

    if player.permission_group and not player.permission_group.allows_action(defines.input_action.toggle_map_editor) then
        return
    end

    if not player.admin then
        return
    end

    player.toggle_map_editor()
end

function main.toggle_editor(event)
    local player = game.players[event.player_index]
    player.set_shortcut_toggled('phi-cl-toggle-editor', player.physical_controller_type == defines.controllers.editor)
    game.tick_paused = false
end

function main.setting_change(event)
    if event.setting_type ~= 'runtime-global' then
        return
    end

    if event.setting ~= 'PHI-CT-EDITOR' then
        return
    end

    for _, p in pairs(game.players) do
        p.set_shortcut_available('phi-cl-toggle-editor', settings.global['PHI-CT-EDITOR'].value)
    end
end

return main
