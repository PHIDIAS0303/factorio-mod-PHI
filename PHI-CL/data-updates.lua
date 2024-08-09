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

if settings.startup['PHI-CT'].value then
    if settings.startup['PHI-CT-OIL'].value then
        local item = table.deepcopy(data.raw['item']['offshore-pump'])
        item.name = 'oil-pump'
        item.place_result = 'oil-pump'
        item.order = 'b[fluids]-a[offshore-pump]-2'
        data:extend({item})

        local entity = table.deepcopy(data.raw['offshore-pump']['offshore-pump'])
        entity.name = 'oil-pump'
        entity.minable.result = 'oil-pump'
        entity.fluid = 'crude-oil'
        entity.fluid_box.filter = 'crude-oil'
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'oil-pump',
            energy_required = 2,
            enabled = true,
            ingredients = {{'electronic-circuit', 2}, {'pipe', 1}, {'iron-gear-wheel', 1}},
            result = 'oil-pump'
        }})
    end

    if settings.startup['PHI-CT-RADAR'].value then
        local item = table.deepcopy(data.raw['item']['radar'])
        item.name = 'super-radar'
        item.place_result = 'super-radar'
        item.order = 'd[radar]-b[radar]'
        data:extend({item})

        local entity = table.deepcopy(data.raw['radar']['radar'])
        entity.name = 'super-radar'
        entity.minable.result = 'super-radar'
        entity.max_distance_of_sector_revealed = 30
        entity.max_distance_of_nearby_sector_revealed = 30
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'super-radar',
            energy_required = 2,
            enabled = true,
            ingredients = {{'electronic-circuit', 5}, {'iron-gear-wheel', 5}, {'iron-plate', 10}},
            result = 'super-radar'
        }})
    end

    if settings.startup['PHI-CT-TRASH'].value then
        local item = table.deepcopy(data.raw['item']['steel-chest'])
        item.name = 'trash-chest'
        item.place_result = 'trash-chest'
        item.order = 'b[storage]-e[trash-chest]'
        data:extend({item})

        local entity = table.deepcopy(data.raw['container']['steel-chest'])
        entity.name = 'trash-chest'
        entity.minable.result = 'trash-chest'
        entity.inventory_size = 1
        entity.type = 'infinity-container'
        entity.gui_mode = 'none'
        entity.erase_contents_when_mined = true
        entity.logistic_mode = nil

        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'trash-chest',
            energy_required = 2,
            enabled = true,
            ingredients = {{'steel-chest', 1}},
            result = 'trash-chest'
        }})

        data:extend({{
            type = 'recipe',
            name = 'trash-chest-return',
            energy_required = 2,
            enabled = true,
            ingredients = {{'trash-chest', 1}},
            result = 'steel-chest'
        }})

        table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='trash-chest'})
        table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='trash-chest-return'})

        item = table.deepcopy(data.raw['item']['pipe'])
        item.name = 'trash-pipe'
        item.place_result = 'trash-pipe'
        item.order = 'a[pipe]-c[trash-pipe]'
        data:extend({item})

        entity = table.deepcopy(data.raw['pipe']['pipe'])
        entity.name = 'trash-pipe'
        entity.minable.result = 'trash-pipe'
        entity.inventory_size = 1
        entity.type = 'infinity-pipe'
        entity.gui_mode = 'none'
        entity.erase_contents_when_mined = true

        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'trash-pipe',
            energy_required = 2,
            enabled = true,
            ingredients = {{'iron-plate', 1}},
            result = 'trash-pipe'
        }})

        data:extend({{
            type = 'recipe',
            name = 'trash-pipe-return',
            energy_required = 2,
            enabled = true,
            ingredients = {{'trash-pipe', 1}},
            result = 'iron-plate'
        }})

        table.insert(data.raw.technology['automation'].effects, {type='unlock-recipe', recipe='trash-pipe'})
        table.insert(data.raw.technology['automation'].effects, {type='unlock-recipe', recipe='trash-pipe-return'})
    end

    if settings.startup['PHI-CT-MINER'].value then
        local item = table.deepcopy(data.raw['item']['electric-mining-drill'])
        item.name = 'large-area-electric-mining-drill'
        item.place_result = 'large-area-electric-mining-drill'
        item.order = 'zc'
        data:extend({item})

        local entity = table.deepcopy(data.raw['mining-drill']['electric-mining-drill'])
        entity.name = 'large-area-electric-mining-drill'
        entity.minable.result = 'large-area-electric-mining-drill'
        entity.max_health = entity.max_health * 16
        entity.energy_usage = (tonumber(string.match(entity.energy_usage, '%d+')) * 16) .. 'kW'
        entity.resource_searching_radius = 12.49
        entity.mining_speed = entity.mining_speed * 16
        entity.energy_source.emissions_per_minute = entity.energy_source.emissions_per_minute * 16
        entity.module_specification.module_slots = 8
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'large-area-electric-mining-drill',
            energy_required = 2,
            enabled = true,
            ingredients = {{'electric-mining-drill', 16}},
            result = 'large-area-electric-mining-drill'
        }})
    end

    if settings.startup['PHI-CT-LINKED'].value then
        local item = table.deepcopy(data.raw['item']['linked-chest'])
        item.order = 'a[items]-d[linked-chest]'
        data:extend({item})

        local entity = table.deepcopy(data.raw['linked-container']['linked-chest'])
        entity.inventory_size = 48
        entity.gui_mode = 'all'
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'linked-chest',
            energy_required = 2,
            enabled = false,
            ingredients = {{'steel-chest', 1}},
            result = 'linked-chest'
        }})

        data:extend({{
            type = 'recipe',
            name = 'linked-chest-return',
            energy_required = 2,
            enabled = false,
            ingredients = {{'linked-chest', 1}},
            result = 'steel-chest'
        }})

        table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='linked-chest'})
        table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='linked-chest-return'})
    end

    if settings.startup['PHI-CT-LOADER'].value then
        data.raw.recipe['loader'].hidden = false
        data.raw.recipe['fast-loader'].hidden = false
        data.raw.recipe['express-loader'].hidden = false

        data.raw.recipe['loader'].ingredients = {
            {'iron-plate', 5},
            {'electronic-circuit', 5},
            {'transport-belt', 2},
            {'inserter', 2}
        }
        data.raw.recipe['fast-loader'].ingredients = {
            {'iron-gear-wheel', 10},
            {'electronic-circuit', 10},
            {'advanced-circuit', 1},
            {'loader', 1}
        }

        data.raw.recipe['express-loader'].ingredients = {
            {'iron-gear-wheel', 10},
            {'advanced-circuit', 10},
            {'fast-loader', 1}
        }

        table.insert(data.raw.technology['logistics'].effects, {type='unlock-recipe', recipe='loader'})
        table.insert(data.raw.technology['logistics-2'].effects, {type='unlock-recipe', recipe='fast-loader'})
        table.insert(data.raw.technology['logistics-3'].effects, {type='unlock-recipe', recipe='express-loader'})
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

    data:extend({{
        type = 'recipe',
        name = 'electric-furnace-return',
        energy_required = 2,
        enabled = false,
        ingredients = {{name='electric-filter-furnace', amount=1}},
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
                    item.hide_from_player_crafting = true

                    if item.energy_required then
                        item.energy_required = item.energy_required * recipe_multiplier[j]

                    else
                        item.energy_required = recipe_multiplier[j]
                    end

                    if item.normal then
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
                    end

                    if item.expensive then
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

if settings.startup['PHI-MI-PIPE'].value then
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

if settings.startup['PHI-MB'].value then
    if settings.startup['PHI-MB-MINING-TIER'].value > 1 then
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
            data:extend({item})

            local ing_n = 'se-core-miner'

            if i > 2 then
                ing_n = ing_n .. '-' .. i
            end

            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{ing_n, 2}},
                result = miner_name
            }})

            data.raw['mining-drill'][drill_name].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group
            table.insert(data.raw.technology['se-core-miner'].effects, {type='unlock-recipe', recipe=miner_name})
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
