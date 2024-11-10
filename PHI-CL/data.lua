local items = require 'config'
local main = require 'main'
local file_stage = 1

if settings.startup['PHI-EN'].value then
    if settings.startup['PHI-EN-POWER-TIER'].value > 1 then
        data.raw['fluid']['steam'].max_temperature = 5000
    end

    local ml = math.max(settings.startup['PHI-EN-SOLAR-TIER'].value, settings.startup['PHI-EN-POWER-TIER'].value)

    for i=1, 7 do
        local tn = 'compound-energy-' .. i
        local prereq

        if i > 1 then
            prereq = {'compound-energy-' .. (i - 1)}

        else
            prereq = {'solar-energy', 'advanced-circuit', 'electric-energy-accumulators'}
        end

        data:extend({{
            type = 'technology',
            name = tn,
            enabled = (i <= ml),
            prerequisites = prereq,
            effects = {},
            unit = {
                count = math.floor(75 * (i ^ 2)),
                ingredients = {
                    {'automation-science-pack', 1},
                    {'logistic-science-pack', 1}
                },
                time = 30
            },
            icons = {
                {
                    icon = '__base__/graphics/technology/solar-energy.png',
                    icon_size = 256,
                    tint = items['tint'][i]
                }
            },
            order = 'a-h-' .. i,
            localised_name = {'phi-cl.combine', {'technology-name.compound-energy'}, tostring(i)},
            localised_description = {'technology-description.compound-energy'}
        }})
    end
end

if settings.startup['PHI-EQ'].value and settings.startup['PHI-EQ-ARMOR'].value then
    local grid = table.deepcopy(data.raw['equipment-grid']['large-equipment-grid'])
    grid.name = 'equipment-grid-14x14'
    grid.width = 14
    grid.height = 14
    data:extend({grid})

    local armor = table.deepcopy(data.raw['armor']['power-armor-mk2'])
    armor.name = 'power-armor-mk3'
    armor.icons = {
        {
            icon = armor.icon,
            tint = items['tint'][2],
            icon_size = armor.icon_size
        }
    }
    armor.icon = nil
    armor.icon_size = nil

    for _, v in pairs(armor.resistances) do
        v.decrease = v.decrease + 10

        if v.percent < 90 then
            v.percent = v.percent + 10

        else
            v.decrease = 100
        end
    end

    armor.order = armor.order .. '2'
    armor.equipment_grid = grid.name
    armor.inventory_size_bonus = armor.inventory_size_bonus + 10
    armor.localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, '3'}
    data:extend({armor})

    data:extend({{
        type = 'recipe',
        name = armor.name,
        energy_required = 2,
        enabled = false,
        ingredients = {{type='item', name='power-armor-mk2', amount=2}},
        results = {{type='item', name=armor.name, amount=1}},
        main_product = armor.name,
        localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, '3'}
    }})

    for _, an in ipairs(data.raw['character']['character']['animations']) do
        if an.armors then
            for _, ar in ipairs(an.armors) do
                if ar == 'power-armor-mk2' then
                    an.armors[#an.armors + 1] = armor.name
                    break
                end
            end
        end
    end

    table.insert(data.raw.technology['power-armor-mk2'].effects, {type='unlock-recipe', recipe=armor.name})

    if mods['space-age'] then
        grid = table.deepcopy(data.raw['equipment-grid']['large-equipment-grid'])
        grid.name = 'equipment-grid-15x16'
        grid.width = 15
        grid.height = 16
        data:extend({grid})

        armor = table.deepcopy(data.raw['armor']['mech-armor'])
        armor.name = 'mech-armor-mk2'
        armor.icons = {
            {
                icon = armor.icon,
                tint = items['tint'][2],
                icon_size = armor.icon_size
            }
        }
        armor.icon = nil
        armor.icon_size = nil

        for _, v in pairs(armor.resistances) do
            v.decrease = v.decrease + 10

            if v.percent < 90 then
                v.percent = v.percent + 10

            else
                v.decrease = 100
            end
        end

        armor.order = armor.order .. '2'
        armor.equipment_grid = grid.name
        armor.inventory_size_bonus = armor.inventory_size_bonus + 10
        armor.localised_name = {'phi-cl.combine-gen', {'name.mech-armor'}, '2'}
        data:extend({armor})

        data:extend({{
            type = 'recipe',
            name = armor.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type='item', name='mech-armor', amount=2}},
            results = {{type='item', name=armor.name, amount=1}},
            main_product = armor.name,
            localised_name = {'phi-cl.combine-gen', {'name.mech-armor'}, '2'}
        }})

        for _, an in ipairs(data.raw['character']['character']['animations']) do
            if an.armors then
                for _, ar in ipairs(an.armors) do
                    if ar == 'mech-armor' then
                        an.armors[#an.armors + 1] = armor.name
                        break
                    end
                end
            end
        end

        table.insert(data.raw.technology['mech-armor'].effects, {type='unlock-recipe', recipe=armor.name})
    end
end

if settings.startup['PHI-MI'].value then
    for _, v in pairs(data.raw['active-defense-equipment']) do
        v.automatic = true
    end
    
    data.raw['mining-drill']['electric-mining-drill'].filter_count = 5
    
    if mods['space-age'] then
        data.raw['mining-drill']['big-mining-drill'].filter_count = 5
    end

    if settings.startup['PHI-MI-EFFCY'].value then
        data.raw['module']['efficiency-module'].effect = {consumption=-0.4, pollution=-0.4}
        data.raw['module']['efficiency-module-2'].effect = {consumption=-0.8, pollution=-0.8}
        data.raw['module']['efficiency-module-3'].effect = {consumption=-1.2, pollution=-1.2}
    end

    if settings.startup['PHI-MI-LANDFILL'].value ~= 50 then
        data.raw.recipe['landfill'].ingredients = {{type='item', name='stone', amount=settings.startup['PHI-MI-LANDFILL'].value}}
    end

    if settings.startup['PHI-MI-NUCLEAR'].value then
        for _, v in pairs(data.raw['reactor']) do
            v.scale_energy_usage = settings.startup['PHI-MI-NUCLEAR'].value
        end
    end

    if settings.startup['PHI-MI-PIPE'].value then
        local s = (1 + settings.startup['PHI-MI-PIPE'].value) / 2

        for _, t in pairs({data.raw['offshore-pump'], data.raw['pump']}) do
            for _, v in pairs(t) do
                v.pumping_speed = v.pumping_speed * s
            end
        end
    end

    if settings.startup['PHI-MI-ROBOT'].value then
        local s = (1 + settings.startup['PHI-MI-ROBOT'].value) / 2
        local sn = (17 - settings.startup['PHI-MI-ROBOT'].value) / 16

        for _, t in pairs({data.raw['construction-robot'], data.raw['logistic-robot']}) do
            for _, v in pairs(t) do
                v.speed = v.speed * s

                if settings.startup['PHI-MI-ROBOT-ENERGY'].value then
                    v.energy_per_tick = '0J'
                    v.energy_per_move = '0J'
                    v.speed_multiplier_when_out_of_energy = 1

                else
                    v.energy_per_tick = tostring(tonumber(string.match(v.energy_per_tick, '[%d%.]+')) * sn) .. string.match(v.energy_per_tick, '%a+')
                    v.energy_per_move = tostring(tonumber(string.match(v.energy_per_move, '[%d%.]+')) * sn) .. string.match(v.energy_per_move, '%a+')
                end
            end
        end
    end

    if settings.startup['PHI-MI-TRAIN'].value then
        local s = (7 + settings.startup['PHI-MI-TRAIN'].value) / 8

        for _, t in pairs({data.raw['locomotive'], data.raw['cargo-wagon'], data.raw['fluid-wagon'], data.raw['artillery-wagon']}) do
            for _, v in pairs(t) do
                v.max_health = v.max_health * s
                v.max_speed = v.max_speed * s
                v.braking_force = v.braking_force * s

                if v.max_power then
                    v.max_power = tostring(tonumber(string.match(v.max_power, '[%d%.]+')) * s) .. string.match(v.max_power, '%a+')
                    v.reversing_power_modifier = 1
                end
            end
        end
    end
end

if settings.startup['PHI-SA'].value then
    if (not settings.startup['PHI-SA-SPOIL'].value) and mods['space-age'] then
        local function spoil_handle(i)
            i.spoil_ticks = nil
            i.spoil_result = nil
            i.spoil_to_trigger_result = nil
        end

        -- spoil_handle(data.raw['item']['iron-bacteria'])
        -- spoil_handle(data.raw['item']['copper-bacteria'])
        spoil_handle(data.raw['item']['nutrients'])
        spoil_handle(data.raw['item']['captive-biter-spawner'])
        spoil_handle(data.raw['item']['biter-egg'])
        spoil_handle(data.raw['item']['pentapod-egg'])
        spoil_handle(data.raw['capsule']['raw-fish'])
        spoil_handle(data.raw['capsule']['yumako-mash'])
        spoil_handle(data.raw['capsule']['yumako'])
        spoil_handle(data.raw['capsule']['jelly'])
        spoil_handle(data.raw['capsule']['jellynut'])
        spoil_handle(data.raw['capsule']['bioflux'])
        spoil_handle(data.raw['tool']['agricultural-science-pack'])

        data:extend({{
            type = 'recipe',
            name = 'spoilage-from-nutrients',
            energy_required = 1,
            enabled = false,
            ingredients = {{type='item', name='nutrients', amount=1}},
            results = {{type='item', name='spoilage', amount=10}},
            main_product = 'spoilage',
            localised_name = {'phi-cl.combine', '', ''}
        }})

        table.insert(data.raw.technology['agriculture'].effects, {type='unlock-recipe', recipe='spoilage-from-nutrients'})
    end

    if settings.startup['PHI-SA-GENERIC'].value then
        if mods['space-age'] then
            data.raw.technology['cliff-explosives'].prerequisites = {'explosives', 'military-2'}
            data.raw.technology['cliff-explosives'].unit.count = 200
            data.raw.technology['cliff-explosives'].unit.ingredients = {
                {'automation-science-pack', 1},
                {'logistic-science-pack', 1}
            }

            local recipe = table.deepcopy(data.raw.recipe['cliff-explosives'])
            recipe.name = 'cliff-explosives-o'
            recipe.ingredients = {
                {type='item', name='explosives', amount=10},
                {type='item', name='grenade', amount=1},
                {type='item', name='barrel', amount=1}
            }
            recipe.localised_name = {'phi-cl.combine', '', ''}

            data:extend({recipe})
            table.insert(data.raw.technology['cliff-explosives'].effects, {type='unlock-recipe', recipe=recipe.name})

            data.raw.technology['rail-support-foundations'].prerequisites = {'elevated-rail'}
            data.raw.technology['rail-support-foundations'].unit.count = 600
            data.raw.technology['rail-support-foundations'].unit.ingredients = {
                {'automation-science-pack', 1},
                {'logistic-science-pack', 1},
                {'chemical-science-pack', 1},
                {'production-science-pack', 1},
                {'utility-science-pack', 1}
            }

            data.raw.technology['foundation'].prerequisites = {'elevated-rail', 'rail-support-foundations'}
            data.raw.technology['foundation'].unit.count_formula = '1000'
            data.raw.technology['foundation'].unit.ingredients = {
                {'automation-science-pack', 1},
                {'logistic-science-pack', 1},
                {'chemical-science-pack', 1},
                {'production-science-pack', 1},
                {'utility-science-pack', 1}
            }

            recipe = table.deepcopy(data.raw.recipe['foundation'])
            recipe.name = 'foundation-o'
            recipe.ingredients = {
                {type='item', name='stone', amount=40},
                {type='item', name='refined-concrete', amount=20},
                {type='item', name='steel-plate', amount=20}
            }
            recipe.results = {
                {type='item', name='foundation', amount=10}
            }
            recipe.localised_name = {'phi-cl.combine', '', ''}

            data:extend({recipe})
            table.insert(data.raw.technology['foundation'].effects, {type='unlock-recipe', recipe=recipe.name})

            data.raw['space-platform-hub']['space-platform-hub'].platform_repair_speed_modifier = 2
            data.raw['space-platform-hub']['space-platform-hub'].inventory_size = 119
            data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus = 40

            -- data.raw['rocket-silo']['rocket-silo'].logistic_trash_inventory_size = 20
            data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size = 60
            data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size = 60

            for _, v in pairs(data.raw.recipe) do
                if v.maximum_productivity then
                    v.maximum_productivity = nil
                end
            end

            data.raw.recipe['atomic-bomb'].ingredients[3] = {type='item', name='uranium-235', amount=30}

            data.raw.roboport.roboport.charging_station_count_affected_by_quality = true
            data.raw['roboport-equipment']['personal-roboport-equipment'].charging_station_count_affected_by_quality = true
        end

        if mods['elevated-rails'] then
            data.raw.technology['elevated-rail'].prerequisites = {'concrete'}
            data.raw.technology['elevated-rail'].unit.count = 200
            data.raw.technology['elevated-rail'].unit.ingredients = {
                {'automation-science-pack', 1},
                {'logistic-science-pack', 1}
            }
        end
    end

    if settings.startup['PHI-SA-QUALITY'].value then
        if mods['quality'] then
            for _, v in pairs(data.raw.module) do
                if v.category and v.category == 'quality' then
                    v.effect.quality = v.effect.quality * settings.startup['PHI-SA-QUALITY'].value / 10

                elseif v.category and v.category == 'speed' then
                    v.effect.quality = nil
                end
            end
        end
    end

    if settings.startup['PHI-SA-NO-QUALITY'].value then
        if mods['quality'] then
            for _, v in pairs({'quality-module', 'quality-module-2', 'quality-module-3'}) do
                data.raw.technology[v] = nil
                data.raw.module[v] = nil
                data.raw.recipe[v] = nil
                data.raw.recipe[v .. '-recycling'] = nil
            end

            data.raw.technology['epic-quality'] = nil
            data.raw.technology['legendary-quality'] = nil

            data.raw.quality.uncommon = nil
            data.raw.quality.rare = nil
            data.raw.quality.epic = nil
            data.raw.quality.legendary = nil

            data.raw['tips-and-tricks-item']['quality'] = nil
            data.raw['tips-and-tricks-item']['quality-modules'] = nil
            data.raw['tips-and-tricks-item']['quality-factoriopedia'] = nil
            data.raw['tips-and-tricks-item']['quality-probabilities'] = nil

            data.raw['produce-achievement']['crafting-with-quality'] = nil
            data.raw['module-transfer-achievement']['make-it-better'] = nil
            data.raw['produce-achievement']['my-modules-are-legendary'] = nil
            data.raw['equip-armor-achievement']['look-at-my-shiny-rare-armor'] = nil
            data.raw['use-item-achievement']['todays-fish-is-trout-a-la-creme'] = nil
            data.raw['place-equipment-achievement']['no-room-for-more'] = nil

            data.raw.quality.normal.level = 5
            data.raw.quality.normal.color = {178, 104, 0}
            data.raw.quality.normal.icon = '__quality__/graphics/icons/quality-legendary.png'
            data.raw.quality.normal.next = nil
            data.raw.quality.normal.next_probability = nil
            data.raw.quality.normal.hidden = true
            data.raw.quality.normal.hidden_in_factoriopedia = true
            data.raw.quality.normal.beacon_power_usage_multiplier = 1 / 6
            data.raw.quality.normal.mining_drill_resource_drain_multiplier = 1 / 6
            data.raw.quality.normal.science_pack_drain_multiplier = 19 / 20
        end
    end

    data.raw['utility-constants'].default.rocket_lift_weight = settings.startup['PHI-SA-ROCKET-CAPACITY'].value * 1000000
    data.raw['utility-constants'].default.default_item_weight = settings.startup['PHI-SA-CARGO-WEIGHT'].value
end

if settings.startup['PHI-CT'].value then
    if settings.startup['PHI-CT-TOOL'].value then
        local item = table.deepcopy(data.raw['item']['radar'])
        item.name = 'super-radar'
        item.place_result = item.name
        item.order = 'd[radar]-b[radar]'

        item.icons = {
            {
                icon = item.icon or '__base__/graphics/icons/radar.png',
                tint = items['tint'][8],
                icon_size = item.icon_size or 64,
                icon_mipmaps = item.icon_mipmaps or 4
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'name.super-radar'}
        data:extend({item})

        local entity = table.deepcopy(data.raw['radar']['radar'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.max_distance_of_sector_revealed = 35
        entity.max_distance_of_nearby_sector_revealed = 35
        entity.pictures.layers[1].tint = items['tint'][8]
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            ingredients = {{type='item', name='electronic-circuit', amount=5}, {type='item', name='iron-gear-wheel', amount=5}, {type='item', name='iron-plate', amount=10}},
            results = {{type='item', name=item.name, amount=1}},
            main_product = item.name,
            localised_name = {'name.' .. item.name}
        }})

        item = table.deepcopy(data.raw['item']['electric-energy-interface'])
        item.name = 'passive-energy-void'
        item.place_result = item.name
        item.localised_name = {'name.passive-energy-void'}
        data:extend({item})

        entity = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.energy_source.usage_priority = 'tertiary'
        entity.energy_source.emissions_per_minute = {pollution = 0}
        entity.energy_source.input_flow_limit = '1PW'
        entity.energy_source.output_flow_limit = '0W'
        entity.energy_source.buffer_capacity = '1PJ'
        entity.energy_production = '0W'
        entity.energy_usage = '1PW'
        entity.gui_mode = 'none'
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type='item', name='accumulator', amount=1}},
            results = {{type='item', name=item.name, amount=1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        table.insert(data.raw.technology['electric-energy-accumulators'].effects, {type='unlock-recipe', recipe=item.name})
        data:extend({{type='recipe-category', name='fluid'}})

        item = table.deepcopy(data.raw['item']['offshore-pump'])
        item.name = 'super-pump'
        item.place_result = item.name
        item.order = 'b[fluids]-a[super-pump]-o'

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
        item.localised_name = {'name.super-pump'}
        data:extend({item})

        entity = table.deepcopy(data.raw['offshore-pump']['offshore-pump'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.type = 'assembling-machine'
        entity.crafting_categories = {'fluid'}
        entity.crafting_speed = 1
        entity.energy_source = {type = 'void'}
        entity.fluid_box.volume = 4000
        entity.fluid_boxes = {table.deepcopy(entity.fluid_box)}
        entity.fluid_box = nil
        entity.fluid_boxes_off_when_no_fluid_recipe = false
        entity.effect_receiver = {uses_module_effects=false, uses_beacon_effects=false}
        entity.allowed_effects = {'consumption'}
        entity.collision_mask = nil
        entity.tile_buildability_rules = nil
        entity.fluid_source_offset = nil
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            ingredients = {{type='item', name='electronic-circuit', amount=2}, {type='item', name='pipe', amount=1}, {type='item', name='iron-gear-wheel', amount=1}},
            results = {{type='item', name=item.name, amount=1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        for _, v in pairs(data.raw.fluid) do
            if v.subgroup == 'fluid' then
                local temp

                if v.max_temperature then
                    temp = v.max_temperature

                else
                    temp = v.default_temperature
                end

                data:extend({{
                    type = 'recipe',
                    name = v.name,
                    category = 'fluid',
                    energy_required = 1,
                    enabled = true,
                    ingredients = {},
                    results = {{type='fluid', name=v.name, amount=16000, temperature=temp}},
                    main_product = v.name,
                    hide_from_player_crafting = true,
                    allow_productivity = false,
                    crafting_machine_tint = {primary=v.flow_color},
                    localised_name = v.localised_name
                }})
            end
        end
    end

    if settings.startup['PHI-CT-UTILITY'].value then
        for _, t in pairs({'arithmetic-combinator', 'decider-combinator', 'programmable-speaker', 'selector-combinator'}) do
            data.raw[t][t].energy_source.usage_priority = 'primary-input'
        end

        local item = table.deepcopy(data.raw['item']['steel-chest'])
        item.name = 'trash-chest'
        item.place_result = item.name
        item.order = 'b[storage]-h[trash-chest]'

        item.icons = {
            {
                icon = item.icon or '__base__/graphics/icons/steel-chest.png',
                tint = items['tint'][8],
                icon_size = item.icon_size or 64,
                icon_mipmaps = item.icon_mipmaps or 4
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'name.trash-chest'}
        data:extend({item})

        local entity = table.deepcopy(data.raw['container']['steel-chest'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.inventory_type = 'with_filters_and_bar'
        entity.inventory_size = 1
        entity.type = 'infinity-container'
        entity.gui_mode = 'none'
        entity.erase_contents_when_mined = true
        entity.logistic_mode = nil
        entity.next_upgrade = nil
        entity.picture.layers[1].tint = items['tint'][8]
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type='item', name='steel-chest', amount=1}},
            results = {{type='item', name=item.name, amount=1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe=item.name})

        item = table.deepcopy(data.raw['item']['pipe'])
        item.name = 'trash-pipe'
        item.place_result = item.name
        item.order = 'a[pipe]-c[trash-pipe]'

        item.icons = {
            {
                icon = item.icon or '__base__/graphics/icons/pipe.png',
                tint = items['tint'][8],
                icon_size = item.icon_size or 64,
                icon_mipmaps = item.icon_mipmaps or 4
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.icon_mipmaps = nil
        item.localised_name = {'name.trash-pipe'}
        data:extend({item})

        entity = table.deepcopy(data.raw['pipe']['pipe'])
        entity.name = item.name
        entity.minable.result = item.name
        entity.inventory_size = 1
        entity.type = 'infinity-pipe'
        entity.gui_mode = 'none'
        entity.erase_contents_when_mined = true
        entity.next_upgrade = nil

        for _, v in pairs(entity.pictures) do
            v.tint = items['tint'][8]

            if v.hr_version then
                v.hr_version.tint = items['tint'][8]
            end
        end

        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type='item', name='iron-plate', amount=1}},
            results = {{type='item', name=item.name, amount=1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        table.insert(data.raw.technology['automation'].effects, {type='unlock-recipe', recipe=item.name})

        item = table.deepcopy(data.raw['item']['boiler'])
        item.name = 'electric-boiler'
        item.place_result = item.name
        item.order = 'b[steam-power]-a[electric-boiler]'
        item.localised_name = {'name.electric-boiler'}
        data:extend({item})

        entity = table.deepcopy(data.raw['boiler']['boiler'])
        entity.name = item.name
        entity.energy_consumption = '7200kW'
        entity.buffer_capacity = '14400kJ'
        entity.target_temperature = 165
        entity.emissions_per_minute = {pollution = 0}
        entity.minable.result = entity.name
        entity.energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            buffer_capacity = entity.buffer_capacity,
            light_flicker = {
                color = {r=0.5, g=1, b=1, a=0.5},
                minimum_light_size = 0.1,
                light_intensity_to_size_coefficient = 1
            }
        }

        entity.fire_flicker_enabled = false
        entity.fire_glow_flicker_enabled = false
        entity.fire = {}
        entity.localised_name = item.localised_name
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = true,
            ingredients = {{type='item', name='boiler', amount=1}, {type='item', name='electronic-circuit', amount=1}},
            results = {{type='item', name=item.name, amount=1}},
            main_product = item.name,
            localised_name = item.localised_name
        }})

        -- electric boiler
        data.raw['boiler']['boiler'].fast_replaceable_group = 'boiler'
        data.raw['boiler']['electric-boiler'].fast_replaceable_group = data.raw['boiler']['electric-boiler'].fast_replaceable_group

        local chests = {
            'steel-chest',
            'passive-provider-chest',
            'active-provider-chest',
            'storage-chest',
            'buffer-chest',
            'requester-chest'
        }

        for _, c in pairs(chests) do
            item = table.deepcopy(data.raw['item'][c])

            if c == 'steel-chest' then
                entity = table.deepcopy(data.raw['container'][c])

            else
                entity = table.deepcopy(data.raw['logistic-container'][c])
            end

            item.name = 'basic-' .. c
            item.place_result = item.name
            item.order = 'b[storage]-h[basic-' .. c .. ']'
            item.localised_name = {'name.basic-'.. c}
            data:extend({item})

            entity.name = item.name
            entity.minable.result = item.name
            entity.inventory_type = 'with_filters_and_bar'
            entity.inventory_size = 1

            if c ~= 'steel-chest' then
                entity.max_logistic_slots = 1
                entity.trash_inventory_size = 1
            end

            entity.localised_name = item.localised_name
            data:extend({entity})

            data:extend({{
                type = 'recipe',
                name = item.name,
                energy_required = 2,
                enabled = false,
                ingredients = {{type='item', name=c, amount=1}},
                results = {{type='item', name=item.name, amount=1}},
                main_product = item.name,
                localised_name = item.localised_name
            }})
        end

        table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='basic-steel-chest'})

        for _, t in pairs({'construction', 'logistic'}) do
            for _, r in pairs({'passive-provider', 'storage'}) do
                table.insert(data.raw.technology[t .. '-robotics'].effects, {type='unlock-recipe', recipe='basic-' .. r .. '-chest'})
            end
        end

        for _, r in pairs({'active-provider', 'buffer', 'requester'}) do
            table.insert(data.raw.technology['logistic-system'].effects, {type='unlock-recipe', recipe='basic-' .. r .. '-chest'})
        end
    end

    if settings.startup['PHI-CT-HIDDEN'].value then
        local item = table.deepcopy(data.raw['item']['linked-chest'])
        item.supgroup = 'storage'
        item.order = 'a[items]-d[linked-chest]'
        data:extend({item})

        local entity = table.deepcopy(data.raw['linked-container']['linked-chest'])
        entity.circuit_wire_connection_point = data.raw['container']['steel-chest'].circuit_wire_connection_point
        entity.circuit_connector_sprites = data.raw['container']['steel-chest'].circuit_connector_sprites
        entity.circuit_wire_max_distance = data.raw['container']['steel-chest'].circuit_wire_max_distance
        entity.inventory_type = 'with_filters_and_bar'
        entity.inventory_size = 48
        entity.gui_mode = 'all'
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = item.name,
            energy_required = 2,
            enabled = false,
            ingredients = {{type='item', name='steel-chest', amount=1}},
            results = {{type='item', name=item.name, amount=1}},
            main_product = item.name
        }})

        table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe=item.name})

        data.raw.recipe['loader'].hidden = false
        data.raw.recipe['fast-loader'].hidden = false
        data.raw.recipe['express-loader'].hidden = false

        data.raw['loader']['loader'].filter_count = 2
        data.raw['loader']['fast-loader'].filter_count = 2
        data.raw['loader']['express-loader'].filter_count = 2

        data.raw['loader']['loader'].per_lane_filters = true
        data.raw['loader']['fast-loader'].per_lane_filters = true
        data.raw['loader']['express-loader'].per_lane_filters = true

        table.insert(data.raw.technology['logistics'].effects, {type='unlock-recipe', recipe='loader'})
        table.insert(data.raw.technology['logistics-2'].effects, {type='unlock-recipe', recipe='fast-loader'})
        table.insert(data.raw.technology['logistics-3'].effects, {type='unlock-recipe', recipe='express-loader'})

        if mods['space-age'] then
            data.raw.recipe['turbo-loader'].hidden = false
            data.raw['loader']['turbo-loader'].filter_count = 2
            data.raw['loader']['turbo-loader'].per_lane_filters = true
            table.insert(data.raw.technology['turbo-transport-belt'].effects, {type='unlock-recipe', recipe='turbo-loader'})

            local s = data.raw['inserter']['stack-inserter'].max_belt_stack_size
            data.raw['loader']['loader'].max_belt_stack_size = s
            data.raw['loader']['fast-loader'].max_belt_stack_size = s
            data.raw['loader']['express-loader'].max_belt_stack_size = s
            data.raw['loader']['turbo-loader'].max_belt_stack_size = s
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
