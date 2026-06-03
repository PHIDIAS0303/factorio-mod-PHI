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
    ['technology_ingredient_removal'] = {
        -- SPACE_AGE 0
        ['metallurgic-science-pack'] = true,
        ['agricultural-science-pack'] = true,
        ['electromagnetic-science-pack'] = true,
        ['cryogenic-science-pack'] = true,
        ['promethium-science-pack'] = true
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
            effects = {{type = 'unlock-recipe', recipe = 'foundry'}, {type = 'unlock-recipe', recipe = 'molten-iron'}, {type = 'unlock-recipe', recipe = 'molten-copper'}, {type = 'unlock-recipe', recipe = 'casting-iron'}, {type = 'unlock-recipe', recipe = 'casting-copper'}, {type = 'unlock-recipe', recipe = 'casting-steel'}, {type = 'unlock-recipe', recipe = 'casting-iron-gear-wheel'}, {type = 'unlock-recipe', recipe = 'casting-iron-stick'}, {type = 'unlock-recipe', recipe = 'casting-pipe'}, {type = 'unlock-recipe', recipe = 'casting-pipe-to-ground'}, {type = 'unlock-recipe', recipe = 'concrete-from-molten-iron'}, {type = 'unlock-recipe', recipe = 'casting-copper-cable'}, {type = 'unlock-recipe', recipe = 'casting-low-density-structure'}}
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
            effects = {{type = 'change-recipe-productivity', recipe = 'steel-plate', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'casting-steel', change = 0.05}}
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
        ['express-transport-belt'] = {
            category = 'crafting-with-fluid',
        },
        ['express-underground-belt'] = {
            category = 'crafting-with-fluid',
        },
        -- BASE 10
        ['express-splitter'] = {
            category = 'crafting-with-fluid'
        },
        ['transport-belt'] = {
            category = 'crafting',
        },
        -- SPACE_AGE 0
        ['big-mining-drill'] = {
            category = 'crafting',
            ingredients = {{type = 'item', name = 'electric-mining-drill', amount = 1}, {type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electric-engine-unit', amount = 2}, {type = 'item', name = 'advanced-circuit', amount = 5}}
        },
        ['turbo-transport-belt'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 4}, {type = 'item', name = 'express-transport-belt', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 20}}
        },
        ['turbo-underground-belt'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 20}, {type = 'item', name = 'express-underground-belt', amount = 2}, {type = 'fluid', name = 'lubricant', amount = 40}}
        },
        ['turbo-splitter'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 4}, {type = 'item', name = 'processing-unit', amount = 2}, {type = 'item', name = 'express-splitter', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 80}}
        },
        ['toolbelt-equipment'] = {
            ingredients = {{type = 'item', name = 'advanced-circuit', amount = 3}, {type = 'item', name = 'steel-plate', amount = 4}}
        },
        -- SPACE_AGE 5
        ['battery-mk3-equipment'] = {
            ingredients = {{type = 'item', name = 'battery-mk2-equipment', amount = 5}, {type = 'item', name = 'battery', amount = 20}}
        },
        ['tesla-ammo'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'battery', amount = 1}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 5}}
        },
        ['teslagun'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 5}, {type = 'item', name = 'plastic-bar', amount = 1}, {type = 'fluid', name = 'sulfuric-acid', amount = 25}}
        },
        ['tesla-turret'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'teslagun', amount = 1}, {type = 'item', name = 'steel-plate', amount = 20}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
        },
        ['mech-armor'] = {
            ingredients = {{type = 'item', name = 'power-armor-mk2', amount = 1}, {type = 'item', name = 'processing-unit', amount = 100}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'battery', amount = 50}}
        },
        -- SPACE_AGE 10
        ['railgun'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'processing-unit', amount = 10}, {type = 'item', name = 'battery', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 10}}
        },
        ['railgun-turret'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 80}, {type = 'item', name = 'processing-unit', amount = 40}, {type = 'item', name = 'battery', amount = 40}, {type = 'fluid', name = 'sulfuric-acid', amount = 100}}
        },
        ['rocket-turret'] = {
            ingredients = {{type = 'item', name = 'rocket-launcher', amount = 4}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'processing-unit', amount = 4}, {type = 'item', name = 'iron-gear-wheel', amount = 20}}
        },
        ['fusion-reactor'] = {
            category = 'crafting',
            ingredients = {{type = 'item', name = 'nuclear-reactor', amount = 1}, {type = 'item', name = 'steel-plate', amount = 200}, {type = 'item', name = 'processing-unit', amount = 320}}
        },
        ['fusion-generator'] = {
            category = 'crafting',
            ingredients = {{type = 'item', name = 'steam-turbine', amount = 1}, {type = 'item', name = 'steel-plate', amount = 80}, {type = 'item', name = 'processing-unit', amount = 40}}
        },
        -- SPACE_AGE 15
        ['fusion-power-cell'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 20}, {type = 'fluid', name = 'petroleum-gas', amount = 200}},
            results = {{type = 'item', name = 'fusion-power-cell', amount = 4}}
        },
        ['fusion-reactor-equipment'] = {
            ingredients = {{type = 'item', name = 'fission-reactor-equipment', amount = 1}, {type = 'item', name = 'fusion-power-cell', amount = 10}, {type = 'item', name = 'steel-plate', amount = 350}, {type = 'item', name = 'processing-unit', amount = 275}}
        },
        ['fluoroketone'] = {
            category = 'chemistry',
            ingredients = {{type = 'fluid', name = 'light-oil', amount = 50}, {type = 'fluid', name = 'petroleum-gas', amount = 50}, {type = 'item', name = 'steel-plate', amount = 1}}
        },
        ['agricultural-tower'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 10}, {type = 'item', name = 'electronic-circuit', amount = 3}, {type = 'item', name = 'landfill', amount = 1}}
        },
        ['electromagnetic-plant'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'processing-unit', amount = 20}, {type = 'item', name = 'assembling-machine-3', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 40}, {type = 'fluid', name = 'sulfuric-acid', amount = 80}}
        },
        -- SPACE_AGE 20
        ['cryogenic-plant'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'processing-unit', amount = 20}, {type = 'item', name = 'chemical-plant', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 40}, {type = 'fluid', name = 'water', amount = 80}}
        },
        ['biolab'] = {
            ingredients = {{type = 'item', name = 'lab', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 60}, {type = 'item', name = 'processing-unit', amount = 60}, {type = 'item', name = 'uranium-235', amount = 3}}
        },
        ['foundry'] = {
            category = 'crafting-with-fluid',
            ingredients = {{type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'processing-unit', amount = 20}, {type = 'item', name = 'coal', amount = 40}, {type = 'item', name = 'refined-concrete', amount = 40}, {type = 'item', name = 'electric-furnace', amount = 1}, {type = 'fluid', name = 'lubricant', amount = 80}}
        },
        ['turbo-loader'] = {
            category = 'crafting',
        },
        ['fluoroketone-cooling'] = {
            category = 'chemistry',
        },
        -- SPACE_AGE 25
        ['molten-iron'] = {
            energy_required = 1.6,
            ingredients = {{type = 'item', name = 'iron-ore', amount = 1}},
            results = {{type = 'fluid', name = 'molten-iron', amount = 10}}
        },
        ['molten-copper'] = {
            energy_required = 1.6,
            ingredients = {{type = 'item', name = 'copper-ore', amount = 1}},
            results = {{type = 'fluid', name = 'molten-copper', amount = 10}}
        },
        ['casting-iron'] = {
            energy_required = 1.6,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 10, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'iron-plate', amount = 1}}
        },
        ['casting-copper'] = {
            energy_required = 1.6,
            ingredients = {{type = 'fluid', name = 'molten-copper', amount = 10, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'copper-plate', amount = 1}}
        },
        ['casting-steel'] = {
            energy_required = 16,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 50, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'steel-plate', amount = 2}}
        },
        -- SPACE_AGE 30
        ['casting-iron-gear-wheel'] = {
            energy_required = 3.45,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 20, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'iron-gear-wheel', amount = 2}}
        },
        ['casting-iron-stick'] = {
            energy_required = 1.85,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 10, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'iron-stick', amount = 4}}
        },
        ['casting-pipe'] = {
            energy_required = 3.45,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 20, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'pipe', amount = 3}}
        },
        ['casting-pipe-to-ground'] = {
            energy_required = 8.25,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 50, fluidbox_multiplier = 10}, {type = 'item', name = 'pipe', amount = 10}},
            results = {{type = 'item', name = 'pipe-to-ground', amount = 3}}
        },
        ['concrete-from-molten-iron'] = {
            energy_required = 5,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 10, fluidbox_multiplier = 10}, {type = 'item', name = 'stone-brick', amount = 5}},
            results = {{type = 'item', name = 'concrete', amount = 10}}
        },
        -- SPACE_AGE 35
        ['casting-copper-cable'] = {
            energy_required = 1.85,
            ingredients = {{type = 'fluid', name = 'molten-copper', amount = 10, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'copper-cable', amount = 3}}
        },
    },
    ['tips_and_tricks_item'] = {
        ['quality'] = true,
        ['space-age'] = true,
        ['space-platform'] = true,
        ['spoilables'] = true
    },
    ['technology'] = {
        -- SPACE_AGE 0
        'planet-discovery-vulcanus',
        'planet-discovery-gleba',
        'planet-discovery-fulgora',
        'planet-discovery-aquilo',
        'recycling',
        -- SPACE_AGE 5
        'lightning-collector',
        'tungsten-carbide',
        'tungsten-steel',
        'metallurgic-science-pack',
        'yumako',
        -- SPACE_AGE 10
        'jellynut',
        'bioflux',
        'artificial-soil',
        'overgrowth-soil',
        'bacteria-cultivation',
        -- SPACE_AGE 15
        'bioflux-processing',
        'agricultural-science-pack',
        'captivity',
        'biter-egg-handling',
        'carbon-fiber',
        -- SPACE_AGE 20
        'fish-breeding',
        'holmium-processing',
        'electromagnetic-science-pack',
        'rail-support-foundations',
        'lithium-processing',
        -- SPACE_AGE 25
        'quantum-processor',
        'cryogenic-science-pack',
        'captive-biter-spawner',
        'promethium-science-pack',
        'foundation',
        -- SPACE_AGE 30
        'scrap-recycling-productivity',
        'biochamber',
        'space-platform-thruster',
        'space-platform',
        'asteroid-reprocessing',
        -- SPACE_AGE 35
        'advanced-asteroid-processing',
        'asteroid-productivity',
        'calcite-processing',
    },
    ['achievement'] = {
        -- SPACE_AGE 0
        ['logistic-network-embargo'] = 'dont-build-entity-achievement',
        ['reach-for-the-stars'] = 'create-platform-achievement',
        ['second-star-to-the-right-and-straight-on-till-morning'] = 'complete-objective-achievement',
        ['rush-to-space'] = 'dont-research-before-researching-achievement',
        ['shattered-planet-1'] = 'space-connection-distance-traveled-achievement',
        -- SPACE_AGE 5
        ['shattered-planet-2'] = 'space-connection-distance-traveled-achievement',
        ['shattered-planet-3'] = 'space-connection-distance-traveled-achievement',
        ['research-with-metallurgics'] = 'research-with-science-pack-achievement',
        ['research-with-agriculture'] = 'research-with-science-pack-achievement',
        ['research-with-electromagnetics'] = 'research-with-science-pack-achievement',
        -- SPACE_AGE 10
        ['research-with-cryogenics'] = 'research-with-science-pack-achievement',
        ['research-with-promethium'] = 'research-with-science-pack-achievement',
        ['it-stinks-and-they-do-like-it'] = 'group-attack-achievement',
        ['get-off-my-lawn'] = 'group-attack-achievement',
        ['if-it-bleeds'] = 'kill-achievement',
        -- SPACE_AGE 15
        ['we-need-bigger-guns'] = 'kill-achievement',
        ['size-doesnt-matter'] = 'kill-achievement',
        ['visit-vulcanus'] = 'change-surface-achievement',
        ['visit-gleba'] = 'change-surface-achievement',
        ['visit-fulgora'] = 'change-surface-achievement',
        -- SPACE_AGE 20
        ['visit-aquilo'] = 'change-surface-achievement'
    },
    ['recipe'] = {
        -- QUALITY 0
        ['recycler'] = true,
        -- SPACE_AGE 0
        ['lightning-collector'] = true,
        ['lightning-rod'] = true,
        ['agricultural-science-pack'] = true,
        ['cryogenic-science-pack'] = true,
        ['electromagnetic-science-pack'] = true,
        -- SPACE_AGE 5
        ['metallurgic-science-pack'] = true,
        ['promethium-science-pack'] = true,
        ['space-science-pack'] = true,
        ['burnt-spoilage'] = true,
        ['fish-breeding'] = true,
        -- SPACE_AGE 10
        ['nutrients-from-fish'] = true,
        ['nutrients-from-biter-egg'] = true,
        ['yumako-processing'] = true,
        ['jellynut-processing'] = true,
        ['copper-bacteria'] = true,
        -- SPACE_AGE 15
        ['copper-bacteria-cultivation'] = true,
        ['iron-bacteria'] = true,
        ['iron-bacteria-cultivation'] = true,
        ['nutrients-from-spoilage'] = true,
        ['nutrients-from-yumako-mash'] = true,
        -- SPACE_AGE 20
        ['nutrients-from-bioflux'] = true,
        ['pentapod-egg'] = true,
        ['rocket-fuel-from-jelly'] = true,
        ['bioflux'] = true,
        ['bioplastic'] = true,
        -- SPACE_AGE 25
        ['biosulfur'] = true,
        ['biolubricant'] = true,
        ['carbon-fiber'] = true,
        ['artificial-yumako-soil'] = true,
        ['overgrowth-yumako-soil'] = true,
        -- SPACE_AGE 30
        ['artificial-jellynut-soil'] = true,
        ['overgrowth-jellynut-soil'] = true,
        ['biochamber'] = true,
        ['captive-biter-spawner'] = true,
        ['capture-robot-rocket'] = true,
        -- SPACE_AGE 35
        ['biter-egg'] = true,
        ['spoilage-from-nutrients'] = true,
        ['tungsten-carbide'] = true,
        ['tungsten-plate'] = true,
        ['coal-synthesis'] = true,
        -- SPACE_AGE 40
        ['spoilage-recycling'] = true,
        ['asteroid-collector'] = true,
        ['ammoniacal-solution-separation'] = true,
        ['lithium'] = true,
        ['lithium-plate'] = true,
        -- SPACE_AGE 45
        ['ice-platform'] = true,
        ['solid-fuel-from-ammonia'] = true,
        ['ammonia-rocket-fuel'] = true,
        ['quantum-processor'] = true,
        ['holmium-solution'] = true,
        -- SPACE_AGE 50
        ['holmium-plate'] = true,
        ['electrolyte'] = true,
        ['supercapacitor'] = true,
        ['superconductor'] = true,
        ['molten-iron-from-lava'] = true,
        -- SPACE_AGE 55
        ['molten-copper-from-lava'] = true,
        ['acid-neutralisation'] = true,
        ['simple-coal-liquefaction'] = true,
        ['scrap-recycling'] = true,
        ['foundation'] = true,
        -- SPACE_AGE 60
        ['steam-condensation'] = true,
        ['thruster'] = true,
        ['thruster-fuel'] = true,
        ['thruster-oxidizer'] = true,
        ['advanced-thruster-fuel'] = true,
        -- SPACE_AGE 65
        ['advanced-thruster-oxidizer'] = true,
        ['metallic-asteroid-crushing'] = true,
        ['carbonic-asteroid-crushing'] = true,
        ['oxide-asteroid-crushing'] = true,
        ['advanced-metallic-asteroid-crushing'] = true,
        -- SPACE_AGE 70
        ['advanced-carbonic-asteroid-crushing'] = true,
        ['advanced-oxide-asteroid-crushing'] = true,
        ['metallic-asteroid-reprocessing'] = true,
        ['carbonic-asteroid-reprocessing'] = true,
        ['oxide-asteroid-reprocessing'] = true,
        -- SPACE_AGE 75
        ['space-platform-foundation'] = true,
        ['space-platform-starter-pack'] = true,
        ['carbon'] = true,
        ['crusher'] = true,
        ['casting-low-density-structure'] = true
    },
    ['item'] = {
        -- QUALITY 0
        ['recycler'] = true,
        -- SPACE_AGE 0
        ['artificial-yumako-soil'] = true,
        ['overgrowth-yumako-soil'] = true,
        ['artificial-jellynut-soil'] = true,
        ['overgrowth-jellynut-soil'] = true,
        ['ice-platform'] = true,
        -- SPACE_AGE 5
        ['foundation'] = true,
        ['biochamber'] = true,
        ['captive-biter-spawner'] = true,
        ['tungsten-ore'] = true,
        ['tungsten-carbide'] = true,
        -- SPACE_AGE 10
        ['tungsten-plate'] = true,
        ['scrap'] = true,
        ['holmium-ore'] = true,
        ['holmium-plate'] = true,
        ['superconductor'] = true,
        -- SPACE_AGE 15
        ['supercapacitor'] = true,
        ['yumako-seed'] = true,
        ['jellynut-seed'] = true,
        ['iron-bacteria'] = true,
        ['copper-bacteria'] = true,
        -- SPACE_AGE 20
        ['spoilage'] = true,
        ['nutrients'] = true,
        ['carbon-fiber'] = true,
        ['biter-egg'] = true,
        ['pentapod-egg'] = true,
        -- SPACE_AGE 25
        ['lithium'] = true,
        ['lithium-plate'] = true,
        ['quantum-processor'] = true,
        ['ice'] = true,
        ['carbon'] = true,
        -- SPACE_AGE 30
        ['calcite'] = true,
        ['space-platform-foundation'] = true,
        ['asteroid-collector'] = true,
        ['crusher'] = true,
        ['thruster'] = true,
        -- SPACE_AGE 35
        ['space-platform-hub'] = true,
        ['carbonic-asteroid-chunk'] = true,
        ['metallic-asteroid-chunk'] = true,
        ['promethium-asteroid-chunk'] = true,
        ['oxide-asteroid-chunk'] = true,
    },
    ['hidden_resource'] = {
        -- SPACE_AGE RESOURCE_GENERATION 0
        'vulcanus-coal',
        'tungsten-ore',
        'sulfuric-acid-geyser',
        'fulgora-islands',
        'gleba-enemy-base',
        -- SPACE_AGE RESOURCE_GENERATION 5
        'fluorine-vent',
        'lithium-brine',
        'gleba-stone',
        'aquilo-crude-oil',
        'gleba-cliff',
        -- SPACE_AGE RESOURCE_GENERATION 10
        'fulgora-cliff',
        'vulcanus-volcanism',
        'gleba-water',
        'gleba-plants',
        'calcite',
        -- SPACE_AGE RESOURCE_GENERATION 15
        'scrap',
    },
    ['hidden'] = {
        -- QUALITY ENTITY 0
        ['recycler'] = 'furnace',
        -- SPACE_AGE ENTITY 0
        ['biochamber'] = 'assembling-machine',
        ['captive-biter-spawner'] = 'assembling-machine',
        ['crusher'] = 'assembling-machine',
        ['lightning-rod']= 'lightning-attractor',
        ['lightning-collector'] = 'lightning-attractor',
        -- SPACE_AGE ENTITY 5
        ['fulgoran-ruin-attractor'] = 'lightning-attractor',
        ['asteroid-collector'] = 'asteroid-collector',
        ['space-platform-hub'] = 'space-platform-hub',
        ['yumako-tree'] = 'plant',
        ['jellystem'] = 'plant',
        -- SPACE_AGE ENTITY 10
        ['thruster'] = 'thruster',
        ['lightning'] = 'lightning',
        ['small-demolisher'] = 'segmented-unit',
        ['medium-demolisher'] = 'segmented-unit',
        ['big-demolisher'] = 'segmented-unit',
        -- SPACE_AGE ENTITY 15
        ['small-wriggler-pentapod-premature'] = 'unit',
        ['medium-wriggler-pentapod-premature'] = 'unit',
        ['big-wriggler-pentapod-premature'] = 'unit',
        ['small-wriggler-pentapod'] = 'unit',
        ['medium-wriggler-pentapod'] = 'unit',
        -- SPACE_AGE ENTITY 20
        ['big-wriggler-pentapod'] = 'unit',
        ['small-strafer-pentapod'] = 'spider-unit',
        ['medium-strafer-pentapod'] = 'spider-unit',
        ['big-strafer-pentapod'] = 'spider-unit',
        ['small-stomper-pentapod'] = 'spider-unit',
        -- SPACE_AGE ENTITY 25
        ['medium-stomper-pentapod'] = 'spider-unit',
        ['big-stomper-pentapod'] = 'spider-unit',
        ['gleba-spawner'] = 'unit-spawner',
        ['gleba-spawner-small'] = 'unit-spawner',
        ['ashland-lichen-tree'] = 'tree',
        -- SPACE_AGE ENTITY 30
        ['ashland-lichen-tree-flaming'] = 'tree',
        ['slipstack'] = 'tree',
        ['funneltrunk'] = 'tree',
        ['hairyclubnub'] = 'tree',
        ['teflilly'] = 'tree',
        -- SPACE_AGE ENTITY 35
        ['lickmaw'] = 'tree',
        ['stingfrond'] = 'tree',
        ['boompuff'] = 'tree',
        ['sunnycomb'] = 'tree',
        ['cuttlepop'] = 'tree',
        -- SPACE_AGE ENTITY 40
        ['water-cane'] = 'tree',
        ['small-stomper-shell'] = 'simple-entity',
        ['medium-stomper-shell'] = 'simple-entity',
        ['big-stomper-shell'] = 'simple-entity',
        ['big-volcanic-rock'] = 'simple-entity',
        -- SPACE_AGE ENTITY 45
        ['huge-volcanic-rock'] = 'simple-entity',
        ['copper-stromatolite'] = 'simple-entity',
        ['iron-stromatolite'] = 'simple-entity',
        ['vulcanus-chimney-short'] = 'simple-entity',
        ['vulcanus-chimney-truncated'] = 'simple-entity',
        -- SPACE_AGE ENTITY 50
        ['vulcanus-chimney'] = 'simple-entity',
        ['vulcanus-chimney-cold'] = 'simple-entity',
        ['vulcanus-chimney-faded'] = 'simple-entity',
        ['big-fulgora-rock'] = 'simple-entity',
        ['fulgurite'] = 'simple-entity',
        -- SPACE_AGE ENTITY 55
        ['fulgurite-small'] = 'simple-entity',
        ['fulgoran-ruin-small'] = 'simple-entity',
        ['fulgoran-ruin-medium'] = 'simple-entity',
        ['fulgoran-ruin-stonehenge'] = 'simple-entity',
        ['fulgoran-ruin-big'] = 'simple-entity',
        -- SPACE_AGE ENTITY 60
        ['fulgoran-ruin-colossal'] = 'simple-entity',
        ['fulgoran-ruin-huge'] = 'simple-entity',
        ['fulgoran-ruin-vault'] = 'simple-entity',
        ['lithium-iceberg-big'] = 'simple-entity',
        ['lithium-iceberg-huge'] = 'simple-entity',
        -- SPACE_AGE ENTITY 65
        ['small-demolisher-corpse'] = 'simple-entity',
        ['medium-demolisher-corpse'] = 'simple-entity',
        ['big-demolisher-corpse'] = 'simple-entity',
        -- SPACE_AGE FLUID 0
        ['thruster-oxidizer'] = 'fluid',
        ['thruster-fuel'] = 'fluid',
        ['lithium-brine'] = 'fluid',
        ['fluorine'] = 'fluid',
        ['ammonia'] = 'fluid',
        -- SPACE_AGE FLUID 5
        ['ammoniacal-solution'] = 'fluid',
        ['electrolyte'] = 'fluid',
        ['holmium-solution'] = 'fluid',
        ['molten-copper'] = 'fluid',
        ['molten-iron'] = 'fluid',
        -- SPACE_AGE FLUID 10
        ['lava'] = 'fluid',
        -- SPACE_AGE ITEM 0
        ['bioflux'] = 'capsule',
        ['jelly'] = 'capsule',
        ['jellynut'] = 'capsule',
        ['yumako'] = 'capsule',
        ['yumako-mash'] = 'capsule',
        -- SPACE_AGE ITEM 5
        ['capture-robot-rocket'] = 'ammo',
        ['space-platform-starter-pack'] = 'space-platform-starter-pack',
        -- SPACE_AGE MAP_GENERATION 0
        ['vulcanus_coal'] = 'autoplace-control',
        ['tungsten_ore'] = 'autoplace-control',
        ['calcite'] = 'autoplace-control',
        ['sulfuric_acid_geyser'] = 'autoplace-control',
        ['scrap'] = 'autoplace-control',
        -- SPACE_AGE MAP_GENERATION 5
        ['fluorine_vent'] = 'autoplace-control',
        ['lithium_brine'] = 'autoplace-control',
        ['gleba_stone'] = 'autoplace-control',
        ['aquilo_crude_oil'] = 'autoplace-control',
        ['gleba_cliff'] = 'autoplace-control',
        -- SPACE_AGE MAP_GENERATION 10
        ['fulgora_cliff'] = 'autoplace-control',
        ['vulcanus_volcanism'] = 'autoplace-control',
        ['gleba_water'] = 'autoplace-control',
        ['gleba_plants'] = 'autoplace-control',
        ['gleba_enemy_base'] = 'autoplace-control',
        -- SPACE_AGE MAP_GENERATION 15
        ['fulgora_islands'] = 'autoplace-control',
        ['cliff-fulgora'] = 'cliff',
        ['cliff-gleba'] = 'cliff',
        ['cliff-vulcanus'] = 'cliff',
        ['crater-cliff'] = 'cliff',
        -- SPACE_AGE MAP_GENERATION 20
        ['space-platform'] = 'surface',
        -- SPACE_AGE TILE 0
        ['empty-space'] = 'tile',
        ['space-platform-foundation'] = 'tile',
        ['foundation'] = 'tile',
        -- SPACE_AGE TOOL 0
        ['agricultural-science-pack'] = 'tool',
        ['cryogenic-science-pack'] = 'tool',
        ['electromagnetic-science-pack'] = 'tool',
        ['metallurgic-science-pack'] = 'tool',
    }
}

return items
