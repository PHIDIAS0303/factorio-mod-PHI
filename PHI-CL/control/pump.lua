local main = {}

function main.recipe_hidden(event)
    local status = game.players[event.player_index].cheat_mode
    local force = game.players[event.player_index].force

    for _, v in pairs(prototypes.fluid) do
        if v.subgroup == 'fluid' then
            force.recipes['super-pump-' .. v.name].enabled = status
        end
    end
end

return main
