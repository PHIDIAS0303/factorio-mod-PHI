
-- GM C 1 SPACE_AGE ENTITY
if data.raw['cargo-bay'] and data.raw['cargo-bay']['cargo-bay'] then
    data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus = math.max(40, data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus)
end

-- GM C 1 BASE ENTITY
if data.raw['rocket-silo'] and data.raw['rocket-silo']['rocket-silo'] then
    data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size = math.max(60, data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size)
end

-- GM C 1 BASE ENTITY
if data.raw['rocket-silo-rocket'] and data.raw['rocket-silo-rocket']['rocket-silo-rocket'] then
    data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size = math.max(60, data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size)
end

-- GM C 1 BASE ENTITY
if data.raw['cargo-wagon'] and data.raw['cargo-wagon']['cargo-wagon'] then
    data.raw['cargo-wagon']['cargo-wagon'].inventory_size = math.max(80, data.raw['cargo-wagon']['cargo-wagon'].inventory_size)
end

-- GM C 1 SPACE_AGE RECIPE
if data.raw.recipe['foundation'] then
    data.raw.recipe['foundation'].ingredients = {{type = 'item', name = 'landfill', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 10}, {type = 'item', name = 'steel-plate', amount = 10}}
    data.raw.recipe['foundation'].results = {{type = 'item', name = 'foundation', amount = 1}}
end

-- GM-SAP C 2 SPACE_AGE RESOURCE
for _, v in pairs({'lithium-brine', 'fluorine-vent'}) do
    if data.raw.resource[v] then
        data.raw.resource[v].infinite = true
        data.raw.resource[v].minimum = math.max(60000, data.raw.resource[v].minimum or 0)
        data.raw.resource[v].normal = math.max(300000, data.raw.resource[v].normal or 0)
        data.raw.resource[v].infinite_depletion_amount = math.min(10, data.raw.resource[v].infinite_depletion_amount or 999)
    end
end

-- GM C 1 BASE RECIPE
if data.raw.recipe['atomic-bomb'] then
    for _, v in pairs(data.raw.recipe['atomic-bomb'].ingredients) do
        if v.name == 'uranium-235' then
            v.amount = math.min(v.amount, 30)
        end
    end
end

-- GM C 1 BASE RECIPE
if data.raw.recipe['cliff-explosives'] then
    data.raw.recipe['cliff-explosives'].ingredients = {{type = 'item', name = 'explosives', amount = 10}, {type = 'item', name = 'grenade', amount = 1}, {type = 'item', name = 'barrel', amount = 1}}
end

-- GM C 1 BASE RECIPE
if data.raw.recipe['artillery-turret'] then
    data.raw.recipe['artillery-turret'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'concrete', amount = 60}, {type = 'item', name = 'iron-gear-wheel', amount = 40}, {type = 'item', name = 'advanced-circuit', amount = 20}}
end

-- GM C 1 BASE RECIPE
if data.raw.recipe['artillery-shell'] then
    data.raw.recipe['artillery-shell'].ingredients = {{type = 'item', name = 'explosive-cannon-shell', amount = 4}, {type = 'item', name = 'radar', amount = 1}, {type = 'item', name = 'explosives', amount = 8}}
end

-- GM C 1 BASE RECIPE
if data.raw.recipe['artillery-wagon'] then
    data.raw.recipe['artillery-wagon'].ingredients = {{type = 'item', name = 'engine-unit', amount = 64}, {type = 'item', name = 'iron-gear-wheel', amount = 10}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'pipe', amount = 16}, {type = 'item', name = 'advanced-circuit', amount = 20}}
end

-- GM C 1 BASE ITEM
if data.raw.ammo['artillery-shell'] then
    data.raw.ammo['artillery-shell'].stack_size = data.raw['inserter']['stack-inserter'].max_belt_stack_size
end

-- GM C 1 SPACE_AGE TECHNOLOGY
if data.raw.technology['foundation'] then
    data.raw.technology['foundation'].prerequisites = {'rail-support-foundations'}
    data.raw.technology['foundation'].unit.count = 1000
    data.raw.technology['foundation'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
end

-- GM C 1 SPACE_AGE TECHNOLOGY
if data.raw.technology['rail-support-foundations'] then
    data.raw.technology['rail-support-foundations'].prerequisites = {'elevated-rail', 'planet-discovery-fulgora'}
    data.raw.technology['rail-support-foundations'].unit.count = 600
    data.raw.technology['rail-support-foundations'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
end

-- GM C 1 ELEVATED_RAIL TECHNOLOGY
if data.raw.technology['elevated-rail'] then
    data.raw.technology['elevated-rail'].prerequisites = {'concrete', 'railway'}
    data.raw.technology['elevated-rail'].unit.count = 400
    data.raw.technology['elevated-rail'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}
end

-- GM C 1 BASE RESEARCH
if data.raw.technology['cliff-explosives'] then
    data.raw.technology['cliff-explosives'].prerequisites = {'explosives', 'military-2'}
    data.raw.technology['cliff-explosives'].unit = {count = 200, time = 15, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
    data.raw.technology['cliff-explosives'].effects = {{type = 'unlock-recipe', recipe = 'cliff-explosives'}, {type = 'cliff-deconstruction-enabled', modifier = true}}
end

-- GM A 9 BASE RESEARCH_EFFECT
for i=5, 7 do
    local tn = 'laser-weapons-damage-' .. i

    if data.raw.technology[tn] then
        table.insert(data.raw.technology[tn].effects, {type = 'ammo-damage', ammo_category = 'tesla', modifier = 0.7})
        table.insert(data.raw.technology[tn].effects, {type = 'ammo-damage', ammo_category = 'electric', modifier = 0.7})
        table.insert(data.raw.technology[tn].effects, {type = 'ammo-damage', ammo_category = 'beam', modifier = 0.6})
    end
end

-- GM A 13 BASE RESEARCH_EFFECT
for _, v in pairs({{'stronger-explosives-4', 'ammo-damage', 'artillery-shell', 0.1}, {'stronger-explosives-5', 'ammo-damage', 'artillery-shell', 0.1}, {'stronger-explosives-6', 'ammo-damage', 'artillery-shell', 0.2}, {'stronger-explosives-7', 'ammo-damage', 'artillery-shell', 0.2}, {'laser-weapons-damage-3', 'ammo-damage', 'beam', 0.3}, {'laser-weapons-damage-4', 'ammo-damage', 'beam', 0.4}, {'laser-shooting-speed-5', 'gun-speed', 'electric', 0.2}, {'laser-shooting-speed-6', 'gun-speed', 'electric', 0.3}, {'laser-shooting-speed-7', 'gun-speed', 'electric', 0.5}, {'physical-projectile-damage-6', 'ammo-damage', 'railgun', 0.2}, {'physical-projectile-damage-7', 'ammo-damage', 'railgun', 0.4}, {'weapon-shooting-speed-6', 'gun-speed', 'railgun', 0.2}, {'artillery-shell-speed-1', 'gun-speed', 'railgun', 0.2}}) do
    if data.raw.technology[v[1]] then
        table.insert(data.raw.technology[v[1]].effects, {type = v[2], ammo_category = v[3], modifier = v[4]})
    end
end

-- GM H 7 SPACE_AGE RESEARCH
for _, v in pairs({'artillery-shell-damage-1', 'railgun-damage-1', 'railgun-shooting-speed-1', 'electric-weapons-damage-1', 'electric-weapons-damage-2', 'electric-weapons-damage-3', 'electric-weapons-damage-4'}) do
    if data.raw.technology[v] then
        data.raw.technology[v].hidden = true
        data.raw.technology[v].hidden_in_factoriopedia = true
        data.raw.technology[v].effects = nil
    end
end

-- GM C 5 BASE RESOURCE
-- GM C 3 SPACE_AGE RESOURCE
for _, v in pairs(data.raw['resource']) do
    local vn = v.name

    if data.raw.item[vn] and data.raw.item[vn].stack_size then
        data.raw.item[vn].stack_size = math.max(data.raw.item[vn].stack_size, 100)
    end
end
