local items = require 'config'
local main = require 'main'
local file_stage = 2

if mods['space-exploration'] and settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value and settings.startup['PHI-MB-MACHINE-TIER'].value > 1 then
    data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group = 'se-core-miner-drill'

    local se = {
        mod = 'space-exploration',
        type = 'mining-drill',
        name = 'se-core-miner-drill',
        ref_name = 'se-core-miner-drill',
        min = 2,
        max = 3
    }

    for i = 2, settings.startup['PHI-MB-MACHINE-TIER'].value do
        local miner_name = 'se-core-miner-drill-' .. i

        main.EEE(se, i)
        data.raw['mining-drill'][miner_name].minable.result = miner_name
        data.raw['mining-drill'][miner_name].placeable_by.item = miner_name

        local item = table.deepcopy(data.raw['item']['se-core-miner-drill'])
        item.name = 'se-core-miner-drill-' .. i
        item.place_result = miner_name
        item.order = 'zzzz-core-miner-drill-' .. i

        item.icons = {
            {
                icon = '__space-exploration-graphics__/graphics/icons/core-miner.png',
                tint = items['tint'][i],
                icon_size = 64,
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.localised_name = {'name.se-core-miner-drill'}
        item.localised_description = {'description.se-core-miner-drill'}
        data:extend({item})

        if i > 2 then
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{type = 'item', name = 'se-core-miner-drill-' .. (i - 1), amount = 1}, {type = 'item', name = 'se-core-miner-drill', amount = 1}},
                results = {{type = 'item', name = miner_name, amount = 1}},
                localised_name = {'name.se-core-miner-drill'},
                localised_description = {'description.se-core-miner-drill'}
            }})

        else
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{type = 'item', name = 'se-core-miner-drill', amount = 2}},
                results = {{type = 'item', name = miner_name, amount = 1}},
                localised_name = {'name.se-core-miner-drill'},
                localised_description = {'description.se-core-miner-drill'}
            }})
        end

        data.raw['mining-drill'][miner_name].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group
        table.insert(data.raw.technology['se-core-miner'].effects, {type='unlock-recipe', recipe=miner_name})
    end
end

for _, v in pairs(items['item']) do
    if (v.stage == file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'item'

        for j=v.min, v.max, 1 do
            main.EEE(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end

        main.EL(v)
    end
end

for _, v in pairs(items['equipment']) do
    if (v.stage == file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'equipment'

        for j=v.min, v.max, 1 do
            main.EEQ(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end
    end
end