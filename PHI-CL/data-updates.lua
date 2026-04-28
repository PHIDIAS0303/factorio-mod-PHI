local param = require 'config'

if settings.startup['PHI-MB'].value then
    if settings.startup['PHI-MB-ENERGY'].value then
        require 'data.u.mbe'
    end

    if settings.startup['PHI-MB-MACHINE'].value then
        require 'data.u.mbm'
    end

    if settings.startup['PHI-MB-EQUIPMENT'].value then
        require 'data.u.mbq'
    end
end

if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    require 'data.u.mi'
end
