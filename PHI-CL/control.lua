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

local rail_support_pole = {
    'rail-support-pole-electric',
    'rail-support-pole-lightning'
}

if settings.startup['PHI-CT'].value then
    local function trash_chest_creation(event)
        local entity = event.entity or event.created_entity
        entity.remove_unfiltered_items = true
    end

    script.on_event(defines.events.on_built_entity, trash_chest_creation, {{filter='name', name='trash-chest'}})
    script.on_event(defines.events.on_robot_built_entity, trash_chest_creation, {{filter='name', name='trash-chest'}})
    script.on_event(defines.events.on_space_platform_built_entity, trash_chest_creation, {{filter='name', name='trash-chest'}})
    script.on_event(defines.events.script_raised_built, trash_chest_creation, {{filter='name', name='trash-chest'}})
    script.on_event(defines.events.script_raised_revive, trash_chest_creation, {{filter='name', name='trash-chest'}})

    local function trash_pipe_creation(event)
        event.entity.set_infinity_pipe_filter(nil)
    end

    script.on_event(defines.events.on_built_entity, trash_pipe_creation, {{filter='name', name='trash-pipe'}})
    script.on_event(defines.events.on_robot_built_entity, trash_pipe_creation, {{filter='name', name='trash-pipe'}})
    script.on_event(defines.events.on_space_platform_built_entity, trash_pipe_creation, {{filter='name', name='trash-pipe'}})
    script.on_event(defines.events.script_raised_built, trash_pipe_creation, {{filter='name', name='trash-pipe'}})
    script.on_event(defines.events.script_raised_revive, trash_pipe_creation, {{filter='name', name='trash-pipe'}})

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
end

if settings.startup['PHI-CT'].value or settings.startup['PHI-MI'].value or (settings.startup['PHI-SA'].value and settings.startup['PHI-SA-RESTRICTION'].value) or settings.startup['PHI-VP'].value then
    function gui_create(player)
        if player.gui.relative.inserter_config then
            player.gui.relative.inserter_config.destroy()
        end

        local frame = player.gui.relative.add({type = 'frame', name = 'inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right}})
        frame.add({type = 'drop-down', name = 'i_sub_direction', items = {'[virtual-signal=signal-0]', '[virtual-signal=signal-1]', '[virtual-signal=signal-2]', '[virtual-signal=signal-3]'}, selected_index = 1})
    end

    function gui_update(player, inserter)
        if not (inserter.supports_direction or ((inserter.prototype and inserter.prototype.allow_custom_vectors) or (inserter.ghost_prototype and inserter.ghost_prototype.allow_custom_vectors))) then
            return
        end

        local gui = player.gui.relative.inserter_config
        gui['i_sub_direction'].selected_index = ((inserter_direction_reversed[inserter.direction] - 1) % 4) + 1
    end

    script.on_nth_tick(3600, function(_)
        local ec = game.surfaces['nauvis'].find_entities_filtered{type='cargo-landing-pad', force='player'}

        if (not ec) or #ec == 1 then
            return
        end

        local ic = {}

        for _, e in pairs(ec) do
            local inv = e.get_inventory(defines.inventory.cargo_landing_pad_main)

            if inv then
                local item = inv.get_contents()

                for _, v in pairs(item) do
                    ic[v.name] = (ic[v.name] and (ic[v.name] + v.count)) or v.count
                end

                inv.clear()
            end
        end

        local ic_n = {}

        for k, v in pairs(ic) do
            local b = math.floor(v / #ec)

            ic_n[k] = {
                c = b,
                e = v - (#ec * b)
            }
        end

        for k, v in pairs(ic_n) do
            if v.c > 0 then
                for _, e in pairs(ec) do
                    e.insert{name = k, count = v.c, quality = 'normal'}
                end
            end

            if v.e > 0 then
                ec[1].insert{name = k, count = v.e, quality = 'normal'}
            end
        end
    end)

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
            player.opened.direction = inserter_direction[(math.floor(inserter_direction_reversed[player.opened.direction] / 4) * 4 + (e.element.parent['i_sub_direction'].selected_index - 1)) % 16 + 1]
        end
    end)

    local function inserter_changed(e)
        local player = game.players[e.player_index]

        if e.entity and player.opened == e.entity and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) then
            gui_update(player, player.opened)
        end
    end

    script.on_event(defines.events.on_player_rotated_entity, inserter_changed)
    script.on_event(defines.events.on_player_flipped_entity, inserter_changed)

    script.on_event(defines.events.on_entity_settings_pasted, function(e)
        local player = game.players[e.player_index]

        if e.destination and (e.destination.type == 'inserter' or (e.destination.type == 'entity-ghost' and e.destination.ghost_type == 'inserter')) and player.opened == e.destination and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) then
            gui_update(player, player.opened)
        end
    end)


    local function build_electric_pole(e)
        for _, v in pairs(rail_support_pole) do
            if prototypes.entity[v] then
                local p = e.entity.surface.create_entity{name = v, position = {e.entity.position.x, e.entity.position.y}, force = 'neutral', quality = e.entity.quality.name}
                p.destructible = false
            end
        end
    end

    local function destroy_electric_pole(e)
        for _, v in pairs(rail_support_pole) do
            if prototypes.entity[v] then
                local p = e.entity.surface.find_entity({name = v, force = 'neutral', quality = e.entity.quality.name}, {e.entity.position.x, e.entity.position.y})

                if p then
                    p.destroy()
                end
            end
        end
    end

    script.on_event(defines.events.on_built_entity, build_electric_pole, {{filter='name', name='rail-support'}})
    script.on_event(defines.events.on_robot_built_entity, build_electric_pole, {{filter='name', name='rail-support'}})
    script.on_event(defines.events.on_space_platform_built_entity, build_electric_pole, {{filter='name', name='rail-support'}})
    script.on_event(defines.events.script_raised_built, build_electric_pole, {{filter='name', name='rail-support'}})
    script.on_event(defines.events.on_entity_died, destroy_electric_pole, {{filter='name', name='rail-support'}})
    script.on_event(defines.events.on_player_mined_entity, destroy_electric_pole, {{filter='name', name='rail-support'}})
    script.on_event(defines.events.on_robot_pre_mined, destroy_electric_pole, {{filter='name', name='rail-support'}})
    script.on_event(defines.events.script_raised_destroy, destroy_electric_pole, {{filter='name', name='rail-support'}})
end
