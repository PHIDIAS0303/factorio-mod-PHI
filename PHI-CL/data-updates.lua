local items = require 'config'
local main = require 'main'
local file_stage = 2

if mods['space-age'] then
    if settings.startup['PHI-CT'].value then
        if settings.startup['PHI-CT-HIDDEN'].value then
            data.raw.recipe['turbo-loader'].hidden = false
            table.insert(data.raw.technology['turbo-transport-belt'].effects, {type='unlock-recipe', recipe='turbo-loader'})
        end

        if not settings.startup['PHI-CT-SPOIL'].value then
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
                localised_name = {'phi-cl.combine', data.raw['item']['spoilage'].localised_name, ''}
            }})

            table.insert(data.raw.technology['agriculture'].effects, {type='unlock-recipe', recipe='spoilage-from-nutrients'})
        end

        if settings.startup['PHI-CT-SA'].value then
            data:extend({{
                type = 'recipe',
                name = 'cliff-explosives-o',
                energy_required = 1,
                enabled = false,
                ingredients = {
                    {type='item', name='explosives', amount=10},
                    {type='item', name='grenade', amount=1},
                    {type='item', name='barrel', amount=1}
                },
                results = {{type='item', name='cliff-explosives', amount=1}},
                main_product = 'cliff-explosives',
                localised_name = data.raw['recipe']['cliff-explosives'].localised_name
            }})

            table.insert(data.raw.technology['cliff-explosives'].effects, {type='unlock-recipe', recipe='cliff-explosives-o'})
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
