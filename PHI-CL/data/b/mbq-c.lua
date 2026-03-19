return {
    -- MBM A 2 BASE ENTITY,RECIPE,RESEARCH_EFFECT
    ['battery-equipment'] = {
        type = 'battery-equipment',
        name = 'battery',
        ref_name = 'battery-mk2-equipment',
        tech = 'battery-mk2-equipment',
        min = 3,
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    ['discharge-defense-equipment'] = {
        type = 'active-defense-equipment',
        name = 'discharge-defense',
        ref_name = 'discharge-defense-equipment',
        tech = 'discharge-defense-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    ['energy-shield-equipment'] = {
        type = 'energy-shield-equipment',
        name = 'energy-shield',
        ref_name = 'energy-shield-mk2-equipment',
        tech = 'energy-shield-mk2-equipment',
        min = 3,
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    ['exoskeleton-equipment'] = {
        type = 'movement-bonus-equipment',
        name = 'exoskeleton',
        ref_name = 'exoskeleton-equipment',
        tech = 'exoskeleton-equipment',
        max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT-TIER'].value) or 1, 2)
    },
    ['fission-reactor-equipment'] = {
        type = 'generator-equipment',
        name = 'fission-reactor',
        ref_name = 'fission-reactor-equipment',
        tech = 'fission-reactor-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    ['night-vision-equipment'] = {
        type = 'night-vision-equipment',
        name = 'night-vision',
        ref_name = 'night-vision-equipment',
        tech = 'night-vision-equipment',
        max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT-TIER'].value) or 1, 2)
    },
    ['personal-laser-defense-equipment'] = {
        mod = 'base',
        type = 'active-defense-equipment',
        name = 'personal-laser-defense',
        ref_name = 'personal-laser-defense-equipment',
        tech = 'personal-laser-defense-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    ['personal-roboport-equipment'] = {
        mod = 'base',
        type = 'roboport-equipment',
        name = 'personal-roboport',
        ref_name = 'personal-roboport-mk2-equipment',
        tech = 'personal-roboport-mk2-equipment',
        min = 3,
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    ['solar-panel-equipment'] = {
        mod = 'base',
        type = 'solar-panel-equipment',
        name = 'solar-panel',
        ref_name = 'solar-panel-equipment',
        tech = 'solar-panel-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value,
        base = 30,
        graphics_name = 'solar-panel-equipment'
    }
}
