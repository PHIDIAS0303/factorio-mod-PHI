local main = {}

function main.build(event)
    if event.entity.type ~= 'loader-1x1' then
        return
    end

    if prototypes.entity['loader-1x1'] then
        local p = event.entity.surface.create_entity{name = 'loader-1x1', position = {event.entity.position.x, event.entity.position.y}, force = 'neutral', quality = event.entity.quality.name}
        p.destructible = false
    end
end

function main.destroy(event)
    if event.entity.type ~= 'loader-1x1' then
        return
    end

    if prototypes.entity['loader-1x1'] then
        local p = event.entity.surface.find_entity({name = 'loader-1x1', force = 'neutral', quality = event.entity.quality.name}, {event.entity.position.x, event.entity.position.y})

        if p then
            p.destroy()
        end
    end
end

return main
