local items = require 'config'
local main = require 'main'
local file_stage = 2


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

            main.EL(v)
        end
    end
end
if items['item']['nuclear-reactor'].enabled then
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
        data.raw['offshore-pump']['seafloor-pump'].max_health = 400
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
