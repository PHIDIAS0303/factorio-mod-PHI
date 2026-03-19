local param = require 'config'
local main = require 'main'
local items = require 'mbq-c'

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
    armor.icons = {{icon = armor.icon, tint = param['tint'][2], icon_size = armor.icon_size}}
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
        armor.icons = {{icon = armor.icon, tint = param['tint'][2], icon_size = armor.icon_size}}
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

for _, v in pairs(items) do
    v.mod = v.mod or 'base'
    v.min = v.min or 2

    if v.enabled and (v.mod and mods[v.mod]) and (v.max >= v.min) then
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
