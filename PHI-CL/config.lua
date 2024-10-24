local items = {
    ['general'] = {
        ['graphics_location'] = '__PHI-CL__/graphics/'
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
            max = settings.startup['PHI-EN-SOLAR-TIER'].value
        },
        ['accumulator'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'accumulator',
            name = 'accumulator',
            ref_name = 'accumulator',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-SOLAR-TIER'].value
        },
        ['boiler'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'boiler',
            name = 'boiler',
            ref_name = 'boiler',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-STEAM-TIER'].value
        },
        ['steam-engine'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'generator',
            name = 'steam-engine',
            ref_name = 'steam-engine',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-STEAM-TIER'].value
        },
        ['nuclear-reactor'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'reactor',
            name = 'nuclear-reactor',
            ref_name = 'nuclear-reactor',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-NUCLEAR-TIER'].value
        },
        ['heat-pipe'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'heat-pipe',
            name = 'heat-pipe',
            ref_name = 'heat-pipe',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-NUCLEAR-TIER'].value
        },
        ['heat-exchanger'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'boiler',
            name = 'heat-exchanger',
            ref_name = 'heat-exchanger',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-NUCLEAR-TIER'].value
        },
        ['steam-turbine'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'generator',
            name = 'steam-turbine',
            ref_name = 'steam-turbine',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-NUCLEAR-TIER'].value
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
            max = settings.startup['PHI-EQ-REACTOR-TIER'].value
        },
        ['battery-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'battery-equipment',
            name = 'battery',
            ref_name = 'battery-mk3-equipment',
            tech = 'battery-mk3-equipment',
            min = 4,
            max = settings.startup['PHI-EQ-BATTERY-TIER'].value
        },
        ['personal-laser-defense-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'active-defense-equipment',
            name = 'personal-laser-defense',
            ref_name = 'personal-laser-defense-equipment',
            tech = 'personal-laser-defense-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-LASER-TIER'].value
        },
        ['energy-shield-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'energy-shield-equipment',
            name = 'energy-shield',
            ref_name = 'energy-shield-mk2-equipment',
            tech = 'energy-shield-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-EQ-SHIELD-TIER'].value
        },
        ['personal-roboport-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'roboport-equipment',
            name = 'personal-roboport',
            ref_name = 'personal-roboport-mk2-equipment',
            tech = 'personal-roboport-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-EQ-ROBOPORT-TIER'].value
        },
        ['night-vision-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'night-vision-equipment',
            name = 'night-vision',
            ref_name = 'night-vision-equipment',
            tech = 'night-vision-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-NIGHT-TIER'].value
        },
        ['exoskeleton-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'movement-bonus-equipment',
            name = 'exoskeleton',
            ref_name = 'exoskeleton-equipment',
            tech = 'exoskeleton-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-EXO-TIER'].value
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
    }
}

if mods then
end

return items
