local main = {}

function main.open(player)
    if not player then
        return
    end

    if not player.opened then
        return
    end

    if not player.opened.valid then
        return
    end

    if player.opened.type ~= 'proxy-container' then
        return
    end

    if not player.opened.proxy_target_inventory then
        return
    end

    if player.opened.proxy_target_inventory ~= defines.inventory.lab_input then
        return
    end

    player.opened = nil
end

function main.build(event)
    if event.entity.type ~= 'lab' then
        return
    end

    if not prototypes.entity['proxy-container'] then
        return
    end

    local p = event.entity.surface.create_entity{name = 'proxy-container', position = {event.entity.position.x, event.entity.position.y}, force = 'neutral', quality = event.entity.quality.name}
    p.destructible = false
    p.proxy_target_entity = event.entity
    p.proxy_target_inventory = defines.inventory.lab_input
end

function main.destroy(event)
    if event.entity.type ~= 'lab' then
        return
    end

    if not prototypes.entity['proxy-container'] then
        return
    end

    local p = event.entity.surface.find_entity({name = 'proxy-container', force = 'neutral', quality = event.entity.quality.name}, {event.entity.position.x, event.entity.position.y})

    if not p then
        return
    end

    p.destroy()
end

return main
