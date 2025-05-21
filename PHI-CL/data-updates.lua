local items = require 'config'
local main = require 'main'
local file_stage = 2

if settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value and settings.startup['PHI-MB-MACHINE-TIER'].value > 1 then
    for i = 4, settings.startup['PHI-MB-MACHINE-TIER'].value + 2 do
        data.raw['assembling-machine']['assembling-machine-' .. i].localised_name = {'phi-cl.combine', {'?', {'entity-name.assembling-machine'}, {'name.assembling-machine'}}, tostring(i)}
    end
end

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
        data.raw['mining-drill'][miner_name].localised_name = {'phi-cl.combine', {'entity-name.se-core-miner-drill'}, tostring(i)}
        data.raw['mining-drill'][miner_name].localised_description = {'entity-description.se-core-miner-drill'}

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
        item.localised_name = {'phi-cl.combine', {'entity-name.se-core-miner-drill'}, tostring(i)}
        item.localised_description = {'entity-description.se-core-miner-drill'}
        data:extend({item})

        data:extend({{
            type = 'recipe',
            name = miner_name,
            energy_required = 2,
            enabled = false,
            ingredients =  (i > 2 and {{type = 'item', name = 'se-core-miner-drill-' .. (i - 1), amount = 1}, {type = 'item', name = 'se-core-miner-drill', amount = 1}}) or {{type = 'item', name = 'se-core-miner-drill', amount = 2}},
            results = {{type = 'item', name = miner_name, amount = 1}},
            localised_name = {'phi-cl.combine', {'entity-name.se-core-miner-drill'}, tostring(i)},
            localised_description = {'entity-description.se-core-miner-drill'}
        }})


        data.raw['mining-drill'][miner_name].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group
        table.insert(data.raw.technology['se-core-miner'].effects, {type='unlock-recipe', recipe=miner_name})
    end

    for i = 3, settings.startup['PHI-MB-MACHINE-TIER'].value + 1 do
        data.raw['assembling-machine']['se-space-radiator-' .. i].localised_name = {'phi-cl.combine', {'entity-name.se-space-radiator'}, tostring(i)}
    end
end

if settings.startup['PHI-MB-EQUIPMENT'].value and settings.startup['PHI-MB-EQUIPMENT-SIZE'].value then
    for _, e in pairs({'night-vision-equipment','energy-shield-equipment', 'battery-equipment', 'solar-panel-equipment', 'generator-equipment','active-defense-equipment', 'movement-bonus-equipment', 'roboport-equipment', 'belt-immunity-equipment', 'inventory-bonus-equipment'}) do
        if data.raw[e] then
            for _, v in pairs(data.raw[e]) do
                v.shape = {width = 1, height = 1, type = 'full', points = {{0, 0}}}
            end
        end
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
