return {
    -- MBE A 7 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['solar-panel'] = {
        name = 'solar-panel',
        max = settings.startup['PHI-MB-ENERGY'].value
    },
    -- MBE A 7 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['accumulator'] = {
        name = 'accumulator',
        max = settings.startup['PHI-MB-ENERGY'].value
    },
    -- MBE A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['boiler'] = {
        name = 'boiler'
    },
    -- MBE A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['steam-engine'] = {
        type = 'generator',
        name = 'steam-engine'
    },
    -- MBE A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['nuclear-reactor'] = {
        type = 'reactor',
        name = 'nuclear-reactor'
    },
    -- MBE A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['heat-pipe'] = {
        name = 'heat-pipe'
    },
    -- MBE A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['heat-exchanger'] = {
        type = 'boiler',
        name = 'heat-exchanger'
    },
    -- MBE A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['steam-turbine'] = {
        type = 'generator',
        name = 'steam-turbine'
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['fusion-reactor'] = {
        mod = 'space-age',
        name = 'fusion-reactor'
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['fusion-generator'] = {
        mod = 'space-age',
        name = 'fusion-generator'
    },
    -- MBE A 2 SPACE_AGE ENTITY,RECIPE,RESEARCH_EFFECT
    ['heating-tower'] = {
        mod = 'space-age',
        type = 'reactor',
        name = 'heating-tower',
        tech = 'heating-tower'
    },
}
