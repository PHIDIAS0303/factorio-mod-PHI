local config = require 'config'

script.on_event(defines.events.on_player_created, function(event)
    if event.player_index == 1 then
        for k, v in pairs(config) do
            if (v.enabled) then
                game.forces.player[k] = game.forces.player[k] + v.val
            end
        end
    end
end)

script.on_event(defines.events.on_player_died, function(event)
    local player = game.players[event.player_index]

	if (player.character) then
        player.ticks_to_respawn = 120
	end
end)
