data.raw['offshore-pump']['offshore-pump'].pumping_speed = 100
data.raw['offshore-pump']['offshore-pump'].fluid_box.base_area = 5
data.raw['offshore-pump']['offshore-pump'].fluid_box.base_level = 5
data.raw['offshore-pump']['offshore-pump'].flags = {'placeable-neutral', 'player-creation'}
data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_box = {{-0.5, -0.25}, {0.5, 0.25}}
data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
data.raw['offshore-pump']['offshore-pump'].adjacent_tile_collision_mask = nil
data.raw['offshore-pump']['offshore-pump'].placeable_position_visualization = nil

if mods['angelsrefining'] then
    data.raw['offshore-pump']['seafloor-pump'].pumping_speed = 25
    data.raw['offshore-pump']['seafloor-pump'].fluid_box.base_area = 5
    data.raw['offshore-pump']['seafloor-pump'].fluid_box.base_level = 5
    data.raw['offshore-pump']['seafloor-pump'].flags = {'placeable-neutral', 'player-creation', 'filter-directions'}
    data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_box = {{-2, -3}, {2, -2}}
    data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_test = {'ground-tile', 'water-tile', 'object-layer'}
    data.raw['offshore-pump']['seafloor-pump'].adjacent_tile_collision_mask = nil
    data.raw['offshore-pump']['seafloor-pump'].placeable_position_visualization = nil
    data.raw['offshore-pump']['seafloor-pump'].max_health = 400
end
