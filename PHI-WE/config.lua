local items = {
    ['laser-turret'] = {
        enabled = true,
        type = 'electric-turret',
        name = 'laser-turret',
        ref_name = 'laser-turret',
        tech = 'laser-turret',
        min = 2,
        max = 3,
        range = 24
    },
    ['gun-turret'] = {
        enabled = true,
        type = 'ammo-turret',
        name = 'gun-turret',
        ref_name = 'gun-turret',
        tech = 'gun-turret',
        min = 2,
        max = 3,
        range = 18
    },
    ['flamethrower-turret'] = {
        enabled = true,
        type = 'fluid-turret',
        name = 'flamethrower-turret',
        ref_name = 'flamethrower-turret',
        tech = 'flamethrower',
        min = 2,
        max = 3,
        range = 30
    },
    ['radar'] = {
        enabled = true,
        type = 'radar',
        name = 'radar',
        ref_name = 'radar',
        tech = 'automation',
        min = 2,
        max = 3
    }
}

return items