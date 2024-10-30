local items = require 'config'
local main = require 'main'
local file_stage = 3

for _, v in pairs(data.raw['active-defense-equipment']) do
    v.automatic = true
end

if settings.startup['PHI-CT'].value then
    data.raw['utility-constants'].default.rocket_lift_weight = settings.startup['PHI-CT-ROCKET-CAPACITY'].value * 100000
    data.raw['utility-constants'].default.default_item_weight = settings.startup['PHI-CT-CARGO-WEIGHT'].value

    if settings.startup['PHI-CT-UTILITY'].value then
        for _, t in pairs({'arithmetic-combinator', 'decider-combinator', 'programmable-speaker', 'selector-combinator'}) do
            data.raw[t][t].energy_source.usage_priority = 'primary-input'
        end
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
