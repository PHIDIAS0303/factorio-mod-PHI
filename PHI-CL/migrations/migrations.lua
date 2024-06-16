local items = require '__PHI-CL__/config'

for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    for _, v in pairs(items['item']) do
        if v.enabled then
            if (v.tech == 'compound-energy') then
                for j=v.min, v.max, 1 do
                    if technologies['compound-energy-' .. j] ~= nil then
                        if technologies['compound-energy-' .. j].researched then
                            if recipes[v.name .. '-' .. j] ~= nil then
                                recipes[v.name .. '-' .. j].enabled = true
                                recipes[v.name .. '-' .. j].reload()
                            end
                        end
                    end
                end

            else
                if technologies[v.tech] then
                    if technologies[v.tech].researched then
                        if string.find(v.type, '-equipment') then
                            for j=v.min, v.max, 1 do
                                if recipes[v.name .. '-mk' .. j .. '-equipment'] then
                                    recipes[v.name .. '-mk' .. j .. '-equipment'].enabled = true
                                    recipes[v.name .. '-mk' .. j .. '-equipment'].reload()
                                end
                            end

                        else
                            for j=v.min, v.max, 1 do
                                if recipes[v.name .. '-' .. j] then
                                    recipes[v.name .. '-' .. j].enabled = true
                                    recipes[v.name .. '-' .. j].reload()
                                end
                            end
                        end

                        if v.type == 'ammo-turret' or v.type == 'fluid-turret' then
                            for i=1, #items['research_modifier'][v.type], 1 do
                                for j=1, #data.raw.technology[items['research_modifier'][v.type][i]].effects, 1 do
                                    if (data.raw.technology[items['research_modifier'][v.type][i]].effects[j].type == 'turret-attack') then
                                        if (data.raw.technology[items['research_modifier'][v.type][i]].effects[j].turret_id == v.ref_name) then
                                            for j=v.min, v.max, 1 do
                                                table.insert(data.raw.technology[items['research_modifier'][v.type][i]].effects, {type='turret-attack', turret_id=v.name .. '-' .. j, modifier=data.raw.technology[items['research_modifier'][v.type][i]].effects[j].modifier})
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if technologies['power-armor-mk2'].researched and settings.startup['PHI-EQ-ARMOR'].value then
        recipes['power-armor-mk3'].enabled = true
        recipes['power-armor-mk3'].reload()
    end
end
