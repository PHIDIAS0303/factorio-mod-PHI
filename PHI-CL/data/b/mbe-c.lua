return {
    -- MBE A 7 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['solar-panel'] = {
        enabled = true,
        type = 'solar-panel',
        name = 'solar-panel',
        max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
    },
    -- MBE A 7 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['accumulator'] = {
        enabled = true,
        type = 'accumulator',
        name = 'accumulator',
        max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
    },
    -- MBE A 4 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['boiler'] = {
        enabled = true,
        type = 'boiler',
        name = 'boiler',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
    -- MBE A 4 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['steam-engine'] = {
        enabled = true,
        type = 'generator',
        name = 'steam-engine',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
    -- MBE A 4 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['nuclear-reactor'] = {
        enabled = true,
        type = 'reactor',
        name = 'nuclear-reactor',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
    -- MBE A 4 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['heat-pipe'] = {
        enabled = true,
        type = 'heat-pipe',
        name = 'heat-pipe',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
    -- MBE A 4 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['heat-exchanger'] = {
        enabled = true,
        type = 'boiler',
        name = 'heat-exchanger',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
    -- MBE A 4 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['steam-turbine'] = {
        enabled = true,
        type = 'generator',
        name = 'steam-turbine',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
    -- MBE A 4 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['fusion-reactor'] = {
        enabled = mods['space-age'],
        mod = 'space-age',
        type = 'fusion-reactor',
        name = 'fusion-reactor',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
    -- MBE A 4 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['fusion-generator'] = {
        enabled = mods['space-age'],
        mod = 'space-age',
        type = 'fusion-generator',
        name = 'fusion-generator',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
    -- MBE A 4 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['heating-tower'] = {
        enabled = mods['space-age'],
        mod = 'space-age',
        type = 'reactor',
        name = 'heating-tower',
        tech = 'heating-tower',
        max = math.min(settings.startup['PHI-MB-ENERGY-POWER-TIER'].value, 5)
    },
}
