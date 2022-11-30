-- accumulator
if not data.raw["accumulator"]["accumulator"].fast_replaceable_group then
    data.raw["accumulator"]["accumulator"].fast_replaceable_group = "accumulator"
    data.raw["accumulator"]["accumulator-mk2"].fast_replaceable_group = "accumulator"
    data.raw["accumulator"]["accumulator-mk3"].fast_replaceable_group = "accumulator"
    data.raw["accumulator"]["accumulator-mk4"].fast_replaceable_group = "accumulator"
    data.raw["accumulator"]["accumulator-mk5"].fast_replaceable_group = "accumulator"
    data.raw["accumulator"]["accumulator-mk6"].fast_replaceable_group = "accumulator"
    data.raw["accumulator"]["accumulator-mk7"].fast_replaceable_group = "accumulator"
    data.raw["accumulator"]["accumulator-mk8"].fast_replaceable_group = "accumulator"
else
    data.raw["accumulator"]["accumulator-mk2"].fast_replaceable_group = data.raw["accumulator"]["accumulator"].fast_replaceable_group
    data.raw["accumulator"]["accumulator-mk3"].fast_replaceable_group = data.raw["accumulator"]["accumulator"].fast_replaceable_group
    data.raw["accumulator"]["accumulator-mk4"].fast_replaceable_group = data.raw["accumulator"]["accumulator"].fast_replaceable_group
    data.raw["accumulator"]["accumulator-mk5"].fast_replaceable_group = data.raw["accumulator"]["accumulator"].fast_replaceable_group
    data.raw["accumulator"]["accumulator-mk6"].fast_replaceable_group = data.raw["accumulator"]["accumulator"].fast_replaceable_group
    data.raw["accumulator"]["accumulator-mk7"].fast_replaceable_group = data.raw["accumulator"]["accumulator"].fast_replaceable_group
    data.raw["accumulator"]["accumulator-mk8"].fast_replaceable_group = data.raw["accumulator"]["accumulator"].fast_replaceable_group
end

if not data.raw["accumulator"]["accumulator"].next_upgrade then
    data.raw["accumulator"]["accumulator"].next_upgrade = "accumulator-mk2"
end

-- solar-panel
if not data.raw["solar-panel"]["solar-panel"].fast_replaceable_group then
    data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"
    data.raw["solar-panel"]["solar-panel-mk2"].fast_replaceable_group = "solar-panel"
    data.raw["solar-panel"]["solar-panel-mk3"].fast_replaceable_group = "solar-panel"
    data.raw["solar-panel"]["solar-panel-mk4"].fast_replaceable_group = "solar-panel"
    data.raw["solar-panel"]["solar-panel-mk5"].fast_replaceable_group = "solar-panel"
    data.raw["solar-panel"]["solar-panel-mk6"].fast_replaceable_group = "solar-panel"
    data.raw["solar-panel"]["solar-panel-mk7"].fast_replaceable_group = "solar-panel"
    data.raw["solar-panel"]["solar-panel-mk8"].fast_replaceable_group = "solar-panel"
else
    data.raw["solar-panel"]["solar-panel-mk2"].fast_replaceable_group = data.raw["solar-panel"]["solar-panel"].fast_replaceable_group
    data.raw["solar-panel"]["solar-panel-mk3"].fast_replaceable_group = data.raw["solar-panel"]["solar-panel"].fast_replaceable_group
    data.raw["solar-panel"]["solar-panel-mk4"].fast_replaceable_group = data.raw["solar-panel"]["solar-panel"].fast_replaceable_group
    data.raw["solar-panel"]["solar-panel-mk5"].fast_replaceable_group = data.raw["solar-panel"]["solar-panel"].fast_replaceable_group
    data.raw["solar-panel"]["solar-panel-mk6"].fast_replaceable_group = data.raw["solar-panel"]["solar-panel"].fast_replaceable_group
    data.raw["solar-panel"]["solar-panel-mk7"].fast_replaceable_group = data.raw["solar-panel"]["solar-panel"].fast_replaceable_group
    data.raw["solar-panel"]["solar-panel-mk8"].fast_replaceable_group = data.raw["solar-panel"]["solar-panel"].fast_replaceable_group
end

if not data.raw["solar-panel"]["solar-panel"].next_upgrade then
    data.raw["solar-panel"]["solar-panel"].next_upgrade = "solar-panel-mk2"
end
