-- assembling-machine
data.raw['assembling-machine']['assembling-machine-4'].fast_replaceable_group = data.raw['assembling-machine']['assembling-machine-3'].fast_replaceable_group
data.raw['assembling-machine']['assembling-machine-5'].fast_replaceable_group = data.raw['assembling-machine']['assembling-machine-4'].fast_replaceable_group

-- electric-furnace
data.raw['furnace']['electric-furnace'].fast_replaceable_group = 'electric-furnace'
data.raw['furnace']['electric-furnace-2'].fast_replaceable_group = data.raw['furnace']['electric-furnace'].fast_replaceable_group
data.raw['furnace']['electric-furnace-3'].fast_replaceable_group = data.raw['furnace']['electric-furnace-2'].fast_replaceable_group

-- chemical-plant
data.raw['assembling-machine']['chemical-plant'].fast_replaceable_group = 'chemical-plant'
data.raw['assembling-machine']['chemical-plant-2'].fast_replaceable_group = data.raw['assembling-machine']['chemical-plant'].fast_replaceable_group
data.raw['assembling-machine']['chemical-plant-3'].fast_replaceable_group = data.raw['assembling-machine']['chemical-plant-2'].fast_replaceable_group

-- oil-refinery
data.raw['assembling-machine']['oil-refinery'].fast_replaceable_group = 'oil-refinery'
data.raw['assembling-machine']['oil-refinery-2'].fast_replaceable_group = data.raw['assembling-machine']['oil-refinery'].fast_replaceable_group
data.raw['assembling-machine']['oil-refinery-3'].fast_replaceable_group = data.raw['assembling-machine']['oil-refinery-2'].fast_replaceable_group

-- centrifuge
data.raw['assembling-machine']['centrifuge'].fast_replaceable_group = 'centrifuge'
data.raw['assembling-machine']['centrifuge-2'].fast_replaceable_group = data.raw['assembling-machine']['centrifuge'].fast_replaceable_group
data.raw['assembling-machine']['centrifuge-3'].fast_replaceable_group = data.raw['assembling-machine']['centrifuge-2'].fast_replaceable_group

-- lab
data.raw['lab']['lab'].fast_replaceable_group = 'lab'
data.raw['lab']['lab-2'].fast_replaceable_group = data.raw['lab']['lab'].fast_replaceable_group
data.raw['lab']['lab-3'].fast_replaceable_group = data.raw['lab']['lab-2'].fast_replaceable_group

-- se
if mods['space-exploration'] then
    -- space-assembling-machine
    data.raw['assembling-machine']['se-space-assembling-machine'].fast_replaceable_group  = 'space-assembling-machine'
    data.raw['assembling-machine']['se-space-assembling-machine-2'].fast_replaceable_group = data.raw['assembling-machine']['se-space-assembling-machine'].fast_replaceable_group
    data.raw['assembling-machine']['se-space-assembling-machine-3'].fast_replaceable_group = data.raw['assembling-machine']['se-space-assembling-machine-2'].fast_replaceable_group
    
    -- space-manufactory
    data.raw['assembling-machine']['se-space-manufactory'].fast_replaceable_group  = 'space-manufactory'
    data.raw['assembling-machine']['se-space-manufactory-2'].fast_replaceable_group = data.raw['assembling-machine']['se-space-manufactory'].fast_replaceable_group
    data.raw['assembling-machine']['se-space-manufactory-3'].fast_replaceable_group = data.raw['assembling-machine']['se-space-manufactory-2'].fast_replaceable_group
end
