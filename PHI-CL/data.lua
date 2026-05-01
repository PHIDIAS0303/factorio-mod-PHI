
if settings.startup['PHI-MB'].value then
    if settings.startup['PHI-MB-ENERGY'].value then
        require('data.b.mbe')
    end

    if settings.startup['PHI-MB-MACHINE'].value then
        require('data.b.mbm')
    end

    if settings.startup['PHI-MB-EQUIPMENT'].value then
        require('data.b.mbq')
    end
end

if settings.startup['PHI-CT'].value then
    require('data.b.ct')
end

if settings.startup['PHI-MI'].value then
    require('data.b.mi')
end

if (settings.startup['PHI-MI'].value and settings.startup['PHI-MI-GENERIC'].value) or (settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '') then
    require('data.b.mig')
end

--[[
if mods['space-age'] then
    require('data.b.sa')

    if settings.startup['PHI-GM'].value and settings.startup['PHI-GM'].value ~= '' then
        require('data.b.gm')
    end
end

if settings.startup['PHI-GM'].value then
    if settings.startup['PHI-GM'].value == 'SAP' then
        require('data.b.gm-sap')
    elseif settings.startup['PHI-GM'].value == 'VP' then
        require('data.b.gm-vp')
    end
end
]]