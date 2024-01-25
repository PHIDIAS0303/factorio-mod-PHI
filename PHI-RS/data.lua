local recipe_multiplier = {settings.startup['PHI-RS-RECIPE-1'].value, settings.startup['PHI-RS-RECIPE-2'].value}
local items = require 'config'

if recipe_multiplier[1] == 1 then
    recipe_multiplier[1] = nil
end

data.raw['utility-constants'].default.dynamic_recipe_overload_factor = settings.startup['PHI-RS-RECIPE-DROF'].value

if settings.startup['PHI-RS-MODULE'].value == true then
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

for i=1, #items, 1 do
    if data.raw.recipe[items[i].name] ~= nil then
        for j=1, #recipe_multiplier, 1 do
            local item = table.deepcopy(data.raw.recipe[items[i].name])
            item.enabled = false

            if (item.normal ~= nil) and (item.normal ~= false) then
                for k, v in pairs(item.normal.ingredients) do
                    if (v[1] ~= nil) and (v[2] ~= nil) then
                        item.normal.ingredients[k][2] = v[2] * recipe_multiplier[j]
                    else
                        item.normal.ingredients[k].amount = v.amount * recipe_multiplier[j]
                    end
                end

                if item.normal.results ~= nil then
                    for k, v in pairs(item.normal.results) do
                        if (v[1] ~= nil) and (v[2] ~= nil) then
                            item.normal.results[k][2] = v[2] * recipe_multiplier[j]
                        else
                            item.normal.results[k].amount = v.amount * recipe_multiplier[j]        
                        end
                    end

                else
                    if item.normal.result_count ~= nil then
                        item.normal.result_count = item.normal.result_count * recipe_multiplier[j]
                    else
                        item.normal.result_count = recipe_multiplier[j]
                    end
                end

                if item.normal.energy_required ~= nil then
                    item.normal.energy_required = item.normal.energy_required * recipe_multiplier[j]
                else
                    item.normal.energy_required = recipe_multiplier[j] / 2
                end

            elseif (item.expensive) ~= nil and (item.expensive ~= false) then
                for k, v in pairs(item.expensive.ingredients) do
                    if (v[1] ~= nil) and (v[2] ~= nil) then
                        item.expensive.ingredients[k][2] = v[2] * recipe_multiplier[j]
                    else
                        item.expensive.ingredients[k].amount = v.amount * recipe_multiplier[j]
                    end
                end

                if item.expensive.results ~= nil then
                    for k, v in pairs(item.expensive.results) do
                        if (v[1] ~= nil) and (v[2] ~= nil) then
                            item.expensive.results[k][2] = v[2] * recipe_multiplier[j]
                        else
                            item.expensive.results[k].amount = v.amount * recipe_multiplier[j]  
                        end
                    end

                else
                    if item.expensive.result_count ~= nil then
                        item.expensive.result_count = item.expensive.result_count * recipe_multiplier[j]
                    else
                        item.expensive.result_count = recipe_multiplier[j]
                    end
                end

                if item.expensive.energy_required ~= nil then
                    item.expensive.energy_required = item.expensive.energy_required * recipe_multiplier[j]
                else
                    item.expensive.energy_required = recipe_multiplier[j] / 2
                end

            else
                for k, v in pairs(item.ingredients) do
                    if (v[1] ~= nil) and (v[2] ~= nil) then
                        item.ingredients[k][2] = v[2] * recipe_multiplier[j]
                    else
                        item.ingredients[k].amount = v.amount * recipe_multiplier[j]
                    end
                end

                if item.results ~= nil then
                    for k, v in pairs(item.results) do
                        if (v[1] ~= nil) and (v[2] ~= nil) then
                            item.results[k][2] = v[2] * recipe_multiplier[j]
                        else
                            item.results[k].amount = v.amount * recipe_multiplier[j]        
                        end
                    end

                else
                    if item.result_count ~= nil then
                        item.result_count = item.result_count * recipe_multiplier[j]
                    else
                        item.result_count = recipe_multiplier[j]
                    end
                end

                if item.energy_required ~= nil then
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

local module_limitation = table.deepcopy(data.raw.module['productivity-module']['limitation'])

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

items = {
    ['electric-filter-furnace'] = {
        enabled = true,
        type = 'furnace',
        new_type = 'assembling-machine',
        name = 'electric-filter-furnace',
        ref_name = 'electric-furnace',
        tech = 'advanced-material-processing-2'
    }
}

-- entity
local function EE(source)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])

    item.name = source.name
    item.minable.result = source.name

    -- item.animation.layers[1].filename = graphics_location .. source .. '-e.png'
    -- item.animation.layers[1].hr_version.filename = graphics_location .. source ..'-eh.png'
    -- item.icon = graphics_location .. source .. '-i.png'
    -- item.icon_size = 64
    -- item.icon_mipmaps = 4

    if (source.new_type ~= nil) then
        item.type = source.new_type
    end

    data:extend({item})
end

-- item
local function EI(source)
    local item = table.deepcopy(data.raw.item[source.ref_name])

    item.name = source.name
    item.place_result = source.name
    -- item.icons = {{icon = graphics_location .. source .. '-i.png', icon_mipmaps = 4, icon_size = 64}}
    item.order = item.order .. 'B'
    data:extend({item})
end

-- recipe
local function ER(source)
    data:extend({{
        type = 'recipe',
        name = source.name,
        energy_required = 2,
        enabled = false,
        ingredients = {{'steel-plate', 10}, {'advanced-circuit', 5}, {'stone-brick', 10}},
        result = source.name,
    }})
end

-- tech
local function ET(source)
    table.insert(data.raw.technology[source.tech].effects, {type='unlock-recipe', recipe=source.name})
end

for _, v in pairs(items) do
    if v.enabled then
        EE(v)
        EI(v)
        ER(v)
        ET(v)
    end
end
