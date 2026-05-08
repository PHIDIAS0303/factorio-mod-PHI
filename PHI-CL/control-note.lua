--[[
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

local function gui_create(player)
    if player.gui.relative.phi_cl_inserter_config then
        player.gui.relative.phi_cl_inserter_config.destroy()
    end

    do
        local frame = player.gui.relative.add({type = 'frame', name = 'phi_cl_inserter_config', anchor = {gui = defines.relative_gui_type.inserter_gui, position = defines.relative_gui_position.right, type = 'inserter', ghost_mode = 'both'}})
        frame.add({type = 'drop-down', name = 'i_sub_direction', items = {'[virtual-signal=signal-0]', '[virtual-signal=signal-1]', '[virtual-signal=signal-2]', '[virtual-signal=signal-3]'}, selected_index = 1})
    end
end

local function gui_update(player, entity)
    if entity.valid and entity.type and (entity.type == 'inserter' or (entity.type == 'entity-ghost' and entity.ghost_type == 'inserter')) then
        player.gui.relative.phi_cl_inserter_config['i_sub_direction'].selected_index = ((inserter_direction_reversed[entity.direction] - 1) % 4) + 1
    end
end

if settings.startup['PHI-MI'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    script.on_event(defines.events.on_gui_selection_state_changed, function(event)
        if (player.opened.type == 'inserter' or (player.opened.type == 'entity-ghost' and player.opened.ghost_type == 'inserter')) and player.gui.relative.phi_cl_inserter_config then
            player.opened.direction = inserter_direction[(math.floor(inserter_direction_reversed[player.opened.direction] / 4) * 4 + (event.element.parent['i_sub_direction'].selected_index - 1)) % 16 + 1]
        end
    end
end
]]
