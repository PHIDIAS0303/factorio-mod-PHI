local rail_support_pole = {
    'rail-support-pole-electric',
    'rail-support-pole-lightning'
}

local main = {}

function main.build(event)
    if event.entity.type == 'rail-support' then
        for _, v in pairs(rail_support_pole) do
            if prototypes.entity[v] then
                local p = event.entity.surface.create_entity{name = v, position = {event.entity.position.x, event.entity.position.y}, force = 'neutral', quality = event.entity.quality.name}
                p.destructible = false
            end
        end

        return
    end
end

function main.destroy(event)
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
end

return main
