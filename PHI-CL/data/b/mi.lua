
if settings.startup['PHI-MI-PIPE'].value then
    local s = settings.startup['PHI-MI-PIPE'].value / 10

    for _, t in pairs({data.raw['offshore-pump'], data.raw['pump']}) do
        for _, v in pairs(t) do
            v.pumping_speed = v.pumping_speed * s
        end
    end

    for _, v in pairs(data.raw['valve']) do
        v.flow_rate = v.flow_rate * s
    end

    for _, t in pairs({data.raw['pipe'], data.raw['pipe-to-ground'], data.raw['infinity-pipe']}) do
        for _, v in pairs(t) do
            v.fluid_box.volume = v.fluid_box.volume * s
        end
    end

    data.raw['utility-constants'].default.max_fluid_flow = 100 * s
end

if settings.startup['PHI-MI-ROBOT'].value then
    local s = settings.startup['PHI-MI-ROBOT'].value / 10

    for _, t in pairs({data.raw['construction-robot'], data.raw['logistic-robot']}) do
        for _, v in pairs(t) do
            v.speed = v.speed * s

            if settings.startup['PHI-MI-ROBOT-ENERGY'].value then
                v.energy_per_tick = (v.energy_per_tick and '0J') or nil
                v.energy_per_move = (v.energy_per_move and '0J') or nil
                v.speed_multiplier_when_out_of_energy = (v.speed_multiplier_when_out_of_energy and 1) or nil
            end
        end
    end
end

if settings.startup['PHI-MI-TRAIN'].value then
    local s = settings.startup['PHI-MI-TRAIN'].value / 10

    for _, t in pairs({data.raw['locomotive'], data.raw['cargo-wagon'], data.raw['fluid-wagon'], data.raw['artillery-wagon']}) do
        for _, v in pairs(t) do
            v.max_health = (v.max_health and (v.max_health * s)) or nil
            v.max_speed = (v.max_speed and (v.max_speed * s)) or nil
            v.braking_force = (v.braking_force and (v.braking_force * s)) or nil

            if v.max_power then
                v.max_power = tostring(tonumber(string.match(v.max_power, '[%d%.]+')) * s) .. string.match(v.max_power, '%a+')
                v.reversing_power_modifier = 1
            end
        end
    end
end

data.raw['utility-constants'].default.default_pipeline_extent = settings.startup['PHI-MI-PIPE-EXTENT'].value
