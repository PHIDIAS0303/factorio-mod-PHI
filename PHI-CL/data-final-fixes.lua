if settings.startup['PHI-CT'].value then
    require('data.f.ct')
end

if settings.startup['PHI-MI'].value then
    require('data.f.mi')
end
