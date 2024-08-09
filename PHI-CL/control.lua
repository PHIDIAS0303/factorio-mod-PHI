local items = require 'config'

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

local function trash_creation(event)
    local entity = event.created_entity or event.entity

    if not entity then
        return
    end

    if not entity.valid then
        return
    end

    if entity.name == 'trash-chest' then
        entity.infinity_container_filters = {}
        entity.remove_unfiltered_items = true

    elseif entity.name == 'trash-pipe' then
        entity.set_infinity_pipe_filter(nil)
    end
end

local function trash_check()
    for _, surface in pairs(game.surfaces) do
        for _, e in pairs(surface.find_entities_filtered{name='trash-chest'}) do
            e.infinity_container_filters = {}
            e.remove_unfiltered_items = true
        end

        for _, e in pairs(surface.find_entities_filtered{name='trash-pipe'}) do
            e.set_infinity_pipe_filter(nil)
        end
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
    commands.add_command('phi-pb-bonus', nil, function(command)
        local player

        if command.player_index then
            player = game.get_player(command.player_index)

        else
            game.print('Command Error')
            return
        end

        local bonus = tonumber(command.parameter)

        if type(bonus) ~= 'number' then
            player.print('Parameter need to be number')
            return
        end

        if (bonus < 0) or (bonus > 10) then
            player.print('Parameter need to be in range of 0 - 10')
            return
        end

        for k, v in pairs(items['bonus']['player_bonus']) do
            game.players[command.player_index][k] = bonus / 10 * v.value

            if v.combined_bonus then
                for i=1, #v.combined_bonus, 1 do
                    game.players[command.player_index][v.combined_bonus[i]] = bonus / 10 * v.value
                end
            end
        end
    end)

    script.on_event(defines.events.on_player_died, function(event)
        game.players[event.player_index].ticks_to_respawn = 120
    end)
end

-- {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}}
if settings.startup['PHI-CT'].value then
    if settings.startup['PHI-CT-TRASH'].value then
        script.on_init(trash_check)
        script.on_event(defines.events.on_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
        script.on_event(defines.events.on_robot_built_entity, trash_creation, {{filter='name', name='trash-chest', mode='or'}, {filter='name', name='trash-pipe', mode='or'}})
        script.on_event(defines.events.script_raised_built, trash_creation)
        script.on_event(defines.events.script_raised_revive, trash_creation)
    end
end
