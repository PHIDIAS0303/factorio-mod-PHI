local function clock_display(sec)
	local sym = ''

	if sec < 0 then
		sec = math.abs(sec)
		sym = '- '
	end

	local s = math.floor(sec) % 60
	local m = math.floor(sec / 60) % 60

	if sec > 3599 then
		local h = math.floor(sec / 3600)
		return sym .. string.format('%d:%02d:%02d', h, m, s)
	else
		return sym .. string.format('%d:%02d', m, s)
	end
end

script.on_nth_tick(60, function(event)
    clock_display(math.floor(game.tick / 60))

	for _, player in pairs(game.connected_players) do
        if player.gui.top.phi_clock == nil then
            player.gui.top.add{type='button', name='phi_clock'}
        end

        player.gui.top.phi_clock.caption = clock_display(sec)
    end
end)
