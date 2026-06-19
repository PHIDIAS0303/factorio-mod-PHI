local cargo_landing = require('control/cargo-landing')
local pump = require('control/pump')
local rail_support = require('control/rail-support')
local trash = require('control/trash')

local function gui_create(player)
    if player.gui.relative.phi_cl_inserter_config then
        player.gui.relative.phi_cl_inserter_config.destroy()
    end

    if player.gui.relative.phi_cl_combinator_config then
        player.gui.relative.phi_cl_combinator_config.destroy()
    end
end

local function entity_build(event)
    cargo_landing.build(event)
    rail_support.build(event)
    trash.build(event)
end

if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event({defines.events.on_player_cheat_mode_enabled, defines.events.on_player_cheat_mode_disabled}, pump.recipe_hidden)
end

if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event(defines.events.on_player_created, function(event)
        if not event.player_index or not game.players[event.player_index] then
            return
        end

        gui_create(game.players[event.player_index])
    end)

    script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.on_space_platform_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, entity_build)
    script.on_event({defines.events.on_entity_died, defines.events.on_player_mined_entity, defines.events.on_robot_pre_mined, defines.events.script_raised_destroy}, rail_support.destroy)

    script.on_event(defines.events.on_entity_cloned, function(event)
        if not event.destination then
            return
        end

        entity_build({entity=event.destination})
    end)
end
