local items = require 'config'
local main = require 'main'
local file_stage = 2

if settings.startup['PHI-EN'].value and settings.startup['PHI-EN-NUCLEAR-TIER'].value > 1 then
    data.raw['fluid']['steam'].max_temperature = 5000
end

if settings.startup['PHI-XW-WATER'].value > 0 then
    data.raw['offshore-pump']['offshore-pump'].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
    data.raw['offshore-pump']['offshore-pump'].fluid_box.height = 4
    data.raw['offshore-pump']['offshore-pump'].fluid_box.level = 5
    data.raw['offshore-pump']['offshore-pump'].flags = {'placeable-neutral', 'player-creation'}
    data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
    data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
    data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_mask = nil
    data.raw['offshore-pump']['offshore-pump'].placeable_position_visualization = nil

    if mods['angelsrefining'] then
        data.raw['offshore-pump']['seafloor-pump'].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
        data.raw['offshore-pump']['seafloor-pump'].fluid_box.height = 4
        data.raw['offshore-pump']['offshore-pump'].fluid_box.level = 5
        data.raw['offshore-pump']['seafloor-pump'].flags = {'placeable-neutral', 'player-creation', 'filter-directions'}
        data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_box = {{-2, -3}, {2, -2}}
        data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
        data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_mask = nil
        data.raw['offshore-pump']['seafloor-pump'].placeable_position_visualization = nil
    end
end

if settings.startup['PHI-EQ-ARMOR'].value then
    data:extend({
        {
            type = 'equipment-grid',
            name = 'equipment-grid-14x14',
            width = 14,
            height = 14,
            equipment_categories = {'armor'}
        },
        {
            type = 'armor',
            name = 'power-armor-mk3',
            icon = '__base__/graphics/icons/power-armor-mk2.png',
            icon_size = 64, icon_mipmaps = 4,
            resistances = {{type = 'physical', decrease = 20, percent = 50}, {type = 'acid', decrease = 20, percent = 80},
            {type = 'explosion', decrease = 70, percent = 60}, {type = 'fire', decrease = 20, percent = 80},
            {type = 'laser', decrease = 20, percent = 50}, {type = 'electric', decrease = 20, percent = 50},
            {type = 'impact', decrease = 20, percent = 50}, {type = 'poison', decrease = 20, percent = 50}},
            subgroup = 'armor',
            order = 'eb[power-armor-mk3]',
            stack_size = 1,
            infinite = true,
            equipment_grid = 'equipment-grid-14x14',
            inventory_size_bonus = 40,
            open_sound = {filename =  '__base__/sound/armor-open.ogg', volume = 1},
            close_sound = {filename = '__base__/sound/armor-close.ogg', volume = 1}
        }
    })

    data:extend({{
        type = 'recipe',
        name = 'power-armor-mk3',
        energy_required = 5,
        enabled = 'false',
        ingredients = {{'power-armor-mk2', 2}},
        result = 'power-armor-mk3'
    }})

    for _, animation in ipairs(data.raw['character']['character']['animations']) do
        if animation.armors then
            for _, armor in ipairs(animation.armors) do
                if armor == 'power-armor-mk2' then
                    animation.armors[#animation.armors + 1] = 'power-armor-mk3'
                    break
                end
            end
        end
    end

    table.insert(data.raw.technology['power-armor-mk2'].effects, {type='unlock-recipe', recipe='power-armor-mk3'})
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
    item.order = item.order .. '2'
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

    table.insert(data.raw.technology[items['item']['electric-filter-furnace'].tech].effects, {type='unlock-recipe', recipe='electric-filter-furnace'})
    table.insert(data.raw.technology[items['item']['electric-filter-furnace'].tech].effects, {type='unlock-recipe', recipe='electric-furnace-return'})
    data.raw['furnace']['electric-furnace'].fast_replaceable_group = 'electric-furnace'
    data.raw['assembling-machine']['electric-filter-furnace'].fast_replaceable_group = data.raw['furnace']['electric-furnace'].fast_replaceable_group
    data.raw['assembling-machine']['electric-filter-furnace'].crafting_categories = data.raw['furnace']['electric-furnace'].crafting_categories

    if settings.startup['PHI-RS-RECIPE-DROF'].value == 1 then
        data.raw['utility-constants'].default.dynamic_recipe_overload_factor = 1.17

    else
        data.raw['utility-constants'].default.dynamic_recipe_overload_factor = settings.startup['PHI-RS-RECIPE-DROF'].value
    end

    data.raw['utility-constants'].default.minimum_recipe_overload_multiplier = settings.startup['PHI-RS-RECIPE-MINROM'].value
    data.raw['utility-constants'].default.maximum_recipe_overload_multiplier = settings.startup['PHI-RS-RECIPE-MAXROM'].value

    if settings.startup['PHI-RS-MODULE'].value then
        table.insert(items['recipe'], {
            name='speed-module',
            tech='speed-module'
        })
        table.insert(items['recipe'], {
            name='speed-module-2',
            tech='speed-module-2'
        })
        table.insert(items['recipe'], {
            name='speed-module-3',
            tech='speed-module-3'
        })
        table.insert(items['recipe'], {
            name='productivity-module',
            tech='productivity-module'
        })
        table.insert(items['recipe'], {
            name='productivity-module-2',
            tech='productivity-module-2'
        })
        table.insert(items['recipe'], {
            name='productivity-module-3',
            tech='productivity-module-3'
        })
        table.insert(items['recipe'], {
            name='effectivity-module',
            tech='effectivity-module'
        })
        table.insert(items['recipe'], {
            name='effectivity-module-2',
            tech='effectivity-module-2'
        })
        table.insert(items['recipe'], {
            name='effectivity-module-3',
            tech='effectivity-module-3'
        })
    end

    local recipe_multiplier = {}

    if settings.startup['PHI-RS-RECIPE-1'].value > 1 then
        table.insert(recipe_multiplier, settings.startup['PHI-RS-RECIPE-1'].value)
    end

    if settings.startup['PHI-RS-RECIPE-2'].value > 1 then
        if settings.startup['PHI-RS-RECIPE-1'].value ~= settings.startup['PHI-RS-RECIPE-2'].value then
            table.insert(recipe_multiplier, settings.startup['PHI-RS-RECIPE-2'].value)
        end
    end

    if #recipe_multiplier > 0 then
        for i=1, #items['recipe'], 1 do
            if data.raw.recipe[items['recipe'][i].name] then
                for j=1, #recipe_multiplier, 1 do
                    item = table.deepcopy(data.raw.recipe[items['recipe'][i].name])
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

                    item.name = items['recipe'][i].name .. '-s' .. j
                    item.hide_from_player_crafting = true

                    data:extend({item})
                    table.insert(data.raw.technology[items['recipe'][i].tech].effects, {type='unlock-recipe', recipe=item.name})
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
end

--[[
for k, _ in pairs(data.raw) do
    if data.raw[k] ~= nil then
        if data.raw[k].fluid_box ~= nil then
            if data.raw[k].fluid_box.height < 4 then
                data.raw[k].fluid_box.height = 4
            end
            if data.raw[k].fluid_box.base_level < 5 then
                data.raw[k].fluid_box.base_level = 5
            end
        end
        if data.raw[k].output_fluid_box ~= nil then
            if data.raw[k].output_fluid_box.height < 4 then
                data.raw[k].output_fluid_box.height = 4
            end
            if data.raw[k].output_fluid_box.base_level > -5 then
                data.raw[k].output_fluid_box.base_level = -5
            end
        end

        if data.raw[k].fluid_boxes ~= nil then
            for k1, _ in pairs(data.raw[k].fluid_boxes) do
                if data.raw[k].fluid_boxes[k1] ~= false and data.raw[k].fluid_boxes[k1] ~= true then
                    if data.raw[k].fluid_boxes[k1].production_type ~= nil then
                        data.raw[k].fluid_boxes[k1].height = 4

                        if data.raw[k].fluid_boxes[k1].base_level ~= nil then
                            data.raw[k].fluid_boxes[k1].base_level = data.raw[k].fluid_boxes[k1].base_level * 4
                        end
                    end
                end
            end
        end
    end
end
]]

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
