local items = require('gm-c')

if settings.startup['PHI-GM'].value == '' then
    return
end

-- GM C 1 SPACE_AGE ENTITY
if data.raw['cargo-bay'] and data.raw['cargo-bay']['cargo-bay'] then
    data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus = math.max(40, data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus or 0)
end

-- GM C 1 SPACE_AGE ENTITY
if data.raw['cargo-bay'] and data.raw['cargo-bay']['landing-pad-unloading-bay'] then
    data.raw['cargo-bay']['landing-pad-unloading-bay'].inventory_size_bonus = math.max(40, data.raw['cargo-bay']['landing-pad-unloading-bay'].inventory_size_bonus or 0)
end

-- GM C 1 BASE ENTITY
if data.raw['rocket-silo'] and data.raw['rocket-silo']['rocket-silo'] then
    data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size = math.max(60, data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size or 0)
end

-- GM C 1 BASE ENTITY
if data.raw['rocket-silo-rocket'] and data.raw['rocket-silo-rocket']['rocket-silo-rocket'] then
    data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size = math.max(60, data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size or 0)
end

-- GM C 1 BASE ENTITY
if data.raw['cargo-wagon'] and data.raw['cargo-wagon']['cargo-wagon'] then
    data.raw['cargo-wagon']['cargo-wagon'].inventory_size = math.max(80, data.raw['cargo-wagon']['cargo-wagon'].inventory_size or 0)
end

-- GM C 18 BASE ENTITY
-- GM C 5 SPACE_AGE ENTITY
for _, w in pairs({'storage-tank', 'generator', 'furnace', 'roboport', 'assembling-machine', 'offshore-pump', 'pump', 'pipe', 'pipe-to-ground', 'infinity-pipe'}) do
    if data.raw[w] then
        for _, v in pairs(data.raw[w]) do
            v.heating_energy = nil
        end
    end
end

-- GM C 2 SPACE_AGE RESOURCE
for _, v in pairs({'lithium-brine', 'fluorine-vent'}) do
    if data.raw.resource[v] then
        data.raw.resource[v].infinite = true
        data.raw.resource[v].minimum = math.max(60000, data.raw.resource[v].minimum or 0)
        data.raw.resource[v].normal = math.max(300000, data.raw.resource[v].normal or 0)
        data.raw.resource[v].infinite_depletion_amount = math.min(10, data.raw.resource[v].infinite_depletion_amount or 999)
    end
end

-- GM C 2 BASE ENTITY
for _, v in pairs(data.raw['unit-spawner']) do
    v.spawn_blocked_trigger = nil
end

-- GM C 5 BASE RECIPE
-- GM C 1 SPACE_AGE RECIPE
if items['recipe_reform'] then
    for r, t in pairs(items['recipe_reform']) do
        if data.raw.recipe[r] then
            for k, v in pairs(t) do
                data.raw.recipe[r][k] = v
            end
        end
    end
end

-- GM C 1 BASE ITEM
if data.raw.ammo['artillery-shell'] then
    data.raw.ammo['artillery-shell'].stack_size = data.raw['inserter']['stack-inserter'].max_belt_stack_size
end

-- GM C 1 BASE RESEARCH
-- GM C 1 ELEVATED_RAIL RESEARCH
-- GM C 2 SPACE_AGE RESEARCH
if items['technology_reform'] then
    for t, l in pairs(items['technology_reform']) do
        if data.raw.technology[t] then
            for _, c in pairs({'prerequisites', 'effects', 'max_level', 'unit'}) do
                if l[c] then
                    data.raw.technology[t][c] = l[c]
                end
            end

            if data.raw.technology[t]['unit'] then
                data.raw.technology[t].research_trigger = nil

                for _, c in pairs({'ingredients', 'count', 'count_formula'}) do
                    if l['unit_' .. c] then
                        data.raw.technology[t]['unit'][c] = l['unit_' .. c]
                    end
                end
            end
        end
    end
end

-- GM H 7 SPACE_AGE RESEARCH
if items['technology'] then
    for t, _ in pairs(items['technology']) do
        if data.raw.technology[t] then
            data.raw.technology[t].hidden = true
            data.raw.technology[t].hidden_in_factoriopedia = true
            data.raw.technology[t].effects = nil
            data.raw.technology[t].research_trigger = nil
            data.raw.technology[t].unit = {count = 1000, time = 30, ingredients = {{'automation-science-pack', 1}}}
        end
    end
end

-- GM A 9 BASE RESEARCH_EFFECT
for i=5, 7 do
    local tn = 'laser-weapons-damage-' .. i

    if data.raw.technology[tn] and data.raw.technology[tn].effects then
        table.insert(data.raw.technology[tn].effects, {type = 'ammo-damage', ammo_category = 'tesla', modifier = 0.7})
        table.insert(data.raw.technology[tn].effects, {type = 'ammo-damage', ammo_category = 'electric', modifier = 0.7})
        table.insert(data.raw.technology[tn].effects, {type = 'ammo-damage', ammo_category = 'beam', modifier = 0.6})
    end
end

-- GM A 13 BASE RESEARCH_EFFECT
for _, v in pairs({{'stronger-explosives-4', 'ammo-damage', 'artillery-shell', 0.1}, {'stronger-explosives-5', 'ammo-damage', 'artillery-shell', 0.1}, {'stronger-explosives-6', 'ammo-damage', 'artillery-shell', 0.2}, {'stronger-explosives-7', 'ammo-damage', 'artillery-shell', 0.2}, {'laser-weapons-damage-3', 'ammo-damage', 'beam', 0.3}, {'laser-weapons-damage-4', 'ammo-damage', 'beam', 0.4}, {'laser-shooting-speed-5', 'gun-speed', 'electric', 0.2}, {'laser-shooting-speed-6', 'gun-speed', 'electric', 0.3}, {'laser-shooting-speed-7', 'gun-speed', 'electric', 0.5}, {'physical-projectile-damage-6', 'ammo-damage', 'railgun', 0.2}, {'physical-projectile-damage-7', 'ammo-damage', 'railgun', 0.4}, {'weapon-shooting-speed-6', 'gun-speed', 'railgun', 0.2}, {'artillery-shell-speed-1', 'gun-speed', 'railgun', 0.2}}) do
    if data.raw.technology[v[1]] and data.raw.technology[v[1]].effects then
        table.insert(data.raw.technology[v[1]].effects, {type = v[2], ammo_category = v[3], modifier = v[4]})
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
