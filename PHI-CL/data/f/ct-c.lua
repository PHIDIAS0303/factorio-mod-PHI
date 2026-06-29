return {
    ['hide'] = {
        ['parameters'] = true,
        ['spawnables'] = true,
    },
    ['status'] = {
        ['disabled'] = {r = 255, g = 0, b = 0},
        ['idle'] = {r = 255, g = 0, b = 0},
        ['insufficient_input'] = {r = 255, g = 0, b = 0},
        ['no_minable_resources'] = {r = 255, g = 0, b = 0},
        ['no_power'] = {r = 255, g = 0, b = 0},
        ['low_power'] = {r = 255, g = 128, b = 0},
        ['full_output'] = {r = 255, g = 255, b = 0},
        ['working'] = {r = 0, g = 255, b = 0},
    },
    ['status_ignore'] = {
        -- Mining Drones
        ['mining-depot'] = true,
        -- Transport Drones
        ['buffer-depot'] = true,
        ['fluid-depot'] = true,
        ['fuel-depot'] = true,
        ['request-depot'] = true,
        ['supply-depot'] = true,
        -- Space Exploration
        ['se-core-miner'] = true,
        ['se-rocket-launch-pad-silo'] = true,
    }
}
