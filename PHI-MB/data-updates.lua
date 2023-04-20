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

-- aai
if mods['aai-industry'] then
    -- industrial-furnace
    data.raw['assembling-machine']['industrial-furnace'].fast_replaceable_group = 'industrial-furnace'
    data.raw['assembling-machine']['industrial-furnace-2'].fast_replaceable_group = data.raw['assembling-machine']['industrial-furnace'].fast_replaceable_group
    data.raw['assembling-machine']['industrial-furnace-3'].fast_replaceable_group = data.raw['assembling-machine']['industrial-furnace-2'].fast_replaceable_group

    data.raw['assembling-machine']['fuel-processor'].fast_replaceable_group = 'fuel-processor'
    data.raw['assembling-machine']['fuel-processor-2'].fast_replaceable_group = data.raw['assembling-machine']['fuel-processor'].fast_replaceable_group
    data.raw['assembling-machine']['fuel-processor-3'].fast_replaceable_group = data.raw['assembling-machine']['fuel-processor-2'].fast_replaceable_group
end

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

    -- casting machine
    data.raw['assembling-machine']['se-casting-machine'].fast_replaceable_group  = 'casting-machine'
    data.raw['assembling-machine']['se-casting-machine-2'].fast_replaceable_group = data.raw['assembling-machine']['se-casting-machine'].fast_replaceable_group
    data.raw['assembling-machine']['se-casting-machine-3'].fast_replaceable_group = data.raw['assembling-machine']['se-casting-machine-2'].fast_replaceable_group
end
