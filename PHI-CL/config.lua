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
    ['item'] = {},
    ['equipment'] = {

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
                ['effect-transmission'] = {
                    ['prerequisites'] = {'production-science-pack'},
                    ['unit'] = {count = 75, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
                }
            },
            ['technology'] = {
                ['planet-discovery-vulcanus'] = true,
                ['planet-discovery-gleba'] = true,
                ['planet-discovery-fulgora'] = true,
                ['planet-discovery-aquilo'] = true,
                ['recycling'] = true,
                ['lightning-collector'] = true,
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
                ['biochamber'] = true
            },
            ['recipe'] = {
                ['recycler'] = true,
                ['lightning-collector'] = true,
                ['lightning-rod'] = true,
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
                ['tungsten-carbide'] = true,
                ['tungsten-plate'] = true,
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
            },
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
            },
            ['hidden_data'] = {
                ['biochamber'] = 'assembling-machine',
                ['captive-biter-spawner'] = 'assembling-machine',
                ['lightning-rod']= 'lightning-attractor',
                ['lightning-collector'] = 'lightning-attractor',
                ['fulgoran-ruin-attractor'] = 'lightning-attractor',
                ['recycler'] = 'furnace',
                ['yumako-tree'] = 'plant',
                ['jellystem'] = 'plant',
                ['lightning'] = 'lightning',
                ['agricultural-science-pack'] = 'tool',
                ['cryogenic-science-pack'] = 'tool',
                ['electromagnetic-science-pack'] = 'tool',
                ['metallurgic-science-pack'] = 'tool'
            },
            ['technology_vp'] = {
                ['space-platform-thruster'] = true,
                ['space-platform'] = true,
                ['asteroid-reprocessing'] = true,
                ['advanced-asteroid-processing'] = true,
                ['asteroid-productivity'] = true,
                ['calcite-processing'] = true,
            },
            ['recipe_vp'] = {
                ['thruster'] = true,
                ['thruster-fuel'] = true,
                ['thruster-oxidizer'] = true,
                ['advanced-thruster-fuel'] = true,
                ['advanced-thruster-oxidizer'] = true,
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
                ['space-science-pack'] = true,
                ['carbon'] = true,
                ['ice-melting'] = true,
                ['crusher'] = true,
            },
            ['item_vp'] = {
                ['ice'] = true,
                ['carbon'] = true,
                ['calcite'] = true,
                ['space-platform-foundation'] = true,
                ['asteroid-collector'] = true,
                ['crusher'] = true,
                ['thruster'] = true,
                ['space-platform-hub'] = true,
            },
            ['hidden_data_vp'] = {
                ['thruster'] = 'thruster',
                ['crusher'] = 'assembling-machine',
                ['asteroid-collector'] = 'asteroid-collector',
                ['space-platform-hub'] = 'space-platform-hub',
                ['space-platform-starter-pack'] = 'space-platform-starter-pack',
                ['space-platform'] = 'surface',
            }
        }
    }
}

if mods and mods['space-age'] then
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

return items
