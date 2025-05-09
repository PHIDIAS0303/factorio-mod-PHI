local items = {
    ['general'] = {
        ['graphics_location'] = '__PHI-CL__/graphics/'
    },
    ['research_modifier'] = {
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
    ['tint'] = {
        [2] = {r=140, g=142, b=200},
        [3] = {r=242, g=161, b=26},
        [4] = {r=255, g=254, b=42},
        [5] = {r=54, g=228, b=255},
        [6] = {r=253, g=0, b=97},
        [7] = {r=0, g=209, b=102},
        [8] = {r=233, g=63, b=233}
    },
    ['item'] = {
        ['solar-panel'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
            stage = 1,
            mod = 'base',
            type = 'solar-panel',
            name = 'solar-panel',
            ref_name = 'solar-panel',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-MB-ENERGY-SOLAR-TIER'].value
        },
        ['accumulator'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
            stage = 1,
            mod = 'base',
            type = 'accumulator',
            name = 'accumulator',
            ref_name = 'accumulator',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-MB-ENERGY-SOLAR-TIER'].value
        },
        ['boiler'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
            stage = 1,
            mod = 'base',
            type = 'boiler',
            name = 'boiler',
            ref_name = 'boiler',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
        },
        ['steam-engine'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
            stage = 1,
            mod = 'base',
            type = 'generator',
            name = 'steam-engine',
            ref_name = 'steam-engine',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
        },
        ['nuclear-reactor'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
            stage = 1,
            mod = 'base',
            type = 'reactor',
            name = 'nuclear-reactor',
            ref_name = 'nuclear-reactor',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
        },
        ['heat-pipe'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
            stage = 1,
            mod = 'base',
            type = 'heat-pipe',
            name = 'heat-pipe',
            ref_name = 'heat-pipe',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
        },
        ['heat-exchanger'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
            stage = 1,
            mod = 'base',
            type = 'boiler',
            name = 'heat-exchanger',
            ref_name = 'heat-exchanger',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
        },
        ['steam-turbine'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
            stage = 1,
            mod = 'base',
            type = 'generator',
            name = 'steam-turbine',
            ref_name = 'steam-turbine',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
        },
        ['assembling-machine'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
            stage = 1,
            mod = 'base',
            type = 'assembling-machine',
            name = 'assembling-machine',
            ref_name = 'assembling-machine-3',
            tech = 'automation-3',
            min = 4,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value + 2
        },
        ['electric-furnace'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
            stage = 1,
            mod = 'base',
            type = 'furnace',
            name = 'electric-furnace',
            ref_name = 'electric-furnace',
            tech = 'advanced-material-processing-2',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['oil-refinery'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
            stage = 1,
            mod = 'base',
            type = 'assembling-machine',
            name = 'oil-refinery',
            ref_name = 'oil-refinery',
            tech = 'oil-processing',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['chemical-plant'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
            stage = 1,
            mod = 'base',
            type = 'assembling-machine',
            name = 'chemical-plant',
            ref_name = 'chemical-plant',
            tech = 'oil-processing',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['centrifuge'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
            stage = 1,
            mod = 'base',
            type = 'assembling-machine',
            name = 'centrifuge',
            ref_name = 'centrifuge',
            tech = 'uranium-processing',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['lab'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
            stage = 1,
            mod = 'base',
            type = 'lab',
            name = 'lab',
            ref_name = 'lab',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['electric-mining-drill'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
            stage = 1,
            mod = 'base',
            type = 'mining-drill',
            name = 'electric-mining-drill',
            ref_name = 'electric-mining-drill',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['pumpjack'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
            stage = 1,
            mod = 'base',
            type = 'mining-drill',
            name = 'pumpjack',
            ref_name = 'pumpjack',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['laser-turret'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-WEAPON'].value,
            stage = 1,
            mod = 'base',
            type = 'electric-turret',
            name = 'laser-turret',
            ref_name = 'laser-turret',
            tech = 'laser-turret',
            min = 2,
            max = settings.startup['PHI-MB-WEAPON-TIER'].value
        },
        ['flamethrower-turret'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-WEAPON'].value,
            stage = 1,
            mod = 'base',
            type = 'fluid-turret',
            name = 'flamethrower-turret',
            ref_name = 'flamethrower-turret',
            tech = 'flamethrower',
            min = 2,
            max = settings.startup['PHI-MB-WEAPON-TIER'].value
        },
        ['gun-turret'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-WEAPON'].value,
            stage = 1,
            mod = 'base',
            type = 'ammo-turret',
            name = 'gun-turret',
            ref_name = 'gun-turret',
            tech = 'gun-turret',
            min = 2,
            max = settings.startup['PHI-MB-WEAPON-TIER'].value
        },
        ['radar'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-WEAPON'].value,
            stage = 1,
            mod = 'base',
            type = 'radar',
            name = 'radar',
            ref_name = 'radar',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-WEAPON-TIER'].value
        }
    },
    ['equipment'] = {
        ['battery-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'battery-equipment',
            name = 'battery',
            ref_name = 'battery-mk2-equipment',
            tech = 'battery-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
        },
        ['discharge-defense-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'active-defense-equipment',
            name = 'discharge-defense',
            ref_name = 'discharge-defense-equipment',
            tech = 'discharge-defense-equipment',
            min = 2,
            max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
        },
        ['energy-shield-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'energy-shield-equipment',
            name = 'energy-shield',
            ref_name = 'energy-shield-mk2-equipment',
            tech = 'energy-shield-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
        },
        ['exoskeleton-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'movement-bonus-equipment',
            name = 'exoskeleton',
            ref_name = 'exoskeleton-equipment',
            tech = 'exoskeleton-equipment',
            min = 2,
            max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT-TIER'].value) or 1, 2)
        },
        ['fission-reactor-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'generator-equipment',
            name = 'fission-reactor',
            ref_name = 'fission-reactor-equipment',
            tech = 'fission-reactor-equipment',
            min = 2,
            max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
        },
        ['night-vision-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'night-vision-equipment',
            name = 'night-vision',
            ref_name = 'night-vision-equipment',
            tech = 'night-vision-equipment',
            min = 2,
            max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT-TIER'].value) or 1, 2)
        },
        ['personal-laser-defense-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'active-defense-equipment',
            name = 'personal-laser-defense',
            ref_name = 'personal-laser-defense-equipment',
            tech = 'personal-laser-defense-equipment',
            min = 2,
            max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
        },
        ['personal-roboport-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'roboport-equipment',
            name = 'personal-roboport',
            ref_name = 'personal-roboport-mk2-equipment',
            tech = 'personal-roboport-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
        },
        ['solar-panel-equipment'] = {
            enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
            stage = 1,
            mod = 'base',
            type = 'solar-panel-equipment',
            name = 'solar-panel',
            ref_name = 'solar-panel-equipment',
            tech = 'solar-panel-equipment',
            min = 2,
            max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value,
            base = 30,
            graphics_name = 'solar-panel-equipment'
        }
    },
    ['space-age'] = {
        ['PHI-VP'] = {
            ['technology_reform'] = {
                ['stack-inserter'] = {
                    ['prerequisites'] = {'bulk-inserter', 'chemical-science-pack', 'processing-unit'},
                    ['unit'] = {count = 800, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
                },
                ['transport-belt-capacity-1'] = {
                    ['prerequisites'] = {'stack-inserter', 'logistics-3', 'production-science-pack', 'utility-science-pack'},
                    ['unit'] = {count = 1600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
                },
                ['transport-belt-capacity-2'] = {
                    ['prerequisites'] = {'transport-belt-capacity-1', 'space-science-pack'},
                    ['unit'] = {count = 2400, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}}
                },
                ['turbo-transport-belt'] = {
                    ['prerequisites'] = {'logistics-3', 'production-science-pack', 'utility-science-pack'},
                    ['unit'] = {count = 800, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
                },
                ['electromagnetic-plant'] = {
                    ['prerequisites'] = {'automation-3', 'processing-unit', 'utility-science-pack'},
                    ['unit'] = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
                    ['effects'] = {{type = 'unlock-recipe', recipe = 'electromagnetic-plant'}}
                },
                ['foundry'] = {
                    ['prerequisites'] = {'automation-3', 'advanced-material-processing-2', 'processing-unit', 'utility-science-pack'},
                    ['unit'] = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
                    ['effects'] = {{type = 'unlock-recipe', recipe = 'foundry'}}
                },
                ['cryogenic-plant'] = {
                    ['prerequisites'] = {'automation-3', 'coal-liquefaction', 'processing-unit', 'utility-science-pack'},
                    ['unit'] = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
                    ['effects'] = {{type = 'unlock-recipe', recipe = 'cryogenic-plant'}}
                },
                ['biolab'] = {
                    ['prerequisites'] = {'automation-3', 'processing-unit', 'utility-science-pack'},
                    ['unit'] = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
                },
                ['speed-module-2'] = {
                    ['prerequisites'] = {'speed-module', 'processing-unit'},
                    ['unit'] = {count = 75, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
                },
                ['speed-module-3'] = {
                    ['prerequisites'] = {'speed-module-2', 'production-science-pack'},
                    ['unit'] = {count = 300, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
                },
                ['productivity-module-2'] = {
                    ['prerequisites'] = {'productivity-module', 'processing-unit'},
                    ['unit'] = {count = 75, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
                },
                ['productivity-module-3'] = {
                    ['prerequisites'] = {'productivity-module-2', 'production-science-pack'},
                    ['unit'] = {count = 300, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
                },
                ['efficiency-module-2'] = {
                    ['prerequisites'] = {'efficiency-module', 'processing-unit'},
                    ['unit'] = {count = 75, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
                },
                ['efficiency-module-3'] = {
                    ['prerequisites'] = {'efficiency-module-2', 'production-science-pack'},
                    ['unit'] = {count = 300, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
                },
                ['logistic-system'] = {
                    ['prerequisites'] = {'logistic-robotics', 'utility-science-pack'},
                    ['unit'] = {count = 500, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}}
                },
                ['cliff-explosives'] = {
                    ['prerequisites'] = {'explosives', 'military-2'},
                    ['unit'] = {count = 200, time = 15, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}},
                    ['effects'] = {{type = 'unlock-recipe', recipe = 'cliff-explosives'}, {type = 'cliff-deconstruction-enabled', modifier = true}}
                },
            },
            ['technology'] = {
                ['planet-discovery-vulcanus'] = true,
                ['planet-discovery-gleba'] = true,
                ['planet-discovery-fulgora'] = true,
                ['planet-discovery-aquilo'] = true,
                ['space-platform-thruster'] = true,
                ['recycling'] = true,
                ['lightning-collector'] = true,
                ['space-platform'] = true,
                ['asteroid-reprocessing'] = true,
                ['advanced-asteroid-processing'] = true,
                ['asteroid-productivity'] = true,
                ['calcite-processing'] = true,
                ['tungsten-carbide'] = true,
                ['tungsten-steel'] = true,
                ['metallurgic-science-pack'] = true,
                ['yumako'] = true,
                ['jellynut'] = true,
                ['bioflux'] = true,
                ['artificial-soil'] = true,
                ['overgrowth-soil'] = true,
                ['bacteria-cultivation'] = true,
                ['bioflux-processing'] = true,
                ['agricultural-science-pack'] = true,
                ['captivity'] = true,
                ['biter-egg-handling'] = true,
                ['carbon-fiber'] = true,
                ['fish-breeding'] = true,
                ['holmium-processing'] = true,
                ['electromagnetic-science-pack'] = true,
                ['rail-support-foundations'] = true,
                ['lithium-processing'] = true,
                ['quantum-processor'] = true,
                ['cryogenic-science-pack'] = true,
                ['captive-biter-spawner'] = true,
                ['promethium-science-pack'] = true,
                ['foundation'] = true,
                ['scrap-recycling-productivity'] = true,
                ['biochamber'] = true,
                ['electric-weapons-damage-1'] = true,
                ['electric-weapons-damage-2'] = true,
                ['electric-weapons-damage-3'] = true,
                ['electric-weapons-damage-4'] = true,
                ['artillery-shell-damage-1'] = true,
                ['railgun-damage-1'] = true,
            },
            ['recipe'] = {
                ['thruster'] = true,
                ['thruster-fuel'] = true,
                ['thruster-oxidizer'] = true,
                ['advanced-thruster-fuel'] = true,
                ['advanced-thruster-oxidizer'] = true,
                ['recycler'] = true,
                ['lightning-collector'] = true,
                ['lightning-rod'] = true,
                ['metallic-asteroid-crushing'] = true,
                ['carbonic-asteroid-crushing'] = true,
                ['oxide-asteroid-crushing'] = true,
                ['advanced-metallic-asteroid-crushing'] = true,
                ['advanced-carbonic-asteroid-crushing'] = true,
                ['advanced-oxide-asteroid-crushing'] = true,
                ['metallic-asteroid-reprocessing'] = true,
                ['carbonic-asteroid-reprocessing'] = true,
                ['oxide-asteroid-reprocessing'] = true,
                ['space-platform-foundation'] = true,
                ['space-platform-starter-pack'] = true,
                ['agricultural-science-pack'] = true,
                ['cryogenic-science-pack'] = true,
                ['electromagnetic-science-pack'] = true,
                ['metallurgic-science-pack'] = true,
                ['promethium-science-pack'] = true,
                ['space-science-pack'] = true,
                ['burnt-spoilage'] = true,
                ['fish-breeding'] = true,
                ['nutrients-from-fish'] = true,
                ['nutrients-from-biter-egg'] = true,
                ['yumako-processing'] = true,
                ['jellynut-processing'] = true,
                ['copper-bacteria'] = true,
                ['copper-bacteria-cultivation'] = true,
                ['iron-bacteria'] = true,
                ['iron-bacteria-cultivation'] = true,
                ['nutrients-from-spoilage'] = true,
                ['nutrients-from-yumako-mash'] = true,
                ['nutrients-from-bioflux'] = true,
                ['pentapod-egg'] = true,
                ['rocket-fuel-from-jelly'] = true,
                ['bioflux'] = true,
                ['bioplastic'] = true,
                ['biosulfur'] = true,
                ['biolubricant'] = true,
                ['carbon-fiber'] = true,
                ['artificial-yumako-soil'] = true,
                ['overgrowth-yumako-soil'] = true,
                ['artificial-jellynut-soil'] = true,
                ['overgrowth-jellynut-soil'] = true,
                ['biochamber'] = true,
                ['captive-biter-spawner'] = true,
                ['capture-robot-rocket'] = true,
                ['biter-egg'] = true,
                ['spoilage-from-nutrients'] = true,
                ['crusher'] = true,
                ['tungsten-carbide'] = true,
                ['tungsten-plate'] = true,
                ['carbon'] = true,
                ['coal-synthesis'] = true,
                ['spoilage-recycling'] = true,
                ['asteroid-collector'] = true,
                ['ammoniacal-solution-separation'] = true,
                ['lithium'] = true,
                ['lithium-plate'] = true,
                ['ice-platform'] = true,
                ['solid-fuel-from-ammonia'] = true,
                ['ammonia-rocket-fuel'] = true,
                ['quantum-processor'] = true,
                ['holmium-solution'] = true,
                ['holmium-plate'] = true,
                ['electrolyte'] = true,
                ['supercapacitor'] = true,
                ['superconductor'] = true,
                ['molten-iron-from-lava'] = true,
                ['molten-copper-from-lava'] = true,
                ['molten-iron'] = true,
                ['molten-copper'] = true,
                ['casting-iron'] = true,
                ['casting-steel'] = true,
                ['casting-copper'] = true,
                ['casting-iron-gear-wheel'] = true,
                ['casting-iron-stick'] = true,
                ['casting-pipe'] = true,
                ['casting-pipe-to-ground'] = true,
                ['casting-low-density-structure'] = true,
                ['concrete-from-molten-iron'] = true,
                ['casting-copper-cable'] = true,
                ['acid-neutralisation'] = true,
                ['simple-coal-liquefaction'] = true,
                ['scrap-recycling'] = true,
                ['foundation'] = true,
                ['steam-condensation'] = true,
                ['ice-melting'] = true,
            },
            ['item'] = {
                ['artificial-yumako-soil'] = true,
                ['overgrowth-yumako-soil'] = true,
                ['artificial-jellynut-soil'] = true,
                ['overgrowth-jellynut-soil'] = true,
                ['recycler'] = true,
                ['ice-platform'] = true,
                ['foundation'] = true,
                ['biochamber'] = true,
                ['captive-biter-spawner'] = true,
                ['ice'] = true,
                ['carbon'] = true,
                ['calcite'] = true,
                ['tungsten-ore'] = true,
                ['tungsten-carbide'] = true,
                ['tungsten-plate'] = true,
                ['scrap'] = true,
                ['holmium-ore'] = true,
                ['holmium-plate'] = true,
                ['superconductor'] = true,
                ['supercapacitor'] = true,
                ['yumako-seed'] = true,
                ['jellynut-seed'] = true,
                ['iron-bacteria'] = true,
                ['copper-bacteria'] = true,
                ['spoilage'] = true,
                ['nutrients'] = true,
                ['carbon-fiber'] = true,
                ['biter-egg'] = true,
                ['pentapod-egg'] = true,
                ['lithium'] = true,
                ['lithium-plate'] = true,
                ['quantum-processor'] = true,
                ['space-platform-foundation'] = true,
                ['asteroid-collector'] = true,
                ['crusher'] = true,
                ['thruster'] = true,
                ['space-platform-hub'] = true,
            }
        },
        ['PHI-SA-RESTRICTION'] = {
            ['surface_conditions'] = {
                ['captive-biter-spawner'] = 'assembling-machine',
                ['agricultural-tower'] = 'agricultural-tower',
                ['asteroid-collector'] = 'asteroid-collector',
                ['rocket-silo'] = 'rocket-silo',
                ['cargo-landing-pad'] = 'cargo-landing-pad',
                ['heating-tower'] = 'reactor',
                ['recycler'] = 'furnace',
                ['fusion-reactor'] = 'fusion-reactor',
                ['fusion-generator'] = 'fusion-generator',
                ['thruster'] = 'thruster',
                ['biochamber'] = 'assembling-machine',
                ['crusher'] = 'assembling-machine',
                ['cryogenic-plant'] = 'assembling-machine',
                ['electromagnetic-plant'] = 'assembling-machine',
                ['foundry'] = 'assembling-machine',
                ['biolab'] = 'lab',
                ['flamethrower-turret'] = 'fluid-turret',
                ['stone-furnace'] = 'furnace',
                ['steel-furnace'] = 'furnace',
                ['burner-mining-drill'] = 'mining-drill',
                ['burner-inserter'] = 'inserter',
                ['boiler'] = 'boiler',
                ['roboport'] = 'roboport',
                ['car'] = 'car',
                ['tank'] = 'car',
                ['spidertron'] = 'spider-vehicle',
                ['locomotive'] = 'locomotive',
                ['cargo-wagon'] = 'cargo-wagon',
                ['fluid-wagon'] = 'fluid-wagon',
                ['artillery-wagon'] = 'artillery-wagon',
                ['train-stop'] = 'train-stop',
                ['rail-signal'] = 'rail-signal',
                ['rail-chain-signal'] = 'rail-chain-signal',
                ['legacy-curved-rail'] = 'legacy-curved-rail',
                ['legacy-straight-rail'] = 'legacy-straight-rail',
                ['curved-rail-a'] = 'curved-rail-a',
                ['curved-rail-b'] = 'curved-rail-b',
                ['half-diagonal-rail'] = 'half-diagonal-rail',
                ['straight-rail'] = 'straight-rail',
                ['rail-ramp'] = 'rail-ramp',
                ['elevated-straight-rail'] = 'elevated-straight-rail',
                ['elevated-half-diagonal-rail'] = 'elevated-half-diagonal-rail',
                ['elevated-curved-rail-a'] = 'elevated-curved-rail-a',
                ['elevated-curved-rail-b'] = 'elevated-curved-rail-b',
                ['rail-support'] = 'rail-support',
                ['wooden-chest'] = 'container',
                ['iron-chest'] = 'container',
                ['steel-chest'] = 'container',
                ['passive-provider-chest'] = 'logistic-container',
                ['active-provider-chest'] = 'logistic-container',
                ['storage-chest'] = 'logistic-container',
                ['buffer-chest'] = 'logistic-container',
                ['requester-chest'] = 'logistic-container'
            }
        }
    }
}

if mods and mods['space-age'] then
    items['item']['fusion-reactor'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
        stage = 1,
        mod = 'space-age',
        type = 'fusion-reactor',
        name = 'fusion-reactor',
        ref_name = 'fusion-reactor',
        tech = 'compound-energy',
        min = 2,
        max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
    }

    items['item']['fusion-generator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
        stage = 1,
        mod = 'space-age',
        type = 'fusion-generator',
        name = 'fusion-generator',
        ref_name = 'fusion-generator',
        tech = 'compound-energy',
        min = 2,
        max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
    }

    items['item']['heating-tower'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
        stage = 1,
        mod = 'space-age',
        type = 'reactor',
        name = 'heating-tower',
        ref_name = 'heating-tower',
        tech = 'heating-tower',
        min = 2,
        max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
    }

    items['item']['railgun-turret'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-WEAPON'].value,
        stage = 1,
        mod = 'space-age',
        type = 'ammo-turret',
        name = 'railgun-turret',
        ref_name = 'railgun-turret',
        tech = 'railgun',
        min = 2,
        max = settings.startup['PHI-MB-WEAPON-TIER'].value
    }

    items['item']['rocket-turret'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-WEAPON'].value,
        stage = 1,
        mod = 'space-age',
        type = 'ammo-turret',
        name = 'rocket-turret',
        ref_name = 'rocket-turret',
        tech = 'rocket-turret',
        min = 2,
        max = settings.startup['PHI-MB-WEAPON-TIER'].value
    }

    items['item']['tesla-turret'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-WEAPON'].value,
        stage = 1,
        mod = 'space-age',
        type = 'electric-turret',
        name = 'tesla-turret',
        ref_name = 'tesla-turret',
        tech = 'tesla-weapons',
        min = 2,
        max = settings.startup['PHI-MB-WEAPON-TIER'].value
    }

    items['item']['foundry'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'foundry',
        ref_name = 'foundry',
        tech = 'foundry',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['big-mining-drill'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'mining-drill',
        name = 'big-mining-drill',
        ref_name = 'big-mining-drill',
        tech = 'big-mining-drill',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['biochamber'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'biochamber',
        ref_name = 'biochamber',
        tech = 'biochamber',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['crusher'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'crusher',
        ref_name = 'crusher',
        tech = 'space-platform',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['biolab'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'lab',
        name = 'biolab',
        ref_name = 'biolab',
        tech = 'biolab',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['cryogenic-plant'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'cryogenic-plant',
        ref_name = 'cryogenic-plant',
        tech = 'cryogenic-plant',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['electromagnetic-plant'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'electromagnetic-plant',
        ref_name = 'electromagnetic-plant',
        tech = 'electromagnetic-plant',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['thruster'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'thruster',
        name = 'thruster',
        ref_name = 'thruster',
        tech = 'space-platform-thruster',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['agricultural-tower'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'space-age',
        type = 'agricultural-tower',
        name = 'agricultural-tower',
        ref_name = 'agricultural-tower',
        tech = 'agriculture',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['equipment']['fusion-reactor-equipment'] = {
        enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
        stage = 1,
        mod = 'space-age',
        type = 'generator-equipment',
        name = 'fusion-reactor',
        ref_name = 'fusion-reactor-equipment',
        tech = 'fusion-reactor-equipment',
        min = 2,
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    }

    items['equipment']['toolbelt-equipment'] = {
        enabled = settings.startup['PHI-MB-EQUIPMENT'].value,
        stage = 1,
        mod = 'space-age',
        type = 'inventory-bonus-equipment',
        name = 'toolbelt',
        ref_name = 'toolbelt-equipment',
        tech = 'toolbelt-equipment',
        min = 2,
        max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT-TIER'].value) or 1, 2)
    }

    items['equipment']['battery-equipment'].ref_name = 'battery-mk3-equipment'
    items['equipment']['battery-equipment'].tech = 'battery-mk3-equipment'
    items['equipment']['battery-equipment'].min = 4
end

if mods and mods['quality'] then
    items['item']['recycler'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 1,
        mod = 'quality',
        type = 'furnace',
        name = 'recycler',
        ref_name = 'recycler',
        tech = 'recycling',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }
end

if mods and mods['aai-industry'] then
    items['item']['industrial-furnace'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'aai-industry',
        type = 'assembling-machine',
        name = 'industrial-furnace',
        ref_name = 'industrial-furnace',
        tech = 'industrial-furnace',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['fuel-processor'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'aai-industry',
        type = 'assembling-machine',
        name = 'fuel-processor',
        ref_name = 'fuel-processor',
        tech = 'fuel-processing',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }
end

if mods and (mods['aai-industry'] or mods['big-mining-drill']) then
    items['item']['area-mining-drill'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = (mods['big-mining-drill'] and 'big-mining-drill') or 'aai-industry',
        type = 'mining-drill',
        name = 'area-mining-drill',
        ref_name = 'area-mining-drill',
        tech = 'area-mining-drill',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }
end

if mods and mods['space-exploration'] then
    items['item']['se-space-solar-panel'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-ENERGY'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'solar-panel',
        name = 'se-space-solar-panel',
        ref_name = 'se-space-solar-panel',
        tech = 'compound-energy',
        min = 4,
        max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
    }

    items['item']['se-space-assembling-machine'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-assembling-machine',
        ref_name = 'se-space-assembling-machine',
        tech = 'se-space-assembling',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-manufactory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-manufactory',
        ref_name = 'se-space-manufactory',
        tech = 'se-space-manufactory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-casting-machine'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-casting-machine',
        ref_name = 'se-casting-machine',
        tech = 'se-pyroflux-smelting',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-pulveriser'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-pulveriser',
        ref_name = 'se-pulveriser',
        tech = 'se-pulveriser',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-lifesupport-facility'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-lifesupport-facility',
        ref_name = 'se-lifesupport-facility',
        tech = 'se-lifesupport-facility',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-fuel-refinery'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-fuel-refinery',
        ref_name = 'se-fuel-refinery',
        tech = 'se-fuel-refining',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-decontamination-facility'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-decontamination-facility',
        ref_name = 'se-space-decontamination-facility',
        tech = 'se-space-decontamination-facility',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-genetics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-genetics-laboratory',
        ref_name = 'se-space-genetics-laboratory',
        tech = 'se-space-genetics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-growth-facility'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-growth-facility',
        ref_name = 'se-space-growth-facility',
        tech = 'se-space-growth-facility',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-biochemical-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-biochemical-laboratory',
        ref_name = 'se-space-biochemical-laboratory',
        tech = 'se-space-biochemical-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-radiation-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-radiation-laboratory',
        ref_name = 'se-space-radiation-laboratory',
        tech = 'se-space-radiation-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-electromagnetics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-electromagnetics-laboratory',
        ref_name = 'se-space-electromagnetics-laboratory',
        tech = 'se-space-electromagnetics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-laser-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-laser-laboratory',
        ref_name = 'se-space-laser-laboratory',
        tech = 'se-space-laser-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-astrometrics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-astrometrics-laboratory',
        ref_name = 'se-space-astrometrics-laboratory',
        tech = 'se-space-astrometrics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-gravimetrics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-gravimetrics-laboratory',
        ref_name = 'se-space-gravimetrics-laboratory',
        tech = 'se-space-gravimetrics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-mechanical-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-mechanical-laboratory',
        ref_name = 'se-space-mechanical-laboratory',
        tech = 'se-space-mechanical-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-material-fabricator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-material-fabricator',
        ref_name = 'se-space-material-fabricator',
        tech = 'se-space-material-fabricator',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-particle-accelerator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-particle-accelerator',
        ref_name = 'se-space-particle-accelerator',
        tech = 'se-space-particle-accelerator',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-particle-collider'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-particle-collider',
        ref_name = 'se-space-particle-collider',
        tech = 'se-space-particle-collider',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-plasma-generator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-plasma-generator',
        ref_name = 'se-space-plasma-generator',
        tech = 'se-space-plasma-generator',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-hypercooler'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-hypercooler',
        ref_name = 'se-space-hypercooler',
        tech = 'se-space-hypercooling-1',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-radiator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-radiator',
        ref_name = 'se-space-radiator-2',
        tech = 'se-space-radiator-2',
        min = 3,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value + 1
    }

    items['item']['se-space-telescope'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope',
        ref_name = 'se-space-telescope',
        tech = 'se-space-telescope',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-telescope-gammaray'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope-gammaray',
        ref_name = 'se-space-telescope-gammaray',
        tech = 'se-space-telescope-gammaray',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-telescope-microwave'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope-microwave',
        ref_name = 'se-space-telescope-microwave',
        tech = 'se-space-telescope-microwave',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-telescope-radio'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope-radio',
        ref_name = 'se-space-telescope-radio',
        tech = 'se-space-telescope-radio',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-telescope-xray'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope-xray',
        ref_name = 'se-space-telescope-xray',
        tech = 'se-space-telescope-xray',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-science-lab'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'lab',
        name = 'se-space-science-lab',
        ref_name = 'se-space-science-lab',
        tech = 'se-space-science-lab',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['equipment']['fission-reactor-equipment'].tech = 'se-rtg-equipment'
    items['equipment']['fission-reactor-equipment'].base_name = 'se-rtg'

    items['equipment']['battery-equipment'].tech = 'battery-equipment'
    items['equipment']['battery-equipment'].min = 2

    items['equipment']['energy-shield-equipment'].tech = 'energy-shield-equipment'
    items['equipment']['energy-shield-equipment'].min = 2

    items['equipment']['personal-roboport-equipment'].tech = 'personal-roboport-equipment'
    items['equipment']['personal-roboport-equipment'].min = 2
end

return items
