
if settings.startup['PHI-SA'].value or settings.startup['PHI-GM'].value ~= '' then
    if not mods['space-age'] then
        error('Mod not found\nSpace Age is not enabled\n太空時代尚未啟用\nSpace Age が有効になっていません')
    end
end

require('data.b.ct')
require('data.b.mi')
require('data.b.mig')
require('data.b.sa')
require('data.b.gm')
require('data.b.gm-sap')
require('data.b.gm-vp')
require('data.b.mbe')
require('data.b.mbm')
require('data.b.mbq')
