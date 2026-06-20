
local main = {}

function main.calc(entity)
    local prototype = entity.type == 'entity-ghost' and entity.ghost_prototype or entity.prototype
    local pickup_target = entity.pickup_target and entity.pickup_target or entity.surface.find_entities_filtered{position = entity.pickup_position, limit = 1}[1]
    local drop_target = entity.drop_target and entity.drop_target or entity.surface.find_entities_filtered{position = entity.drop_position, limit = 1}[1]
    local pickup_length = math.sqrt((entity.pickup_position.x - entity.position.x) * (entity.pickup_position.x - entity.position.x) + (entity.pickup_position.y - entity.position.y) * (entity.pickup_position.y - entity.position.y))
    local drop_length = math.sqrt((entity.drop_position.x - entity.position.x) * (entity.drop_position.x - entity.position.x) + (entity.drop_position.y - entity.position.y) * (entity.drop_position.y - entity.position.y))
    local stack_size = entity.inserter_stack_size_override == 0 and (1 + prototype.inserter_stack_size_bonus + ((prototype.bulk and entity.force.bulk_inserter_capacity_bonus) or entity.force.inserter_stack_size_bonus)) or entity.inserter_stack_size_override
    local ticks_per_cycle = math.max((2 * math.ceil((((pickup_length > 0 and drop_length > 0) and math.acos(math.max(-1, math.min(1, (((entity.pickup_position.x - entity.position.x) * (entity.drop_position.x - entity.position.x) + (entity.pickup_position.y - entity.position.y) * (entity.drop_position.y - entity.position.y)) / (pickup_length * drop_length))))) or 0) / (math.pi * 2) - 0.001) / prototype.get_inserter_rotation_speed(entity.quality))), (2 * math.ceil(math.abs(pickup_length - drop_length) / prototype.get_inserter_extension_speed(entity.quality))), 2)
    local pickup_belt_speed = pickup_target and (pickup_target.type == 'entity-ghost' and pickup_target.ghost_prototype.belt_speed or pickup_target.prototype.belt_speed) or nil
    local drop_belt_speed = drop_target and (drop_target.type == 'entity-ghost' and drop_target.ghost_prototype.belt_speed or drop_target.prototype.belt_speed) or nil
    local belt_stack_size_bonus = entity.force.belt_stack_size_bonus or 1

    for _, belt_speed in ipairs({pickup_belt_speed, drop_belt_speed}) do
        if belt_speed and stack_size > 1 and stack_size > belt_stack_size_bonus then
            ticks_per_cycle = ticks_per_cycle + math.ceil(math.ceil((stack_size - belt_stack_size_bonus) / belt_stack_size_bonus) * 0.25 / belt_speed)
        end
    end

    return math.min(stack_size, drop_belt_speed and drop_belt_speed * ticks_per_cycle * 4 or math.huge, pickup_belt_speed and pickup_belt_speed * ticks_per_cycle * 8 or math.huge) * 60 / ticks_per_cycle
end

return main
