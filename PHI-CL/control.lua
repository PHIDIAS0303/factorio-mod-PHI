local items = require 'config'
local main = require 'main'

local function clock_display(sec)
	local s = math.floor(sec) % 60
	local m = math.floor(sec / 60) % 60

	if sec > 3599 then
		local h = math.floor(sec / 3600)
		return string.format('%d:%02d:%02d', h, m, s)
	else
		return string.format('%d:%02d', m, s)
	end
end

if settings.startup['PHI-XC'].value then
    script.on_nth_tick(60, function(event)
        for _, player in pairs(game.connected_players) do
            if player.gui.top.phi_clock == nil then
                player.gui.top.add{type='button', name='phi_clock'}
            end

            player.gui.top.phi_clock.caption = clock_display(math.floor(event.tick / 60))
        end
    end)
end

if settings.startup['PHI-PB'].value then
    commands.add_command('bonus', nil, function(command)
        local player

        if command.player_index then
            player = game.get_player(command.player_index)

        else
            game.print('Command Error')
            return
        end

        if type(command.parameter) ~= 'number' then
            player.print('Parameter need to be number')
            return
        end

        local bonus = tonumber(command.parameter)

        if (bonus < 0) or (bonus > 10) then
            player.print('Parameter need to be in range of 0 - 10')
            return
        end

        for _, v in pairs(items['bonus']['player_bonus']) do
            if v.enabled then
                game.players[command.player_index][v.name] = game.players[command.player_index][v.name] + (bonus / 10 * v.value)
            end
        end

        if (bonus > 0) then
            if (player.character) then
                player.ticks_to_respawn = 120
            end
        end
    end)
end
