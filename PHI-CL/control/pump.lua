local main = {}

function main.recipe_hidden(event)
    local status = game.players[event.player_index].cheat_mode
    local recipe = game.players[event.player_index].force.recipes

    for _, v in pairs(prototypes.fluid) do
        local fn = 'super-pump-' .. v.name

        if recipe[fn] then
            recipe[fn].enabled = status
        end
    end
end

return main
