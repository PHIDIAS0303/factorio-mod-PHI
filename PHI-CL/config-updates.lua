local items = {}

if mods and mods['space-exploration'] then
    items['equipment']['fission-reactor-equipment'].tech = 'se-rtg-equipment'
    items['equipment']['fission-reactor-equipment'].base_name = 'se-rtg'

    items['equipment']['battery-equipment'].tech = 'battery-equipment'
    items['equipment']['battery-equipment'].min = 2

    items['equipment']['energy-shield-equipment'].tech = 'energy-shield-equipment'
    items['equipment']['energy-shield-equipment'].min = 2

    items['equipment']['personal-roboport-equipment'].tech = 'personal-roboport-equipment'
    items['equipment']['personal-roboport-equipment'].min = 2
end

return items
