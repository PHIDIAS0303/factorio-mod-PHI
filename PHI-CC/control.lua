script.on_init(function()
    if global.phi == nil then
        global.phi = {}
    end

    global.phi.cc = {}
    global.phi.gui = {}
end)

script.on_event(defines.events.on_player_created, function(event)
    global.phi.cc.gui[event.player.index] = {controls_active = true}

    local player = game.get_player(event.player_index)

    local screen_element = player.gui.screen
    local main_frame = screen_element.add{type='frame', name='ugg_main_frame', caption={'ugg.hello_world'}}
    main_frame.style.size = {385, 165}
    main_frame.auto_center = true

    local content_frame = main_frame.add{type='frame', name='content_frame', direction='vertical', style='ugg_content_frame'}
    local controls_flow = content_frame.add{type='flow', name='controls_flow', direction='horizontal', style='ugg_controls_flow'}

    controls_flow.add{type='button', name='ugg_controls_toggle', caption={'ugg.deactivate'}}
end)
