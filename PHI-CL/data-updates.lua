
if settings.startup['PHI-MB'].value then
    if settings.startup['PHI-MB-ENERGY'].value and settings.startup['PHI-MB-ENERGY'].value > 1 then
        require 'data.u.mbe'
    end

    if settings.startup['PHI-MB-MACHINE'].value and settings.startup['PHI-MB-MACHINE'].value > 1 then
        require 'data.u.mbm'
    end

    if settings.startup['PHI-MB-EQUIPMENT'].value and settings.startup['PHI-MB-EQUIPMENT'].value > 1 then
        require 'data.u.mbq'
    end
end

if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    require 'data.u.mig'
end
