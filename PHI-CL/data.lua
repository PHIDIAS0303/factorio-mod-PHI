
if settings.startup['PHI-CT'].value then
    require('data.b.ct')
end

if settings.startup['PHI-MI'].value then
    require('data.b.mi')
end

if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    require('data.b.mig')
end

if settings.startup['PHI-SA'].value or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    require('data.b.sa')
end

if settings.startup['PHI-GM'].value then
    if settings.startup['PHI-GM'].value ~= '' then
        require('data.b.gm')
    end

    if settings.startup['PHI-GM'].value == 'SAP' then
        require('data.b.gm-sap')

    elseif settings.startup['PHI-GM'].value == 'VP' then
        require('data.b.gm-vp')
    end
end

if settings.startup['PHI-MB'].value then
    if settings.startup['PHI-MB-ENERGY'].value and settings.startup['PHI-MB-ENERGY'].value > 1 then
        require('data.b.mbe')
    end

    if settings.startup['PHI-MB-MACHINE'].value and settings.startup['PHI-MB-MACHINE'].value > 1 then
        require('data.b.mbm')
    end

    if settings.startup['PHI-MB-EQUIPMENT'].value and settings.startup['PHI-MB-EQUIPMENT'].value > 1 then
        require('data.b.mbq')
    end
end
