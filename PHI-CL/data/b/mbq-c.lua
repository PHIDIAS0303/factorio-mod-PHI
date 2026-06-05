return {
    -- MBQ A 2 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['battery-equipment'] = {
        type = 'battery-equipment',
        name = 'battery',
        ref_name = (mods['space-age'] and 'battery-mk3-equipment') or 'battery-mk2-equipment',
        tech = (mods['space-age'] and 'battery-mk3-equipment') or 'battery-mk2-equipment',
        min = (mods['space-age'] and 4) or 3,
        max = (tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1) + ((mods['space-age'] and 2) or 1)
    },
    -- MBQ A 2 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['discharge-defense-equipment'] = {
        type = 'active-defense-equipment',
        name = 'discharge-defense',
        tech = 'discharge-defense-equipment',
        max = tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1
    },
    -- MBQ A 2 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['energy-shield-equipment'] = {
        type = 'energy-shield-equipment',
        name = 'energy-shield',
        ref_name = 'energy-shield-mk2-equipment',
        tech = 'energy-shield-mk2-equipment',
        min = 3,
        max = (tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1) + 1
    },
    -- MBQ A 2 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['exoskeleton-equipment'] = {
        type = 'movement-bonus-equipment',
        name = 'exoskeleton',
        tech = 'exoskeleton-equipment',
        max = tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1
    },
    -- MBQ A 2 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['fission-reactor-equipment'] = {
        type = 'generator-equipment',
        name = 'fission-reactor',
        ref_name = 'fission-reactor-equipment',
        tech = 'fission-reactor-equipment',
        max = tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1
    },
    -- MBQ A 1 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['night-vision-equipment'] = {
        type = 'night-vision-equipment',
        name = 'night-vision',
        tech = 'night-vision-equipment',
        max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1, 2)
    },
    -- MBQ A 2 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['personal-laser-defense-equipment'] = {
        type = 'active-defense-equipment',
        name = 'personal-laser-defense',
        tech = 'personal-laser-defense-equipment',
        max = tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1
    },
    -- MBQ A 2 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['personal-roboport-equipment'] = {
        type = 'roboport-equipment',
        name = 'personal-roboport',
        ref_name = 'personal-roboport-mk2-equipment',
        tech = 'personal-roboport-mk2-equipment',
        min = 3,
        max = (tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1) + 1
    },
    -- MBQ A 2 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['solar-panel-equipment'] = {
        type = 'solar-panel-equipment',
        name = 'solar-panel',
        tech = 'solar-panel-equipment',
        max = tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1,
        base = 30,
        graphics_name = 'solar-panel-equipment'
    },
    -- MBQ A 2 SPACE_AGE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['fusion-reactor-equipment'] = {
        mod = 'space-age',
        type = 'generator-equipment',
        name = 'fusion-reactor',
        tech = 'fusion-reactor-equipment',
        max = tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1
    },
    -- MBQ A 2 SPACE_AGE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['toolbelt-equipment'] = {
        mod = 'space-age',
        type = 'inventory-bonus-equipment',
        name = 'toolbelt',
        tech = 'toolbelt-equipment',
        max = tonumber(settings.startup['PHI-MB-EQUIPMENT'].value) or 1
    }
}
