local items = {
    ['setting'] = {
        ['PHI-MB-ASSEMBLING-TIER'] = {
            type = 'max',
            effect = {
                'assembling-machine'
            }
        },
        ['PHI-MB-FURNACE-TIER'] = {
            type = 'max',
            effect = {
                'electric-furnace',
                'electric-filter-furnace',
                'industrial-furnace'
                }
        },
        ['PHI-MB-OIL-TIER'] = {
            type = 'max',
            effect = {
                'oil-refinery',
                'chemical-plant',
                'fuel-processor',
                'se-fuel-refinery'
                }
        },
        ['PHI-MB-CENTRIFUGE-TIER'] = {
            type = 'max',
            effect = {
                'centrifuge'
                }
        },
        ['PHI-MB-LAB-TIER'] = {
            type = 'max',
            effect = {
                'lab',
                'se-space-science-lab'
                }
        },
        ['PHI-MB-MINING-TIER'] = {
            type = 'max',
            effect = {
                'electric-mining-drill',
                'pumpjack',
                'area-mining-drill',
                'se-core-miner'
                }
        },
        ['PHI-MB-SE-ASSEMBLING-TIER'] = {
            type = 'max',
            effect = {
                'se-space-assembling-machine',
                'se-space-manufactory', 
                'se-casting-machine',
                'se-pulveriser',
                'se-lifesupport-facility',
                'se-space-decontamination-facility',
                'se-space-genetics-facility',
                'se-space-growth-facility',
                'se-space-biochemical-laboratory',
                'se-space-radiation-laboratory',
                'se-space-electromagnetics-laboratory',
                'se-space-laser-laboratory',
                'se-space-material-fabricator',
                'se-space-particle-accelerator',
                'se-space-particle-collider',
                'se-space-plasma-generator',
                'se-space-hypercooler',
                'se-space-astrometrics-laboratory',
                'se-space-gravimetrics-laboratory',
                'se-space-telescope',
                'se-space-telescope-gammaray',
                'se-space-telescope-microwave',
                'se-space-telescope-radio',
                'se-space-telescope-xray',
                'se-space-mechanical-laboratory'
                }
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

        items['se-core-miner-drill'] = {
            enabled = false,
            stage = 2,
            type = 'mining-drill',
            name = 'se-core-miner-drill',
            ref_name = 'se-core-miner-drill',
            tech = 'se-core-miner',
            min = 2,
            max = 3
        }

        items['se-space-decontamination-facility'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-decontamination-facility',
            ref_name = 'se-space-decontamination-facility',
            tech = 'se-space-decontamination-facility',
            min = 2,
            max = 3
        }

        items['se-space-genetics-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-genetics-laboratory',
            ref_name = 'se-space-genetics-laboratory',
            tech = 'se-space-genetics-laboratory',
            min = 2,
            max = 3
        }

        items['se-space-growth-facility'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-growth-facility',
            ref_name = 'se-space-growth-facility',
            tech = 'se-space-growth-facility',
            min = 2,
            max = 3
        }

        items['se-space-biochemical-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-biochemical-laboratory',
            ref_name = 'se-space-biochemical-laboratory',
            tech = 'se-space-biochemical-laboratory',
            min = 2,
            max = 3
        }

        items['se-space-radiation-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-radiation-laboratory',
            ref_name = 'se-space-radiation-laboratory',
            tech = 'se-space-radiation-laboratory',
            min = 2,
            max = 3
        }

        items['se-space-electromagnetics-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-electromagnetics-laboratory',
            ref_name = 'se-space-electromagnetics-laboratory',
            tech = 'se-space-electromagnetics-laboratory',
            min = 2,
            max = 3
        }

        items['se-space-laser-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-laser-laboratory',
            ref_name = 'se-space-laser-laboratory',
            tech = 'se-space-laser-laboratory',
            min = 2,
            max = 3
        }

        items['se-space-astrometrics-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-astrometrics-laboratory',
            ref_name = 'se-space-astrometrics-laboratory',
            tech = 'se-space-astrometrics-laboratory',
            min = 2,
            max = 3
        }

        items['se-space-gravimetrics-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-gravimetrics-laboratory',
            ref_name = 'se-space-gravimetrics-laboratory',
            tech = 'se-space-gravimetrics-laboratory',
            min = 2,
            max = 3
        }

        items['se-space-mechanical-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-mechanical-laboratory',
            ref_name = 'se-space-mechanical-laboratory',
            tech = 'se-space-mechanical-laboratory',
            min = 2,
            max = 3
        }

        items['se-space-material-fabricator'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-material-fabricator',
            ref_name = 'se-space-material-fabricator',
            tech = 'se-space-material-fabricator',
            min = 2,
            max = 3
        }

        items['se-space-particle-accelerator'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-particle-accelerator',
            ref_name = 'se-space-particle-accelerator',
            tech = 'se-space-particle-accelerator',
            min = 2,
            max = 3
        }

        items['se-space-particle-collider'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-particle-collider',
            ref_name = 'se-space-particle-collider',
            tech = 'se-space-particle-collider',
            min = 2,
            max = 3
        }

        items['se-space-plasma-generator'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-plasma-generator',
            ref_name = 'se-space-plasma-generator',
            tech = 'se-space-plasma-generator',
            min = 2,
            max = 3
        }

        items['se-space-hypercooler'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-hypercooler',
            ref_name = 'se-space-hypercooler',
            tech = 'se-space-hypercooling-1',
            min = 2,
            max = 3
        }

        items['se-space-radiator'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-radiator',
            ref_name = 'se-space-radiator-2',
            tech = 'se-space-radiator-2',
            min = 3,
            max = 4
        }

        items['se-space-telescope'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope',
            ref_name = 'se-space-telescope',
            tech = 'se-space-telescope',
            min = 2,
            max = 3
        }

        items['se-space-telescope-gammaray'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-gammaray',
            ref_name = 'se-space-telescope-gammaray',
            tech = 'se-space-telescope-gammaray',
            min = 2,
            max = 3
        }

        items['se-space-telescope-microwave'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-microwave',
            ref_name = 'se-space-telescope-microwave',
            tech = 'se-space-telescope-microwave',
            min = 2,
            max = 3
        }

        items['se-space-telescope-radio'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-radio',
            ref_name = 'se-space-telescope-radio',
            tech = 'se-space-telescope-radio',
            min = 2,
            max = 3
        }

        items['se-space-telescope-xray'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-xray',
            ref_name = 'se-space-telescope-xray',
            tech = 'se-space-telescope-xray',
            min = 2,
            max = 3
        }

        items['se-space-science-lab'] = {
            enabled = true,
            stage = 2,
            type = 'lab',
            name = 'se-space-science-lab',
            ref_name = 'se-space-science-lab',
            tech = 'se-space-science-lab',
            min = 2,
            max = 3
        }
    end

    if mods['Atomic_Overhaul'] then
        items['centrifuge'].stage = 2
    end
end

return items