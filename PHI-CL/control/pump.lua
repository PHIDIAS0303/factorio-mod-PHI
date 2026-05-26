local main = {}

function main.recipe_hidden(event)
    local status = game.players[event.player_index].cheat_mode

    for _, v in pairs(prototypes.fluid) do
        if v.subgroup == 'fluid' then
            prototypes.recipe['super-pump-' .. v.name].hidden = status
        end
    end
end

return main
