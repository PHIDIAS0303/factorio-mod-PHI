
if settings.startup['PHI-MI-PIPE'].value then
    -- MI C 1 BASE UTILITY_CONSTANTS
    data.raw['utility-constants'].default.max_fluid_flow = 10 * settings.startup['PHI-MI-PIPE'].value
end

-- MI C 2 BASE ENTITY
for _, t in pairs({data.raw['construction-robot'], data.raw['logistic-robot']}) do
    for _, v in pairs(t) do
        if settings.startup['PHI-MI-ROBOT-ENERGY'].value then
            v.energy_per_tick = (v.energy_per_tick and '0J') or nil
            v.energy_per_move = (v.energy_per_move and '0J') or nil
            v.speed_multiplier_when_out_of_energy = (v.speed_multiplier_when_out_of_energy and 1) or nil
        end
    end
end

-- MI C 1 BASE UTILITY_CONSTANTS
data.raw['utility-constants'].default.default_pipeline_extent = settings.startup['PHI-MI-PIPE-EXTENT'].value
