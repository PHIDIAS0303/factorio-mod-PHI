return {
    -- MBE A 5 SPACE_EXPLORATION ENTITY,RECIPE,RESEARCH_EFFECT
    ['se-space-solar-panel'] = {
        enabled = mods['space-exploration'],
        stage = 2,
        mod = 'space-exploration',
        type = 'solar-panel',
        name = 'se-space-solar-panel',
        min = 4,
        max = settings.startup['PHI-MB-ENERGY-POWER-TIER'].value
    }
}
