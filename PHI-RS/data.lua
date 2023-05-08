local recipe_multiplier = {4, 8}

local recipe_list = {
    {
        name='iron-plate',
        tech='automation'
    },
    {
        name='copper-plate',
        tech='automation'
    },
    {
        name='stone-brick',
        tech='automation'
    },
    {
        name='steel-plate',
        tech='steel-processing'
    },
    {
        name='basic-oil-processing',
        tech='oil-processing'
    },
    {
        name='advanced-oil-processing',
        tech='advanced-oil-processing'
    },
    {
        name='heavy-oil-cracking',
        tech='advanced-oil-processing'
    },
    {
        name='light-oil-cracking',
        tech='advanced-oil-processing'
    },
    {
        name='solid-fuel-from-light-oil',
        tech='advanced-oil-processing'
    },
    {
        name='solid-fuel-from-heavy-oil',
        tech='advanced-oil-processing'
    },
    {
        name='solid-fuel-from-petroleum-gas',
        tech='oil-processing'
    },
    {
        name='coal-liquefaction',
        tech='coal-liquefaction'
    },
    {
        name='sulfur',
        tech='sulfur-processing'
    },
    {
        name='sulfuric-acid',
        tech='sulfur-processing'
    },
    {
        name='lubricant',
        tech='lubricant'
    },
    {
        name='plastic-bar',
        tech='plastics'
    },
    {
        name='battery',
        tech='battery'
    },
    {
        name='explosives',
        tech='explosives'
    },
    {
        name='cliff-explosives',
        tech='cliff-explosives'
    },
    {
        name='empty-barrel',
        tech='fluid-handling'
    },
    {
        name='copper-cable',
        tech='automation'
    },
    {
        name='iron-stick',
        tech='automation'
    },
    {
        name='iron-gear-wheel',
        tech='automation'
    },
    {
        name='pipe',
        tech='automation'
    },
    {
        name='electronic-circuit',
        tech='automation'
    },
    {
        name='advanced-circuit',
        tech='advanced-electronics'
    },
    {
        name='processing-unit',
        tech='advanced-electronics-2'
    },
    {
        name='engine-unit',
        tech='engine'
    },
    {
        name='electric-engine-unit',
        tech='electric-engine'
    },
    {
        name='flying-robot-frame',
        tech='robotics'
    },
    {
        name='low-density-structure',
        tech='low-density-structure'
    },
    {
        name='rocket-fuel',
        tech='rocket-fuel'
    },
    {
        name='rocket-control-unit',
        tech='rocket-control-unit'
    },
    {
        name='automation-science-pack',
        tech='automation'
    },
    {
        name='logistic-science-pack',
        tech='logistic-science-pack'
    },
    {
        name='chemical-science-pack',
        tech='chemical-science-pack'
    },
    {
        name='military-science-pack',
        tech='military-science-pack'
    },
    {
        name='production-science-pack',
        tech='production-science-pack'
    },
    {
        name='utility-science-pack',
        tech='utility-science-pack'
    },
    {
        name='inserter',
        tech='automation'
    },
    {
        name='transport-belt',
        tech='automation'
    },
    {
        name='grenade',
        tech='military-2'
    },
    {
        name='firearm-magazine',
        tech='automation'
    },
    {
        name='piercing-rounds-magazine',
        tech='military-2'
    },
    {
        name='stone-wall',
        tech='stone-wall'
    },
    {
        name='rail',
        tech='railway'
    },
    {
        name='electric-furnace',
        tech='advanced-material-processing-2'
    },
    {
        name='concrete',
        tech='concrete'
    },
    {
        name='uranium-processing',
        tech='uranium-processing'
    },
    {
        name='uranium-fuel-cell',
        tech='uranium-processing'
    },
    {
        name='nuclear-fuel-reprocessing',
        tech='nuclear-fuel-reprocessing'
    },
    {
        name='kovarex-enrichment-process',
        tech='kovarex-enrichment-process'
    },
    {
        name='nuclear-fuel',
        tech='kovarex-enrichment-process'
    },
    {
        name='speed-module',
        tech='speed-module'
    },
    {
        name='speed-module-2',
        tech='speed-module-2'
    },
    {
        name='speed-module-3',
        tech='speed-module-3'
    },
    {
        name='productivity-module',
        tech='productivity-module'
    },
    {
        name='productivity-module-2',
        tech='productivity-module-2'
    },
    {
        name='productivity-module-3',
        tech='productivity-module-3'
    },
    {
        name='effectivity-module',
        tech='effectivity-module'
    },
    {
        name='effectivity-module-2',
        tech='effectivity-module-2'
    },
    {
        name='effectivity-module-3',
        tech='effectivity-module-3'
    },
    {
        name='fast-inserter',
        tech='fast-inserter'
    },
    {
        name='filter-inserter',
        tech='fast-inserter'
    },
    {
        name='long-handed-inserter',
        tech='automation'
    },
    {
        name='stack-inserter',
        tech='stack-inserter'
    },
    {
        name='stack-filter-inserter',
        tech='stack-inserter'
    },
    {
        name='uranium-rounds-magazine',
        tech='uranium-ammo'
    },
    {
        name='explosive-cannon-shell',
        tech='tank'
    },
    {
        name='artillery-shell',
        tech='artillery'
    },
    {
        name='rocket',
        tech='rocketry'
    },
    {
        name='explosive-rocket',
        tech='explosive-rocketry'
    },
}

for i=1, #recipe_list, 1 do
    if data.raw.recipe[recipe_list[i].name] ~= nil then
        for j=1, #recipe_multiplier, 1 do
            local item = table.deepcopy(data.raw.recipe[recipe_list[i].name])
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

            for _, v in pairs(data.raw.module) do
                if v.limitation and string.find(item.name, 'productivity', 1, true) then
                    table.insert(v.limitation, item.name .. '-s' .. j)
                end
            end

            item.name = item.name .. '-s' .. j

            data:extend({item})
            table.insert(data.raw.technology[recipe_list[i].tech].effects, {type='unlock-recipe', recipe=item.name})
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
    item.place_result = source.ref_name
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
