local param = require 'config'

-- MIGS A 1 BASE ENTITY,ITEM,RECIPE
-- MIGS A 9 BASE RESEARCH_EFFECT
-- MIGS A 15 SPACE_AGE RESEARCH_EFFECT
if data.raw['constant-combinator']['constant-combinator'] then
    local item = table.deepcopy(data.raw['item']['constant-combinator'])
    item.name = 'super-combinator'
    item.place_result = item.name
    item.order = 'c[combinators]-e[super-combinator]'
    item.icons = {{icon = '__base__/graphics/icons/constant-combinator.png', tint = param['tint'][2], icon_size = 64, icon_mipmaps = 4}}
    item.icon = nil
    item.icon_size = nil
    item.icon_mipmaps = nil
    item.localised_name = {'', {'name.super-entity'}, {'entity-name.constant-combinator'}}
    data:extend({item})

    local entity = table.deepcopy(data.raw['constant-combinator']['constant-combinator'])
    entity.name = item.name
    entity.minable.result = item.name
    entity.localised_name = {'', {'name.super-entity'}, {'entity-name.constant-combinator'}}
    data:extend({entity})

    data:extend({{
        type = 'recipe',
        name = item.name,
        energy_required = 2,
        enabled = true,
        ingredients = {{type = 'item', name = 'electronic-circuit', amount = 5}, {type = 'item', name = 'copper-cable', amount = 5}},
        results = {{type = 'item', name = item.name, amount = 1}},
        main_product = item.name,
        localised_name = {'', {'name.super-entity'}, {'entity-name.constant-combinator'}}
    }})

    local s = {}

    for _, v in pairs(data.raw['technology']) do
        local raw_name = v.name:gsub('-%d+$', '')

        if (v.max_level and v.max_level == 'infinite') and v.hidden ~= true then
            table.insert(s, {
                type = 'virtual-signal',
                name = 'signal-' .. v.name,
                icon = (v.icon and v.icon) or (v.icons and v.icons[1].icon),
                icon_size = ((v.icons and v.icons[1].icon_size and v.icons[1].icon_size) or (v.icon_size and v.icon_size)) or 64,
                subgroup = 'pictographs',
                order = 'z[technology]-[' .. v.name .. ']',
                localised_name = {'?', {'technology-name.' .. raw_name}, {'entity-name.' .. raw_name}}
            })
        end
    end

    if #s > 0 then
        data:extend(s)
    end
end
