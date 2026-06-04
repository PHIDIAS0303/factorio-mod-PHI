
if not mods['space-age'] then
    error('Mod not found\nSpace Age is not enabled\n太空時代尚未啟用\nSpace Age が有効になっていません')
    return
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

-- GM-SAP C 16 SPACE_AGE ENTITY
if data.raw['asteroid'] then
    for _, asteroid in pairs(data.raw['asteroid']) do
        if asteroid.dying_trigger_effect then
            for _, trigger in pairs(asteroid.dying_trigger_effect) do
                if trigger.type == 'create-asteroid-chunk' then
                    trigger.probability = (trigger.probability or 1) / 4
                end
            end
        end

        for _, r in pairs(asteroid.resistances) do
            r.percent = (r.percent > 98 and 98) or r.percent
        end
    end
end

-- GM-SAP C 4 SPACE_AGE ENTITY
if data.raw['asteroid-chunk'] and data.raw.item then
    for _, chunk in pairs({'carbonic-asteroid-chunk', 'metallic-asteroid-chunk', 'promethium-asteroid-chunk', 'oxide-asteroid-chunk'}) do
        if data.raw['asteroid-chunk'][chunk] and data.raw['asteroid-chunk'][chunk].minable then
            data.raw['asteroid-chunk'][chunk].minable.count = (data.raw['asteroid-chunk'][chunk].minable.count or 1) * 4
        end

        if data.raw.item[chunk] then
            data.raw.item[chunk].stack_size = data.raw['inserter']['stack-inserter'].max_belt_stack_size
        end
    end
end

-- GM-SAP C 1 SPACE_AGE ENTITY
if data.raw['space-platform-hub'] and data.raw['space-platform-hub']['space-platform-hub'] then
    data.raw['space-platform-hub']['space-platform-hub'].platform_repair_speed_modifier = math.max(2, data.raw['space-platform-hub']['space-platform-hub'].platform_repair_speed_modifier)
    data.raw['space-platform-hub']['space-platform-hub'].inventory_size = math.max(119, data.raw['space-platform-hub']['space-platform-hub'].inventory_size)
end

-- GM-SAP C 1 SPACE_AGE TILE
if data.raw.tile['space-platform-foundation'] then
    data.raw.tile['space-platform-foundation'].max_health = data.raw.tile['space-platform-foundation'].max_health * 2
end

-- GM-SAP C 1 SPACE_AGE ITEM
if data.raw.item['space-platform-foundation'] then
    data.raw.item['space-platform-foundation'].stack_size = math.max(100, data.raw.item['space-platform-foundation'].stack_size)
end

-- GM-SAP A 1 BASE RESEARCH
data:extend({{
    type = 'technology',
    name = 'cargo-landing-pad',
    prerequisites = {'space-science-pack'},
    effects = {{type = 'cargo-landing-pad-count', modifier = 1}},
    unit = {count_formula = '1000 * L', ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}, time = 60},
    icons = {{icon = '__base__/graphics/technology/rocket-silo.png', icon_size = 256}, {icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png', icon_size = 128, scale = 0.5, shift = {50, 50}}},
    order = 'a-i-a',
    max_level = 'infinite',
    upgrade = true,
    localised_name = {'entity-name.cargo-landing-pad'}
}})
