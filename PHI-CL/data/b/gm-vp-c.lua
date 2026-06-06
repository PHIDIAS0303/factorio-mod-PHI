local items = {
    ['entity_surface_conditions'] = {
        -- BASE 0
        'rocket-silo',
        'cargo-landing-pad',
        'fluid-turret',
        -- 2X
        'furnace',
        -- BASE 5
        'mining-drill',
        'inserter',
        'boiler',
        'roboport',
        'spider-vehicle',
        -- BASE 10
        -- 2X
        'car',
        'locomotive',
        'cargo-wagon',
        'fluid-wagon',
        -- BASE 15
        'artillery-wagon',
        'train-stop',
        'rail-signal',
        'rail-chain-signal',
        'straight-rail',
        -- BASE 20
        'legacy-curved-rail',
        'legacy-straight-rail',
        'curved-rail-a',
        'curved-rail-b',
        'half-diagonal-rail',
        -- BASE 25
        -- 5X
        'logistic-container',
        -- BASE 30
        -- 3X
        'container',
        -- ELEVATED_RAIL 0
        'rail-support',
        'rail-ramp',
        'elevated-straight-rail',
        'elevated-half-diagonal-rail',
        'elevated-curved-rail-a',
        -- ELEVATED_RAIL 5
        'elevated-curved-rail-b',
        -- SPACE_AGE 0
        -- 6X
        'assembling-machine',
        -- SPACE_AGE 5
        'agricultural-tower',
        'asteroid-collector',
        'fusion-reactor',
        'fusion-generator',
        -- SPACE_AGE 10
        'reactor',
        'furnace',
        'thruster',
        'lab',
        -- 3X
        'plant',
        -- SPACE_AGE 15
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
            category = 'cryogenics',
            ingredients = {{type = 'fluid', name = 'light-oil', amount = 50}, {type = 'fluid', name = 'petroleum-gas', amount = 50}, {type = 'item', name = 'steel-plate', amount = 1}}
        },
        ['agricultural-tower'] = {
            ingredients = {{type = 'item', name = 'steel-plate', amount = 20}, {type = 'item', name = 'electronic-circuit', amount = 10}, {type = 'item', name = 'landfill', amount = 4}}
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
        ['molten-iron'] = {
            energy_required = 1.6,
            ingredients = {{type = 'item', name = 'iron-ore', amount = 1}},
            results = {{type = 'fluid', name = 'molten-iron', amount = 10}}
        },
        -- SPACE_AGE 25
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
            energy_required = 32,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 100, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'steel-plate', amount = 3}}
        },
        ['casting-iron-gear-wheel'] = {
            energy_required = 6.9,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 40, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'iron-gear-wheel', amount = 3}}
        },
        -- SPACE_AGE 30
        ['casting-iron-stick'] = {
            energy_required = 3.7,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 20, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'iron-stick', amount = 6}}
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
        ['casting-copper-cable'] = {
            energy_required = 1.85,
            ingredients = {{type = 'fluid', name = 'molten-copper', amount = 10, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'copper-cable', amount = 3}}
        },
        -- SPACE_AGE 35
        ['metallurgic-science-pack'] = {
            energy_required = 10,
            ingredients = {{type = 'fluid', name = 'molten-iron', amount = 200, fluidbox_multiplier = 10}, {type = 'fluid', name = 'molten-copper', amount = 200, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'metallurgic-science-pack', amount = 2}}
        },
        ['electromagnetic-science-pack'] = {
            energy_required = 10,
            ingredients = {{type = 'fluid', name = 'electrolyte', amount = 20, fluidbox_multiplier = 10}, {type = 'item', name = 'solar-panel', amount = 1}, {type = 'item', name = 'accumulator', amount = 1}},
            results = {{type = 'item', name = 'electromagnetic-science-pack', amount = 2}}
        },
        ['cryogenic-science-pack'] = {
            energy_required = 10,
            ingredients = {{type = 'fluid', name = 'fluoroketone-cold', amount = 10, fluidbox_multiplier = 10, ignored_by_stats = 10}, {type = 'item', name = 'ice', amount = 5}},
            results = {{type = 'item', name = 'cryogenic-science-pack', amount = 2}, {type = 'fluid', name = 'fluoroketone-hot', amount = 5, fluidbox_multiplier = 10, ignored_by_stats = 5, ignored_by_productivity = 5}}
        },
        ['agricultural-science-pack'] = {
            category = 'crafting-with-fluid',
            energy_required = 10,
            ingredients = {{type = 'fluid', name = 'water', amount = 10, fluidbox_multiplier = 10}, {type = 'item', name = 'yumako-mash', amount = 1}, {type = 'item', name = 'jelly', amount = 1}},
            results = {{type = 'item', name = 'agricultural-science-pack', amount = 2}}
        },
        ['electrolyte'] = {
            energy_required = 2,
            ingredients = {{type = 'fluid', name = 'heavy-oil', amount = 10, fluidbox_multiplier = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 10, fluidbox_multiplier = 10}, {type = 'item', name = 'stone', amount = 1}},
            results = {{type = 'fluid', name = 'electrolyte', amount = 20, fluidbox_multiplier = 10}}
        },
        -- SPACE_AGE 40
        ['steam-condensation'] = {
            energy_required = 10,
            category = 'chemistry',
            ingredients = {{type = 'fluid', name = 'steam', amount = 800, fluidbox_multiplier = 10}},
            results = {{type = 'fluid', name = 'water', amount = 640, fluidbox_multiplier = 10}}
        },
        ['yumako-processing'] = {
            energy_required = 15,
            category = 'chemistry',
            ingredients = {{type = 'item', name = 'yumako', amount = 40}, {type = 'fluid', name = 'water', amount = 800, fluidbox_multiplier = 10, ignored_by_stats = 800}},
            results = {{type = 'item', name = 'yumako-mash', amount = 40}, {type = 'item', name = 'yumako-seed', amount = 1}, {type = 'fluid', name = 'steam', temperature = 500, amount = 640, fluidbox_multiplier = 10, ignored_by_stats = 640, ignored_by_productivity = 640}}
        },
        ['jellynut-processing'] = {
            energy_required = 15,
            category = 'chemistry',
            ingredients = {{type = 'item', name = 'jellynut', amount = 40}, {type = 'fluid', name = 'water', amount = 800, fluidbox_multiplier = 10, ignored_by_stats = 800}},
            results = {{type = 'item', name = 'jelly', amount = 40}, {type = 'item', name = 'jellynut-seed', amount = 1}, {type = 'fluid', name = 'steam', temperature = 500, amount = 640, fluidbox_multiplier = 10, ignored_by_stats = 640, ignored_by_productivity = 640}}
        },
        ['nutrients-from-yumako-mash'] = {
            energy_required = 15,
            category = 'chemistry',
            ingredients = {{type = 'item', name = 'yumako-mash', amount = 10}},
            results = {{type = 'item', name = 'nutrients', amount = 10}}
        },
        ['nutrients-from-fish'] = {
            energy_required = 15,
            category = 'chemistry',
            allow_productivity = true,
            ingredients = {{type = 'item', name = 'raw-fish', amount = 1}},
            results = {{type = 'item', name = 'nutrients', amount = 10}}
        },
        -- SPACE_AGE 45
        ['fish-breeding'] = {
            energy_required = 30,
            category = 'chemistry',
            allow_productivity = true,
            ingredients = {{type = 'item', name = 'raw-fish', amount = 8}, {type = 'item', name = 'nutrients', amount = 80}, {type = 'fluid', name = 'water', amount = 1000, fluidbox_multiplier = 10, ignored_by_stats = 1000}},
            results = {{type = 'item', name = 'raw-fish', amount = 12}, {type = 'fluid', name = 'water', amount = 1000, fluidbox_multiplier = 10, ignored_by_stats = 1000, ignored_by_productivity = 1000}}
        },
        ['biolubricant'] = {
            energy_required = 10,
            category = 'chemistry',
            allow_productivity = true,
            ingredients = {{type = 'item', name = 'jelly', amount = 10}, {type = 'fluid', name = 'water', amount = 40, fluidbox_multiplier = 10}},
            results = {{type = 'fluid', name = 'lubricant', amount = 40, fluidbox_multiplier = 10}}
        },
        ['bioflux'] = {
            energy_required = 10,
            category = 'chemistry',
            allow_productivity = true,
            ingredients = {{type = 'item', name = 'jelly', amount = 10}, {type = 'item', name = 'yumako-mash', amount = 10}, {type = 'fluid', name = 'water', amount = 40, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'bioflux', amount = 5}}
        },
        ['nutrients-from-bioflux'] = {
            energy_required = 10,
            category = 'chemistry',
            allow_productivity = true,
            ingredients = {{type = 'item', name = 'bioflux', amount = 10}},
            results = {{type = 'item', name = 'nutrients', amount = 20}}
        },
        ['carbon'] = {
            energy_required = 5,
            category = 'chemistry',
            allow_productivity = true,
            ingredients = {{type = 'item', name = 'coal', amount = 10}, {type = 'fluid', name = 'sulfuric-acid', amount = 80, fluidbox_multiplier = 10}},
            results = {{type = 'item', name = 'carbon', amount = 10}}
        },
        -- SPACE_AGE 50
        ['carbon-fiber'] = {
            energy_required = 5,
            category = 'chemistry',
            allow_productivity = true,
            ingredients = {{type = 'item', name = 'bioflux', amount = 10}, {type = 'item', name = 'carbon', amount = 10}},
            results = {{type = 'item', name = 'carbon-fiber', amount = 10}}
        },
    },
    ['recipe'] = {
        -- QUALITY 0
        ['recycler'] = true,
        -- SPACE_AGE 0
        ['lightning-collector'] = true,
        ['lightning-rod'] = true,
        ['promethium-science-pack'] = true,
        ['space-science-pack'] = true,
        ['burnt-spoilage'] = true,
        -- SPACE_AGE 5
        ['nutrients-from-biter-egg'] = true,
        ['copper-bacteria'] = true,
        ['copper-bacteria-cultivation'] = true,
        ['iron-bacteria'] = true,
        ['iron-bacteria-cultivation'] = true,
        -- SPACE_AGE 10
        ['nutrients-from-spoilage'] = true,
        ['spoilage-from-nutrients'] = true,
        ['casting-low-density-structure'] = true,
        ['space-platform-foundation'] = true,
        ['space-platform-starter-pack'] = true,
        -- SPACE_AGE 15
        ['advanced-carbonic-asteroid-crushing'] = true,
        ['advanced-oxide-asteroid-crushing'] = true,
        ['metallic-asteroid-reprocessing'] = true,
        ['carbonic-asteroid-reprocessing'] = true,
        ['oxide-asteroid-reprocessing'] = true,
        -- SPACE_AGE 20
        ['artificial-yumako-soil'] = true,
        ['overgrowth-yumako-soil'] = true,
        ['artificial-jellynut-soil'] = true,
        ['overgrowth-jellynut-soil'] = true,
        ['biochamber'] = true,
        -- SPACE_AGE 25
        ['captive-biter-spawner'] = true,
        ['capture-robot-rocket'] = true,
        ['biter-egg'] = true,
        ['pentapod-egg'] = true,
        ['tungsten-carbide'] = true,
        -- SPACE_AGE 30
        ['tungsten-plate'] = true,
        ['coal-synthesis'] = true,
        ['spoilage-recycling'] = true,
        ['asteroid-collector'] = true,
        ['ammoniacal-solution-separation'] = true,
        -- SPACE_AGE 35
        ['lithium'] = true,
        ['lithium-plate'] = true,
        ['ice-platform'] = true,
        ['solid-fuel-from-ammonia'] = true,
        ['ammonia-rocket-fuel'] = true,
        -- SPACE_AGE 40
        ['quantum-processor'] = true,
        ['holmium-solution'] = true,
        ['holmium-plate'] = true,
        ['supercapacitor'] = true,
        ['superconductor'] = true,
        -- SPACE_AGE 45
        ['molten-iron-from-lava'] = true,
        ['molten-copper-from-lava'] = true,
        ['acid-neutralisation'] = true,
        ['simple-coal-liquefaction'] = true,
        ['scrap-recycling'] = true,
        -- SPACE_AGE 50
        ['foundation'] = true,
        ['thruster'] = true,
        ['thruster-fuel'] = true,
        ['thruster-oxidizer'] = true,
        ['advanced-thruster-fuel'] = true,
        -- SPACE_AGE 55
        ['advanced-thruster-oxidizer'] = true,
        ['metallic-asteroid-crushing'] = true,
        ['carbonic-asteroid-crushing'] = true,
        ['oxide-asteroid-crushing'] = true,
        ['advanced-metallic-asteroid-crushing'] = true,
        -- SPACE_AGE 60
        ['crusher'] = true,
        ['bioplastic'] = true,
        ['biosulfur'] = true,
        ['rocket-fuel-from-jelly'] = true,
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
        ['iron-bacteria'] = true,
        ['copper-bacteria'] = true,
        ['spoilage'] = true,
        ['quantum-processor'] = true,
        -- SPACE_AGE 20
        ['biter-egg'] = true,
        ['pentapod-egg'] = true,
        ['lithium'] = true,
        ['lithium-plate'] = true,
        ['crusher'] = true,
        -- SPACE_AGE 25
        ['thruster'] = true,
        ['calcite'] = true,
        ['space-platform-foundation'] = true,
        ['space-platform-hub'] = true,
        ['asteroid-collector'] = true,
        -- SPACE_AGE 30
        ['carbonic-asteroid-chunk'] = true,
        ['metallic-asteroid-chunk'] = true,
        ['promethium-asteroid-chunk'] = true,
        ['oxide-asteroid-chunk'] = true,
    },
    ['tips_and_tricks_item'] = {
        ['quality'] = true,
        ['space-age'] = true,
        ['space-platform'] = true,
        ['spoilables'] = true
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
        ['research-with-promethium'] = 'research-with-science-pack-achievement',
        ['get-off-my-lawn'] = 'group-attack-achievement',
        ['if-it-bleeds'] = 'kill-achievement',
        -- SPACE_AGE 10
        ['we-need-bigger-guns'] = 'kill-achievement',
        ['size-doesnt-matter'] = 'kill-achievement',
        ['visit-vulcanus'] = 'change-surface-achievement',
        ['visit-gleba'] = 'change-surface-achievement',
        ['visit-fulgora'] = 'change-surface-achievement',
        -- SPACE_AGE 15
        ['visit-aquilo'] = 'change-surface-achievement'
    },
    ['hidden_resource'] = {
        -- SPACE_AGE RESOURCE_GENERATION 0
        'vulcanus-coal',
        'sulfuric-acid-geyser',
        'fulgora-islands',
        'gleba-enemy-base',
        'fulgora-cliff',
        -- SPACE_AGE RESOURCE_GENERATION 5
        'gleba-stone',
        'aquilo-crude-oil',
        'gleba-cliff',
        'gleba-water',
        'gleba-plants',
        -- SPACE_AGE RESOURCE_GENERATION 10
        'vulcanus-volcanism',
        'calcite',
        'scrap',
        'fluorine-vent',
        'lithium-brine',
        -- SPACE_AGE RESOURCE_GENERATION 15
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
        ['thruster'] = 'thruster',
        ['lightning'] = 'lightning',
        -- SPACE_AGE ENTITY 10
        ['small-demolisher'] = 'segmented-unit',
        ['medium-demolisher'] = 'segmented-unit',
        ['big-demolisher'] = 'segmented-unit',
        ['small-wriggler-pentapod-premature'] = 'unit',
        ['medium-wriggler-pentapod-premature'] = 'unit',
        -- SPACE_AGE ENTITY 15
        ['big-wriggler-pentapod-premature'] = 'unit',
        ['small-wriggler-pentapod'] = 'unit',
        ['medium-wriggler-pentapod'] = 'unit',
        ['big-wriggler-pentapod'] = 'unit',
        ['small-strafer-pentapod'] = 'spider-unit',
        -- SPACE_AGE ENTITY 20
        ['medium-strafer-pentapod'] = 'spider-unit',
        ['big-strafer-pentapod'] = 'spider-unit',
        ['small-stomper-pentapod'] = 'spider-unit',
        ['medium-stomper-pentapod'] = 'spider-unit',
        ['big-stomper-pentapod'] = 'spider-unit',
        -- SPACE_AGE ENTITY 25
        ['gleba-spawner'] = 'unit-spawner',
        ['gleba-spawner-small'] = 'unit-spawner',
        ['ashland-lichen-tree'] = 'tree',
        ['ashland-lichen-tree-flaming'] = 'tree',
        ['slipstack'] = 'tree',
        -- SPACE_AGE ENTITY 30
        ['funneltrunk'] = 'tree',
        ['hairyclubnub'] = 'tree',
        ['teflilly'] = 'tree',
        ['lickmaw'] = 'tree',
        ['stingfrond'] = 'tree',
        -- SPACE_AGE ENTITY 35
        ['boompuff'] = 'tree',
        ['sunnycomb'] = 'tree',
        ['cuttlepop'] = 'tree',
        ['water-cane'] = 'tree',
        ['small-stomper-shell'] = 'simple-entity',
        -- SPACE_AGE ENTITY 40
        ['medium-stomper-shell'] = 'simple-entity',
        ['big-stomper-shell'] = 'simple-entity',
        ['big-volcanic-rock'] = 'simple-entity',
        ['huge-volcanic-rock'] = 'simple-entity',
        ['copper-stromatolite'] = 'simple-entity',
        -- SPACE_AGE ENTITY 45
        ['iron-stromatolite'] = 'simple-entity',
        ['vulcanus-chimney-short'] = 'simple-entity',
        ['vulcanus-chimney-truncated'] = 'simple-entity',
        ['vulcanus-chimney'] = 'simple-entity',
        ['vulcanus-chimney-cold'] = 'simple-entity',
        -- SPACE_AGE ENTITY 50
        ['vulcanus-chimney-faded'] = 'simple-entity',
        ['big-fulgora-rock'] = 'simple-entity',
        ['fulgurite'] = 'simple-entity',
        ['fulgurite-small'] = 'simple-entity',
        ['fulgoran-ruin-small'] = 'simple-entity',
        -- SPACE_AGE ENTITY 55
        ['fulgoran-ruin-medium'] = 'simple-entity',
        ['fulgoran-ruin-stonehenge'] = 'simple-entity',
        ['fulgoran-ruin-big'] = 'simple-entity',
        ['fulgoran-ruin-colossal'] = 'simple-entity',
        ['fulgoran-ruin-huge'] = 'simple-entity',
        -- SPACE_AGE ENTITY 60
        ['fulgoran-ruin-vault'] = 'simple-entity',
        ['lithium-iceberg-big'] = 'simple-entity',
        ['lithium-iceberg-huge'] = 'simple-entity',
        ['small-demolisher-corpse'] = 'simple-entity',
        ['medium-demolisher-corpse'] = 'simple-entity',
        -- SPACE_AGE ENTITY 65
        ['big-demolisher-corpse'] = 'simple-entity',
        -- SPACE_AGE FLUID 0
        ['thruster-oxidizer'] = 'fluid',
        ['thruster-fuel'] = 'fluid',
        ['lithium-brine'] = 'fluid',
        ['fluorine'] = 'fluid',
        ['ammonia'] = 'fluid',
        -- SPACE_AGE FLUID 5
        ['ammoniacal-solution'] = 'fluid',
        ['holmium-solution'] = 'fluid',
        ['lava'] = 'fluid',
        -- SPACE_AGE ITEM 0
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
        ['promethium-science-pack'] = 'tool',
    },
    ['technology_productivity'] = {
        -- BASE 0
        ['concrete'] = {
            mod = 'base',
            prerequisites = {'landfill'},
            ingredients = {'metallurgic-science-pack', 'electromagnetic-science-pack'},
            effect = {'concrete', 'concrete-from-molten-iron', 'refined-concrete', 'landfill'}
        },
        ['automation'] = {
            mod = 'base',
            prerequisites = {},
            ingredients = {'metallurgic-science-pack', 'electromagnetic-science-pack'},
            effect = {'pipe', 'casting-pipe', 'iron-gear-wheel', 'casting-iron-gear-wheel', 'barrel'}
        },
        ['electronics'] = {
            mod = 'base',
            prerequisites = {},
            ingredients = {'metallurgic-science-pack', 'electromagnetic-science-pack'},
            effect = {'electronic-circuit', 'copper-cable', 'casting-copper-cable'}
        },
        ['advanced-circuit'] = {
            mod = 'base',
            prerequisites = {},
            ingredients = {'electromagnetic-science-pack'},
            effect = {'advanced-circuit'}
        },
        ['engine'] = {
            mod = 'base',
            prerequisites = {},
            ingredients = {'electromagnetic-science-pack'},
            effect = {'engine-unit', 'electric-engine-unit', 'flying-robot-frame'}
        },
        -- BASE 5
        ['solar-energy'] = {
            mod = 'base',
            prerequisites = {},
            ingredients = {'electromagnetic-science-pack'},
            effect = {'solar-panel', 'accumulator', 'battery'}
        },
        ['railway'] = {
            mod = 'base',
            prerequisites = {},
            ingredients = {'electromagnetic-science-pack'},
            effect = {'rail', 'iron-stick', 'casting-iron-stick'}
        },
        ['sulfur-processing'] = {
            mod = 'base',
            prerequisites = {'cliff-explosives'},
            ingredients = {'cryogenic-science-pack'},
            effect = {'sulfur', 'sulfuric-acid', 'explosives', 'cliff-explosives'}
        },
        ['oil-processing'] = {
            mod = 'base',
            prerequisites = {},
            ingredients = {'cryogenic-science-pack'},
            effect = {'basic-oil-processing', 'advanced-oil-processing', 'coal-liquefaction', 'lubricant'}
        },
        -- SPACE_AGE 0
        ['agriculture'] = {
            mod = 'space-age',
            prerequisites = {},
            ingredients = {'agricultural-science-pack'},
            effect = {'yumako-processing', 'jellynut-processing'}
        },
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
            prerequisites = {'rocket-silo', 'production-science-pack', 'utility-science-pack'},
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
            prerequisites = {'mining-productivity-2', 'space-science-pack'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        -- SPACE_AGE 0
        ['stack-inserter'] = {
            prerequisites = {'bulk-inserter', 'processing-unit'},
            unit = {count = 800, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}}
        },
        ['transport-belt-capacity-1'] = {
            prerequisites = {'stack-inserter', 'logistics-3', 'utility-science-pack'},
            unit = {count = 1600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
        },
        ['transport-belt-capacity-2'] = {
            prerequisites = {'transport-belt-capacity-1', 'space-science-pack'},
            unit = {count = 2400, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}}
        },
        ['turbo-transport-belt'] = {
            prerequisites = {'logistics-3', 'utility-science-pack'},
            unit = {count = 800, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
        },
        ['electromagnetic-plant'] = {
            prerequisites = {'automation-3', 'utility-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'electromagnetic-plant'}, {type = 'unlock-recipe', recipe = 'electrolyte'}}
        },
        -- SPACE_AGE 5
        ['foundry'] = {
            prerequisites = {'automation-3', 'utility-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'foundry'}, {type = 'unlock-recipe', recipe = 'molten-iron'}, {type = 'unlock-recipe', recipe = 'molten-copper'}, {type = 'unlock-recipe', recipe = 'casting-iron'}, {type = 'unlock-recipe', recipe = 'casting-copper'}, {type = 'unlock-recipe', recipe = 'casting-steel'}, {type = 'unlock-recipe', recipe = 'casting-iron-gear-wheel'}, {type = 'unlock-recipe', recipe = 'casting-iron-stick'}, {type = 'unlock-recipe', recipe = 'casting-pipe'}, {type = 'unlock-recipe', recipe = 'casting-pipe-to-ground'}, {type = 'unlock-recipe', recipe = 'concrete-from-molten-iron'}, {type = 'unlock-recipe', recipe = 'casting-copper-cable'}, {type = 'unlock-recipe', recipe = 'casting-low-density-structure'}}
        },
        ['cryogenic-plant'] = {
            prerequisites = {'automation-3', 'coal-liquefaction', 'utility-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'cryogenic-plant'}, {type = 'unlock-recipe', recipe = 'fluoroketone'}, {type = 'unlock-recipe', recipe = 'fluoroketone-cooling'}}
        },
        ['biolab'] = {
            prerequisites = {'automation-3', 'utility-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}}
        },
        ['railgun'] = {
            prerequisites = {'military-4', 'artillery', 'production-science-pack'},
            unit_count = 2500,
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
        },
        ['fusion-reactor'] = {
            prerequisites = {'nuclear-power', 'cryogenic-plant', 'space-science-pack'},
            effects = {{type = 'unlock-recipe', recipe = 'fusion-reactor'}, {type = 'unlock-recipe', recipe = 'fusion-generator'}, {type = 'unlock-recipe', recipe = 'fusion-power-cell'}},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        -- SPACE_AGE 10
        ['fusion-reactor-equipment'] = {
            prerequisites = {'fission-reactor-equipment', 'fusion-reactor'},
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}
        },
        ['battery-mk3-equipment'] = {
            prerequisites = {'battery-mk2-equipment', 'space-science-pack'},
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
        ['big-mining-drill'] = {
            prerequisites = {'electric-mining-drill', 'automation-3'},
            unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}}}
        },
        -- SPACE_AGE 15
        ['tesla-weapons'] = {
            prerequisites = {'military-4'},
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
            prerequisites = {'space-science-pack', 'agricultural-science-pack'},
            unit_ingredients = {{'military-science-pack', 1}, {'chemical-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}, {'agricultural-science-pack', 1}}
        },
        ['processing-unit-productivity'] = {
            prerequisites = {'electromagnetic-science-pack'},
            unit_count_formula = '1000 * (1.5 ^ (L - 1))',
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'electromagnetic-science-pack', 1}},
            max_level = 10,
            effects = {{type = 'change-recipe-productivity', recipe = 'processing-unit', change = 0.05}}
        },
        -- SPACE_AGE 20
        ['steel-plate-productivity'] = {
            prerequisites = {'metallurgic-science-pack'},
            unit_count_formula = '1000 * (1.5 ^ (L - 1))',
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'metallurgic-science-pack', 1}},
            max_level = 10,
            effects = {{type = 'change-recipe-productivity', recipe = 'steel-plate', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'casting-steel', change = 0.05}}
        },
        ['low-density-structure-productivity'] = {
            prerequisites = {'electromagnetic-science-pack'},
            unit_count_formula = '1000 * (1.5 ^ (L - 1))',
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'electromagnetic-science-pack', 1}},
            max_level = 10,
            effects = {{type = 'change-recipe-productivity', recipe = 'low-density-structure', change = 0.05}}
        },
        ['plastic-bar-productivity'] = {
            prerequisites = {'cryogenic-science-pack'},
            unit_count_formula = '1000 * (1.5 ^ (L - 1))',
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'cryogenic-science-pack', 1}},
            max_level = 10,
            effects = {{type = 'change-recipe-productivity', recipe = 'plastic-bar', change = 0.05}}
        },
        ['rocket-fuel-productivity'] = {
            prerequisites = {'rocket-fuel', 'cryogenic-science-pack'},
            unit_count_formula = '1000 * (1.5 ^ (L - 1))',
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'cryogenic-science-pack', 1}},
            max_level = 10,
            effects = {{type = 'change-recipe-productivity', recipe = 'solid-fuel-from-petroleum-gas', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'solid-fuel-from-light-oil', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'solid-fuel-from-heavy-oil', change = 0.05}, {type = 'change-recipe-productivity', recipe = 'rocket-fuel', change = 0.05}}
        },
        ['rocket-part-productivity'] = {
            prerequisites = {'rocket-silo', 'electromagnetic-science-pack'},
            unit_count_formula = '1000 * (1.5 ^ (L - 1))',
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'electromagnetic-science-pack', 1}},
            max_level = 10,
            effects = {{type = 'change-recipe-productivity', recipe = 'rocket-part', change = 0.05}}
        },
        -- SPACE_AGE 25
        ['research-productivity'] = {
            prerequisites = {'space-science-pack', 'biolab', 'metallurgic-science-pack', 'electromagnetic-science-pack', 'cryogenic-science-pack'},
            unit_count_formula = '1500 * (1.5 ^ L)',
            unit_ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}, {'metallurgic-science-pack', 1}, {'electromagnetic-science-pack', 1}, {'cryogenic-science-pack', 1}},
            max_level = 10,
        },
        ['heating-tower'] = {
            prerequisites = {'chemical-science-pack'},
            unit = {count = 400, time = 30, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'heating-tower'}},
        },
        ['agriculture'] = {
            prerequisites = {'chemical-science-pack'},
            unit = {count = 1000, time = 60, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'agricultural-tower'}, {type = 'unlock-recipe', recipe = 'yumako-processing'}, {type = 'unlock-recipe', recipe = 'jellynut-processing'}, {type = 'unlock-recipe', recipe = 'steam-condensation'}, {type = 'give-item', item = 'yumako-seed', count = 2}, {type = 'give-item', item = 'jellynut-seed', count = 2}},
        },
        ['tree-seeding'] = {
            prerequisites = {'agricultural-science-pack'},
            unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'agricultural-science-pack', 1}}}
        },
        ['metallurgic-science-pack'] = {
            prerequisites = {'foundry'},
            unit = {count = 400, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'metallurgic-science-pack'}}
        },
        -- SPACE_AGE 30
        ['electromagnetic-science-pack'] = {
            prerequisites = {'electromagnetic-plant'},
            unit = {count = 400, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'electromagnetic-science-pack'}}
        },
        ['cryogenic-science-pack'] = {
            prerequisites = {'cryogenic-plant'},
            unit = {count = 400, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'cryogenic-science-pack'}}
        },
        ['agricultural-science-pack'] = {
            prerequisites = {'agriculture'},
            unit = {count = 400, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'agricultural-science-pack'}}
        },
        ['fish-breeding'] = {
            prerequisites = {'agricultural-science-pack'},
            unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'agricultural-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'fish-breeding'}, {type = 'unlock-recipe', recipe = 'nutrients-from-fish'}, {type = 'unlock-recipe', recipe = 'nutrients-from-yumako-mash'}}
        },
        ['bioflux'] = {
            prerequisites = {'agricultural-science-pack'},
            unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'agricultural-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'bioflux'}, {type = 'unlock-recipe', recipe = 'nutrients-from-bioflux'}, {type = 'unlock-recipe', recipe = 'biolubricant'}}
        },
        -- SPACE_AGE 35
        ['carbon-fiber'] = {
            prerequisites = {'agricultural-science-pack'},
            unit = {count = 600, time = 45, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'agricultural-science-pack', 1}}},
            effects = {{type = 'unlock-recipe', recipe = 'carbon'}, {type = 'unlock-recipe', recipe = 'carbon-fiber'}}
        },
    },
    ['technology'] = {
        -- SPACE_AGE 0
        ['planet-discovery-vulcanus'] = true,
        ['planet-discovery-gleba'] = true,
        ['planet-discovery-fulgora'] = true,
        ['planet-discovery-aquilo'] = true,
        ['recycling'] = true,
        -- SPACE_AGE 5
        ['lightning-collector'] = true,
        ['foundation'] = true,
        ['biochamber'] = true,
        ['asteroid-productivity'] = true,
        ['asteroid-reprocessing'] = true,
        -- SPACE_AGE 10
        ['artificial-soil'] = true,
        ['overgrowth-soil'] = true,
        ['bacteria-cultivation'] = true,
        ['yumako'] = true,
        ['jellynut'] = true,
        -- SPACE_AGE 15
        ['calcite-processing'] = true,
        ['captivity'] = true,
        ['biter-egg-handling'] = true,
        ['promethium-science-pack'] = true,
        ['advanced-asteroid-processing'] = true,
        -- SPACE_AGE 20
        ['rail-support-foundations'] = true,
        ['captive-biter-spawner'] = true,
        ['space-platform-thruster'] = true,
        ['space-platform'] = true,
        ['scrap-recycling-productivity'] = true,
        -- SPACE_AGE 25
        ['bioflux-processing'] = true,
        -- SPACE_AGE 30
        ['tungsten-carbide'] = true,
        ['tungsten-steel'] = true,
        ['holmium-processing'] = true,
        ['lithium-processing'] = true,
        ['quantum-processor'] = true,
    },
}

return items
