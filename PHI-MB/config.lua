local items = {
    ['assembling-machine'] = {
        enabled = true,
        stage = 1,
        type = 'assembling-machine',
        name = 'assembling-machine',
        ref_name = 'assembling-machine-3',
        tech = 'automation-3',
        min = 4,
        max = 5
    },
    ['electric-furnace'] = {
        enabled = true,
        stage = 1,
        type = 'furnace',
        name = 'electric-furnace',
        ref_name = 'electric-furnace',
        tech = 'advanced-material-processing-2',
        min = 2,
        max = 3
    },
    ['oil-refinery'] = {
        enabled = true,
        stage = 1,
        type = 'assembling-machine',
        name = 'oil-refinery',
        ref_name = 'oil-refinery',
        tech = 'oil-processing',
        min = 2,
        max = 3
    },
    ['chemical-plant'] = {
        enabled = true,
        stage = 1,
        type = 'assembling-machine',
        name = 'chemical-plant',
        ref_name = 'chemical-plant',
        tech = 'oil-processing',
        min = 2,
        max = 3
    },
    ['centrifuge'] = {
        enabled = true,
        stage = 1,
        type = 'assembling-machine',
        name = 'centrifuge',
        ref_name = 'centrifuge',
        tech = 'uranium-processing',
        min = 2,
        max = 3
    },
    ['lab'] = {
        enabled = true,
        stage = 1,
        type = 'lab',
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
        stage = 2,
        type = 'assembling-machine',
        name = 'electric-filter-furnace',
        ref_name = 'electric-filter-furnace',
        tech = 'advanced-material-processing-2',
        min = 2,
        max = 3
    }
end

if mods['aai-industry'] then
    items['industrial-furnace'] = {
        enabled = true,
        stage = 2,
        type = 'assembling-machine',
        name = 'industrial-furnace',
        ref_name = 'industrial-furnace',
        tech = 'industrial-furnace',
        min = 2,
        max = 3
    }

    items['fuel-processor'] = {
        enabled = true,
        stage = 2,
        type = 'assembling-machine',
        name = 'fuel-processor',
        ref_name = 'fuel-processor',
        tech = 'fuel-processing',
        min = 2,
        max = 3
    }
end

if mods['space-exploration'] then
    items['se-space-assembling-machine'] = {
        enabled = true,
        stage = 2,
        type = 'assembling-machine',
        name = 'se-space-assembling-machine',
        ref_name = 'se-space-assembling-machine',
        tech = 'se-space-assembling',
        min = 2,
        max = 3
    }

    items['se-space-manufactory'] = {
        enabled = true,
        stage = 2,
        type = 'assembling-machine',
        name = 'se-space-manufactory',
        ref_name = 'se-space-manufactory',
        tech = 'se-space-manufactory',
        min = 2,
        max = 3
    }

    items['se-casting-machine'] = {
        enabled = true,
        stage = 2,
        type = 'assembling-machine',
        name = 'se-casting-machine',
        ref_name = 'se-casting-machine',
        tech = 'se-pyroflux-smelting',
        min = 2,
        max = 3
    }

    items['se-pulveriser'] = {
        enabled = true,
        stage = 2,
        type = 'assembling-machine',
        name = 'se-pulveriser',
        ref_name = 'se-pulveriser',
        tech = 'se-pulveriser',
        min = 2,
        max = 3
    }

    items['se-lifesupport-facility'] = {
        enabled = true,
        stage = 2,
        type = 'assembling-machine',
        name = 'se-lifesupport-facility',
        ref_name = 'se-lifesupport-facility',
        tech = 'se-lifesupport-facility',
        min = 2,
        max = 3
    }

    items['se-fuel-refinery'] = {
        enabled = true,
        stage = 2,
        type = 'assembling-machine',
        name = 'se-fuel-refinery',
        ref_name = 'se-fuel-refinery',
        tech = 'se-fuel-refining',
        min = 2,
        max = 3
    }
end

return items