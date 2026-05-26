local main = {}

function main.recipe_hidden(event)
    local status = (event.name ~= defines.events.on_player_cheat_mode_enabled)

    for _, v in pairs(prototypes.fluid) do
        if v.subgroup == 'fluid' then
            prototypes.recipe['super-pump-' .. v.name].hidden = status
        end
    end
end

return main
