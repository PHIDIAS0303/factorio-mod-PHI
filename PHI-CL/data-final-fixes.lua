local items = require 'config'
local main = require 'main'
local file_stage = 3

if settings.startup['PHI-CT'].value then
    data.raw['utility-constants'].default.rocket_lift_weight = settings.startup['PHI-CT-ROCKET-CAPACITY'].value * 100000
    data.raw['utility-constants'].default.default_item_weight = settings.startup['PHI-CT-CARGO-WEIGHT'].value

    if settings.startup['PHI-CT-UTILITY'].value then
        for _, t in pairs({'arithmetic-combinator', 'decider-combinator', 'programmable-speaker', 'selector-combinator'}) do
            data.raw[t][t].energy_source.usage_priority = 'primary-input'
        end
    end

    if settings.startup['PHI-CT-TILE'].value then
        for _, v in pairs(data.raw) do
            for _, e in pairs(v) do
                if e.surface_conditions then
                    e.surface_conditions = nil
                end
            end
        end

        for _, tile in pairs (data.raw.tile) do
            tile.autoplace = nil
        end

        data.raw.tile[settings.startup['PHI-CT-TILE-CHOICE'].value].autoplace = {
            probability_expression = 1
        }

        for _, t in pairs({data.raw['simple-entity'], data.raw['optimized-decorative'], data.raw['fish']}) do
            for _, e in pairs(t) do
                e.autoplace = nil
            end
        end

        local autoplace_controls = {}

        for k, _ in pairs (data.raw['autoplace-control']) do
            autoplace_controls[k] = {
                size = 'none'
            }
        end

        data.raw['map-gen-presets']['default']['empty-world'] = {
            order = 'zz',
            basic_settings = {
                autoplace_controls = autoplace_controls,
                water = 'none',
                cliff_settings = {
                    name = 'none',
                    cliff_elevation_interval = 100,
                    cliff_elevation_0 = 100,
                    richness = 0
                }
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
end

for _, v in pairs(items['item']) do
    if (v.stage <= file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'item'

        for j=v.min, v.max, 1 do
            main.EEEC(v, j)
        end
    end
end
