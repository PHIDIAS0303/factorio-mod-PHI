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
            max = settings.startup['PHI-EN-POWER-TIER'].value
        },
        ['steam-engine'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'generator',
            name = 'steam-engine',
            ref_name = 'steam-engine',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-POWER-TIER'].value
        },
        ['nuclear-reactor'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'reactor',
            name = 'nuclear-reactor',
            ref_name = 'nuclear-reactor',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-POWER-TIER'].value
        },
        ['heat-pipe'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'heat-pipe',
            name = 'heat-pipe',
            ref_name = 'heat-pipe',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-POWER-TIER'].value
        },
        ['heat-exchanger'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'boiler',
            name = 'heat-exchanger',
            ref_name = 'heat-exchanger',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-POWER-TIER'].value
        },
        ['steam-turbine'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 1,
            type = 'generator',
            name = 'steam-turbine',
            ref_name = 'steam-turbine',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-POWER-TIER'].value
        },
        ['assembling-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'assembling-machine',
            name = 'assembling-machine',
            ref_name = 'assembling-machine-3',
            tech = 'automation-3',
            min = 4,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value + 2
        },
        ['electric-furnace'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'furnace',
            name = 'electric-furnace',
            ref_name = 'electric-furnace',
            tech = 'advanced-material-processing-2',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['oil-refinery'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'assembling-machine',
            name = 'oil-refinery',
            ref_name = 'oil-refinery',
            tech = 'oil-processing',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['chemical-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'assembling-machine',
            name = 'chemical-plant',
            ref_name = 'chemical-plant',
            tech = 'oil-processing',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['centrifuge'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'assembling-machine',
            name = 'centrifuge',
            ref_name = 'centrifuge',
            tech = 'uranium-processing',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'lab',
            name = 'lab',
            ref_name = 'lab',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['electric-mining-drill'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'mining-drill',
            name = 'electric-mining-drill',
            ref_name = 'electric-mining-drill',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['pumpjack'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 1,
            type = 'mining-drill',
            name = 'pumpjack',
            ref_name = 'pumpjack',
            tech = 'automation',
            min = 2,
            max = settings.startup['PHI-MB-MACHINE-TIER'].value
        },
        ['laser-turret'] = {
            enabled = settings.startup['PHI-WE'].value,
            stage = 1,
            type = 'electric-turret',
            name = 'laser-turret',
            ref_name = 'laser-turret',
            tech = 'laser-turret',
            min = 2,
            max = settings.startup['PHI-WE-TURRET-TIER'].value
        },
        ['flamethrower-turret'] = {
            enabled = settings.startup['PHI-WE'].value,
            stage = 1,
            type = 'fluid-turret',
            name = 'flamethrower-turret',
            ref_name = 'flamethrower-turret',
            tech = 'flamethrower',
            min = 2,
            max = settings.startup['PHI-WE-TURRET-TIER'].value
        },
        ['gun-turret'] = {
            enabled = settings.startup['PHI-WE'].value,
            stage = 1,
            type = 'ammo-turret',
            name = 'gun-turret',
            ref_name = 'gun-turret',
            tech = 'gun-turret',
            min = 2,
            max = settings.startup['PHI-WE-TURRET-TIER'].value
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
    }
}

if mods and mods['space-age'] then
    items['item']['fusion-reactor'] = {
        enabled = settings.startup['PHI-EN'].value,
        stage = 2,
        type = 'fusion-reactor',
        name = 'fusion-reactor',
        ref_name = 'fusion-reactor',
        tech = 'compound-energy',
        min = 2,
        max = settings.startup['PHI-EN-POWER-TIER'].value
    }

    items['item']['fusion-generator'] = {
        enabled = settings.startup['PHI-EN'].value,
        stage = 2,
        type = 'fusion-generator',
        name = 'fusion-generator',
        ref_name = 'fusion-generator',
        tech = 'compound-energy',
        min = 2,
        max = settings.startup['PHI-EN-POWER-TIER'].value
    }

    items['item']['heating-tower'] = {
        enabled = settings.startup['PHI-EN'].value,
        stage = 2,
        type = 'reactor',
        name = 'heating-tower',
        ref_name = 'heating-tower',
        tech = 'heating-tower',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['railgun-turret'] = {
        enabled = settings.startup['PHI-WE'].value,
        stage = 2,
        type = 'ammo-turret',
        name = 'railgun-turret',
        ref_name = 'railgun-turret',
        tech = 'railgun',
        min = 2,
        max = settings.startup['PHI-WE-TURRET-TIER'].value
    }

    items['item']['rocket-turret'] = {
        enabled = settings.startup['PHI-WE'].value,
        stage = 2,
        type = 'ammo-turret',
        name = 'rocket-turret',
        ref_name = 'rocket-turret',
        tech = 'rocket-turret',
        min = 2,
        max = settings.startup['PHI-WE-TURRET-TIER'].value
    }

    items['item']['tesla-turret'] = {
        enabled = settings.startup['PHI-WE'].value,
        stage = 2,
        type = 'electric-turret',
        name = 'tesla-turret',
        ref_name = 'tesla-turret',
        tech = 'tesla-weapons',
        min = 2,
        max = settings.startup['PHI-WE-TURRET-TIER'].value
    }

    items['item']['foundry'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'assembling-machine',
        name = 'foundry',
        ref_name = 'foundry',
        tech = 'foundry',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['big-mining-drill'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'mining-drill',
        name = 'big-mining-drill',
        ref_name = 'big-mining-drill',
        tech = 'big-mining-drill',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['biochamber'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'assembling-machine',
        name = 'biochamber',
        ref_name = 'biochamber',
        tech = 'biochamber',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['crusher'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'assembling-machine',
        name = 'crusher',
        ref_name = 'crusher',
        tech = 'space-platform',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['biolab'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'lab',
        name = 'biolab',
        ref_name = 'biolab',
        tech = 'biolab',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['cryogenic-plant'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'assembling-machine',
        name = 'cryogenic-plant',
        ref_name = 'cryogenic-plant',
        tech = 'cryogenic-plant',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['electromagnetic-plant'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'assembling-machine',
        name = 'electromagnetic-plant',
        ref_name = 'electromagnetic-plant',
        tech = 'electromagnetic-plant',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['thruster'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'thruster',
        name = 'thruster',
        ref_name = 'thruster',
        tech = 'space-platform-thruster',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['recycler'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'furnace',
        name = 'recycler',
        ref_name = 'recycler',
        tech = 'recycling',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }
end

return items
