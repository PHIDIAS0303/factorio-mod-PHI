for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes
    
    if technologies['power-armor-mk2'].researched then
        recipes['power-armor-mk3'].enabled = true
        recipes['power-armor-mk3'].reload()

    elseif technologies['night-vision-equipment'].researched then
        recipes['night-vision-mk2-equipment'].enabled = true
        recipes['night-vision-mk2-equipment'].reload()

    elseif technologies['exoskeleton-equipment'].researched then
        recipes['exoskeleton-mk2-equipment'].enabled = true
        recipes['exoskeleton-mk2-equipment'].reload()

    elseif technologies['solar-panel-equipment'].researched then
        recipes['solar-panel-mk2-equipment'].enabled = true
        recipes['solar-panel-mk2-equipment'].reload()
        recipes['solar-panel-mk3-equipment'].enabled = true
        recipes['solar-panel-mk3-equipment'].reload()
        recipes['solar-panel-mk4-equipment'].enabled = true
        recipes['solar-panel-mk4-equipment'].reload()
        recipes['solar-panel-mk5-equipment'].enabled = true
        recipes['solar-panel-mk5-equipment'].reload()
        recipes['solar-panel-mk6-equipment'].enabled = true
        recipes['solar-panel-mk6-equipment'].reload()
        recipes['solar-panel-mk7-equipment'].enabled = true
        recipes['solar-panel-mk7-equipment'].reload()
        recipes['solar-panel-mk8-equipment'].enabled = true
        recipes['solar-panel-mk8-equipment'].reload()

    elseif technologies['fusion-reactor-equipment'].researched then
        recipes['fusion-reactor-mk2-equipment'].enabled = true
        recipes['fusion-reactor-mk2-equipment'].reload()
        recipes['fusion-reactor-mk3-equipment'].enabled = true
        recipes['fusion-reactor-mk3-equipment'].reload()
        recipes['fusion-reactor-mk4-equipment'].enabled = true
        recipes['fusion-reactor-mk4-equipment'].reload()
        recipes['fusion-reactor-mk5-equipment'].enabled = true
        recipes['fusion-reactor-mk5-equipment'].reload()
        recipes['fusion-reactor-mk6-equipment'].enabled = true
        recipes['fusion-reactor-mk6-equipment'].reload()
        recipes['fusion-reactor-mk7-equipment'].enabled = true
        recipes['fusion-reactor-mk7-equipment'].reload()
        recipes['fusion-reactor-mk8-equipment'].enabled = true
        recipes['fusion-reactor-mk8-equipment'].reload()

    elseif technologies['battery-mk2-equipment'].researched then
        recipes['battery-mk3-equipment'].enabled = true
        recipes['battery-mk3-equipment'].reload()
        recipes['battery-mk4-equipment'].enabled = true
        recipes['battery-mk4-equipment'].reload()
        recipes['battery-mk5-equipment'].enabled = true
        recipes['battery-mk5-equipment'].reload()
        recipes['battery-mk6-equipment'].enabled = true
        recipes['battery-mk6-equipment'].reload()
        recipes['battery-mk7-equipment'].enabled = true
        recipes['battery-mk7-equipment'].reload()
        recipes['battery-mk8-equipment'].enabled = true
        recipes['battery-mk8-equipment'].reload()

    elseif technologies['personal-laser-defense-equipment'].researched then
        recipes['personal-laser-defense-mk2-equipment'].enabled = true
        recipes['personal-laser-defense-mk2-equipment'].reload()
        recipes['personal-laser-defense-mk3-equipment'].enabled = true
        recipes['personal-laser-defense-mk3-equipment'].reload()
        recipes['personal-laser-defense-mk4-equipment'].enabled = true
        recipes['personal-laser-defense-mk4-equipment'].reload()
        recipes['personal-laser-defense-mk5-equipment'].enabled = true
        recipes['personal-laser-defense-mk5-equipment'].reload()
        recipes['personal-laser-defense-mk6-equipment'].enabled = true
        recipes['personal-laser-defense-mk6-equipment'].reload()
        recipes['personal-laser-defense-mk7-equipment'].enabled = true
        recipes['personal-laser-defense-mk7-equipment'].reload()
        recipes['personal-laser-defense-mk8-equipment'].enabled = true
        recipes['personal-laser-defense-mk8-equipment'].reload()

    elseif technologies['energy-shield-mk2-equipment'].researched then
        recipes['energy-shield-mk3-equipment'].enabled = true
        recipes['energy-shield-mk3-equipment'].reload()
        recipes['energy-shield-mk4-equipment'].enabled = true
        recipes['energy-shield-mk4-equipment'].reload()
        recipes['energy-shield-mk5-equipment'].enabled = true
        recipes['energy-shield-mk5-equipment'].reload()
        recipes['energy-shield-mk6-equipment'].enabled = true
        recipes['energy-shield-mk6-equipment'].reload()
        recipes['energy-shield-mk7-equipment'].enabled = true
        recipes['energy-shield-mk7-equipment'].reload()
        recipes['energy-shield-mk8-equipment'].enabled = true
        recipes['energy-shield-mk8-equipment'].reload()

    elseif technologies['personal-roboport-mk2-equipment'].researched then
        recipes['personal-roboport-mk3-equipment'].enabled = true
        recipes['personal-roboport-mk3-equipment'].reload()
        recipes['personal-roboport-mk4-equipment'].enabled = true
        recipes['personal-roboport-mk4-equipment'].reload()
        recipes['personal-roboport-mk5-equipment'].enabled = true
        recipes['personal-roboport-mk5-equipment'].reload()
        recipes['personal-roboport-mk6-equipment'].enabled = true
        recipes['personal-roboport-mk6-equipment'].reload()
        recipes['personal-roboport-mk7-equipment'].enabled = true
        recipes['personal-roboport-mk7-equipment'].reload()
        recipes['personal-roboport-mk8-equipment'].enabled = true
        recipes['personal-roboport-mk8-equipment'].reload()
    end
end
