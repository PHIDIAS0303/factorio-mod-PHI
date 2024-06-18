

for i=1, #ups_chests, 1 do
    local item = table.deepcopy(data.raw['item'][ups_chests[i]])
    local entity

    if ups_chests[i] == 'steel-chest' then
        entity = table.deepcopy(data.raw['container'][ups_chests[i]])
    else
        entity = table.deepcopy(data.raw['logistic-container'][ups_chests[i]])
    end

    item.name = 'ups-' .. ups_chests[i]
    item.place_result = 'ups-' .. ups_chests[i]
    item.order = item.order .. '-ups'
    data:extend({item})

    entity.inventory_size = 1
    entity.name = 'ups-' .. ups_chests[i]
    entity.minable.result = 'ups-' .. ups_chests[i]
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'ups-' .. ups_chests[i],
        energy_required = 2,
        enabled = false,
        ingredients = {{'steel-plate', 8}},
        result = 'ups-' .. ups_chests[i],
    }})
end

table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='ups-steel-chest'})
table.insert(data.raw.technology['construction-robotics'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-passive-provider'})
table.insert(data.raw.technology['construction-robotics'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-storage'})
table.insert(data.raw.technology['logistic-robotics'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-passive-provider'})
table.insert(data.raw.technology['logistic-robotics'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-storage'})
table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-active-provider'})
table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-buffer'})
table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='ups-logistic-chest-requester'})
