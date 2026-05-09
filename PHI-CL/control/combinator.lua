local main = {}

function main.storage_init()
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
            combinator_list = {},
            research_queue = {},
            research_queue_set = {},
            research_progress = 0,
            last_writer = nil
        }
    end

    storage.phi_cl.loop.combinator = ((settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= ''))
end

function main.gui_create(player)
    if player.gui.relative.phi_cl_combinator_config then
        player.gui.relative.phi_cl_combinator_config.destroy()
    end

    local frame = player.gui.relative.add({type = 'frame', name = 'phi_cl_combinator_config', anchor = {gui = defines.relative_gui_type.constant_combinator_gui, position = defines.relative_gui_position.right, name = 'super-combinator', ghost_mode = 'only_real'}})
    local table = frame.add({type = 'table', name = 'default', column_count = 1, style = 'table'})
    table.add({type = 'label', name = 'read_type', caption = {'gui-control-behavior-modes.read-contents'}, style = 'heading_2_label'})
    local table_research_queue = table.add({type = 'table', name = 'table_research_queue', column_count = 2, style = 'table'})
    table_research_queue.add({type = 'label', name = 'research_queue_label', caption = {'gui-technology-queue.title'}, style = 'heading_2_label'})
    table_research_queue.add({type = 'drop-down', name = 'research_queue_dropdown', items = {'[virtual-signal=signal-deny]', '[virtual-signal=signal-RA]', '[virtual-signal=signal-WA]', '[virtual-signal=signal-check]'}, selected_index = 1})
end

function main.gui_update(player, entity)
    if entity.valid and entity.type and entity.type == 'constant-combinator' and entity.name == 'super-combinator' then
        local circuit_oc = player.opened.get_or_create_control_behavior()

        if circuit_oc and circuit_oc.sections_count and circuit_oc.sections_count == 0 then
            circuit_oc.add_section()
        end

        circuit_oc = circuit_oc.sections[1]
        local cs1 = circuit_oc.get_slot(1)

        if not cs1 or not cs1.value or not cs1.value.name or cs1.value.name ~= 'signal-SA' then
            return
        end

        local val = cs1.min or 0

        if player.gui.relative.phi_cl_combinator_config and player.gui.relative.phi_cl_combinator_config['default'] and player.gui.relative.phi_cl_combinator_config['default']['table_research_queue'] then
            local dropdown = player.gui.relative.phi_cl_combinator_config['default']['table_research_queue']['research_queue_dropdown']

            if dropdown then
                dropdown.selected_index = ((val < 0 or val > 3) and 1) or (val + 1)
            end
        end
    end
end

function main.handle_research_queue(entity, combinator)
    local combinator_slot = combinator.get_slot(1)

    if not combinator_slot or not combinator_slot.value or not combinator_slot.value.name or combinator_slot.value.name ~= 'signal-SA' then
        combinator.set_slot(1, {value = {type = 'virtual', name = 'signal-SA', quality = 'normal'}, min = 0})
        return
    end

    local combinator_slot_value = combinator_slot.min or 0

    if combinator_slot_value < 0 or combinator_slot_value > 3 then
        combinator.set_slot(1, {value = {type = 'virtual', name = 'signal-SA', quality = 'normal'}, min = 0})
        return
    end

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
        if storage.phi_cl.combinator.last_writer and storage.phi_cl.combinator.last_writer ~= entity.unit_number then
            -- Another combinator wrote recently
            combinator.set_slot(1, {value = {type = 'virtual', name = 'signal-SA', quality = 'normal'}, min = ((combinator_slot_value == 3) and 1) or 0})
            return
        end

        storage.phi_cl.combinator.last_writer = entity.unit_number
        storage.phi_cl.combinator.research_queue_set = {}

        local s = entity.get_signals(defines.wire_connector_id.circuit_red, defines.wire_connector_id.circuit_green)

        if not s then
            return
        end

        for _, ss in pairs(s) do
            if ss.signal and (ss.signal.type and ss.signal.type == 'virtual') and (not ss.signal.quality or ss.signal.quality == 'normal') and ss.count > 0 then
                local tn = ss.signal.name:sub(8)

                if prototypes.technology[tn] and prototypes.technology[tn].enabled and prototypes.technology[tn].max_level then
                    for i=1, 7 do
                        if math.floor(ss.count / (2 ^ (7 + i))) % 2 == 1 then
                            storage.phi_cl.combinator.research_queue_set[i] = tn
                        end
                    end
                end
            end
        end

        local research_queue = {}

        for i=1,7 do
            if storage.phi_cl.combinator.research_queue_set[i] then
                table.insert(research_queue, storage.phi_cl.combinator.research_queue_set[i])
            end
        end

        game.forces['player'].research_queue = research_queue
        storage.phi_cl.combinator.last_writer = nil
    end
end

function main.on_nth_tick_1800()
    if storage.phi_cl and storage.phi_cl.loop and storage.phi_cl.loop.combinator and game.forces['player'] then
        storage.phi_cl.combinator.research_progress = math.floor(game.forces['player'].research_progress * 1000)
        storage.phi_cl.combinator.combinator_list = {}
        storage.phi_cl.combinator.research_queue = {}
        storage.phi_cl.combinator.research_queue_set = {}
        local n = 1

        for _, r in pairs(game.forces['player'].research_queue) do
            if r.name and r.level and r.research_unit_count_formula then
                storage.phi_cl.combinator.research_queue[r.name] = (storage.phi_cl.combinator.research_queue[r.name] or 0) + math.pow(2, n - 1)
            end

            n = n + 1
        end

        if prototypes.entity['super-combinator'] then
            for _, s in pairs(game.surfaces) do
                local c = s.find_entities_filtered{type='constant-combinator', name='super-combinator'}

                if #c > 0 then
                    for _, entity in pairs(c) do
                        table.insert(storage.phi_cl.combinator.combinator_list, entity)
                    end
                end
            end
        end
    end
end

function main.on_nth_tick_10()
    if not storage.phi_cl or not storage.phi_cl.combinator or not storage.phi_cl.combinator.combinator_list then
        return
    end

    local head = #storage.phi_cl.combinator.combinator_list

    if head == 0 then
        return
    end

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

                main.handle_research_queue(entity, combinator.sections[1])
            end
        end
    end
end

return main
