local items = require 'config'
local main = require 'main'
local file_stage = 2

if settings.startup['PHI-EN'].value and settings.startup['PHI-EN-NUCLEAR-TIER'].value > 1 then
    data.raw['fluid']['steam'].max_temperature = 5000
end

if settings.startup['PHI-MB'].value then
    for i=2, 3 do
        item = table.deepcopy(data.raw['item']['satellite'])
        item.name = 'satellite-' .. i

        if mods['space-exploration'] then
            item.rocket_launch_product = {'se-satellite-telemetry', 100 * (2 ^ (i - 1))}

        else
            item.rocket_launch_product[2] = item.rocket_launch_product[2] * (2 ^ (i - 1))
        end

        item.icons = {
            {
                icon = '__base__/graphics/icons/satellite.png',
                tint = items['tint'][i],
                icon_size = 64,
                icon_mipmaps = 4
            }
        }
        item.order = 'm[satellite]-' .. i
        item.localised_name = {'name.satellite'}
        item.localised_description = {'description.satellite'}
        data:extend({item})

        local inn

        if i == 2 then
            inn = 'satellite'

        else
            inn = 'satellite-' .. (i - 1)
        end

        data:extend({{
            type = 'recipe',
            name = 'satellite-' .. i,
            energy_required = 5,
            enabled = false,
            icon = '__base__/graphics/icons/satellite.png',
            icon_size = 64,
            icon_mipmaps = 4,
            category = 'crafting',
            ingredients = {{inn, 2}},
            results = {{name = 'satellite-' .. i, amount = 1}},
            localised_name = {'name.satellite'},
            localised_description = {'description.satellite'}
        }})

        table.insert(data.raw.technology['space-science-pack'].effects, {type='unlock-recipe', recipe='satellite-' .. i})
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-REPAIR'].value then
    for _, v in pairs(data.raw['repair-tool']) do
        v.speed = v.speed * settings.startup['PHI-MI-REPAIR'].value
        v.durability = v.durability * settings.startup['PHI-MI-REPAIR'].value
    end
end

if settings.startup['PHI-MI'].value and (tonumber(settings.startup['PHI-MI-LANDFILL'].value) ~= 20) then
    data.raw.recipe['landfill'].ingredients = {
        {'stone', tonumber(settings.startup['PHI-MI-LANDFILL'].value)}
    }
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-EFFCY'].value then
    data.raw['module']['effectivity-module'].effect = {consumption = {bonus = -0.5}, pollution = {bonus = -0.1}}
    data.raw['module']['effectivity-module-2'].effect = {consumption = {bonus = -1.0}, pollution = {bonus = -0.15}}
    data.raw['module']['effectivity-module-3'].effect = {consumption = {bonus = -1.5}, pollution = {bonus = -0.2}}
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-NUCLEAR'].value then
    data.raw['reactor']['nuclear-reactor'].scale_energy_usage = true
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
        item.localised_name = {'name.se-core-miner-drill'}
        item.localised_description = {'description.se-core-miner-drill'}
        data:extend({item})

        if i > 2 then
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{name='se-core-miner-' .. (i - 1), amount=1}, {name='se-core-miner', amount=1}},
                result = miner_name,
                localised_name = {'name.se-core-miner-drill'},
                localised_description = {'description.se-core-miner-drill'}
            }})

        else
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{name='se-core-miner', amount=2}},
                result = miner_name,
                localised_name = {'name.se-core-miner-drill'},
                localised_description = {'description.se-core-miner-drill'}
            }})
        end

        data.raw['mining-drill'][drill_name].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group
        table.insert(data.raw.technology['se-core-miner'].effects, {type='unlock-recipe', recipe=miner_name})
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
            close_sound = {filename = '__base__/sound/armor-close.ogg', volume = 1},
            localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, 3},
            localised_description = {'description.power-armor-mk2'}
        }
    })

    data:extend({{
        type = 'recipe',
        name = 'power-armor-mk3',
        energy_required = 2,
        enabled = false,
        ingredients = {{name='power-armor-mk2', amount=2}},
        result = 'power-armor-mk3',
        localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, 3},
        localised_description = {'description.power-armor-mk2'}
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
    local other_recipe_name = {
        ['basic-oil-processing'] = true,
        ['advanced-oil-processing'] = true,
        ['light-oil-cracking'] = true,
        ['heavy-oil-cracking'] = true,
        ['uranium-processing'] = true,
        ['kovarex-enrichment-process'] = true,
        ['nuclear-fuel-reprocessing'] = true,
        ['coal-liquefaction'] = true
    }

    local item = table.deepcopy(data.raw.item['electric-furnace'])
    item.name = 'electric-filter-furnace'
    item.place_result = 'electric-filter-furnace'
    item.order = item.order .. '2'
    item.localised_name = {'name.electric-filter-furnace'}
    item.localised_description = {'description.electric-filter-furnace'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['furnace']['electric-furnace'])
    entity.name = 'electric-filter-furnace'
    entity.minable.result = 'electric-filter-furnace'
    entity.type = 'assembling-machine'
    entity.localised_name = {'name.electric-filter-furnace'}
    entity.localised_description = {'description.electric-filter-furnace'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'electric-filter-furnace',
        energy_required = 2,
        enabled = false,
        ingredients = {{name='electric-furnace', amount=1}},
        result = 'electric-filter-furnace',
        localised_name = {'name.electric-filter-furnace'},
        localised_description = {'description.electric-filter-furnace'}
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
                    
                    if other_recipe_name[k] then
                        item.localised_name = {'phi-cl.combine', {'name.' .. k}, j}
                        item.localised_description = {'description.' .. k}
                    end

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

if settings.startup['PHI-XW-WATER'].value > 0 then
    local ocfs = 'offshore-pump'

    data.raw[ocfs][ocfs].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
    data.raw[ocfs][ocfs].flags = {'placeable-neutral', 'player-creation'}
    data.raw[ocfs][ocfs].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
    data.raw[ocfs][ocfs].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
    data.raw[ocfs][ocfs].adjacent_tile_collision_mask = nil
    data.raw[ocfs][ocfs].placeable_position_visualization = nil
    data.raw[ocfs][ocfs].se_allow_in_space = true

    if mods['angelsrefining'] then
        local ofs = 'seafloor-pump'

        data.raw[ocfs][ofs].pumping_speed = settings.startup['PHI-XW-WATER'].value * 2
        data.raw[ocfs][ofs].flags = {'placeable-neutral', 'player-creation', 'filter-directions'}
        data.raw[ocfs][ofs].adjacent_tile_collision_box = {{-2, -3}, {2, -2}}
        data.raw[ocfs][ofs].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
        data.raw[ocfs][ofs].adjacent_tile_collision_mask = nil
        data.raw[ocfs][ofs].placeable_position_visualization = nil
    end

    if mods['exotic-industries'] then
        local ofs = 'ei_gaia-pump'

        data.raw[ocfs][ofs].pumping_speed = settings.startup['PHI-XW-WATER'].value * 20
        data.raw[ocfs][ofs].flags = {'placeable-neutral', 'player-creation'}
        data.raw[ocfs][ofs].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
        data.raw[ocfs][ofs].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
        data.raw[ocfs][ofs].adjacent_tile_collision_mask = nil
        data.raw[ocfs][ofs].placeable_position_visualization = nil
    end
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-OIL'].value then
    local item = table.deepcopy(data.raw['item']['offshore-pump'])

    item.name = 'oil-pump'
    item.place_result = 'oil-pump'
    item.order = 'b[fluids]-a[offshore-pump]-o'

    item.icons = {
        {
            icon = '__base__/graphics/icons/offshore-pump.png',
            tint = items['tint'][2],
            icon_size = 64,
            icon_mipmaps = 4
        }
    }

    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.localised_name = {'name.oil-pump'}
    item.localised_description = {'description.oil-pump'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['offshore-pump']['offshore-pump'])
    entity.name = 'oil-pump'
    entity.minable.result = 'oil-pump'
    entity.fluid = 'crude-oil'
    entity.fluid_box.filter = 'crude-oil'
    entity.se_allow_in_space = true
    entity.localised_name = {'name.oil-pump'}
    entity.localised_description = {'description.oil-pump'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'oil-pump',
        energy_required = 2,
        enabled = true,
        ingredients = {{'electronic-circuit', 2}, {'pipe', 1}, {'iron-gear-wheel', 1}},
        result = 'oil-pump',
        localised_name = {'name.oil-pump'},
        localised_description = {'description.oil-pump'}
    }})
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
