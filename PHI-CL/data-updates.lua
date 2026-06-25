
if settings.startup['PHI-GM'].value then
    if settings.startup['PHI-GM'].value == 'VP' then
        for k, v in pairs(data.raw.recipe) do
            if v.categories and v.categories == {'recycling'} and v.hidden then
                data.raw.recipe[k] = nil
            end
        end
    end
end
