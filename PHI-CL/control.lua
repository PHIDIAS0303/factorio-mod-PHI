local items = require 'config'

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-UTILITY'].value then
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
