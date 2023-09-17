local items = {
    ['setting'] = {
        ['PHI-EQ-SOLAR-TIER'] = {
            type = 'max',
            effect = {'solar-panel'}
        },
        ['PHI-EQ-BATTERY-TIER'] = {
            type = 'max',
            effect = {'battery'}
        },
        ['PHI-EQ-REACTOR-TIER'] = {
            type = 'max',
            effect = {'fusion-reactor'}
        },
        ['PHI-EQ-LASER-TIER'] = {
            type = 'max',
            effect = {'personal-laser-defense'}
        },
        ['PHI-EQ-ROBOPORT-TIER'] = {
            type = 'max',
            effect = {'personal-roboport'}
        },
        ['PHI-EQ-SHIELD-TIER'] = {
            type = 'max',
            effect = {'energy-shield'}
        },
        ['PHI-EQ-NIGHT-TIER'] = {
            type = 'max',
            effect = {'night-vision'}
        },
        ['PHI-EQ-EXO-TIER'] = {
            type = 'max',
            effect = {'exoskeleton'}
        }
    },
    ['solar-panel'] = {
        enabled = true,
        type = 'solar-panel',
        name = 'solar-panel',
        base_name = 'solar-panel',
        tech = 'solar-panel-equipment',
        min = 2,
        max = 8,
        base = 30,
        order = 'a[energy-source]-a[solar-panel]',
        graphics_name = 'solar-panel-equipment'
    },
    ['fusion-reactor'] = {
        enabled = true,
        type = 'fusion-reactor',
        name = 'fusion-reactor',
        base_name = 'fusion-reactor',
        tech = 'fusion-reactor-equipment',
        min = 2,
        max = 8,
        base = 750,
        order = 'a[energy-source]-b[fusion-reactor]',
        graphics_name = 'fusion-reactor-equipment'
    },
    ['battery'] = {
        enabled = true,
        type = 'battery',
        name = 'battery',
        base_name = 'battery',
        tech = 'battery-mk2-equipment',
        min = 3,
        max = 8,
        base = 100,
        order = 'b[battery]-b[battery-equipment-mk2]',
        graphics_name = 'battery-mk2-equipment'
    },
    ['personal-laser-defense'] = {
        enabled = true,
        type = 'personal-laser-defense',
        name = 'personal-laser-defense',
        base_name = 'personal-laser-defense',
        tech = 'personal-laser-defense-equipment',
        min = 2,
        max = 8,
        base = 3,
        order = 'b[active-defense]-a[personal-laser-defense-equipment]',
        graphics_name = 'personal-laser-defense-equipment'
    },
    ['energy-shield'] = {
        enabled = true,
        type = 'energy-shield',
        name = 'energy-shield',
        base_name = 'energy-shield',
        tech = 'energy-shield-mk2-equipment',
        min = 3,
        max = 8,
        base = 150,
        order = 'a[shield]-b[energy-shield-equipment-mk2]',
        graphics_name = 'energy-shield-mk2-equipment'
    },
    ['personal-roboport'] = {
        enabled = true,
        type = 'personal-roboport',
        name = 'personal-roboport',
        base_name = 'personal-roboport',
        tech = 'personal-roboport-mk2-equipment',
        min = 3,
        max = 8,
        base = 0.5,
        order = 'e[robotics]-b[personal-roboport-equipment-mk2]',
        graphics_name = 'personal-roboport-mk2-equipment'
    },
    ['night-vision'] = {
        enabled = true,
        type = 'night-vision',
        name = 'night-vision',
        base_name = 'night-vision',
        tech = 'night-vision-equipment',
        min = 2,
        max = 2,
        base = 1,
        order = 'f[night-vision]-a[night-vision-equipment]',
        graphics_name = 'night-vision-equipment'
    },
    ['exoskeleton'] = {
        enabled = true,
        type = 'exoskeleton',
        name = 'exoskeleton',
        base_name = 'exoskeleton',
        tech = 'exoskeleton-equipment',
        min = 2,
        max = 2,
        base = 0.6,
        order = 'd[exoskeleton]-a[exoskeleton-equipment]',
        graphics_name = 'exoskeleton-equipment'
    }
}

if mods ~= nil then
    if mods['space-exploration'] then
        items['solar-panel'].base = 30

        items['fusion-reactor'].tech = 'se-rtg-equipment'
        items['fusion-reactor'].base_name = 'se-rtg'
        items['fusion-reactor'].base = 400

        items['battery'].tech = 'battery-equipment'
        items['battery'].min = 2
        items['battery'].base = 100

        items['energy-shield'].tech = 'energy-shield-equipment'
        items['energy-shield'].min = 2
        items['energy-shield'].base = 200

        items['personal-roboport'].tech = 'personal-roboport-equipment'
        items['personal-roboport'].min = 2
        items['personal-roboport'].base = 0.5
    end
end

return items
