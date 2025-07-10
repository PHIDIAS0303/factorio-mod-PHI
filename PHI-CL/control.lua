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

--[[
TODO
Valve
GUI set 0 ~ 1
entity.valve_threshold_override
]]

local function gui_create(player)
    if player.gui.relative.phi_cl_inserter_config then
        player.gui.relative.phi_cl_inserter_config.destroy()
    end

    if player.gui.relative.phi_cl_combinator_config then
        player.gui.relative.phi_cl_combinator_config.destroy()
    end

    do
        local frame = player.gui.relative.add({type = 'frame', name = 'phi_cl_inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right}})
        frame.add({type = 'drop-down', name = 'i_sub_direction', items = {'[virtual-signal=signal-0]', '[virtual-signal=signal-1]', '[virtual-signal=signal-2]', '[virtual-signal=signal-3]'}, selected_index = 1})
    end

    do
        local frame = player.gui.relative.add({type = 'frame', name = 'phi_cl_combinator_config', anchor = {gui = defines.relative_gui_type.constant_combinator_gui, position = defines.relative_gui_position.right}})
        local table = frame.add({type = 'table', name = 'default', column_count = 1, style = 'table'})
        table.add({type = 'label', name = 'read_type', caption = {'gui-control-behavior-modes.read-contents'}, style = 'heading_2_label'})
        local read_type_table = table.add({type = 'table', name = 'read_type_table', column_count = 2, style = 'table'})
        read_type_table.add({type = 'label', name = 'read_type_technology', caption = {'gui-technology-queue.title'}, style = 'heading_2_label'})
        read_type_table.add({type = 'drop-down', name = 'read_type_technology_dropdown', items = {'[virtual-signal=signal-deny]', '[virtual-signal=signal-check]'}, selected_index = 1})
        table.add({type = 'label', name = 'set_type', caption = {'gui-control-behavior-modes.set-filter'}, style = 'heading_2_label'})
        local set_type_table = table.add({type = 'table', name = 'set_type_table', column_count = 2, style = 'table'})
        set_type_table.add({type = 'label', name = 'set_type_technology', caption = {'gui-technology-queue.title'}, style = 'heading_2_label'})
        set_type_table.add({type = 'drop-down', name = 'set_type_technology_dropdown', items = {'[virtual-signal=signal-deny]', '[virtual-signal=signal-check]'}, selected_index = 1})
    end
end

local function gui_update(player, entity)
    if entity.type == 'proxy-container' and entity.proxy_target_inventory and entity.proxy_target_inventory == defines.inventory.lab_input then
        player.opened = nil

        return
    end

    if entity.type and (entity.type == 'inserter' or (entity.type == 'entity-ghost' and entity.ghost_type == 'inserter')) then
        player.gui.relative.phi_cl_inserter_config['i_sub_direction'].selected_index = ((inserter_direction_reversed[entity.direction] - 1) % 4) + 1
    end
end

local function inserter_changed(event)
    local player = game.players[event.player_index]

    if event.entity and player.opened == event.entity then
        gui_update(player, player.opened)
    end
end

local function hidden_recipe_enable(event)
    if not settings.startup['PHI-CT'].value then
        return
    end

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

local function entity_build(event)
    if event.entity.type == 'rail-support' then
        for _, v in pairs(rail_support_pole) do
            if prototypes.entity[v] then
                local p = event.entity.surface.create_entity{name = v, position = {event.entity.position.x, event.entity.position.y}, force = 'neutral', quality = event.entity.quality.name}
                p.destructible = false
            end
        end

        return
    end

    if event.entity.type == 'lab' and prototypes.entity['proxy-container'] then
        local p = event.entity.surface.create_entity{name = 'proxy-container', position = {event.entity.position.x, event.entity.position.y}, force = 'neutral', quality = event.entity.quality.name}
        p.destructible = false
        p.proxy_target_entity = event.entity
        p.proxy_target_inventory = defines.inventory.lab_input

        return
    end

    if event.entity.type == 'infinity-container' and event.entity.name == 'trash-chest' then
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

        return
    end

    if event.entity.type == 'lab' and prototypes.entity['proxy-container'] then
        local p = event.entity.surface.find_entity({name = 'proxy-container', force = 'neutral', quality = event.entity.quality.name}, {event.entity.position.x, event.entity.position.y})

        if p then
            p.destroy()
        end

        return
    end
end

script.on_init(function()
    if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        for _, player in pairs(game.players) do
            gui_create(player)
        end
    end
end)

script.on_configuration_changed(function()
    if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        for _, player in pairs(game.players) do
            gui_create(player)

            if player.opened and player.opened.object_name == 'LuaEntity' then
                gui_update(player, player.opened.entity)
            end
        end
    end
end)

if settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '' then
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

if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event(defines.events.on_player_created, function(event)
        gui_create(game.players[event.player_index])
    end)

    script.on_event(defines.events.on_gui_opened, function(event)
        local player = game.players[event.player_index]

        if event.entity and player.opened and player.opened == event.entity then
            gui_update(player, event.entity)
        end
    end)

    script.on_event(defines.events.on_gui_selection_state_changed, function(event)
        local player = game.players[event.player_index]

        if not (player.opened and player.opened.object_name == 'LuaEntity') then
            return
        end

        if (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) and player.gui.relative.phi_cl_inserter_config then
            player.opened.direction = inserter_direction[(math.floor(inserter_direction_reversed[player.opened.direction] / 4) * 4 + (event.element.parent['i_sub_direction'].selected_index - 1)) % 16 + 1]
        end

        if player.opened.type == 'constant-combinator' and player.opened.name == 'super-combinator' and player.gui.relative.phi_cl_inserter_config then
            --[[
            any signal = research_queue in bit form (inf only)
            research_progress = 0 ~ 100% (100x)
            ]]


            local circuit_oc = player.opened.get_or_create_control_behavior()

            if circuit_oc and circuit_oc.sections_count and circuit_oc.sections_count == 0 then
                circuit_oc.add_section()
            end

            circuit_oc = circuit_oc.sections[1]
            circuit_oc.set_slot(1, {value = {type = 'virtual', name = 'signal-RA', quality = 'normal'}, min = 0})
        end
    end)

    script.on_event({defines.events.on_player_rotated_entity, defines.events.on_player_flipped_entity}, function(event)
        inserter_changed(event)
    end)

    script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.on_space_platform_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, function(event)
        entity_build(event)
    end)

    script.on_event(defines.events.on_entity_cloned, function(event)
        entity_build({entity=event.destination})
    end)


    script.on_event({defines.events.on_entity_died, defines.events.on_player_mined_entity, defines.events.on_robot_pre_mined, defines.events.script_raised_destroy}, function(event)
        entity_destroy(event)
    end)
end

if settings.startup['PHI-CT'].value then
    script.on_event({defines.events.on_player_cheat_mode_enabled, defines.events.on_player_cheat_mode_disabled}, function(event)
        hidden_recipe_enable(event)
    end)
end
