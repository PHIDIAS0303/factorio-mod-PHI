return {
    -- MBQ A 6 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['battery-equipment'] = {
        type = 'battery-equipment',
        name = 'battery',
        ref_name = (mods['space-age'] and 'battery-mk3-equipment') or 'battery-mk2-equipment',
        tech = (mods['space-age'] and 'battery-mk3-equipment') or (mods['space-exploration'] and 'battery-equipment') or 'battery-mk2-equipment',
        min = (mods['space-age'] and 4) or (mods['space-exploration'] and 2) or 3,
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    -- MBQ A 7 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['discharge-defense-equipment'] = {
        type = 'active-defense-equipment',
        name = 'discharge-defense',
        tech = 'discharge-defense-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    -- MBQ A 6 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['energy-shield-equipment'] = {
        type = 'energy-shield-equipment',
        name = 'energy-shield',
        ref_name = (mods['space-exploration'] and 'energy-shield-equipment') or 'energy-shield-mk2-equipment',
        tech = 'energy-shield-mk2-equipment',
        min = (mods['space-exploration'] and 2) or 3,
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    -- MBQ A 1 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['exoskeleton-equipment'] = {
        type = 'movement-bonus-equipment',
        name = 'exoskeleton',
        tech = 'exoskeleton-equipment',
        max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT-TIER'].value) or 1, 2)
    },
    -- MBQ A 7 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['fission-reactor-equipment'] = {
        type = 'generator-equipment',
        name = 'fission-reactor',
        ref_name = (mods['space-exploration'] and 'se-rtg-equipment') or 'fission-reactor-equipment',
        tech = 'fission-reactor-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    -- MBQ A 1 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['night-vision-equipment'] = {
        type = 'night-vision-equipment',
        name = 'night-vision',
        tech = 'night-vision-equipment',
        max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT-TIER'].value) or 1, 2)
    },
    -- MBQ A 7 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['personal-laser-defense-equipment'] = {
        type = 'active-defense-equipment',
        name = 'personal-laser-defense',
        tech = 'personal-laser-defense-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    -- MBQ A 6 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['personal-roboport-equipment'] = {
        type = 'roboport-equipment',
        name = 'personal-roboport',
        ref_name = 'personal-roboport-mk2-equipment',
        tech = (mods['space-exploration'] and 'personal-roboport-equipment') or 'personal-roboport-mk2-equipment',
        min = (mods['space-exploration'] and 2) or 3,
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    -- MBQ A 7 BASE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['solar-panel-equipment'] = {
        type = 'solar-panel-equipment',
        name = 'solar-panel',
        tech = 'solar-panel-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value,
        base = 30,
        graphics_name = 'solar-panel-equipment'
    },
    -- MBQ A 7 SPACE_AGE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['fusion-reactor-equipment'] = {
        mod = 'space-age',
        type = 'generator-equipment',
        name = 'fusion-reactor',
        tech = 'fusion-reactor-equipment',
        max = settings.startup['PHI-MB-EQUIPMENT-TIER'].value
    },
    -- MBQ A 1 SPACE_AGE ARMOR_EQUIPMENT,RECIPE,RESEARCH_EFFECT
    ['toolbelt-equipment'] = {
        mod = 'space-age',
        type = 'inventory-bonus-equipment',
        name = 'toolbelt',
        tech = 'toolbelt-equipment',
        max = math.min(tonumber(settings.startup['PHI-MB-EQUIPMENT-TIER'].value) or 1, 2)
    }
}
