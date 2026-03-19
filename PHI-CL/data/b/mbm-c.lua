return {
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['assembling-machine'] = {
        type = 'assembling-machine',
        name = 'assembling-machine',
        ref_name = 'assembling-machine-3',
        tech = 'automation-3',
        min = 4,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value + 2
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['electric-furnace'] = {
        type = 'furnace',
        name = 'electric-furnace',
        tech = 'advanced-material-processing-2',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['oil-refinery'] = {
        type = 'assembling-machine',
        name = 'oil-refinery',
        tech = 'oil-processing',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['chemical-plant'] = {
        type = 'assembling-machine',
        name = 'chemical-plant',
        tech = 'oil-processing',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['centrifuge'] = {
        type = 'assembling-machine',
        name = 'centrifuge',
        tech = 'uranium-processing',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['lab'] = {
        type = 'lab',
        name = 'lab',
        tech = 'automation',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['electric-mining-drill'] = {
        type = 'mining-drill',
        name = 'electric-mining-drill',
        tech = 'automation',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['pumpjack'] = {
        type = 'mining-drill',
        name = 'pumpjack',
        tech = 'automation',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['laser-turret'] = {
        type = 'electric-turret',
        name = 'laser-turret',
        tech = 'laser-turret',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['flamethrower-turret'] = {
        type = 'fluid-turret',
        name = 'flamethrower-turret',
        tech = 'flamethrower',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['gun-turret'] = {
        type = 'ammo-turret',
        name = 'gun-turret',
        tech = 'gun-turret',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['radar'] = {
        type = 'radar',
        name = 'radar',
        tech = 'automation',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['railgun-turret'] = {
        mod = 'space-age',
        type = 'ammo-turret',
        name = 'railgun-turret',
        tech = 'railgun',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['rocket-turret'] = {
        mod = 'space-age',
        type = 'ammo-turret',
        name = 'rocket-turret',
        tech = 'rocket-turret',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['tesla-turret'] = {
        mod = 'space-age',
        type = 'electric-turret',
        name = 'tesla-turret',
        tech = 'tesla-weapons',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['foundry'] = {
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'foundry',
        tech = 'foundry',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['big-mining-drill'] = {
        mod = 'space-age',
        type = 'mining-drill',
        name = 'big-mining-drill',
        tech = 'big-mining-drill',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['biochamber'] = {
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'biochamber',
        tech = 'biochamber',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['crusher'] = {
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'crusher',
        tech = 'space-platform',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['biolab'] = {
        mod = 'space-age',
        type = 'lab',
        name = 'biolab',
        tech = 'biolab',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['cryogenic-plant'] = {
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'cryogenic-plant',
        tech = 'cryogenic-plant',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['electromagnetic-plant'] = {
        mod = 'space-age',
        type = 'assembling-machine',
        name = 'electromagnetic-plant',
        tech = 'electromagnetic-plant',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['thruster'] = {
        mod = 'space-age',
        type = 'thruster',
        name = 'thruster',
        tech = 'space-platform-thruster',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['agricultural-tower'] = {
        mod = 'space-age',
        type = 'agricultural-tower',
        name = 'agricultural-tower',
        tech = 'agriculture',
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    },
}
