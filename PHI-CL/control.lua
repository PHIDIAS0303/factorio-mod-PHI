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

local function inserter_gui_create(player)
    if player.gui.relative.inserter_config then
        player.gui.relative.inserter_config.destroy()
    end

    local frame = player.gui.relative.add({type = 'frame', name = 'inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right}})
    frame.add({type = 'drop-down', name = 'i_sub_direction', items = {'[virtual-signal=signal-0]', '[virtual-signal=signal-1]', '[virtual-signal=signal-2]', '[virtual-signal=signal-3]'}, selected_index = 1})
end

local function inserter_gui_update(player, inserter)
    if not (inserter.supports_direction or ((inserter.prototype and inserter.prototype.allow_custom_vectors) or (inserter.ghost_prototype and inserter.ghost_prototype.allow_custom_vectors))) then
        return
    end

    local gui = player.gui.relative.inserter_config
    gui['i_sub_direction'].selected_index = ((inserter_direction_reversed[inserter.direction] - 1) % 4) + 1
end

local function inserter_changed(event)
    local player = game.players[event.player_index]

    if event.entity and player.opened == event.entity and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) then
        inserter_gui_update(player, player.opened)
    end
end

local function hidden_recipe_enable(event)
    local enable = (settings.startup['PHI-CT'].value and (event.name == defines.events.on_player_cheat_mode_enabled))
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

local function entity_build(event)
    if event.entity.type == 'rail-support' then
        for _, v in pairs(rail_support_pole) do
            if prototypes.entity[v] then
                local p = event.entity.surface.create_entity{name = v, position = {event.entity.position.x, event.entity.position.y}, force = 'neutral', quality = event.entity.quality.name}
                p.destructible = false
            end
        end

    elseif event.entity.type == 'lab' then
        local p = event.entity.surface.create_entity{name = 'proxy-container', position = {event.entity.position.x, event.entity.position.y}, force = 'neutral', quality = event.entity.quality.name}
        p.destructible = false
        p.proxy_target_entity = event.entity
        p.proxy_target_inventory = defines.inventory.lab_input

    elseif event.entity.type == 'infinity-container' and event.entity.name == 'trash-chest' then
        event.entity.remove_unfiltered_items = true

    elseif event.entity.type == 'infinity-pipe' and event.entity.name == 'trash-pipe' then
        event.entity.set_infinity_pipe_filter(nil)
    end
end

local function entity_destroy(event)
    if event.entity.type == 'rail-support' then
        for _, v in pairs(rail_support_pole) do
            if prototypes.entity[v] then
                local p = event.entity.surface.find_entity({name = v, force = 'neutral', quality = event.entity.quality.name}, {event.entity.position.x, event.entity.position.y})

                if p then
                    p.destroy()
                end
            end
        end

    elseif event.entity.type == 'lab' then
        local p = event.entity.surface.find_entity({name = 'proxy-container', force = 'neutral', quality = event.entity.quality.name}, {event.entity.position.x, event.entity.position.y})

        if p then
            p.destroy()
        end
    end
end

script.on_init(function()
	storage.phi_cl = storage.phi_cl or {
        event_handler = {}
    }

    if settings.startup['PHI-CT'].value or settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '-') then
        for _, player in pairs(game.players) do
            inserter_gui_create(player)
        end
    end
end)

script.on_configuration_changed(function()
	storage.phi_cl = storage.phi_cl or {
        event_handler = {}
    }

    if settings.startup['PHI-CT'].value or settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '-') then
        for _, player in pairs(game.players) do
            inserter_gui_create(player)

            if player.opened and player.opened.object_name == 'LuaEntity' and (player.opened.entity.type == 'inserter' or (player.opened.entity.type == 'entity-ghost' and player.opened.entity.ghost_type == 'inserter')) then
                inserter_gui_update(player, player.opened.entity)
            end
        end
    end
end)

local function event_reg(event_name, event_handler_name, event_handler)
    if storage.phi_cl.event_handler[event_name] then
        if not storage.phi_cl.event_handler[event_name][event_handler_name] then
            storage.phi_cl.event_handler[event_name][event_handler_name] = event_handler
        end

    else
        storage.phi_cl.event_handler[event_name] = {event_handler_name = event_handler}
    end
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
    event_reg('on_player_created', 'inserter_gui_create', function(event)
        inserter_gui_create(game.players[event.player_index])
    end)

    event_reg('on_gui_opened', 'inserter_gui_update', function(event)
        if event.entity and (event.entity.type == 'inserter' or (event.entity.type == 'entity-ghost' and event.entity.ghost_type == 'inserter')) then
            inserter_gui_update(game.players[event.player_index], event.entity)
        end
    end)

    event_reg('on_gui_selection_state_changed', 'inserter_direction', function(event)
        local player = game.players[event.player_index]
        local gui = player.gui.relative.inserter_config

        if player.opened and player.opened.object_name == 'LuaEntity' and (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) and gui[event.element.name] then
            player.opened.direction = inserter_direction[(math.floor(inserter_direction_reversed[player.opened.direction] / 4) * 4 + (event.element.parent['i_sub_direction'].selected_index - 1)) % 16 + 1]
        end
    end)

    for _, event_name in pairs({'on_player_rotated_entity', 'on_player_flipped_entity'}) do
        event_reg(event_name, 'inserter_changed', function(event)
            inserter_changed(event)
        end)
    end

    --[[
    event_reg('on_entity_settings_pasted', 'inserter_direction', function(event)
        local player = game.players[event.player_index]

        if event.destination and event.source and player.opened and event.destination.type and (event.destination.type == 'inserter' or (event.destination.type == 'entity-ghost' and event.destination.ghost_type == 'inserter')) and event.source.type and (event.source.type == 'inserter' or (event.source.type == 'entity-ghost' and event.source.ghost_type == 'rter')) and player.opened == event.source then
            inserter_gui_update(player, player.opened)
        end
    end)
    ]]

    for _, event_name in pairs({'on_built_entity', 'on_robot_built_entity', 'on_space_platform_built_entity', 'script_raised_built', 'script_raised_revive'}) do
        event_reg(event_name, 'entity_build', function(event)
            entity_build(event)
        end)
    end

    for _, event_name in pairs({'on_entity_died', 'on_player_mined_entity', 'on_robot_pre_mined', 'script_ratroy'}) do
        event_reg(event_name, 'entity_destroy', function(event)
            entity_destroy(event)
        end)
    end

    for _, event_name in pairs({'on_player_cheat_mode_enabled', 'on_player_cheat_mode_disabled'}) do
        event_reg(event_name, hidden_recipe_enable)
    end
end

for event_name, event_funcs in pairs(storage.phi_cl.event_handler) do
    script.on_event(defines.events[event_name], function(event)
        for _, event_func in pairs(event_funcs) do
            event_func(event)
        end
    end)
end
