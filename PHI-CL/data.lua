local items = require 'config'
local main = require 'main'
local file_stage = 1

if settings.startup['PHI-EN'].value and settings.startup['PHI-EN-SOLAR-TIER'].value and settings.startup['PHI-EN-POWER-TIER'].value and settings.startup['PHI-EN-POWER-TIER'].value then
    local ml = math.max(settings.startup['PHI-EN-SOLAR-TIER'].value, settings.startup['PHI-EN-POWER-TIER'].value, settings.startup['PHI-EN-POWER-TIER'].value)

    for i=1, 7 do
        local tn = 'compound-energy-' .. i
        local prereq
        local e = true

        if i > 1 then
            prereq = {'compound-energy-' .. (i - 1)}

        else
            prereq = {'solar-energy', 'advanced-circuit', 'electric-energy-accumulators'}
        end

        if i > ml then
            e = false
        end

        data:extend({{
            type = 'technology',
            name = tn,
            enabled = e,
            prerequisites = prereq,
            effects = {},
            unit = {
                count = math.floor(100 * (i ^ 1.6)),
                ingredients = {
                    {'automation-science-pack', 1},
                    {'logistic-science-pack', 1}
                },
                time = 60
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

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-RADAR'].value then
    local item = table.deepcopy(data.raw['item']['radar'])
    item.name = 'super-radar'
    item.place_result = 'super-radar'
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
    item.localised_description = {'description.super-radar'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['radar']['radar'])
    entity.name = 'super-radar'
    entity.minable.result = 'super-radar'
    entity.max_distance_of_sector_revealed = 35
    entity.max_distance_of_nearby_sector_revealed = 35
    entity.pictures.layers[1].tint = items['tint'][8]
    entity.localised_name = {'name.super-radar'}
    entity.localised_description = {'description.super-radar'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'super-radar',
        energy_required = 2,
        enabled = true,
        ingredients = {{type='item', name='electronic-circuit', amount=5}, {type='item', name='iron-gear-wheel', amount=5}, {type='item', name='iron-plate', amount=10}},
        results = {{type='item', name='super-radar', amount=1}},
        main_product = 'super-radar',
        localised_name = {'name.super-radar'},
        localised_description = {'description.super-radar'}
    }})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TRASH'].value then
    local item = table.deepcopy(data.raw['item']['steel-chest'])
    item.name = 'trash-chest'
    item.place_result = 'trash-chest'
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
    item.localised_description = {'description.trash-chest'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['container']['steel-chest'])
    entity.name = 'trash-chest'
    entity.minable.result = 'trash-chest'
    entity.inventory_type = 'with_filters_and_bar'
    entity.inventory_size = 1
    entity.type = 'infinity-container'
    entity.gui_mode = 'none'
    entity.erase_contents_when_mined = true
    entity.logistic_mode = nil
    entity.next_upgrade = nil
    entity.picture.layers[1].tint = items['tint'][8]
    entity.localised_name = {'name.trash-chest'}
    entity.localised_description = {'description.trash-chest'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'trash-chest',
        energy_required = 2,
        enabled = false,
        ingredients = {{type='item', name='steel-chest', amount=1}},
        results = {{type='item', name='trash-chest', amount=1}},
        main_product = 'trash-chest',
        localised_name = {'name.trash-chest'},
        localised_description = {'description.trash-chest'}
    }})

    table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='trash-chest'})

    item = table.deepcopy(data.raw['item']['pipe'])
    item.name = 'trash-pipe'
    item.place_result = 'trash-pipe'
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
    item.localised_description = {'description.trash-pipe'}
    data:extend({item})

    entity = table.deepcopy(data.raw['pipe']['pipe'])
    entity.name = 'trash-pipe'
    entity.minable.result = 'trash-pipe'
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

    entity.se_allow_in_space = true
    entity.localised_name = {'name.trash-pipe'}
    entity.localised_description = {'description.trash-pipe'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'trash-pipe',
        energy_required = 2,
        enabled = false,
        ingredients = {{type='item', name='iron-plate', amount=1}},
        results = {{type='item', name='trash-pipe', amount=1}},
        main_product = 'trash-pipe',
        localised_name = {'name.trash-pipe'},
        localised_description = {'description.trash-pipe'}
    }})

    table.insert(data.raw.technology['automation'].effects, {type='unlock-recipe', recipe='trash-pipe'})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-LINKED'].value then
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
    entity.se_allow_in_space = true
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'linked-chest',
        energy_required = 2,
        enabled = false,
        ingredients = {{type='item', name='steel-chest', amount=1}},
        results = {{type='item', name='linked-chest', amount=1}},
        main_product = 'linked-chest'
    }})

    table.insert(data.raw.technology['steel-processing'].effects, {type='unlock-recipe', recipe='linked-chest'})
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-LOADER'].value then
    data.raw.recipe['loader'].hidden = false
    data.raw.recipe['fast-loader'].hidden = false
    data.raw.recipe['express-loader'].hidden = false

    table.insert(data.raw.technology['logistics'].effects, {type='unlock-recipe', recipe='loader'})
    table.insert(data.raw.technology['logistics-2'].effects, {type='unlock-recipe', recipe='fast-loader'})
    table.insert(data.raw.technology['logistics-3'].effects, {type='unlock-recipe', recipe='express-loader'})

    if mods['space-age'] then
        data.raw.recipe['turbo-loader'].hidden = false
        table.insert(data.raw.technology['turbo-transport-belt'].effects, {type='unlock-recipe', recipe='turbo-loader'})
    end
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-ENERGY'].value then
    local item = table.deepcopy(data.raw['item']['electric-energy-interface'])
    item.name = 'passive-energy-void'
    item.place_result = 'passive-energy-void'
    item.localised_name = {'name.passive-energy-void'}
    item.localised_description = {'description.passive-energy-void'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])
    entity.name = 'passive-energy-void'
    entity.minable.result = 'passive-energy-void'
    entity.energy_source.usage_priority = 'tertiary'
    entity.energy_source.emissions_per_minute = {pollution = 0}
    entity.energy_source.input_flow_limit = '1TW'
    entity.energy_source.output_flow_limit = '0W'
    entity.energy_production = '0W'
    entity.energy_usage = '1TW'
    entity.gui_mode = 'none'
    entity.localised_name = {'name.passive-energy-void'}
    entity.localised_description = {'description.passive-energy-void'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'passive-energy-void',
        energy_required = 2,
        enabled = false,
        ingredients = {{type='item', name='accumulator', amount=1}},
        results = {{type='item', name='passive-energy-void', amount=1}},
        main_product = 'passive-energy-void',
        localised_name = {'name.passive-energy-void'},
        localised_description = {'description.passive-energy-void'}
    }})

    table.insert(data.raw.technology['electric-energy-accumulators'].effects, {type='unlock-recipe', recipe='passive-energy-void'})
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-BOILER'].value then
    local item = table.deepcopy(data.raw['item']['boiler'])
    item.name = 'electric-boiler'
    item.place_result = 'electric-boiler'
    item.order = 'b[steam-power]-a[electric-boiler]'
    item.localised_name = {'name.electric-boiler'}
    item.localised_description = {'description.electric-boiler'}
    data:extend({item})

    local entity = table.deepcopy(data.raw['boiler']['boiler'])
    entity.name = 'electric-boiler'
    entity.energy_consumption = '7200kW'
    entity.buffer_capacity = '14400kJ'
    entity.target_temperature = 165
    entity.emissions_per_minute = {pollution = 0}

    entity.minable = {
        hardness = 0.2,
        mining_time = 0.5,
        result = 'electric-boiler'
    }

    entity.energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input',
        buffer_capacity = '14400kJ',
        light_flicker = {
            color = {r=0.5, g=1, b=1, a=0.5},
            minimum_light_size = 0.1,
            light_intensity_to_size_coefficient = 1
        }
    }

    entity.fire_flicker_enabled = false
    entity.fire_glow_flicker_enabled = false
    entity.fire = {}
    entity.localised_name = {'name.electric-boiler'}
    entity.localised_description = {'description.electric-boiler'}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'electric-boiler',
        energy_required = 2,
        enabled = true,
        ingredients = {{type='item', name='boiler', amount=1}, {type='item', name='electronic-circuit', amount=1}},
        results = {{type='item', name='electric-boiler', amount=1}},
        main_product = 'electric-boiler',
        localised_name = {'name.electric-boiler'},
        localised_description = {'description.electric-boiler'}
    }})

    -- electric boiler
    data.raw['boiler']['boiler'].fast_replaceable_group = 'boiler'
    data.raw['boiler']['electric-boiler'].fast_replaceable_group = data.raw['boiler']['electric-boiler'].fast_replaceable_group
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-CHEST'].value then
    local chests = {
        'steel-chest',
        'passive-provider-chest',
        'active-provider-chest',
        'storage-chest',
        'buffer-chest',
        'requester-chest'
    }

    for _, c in pairs(chests) do
        local item = table.deepcopy(data.raw['item'][c])
        local entity

        if c == 'steel-chest' then
            entity = table.deepcopy(data.raw['container'][c])

        else
            entity = table.deepcopy(data.raw['logistic-container'][c])
        end

        item.name = 'basic-' .. c
        item.place_result = 'basic-' .. c
        item.order = 'b[storage]-h[basic-' .. c .. ']'
        item.localised_name = {'name.basic-'.. c}
        item.localised_description = {'description.basic-'.. c}
        data:extend({item})

        entity.inventory_type = 'with_filters_and_bar'
        entity.inventory_size = 1
        entity.max_logistic_slots = 1
        entity.name = 'basic-' .. c
        entity.minable.result = 'basic-' .. c
        entity.localised_name = {'name.basic-'.. c}
        entity.localised_description = {'description.basic-'.. c}
        data:extend({entity})

        data:extend({{
            type = 'recipe',
            name = 'basic-' .. c,
            energy_required = 2,
            enabled = false,
            ingredients = {{type='item', name=c, amount=1}},
            results = {{type='item', name='basic-' .. c, amount=1}},
            main_product = 'basic-' .. c,
            localised_name = {'name.basic-' .. c},
            localised_description = {'description.basic-' .. c}
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
if settings.startup['PHI-EN'].value and settings.startup['PHI-EN-POWER-TIER'].value > 1 then
    data.raw['fluid']['steam'].max_temperature = 5000
end

if settings.startup['PHI-MI'].value and (settings.startup['PHI-MI-LANDFILL'].value ~= 50) then
    data.raw.recipe['landfill'].ingredients = {{type='item', name='stone', amount=settings.startup['PHI-MI-LANDFILL'].value}}
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-NUCLEAR'].value then
    data.raw['reactor']['nuclear-reactor'].scale_energy_usage = true
end

--[[
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
            icons = {
                {
                    icon = '__base__/graphics/icons/power-armor-mk2.png',
                    tint = items['tint'][2],
                    icon_size = 64,
                    icon_mipmaps = 4
                }
            },
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
            localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, '3'},
            localised_description = {'description.power-armor-mk2'}
        }
    })

    data:extend({{
        type = 'recipe',
        name = 'power-armor-mk3',
        energy_required = 2,
        enabled = false,
        ingredients = {{type='item', name='power-armor-mk2', amount=2}},
        results = {{type='item', name='power-armor-mk3', amount=1}},
        main_product = 'power-armor-mk3',
        localised_name = {'phi-cl.combine-gen', {'name.power-armor-mk2'}, '3'},
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
]]

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-FLUID'].value then
    data:extend({{type='recipe-category', name='fluid'}})

    local item = table.deepcopy(data.raw['item']['offshore-pump'])
    item.name = 'super-pump'
    item.place_result = 'super-pump'
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
    item.localised_description = nil
    data:extend({item})

    local entity = table.deepcopy(data.raw['offshore-pump']['offshore-pump'])
    entity.name = 'super-pump'
    entity.minable.result = 'super-pump'
    entity.type = 'assembling-machine'
    entity.crafting_categories = {'fluid'}
    entity.crafting_speed = 1
    entity.energy_source = {type = 'void'}
    entity.effect_receiver = {
        uses_module_effects = false,
        uses_beacon_effects = false,
        uses_surface_effects = true
    }
    entity.allowed_effects = {
        'consumption'
    }
    entity.module_slots = 0
    entity.fluid_boxes_off_when_no_fluid_recipe = false
    entity.collision_mask = nil
    entity.tile_buildability_rules = nil
    entity.layers = nil
    entity.fluid_source_offset = nil
    entity.localised_name = {'name.super-pump'}
    entity.localised_description = nil
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = 'super-pump',
        energy_required = 2,
        enabled = true,
        ingredients = {{type='item', name='electronic-circuit', amount=2}, {type='item', name='pipe', amount=1}, {type='item', name='iron-gear-wheel', amount=1}},
        results = {{type='item', name='super-pump', amount=1}},
        main_product = 'super-pump',
        localised_name = {'name.super-pump'},
        localised_description = nil
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
                ingredients = nil,
                results = {{type='fluid', name=v.name, amount=2000, temperature=temp}},
                main_product = v.name,
                hide_from_stats = true,
                hide_from_player_crafting = true,
                allow_decomposition = false,
                allow_as_intermediate = false,
                localised_name = v.localised_name,
                localised_description = nil
            }})
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
