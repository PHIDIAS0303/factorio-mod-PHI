local recipe_multiplier = {4, 8}
local recipe_display = {true, false}

local recipe_list = {
    {
        name='iron-plate',
        tech=nil
    },
    {
        name='copper-plate',
        tech=nil
    },
    {
        name='stone-brick',
        tech=nil
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
        tech=nil
    },
    {
        name='iron-stick',
        tech=nil
    },
    {
        name='iron-gear-wheel',
        tech=nil
    },
    {
        name='pipe',
        tech=nil
    },
    {
        name='electronic-circuit',
        tech=nil
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
        tech=nil
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
        tech=nil
    },
    {
        name='transport-belt',
        tech=nil
    },
    {
        name='grenade',
        tech='military-2'
    },
    {
        name='firearm-magazine',
        tech=nil
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

    'speed-module',
    'speed-module-2',
    'speed-module-3',
    'productivity-module',
    'productivity-module-2',
    'productivity-module-3',
    'effectivity-module',
    'effectivity-module-2',
    'effectivity-module-3',

    'fast-inserter',
    'long-handed-inserter',
    'filter-inserter',
    'stack-inserter',
    'stack-filter-inserter',

    'underground-belt',
    'fast-transport-belt',
    'fast-underground-belt',
    'fast-splitter',
    --'express-transport-belt',
    --'express-underground-belt',
    --'express-splitter',

    'uranium-rounds-magazine',
    'explosive-cannon-shell',
    'artillery-shell',
    'rocket',
    'explosive-rocket'
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
            
            item.name = item.name .. '-' .. j
            
            if recipe_list[i].tech ~= nil then
                data:extend({item})
                table.insert(data.raw.technology[recipe_list[i].tech].effects, {type='unlock-recipe', recipe=item.name})
            else
                item.enabled = true
                data:extend({item})
            end
        end
    end
end
