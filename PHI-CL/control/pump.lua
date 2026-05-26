local main = {}

function main.recipe_hidden(event)
    local hidden = (event.name == defines.events.on_player_cheat_mode_enabled and false) or true

    for _, v in pairs(prototypes.fluid) do
        if v.subgroup == 'super-pump-fluid' then
            prototypes.recipe['super-pump-' .. v.name].hidden = hidden
        end
    end
end

return main
