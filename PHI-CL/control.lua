local cargo_landing = require('control/cargo-landing')
local chest = require('control/chest')
local editor = require('control/editor')
local infinity = require('control/infinity')
local inserter = require('control/inserter')
local pump = require('control/pump')
local rail_support = require('control/rail-support')
local trash = require('control/trash')

local function entity_build(event)
    cargo_landing.build(event)
    chest.build(event)
    infinity.build(event)
    rail_support.build(event)
    trash.build(event)
end

local function entity_destroy(event)
    rail_support.destroy(event)
end

if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event({defines.events.on_player_cheat_mode_enabled, defines.events.on_player_cheat_mode_disabled}, pump.recipe_hidden)
end

local function gui_create(player)
    for _, v in pairs({'phi_cl_inserter_config', 'phi_cl_combinator_config', 'phi_cl_inserter'}) do
        if player.gui.relative[v] then
            player.gui.relative[v].destroy()
        end
    end

    inserter.create(player)
end

local function gui_update(player, entity)
    inserter.update(player, entity)
end

script.on_init(function()
    if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        for _, player in pairs(game.players) do
            gui_create(player)
        end
    end
end)

script.on_configuration_changed(function()
    if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        for _, player in pairs(game.players) do
            gui_create(player)

            if player.opened and player.opened.valid and player.opened.object_name == 'LuaEntity' then
                gui_update(player, player.opened.entity)
            end
        end
    end
end)

script.on_event(defines.events.on_player_created, function(event)
    if not event.player_index or not game.players[event.player_index] then
        return
    end

    local player = game.players[event.player_index]

    if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        gui_create(player)
    end

    if settings.startup['PHI-CT'].value then
        editor.available(player)
    end
end)

if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event(defines.events.on_gui_opened, function(event)
        if not event.player_index or not game.players[event.player_index] then
            return
        end

        local player = game.players[event.player_index]

        if event.entity and player.opened and player.opened == event.entity then
            gui_update(player, event.entity)
        end
    end)

    script.on_event(defines.events.on_player_rotated_entity, function(event)
        local player = game.players[event.player_index]

        if event.entity and player.opened == event.entity then
            gui_update(player, player.opened)
        end
    end)

    script.on_event(defines.events.on_player_flipped_entity, function(event)
        local player = game.players[event.player_index]

        if event.entity and player.opened == event.entity then
            gui_update(player, player.opened)
        end
    end)

    script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.on_space_platform_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, entity_build)
    script.on_event({defines.events.on_entity_died, defines.events.on_player_mined_entity, defines.events.on_robot_pre_mined, defines.events.script_raised_destroy}, entity_destroy)

    script.on_event(defines.events.on_entity_cloned, function(event)
        if not event.destination then
            return
        end

        entity_build({entity=event.destination})
    end)
end

if settings.startup['PHI-CT'].value then
    script.on_event(defines.events.on_lua_shortcut, editor.toggle)
    script.on_event(defines.events.on_player_toggled_map_editor, editor.toggle_editor)

    script.on_event(defines.events.on_player_promoted, function(event)
        editor.available(game.players[event.player_index])
    end)

    script.on_event(defines.events.on_player_demoted, function(event)
        editor.available(game.players[event.player_index])
    end)

    script.on_event(defines.events.on_permission_group_edited, function(event)
        if not event.type then
            return
        end

        if event.type == 'add-player' or event.type == 'add-player' then
            if not event.other_player_index then
                return
            end

            editor.available(game.players[event.other_player_index])
            return
        end

        for _, p in pairs(game.players) do
            editor.available(p)
        end
    end)
end
