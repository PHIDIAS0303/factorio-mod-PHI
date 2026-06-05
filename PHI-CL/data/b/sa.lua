
local function spoil_handle(i)
    i.spoil_ticks = nil
    i.spoil_result = nil
    i.spoil_to_trigger_result = nil
end

local function spoil_freeze_handle(i)
    local item = table.deepcopy(i)
    item.name = 'frozen-' .. i.name
    item.order = item.order .. '-f'
    item.icons = {{icon = item.icon, icon_size = 64, icon_mipmaps = 4}, {icon = data.raw['item']['ice'].icon, tint = {r = 1, g = 1, b = 1, a = 0.5}, icon_size = 64, icon_mipmaps = 4}}
    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.spoil_ticks = math.floor(i.spoil_ticks * settings.startup['PHI-SA-SPOIL-FREEZE-MULTIPLIER'].value / 10)
    item.spoil_result = i.name
    item.spoil_to_trigger_result = nil
    item.localised_name = {'item-name.' .. i.name}
    data:extend({item})

    data:extend({{
        type = 'recipe',
        name = item.name,
        energy_required = 2,
        enabled = false,
        category = 'cryogenics',
        ingredients = {{type = 'item', name = i.name, amount = 1}, {type = 'fluid', name = 'fluoroketone-cold', amount = 2, ignored_by_stats = 2}},
        results = {{type = 'item', name = item.name, amount = 1}, {type = 'fluid', name = 'fluoroketone-hot', amount = 2, ignored_by_stats=2, ignored_by_productivity = 2}},
        allow_productivity = false,
        main_product = item.name,
        localised_name = {'item-name.' .. i.name}
    }})

    data:extend({{
        type = 'recipe',
        name = 'unfreeze-' .. i.name,
        energy_required = 2,
        enabled = false,
        category = 'cryogenics',
        ingredients = {{type = 'item', name = item.name, amount = 1}},
        results = {{type = 'item', name = i.name, amount = 1}},
        allow_productivity = false,
        main_product = i.name,
        localised_name = {'item-name.' .. i.name}
    }})

    table.insert(data.raw.technology['cryogenic-plant'].effects, {type = 'unlock-recipe', recipe = item.name})
    table.insert(data.raw.technology['cryogenic-plant'].effects, {type = 'unlock-recipe', recipe = 'unfreeze-' .. i.name})
end

-- SA A 11 SPACE_AGE ITEM
-- SA A 22 SPACE_AGE RECIPE,RESEARCH_EFFECT
-- SA C 6 SPACE_AGE CAPSULE
-- SA C 4 SPACE_AGE ITEM
-- SA C 1 SPACE_AGE TOOL
do
    local spoil_set = (settings.startup['PHI-SA'].value and not settings.startup['PHI-SA-SPOIL'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '')
    local spoil_freeze_set = settings.startup['PHI-SA'].value and settings.startup['PHI-SA-SPOIL'].value and settings.startup['PHI-SA-SPOIL-FREEZE-MULTIPLIER'].value and settings.startup['PHI-SA-SPOIL-FREEZE-MULTIPLIER'].value > 0

    for _, v in pairs({'nutrients', 'captive-biter-spawner', 'biter-egg', 'pentapod-egg'}) do
        if spoil_set then
            spoil_handle(data.raw['item'][v])
        end

        if spoil_freeze_set then
            spoil_freeze_handle(data.raw['item'][v])
        end
    end

    for _, v in pairs({'raw-fish', 'yumako-mash', 'yumako', 'jelly', 'jellynut', 'bioflux'}) do
        if spoil_set then
            spoil_handle(data.raw['capsule'][v])
        end

        if spoil_freeze_set then
            spoil_freeze_handle(data.raw['capsule'][v])
        end
    end

    if spoil_set then
        spoil_handle(data.raw['tool']['agricultural-science-pack'])
    end

    if spoil_freeze_set then
        spoil_freeze_handle(data.raw['tool']['agricultural-science-pack'])
    end
end

-- SA A 1 SPACE_AGE RECIPE
-- SA A 1 SPACE_AGE RESEARCH_EFFECT
-- SA H 3 SPACE_AGE TIPS_AND_TRICKS
if (settings.startup['PHI-SA'].value and (not settings.startup['PHI-SA-SPOIL'].value)) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP') then
    data:extend({{
        type = 'recipe',
        name = 'spoilage-from-nutrients',
        category = 'organic-or-assembling',
        subgroup = 'agriculture-processes',
        order = 'c[nutrients]-z',
        energy_required = 2,
        enabled = (data.raw.technology['agriculture'] and false) or true,
        allow_productivity = true,
        ingredients = {{type = 'item', name = 'nutrients', amount = 1}},
        results = {{type = 'item', name = 'spoilage', amount = 8}},
        main_product = 'spoilage',
        localised_name = {'item-name.spoilage'}
    }})

    if data.raw.technology['agriculture'] and data.raw.technology['agriculture'].effects then
        table.insert(data.raw.technology['agriculture'].effects, {type = 'unlock-recipe', recipe = 'spoilage-from-nutrients'})
    end

    for _, v in pairs({'spoilables', 'spoilables-result', 'spoilables-research'}) do
        if data.raw['tips-and-tricks-item'][v] then
            data.raw['tips-and-tricks-item'][v].hidden = true
            data.raw['tips-and-tricks-item'][v].hidden_in_factoriopedia = true
        end
    end
end

-- SA C 3 SPACE_AGE MODULE,RECIPE,RESEARCH_EFFECT
-- SA C 5 SPACE_AGE QUALITY,RESEARCH
-- SA C 6 SPACE_AGE ACHIEVEMENT
-- SA H 5 SPACE_AGE QUALITY
-- SA H 4 SPACE_AGE TIPS_AND_TRICKS
if (settings.startup['PHI-SA'].value and (not settings.startup['PHI-SA-ENABLE-QUALITY'].value)) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value == 'VP') then
    for _, v in pairs({'quality-module', 'quality-module-2', 'quality-module-3'}) do
        if data.raw.technology[v] then
            data.raw.technology[v].hidden = true
            data.raw.technology[v].hidden_in_factoriopedia = true
            data.raw.technology[v].unit.ingredients = {{'space-science-pack', 1}}
            data.raw.technology[v].effects = nil
        end

        if data.raw.module[v] then
            data.raw.module[v].hidden = true
            data.raw.module[v].hidden_in_factoriopedia = true
        end

        if data.raw.recipe[v] then
            data.raw.recipe[v].hidden = true
            data.raw.recipe[v].hidden_in_factoriopedia = true
        end
    end

    for _, v in pairs({'epic-quality', 'legendary-quality'}) do
        if data.raw.technology[v] then
            data.raw.technology[v].hidden = true
            data.raw.technology[v].hidden_in_factoriopedia = true
            data.raw.technology[v].unit = {count = 1000, time = 30, ingredients = {{'automation-science-pack', 1}}}
            data.raw.technology[v].effects = nil
        end
    end

    for _, v in pairs({'normal', 'uncommon', 'rare', 'epic', 'legendary'}) do
        if data.raw.quality[v] then
            data.raw.quality[v].next = nil
            data.raw.quality[v].next_probability = nil
            data.raw.quality[v].hidden = true
            data.raw.quality[v].hidden_in_factoriopedia = true
        end
    end

    for _, v in pairs({{'produce-achievement', 'crafting-with-quality'}, {'module-transfer-achievement', 'make-it-better'}, {'produce-achievement', 'my-modules-are-legendary'}, {'equip-armor-achievement', 'look-at-my-shiny-rare-armor'}, {'use-item-achievement', 'todays-fish-is-trout-a-la-creme'}, {'place-equipment-achievement', 'no-room-for-more'}}) do
        if data.raw[v[1]] and data.raw[v[1]][v[2]] then
            data.raw[v[1]][v[2]].hidden = true
            data.raw[v[1]][v[2]].hidden_in_factoriopedia = true
        end
    end

    for _, v in pairs({'quality', 'quality-modules', 'quality-factoriopedia', 'quality-probabilities'}) do
        if data.raw['tips-and-tricks-item'][v] then
            data.raw['tips-and-tricks-item'][v].hidden = true
            data.raw['tips-and-tricks-item'][v].hidden_in_factoriopedia = true
        end
    end
end

if not settings.startup['PHI-SA'].value then
    return
end

-- SA C 3 SPACE_AGE MODULE
if settings.startup['PHI-SA-QUALITY'].value then
    for _, v in pairs(data.raw.module) do
        if v.category and v.category == 'quality' then
            v.effect.quality = v.effect.quality * settings.startup['PHI-SA-QUALITY'].value / 10

        elseif v.category and v.category == 'speed' and settings.startup['PHI-SA-QUALITY'].value ~= 10 then
            v.effect.quality = nil
        end
    end
end

-- SA C 1 SPACE_AGE CONSTANT
data.raw['utility-constants'].default.rocket_lift_weight = settings.startup['PHI-SA-ROCKET-CAPACITY'].value * 1000000
