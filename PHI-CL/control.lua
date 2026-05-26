local cargo_landing = require('control/cargo-landing')
local combinator = require('control/combinator')
local lab = require('control/lab')
local pump = require('control/pump')
local rail_support = require('control/rail-support')
local trash = require('control/trash')

local function gui_create(player)
    if player.gui.relative.phi_cl_inserter_config then
        player.gui.relative.phi_cl_inserter_config.destroy()
    end

    combinator.gui_create(player)
end

local function gui_update(player, entity)
    lab.open(player)
    combinator.gui_update(player, entity)
end

local function entity_build(event)
    cargo_landing.build(event)
    lab.build(event)
    rail_support.build(event)
    trash.build(event)
end

script.on_init(function()
    if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        for _, player in pairs(game.players) do
            gui_create(player)
        end
    end

    combinator.storage_init()
end)

script.on_configuration_changed(function()
    if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        for _, player in pairs(game.players) do
            gui_create(player)

            if player.opened and player.opened.valid and player.opened.object_name == 'LuaEntity' then
                gui_update(player, player.opened.entity)
            end
        end
    end

    combinator.storage_init()
end)

if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event(defines.events.on_player_created, function(event)
        if not event.player_index or not game.players[event.player_index] then
            return
        end

        gui_create(game.players[event.player_index])
    end)

    script.on_event(defines.events.on_gui_opened, function(event)
        if not event.player_index or not event.entity or not game.players[event.player_index] or not game.players[event.player_index].opened or game.players[event.player_index].opened ~= event.entity then
            return
        end

        gui_update(game.players[event.player_index], event.entity)
    end)

    script.on_event(defines.events.on_gui_selection_state_changed, combinator.on_gui_selection_state_changed)

    script.on_event({defines.events.on_player_rotated_entity, defines.events.on_player_flipped_entity}, function(event)
        if not event.player_index or not event.entity or not game.players[event.player_index] or not game.players[event.player_index].opened or game.players[event.player_index].opened ~= event.entity then
            return
        end

        gui_update(game.players[event.player_index], game.players[event.player_index].opened)
    end)

    script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.on_space_platform_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, entity_build)

    script.on_event(defines.events.on_entity_cloned, function(event)
        if not event.destination then
            return
        end

        entity_build({entity=event.destination})
    end)


    script.on_event({defines.events.on_entity_died, defines.events.on_player_mined_entity, defines.events.on_robot_pre_mined, defines.events.script_raised_destroy}, function(event)
        lab.destroy(event)
        rail_support.destroy(event)
    end)
end

script.on_nth_tick(1800, combinator.on_nth_tick_1800)
script.on_nth_tick(10, combinator.on_nth_tick_10)
