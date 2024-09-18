local items = require 'config'
local main = require 'main'
local file_stage = 2

if settings.startup['PHI-EN'].value and settings.startup['PHI-EN-NUCLEAR-TIER'].value > 1 then
    data.raw['fluid']['steam'].max_temperature = 5000
end

if settings.startup['PHI-XW-WATER'].value > 0 then
    if mods['angelsrefining'] then
        data.raw['offshore-pump']['seafloor-pump'].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
        data.raw['offshore-pump']['seafloor-pump'].fluid_box.height = 4
        data.raw['offshore-pump']['seafloor-pump'].fluid_box.level = 5
        data.raw['offshore-pump']['seafloor-pump'].flags = {'placeable-neutral', 'player-creation', 'filter-directions'}
        data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_box = {{-2, -3}, {2, -2}}
        data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
        data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_mask = nil
        data.raw['offshore-pump']['seafloor-pump'].placeable_position_visualization = nil
    end

    if mods['exotic-industries'] then
        data.raw['offshore-pump']['ei_gaia-pump'].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
        data.raw['offshore-pump']['ei_gaia-pump'].fluid_box.height = 4
        data.raw['offshore-pump']['ei_gaia-pump'].fluid_box.level = 5
        data.raw['offshore-pump']['ei_gaia-pump'].flags = {'placeable-neutral', 'player-creation'}
        data.raw['offshore-pump']['ei_gaia-pump'].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
        data.raw['offshore-pump']['ei_gaia-pump'].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
        data.raw['offshore-pump']['ei_gaia-pump'].adjacent_tile_collision_mask = nil
        data.raw['offshore-pump']['ei_gaia-pump'].placeable_position_visualization = nil
    end
end

if settings.startup['PHI-EQ'].value and settings.startup['PHI-EQ-ARMOR'].value then
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
            resistances = {
                {
                    type = 'physical',
                    decrease = 20,
                    percent = 50
                },
                {
                    type = 'acid',
                    decrease = 20,
                    percent = 80
                },
                {
                    type = 'explosion',
                    decrease = 70,
                    percent = 60
                },
                {
                    type = 'fire',
                    decrease = 20,
                    percent = 80
                },
                {
                    type = 'laser',
                    decrease = 20,
                    percent = 50
                },
                {
                    type = 'electric',
                    decrease = 20,
                    percent = 50
                },
                {
                    type = 'impact',
                    decrease = 20,
                    percent = 50
                },
                {
                    type = 'poison',
                    decrease = 20,
                    percent = 50
                }
            },
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
        energy_required = 2,
        enabled = false,
        ingredients = {{name='power-armor-mk2', amount=2}},
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
        ingredients = {{name='electric-furnace', amount=1}},
        result = 'electric-filter-furnace',
    }})

    table.insert(data.raw.technology[items['item']['electric-filter-furnace'].tech].effects, {type='unlock-recipe', recipe='electric-filter-furnace'})
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
        items['recipe']['speed-module'].enabled = true
        items['recipe']['speed-module-2'].enabled = true
        items['recipe']['speed-module-3'].enabled = true
        items['recipe']['productivity-module'].enabled = true
        items['recipe']['productivity-module-2'].enabled = true
        items['recipe']['productivity-module-3'].enabled = true
        items['recipe']['effectivity-module'].enabled = true
        items['recipe']['effectivity-module-2'].enabled = true
        items['recipe']['effectivity-module-3'].enabled = true
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
        local prod_module_list = {}

        for k, v in pairs(data.raw.module) do
            if v.limitation and string.find(v.name, 'productivity', 1, true) then
                table.insert(prod_module_list, k)
            end
        end

        for k, v in pairs(items['recipe']) do
            if v.enabled and data.raw.recipe[k] then
                for j=1, #recipe_multiplier, 1 do
                    item = table.deepcopy(data.raw.recipe[k])
                    item.enabled = false
                    item.name = k .. '-s' .. j

                    if item.normal then
                        item.normal.hide_from_player_crafting = true

                        if item.normal.ingredients then
                            for ik, iv in pairs(item.normal.ingredients) do
                                if iv[1] and iv[2] then
                                    item.normal.ingredients[ik][2] = iv[2] * recipe_multiplier[j]

                                else
                                    item.normal.ingredients[ik].amount = iv.amount * recipe_multiplier[j]
                                end
                            end
                        end

                        if item.normal.results then
                            for rk, rv in pairs(item.normal.results) do
                                if rv[1] and rv[2] then
                                    item.normal.results[rk][2] = rv[2] * recipe_multiplier[j]

                                else
                                    item.normal.results[rk].amount = rv.amount * recipe_multiplier[j]
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
                            item.normal.energy_required = recipe_multiplier[j]
                        end

                    else
                        item.hide_from_player_crafting = true

                        if item.energy_required then
                            item.energy_required = item.energy_required * recipe_multiplier[j]

                        else
                            item.energy_required = recipe_multiplier[j]
                        end
                    end

                    if item.expensive then
                        item.expensive.hide_from_player_crafting = true

                        if item.expensive.ingredients then
                            for ik, iv in pairs(item.expensive.ingredients) do
                                if iv[1] and iv[2] then
                                    item.expensive.ingredients[ik][2] = iv[2] * recipe_multiplier[j]

                                else
                                    item.expensive.ingredients[ik].amount = iv.amount * recipe_multiplier[j]
                                end
                            end
                        end

                        if item.expensive.results then
                            for rk, rv in pairs(item.expensive.results) do
                                if rv[1] and rv[2] then
                                    item.expensive.results[rk][2] = rv[2] * recipe_multiplier[j]

                                else
                                    item.expensive.results[rk].amount = rv.amount * recipe_multiplier[j]
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
                            item.expensive.energy_required = recipe_multiplier[j]
                        end
                    end

                    if item.ingredients then
                        for ik, iv in pairs(item.ingredients) do
                            if iv[1] and iv[2] then
                                item.ingredients[ik][2] = iv[2] * recipe_multiplier[j]

                            else
                                item.ingredients[ik].amount = iv.amount * recipe_multiplier[j]
                            end
                        end
                    end

                    if item.results then
                        for rk, rv in pairs(item.results) do
                            if rv[1] and rv[2] then
                                item.results[rk][2] = rv[2] * recipe_multiplier[j]

                            else
                                item.results[rk].amount = rv.amount * recipe_multiplier[j]
                            end
                        end

                    else
                        if item.result_count then
                            item.result_count = item.result_count * recipe_multiplier[j]

                        else
                            item.result_count = recipe_multiplier[j]
                        end
                    end

                    data:extend({item})
                    table.insert(data.raw.technology[v.tech].effects, {type='unlock-recipe', recipe=item.name})

                    for l=1, #prod_module_list, 1 do
                        table.insert(data.raw.module[prod_module_list[l]].limitation, item.name)
                    end
                end
            end
        end
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-PIPE'].value then
    for k, _ in pairs(data.raw) do
        if data.raw[k] then
            if data.raw[k].fluid_box then
                if data.raw[k].fluid_box.height < settings.startup['PHI-MI-PIPE'].value then
                    data.raw[k].fluid_box.height = settings.startup['PHI-MI-PIPE'].value
                end

                if data.raw[k].fluid_box.base_level < (1 + settings.startup['PHI-MI-PIPE'].value) then
                    data.raw[k].fluid_box.base_level = 1 + settings.startup['PHI-MI-PIPE'].value
                end
            end

            if data.raw[k].output_fluid_box then
                if data.raw[k].output_fluid_box.height < settings.startup['PHI-MI-PIPE'].value then
                    data.raw[k].output_fluid_box.height = settings.startup['PHI-MI-PIPE'].value
                end

                if data.raw[k].output_fluid_box.base_level > (-1 - settings.startup['PHI-MI-PIPE'].value) then
                    data.raw[k].output_fluid_box.base_level = (-1 - settings.startup['PHI-MI-PIPE'].value)
                end
            end

            if data.raw[k].fluid_boxes then
                for k1, _ in pairs(data.raw[k].fluid_boxes) do
                    if data.raw[k].fluid_boxes[k1] ~= false and data.raw[k].fluid_boxes[k1] ~= true then
                        if data.raw[k].fluid_boxes[k1].production_type then
                            data.raw[k].fluid_boxes[k1].height = settings.startup['PHI-MI-PIPE'].value

                            if data.raw[k].fluid_boxes[k1].base_level then
                                data.raw[k].fluid_boxes[k1].base_level = 1 + settings.startup['PHI-MI-PIPE'].value
                            end
                        end
                    end
                end
            end
        end
    end
end

if settings.startup['PHI-MB'].value and mods['space-exploration'] and settings.startup['PHI-MB-MINING-TIER'].value > 1 then
    data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group = 'se-core-miner-drill'

    local se = {
        type = 'mining-drill',
        name = 'se-core-miner-drill',
        ref_name = 'se-core-miner-drill',
        min = 2,
        max = 3
    }

    for i=2, settings.startup['PHI-MB-MINING-TIER'].value do
        local miner_name = 'se-core-miner-' .. i
        local drill_name = 'se-core-miner-drill-' .. i

        main.EEE(se, i)
        data.raw['mining-drill'][drill_name].minable.result = miner_name
        data.raw['mining-drill'][drill_name].placeable_by.item = miner_name

        local item = table.deepcopy(data.raw['item']['se-core-miner'])
        item.name = 'se-core-miner-' .. i
        item.place_result = drill_name
        item.order = 'zzzz-core-miner-' .. i

        item.icons = {
            {
                icon = '__space-exploration-graphics__/graphics/icons/core-miner.png',
                tint = items['tint'][i],
                icon_size = 64,
            }
        }

        item.icon = nil
        item.icon_size = nil

        data:extend({item})

        if i > 2 then
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{name='se-core-miner-' .. (i - 1), amount=1}, {name='se-core-miner', amount=1}},
                result = miner_name
            }})

        else
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{name='se-core-miner', amount=2}},
                result = miner_name
            }})
        end

        data.raw['mining-drill'][drill_name].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group
        table.insert(data.raw.technology['se-core-miner'].effects, {type='unlock-recipe', recipe=miner_name})
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
