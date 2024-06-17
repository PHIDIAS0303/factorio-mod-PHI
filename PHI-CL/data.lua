local items = require 'config'
local main = require 'main'
local file_stage = 1

for k, v in pairs(items['setting']) do
    for k2=1, #v.effect do
        if items[v.effect[k2]] ~= nil then
            if settings.startup[k].value < items[v.effect[k2]].min then
                items[v.effect[k2]].enabled = false
            end

            items[v.effect[k2]][v.type] = settings.startup[k].value
        end
    end
end

for _, v in pairs(items['item']) do
    if v.enabled then
        if v.stage == file_stage then
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
end

for _, v in pairs(items['equipment']) do
    if v.enabled then
        if v.stage == file_stage then
            v.category = 'equipment'

            for j=v.min, v.max, 1 do
                main.EEQ(v, j)
                main.EI(v, j)
                main.ER(v, j)
                main.ET(v, j)
            end
        end
    end
end

if settings.startup['PHI-RS-RECIPE-DROF'].value == 1 then
    data.raw['utility-constants'].default.dynamic_recipe_overload_factor = 1.17

else
    data.raw['utility-constants'].default.dynamic_recipe_overload_factor = settings.startup['PHI-RS-RECIPE-DROF'].value
end

data.raw['utility-constants'].default.minimum_recipe_overload_multiplier = settings.startup['PHI-RS-RECIPE-MINROM'].value
data.raw['utility-constants'].default.maximum_recipe_overload_multiplier = settings.startup['PHI-RS-RECIPE-MAXROM'].value


if settings.startup['PHI-RS-MODULE'].value then
    table.insert(items, {
        name='speed-module',
        tech='speed-module'
    })
    table.insert(items, {
        name='speed-module-2',
        tech='speed-module-2'
    })
    table.insert(items, {
        name='speed-module-3',
        tech='speed-module-3'
    })
    table.insert(items, {
        name='productivity-module',
        tech='productivity-module'
    })
    table.insert(items, {
        name='productivity-module-2',
        tech='productivity-module-2'
    })
    table.insert(items, {
        name='productivity-module-3',
        tech='productivity-module-3'
    })
    table.insert(items, {
        name='effectivity-module',
        tech='effectivity-module'
    })
    table.insert(items, {
        name='effectivity-module-2',
        tech='effectivity-module-2'
    })
    table.insert(items, {
        name='effectivity-module-3',
        tech='effectivity-module-3'
    })
end

local recipe_multiplier = {settings.startup['PHI-RS-RECIPE-1'].value, settings.startup['PHI-RS-RECIPE-2'].value}

for j=1, 2, 1 do
    if recipe_multiplier[j] ~= 1 then
        for i=1, #items, 1 do
            if data.raw.recipe[items[i].name] then
                local item = table.deepcopy(data.raw.recipe[items[i].name])
                item.enabled = false

                if item.normal and item.normal then
                    for k, v in pairs(item.normal.ingredients) do
                        if v[1] and v[2] then
                            item.normal.ingredients[k][2] = v[2] * recipe_multiplier[j]

                        else
                            item.normal.ingredients[k].amount = v.amount * recipe_multiplier[j]
                        end
                    end

                    if item.normal.results then
                        for k, v in pairs(item.normal.results) do
                            if v[1] and v[2] then
                                item.normal.results[k][2] = v[2] * recipe_multiplier[j]

                            else
                                item.normal.results[k].amount = v.amount * recipe_multiplier[j]
                            end
                        end

                    else
                        if item.normal.result_count then
                            item.normal.result_count = item.normal.result_count * recipe_multiplier[j]

                        else
                            item.normal.result_count = recipe_multiplier[j]
                        end
                    end

                    if item.normal.energy_required then
                        item.normal.energy_required = item.normal.energy_required * recipe_multiplier[j]

                    else
                        item.normal.energy_required = recipe_multiplier[j] / 2
                    end

                elseif item.expensive and item.expensive then
                    for k, v in pairs(item.expensive.ingredients) do
                        if v[1] and v[2] then
                            item.expensive.ingredients[k][2] = v[2] * recipe_multiplier[j]

                        else
                            item.expensive.ingredients[k].amount = v.amount * recipe_multiplier[j]
                        end
                    end

                    if item.expensive.results then
                        for k, v in pairs(item.expensive.results) do
                            if v[1] and v[2] then
                                item.expensive.results[k][2] = v[2] * recipe_multiplier[j]

                            else
                                item.expensive.results[k].amount = v.amount * recipe_multiplier[j]
                            end
                        end

                    else
                        if item.expensive.result_count then
                            item.expensive.result_count = item.expensive.result_count * recipe_multiplier[j]

                        else
                            item.expensive.result_count = recipe_multiplier[j]
                        end
                    end

                    if item.expensive.energy_required then
                        item.expensive.energy_required = item.expensive.energy_required * recipe_multiplier[j]

                    else
                        item.expensive.energy_required = recipe_multiplier[j] / 2
                    end

                else
                    for k, v in pairs(item.ingredients) do
                        if v[1] and v[2] then
                            item.ingredients[k][2] = v[2] * recipe_multiplier[j]

                        else
                            item.ingredients[k].amount = v.amount * recipe_multiplier[j]
                        end
                    end

                    if item.results then
                        for k, v in pairs(item.results) do
                            if v[1] and v[2] then
                                item.results[k][2] = v[2] * recipe_multiplier[j]

                            else
                                item.results[k].amount = v.amount * recipe_multiplier[j]
                            end
                        end

                    else
                        if item.result_count then
                            item.result_count = item.result_count * recipe_multiplier[j]

                        else
                            item.result_count = recipe_multiplier[j]
                        end
                    end

                    if item.energy_required then
                        item.energy_required = item.energy_required * recipe_multiplier[j]

                    else
                        item.energy_required = recipe_multiplier[j] / 2
                    end
                end

                item.name = item.name .. '-s' .. j

                data:extend({item})
                table.insert(data.raw.technology[items[i].tech].effects, {type='unlock-recipe', recipe=item.name})
            end
        end
    end
end

local module_limitation = table.deepcopy(data.raw.module['productivity-module']['limitation'])

if module_limitation then
    for _, v in pairs(data.raw.module) do
        if v.limitation and string.find(v.name, 'productivity', 1, true) then
            for j=1, #recipe_multiplier, 1 do
                for k, _ in pairs(module_limitation) do
                    if data.raw.recipe[module_limitation[k] .. '-s' .. j] ~= nil then
                        table.insert(v.limitation, module_limitation[k] .. '-s' .. j)
                    end
                end
            end
        end
    end
end

if settings.startup['PHI-RS'].value then
    local item = table.deepcopy(data.raw['furnace']['electric-furnace'])
    item.name = 'electric-filter-furnace'
    item.minable.result = 'electric-filter-furnace'
    item.type = 'assembling-machine'
    data:extend({item})

    item = table.deepcopy(data.raw.item['electric-furnace'])
    item.name = 'electric-filter-furnace'
    item.place_result = 'electric-filter-furnace'
    item.order = item.order .. 'B'
    data:extend({item})

    data:extend({{
        type = 'recipe',
        name = 'electric-filter-furnace',
        energy_required = 2,
        enabled = false,
        ingredients = {{'electric-furnace', 1}},
        result = 'electric-filter-furnace',
    }})

    data:extend({{
        type = 'recipe',
        name = 'electric-furnace-return',
        energy_required = 2,
        enabled = false,
        ingredients = {{'electric-filter-furnace', 1}},
        result = 'electric-furnace',
    }})

    table.insert(data.raw.technology[items['item']['electric-filter-furnace'].tech].effects, {type='unlock-recipe', recipe='electric-furnace'})
    table.insert(data.raw.technology[items['item']['electric-filter-furnace'].tech].effects, {type='unlock-recipe', recipe='electric-furnace-return'})
end
