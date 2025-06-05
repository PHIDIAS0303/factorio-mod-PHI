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

script.on_init(function()
	storage.phi_cl = storage.phi_cl or {}
end)

script.on_configuration_changed(function()
	storage.phi_cl = storage.phi_cl or {}
end)

if settings.startup['PHI-CT'].value then
    local function trash_entity_creation(event)
        if event.entity.name == 'trash-chest' then
            event.entity.remove_unfiltered_items = true

        elseif event.entity.name == 'trash-pipe' then
            event.entity.set_infinity_pipe_filter(nil)
        end
    end

    script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.on_space_platform_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, trash_entity_creation, {{filter = 'type', type = 'infinity-container', mode = 'or'}, {filter = 'type', type = 'infinity-pipe', mode = 'or'}})

    local function hidden_recipe_enable(event)
        local enable = (event.name == defines.events.on_player_cheat_mode_enabled)
        local force = game.players[event.player_index].force

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

    script.on_event({defines.events.on_player_cheat_mode_enabled, defines.events.on_player_cheat_mode_disabled}, hidden_recipe_enable)
end

if settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '-' then
script.on_nth_tick(3600, function(_)
        for _, s in pairs(game.surfaces) do
            local ec = s.find_entities_filtered{type='cargo-landing-pad', force='player'}

            if (not ec) then
                return
            end

            local ec_count = #ec

            if ec_count == 1 then
                return
            end

            local ic = {}

            for _, e in pairs(ec) do
                local inv = e.get_inventory(defines.inventory.cargo_landing_pad_main)

                if inv then
                    local item = inv.get_contents()

                    for _, v in pairs(item) do
                        if ic[v.name] and (ic[v.name].quality == v.quality) then
                            ic[v.name].count = ic[v.name].count + v.count

                        else
                            ic[v.name] = {count = v.count, quality = v.quality}
                        end
                    end

                    inv.clear()
                end
            end

            for k, v in pairs(ic) do
                local c = math.floor(v.count / ec_count)
                local remainder = v.count % ec_count

                if c > 0 then
                    for _, e in ipairs(ec) do
                        e.insert{name = k, count = c, quality = v.quality}
                    end
                end

                if remainder > 0 then
                    ec[1].insert{name = k, count = remainder, quality = v.quality}
                end
            end
        end
    end)
end

if settings.startup['PHI-CT'].value or settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '-') then
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

    script.on_event({defines.events.on_player_rotated_entity, defines.events.on_player_flipped_entity}, inserter_changed)

    --[[
    script.on_event(defines.events.on_entity_settings_pasted, function(e)
        local player = game.players[e.player_index]

        if e.destination and e.source and player.opened and e.destination.type and (e.destination.type == 'inserter' or (e.destination.type == 'entity-ghost' and e.destination.ghost_type == 'inserter')) and e.source.type and (e.source.type == 'inserter' or (e.source.type == 'entity-ghost' and e.source.ghost_type == 'inserter')) and player.opened == e.source then
            gui_update(player, player.opened)
        end
    end)
    ]]

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

    script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.on_space_platform_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, build_electric_pole, {{filter = 'type', type = 'rail-support'}})
    script.on_event({defines.events.on_entity_died, defines.events.on_player_mined_entity, defines.events.on_robot_pre_mined, defines.events.script_raised_destroy}, destroy_electric_pole, {{filter = 'type', type = 'rail-support'}})

    local function build_proxy_container(e)
        local p = e.entity.surface.create_entity{name = 'proxy-container', position = {e.entity.position.x, e.entity.position.y}, force = 'neutral', quality = e.entity.quality.name}
        p.destructible = false
        p.proxy_target_entity = e.entity
        p.proxy_target_inventory = defines.inventory.lab_input
    end

    local function destroy_proxy_container(e)
        local p = e.entity.surface.find_entity({name = 'proxy-container', force = 'neutral', quality = e.entity.quality.name}, {e.entity.position.x, e.entity.position.y})

        if p then
            p.destroy()
        end
    end

    filter = {{filter = 'type', type = 'lab'}}
    script.on_event(defines.events.on_built_entity, build_proxy_container, filter)
    script.on_event(defines.events.on_robot_built_entity, build_proxy_container, filter)
    script.on_event(defines.events.on_space_platform_built_entity, build_proxy_container, filter)
    script.on_event(defines.events.script_raised_built, build_proxy_container, filter)
    script.on_event(defines.events.script_raised_revive, build_proxy_container, filter)

    script.on_event(defines.events.on_entity_died, destroy_proxy_container, filter)
    script.on_event(defines.events.on_player_mined_entity, destroy_proxy_container, filter)
    script.on_event(defines.events.on_robot_pre_mined, destroy_proxy_container, filter)
    script.on_event(defines.events.script_raised_destroy, destroy_proxy_container, filter)
end
