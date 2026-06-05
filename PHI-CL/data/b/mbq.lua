local main = require('main')
local items = require('mbq-c')

local mod_tint = {
    [2] = {r=140, g=142, b=200},
    [3] = {r=242, g=161, b=26},
    [4] = {r=255, g=254, b=42},
    [5] = {r=54, g=228, b=255},
    [6] = {r=253, g=0, b=97},
    [7] = {r=0, g=209, b=102},
    [8] = {r=233, g=63, b=233}
}

if settings.startup['PHI-MB-EQUIPMENT-ARMOR'].value then
    -- MBQ A 1 ARMOR_GRID
    local grid = table.deepcopy(data.raw['equipment-grid']['large-equipment-grid'])
    grid.name = 'equipment-grid-14x14'
    grid.width = 14
    grid.height = 14
    data:extend({grid})

    -- MBQ A 1 ARMOR
    local armor = table.deepcopy(data.raw['armor']['power-armor-mk2'])
    armor.name = 'power-armor-mk3'
    armor.icons = {{icon = armor.icon, tint = mod_tint[2], icon_size = armor.icon_size}}
    armor.icon = nil
    armor.icon_size = nil

    for _, v in pairs(armor.resistances) do
        v.decrease = v.decrease + 10
        v.percent = ((v.percent < 90) and v.percent + 10) or v.percent
    end

    armor.order = armor.order .. '-2'
    armor.equipment_grid = 'equipment-grid-14x14'
    armor.inventory_size_bonus = armor.inventory_size_bonus + 10
    armor.localised_name = {'phi-cl.combine-gen', {'item-name.power-armor-mk2'}, '3'}
    data:extend({armor})

    -- MBQ A 1 RECIPE
    data:extend({{
        type = 'recipe',
        name = armor.name,
        energy_required = 2,
        enabled = false,
        ingredients = {{type = 'item', name = 'power-armor-mk2', amount = 2}},
        results = {{type = 'item', name = armor.name, amount = 1}},
        main_product = armor.name,
        localised_name = {'phi-cl.combine-gen', {'item-name.power-armor-mk2'}, '3'}
    }})

    -- MBQ A 1 RESEARCH_EFFECT
    table.insert(data.raw.technology['power-armor-mk2'].effects, {type = 'unlock-recipe', recipe = armor.name})

    if mods['space-age'] then
        -- MBQ A 1 ARMOR_GRID
        grid = table.deepcopy(data.raw['equipment-grid']['large-equipment-grid'])
        grid.name = 'equipment-grid-15x16'
        grid.width = 15
        grid.height = 16
        data:extend({grid})

        -- MBQ A 1 ARMOR
        armor = table.deepcopy(data.raw['armor']['mech-armor'])
        armor.name = 'mech-armor-mk2'
        armor.icons = {{icon = armor.icon, tint = mod_tint[2], icon_size = armor.icon_size}}
        armor.icon = nil
        armor.icon_size = nil

        for _, v in pairs(armor.resistances) do
            v.decrease = v.decrease + 10
            v.percent = ((v.percent < 90) and v.percent + 10) or v.percent
        end

        armor.order = armor.order .. '-2'
        armor.equipment_grid = 'equipment-grid-15x16'
        armor.inventory_size_bonus = armor.inventory_size_bonus + 10
        armor.localised_name = {'phi-cl.combine-gen', {'item-name.mech-armor'}, '2'}
        data:extend({armor})

        -- MBQ A 1 RECIPE
        data:extend({{
            type = 'recipe',
            name = armor.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type = 'item', name = 'mech-armor', amount = 2}},
            results = {{type = 'item', name = armor.name, amount = 1}},
            main_product = armor.name,
            localised_name = {'phi-cl.combine-gen', {'item-name.mech-armor'}, '2'}
        }})

        -- MBQ A 1 RESEARCH_EFFECT
        table.insert(data.raw.technology['mech-armor'].effects, {type = 'unlock-recipe', recipe = armor.name})
    end

    for _, an in ipairs(data.raw['character']['character']['animations']) do
        if an.armors then
            for _, ar in ipairs(an.armors) do
                if ar == 'power-armor-mk2' then
                    table.insert(an.armors, 'power-armor-mk3')

                elseif ar == 'mech-armor' then
                    table.insert(an.armors, 'mech-armor-mk2')
                end
            end
        end
    end
end

-- MBQ A 48 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
-- MBQ A 8 SPACE_AGE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
for _, v in pairs(items) do
    v.mod = v.mod or 'base'
    v.min = v.min or 2

    if (v.mod and mods[v.mod]) and (v.max >= v.min) then
        v.category = 'equipment'
        v.ref_name = v.ref_name or v.name .. '-equipment'

        for j=v.min, v.max, 1 do
            main.EEQ(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end
    end
end

-- MBQ C 11 BASE ARMOR_EQUIPMENT
if settings.startup['PHI-MB-EQUIPMENT-SIZE'].value then
    for _, e in pairs({'night-vision-equipment', 'energy-shield-equipment', 'battery-equipment', 'solar-panel-equipment', 'generator-equipment','active-defense-equipment', 'movement-bonus-equipment', 'roboport-equipment', 'belt-immunity-equipment', 'inventory-bonus-equipment'}) do
        if data.raw[e] then
            for _, v in pairs(data.raw[e]) do
                v.shape = {width = 1, height = 1, type = 'full', points = {{0, 0}}}
            end
        end
    end
end

if data.raw['battery-equipment'] and data.raw['battery-equipment']['battery-equipment'] and settings.startup['PHI-MB-EQUIPMENT'].value > 1 then
    for i = 4, settings.startup['PHI-MB-EQUIPMENT'].value + 2 do
        if data.raw['battery-equipment']['battery-equipment-mk' .. i .. '-equipment'] then
            data.raw['battery-equipment']['battery-equipment-mk' .. i .. '-equipment'].localised_name = {'phi-cl.combine', {'?', {'equipment-name.battery-equipment'}, {'name.battery-equipment'}}, tostring(i)}
            data.raw['item']['battery-equipment-mk' .. i .. '-equipment'].localised_name = {'phi-cl.combine', {'?', {'equipment-name.battery-equipment'}, {'name.battery-equipment'}}, tostring(i)}
        end
    end
end

if data.raw['energy-shield-equipment'] and data.raw['energy-shield-equipment']['energy-shield-equipment'] and settings.startup['PHI-MB-EQUIPMENT'].value > 1 then
    for i = 3, settings.startup['PHI-MB-EQUIPMENT'].value + 1 do
        if data.raw['energy-shield-equipment']['energy-shield-mk' .. i .. '-equipment'] then
            data.raw['energy-shield-equipment']['energy-shield-mk' .. i .. '-equipment'].localised_name = {'phi-cl.combine', {'?', {'equipment-name.energy-shield'}, {'name.energy-shield'}}, tostring(i)}
            data.raw['item']['energy-shield-mk' .. i .. '-equipment'].localised_name = {'phi-cl.combine', {'?', {'equipment-name.energy-shield'}, {'name.energy-shield'}}, tostring(i)}
        end
    end
end

if data.raw['personal-roboport-equipment'] and data.raw['personal-roboport-equipment']['personal-roboport-equipment'] and settings.startup['PHI-MB-EQUIPMENT'].value > 1 then
    for i = 3, settings.startup['PHI-MB-EQUIPMENT'].value + 1 do
        if data.raw['personal-roboport-equipment']['personal-roboport-mk' .. i .. '-equipment'] then
            data.raw['personal-roboport-equipment']['personal-roboport-mk' .. i .. '-equipment'].localised_name = {'phi-cl.combine', {'?', {'equipment-name.personal-roboport'}, {'name.personal-roboport'}}, tostring(i)}
            data.raw['item']['personal-roboport-mk' .. i .. '-equipment'].localised_name = {'phi-cl.combine', {'?', {'equipment-name.personal-roboport'}, {'name.personal-roboport'}}, tostring(i)}
        end
    end
end
