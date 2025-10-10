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
        local read_type_table = table.add({type = 'table', name = 'read_type_table', column_count = 2, style = 'table'})
        read_type_table.add({type = 'label', name = 'read_type_technology', caption = {'gui-technology-queue.title'}, style = 'heading_2_label'})
        read_type_table.add({type = 'drop-down', name = 'read_type_technology_dropdown', items = {'[virtual-signal=signal-deny]', '[virtual-signal=signal-check]'}, selected_index = 1})
        --[[
        table.add({type = 'label', name = 'set_type', caption = {'gui-control-behavior-modes.set-filter'}, style = 'heading_2_label'})
        local set_type_table = table.add({type = 'table', name = 'set_type_table', column_count = 2, style = 'table'})
        set_type_table.add({type = 'label', name = 'set_type_technology', caption = {'gui-technology-queue.title'}, style = 'heading_2_label'})
        set_type_table.add({type = 'drop-down', name = 'set_type_technology_dropdown', items = {'[virtual-signal=signal-deny]', '[virtual-signal=signal-check]'}, selected_index = 1})
        ]]
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
        local val = circuit_oc.get_slot(1).min or 0

        player.gui.relative.phi_cl_combinator_config['default']['read_type_table']['read_type_technology_dropdown'].selected_index = ((val % 2) >= 1 and 2) or 1
        -- player.gui.relative.phi_cl_combinator_config['default']['set_type_table']['set_type_technology_dropdown'].selected_index = ((val % 4) >= 2 and 2) or 1
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

    if settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'SS' then
        if remote.interfaces.freeplay and remote.interfaces.freeplay.set_disable_crashsite then
            remote.call('freeplay', 'set_disable_crashsite', true)
        end

        local mgs = {
            default_enable_all_autoplace_controls = false,
            seed = 1,
            no_enemies_mode = true,
            autoplace_controls = {},
            autoplace_settings = {
                tile = {
                    treat_missing_as_default = false,
                    settings = {
                        ['out-of-map'] = {frequency=1, size=1, richness=1},
                    }
                },
                entity = {treat_missing_as_default = false},
                decorative = {treat_missing_as_default = false}
            },
            property_expression_names = {
                ['tile:out-of-map:probability'] = '1'
            }
        }

        local pf = game.forces['player'].create_space_platform({name = 'spaceship', planet = 'nauvis', starter_pack = 'space-platform-starter-pack'})
        local sp = game.create_surface('spaceship_fl_1', mgs)
        local sm = game.create_surface('spaceship_fl_2', mgs)

        if not pf then
            return
        end

        pf.apply_starter_pack()
        pf.hub.insert({name='asteroid-collector', count=1})
        pf.hub.insert({name='crusher', count=1})
        pf.hub.insert({name='assembling-machine-1', count=2})
        pf.hub.insert({name='inserter', count=10})
        pf.hub.insert({name='solar-panel', count=20})
        pf.hub.insert({name='space-platform-foundation', count=200})
        pf.hub.insert({name='electric-furnace', count=4})

        game.surfaces[1].map_gen_settings.width = 1
        game.surfaces[1].map_gen_settings.height = 1

        for _, g in pairs(game.permissions.groups) do
            g.set_allows_action(defines.input_action.land_at_planet, false)
        end

        for c in game.surfaces[1].get_chunks() do
            game.surfaces[1].delete_chunk({c.x, c.y})
        end

        local tiles = {}

        for x = -7, 6 do
            for y = -7, 10 do
                table.insert(tiles, {name='space-platform-foundation', position={x, y}})
            end
        end

        pf.surface.set_tiles(tiles)

        tiles = {}

        for x = -7, 6 do
            for y = 0, 10 do
                table.insert(tiles, {name='grass-1', position={x, y}})
            end
        end

        sp.set_tiles(tiles)
        sm.set_tiles(tiles)

        local entities = {
            {name='substation', position={0, 6}},
            {name='pipe-to-ground', position={3, 5}, direction=defines.direction.south},
            {name='pipe-to-ground', position={-4, 5}, direction=defines.direction.south}
        }

        for _, s in pairs({pf.surface, sp, sm}) do
            for _, en in pairs(entities) do
                local e = s.create_entity{name=en.name, position=en.position, force='player', direction=en.direction}
                e.destructible = false
                e.minable = false
                e.rotatable = false
            end
        end

        local sub_d = pf.surface.find_entity('substation', {0, 6})
        local sub_p = sp.find_entity('substation', {0, 6})
        local sub_m = sm.find_entity('substation', {0, 6})

        if sub_d and sub_p and sub_m then
            local p_d = sub_d.get_wire_connector(defines.wire_connector_id.pole_copper, true)
            local p_p = sub_p.get_wire_connector(defines.wire_connector_id.pole_copper, true)
            local p_m = sub_m.get_wire_connector(defines.wire_connector_id.pole_copper, true)

            p_d.connect_to(p_p, false, defines.wire_origin.script)
            p_m.connect_to(p_d, false, defines.wire_origin.script)
        end

        if not storage.phi_cl.spaceship then
            storage.phi_cl.spaceship = {
                deck = pf,
                fl_1 = sp,
                fl_2 = sm
            }
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

    storage_init()
end)

if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event(defines.events.on_player_created, function(event)
        gui_create(game.players[event.player_index])

        if settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'SS' then
            game.forces['player'].technologies['space-platform'].researched = true
            game.players[event.player_index].teleport(storage.phi_cl.spaceship.deck.surface.find_non_colliding_position('character', {x=0, y=0}, 32, 1) or {x=0, y=0}, storage.phi_cl.spaceship.deck.surface.name)
        end
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
            circuit_oc.set_slot(1, {value = {type = 'virtual', name = 'signal-RA', quality = 'normal'}, min = ((event.element.parent.parent['read_type_table']['read_type_technology_dropdown'].selected_index == 2) and 1 or 0)})
            -- circuit_oc.set_slot(1, {value = {type = 'virtual', name = 'signal-RA', quality = 'normal'}, min = ((event.element.parent.parent['read_type_table']['read_type_technology_dropdown'].selected_index == 2) and 1 or 0) + ((event.element.parent.parent['set_type_table']['set_type_technology_dropdown'].selected_index == 2) and 2 or 0)})
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
        storage.phi_cl.combinator.research_progress = math.floor(game.forces['player'].research_progress * 100)

        do
            storage.phi_cl.combinator.research_queue = {}
            storage.phi_cl.combinator.research_queue_set = {
                [1] = nil,
                [2] = nil,
                [3] = nil,
                [4] = nil,
                [5] = nil,
                [6] = nil,
                [7] = nil
            }
            storage.phi_cl.combinator.research_set_combinator_count = 0
            local n = 1

            for _, r in pairs(game.forces['player'].research_queue) do
                local raw_name = r.name:gsub('-%d+$', '')

                if r.name and r.level and r.research_unit_count_formula then
                    storage.phi_cl.combinator.research_queue[raw_name] = ((storage.phi_cl.combinator.research_queue[raw_name] and storage.phi_cl.combinator.research_queue[raw_name]) or 0) + math.pow(2, n - 1)
                end

                n = n + 1
            end
        end

        for _, s in pairs(game.surfaces) do
            local c = s.find_entities_filtered{type='constant-combinator', name='super-combinator'}

            if c and #c > 0 then
                for _, sc in pairs(c) do
                    local circuit_oc = sc.get_or_create_control_behavior()

                    if circuit_oc and circuit_oc.sections_count and circuit_oc.sections_count == 0 then
                        circuit_oc.add_section()
                    end

                    circuit_oc = circuit_oc.sections[1]
                    local val = circuit_oc.get_slot(1).min or 0

                    if (val % 2) >= 1 then
                        -- read_type_technology_dropdown
                        local n = 11

                        for rn, rv in pairs(storage.phi_cl.combinator.research_queue) do
                            circuit_oc.set_slot(n, {value = {type = 'virtual', name = 'signal-' .. rn, quality = 'normal'}, min = rv})

                            n = n + 1
                        end

                        for i = n, 17 do
                            circuit_oc.clear_slot(i)
                        end

                        circuit_oc.set_slot(18, {value = {type = 'virtual', name = 'signal-PA', quality = 'normal'}, min = storage.phi_cl.combinator.research_progress})
                    end

                    --[[
                    if (val % 4) >= 2 then
                        -- incomplete
                        -- set_type_technology_dropdown

                        storage.phi_cl.combinator.research_set_combinator_count = storage.phi_cl.combinator.research_set_combinator_count + 1

                        if storage.phi_cl.combinator.research_set_combinator_count > 1 then
                            circuit_oc.set_slot(1, {value = {type = 'virtual', name = 'signal-RA', quality = 'normal'}, min = (((val % 2) >= 1) and 1 or 0)})

                        else
                            local ls = sc.get_signals(defines.wire_connector_id.circuit_red, defines.wire_connector_id.circuit_green)

                            if ls and #ls > 0 then
                                for _, cs in pairs(ls) do
                                    if cs.signal and cs.signal.type == 'virtual' and technology_signal[cs.signal.name] then
                                        for i = 1, 7 do
                                            if cs.count % (2 ^ (8 + i)) == 1 then
                                                storage.phi_cl.combinator.research_queue_set[i] = technology_signal[cs.signal.name]
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    ]]
                end

                -- game.forces['player'].research_queue = storage.phi_cl.combinator.research_queue_set
            end
        end
    end
end)
