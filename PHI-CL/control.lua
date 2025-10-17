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

local function gui_create(player)
    if player.gui.relative.phi_cl_inserter_config then
        player.gui.relative.phi_cl_inserter_config.destroy()
    end

    if player.gui.relative.phi_cl_combinator_config then
        player.gui.relative.phi_cl_combinator_config.destroy()
    end

    do
        local frame = player.gui.relative.add({type = 'frame', name = 'phi_cl_inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right, type = 'inserter', ghost_mode = 'both'}})
        frame.add({type = 'drop-down', name = 'i_sub_direction', items = {'[virtual-signal=signal-0]', '[virtual-signal=signal-1]', '[virtual-signal=signal-2]', '[virtual-signal=signal-3]'}, selected_index = 1})
    end

    do
        local frame = player.gui.relative.add({type = 'frame', name = 'phi_cl_combinator_config', anchor = {gui = defines.relative_gui_type.constant_combinator_gui, position = defines.relative_gui_position.right, name = 'super-combinator', ghost_mode = 'only_real'}})
        local table = frame.add({type = 'table', name = 'default', column_count = 1, style = 'table'})
        table.add({type = 'label', name = 'read_type', caption = {'gui-control-behavior-modes.read-contents'}, style = 'heading_2_label'})
        local research_queue_table = table.add({type = 'table', name = 'research_queue_table', column_count = 2, style = 'table'})
        research_queue_table.add({type = 'label', name = 'research_queue_label', caption = {'gui-technology-queue.title'}, style = 'heading_2_label'})
        research_queue_table.add({type = 'drop-down', name = 'research_queue_dropdown', items = {'[virtual-signal=signal-deny]', '[virtual-signal=signal-RA]', '[virtual-signal=signal-WA]', '[virtual-signal=signal-check]'}, selected_index = 1})
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

    if entity.type and entity.type == 'constant-combinator' and entity.name == 'super-combinator' then
        local circuit_oc = player.opened.get_or_create_control_behavior()

        if circuit_oc and circuit_oc.sections_count and circuit_oc.sections_count == 0 then
            circuit_oc.add_section()
        end

        circuit_oc = circuit_oc.sections[1]
        local cs1 = circuit_oc.get_slot(1)

        if not (cs1 or (cs1.value and cs1.value.name and cs1.value.name == 'signal-SA')) then
            return
        end

        local val = circuit_oc.get_slot(1).min or 0

        if (val < 0 or val > 3) then
            val = 0
        end

        player.gui.relative.phi_cl_combinator_config['default']['research_queue_table']['research_queue_dropdown'].selected_index = val + 1
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

    if event.entity.type == 'proxy-container' and event.entity.name == 'proxy-cargo-landing-chest' and prototypes.entity['cargo-landing-pad'] then
        local ec = game.surfaces[1].find_entities_filtered{type='cargo-landing-pad'}

        if not ec then
            return
        end

        event.entity.proxy_target_entity = ec[1]
        event.entity.proxy_target_inventory = defines.inventory.cargo_landing_pad_main

        return
    end

    if event.entity.type == 'cargo-landing-pad' and event.entity.name == 'cargo-landing-pad' and prototypes.entity['proxy-cargo-landing-chest'] then
        local ec = game.surfaces[1].find_entities_filtered{type='cargo-landing-pad'}

        if #ec > 1 then
            return
        end

        local ep = game.surfaces[1].find_entities_filtered{type='proxy-container', name='proxy-cargo-landing-chest'}

        for _, v in pairs(ep) do
            v.proxy_target_entity = ec[1]
            v.proxy_target_inventory = defines.inventory.cargo_landing_pad_main
        end

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

local function storage_init()
    if not storage.phi_cl then
        storage.phi_cl = {}
    end

    if not storage.phi_cl.loop then
        storage.phi_cl.loop = {
            combinator = false
        }
    end

    if not storage.phi_cl.combinator then
        storage.phi_cl.combinator = {
            research_set_combinator_count = 0,
            combinator_list = {},
            research_queue = {},
            research_queue_set = {},
            research_progress = 0
        }
    end

    storage.phi_cl.loop.combinator = (settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= ''))
end

script.on_init(function()
    if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
        for _, player in pairs(game.players) do
            gui_create(player)
        end
    end

    storage_init()
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

    storage_init()
end)

if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event(defines.events.on_player_created, function(event)
        gui_create(game.players[event.player_index])
    end)

    if settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'SS' then
        script.on_event(defines.events.on_cargo_pod_finished_ascending, function(event)
            event.cargo_pod.destroy()
        end)
    end

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
            local circuit_oc = player.opened.get_or_create_control_behavior()

            if circuit_oc and circuit_oc.sections_count and circuit_oc.sections_count == 0 then
                circuit_oc.add_section()
            end

            circuit_oc = circuit_oc.sections[1]
            circuit_oc.set_slot(1, {value = {type = 'virtual', name = 'signal-SA', quality = 'normal'}, min = event.element.parent.parent['research_queue_table']['research_queue_dropdown'].selected_index - 1})
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

script.on_nth_tick(1800, function(_)
    if storage.phi_cl.loop.combinator then
        storage.phi_cl.combinator.research_progress = math.floor(game.forces['player'].research_progress * 1000)
        storage.phi_cl.combinator.combinator_list = {}
        storage.phi_cl.combinator.research_queue = {}
        storage.phi_cl.combinator.research_queue_set = {}
        storage.phi_cl.combinator.research_set_combinator_count = 0
        local n = 1

        for _, r in pairs(game.forces['player'].research_queue) do
            local raw_name = r.name:gsub('-%d+$', '')

            if r.name and r.level and r.research_unit_count_formula then
                storage.phi_cl.combinator.research_queue[raw_name] = ((storage.phi_cl.combinator.research_queue[raw_name] and storage.phi_cl.combinator.research_queue[raw_name]) or 0) + math.pow(2, n - 1)
            end

            n = n + 1
        end

        for _, s in pairs(game.surfaces) do
            local c = s.find_entities_filtered{type='constant-combinator', name='super-combinator'}

            if not (c or #c == 0) then
                return
            end

            storage.phi_cl.combinator.combinator_list = c
        end
    end
end)

local function handle_research_queue(combinator)
    local combinator_slot = combinator.get_slot(1)

    if not (combinator_slot or (combinator_slot.value and combinator_slot.value.name and combinator_slot.value.name == 'signal-SA')) then
        combinator.set_slot(1, {value = {type = 'virtual', name = 'signal-SA', quality = 'normal'}, min = 0})
        return
    end

    local combinator_slot_value = combinator_slot.min or 0

    if combinator_slot_value == 1 or combinator_slot_value == 3 then
        -- research_queue_read
        local n = 21

        for rn, rv in pairs(storage.phi_cl.combinator.research_queue) do
            combinator.set_slot(n, {value = {type = 'virtual', name = 'signal-' .. rn, quality = 'normal'}, min = rv})

            n = n + 1
        end

        for i = n, 27 do
            combinator.clear_slot(i)
        end

        combinator.set_slot(28, {value = {type = 'virtual', name = 'signal-PA', quality = 'normal'}, min = storage.phi_cl.combinator.research_progress})
    end

    if combinator_slot_value == 2 or combinator_slot_value == 3 then
        -- research_queue_write
        storage.phi_cl.combinator.research_set_combinator_count = storage.phi_cl.combinator.research_set_combinator_count + 1

        if storage.phi_cl.combinator.research_set_combinator_count > 1 then
            combinator.set_slot(1, {value = {type = 'virtual', name = 'signal-SA', quality = 'normal'}, min = ((combinator_slot_value == 3) and 1) or 0})
            return
        end

        local ls = combinator.get_signals(defines.wire_connector_id.circuit_red, defines.wire_connector_id.circuit_green)

        if not (ls or #ls < 1) then
            return
        end

        for _, cs in pairs(ls) do
            local name = cs.signal.name:gsub('signal-', '')

            if cs.signal and cs.signal.type == 'virtual' and game.forces.player.technologies[name] and game.forces.player.technologies[name].enabled and game.forces.player.technologies[name].research_unit_count_formula then
                for i=1, 7 do
                    if cs.count % (2 ^ (8 + i)) == 1 then
                        storage.phi_cl.combinator.research_queue_set[i] = cs.signal.name
                    end
                end
            end
        end

        local empty = true
        local empty_gap = false
        local det = true

        for i=1, 7 do
            if storage.phi_cl.combinator.research_queue_set[i] then
                empty = false

                if empty_gap then
                    det = false
                end
            else
                empty_gap = true
            end
        end

        if det and (not empty) then
            game.forces['player'].research_queue = storage.phi_cl.combinator.research_queue_set
        end
    end
end

local function handle_valve_value(entity, combinator)
    local combinator_slot = combinator.get_slot(2)

    if not (combinator_slot or (combinator_slot.value and combinator_slot.value.name and combinator_slot.value.name == 'signal-VA')) then
        combinator.set_slot(2, {value = {type = 'virtual', name = 'signal-VA', quality = 'normal'}, min = 0})
        return
    end

    local combinator_slot_value = combinator_slot.min or 0

    if (combinator_slot_value >= 0 and combinator_slot_value < 101) then
        -- every item in front of it?
        local v = entity.surface.find_entities_filtered{type='valve', position=entity.position, radius=1}

        if not (v or #v == 0) then
            return
        end

        for _, valve in pairs(v) do
            if valve.valve_threshold_override then
                if combinator_slot_value == 0 then
                    valve.valve_threshold_override = nil

                else
                    valve.valve_threshold_override = combinator_slot_value / 100
                end
            end
        end
    end
end

local function handle_spoil_value(entity, combinator)
    local c = entity.surface.find_entities_filtered{type='chest', position=entity.position, radius=1, limit=1}

    if not c then
        return
    end

    local chest_storage = c[1].get_inventory(defines.inventory.chest)

    if chest_storage then
        local n = 31

        for _, item in pairs(chest_storage) do
            if item.spoil_percent and item.spoil_percent > 0 and n < 35 then
                combinator.set_slot(n, {value = {type = 'item', name = item.name, quality = 'normal'}, min = math.floor(item.spoil_percent * 1000)})

                n = n + 1
            end
        end

        for i = n, 35 do
            combinator.clear_slot(i)
        end
    end
end

script.on_nth_tick(10, function(_)
    local head = #storage.phi_cl.combinator.combinator_list
    local max_remove = math.floor(head / 100) + 1
    local remove_count = math.random(0, max_remove)

    while remove_count > 0 and head > 0 do
        local remove_index = math.random(1, head)
        local entity = storage.phi_cl.combinator.combinator_list[remove_index]
        storage.phi_cl.combinator.combinator_list[remove_index] = storage.phi_cl.combinator.combinator_list[head]
        head = head - 1

        if entity and entity.valid then
            remove_count = remove_count - 1
            local combinator = entity.get_or_create_control_behavior()

            if combinator and combinator.sections_count then
                if combinator.sections_count == 0 then
                    combinator.add_section()
                end

                handle_research_queue(combinator.sections[1])
                handle_valve_value(entity, combinator.sections[1])
                handle_spoil_value(entity, combinator.sections[1])
            end
        end
    end
end)
