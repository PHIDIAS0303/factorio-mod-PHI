local main = {}

function main.build(event)
    if event.entity.type == 'infinity-container' and event.entity.name == 'trash-chest' then
        event.entity.remove_unfiltered_items = true

    elseif event.entity.type == 'infinity-pipe' and event.entity.name == 'trash-pipe' then
        event.entity.set_infinity_pipe_filter(nil)
    end
end

return main
