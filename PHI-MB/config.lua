local items = {
    ['setting'] = {
        ['PHI-MB-ASSEMBLING-TIER'] = {
            type = 'max',
            effect = {'assembling-machine'}
        },
        ['PHI-MB-FURNACE-TIER'] = {
            type = 'max',
            effect = {'electric-furnace', 'electric-filter-furnace', 'industrial-furnace'}
        },
        ['PHI-MB-OIL-TIER'] = {
            type = 'max',
            effect = {'oil-refinery', 'chemical-plant', 'fuel-processor', 'se-fuel-refinery'}
        },
        ['PHI-MB-CENTRIFUGE-TIER'] = {
            type = 'max',
            effect = {'centrifuge'}
        },
        ['PHI-MB-LAB-TIER'] = {
            type = 'max',
            effect = {'lab'}
        },
        ['PHI-MB-MINING-TIER'] = {
            type = 'max',
            effect = {'electric-mining-drill', 'pumpjack', 'area-mining-drill'}
        },
        ['PHI-MB-SE-ASSEMBLING-TIER'] = {
            type = 'max',
            effect = {'se-space-assembling-machine', 'se-space-manufactory', 'se-casting-machine', 'se-pulveriser', 'se-lifesupport-facility'}
        }
    },
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
    },
    ['electric-mining-drill'] = {
        enabled = true,
        stage = 1,
        type = 'mining-drill',
        name = 'electric-mining-drill',
        ref_name = 'electric-mining-drill',
        tech = 'automation',
        min = 2,
        max = 3
    },
    ['pumpjack'] = {
        enabled = true,
        stage = 1,
        type = 'mining-drill',
        name = 'pumpjack',
        ref_name = 'pumpjack',
        tech = 'automation',
        min = 2,
        max = 3
    }
}

if mods ~= nil then
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

        items['area-mining-drill'] = {
            enabled = true,
            stage = 2,
            type = 'mining-drill',
            name = 'area-mining-drill',
            ref_name = 'area-mining-drill',
            tech = 'area-mining-drill',
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

    if mods['Atomic_Overhaul'] then
        items['centrifuge'].stage = 2
    end
end

return items