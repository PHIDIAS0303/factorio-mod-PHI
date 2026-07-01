local items = require('ct-c')

if items['hide'] and (data.raw['infinity-container']['super-infinity-chest'] or data.raw['infinity-cargo-wagon']['super-infinity-cargo-wagon']) then
    local sc = 1

    for c, _ in pairs(defines.prototypes.item) do
        if data.raw[c] then
            for _, i in pairs(data.raw[c]) do
                if not (i.hidden or (i.subgroup and items['hide'][i.subgroup])) then
                    sc = sc + 1
                end
            end
        end
    end

    if data.raw['infinity-container']['super-infinity-chest'] then
        data.raw['infinity-container']['super-infinity-chest'].inventory_size = sc
    end

    if data.raw['infinity-cargo-wagon']['super-infinity-cargo-wagon'] then
        data.raw['infinity-cargo-wagon']['super-infinity-cargo-wagon'].inventory_size = sc
    end
end

-- CT A 1 BASE MAP_GEN_PRESET
if settings.startup['PHI-CT-TILE'].value then
    local autoplace_setting_decorative = {}
    local autoplace_setting_entity = {}
    local autoplace_setting_tile = {}

    for k, _ in pairs(data.raw.tile) do
        autoplace_setting_tile[k] = {
            frequency = 0,
            size = 0,
            richness = 0
        }
    end

    autoplace_setting_tile[settings.startup['PHI-CT-TILE-CHOICE'].value] = {
        frequency = 1,
        size = 1,
        richness = 1
    }

    for c, _ in pairs(defines.prototypes.entity) do
        if data.raw[c] then
            for k, _ in pairs(data.raw[c]) do

                autoplace_setting_entity[k] = {
                    frequency = 0,
                    size = 0,
                    richness = 0
                }
            end
        end
    end

    for k, _ in pairs(data.raw['optimized-decorative']) do
        autoplace_setting_decorative[k] = {
            frequency = 0,
            size = 0,
            richness = 0
        }
    end

    data.raw['map-gen-presets']['default']['empty-world'] = {
        order = 'zz',
        basic_settings = {
            default_enable_all_autoplace_controls = false,
            autoplace_controls = {},
            autoplace_settings = {
                tile = {
                    treat_missing_as_default = false,
                    settings = autoplace_setting_tile
                },
                entity = {
                    treat_missing_as_default = false,
                    settings = autoplace_setting_entity
                },
                decorative = {
                    treat_missing_as_default = false,
                    settings = autoplace_setting_decorative
                }
            },
            no_enemies_mode = true
        },
        advanced_settings = {
            pollution = {
                enabled = false
            },
            enemy_evolution = {
                enabled = false
            },
            enemy_expansion = {
                enabled = false
            }
        }
    }
end
