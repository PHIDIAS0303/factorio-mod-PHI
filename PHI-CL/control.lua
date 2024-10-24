local items = require 'config'

if settings.startup['PHI-XC'].value then
    script.on_nth_tick(60, function(event)
        local ts = math.floor(event.tick / 60)
        local c

        if ts > 3599 then
            c = string.format('%d:%02d:%02d', math.floor(ts / 3600), math.floor(ts / 60) % 60, math.floor(ts) % 60)

        else
            c = string.format('%d:%02d', math.floor(ts / 60) % 60, math.floor(ts) % 60)
        end

        for _, p in pairs(game.connected_players) do
            if p.gui.top.phi_clock == nil then
                p.gui.top.add{type='button', name='phi_clock'}
            end

            p.gui.top.phi_clock.caption = c
        end
    end)
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TRASH'].value then
    local function trash_creation(event)
        local entity = event.created_entity or event.entity

        if not entity then
            return
        end

        if not entity.valid then
            return
        end

        if entity.name == 'trash-chest' then
            entity.infinity_container_filters = {}
            entity.remove_unfiltered_items = true

        elseif entity.name == 'trash-pipe' then
            entity.set_infinity_pipe_filter(nil)
        end
    end

    local function trash_check()
        for _, surface in pairs(game.surfaces) do
            for _, e in pairs(surface.find_entities_filtered{name='trash-chest'}) do
                e.infinity_container_filters = {}
                e.remove_unfiltered_items = true
            end

            for _, e in pairs(surface.find_entities_filtered{name='trash-pipe'}) do
                e.set_infinity_pipe_filter(nil)
            end
        end
    end

    script.on_init(trash_check)
    script.on_event(defines.events.on_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
    script.on_event(defines.events.on_robot_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
    script.on_event(defines.events.script_raised_built, trash_creation)
    script.on_event(defines.events.script_raised_revive, trash_creation)
end
