local items = {
    ['assembling-machine'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'assembling-machine',
        ref_name = 'assembling-machine-3',
        tech = 'automation-3',
        min = 4,
        max = 5
    },
    ['electric-furnace'] = {
        enabled = true,
        type = 'furnace',
        new_type = nil,
        name = 'electric-furnace',
        ref_name = 'electric-furnace',
        tech = 'advanced-material-processing-2',
        min = 2,
        max = 3
    },
    ['oil-refinery'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'oil-refinery',
        ref_name = 'oil-refinery',
        tech = 'oil-processing',
        min = 2,
        max = 3
    },
    ['chemical-plant'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'chemical-plant',
        ref_name = 'chemical-plant',
        tech = 'oil-processing',
        min = 2,
        max = 3
    },
    ['centrifuge'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'centrifuge',
        ref_name = 'centrifuge',
        tech = 'uranium-processing',
        min = 2,
        max = 3
    },
    ['lab'] = {
        enabled = true,
        type = 'lab',
        new_type = nil,
        name = 'lab',
        ref_name = 'lab',
        tech = 'automation',
        min = 2,
        max = 3
    }
}

if mods['PHI-RS'] then
    items['electric-filter-furnace'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = 'assembling-machine',
        name = 'electric-filter-furnace',
        ref_name = 'electric-furnace',
        tech = 'advanced-material-processing-2',
        min = 2,
        max = 3
    }
end

if mods['aai-industry'] then
    items['industrial-furnace'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'industrial-furnace',
        ref_name = 'industrial-furnace',
        tech = 'automation-3',
        min = 2,
        max = 3
    }

    items['fuel-processor'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'fuel-processor',
        ref_name = 'fuel-processor',
        tech = 'automation',
        min = 2,
        max = 3
    }
end

if mods['space-exploration'] then
    items['se-space-assembling-machine'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'se-space-assembling-machine',
        ref_name = 'se-space-assembling-machine',
        tech = 'automation-3',
        min = 2,
        max = 3
    }

    items['se-space-manufactory'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'se-space-manufactory',
        ref_name = 'se-space-manufactory',
        tech = 'automation-3',
        min = 2,
        max = 3
    }

    items['se-casting-machine'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'se-casting-machine',
        ref_name = 'se-casting-machine',
        tech = 'automation-3',
        min = 2,
        max = 3
    }

    items['se-pulveriser'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'se-pulveriser',
        ref_name = 'se-pulveriser',
        tech = 'automation-2',
        min = 2,
        max = 3
    }

    items['se-lifesupport-facility'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'se-lifesupport-facility',
        ref_name = 'se-lifesupport-facility',
        tech = 'automation-2',
        min = 2,
        max = 3
    }

    items['se-fuel-refinery'] = {
        enabled = true,
        type = 'assembling-machine',
        new_type = nil,
        name = 'se-fuel-refinery',
        ref_name = 'se-fuel-refinery',
        tech = 'automation',
        min = 2,
        max = 3
    }
end

return items