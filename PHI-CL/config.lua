local items = {
    ['setting'] = {
        ['PHI-EN'] = {
            type = 'enabled',
            effect = {
                'solar-panel',
                'accumulator',
                'boiler',
                'steam-engine',
                'nuclear-reactor',
                'heat-pipe',
                'heat-exchanger',
                'steam-turbine'
            }
        },
        ['PHI-MB'] = {
            type = 'enabled',
            effect = {
                'assembling-machine',
                'electric-furnace',
                'electric-filter-furnace',
                'industrial-furnace',
                'oil-refinery',
                'chemical-plant',
                'fuel-processor',
                'se-fuel-refinery',
                'centrifuge',
                'lab',
                'se-space-science-lab',
                'electric-mining-drill',
                'pumpjack',
                'area-mining-drill',
                'se-core-miner',
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
        },
        ['PHI-EQ'] = {
            type = 'enabled',
            effect = {
                'solar-panel-equipment',
                'battery-equipment',
                'fusion-reactor-equipment',
                'energy-shield-equipment',
                'personal-laser-defense-equipment',
                'personal-roboport-equipment',
                'night-vision-equipment',
                'exoskeleton-equipment'
            }
        },
        ['PHI-EN-SOLAR-TIER'] = {
            type = 'max',
            effect = {
                'solar-panel',
                'accumulator'
            }
        },
        ['PHI-EN-STEAM-TIER'] = {
            type = 'max',
            effect = {
                'boiler',
                'steam-engine'
            }
        },
        ['PHI-EN-NUCLEAR-TIER'] = {
            type = 'max',
            effect = {
                'nuclear-reactor',
                'heat-pipe',
                'heat-exchanger',
                'steam-turbine'
            }
        },
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
        },
        ['PHI-WE-LASER-TIER'] = {
            type = 'max',
            effect = {
                'laser-turret'
            }
        },
        ['PHI-WE-FLAME-TIER'] = {
            type = 'max',
            effect = {
                'flamethrower-turret'
            }
        },
        ['PHI-WE-GUN-TIER'] = {
            type = 'max',
            effect = {
                'gun-turret'
        }
        },
        ['PHI-WE-RADAR-TIER'] = {
            type = 'max',
            effect = {
                'radar'
            }
        },
        ['PHI-EQ-SOLAR-TIER'] = {
            type = 'max',
            effect = {
                'solar-panel'
            }
        },
        ['PHI-EQ-BATTERY-TIER'] = {
            type = 'max',
            effect = {
                'battery'
            }
        },
        ['PHI-EQ-REACTOR-TIER'] = {
            type = 'max',
            effect = {
                'fusion-reactor'
            }
        },
        ['PHI-EQ-LASER-TIER'] = {
            type = 'max',
            effect = {
                'personal-laser-defense'
            }
        },
        ['PHI-EQ-ROBOPORT-TIER'] = {
            type = 'max',
            effect = {
                'personal-roboport'
            }
        },
        ['PHI-EQ-SHIELD-TIER'] = {
            type = 'max',
            effect = {
                'energy-shield'
            }
        },
        ['PHI-EQ-NIGHT-TIER'] = {
            type = 'max',
            effect = {
                'night-vision'
            }
        },
        ['PHI-EQ-EXO-TIER'] = {
            type = 'max',
            effect = {
                'exoskeleton'
            }
        }
    },
    ['research_modifier'] = {
        --[[
        ['electric-turret'] = {
            'energy-weapons-damage-1',
            'energy-weapons-damage-2',
            'energy-weapons-damage-3',
            'energy-weapons-damage-4',
            'energy-weapons-damage-5',
            'energy-weapons-damage-6',
            'energy-weapons-damage-7'
        },
        ]]
        ['ammo-turret'] = {
            'physical-projectile-damage-1',
            'physical-projectile-damage-2',
            'physical-projectile-damage-3',
            'physical-projectile-damage-4',
            'physical-projectile-damage-5',
            'physical-projectile-damage-6',
            'physical-projectile-damage-7'
        },
        ['fluid-turret'] = {
            'refined-flammables-1',
            'refined-flammables-2',
            'refined-flammables-3',
            'refined-flammables-4',
            'refined-flammables-5',
            'refined-flammables-6',
            'refined-flammables-7'
        }
    },
    ['item'] = {
        ['solar-panel'] = {
            enabled = true,
            stage = 1,
            type = 'solar-panel',
            name = 'solar-panel',
            ref_name = 'solar-panel',
            tech = 'compound-energy',
            min = 2,
            max = 8,
            base = 60
        },
        ['accumulator'] = {
            enabled = true,
            stage = 1,
            type = 'accumulator',
            name = 'accumulator',
            ref_name = 'accumulator',
            tech = 'compound-energy',
            min = 2,
            max = 8,
            base = 5
        },
        ['boiler'] = {
            enabled = true,
            stage = 1,
            type = 'boiler',
            name = 'boiler',
            ref_name = 'boiler',
            tech = 'compound-energy',
            min = 2,
            max = 5,
            base = 1800,
            temp = 150,
            fluid = 1
        },
        ['steam-engine'] = {
            enabled = true,
            stage = 1,
            type = 'generator',
            name = 'steam-engine',
            ref_name = 'steam-engine',
            tech = 'compound-energy',
            min = 2,
            max = 5,
            base = 150,
            fluid = 1 / 2
        },
        ['nuclear-reactor'] = {
            enabled = true,
            stage = 1,
            type = 'reactor',
            name = 'nuclear-reactor',
            ref_name = 'nuclear-reactor',
            tech = 'compound-energy',
            min = 2,
            max = 5,
            base = 40,
            bonus = 1,
            temp = 500
        },
        ['heat-pipe'] = {
            enabled = true,
            stage = 1,
            type = 'heat-pipe',
            name = 'heat-pipe',
            ref_name = 'heat-pipe',
            tech = 'compound-energy',
            min = 2,
            max = 5,
            temp = 500
        },
        ['heat-exchanger'] = {
            enabled = true,
            stage = 1,
            type = 'boiler',
            name = 'heat-exchanger',
            ref_name = 'heat-exchanger',
            tech = 'compound-energy',
            min = 2,
            max = 5,
            base = 10000,
            temp = 485,
            fluid = 103 / 60
        },
        ['steam-turbine'] = {
            enabled = true,
            stage = 1,
            type = 'generator',
            name = 'steam-turbine',
            ref_name = 'steam-turbine',
            tech = 'compound-energy',
            min = 2,
            max = 5,
            base = 485,
            fluid = 1
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
        },
        ['laser-turret'] = {
            enabled = true,
            type = 'electric-turret',
            name = 'laser-turret',
            ref_name = 'laser-turret',
            tech = 'laser-turret',
            min = 2,
            max = 3,
            range = 24
        },
        ['gun-turret'] = {
            enabled = true,
            type = 'ammo-turret',
            name = 'gun-turret',
            ref_name = 'gun-turret',
            tech = 'gun-turret',
            min = 2,
            max = 3,
            range = 18
        },
        ['flamethrower-turret'] = {
            enabled = true,
            type = 'fluid-turret',
            name = 'flamethrower-turret',
            ref_name = 'flamethrower-turret',
            tech = 'flamethrower',
            min = 2,
            max = 3,
            range = 30
        },
        ['radar'] = {
            enabled = true,
            type = 'radar',
            name = 'radar',
            ref_name = 'radar',
            tech = 'automation',
            min = 2,
            max = 3
        }
    },
    ['equipment'] = {
        ['solar-panel-equipment'] = {
            enabled = true,
            type = 'solar-panel-equipment',
            name = 'solar-panel',
            ref_name = 'solar-panel-equipment',
            tech = 'solar-panel-equipment',
            min = 2,
            max = 8,
            base = 30,
            graphics_name = 'solar-panel-equipment'
        },
        ['fusion-reactor-equipment'] = {
            enabled = true,
            type = 'generator-equipment',
            name = 'fusion-reactor',
            ref_name = 'fusion-reactor-equipment',
            tech = 'fusion-reactor-equipment',
            min = 2,
            max = 8,
            base = 750,
            graphics_name = 'fusion-reactor-equipment'
        },
        ['battery-equipment'] = {
            enabled = true,
            type = 'battery-equipment',
            name = 'battery',
            ref_name = 'battery-mk2-equipment',
            tech = 'battery-mk2-equipment',
            min = 3,
            max = 8,
            base = 100,
            graphics_name = 'battery-mk2-equipment'
        },
        ['personal-laser-defense-equipment'] = {
            enabled = true,
            type = 'active-defense-equipment',
            name = 'personal-laser-defense',
            ref_name = 'personal-laser-defense-equipment',
            tech = 'personal-laser-defense-equipment',
            min = 2,
            max = 8,
            base = 3,
            graphics_name = 'personal-laser-defense-equipment'
        },
        ['energy-shield-equipment'] = {
            enabled = true,
            type = 'energy-shield-equipment',
            name = 'energy-shield',
            ref_name = 'energy-shield-mk2-equipment',
            tech = 'energy-shield-mk2-equipment',
            min = 3,
            max = 8,
            base = 150,
            graphics_name = 'energy-shield-mk2-equipment'
        },
        ['personal-roboport-equipment'] = {
            enabled = true,
            type = 'roboport-equipment',
            name = 'personal-roboport',
            ref_name = 'personal-roboport-mk2-equipment',
            tech = 'personal-roboport-mk2-equipment',
            min = 3,
            max = 8,
            base = 0.5,
            graphics_name = 'personal-roboport-mk2-equipment'
        },
        ['night-vision-equipment'] = {
            enabled = true,
            type = 'night-vision-equipment',
            name = 'night-vision',
            ref_name = 'night-vision-equipment',
            tech = 'night-vision-equipment',
            min = 2,
            max = 2,
            base = 1,
            graphics_name = 'night-vision-equipment'
        },
        ['exoskeleton-equipment'] = {
            enabled = true,
            type = 'movement-bonus-equipment',
            name = 'exoskeleton',
            ref_name = 'exoskeleton-equipment',
            tech = 'exoskeleton-equipment',
            min = 2,
            max = 2,
            base = 0.6,
            graphics_name = 'exoskeleton-equipment'
        }
    }
}

if mods ~= nil then
    if mods['PHI-RS'] then
        items['item']['electric-filter-furnace'] = {
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
        items['item']['industrial-furnace'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'industrial-furnace',
            ref_name = 'industrial-furnace',
            tech = 'industrial-furnace',
            min = 2,
            max = 3
        }

        items['item']['fuel-processor'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'fuel-processor',
            ref_name = 'fuel-processor',
            tech = 'fuel-processing',
            min = 2,
            max = 3
        }

        items['item']['area-mining-drill'] = {
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

    if mods['Atomic_Overhaul'] then
        items['item']['centrifuge'].stage = 2
    end

    if mods['Krastorio2'] then
        items['item']['solar-panel'].base = 100
        items['item']['accumulator'].base = 10
        items['item']['boiler'].base = 1500
        items['item']['boiler'].temp = 150
        items['item']['boiler'].fluid = 1 / 3
        items['item']['steam-engine'].fluid = 1 / 6
        items['item']['nuclear-reactor'].base = 250
        items['item']['nuclear-reactor'].bonus = 0.25
        items['item']['heat-exchanger'].base = 50000
        items['item']['heat-exchanger'].temp = 400
        items['item']['heat-exchanger'].fluid = 25 / 6
        items['item']['steam-turbine'].base = 400
        items['item']['steam-turbine'].fluid = 5 / 6
        items['item']['heat-pipe'].temp = 400
    end

    if (not mods['Krastorio2']) and mods['space-exploration'] then
        items['item']['solar-panel'].base = 60
        items['item']['accumulator'].base = 5
    end

    if mods['space-exploration'] then
        items['item']['se-space-assembling-machine'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-assembling-machine',
            ref_name = 'se-space-assembling-machine',
            tech = 'se-space-assembling',
            min = 2,
            max = 3
        }

        items['item']['se-space-manufactory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-manufactory',
            ref_name = 'se-space-manufactory',
            tech = 'se-space-manufactory',
            min = 2,
            max = 3
        }

        items['item']['se-casting-machine'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-casting-machine',
            ref_name = 'se-casting-machine',
            tech = 'se-pyroflux-smelting',
            min = 2,
            max = 3
        }

        items['item']['se-pulveriser'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-pulveriser',
            ref_name = 'se-pulveriser',
            tech = 'se-pulveriser',
            min = 2,
            max = 3
        }

        items['item']['se-lifesupport-facility'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-lifesupport-facility',
            ref_name = 'se-lifesupport-facility',
            tech = 'se-lifesupport-facility',
            min = 2,
            max = 3
        }

        items['item']['se-fuel-refinery'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-fuel-refinery',
            ref_name = 'se-fuel-refinery',
            tech = 'se-fuel-refining',
            min = 2,
            max = 3
        }

        items['item']['se-core-miner-drill'] = {
            enabled = false,
            stage = 2,
            type = 'mining-drill',
            name = 'se-core-miner-drill',
            ref_name = 'se-core-miner-drill',
            tech = 'se-core-miner',
            min = 2,
            max = 3
        }

        items['item']['se-space-decontamination-facility'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-decontamination-facility',
            ref_name = 'se-space-decontamination-facility',
            tech = 'se-space-decontamination-facility',
            min = 2,
            max = 3
        }

        items['item']['se-space-genetics-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-genetics-laboratory',
            ref_name = 'se-space-genetics-laboratory',
            tech = 'se-space-genetics-laboratory',
            min = 2,
            max = 3
        }

        items['item']['se-space-growth-facility'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-growth-facility',
            ref_name = 'se-space-growth-facility',
            tech = 'se-space-growth-facility',
            min = 2,
            max = 3
        }

        items['item']['se-space-biochemical-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-biochemical-laboratory',
            ref_name = 'se-space-biochemical-laboratory',
            tech = 'se-space-biochemical-laboratory',
            min = 2,
            max = 3
        }

        items['item']['se-space-radiation-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-radiation-laboratory',
            ref_name = 'se-space-radiation-laboratory',
            tech = 'se-space-radiation-laboratory',
            min = 2,
            max = 3
        }

        items['item']['se-space-electromagnetics-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-electromagnetics-laboratory',
            ref_name = 'se-space-electromagnetics-laboratory',
            tech = 'se-space-electromagnetics-laboratory',
            min = 2,
            max = 3
        }

        items['item']['se-space-laser-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-laser-laboratory',
            ref_name = 'se-space-laser-laboratory',
            tech = 'se-space-laser-laboratory',
            min = 2,
            max = 3
        }

        items['item']['se-space-astrometrics-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-astrometrics-laboratory',
            ref_name = 'se-space-astrometrics-laboratory',
            tech = 'se-space-astrometrics-laboratory',
            min = 2,
            max = 3
        }

        items['item']['se-space-gravimetrics-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-gravimetrics-laboratory',
            ref_name = 'se-space-gravimetrics-laboratory',
            tech = 'se-space-gravimetrics-laboratory',
            min = 2,
            max = 3
        }

        items['item']['se-space-mechanical-laboratory'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-mechanical-laboratory',
            ref_name = 'se-space-mechanical-laboratory',
            tech = 'se-space-mechanical-laboratory',
            min = 2,
            max = 3
        }

        items['item']['se-space-material-fabricator'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-material-fabricator',
            ref_name = 'se-space-material-fabricator',
            tech = 'se-space-material-fabricator',
            min = 2,
            max = 3
        }

        items['item']['se-space-particle-accelerator'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-particle-accelerator',
            ref_name = 'se-space-particle-accelerator',
            tech = 'se-space-particle-accelerator',
            min = 2,
            max = 3
        }

        items['item']['se-space-particle-collider'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-particle-collider',
            ref_name = 'se-space-particle-collider',
            tech = 'se-space-particle-collider',
            min = 2,
            max = 3
        }

        items['item']['se-space-plasma-generator'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-plasma-generator',
            ref_name = 'se-space-plasma-generator',
            tech = 'se-space-plasma-generator',
            min = 2,
            max = 3
        }

        items['item']['se-space-hypercooler'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-hypercooler',
            ref_name = 'se-space-hypercooler',
            tech = 'se-space-hypercooling-1',
            min = 2,
            max = 3
        }

        items['item']['se-space-radiator'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-radiator',
            ref_name = 'se-space-radiator-2',
            tech = 'se-space-radiator-2',
            min = 3,
            max = 4
        }

        items['item']['se-space-telescope'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope',
            ref_name = 'se-space-telescope',
            tech = 'se-space-telescope',
            min = 2,
            max = 3
        }

        items['item']['se-space-telescope-gammaray'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-gammaray',
            ref_name = 'se-space-telescope-gammaray',
            tech = 'se-space-telescope-gammaray',
            min = 2,
            max = 3
        }

        items['item']['se-space-telescope-microwave'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-microwave',
            ref_name = 'se-space-telescope-microwave',
            tech = 'se-space-telescope-microwave',
            min = 2,
            max = 3
        }

        items['item']['se-space-telescope-radio'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-radio',
            ref_name = 'se-space-telescope-radio',
            tech = 'se-space-telescope-radio',
            min = 2,
            max = 3
        }

        items['item']['se-space-telescope-xray'] = {
            enabled = true,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-xray',
            ref_name = 'se-space-telescope-xray',
            tech = 'se-space-telescope-xray',
            min = 2,
            max = 3
        }

        items['item']['se-space-science-lab'] = {
            enabled = true,
            stage = 2,
            type = 'lab',
            name = 'se-space-science-lab',
            ref_name = 'se-space-science-lab',
            tech = 'se-space-science-lab',
            min = 2,
            max = 3
        }

        items['equipment']['solar-panel'].base = 30

        items['equipment']['fusion-reactor'].tech = 'se-rtg-equipment'
        items['equipment']['fusion-reactor'].base_name = 'se-rtg'
        items['equipment']['fusion-reactor'].base = 400

        items['equipment']['battery'].tech = 'battery-equipment'
        items['equipment']['battery'].min = 2
        items['equipment']['battery'].base = 100

        items['equipment']['energy-shield'].tech = 'energy-shield-equipment'
        items['equipment']['energy-shield'].min = 2
        items['equipment']['energy-shield'].base = 200

        items['equipment']['personal-roboport'].tech = 'personal-roboport-equipment'
        items['equipment']['personal-roboport'].min = 2
        items['equipment']['personal-roboport'].base = 0.5
    end
end

return items
