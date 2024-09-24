local items = {
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
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'solar-panel',
            name = 'solar-panel',
            ref_name = 'solar-panel',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-SOLAR-TIER'].value,
            base = 60
        },
        ['accumulator'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'accumulator',
            name = 'accumulator',
            ref_name = 'accumulator',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-SOLAR-TIER'].value,
            base = 5
        },
        ['boiler'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'boiler',
            name = 'boiler',
            ref_name = 'boiler',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-STEAM-TIER'].value,
            base = 1800,
            temp = 150,
            fluid = 1
        },
        ['steam-engine'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'generator',
            name = 'steam-engine',
            ref_name = 'steam-engine',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-STEAM-TIER'].value,
            base = 150,
            fluid = 0.5
        },
        ['nuclear-reactor'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'reactor',
            name = 'nuclear-reactor',
            ref_name = 'nuclear-reactor',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-NUCLEAR-TIER'].value,
            base = 40,
            bonus = 1,
            temp = 500
        },
        ['heat-pipe'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'heat-pipe',
            name = 'heat-pipe',
            ref_name = 'heat-pipe',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-NUCLEAR-TIER'].value,
            temp = 500
        },
        ['heat-exchanger'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'boiler',
            name = 'heat-exchanger',
            ref_name = 'heat-exchanger',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-NUCLEAR-TIER'].value,
            base = 10000,
            temp = 485,
            fluid = 103 / 60
        },
        ['steam-turbine'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'generator',
            name = 'steam-turbine',
            ref_name = 'steam-turbine',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-NUCLEAR-TIER'].value,
            base = 485,
            fluid = 1
        },
        ['assembling-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'assembling-machine',
            name = 'assembling-machine',
            ref_name = 'assembling-machine-3',
            tech = 'automation-3',
            min = 4,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value + 2
        },
        ['electric-furnace'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'furnace',
            name = 'electric-furnace',
            ref_name = 'electric-furnace',
            tech = 'advanced-material-processing-2',
            min = 2,
            max = settings.startup['PHI-MB-FURNACE-TIER'].value
        },
        ['oil-refinery'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'assembling-machine',
            name = 'oil-refinery',
            ref_name = 'oil-refinery',
            tech = 'oil-processing',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        },
        ['chemical-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'assembling-machine',
            name = 'chemical-plant',
            ref_name = 'chemical-plant',
            tech = 'oil-processing',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        },
        ['centrifuge'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'assembling-machine',
            name = 'centrifuge',
            ref_name = 'centrifuge',
            tech = 'uranium-processing',
            min = 2,
            max = settings.startup['PHI-MB-CENTRIFUGE-TIER'].value
        },
        ['rocket-silo'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'rocket-silo',
            name = 'rocket-silo',
            ref_name = 'rocket-silo',
            tech = 'rocket-silo',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        },
        ['lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'lab',
            name = 'lab',
            ref_name = 'lab',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        },
        ['electric-mining-drill'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'mining-drill',
            name = 'electric-mining-drill',
            ref_name = 'electric-mining-drill',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
        },
        ['pumpjack'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'mining-drill',
            name = 'pumpjack',
            ref_name = 'pumpjack',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
        },
        ['electric-filter-furnace'] = {
            enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-RS'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'electric-filter-furnace',
            ref_name = 'electric-filter-furnace',
            tech = 'advanced-material-processing-2',
            min = 2,
            max = settings.startup['PHI-MB-FURNACE-TIER'].value
        },
        ['laser-turret'] = {
            enabled = settings.startup['PHI-WE'].value,
            stage = 1,
            type = 'electric-turret',
            name = 'laser-turret',
            ref_name = 'laser-turret',
            tech = 'laser-turret',
            min = 2,
            max = settings.startup['PHI-WE-LASER-TIER'].value
        },
        ['flamethrower-turret'] = {
            enabled = settings.startup['PHI-WE'].value,
            stage = 1,
            type = 'fluid-turret',
            name = 'flamethrower-turret',
            ref_name = 'flamethrower-turret',
            tech = 'flamethrower',
            min = 2,
            max = settings.startup['PHI-WE-FLAME-TIER'].value
        },
        ['gun-turret'] = {
            enabled = settings.startup['PHI-WE'].value,
            stage = 1,
            type = 'ammo-turret',
            name = 'gun-turret',
            ref_name = 'gun-turret',
            tech = 'gun-turret',
            min = 2,
            max = settings.startup['PHI-WE-GUN-TIER'].value
        },
        ['radar'] = {
            enabled = settings.startup['PHI-WE'].value,
            stage = 1,
            type = 'radar',
            name = 'radar',
            ref_name = 'radar',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-WE-RADAR-TIER'].value
        }
    },
    ['equipment'] = {
        ['solar-panel-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'solar-panel-equipment',
            name = 'solar-panel',
            ref_name = 'solar-panel-equipment',
            tech = 'solar-panel-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-SOLAR-TIER'].value,
            base = 30,
            graphics_name = 'solar-panel-equipment'
        },
        ['fusion-reactor-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'generator-equipment',
            name = 'fusion-reactor',
            ref_name = 'fusion-reactor-equipment',
            tech = 'fusion-reactor-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-REACTOR-TIER'].value,
            base = 750,
            graphics_name = 'fusion-reactor-equipment'
        },
        ['battery-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'battery-equipment',
            name = 'battery',
            ref_name = 'battery-mk2-equipment',
            tech = 'battery-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-EQ-BATTERY-TIER'].value,
            base = 100,
            graphics_name = 'battery-mk2-equipment'
        },
        ['personal-laser-defense-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'active-defense-equipment',
            name = 'personal-laser-defense',
            ref_name = 'personal-laser-defense-equipment',
            tech = 'personal-laser-defense-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-LASER-TIER'].value,
            base = 3,
            graphics_name = 'personal-laser-defense-equipment'
        },
        ['energy-shield-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'energy-shield-equipment',
            name = 'energy-shield',
            ref_name = 'energy-shield-mk2-equipment',
            tech = 'energy-shield-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-EQ-SHIELD-TIER'].value,
            base = 150,
            graphics_name = 'energy-shield-mk2-equipment'
        },
        ['personal-roboport-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'roboport-equipment',
            name = 'personal-roboport',
            ref_name = 'personal-roboport-mk2-equipment',
            tech = 'personal-roboport-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-EQ-ROBOPORT-TIER'].value,
            base = 0.5,
            graphics_name = 'personal-roboport-mk2-equipment'
        },
        ['night-vision-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'night-vision-equipment',
            name = 'night-vision',
            ref_name = 'night-vision-equipment',
            tech = 'night-vision-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-NIGHT-TIER'].value,
            graphics_name = 'night-vision-equipment'
        },
        ['exoskeleton-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'movement-bonus-equipment',
            name = 'exoskeleton',
            ref_name = 'exoskeleton-equipment',
            tech = 'exoskeleton-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-EXO-TIER'].value,
            base = 0.6,
            graphics_name = 'exoskeleton-equipment'
        }
    },
    ['bonus'] = {
        player_bonus = {
            ['character_mining_speed_modifier'] = {
                value = settings.startup['PHI-PB-CMMS'].value
            },
            ['character_running_speed_modifier'] = {
                value = settings.startup['PHI-PB-CRS'].value
            },
            ['character_crafting_speed_modifier'] = {
                value = settings.startup['PHI-PB-CCS'].value
            },
            ['character_inventory_slots_bonus'] = {
                value = settings.startup['PHI-PB-CISB'].value
            },
            ['character_health_bonus'] = {
                value = settings.startup['PHI-PB-CHB'].value
            },
            ['character_reach_distance_bonus'] = {
                value = settings.startup['PHI-PB-CRDB'].value,
                combined_bonus = {
                    'character_resource_reach_distance_bonus',
                    'character_build_distance_bonus'
                }
            }
        }
    },
    ['recipe'] = {
        ['iron-plate'] = {
            enabled = true,
            tech = 'automation'
        },
        ['copper-plate'] = {
            enabled = true,
            tech = 'automation'
        },
        ['stone-brick'] = {
            enabled = true,
            tech = 'automation'
        },
        ['steel-plate'] = {
            enabled = true,
            tech = 'steel-processing'
        },
        ['electronic-circuit'] = {
            enabled = true,
            tech = 'automation'
        },
        ['advanced-circuit'] = {
            enabled = true,
            tech = 'advanced-electronics'
        },
        ['processing-unit'] = {
            enabled = true,
            tech = 'advanced-electronics-2'
        },
        ['copper-cable'] = {
            enabled = true,
            tech = 'automation'
        },
        ['iron-stick'] = {
            enabled = true,
            tech = 'automation'
        },
        ['iron-gear-wheel'] = {
            enabled = true,
            tech = 'automation'
        },
        ['pipe'] = {
            enabled = true,
            tech = 'automation'
        },
        ['engine-unit'] = {
            enabled = true,
            tech = 'engine'
        },
        ['electric-engine-unit'] = {
            enabled = true,
            tech = 'electric-engine'
        },
        ['flying-robot-frame'] = {
            enabled = true,
            tech = 'robotics'
        },
        ['low-density-structure'] = {
            enabled = true,
            tech = 'low-density-structure'
        },
        ['rocket-fuel'] = {
            enabled = true,
            tech = 'rocket-fuel'
        },
        ['rocket-control-unit'] = {
            enabled = true,
            tech = 'rocket-control-unit'
        },
        ['basic-oil-processing'] = {
            enabled = true,
            tech = 'oil-processing'
        },
        ['advanced-oil-processing'] = {
            enabled = true,
            tech = 'advanced-oil-processing'
        },
        ['heavy-oil-cracking'] = {
            enabled = true,
            tech = 'advanced-oil-processing'
        },
        ['light-oil-cracking'] = {
            enabled = true,
            tech = 'advanced-oil-processing'
        },
        ['solid-fuel-from-light-oil'] = {
            enabled = true,
            tech = 'advanced-oil-processing'
        },
        ['solid-fuel-from-heavy-oil'] = {
            enabled = true,
            tech = 'advanced-oil-processing'
        },
        ['solid-fuel-from-petroleum-gas'] = {
            enabled = true,
            tech = 'oil-processing'
        },
        ['coal-liquefaction'] = {
            enabled = true,
            tech = 'coal-liquefaction'
        },
        ['sulfur'] = {
            enabled = true,
            tech = 'sulfur-processing'
        },
        ['sulfuric-acid'] = {
            enabled = true,
            tech = 'sulfur-processing'
        },
        ['lubricant'] = {
            enabled = true,
            tech = 'lubricant'
        },
        ['plastic-bar'] = {
            enabled = true,
            tech = 'plastics'
        },
        ['battery'] = {
            enabled = true,
            tech = 'battery'
        },
        ['explosives'] = {
            enabled = true,
            tech = 'explosives'
        },
        ['cliff-explosives'] = {
            enabled = true,
            tech = 'cliff-explosives'
        },
        ['empty-barrel'] = {
            enabled = true,
            tech = 'fluid-handling'
        },
        ['automation-science-pack'] = {
            enabled = true,
            tech = 'automation'
        },
        ['logistic-science-pack'] = {
            enabled = true,
            tech = 'logistic-science-pack'
        },
        ['chemical-science-pack'] = {
            enabled = true,
            tech = 'chemical-science-pack'
        },
        ['military-science-pack'] = {
            enabled = true,
            tech = 'military-science-pack'
        },
        ['production-science-pack'] = {
            enabled = true,
            tech = 'production-science-pack'
        },
        ['utility-science-pack'] = {
            enabled = true,
            tech = 'utility-science-pack'
        },
        ['fast-inserter'] = {
            enabled = false,
            tech = 'fast-inserter'
        },
        ['filter-inserter'] = {
            enabled = false,
            tech = 'fast-inserter'
        },
        ['long-handed-inserter'] = {
            enabled = false,
            tech = 'automation'
        },
        ['stack-inserter'] = {
            enabled = false,
            tech = 'stack-inserter'
        },
        ['stack-filter-inserter'] = {
            enabled = false,
            tech = 'stack-inserter'
        },
        ['inserter'] = {
            enabled = true,
            tech = 'automation'
        },
        ['transport-belt'] = {
            enabled = true,
            tech = 'automation'
        },
        ['grenade'] = {
            enabled = true,
            tech = 'military-2'
        },
        ['firearm-magazine'] = {
            enabled = true,
            tech = 'automation'
        },
        ['piercing-rounds-magazine'] = {
            enabled = true,
            tech = 'military-2'
        },
        ['stone-wall'] = {
            enabled = true,
            tech = 'stone-wall'
        },
        ['rail'] = {
            enabled = true,
            tech = 'railway'
        },
        ['electric-furnace'] = {
            enabled = true,
            tech = 'advanced-material-processing-2'
        },
        ['concrete'] = {
            enabled = true,
            tech = 'concrete'
        },
        ['uranium-processing'] = {
            enabled = true,
            tech = 'uranium-processing'
        },
        ['uranium-fuel-cell'] = {
            enabled = true,
            tech = 'uranium-processing'
        },
        ['nuclear-fuel-reprocessing'] = {
            enabled = true,
            tech = 'nuclear-fuel-reprocessing'
        },
        ['kovarex-enrichment-process'] = {
            enabled = true,
            tech = 'kovarex-enrichment-process'
        },
        ['nuclear-fuel'] = {
            enabled = true,
            tech = 'kovarex-enrichment-process'
        },
        ['uranium-rounds-magazine'] = {
            enabled = true,
            tech = 'uranium-ammo'
        },
        ['explosive-cannon-shell'] = {
            enabled = true,
            tech = 'tank'
        },
        ['artillery-shell'] = {
            enabled = true,
            tech = 'artillery'
        },
        ['rocket'] = {
            enabled = true,
            tech = 'rocketry'
        },
        ['explosive-rocket'] = {
            enabled = true,
            tech = 'explosive-rocketry'
        },
        ['solar-panel'] = {
            enabled = true,
            tech = 'solar-energy'
        },
        ['accumulator'] = {
            enabled = true,
            tech = 'electric-energy-accumulators'
        },
        ['radar'] = {
            enabled = true,
            tech = 'automation'
        },
        ['speed-module'] = {
            enabled = false,
            tech = 'speed-module'
        },
        ['speed-module-2'] = {
            enabled = false,
            tech = 'speed-module-2'
        },
        ['speed-module-3'] = {
            enabled = false,
            tech = 'speed-module-3'
        },
        ['productivity-module'] = {
            enabled = false,
            tech = 'productivity-module'
        },
        ['productivity-module-2'] = {
            enabled = false,
            tech = 'productivity-module-2'
        },
        ['productivity-module-3'] = {
            enabled = false,
            tech = 'productivity-module-3'
        },
        ['effectivity-module'] = {
            enabled = false,
            tech = 'effectivity-module'
        },
        ['effectivity-module-2'] = {
            enabled = false,
            tech = 'effectivity-module-2'
        },
        ['effectivity-module-3'] = {
            enabled = false,
            tech = 'effectivity-module-3'
        }
    }
}

if mods then
    if mods['aai-industry'] then
        items['item']['industrial-furnace'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'industrial-furnace',
            ref_name = 'industrial-furnace',
            tech = 'industrial-furnace',
            min = 2,
            max = settings.startup['PHI-MB-FURNACE-TIER'].value
        }

        items['item']['fuel-processor'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'fuel-processor',
            ref_name = 'fuel-processor',
            tech = 'fuel-processing',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        }
    end

    if mods['aai-industry'] or mods['big-mining-drill'] then
        items['item']['area-mining-drill'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'mining-drill',
            name = 'area-mining-drill',
            ref_name = 'area-mining-drill',
            tech = 'area-mining-drill',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
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

        items['item']['lab'].stage = 2

        items['item']['kr-gas-power-station'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 2,
            type = 'generator',
            name = 'kr-gas-power-station',
            ref_name = 'kr-gas-power-station',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-STEAM-TIER'].value,
            base = 0.1
        }

        items['item']['kr-crusher'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-crusher',
            ref_name = 'kr-crusher',
            tech = 'kr-crusher',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-fluid-burner'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-fluid-burner',
            ref_name = 'kr-fluid-burner',
            tech = 'kr-fluid-excess-handling',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-air-purifier'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-air-purifier',
            ref_name = 'kr-air-purifier',
            tech = 'kr-air-purification',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-advanced-furnace'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-furnace',
            ref_name = 'kr-advanced-furnace',
            tech = 'kr-advanced-furnace',
            min = 2,
            max = settings.startup['PHI-MB-FURNACE-TIER'].value
        }

        items['item']['kr-advanced-chemical-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-chemical-plant',
            ref_name = 'kr-advanced-chemical-plant',
            tech = 'kr-advanced-chemical-plant',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        }

        items['item']['kr-advanced-assembling-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-assembling-machine',
            ref_name = 'kr-advanced-assembling-machine',
            tech = 'kr-automation',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-greenhouse'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-greenhouse',
            ref_name = 'kr-greenhouse',
            tech = 'kr-greenhouse',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-bio-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-bio-lab',
            ref_name = 'kr-bio-lab',
            tech = 'kr-bio-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-electrolysis-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-electrolysis-plant',
            ref_name = 'kr-electrolysis-plant',
            tech = 'kr-fluids-chemistry',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-filtration-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-filtration-plant',
            ref_name = 'kr-filtration-plant',
            tech = 'kr-fluids-chemistry',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-fuel-refinery'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-fuel-refinery',
            ref_name = 'kr-fuel-refinery',
            tech = 'kr-fuel',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-atmospheric-condenser'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-atmospheric-condenser',
            ref_name = 'kr-atmospheric-condenser',
            tech = 'kr-atmosphere-condensation',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-advanced-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'lab',
            name = 'biusart-lab',
            ref_name = 'biusart-lab',
            tech = 'kr-advanced-lab',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        }

        items['item']['kr-singularity-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'lab',
            name = 'kr-singularity-lab',
            ref_name = 'kr-singularity-lab',
            tech = 'kr-singularity-lab',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        }

        items['item']['kr-research-server'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-research-server',
            ref_name = 'kr-research-server',
            tech = 'kr-research-server',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-quantum-computer'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-quantum-computer',
            ref_name = 'kr-quantum-computer',
            tech = 'kr-quantum-computer',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-matter-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-matter-plant',
            ref_name = 'kr-matter-plant',
            tech = 'kr-matter-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-matter-assembler'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-matter-assembler',
            ref_name = 'kr-matter-assembler',
            tech = 'kr-matter-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-quarry-drill'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'mining-drill',
            name = 'kr-quarry-drill',
            ref_name = 'kr-quarry-drill',
            tech = 'kr-quarry-minerals-extraction',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
        }
    end

    if (not mods['Krastorio2']) and mods['space-exploration'] then
        items['item']['solar-panel'].base = 60
        items['item']['accumulator'].base = 5
    end

    if mods['space-exploration'] then
        items['item']['se-space-solar-panel'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 2,
            type = 'solar-panel',
            name = 'se-space-solar-panel',
            ref_name = 'se-space-solar-panel',
            tech = 'compound-energy',
            min = 4,
            max = settings.startup['PHI-EN-SOLAR-TIER'].value,
            base = 400
        }

        items['item']['se-space-assembling-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-assembling-machine',
            ref_name = 'se-space-assembling-machine',
            tech = 'se-space-assembling',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-manufactory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-manufactory',
            ref_name = 'se-space-manufactory',
            tech = 'se-space-manufactory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-casting-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-casting-machine',
            ref_name = 'se-casting-machine',
            tech = 'se-pyroflux-smelting',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-pulveriser'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-pulveriser',
            ref_name = 'se-pulveriser',
            tech = 'se-pulveriser',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-lifesupport-facility'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-lifesupport-facility',
            ref_name = 'se-lifesupport-facility',
            tech = 'se-lifesupport-facility',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-fuel-refinery'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-fuel-refinery',
            ref_name = 'se-fuel-refinery',
            tech = 'se-fuel-refining',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        }

        items['item']['se-space-decontamination-facility'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-decontamination-facility',
            ref_name = 'se-space-decontamination-facility',
            tech = 'se-space-decontamination-facility',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-genetics-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-genetics-laboratory',
            ref_name = 'se-space-genetics-laboratory',
            tech = 'se-space-genetics-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-growth-facility'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-growth-facility',
            ref_name = 'se-space-growth-facility',
            tech = 'se-space-growth-facility',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-biochemical-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-biochemical-laboratory',
            ref_name = 'se-space-biochemical-laboratory',
            tech = 'se-space-biochemical-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-radiation-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-radiation-laboratory',
            ref_name = 'se-space-radiation-laboratory',
            tech = 'se-space-radiation-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-electromagnetics-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-electromagnetics-laboratory',
            ref_name = 'se-space-electromagnetics-laboratory',
            tech = 'se-space-electromagnetics-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-laser-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-laser-laboratory',
            ref_name = 'se-space-laser-laboratory',
            tech = 'se-space-laser-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-astrometrics-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-astrometrics-laboratory',
            ref_name = 'se-space-astrometrics-laboratory',
            tech = 'se-space-astrometrics-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-gravimetrics-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-gravimetrics-laboratory',
            ref_name = 'se-space-gravimetrics-laboratory',
            tech = 'se-space-gravimetrics-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-mechanical-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-mechanical-laboratory',
            ref_name = 'se-space-mechanical-laboratory',
            tech = 'se-space-mechanical-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-material-fabricator'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-material-fabricator',
            ref_name = 'se-space-material-fabricator',
            tech = 'se-space-material-fabricator',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-particle-accelerator'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-particle-accelerator',
            ref_name = 'se-space-particle-accelerator',
            tech = 'se-space-particle-accelerator',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-particle-collider'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-particle-collider',
            ref_name = 'se-space-particle-collider',
            tech = 'se-space-particle-collider',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-plasma-generator'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-plasma-generator',
            ref_name = 'se-space-plasma-generator',
            tech = 'se-space-plasma-generator',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-hypercooler'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-hypercooler',
            ref_name = 'se-space-hypercooler',
            tech = 'se-space-hypercooling-1',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-radiator'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-radiator',
            ref_name = 'se-space-radiator-2',
            tech = 'se-space-radiator-2',
            min = 3,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value + 1
        }

        items['item']['se-space-telescope'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope',
            ref_name = 'se-space-telescope',
            tech = 'se-space-telescope',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-telescope-gammaray'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-gammaray',
            ref_name = 'se-space-telescope-gammaray',
            tech = 'se-space-telescope-gammaray',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-telescope-microwave'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-microwave',
            ref_name = 'se-space-telescope-microwave',
            tech = 'se-space-telescope-microwave',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-telescope-radio'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-radio',
            ref_name = 'se-space-telescope-radio',
            tech = 'se-space-telescope-radio',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-telescope-xray'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-xray',
            ref_name = 'se-space-telescope-xray',
            tech = 'se-space-telescope-xray',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-science-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'lab',
            name = 'se-space-science-lab',
            ref_name = 'se-space-science-lab',
            tech = 'se-space-science-lab',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        }

        items['equipment']['solar-panel-equipment'].base = 30

        items['equipment']['fusion-reactor-equipment'].tech = 'se-rtg-equipment'
        items['equipment']['fusion-reactor-equipment'].base_name = 'se-rtg'
        items['equipment']['fusion-reactor-equipment'].base = 400

        items['equipment']['battery-equipment'].tech = 'battery-equipment'
        items['equipment']['battery-equipment'].min = 2
        items['equipment']['battery-equipment'].base = 100

        items['equipment']['energy-shield-equipment'].tech = 'energy-shield-equipment'
        items['equipment']['energy-shield-equipment'].min = 2
        items['equipment']['energy-shield-equipment'].base = 200

        items['equipment']['personal-roboport-equipment'].tech = 'personal-roboport-equipment'
        items['equipment']['personal-roboport-equipment'].min = 2
        items['equipment']['personal-roboport-equipment'].base = 0.5
    end
end

return items
