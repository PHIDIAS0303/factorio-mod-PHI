local items = {
    ['entity_surface_conditions'] = {
        -- BASE 0
        ['rocket-silo'] = 'rocket-silo',
        ['cargo-landing-pad'] = 'cargo-landing-pad',
        ['flamethrower-turret'] = 'fluid-turret',
        ['stone-furnace'] = 'furnace',
        ['steel-furnace'] = 'furnace',
        -- BASE 5
        ['burner-mining-drill'] = 'mining-drill',
        ['burner-inserter'] = 'inserter',
        ['boiler'] = 'boiler',
        ['roboport'] = 'roboport',
        ['car'] = 'car',
        -- BASE 10
        ['tank'] = 'car',
        ['spidertron'] = 'spider-vehicle',
        ['locomotive'] = 'locomotive',
        ['cargo-wagon'] = 'cargo-wagon',
        ['fluid-wagon'] = 'fluid-wagon',
        -- BASE 15
        ['artillery-wagon'] = 'artillery-wagon',
        ['train-stop'] = 'train-stop',
        ['rail-signal'] = 'rail-signal',
        ['rail-chain-signal'] = 'rail-chain-signal',
        ['straight-rail'] = 'straight-rail',
        -- BASE 20
        ['legacy-curved-rail'] = 'legacy-curved-rail',
        ['legacy-straight-rail'] = 'legacy-straight-rail',
        ['curved-rail-a'] = 'curved-rail-a',
        ['curved-rail-b'] = 'curved-rail-b',
        ['half-diagonal-rail'] = 'half-diagonal-rail',
        -- BASE 25
        ['wooden-chest'] = 'container',
        ['iron-chest'] = 'container',
        ['steel-chest'] = 'container',
        ['passive-provider-chest'] = 'logistic-container',
        ['active-provider-chest'] = 'logistic-container',
        -- BASE 30
        ['storage-chest'] = 'logistic-container',
        ['buffer-chest'] = 'logistic-container',
        ['requester-chest'] = 'logistic-container',
        -- ELEVATED_RAIL 0
        ['rail-support'] = 'rail-support',
        ['rail-ramp'] = 'rail-ramp',
        ['elevated-straight-rail'] = 'elevated-straight-rail',
        ['elevated-half-diagonal-rail'] = 'elevated-half-diagonal-rail',
        ['elevated-curved-rail-a'] = 'elevated-curved-rail-a',
        -- ELEVATED_RAIL 5
        ['elevated-curved-rail-b'] = 'elevated-curved-rail-b',
        -- SPACE_AGE 0
        ['captive-biter-spawner'] = 'assembling-machine',
        ['biochamber'] = 'assembling-machine',
        ['crusher'] = 'assembling-machine',
        ['cryogenic-plant'] = 'assembling-machine',
        ['electromagnetic-plant'] = 'assembling-machine',
        -- SPACE_AGE 5
        ['foundry'] = 'assembling-machine',
        ['agricultural-tower'] = 'agricultural-tower',
        ['asteroid-collector'] = 'asteroid-collector',
        ['fusion-reactor'] = 'fusion-reactor',
        ['fusion-generator'] = 'fusion-generator',
        -- SPACE_AGE 10
        ['heating-tower'] = 'reactor',
        ['recycler'] = 'furnace',
        ['thruster'] = 'thruster',
        ['biolab'] = 'lab',
    },
    ['technology_reform'] = {
        -- BASE 0
        ['speed-module-2'] = {
            prerequisites = {'speed-module', 'processing-unit'},
            unit = {count = 75, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
        },
        ['speed-module-3'] = {
            prerequisites = {'speed-module-2', 'production-science-pack'},
            unit = {count = 300, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
        },
        ['productivity-module-2'] = {
            prerequisites = {'productivity-module', 'processing-unit'},
            unit = {count = 75, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
        },
        ['productivity-module-3'] = {
            prerequisites = {'productivity-module-2', 'production-science-pack'},
            unit = {count = 300, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
        },
        ['efficiency-module-2'] = {
            prerequisites = {'efficiency-module', 'processing-unit'},
            unit = {count = 75, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
        },
        -- BASE 5
        ['efficiency-module-3'] = {
            prerequisites = {'efficiency-module-2', 'production-science-pack'},
            unit = {count = 300, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
        },
        ['logistic-system'] = {
            prerequisites = {'logistic-robotics', 'utility-science-pack'},
            unit = {count = 500, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}}
        },
        ['effect-transmission'] = {
            prerequisites = {'production-science-pack'},
            unit = {count = 75, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
        },
        ['space-science-pack'] = {
            prerequisites = {'rocket-silo'},
            effects = {{type = 'unlock-recipe', recipe = 'satellite'}},
            unit = {count = 2000, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
        },
        ['stronger-explosives-5'] = {
            prerequisites = {'stronger-explosives-4'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
        },
        -- BASE 10
        ['stronger-explosives-6'] = {
            prerequisites = {'stronger-explosives-5'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
        },
        ['stronger-explosives-7'] = {
            prerequisites = {'stronger-explosives-6'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['refined-flammables-6'] = {
            prerequisites = {'refined-flammables-5'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
        },
        ['refined-flammables-7'] = {
            prerequisites = {'refined-flammables-6'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['artillery-shell-range-1'] = {
            prerequisites = {'artillery', 'space-science-pack'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        -- BASE 15
        ['artillery-shell-speed-1'] = {
            prerequisites = {'artillery', 'space-science-pack'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['worker-robots-speed-6'] = {
            prerequisites = {'worker-robots-speed-5'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        },
        ['worker-robots-speed-7'] = {
            prerequisites = {'worker-robots-speed-6', 'space-science-pack'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['artillery'] = {
            prerequisites = {'tank', 'concrete', 'radar'},
            unit_count = 1500,
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}}
        },
        ['atomic-bomb'] = {
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
        },
        -- BASE 20
        ['energy-shield-mk2-equipment'] = {
            prerequisites = {'energy-shield-equipment', 'military-4', 'power-armor'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
        },
        ['personal-roboport-mk2-equipment'] = {
            prerequisites = {'personal-roboport-equipment'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
        },
        ['coal-liquefaction'] = {
            prerequisites = {'advanced-oil-processing'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
        },
        ['kovarex-enrichment-process'] = {
            prerequisites = {'uranium-processing'},
            unit = {count = 1500, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
        },
        ['spidertron'] = {
            prerequisites = {'exoskeleton-equipment', 'fission-reactor-equipment', 'military-4', 'production-science-pack', 'radar'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        },
        -- BASE 25
        ['mining-productivity-3'] = {
            prerequisites = {'mining-productivity-2', 'production-science-pack', 'utility-science-pack', 'space-science-pack'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        -- SPACE_AGE 0
        ['stack-inserter'] = {
            prerequisites = {'bulk-inserter', 'chemical-science-pack', 'processing-unit'},
            unit = {count = 800, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
        },
        ['transport-belt-capacity-1'] = {
            prerequisites = {'stack-inserter', 'logistics-3', 'production-science-pack', 'utility-science-pack'},
            unit = {count = 1600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
        },
        ['transport-belt-capacity-2'] = {
            prerequisites = {'transport-belt-capacity-1', 'space-science-pack'},
            unit = {count = 2400, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}}
        },
        ['turbo-transport-belt'] = {
            prerequisites = {'logistics-3', 'production-science-pack', 'utility-science-pack'},
            unit = {count = 800, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
        },
        ['electromagnetic-plant'] = {
            prerequisites = {'automation-3', 'processing-unit', 'utility-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'electromagnetic-plant'}}
        },
        -- SPACE_AGE 5
        ['foundry'] = {
            prerequisites = {'automation-3', 'advanced-material-processing-2', 'processing-unit', 'utility-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'foundry'}}
        },
        ['cryogenic-plant'] = {
            prerequisites = {'automation-3', 'coal-liquefaction', 'processing-unit', 'utility-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'cryogenic-plant'}}
        },
        ['biolab'] = {
            prerequisites = {'automation-3', 'processing-unit', 'utility-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
        },
        ['space-platform'] = {
            prerequisites = nil,
            unit = {count = 100, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
        },
        ['space-platform-thruster'] = {
            prerequisites = {'space-platform'},
            unit = {count = 100, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
        },
        -- SPACE_AGE 10
        ['asteroid-reprocessing'] = {
            prerequisites = {'space-platform'},
            unit = {count = 100, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
        },
        ['advanced-asteroid-processing'] = {
            prerequisites = {'space-platform'},
            unit = {count = 100, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
        },
        ['asteroid-productivity'] = {
            prerequisites = {'space-platform'},
            unit = {count = 100, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
        },
        ['calcite-processing'] = {
            prerequisites = {'space-platform'},
            unit = {count = 100, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
        },
        ['railgun'] = {
            prerequisites = {'military-4', 'artillery', 'production-science-pack'},
            unit_count = 2500,
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        },
        -- SPACE_AGE 15
        ['fusion-reactor'] = {
            prerequisites = {'nuclear-power', 'space-science-pack'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['fusion-reactor-equipment'] = {
            prerequisites = {'fission-reactor-equipment', 'fusion-reactor'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['battery-mk3-equipment'] = {
            prerequisites = {'battery-mk2-equipment'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['rocket-turret'] = {
            prerequisites = {'rocketry', 'stronger-explosives-2', 'processing-unit'},
            effects = {{type = 'unlock-recipe', recipe = 'rocket-turret'}},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}}
        },
        ['toolbelt-equipment'] = {
            prerequisites = {'power-armor', 'toolbelt'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}
        },
        -- SPACE_AGE 20
        ['big-mining-drill'] = {
            prerequisites = {'electric-mining-drill', 'automation-3'},
            unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
        },
        ['tesla-weapons'] = {
            prerequisites = {'military-4', 'processing-unit'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}}
        },
        ['mech-armor'] = {
            prerequisites = {'power-armor-mk2', 'space-science-pack'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['power-armor-mk2'] = {
            prerequisites = {'power-armor', 'military-4', 'speed-module-2', 'efficiency-module-2'}
        },
        ['health'] = {
            prerequisites = {'utility-science-pack', 'space-science-pack'},
            unit_ingredients = {{'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        -- SPACE_AGE 25
        ['processing-unit-productivity'] = {
            prerequisites = {'processing-unit', 'electromagnetic-plant'},
            effects = {{type = 'change-recipe-productivity', recipe = 'processing-unit', change = 0.05}}
        },
        ['steel-plate-productivity'] = {
            prerequisites = {'foundry'},
            effects = {{type = 'change-recipe-productivity', recipe = 'steel-plate', change = 0.05}}
        },
        ['low-density-structure-productivity'] = {
            prerequisites = {'low-density-structure', 'electromagnetic-plant'},
            effects = {{type = 'change-recipe-productivity', recipe = 'low-density-structure', change = 0.05}}
        },
        ['plastic-bar-productivity'] = {
            prerequisites = {'plastics', 'cryogenic-plant'},
            effects = {{type = 'change-recipe-productivity', recipe = 'plastic-bar', change = 0.05}}
        },
        ['rocket-fuel-productivity'] = {
            prerequisites = {'rocket-fuel', 'electromagnetic-plant'},
            effects = {{type = 'change-recipe-productivity', recipe = 'solid-fuel-from-petroleum-gas', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'solid-fuel-from-light-oil', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'solid-fuel-from-heavy-oil', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'rocket-fuel', change = 0.05}}
        },
        -- SPACE_AGE 30
        ['rocket-part-productivity'] = {
            prerequisites = {'rocket-silo', 'electromagnetic-plant'},
            effects = {{type = 'change-recipe-productivity', recipe = 'rocket-part', change = 0.05}}
        },
        ['research-productivity'] = {
            prerequisites = {'space-science-pack', 'biolab'}
        },
        ['heating-tower'] = {
            prerequisites = {'chemical-science-pack'},
            effects = {{type = 'unlock-recipe', recipe = 'heating-tower'}},
            unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
        },
        ['agriculture'] = {
            prerequisites = {'chemical-science-pack'},
            effects = {{type = 'unlock-recipe', recipe = 'agricultural-tower'}},
            unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
        },
        ['tree-seeding'] = {
            prerequisites = {'agriculture'},
            unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
        }
        -- SPACE_AGE 35
    },
    ['recipe_reform'] = {
        -- BASE 0
        ['stack-inserter'] = {
            ingredients = {{type = 'item', name = 'processing-unit', amount = 3}, {type = 'item', name = 'steel-plate', amount = 8}, {type = 'item', name = 'bulk-inserter', amount = 1}}
        },
        ['productivity-module-3'] = {
            ingredients = {{type = 'item', name = 'advanced-circuit', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'productivity-module-2', amount = 4}}
        },
        ['efficiency-module-3'] = {
            ingredients = {{type = 'item', name = 'advanced-circuit', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'efficiency-module-2', amount = 4}}
        },
        ['power-armor-mk2'] = {
            ingredients = {{type = 'item', name = 'efficiency-module-2', amount = 25}, {type = 'item', name = 'speed-module-2', amount = 25}, {type = 'item', name = 'processing-unit', amount = 60}, {type = 'item', name = 'electric-engine-unit', amount = 40}, {type = 'item', name = 'low-density-structure', amount = 30}}
        },
        ['personal-roboport-mk2-equipment'] = {
            ingredients = {{type = 'item', name = 'personal-roboport-equipment', amount = 5}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'low-density-structure', amount = 20}}
        },
        -- BASE 5
        ['artillery-turret'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'concrete', amount = 60}, {type = 'item', name = 'iron-gear-wheel', amount = 40}, {type = 'item', name = 'advanced-circuit', amount = 20}}
        },
        ['artillery-wagon'] = {
            ingredients = {{type = 'item', name = 'engine-unit', amount = 64}, {type = 'item', name = 'iron-gear-wheel', amount = 10}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'pipe', amount = 16}, {type = 'item', name = 'advanced-circuit', amount = 20}}
        },
        ['artillery-shell'] = {
            ingredients = {{type = 'item', name = 'explosive-cannon-shell', amount = 4}, {type = 'item', name = 'radar', amount = 1}, {type = 'item', name = 'explosives', amount = 8}}
        },
        -- SPACE_AGE 0
        ['big-mining-drill'] = {
            ingredients = {{type = 'item', name = 'electric-mining-drill', amount = 1}, {type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electric-engine-unit', amount = 5}, {type = 'item', name = 'advanced-circuit', amount = 10}}
        },
        ['turbo-transport-belt'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'express-transport-belt', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 20}}
        },
        ['turbo-underground-belt'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'express-underground-belt', amount = 2}, {type = 'fluid', name = 'lubricant', amount = 40}}
        },
        ['turbo-splitter'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 5}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'express-splitter', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 80}}
        },
        ['toolbelt-equipment'] = {
            ingredients = {{type = 'item', name = 'advanced-circuit', amount = 3}, {type = 'item', name = 'steel-plate', amount = 4}}
        },
        -- SPACE_AGE 5
        ['battery-mk3-equipment'] = {
            ingredients = {{type = 'item', name = 'battery-mk2-equipment', amount = 5}, {type = 'item', name = 'battery', amount = 20}}
        },
        ['tesla-ammo'] = {
            ingredients = {{type = 'item', name = 'battery', amount = 1}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 10}}
        },
        ['teslagun'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
        },
        ['tesla-turret'] = {
            ingredients = {{type = 'item', name = 'teslagun', amount = 1}, {type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 500}}
        },
        ['mech-armor'] = {
            ingredients = {{type = 'item', name = 'power-armor-mk2', amount = 1}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'battery', amount = 50}}
        },
        -- SPACE_AGE 10
        ['railgun'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type == 'item', name = 'processing-unit', amount == 10}, {type == 'item', name == 'battery', amount == 10}, {type == 'fluid', name == 'sulfuric-acid', amount == 10}}
        },
        ['railgun-turret'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 30}, {type = 'item', name = 'processing-unit', amount = 25}, {type = 'item', name = 'battery', amount = 25}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
        },
        ['rocket-turret'] = {
            ingredients = {{type = 'item', name = 'rocket-launcher', amount = 4}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'processing-unit', amount = 4}, {type = 'item', name = 'iron-gear-wheel', amount = 20}}
        },
        ['fusion-reactor'] = {
            ingredients = {{type = 'item', name = 'nuclear-reactor', amount = 1}, {type = 'item', name = 'steel-plate', amount = 300}, {type = 'item', name = 'processing-unit', amount = 400}}
        },
        ['fusion-generator'] = {
            ingredients = {{type = 'item', name = 'steam-turbine', amount = 1}, {type == 'item', name == 'steel-plate', amount == 200}, {type == 'item', name == 'processing-unit', amount == 200}}
        },
        -- SPACE_AGE 15
        ['fusion-power-cell'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 20}, {type = 'fluid', name = 'petroleum-gas', amount = 200}},
            results = {{type = 'item', name = 'fusion-power-cell', amount = 4}}
        },
        ['fusion-reactor-equipment'] = {
            ingredients = {{type = 'item', name = 'fission-reactor-equipment', amount = 1}, {type = 'item', name = 'fusion-power-cell', amount = 10}, {type = 'item', name = 'steel-plate', amount = 350}, {type = 'item', name = 'processing-unit', amount = 275}}
        },
        ['fluoroketone'] = {
            ingredients = {{type = 'fluid', name = 'light-oil', amount = 50}, {type = 'fluid', name = 'petroleum-gas', amount = 50}, {type = 'item', name = 'steel-plate', amount = 1}}
        },
        ['agricultural-tower'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electronic-circuit', amount = 3}, {type = 'item', name = 'landfill', amount = 1}}
        },
        ['electromagnetic-plant'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'assembling-machine-3', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'fluid', name = 'sulfuric-acid', amount = 60}}
        },
        -- SPACE_AGE 20
        ['cryogenic-plant'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'chemical-plant', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'fluid', name = 'water', amount = 60}}
        },
        ['biolab'] = {
            ingredients = {{type = 'item', name = 'lab', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'item', name = 'processing-unit', amount = 60}, {type = 'item', name = 'uranium-235', amount = 3}}
        },
        ['foundry'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'coal', amount = 60}, {type = 'item', name = 'refined-concrete', amount = 40}, {type = 'item', name = 'electric-furnace', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 60}}
        }
    },
    ['tips_and_tricks_item'] = {
        -- SPACE_AGE 0
        'agriculture',
        'lava-processing'
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
        ['biochamber'] = true,
        ['space-platform-thruster'] = true,
        ['space-platform'] = true,
        ['asteroid-reprocessing'] = true,
        ['advanced-asteroid-processing'] = true,
        ['asteroid-productivity'] = true,
        ['calcite-processing'] = true,
        ['artillery-shell-damage-1'] = true,
        ['electric-weapons-damage-1'] = true,
        ['electric-weapons-damage-2'] = true,
        ['electric-weapons-damage-3'] = true,
        ['electric-weapons-damage-4'] = true,
        ['railgun-damage-1'] = true,
        ['railgun-shooting-speed-1'] = true,
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
        ['carbon'] = true,
        ['ice-melting'] = true,
        ['crusher'] = true
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
        ['ice'] = true,
        ['carbon'] = true,
        ['calcite'] = true,
        ['space-platform-foundation'] = true,
        ['asteroid-collector'] = true,
        ['crusher'] = true,
        ['thruster'] = true,
        ['space-platform-hub'] = true,
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
        ['metallurgic-science-pack'] = 'tool',
        ['thruster'] = 'thruster',
        ['crusher'] = 'assembling-machine',
        ['asteroid-collector'] = 'asteroid-collector',
        ['space-platform-hub'] = 'space-platform-hub',
        ['space-platform-starter-pack'] = 'space-platform-starter-pack',
        ['space-platform'] = 'surface'
    }
}

return items
