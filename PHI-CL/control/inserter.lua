
local main = {}

function main.get_belt_penalty(belt_speed, inserter_stack_size)
    local penalty = 0
    local items_left = inserter_stack_size - 1
    local offset = belt_speed
    local picked = true

    while items_left > 0 do
        if offset > 0 then
            items_left = items_left - 1
            offset = offset - 0.25
            picked = true
        end

        offset = offset + belt_speed

        if not picked and (offset > 0) then
            items_left = items_left - 1
            offset = offset - 0.25
            picked = true
        end

        penalty = penalty + 1
        picked = false
    end

    return penalty
end

function main.calc(entity)
    local prototype = entity.type == 'entity-ghost' and entity.ghost_prototype or entity.prototype
    local pickup_target = entity.pickup_target and entity.pickup_target or entity.surface.find_entities_filtered{position = entity.pickup_position, limit = 1}[1]
    local drop_target = entity.drop_target and entity.drop_target or entity.surface.find_entities_filtered{position = entity.drop_position, limit = 1}[1]
    local pickup_length = math.sqrt((entity.pickup_position.x - entity.position.x) * (entity.pickup_position.x - entity.position.x) + (entity.pickup_position.y - entity.position.y) * (entity.pickup_position.y - entity.position.y))
    local drop_length = math.sqrt((entity.drop_position.x - entity.position.x) * (entity.drop_position.x - entity.position.x) + (entity.drop_position.y - entity.position.y) * (entity.drop_position.y - entity.position.y))
    local stack_size = entity.inserter_stack_size_override == 0 and (1 + prototype.inserter_stack_size_bonus + ((prototype.bulk and entity.force.bulk_inserter_capacity_bonus) or entity.force.inserter_stack_size_bonus)) or entity.inserter_stack_size_override
    local angle = (pickup_length > 0 and drop_length > 0) and math.acos(math.max(-1, math.min(1, (((entity.pickup_position.x - entity.position.x) * (entity.drop_position.x - entity.position.x) + (entity.pickup_position.y - entity.position.y) * (entity.drop_position.y - entity.position.y)) / (pickup_length * drop_length))))) or 0
    local ticks_per_cycle = 2 * math.ceil((angle / (math.pi * 2) - 0.001) / prototype.get_inserter_rotation_speed(entity.quality))
    local extension_time = 2 * math.ceil(math.abs(pickup_length - drop_length) / prototype.get_inserter_extension_speed(entity.quality))
    ticks_per_cycle = ticks_per_cycle < extension_time and extension_time or ticks_per_cycle
    ticks_per_cycle = ticks_per_cycle < 2 and 2 or ticks_per_cycle
    local pickup_belt_speed = pickup_target and (pickup_target.type == 'entity-ghost' and pickup_target.ghost_prototype.belt_speed or pickup_target.prototype.belt_speed) or nil
    ticks_per_cycle = (pickup_belt_speed and (stack_size > 1)) and (ticks_per_cycle + main.get_belt_penalty(pickup_belt_speed, stack_size)) or ticks_per_cycle
    local drop_belt_speed = drop_target and (drop_target.type == 'entity-ghost' and drop_target.ghost_prototype.belt_speed or drop_target.prototype.belt_speed) or nil
    ticks_per_cycle = (drop_belt_speed and (stack_size > 1)) and (ticks_per_cycle + main.get_belt_penalty(drop_belt_speed, stack_size)) or ticks_per_cycle
    stack_size = drop_belt_speed and math.min(stack_size, drop_belt_speed * ticks_per_cycle * 4) or stack_size
    stack_size = pickup_belt_speed and math.min(stack_size, pickup_belt_speed * ticks_per_cycle * 8) or stack_size
    return stack_size * 60 / ticks_per_cycle
end

return main
