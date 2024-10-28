--[[
** CONFIG
    items['item']['agricultural-tower'] = {
        enabled = settings.startup['PHI-MB'].value,
        stage = 2,
        type = 'agricultural-tower',
        name = 'agricultural-tower',
        ref_name = 'agricultural-tower',
        tech = 'agriculture',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }
    
['equipment'] = {
        ['solar-panel-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'solar-panel-equipment',
            name = 'solar-panel',
            ref_name = 'solar-panel-equipment',
            tech = 'solar-panel-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-SOLAR-TIER'].value,
            base = 30,
            graphics_name = 'solar-panel-equipment'
        },
        ['fusion-reactor-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'generator-equipment',
            name = 'fusion-reactor',
            ref_name = 'fusion-reactor-equipment',
            tech = 'fusion-reactor-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-REACTOR-TIER'].value
        },
        ['battery-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'battery-equipment',
            name = 'battery',
            ref_name = 'battery-mk3-equipment',
            tech = 'battery-mk3-equipment',
            min = 4,
            max = settings.startup['PHI-EQ-BATTERY-TIER'].value
        },
        ['personal-laser-defense-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'active-defense-equipment',
            name = 'personal-laser-defense',
            ref_name = 'personal-laser-defense-equipment',
            tech = 'personal-laser-defense-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-LASER-TIER'].value
        },
        ['energy-shield-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'energy-shield-equipment',
            name = 'energy-shield',
            ref_name = 'energy-shield-mk2-equipment',
            tech = 'energy-shield-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-EQ-SHIELD-TIER'].value
        },
        ['personal-roboport-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'roboport-equipment',
            name = 'personal-roboport',
            ref_name = 'personal-roboport-mk2-equipment',
            tech = 'personal-roboport-mk2-equipment',
            min = 3,
            max = settings.startup['PHI-EQ-ROBOPORT-TIER'].value
        },
        ['night-vision-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'night-vision-equipment',
            name = 'night-vision',
            ref_name = 'night-vision-equipment',
            tech = 'night-vision-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-NIGHT-TIER'].value
        },
        ['exoskeleton-equipment'] = {
            enabled = settings.startup['PHI-EQ'].value,
            stage = 1,
            type = 'movement-bonus-equipment',
            name = 'exoskeleton',
            ref_name = 'exoskeleton-equipment',
            tech = 'exoskeleton-equipment',
            min = 2,
            max = settings.startup['PHI-EQ-EXO-TIER'].value
        }
    },

        if mods['aai-industry'] then
        items['item']['industrial-furnace'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'industrial-furnace',
            ref_name = 'industrial-furnace',
            tech = 'industrial-furnace',
            min = 2,
            max = settings.startup['PHI-MB-FURNACE-TIER'].value
        }

        items['item']['fuel-processor'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'fuel-processor',
            ref_name = 'fuel-processor',
            tech = 'fuel-processing',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        }
    end

    if mods['aai-industry'] or mods['big-mining-drill'] then
        items['item']['area-mining-drill'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'mining-drill',
            name = 'area-mining-drill',
            ref_name = 'area-mining-drill',
            tech = 'area-mining-drill',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
        }
    end

    if mods['Krastorio2'] then
        items['item']['kr-mineral-water-pumpjack'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'mining-drill',
            name = 'kr-mineral-water-pumpjack',
            ref_name = 'kr-mineral-water-pumpjack',
            tech = 'kr-mineral-water-gathering',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
        }

        items['item']['kr-gas-power-station'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 2,
            type = 'generator',
            name = 'kr-gas-power-station',
            ref_name = 'kr-gas-power-station',
            tech = 'compound-energy',
            min = 2,
            max = settings.startup['PHI-EN-STEAM-TIER'].value
        }

        items['item']['kr-crusher'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-crusher',
            ref_name = 'kr-crusher',
            tech = 'kr-crusher',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-fluid-burner'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-fluid-burner',
            ref_name = 'kr-fluid-burner',
            tech = 'kr-fluid-excess-handling',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-air-purifier'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'furnace',
            name = 'kr-air-purifier',
            ref_name = 'kr-air-purifier',
            tech = 'kr-air-purification',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-advanced-furnace'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-furnace',
            ref_name = 'kr-advanced-furnace',
            tech = 'kr-advanced-furnace',
            min = 2,
            max = settings.startup['PHI-MB-FURNACE-TIER'].value
        }

        items['item']['kr-advanced-chemical-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-chemical-plant',
            ref_name = 'kr-advanced-chemical-plant',
            tech = 'kr-advanced-chemical-plant',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        }

        items['item']['kr-advanced-assembling-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-advanced-assembling-machine',
            ref_name = 'kr-advanced-assembling-machine',
            tech = 'kr-automation',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-greenhouse'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-greenhouse',
            ref_name = 'kr-greenhouse',
            tech = 'kr-greenhouse',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-bio-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-bio-lab',
            ref_name = 'kr-bio-lab',
            tech = 'kr-bio-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-electrolysis-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-electrolysis-plant',
            ref_name = 'kr-electrolysis-plant',
            tech = 'kr-fluids-chemistry',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-filtration-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-filtration-plant',
            ref_name = 'kr-filtration-plant',
            tech = 'kr-fluids-chemistry',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-fuel-refinery'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-fuel-refinery',
            ref_name = 'kr-fuel-refinery',
            tech = 'kr-fuel',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-atmospheric-condenser'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-atmospheric-condenser',
            ref_name = 'kr-atmospheric-condenser',
            tech = 'kr-atmosphere-condensation',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-advanced-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'lab',
            name = 'biusart-lab',
            ref_name = 'biusart-lab',
            tech = 'kr-advanced-lab',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        }

        items['item']['kr-singularity-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'lab',
            name = 'kr-singularity-lab',
            ref_name = 'kr-singularity-lab',
            tech = 'kr-singularity-lab',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        }

        items['item']['kr-research-server'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-research-server',
            ref_name = 'kr-research-server',
            tech = 'kr-research-server',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-quantum-computer'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-quantum-computer',
            ref_name = 'kr-quantum-computer',
            tech = 'kr-quantum-computer',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-matter-plant'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-matter-plant',
            ref_name = 'kr-matter-plant',
            tech = 'kr-matter-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-matter-assembler'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'kr-matter-assembler',
            ref_name = 'kr-matter-assembler',
            tech = 'kr-matter-processing',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['kr-quarry-drill'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'mining-drill',
            name = 'kr-quarry-drill',
            ref_name = 'kr-quarry-drill',
            tech = 'kr-quarry-minerals-extraction',
            min = 2,
            max = settings.startup['PHI-MB-MINING-TIER'].value
        }
    end

    if mods['space-exploration'] then
        items['item']['se-space-solar-panel'] = {
            enabled = settings.startup['PHI-EN'].value,
            stage = 2,
            type = 'solar-panel',
            name = 'se-space-solar-panel',
            ref_name = 'se-space-solar-panel',
            tech = 'compound-energy',
            min = 4,
            max = settings.startup['PHI-EN-SOLAR-TIER'].value
        }

        items['item']['se-space-assembling-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-assembling-machine',
            ref_name = 'se-space-assembling-machine',
            tech = 'se-space-assembling',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-manufactory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-manufactory',
            ref_name = 'se-space-manufactory',
            tech = 'se-space-manufactory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-casting-machine'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-casting-machine',
            ref_name = 'se-casting-machine',
            tech = 'se-pyroflux-smelting',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-pulveriser'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-pulveriser',
            ref_name = 'se-pulveriser',
            tech = 'se-pulveriser',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-lifesupport-facility'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-lifesupport-facility',
            ref_name = 'se-lifesupport-facility',
            tech = 'se-lifesupport-facility',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-fuel-refinery'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-fuel-refinery',
            ref_name = 'se-fuel-refinery',
            tech = 'se-fuel-refining',
            min = 2,
            max = settings.startup['PHI-MB-OIL-TIER'].value
        }

        items['item']['se-space-decontamination-facility'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-decontamination-facility',
            ref_name = 'se-space-decontamination-facility',
            tech = 'se-space-decontamination-facility',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-genetics-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-genetics-laboratory',
            ref_name = 'se-space-genetics-laboratory',
            tech = 'se-space-genetics-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-growth-facility'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-growth-facility',
            ref_name = 'se-space-growth-facility',
            tech = 'se-space-growth-facility',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-biochemical-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-biochemical-laboratory',
            ref_name = 'se-space-biochemical-laboratory',
            tech = 'se-space-biochemical-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-radiation-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-radiation-laboratory',
            ref_name = 'se-space-radiation-laboratory',
            tech = 'se-space-radiation-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-electromagnetics-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-electromagnetics-laboratory',
            ref_name = 'se-space-electromagnetics-laboratory',
            tech = 'se-space-electromagnetics-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-laser-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-laser-laboratory',
            ref_name = 'se-space-laser-laboratory',
            tech = 'se-space-laser-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-astrometrics-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-astrometrics-laboratory',
            ref_name = 'se-space-astrometrics-laboratory',
            tech = 'se-space-astrometrics-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-gravimetrics-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-gravimetrics-laboratory',
            ref_name = 'se-space-gravimetrics-laboratory',
            tech = 'se-space-gravimetrics-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-mechanical-laboratory'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-mechanical-laboratory',
            ref_name = 'se-space-mechanical-laboratory',
            tech = 'se-space-mechanical-laboratory',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-material-fabricator'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-material-fabricator',
            ref_name = 'se-space-material-fabricator',
            tech = 'se-space-material-fabricator',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-particle-accelerator'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-particle-accelerator',
            ref_name = 'se-space-particle-accelerator',
            tech = 'se-space-particle-accelerator',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-particle-collider'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-particle-collider',
            ref_name = 'se-space-particle-collider',
            tech = 'se-space-particle-collider',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-plasma-generator'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-plasma-generator',
            ref_name = 'se-space-plasma-generator',
            tech = 'se-space-plasma-generator',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-hypercooler'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-hypercooler',
            ref_name = 'se-space-hypercooler',
            tech = 'se-space-hypercooling-1',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-radiator'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-radiator',
            ref_name = 'se-space-radiator-2',
            tech = 'se-space-radiator-2',
            min = 3,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value + 1
        }

        items['item']['se-space-telescope'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope',
            ref_name = 'se-space-telescope',
            tech = 'se-space-telescope',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-telescope-gammaray'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-gammaray',
            ref_name = 'se-space-telescope-gammaray',
            tech = 'se-space-telescope-gammaray',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-telescope-microwave'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-microwave',
            ref_name = 'se-space-telescope-microwave',
            tech = 'se-space-telescope-microwave',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-telescope-radio'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-radio',
            ref_name = 'se-space-telescope-radio',
            tech = 'se-space-telescope-radio',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-telescope-xray'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'assembling-machine',
            name = 'se-space-telescope-xray',
            ref_name = 'se-space-telescope-xray',
            tech = 'se-space-telescope-xray',
            min = 2,
            max = settings.startup['PHI-MB-ASSEMBLING-TIER'].value
        }

        items['item']['se-space-science-lab'] = {
            enabled = settings.startup['PHI-MB'].value,
            stage = 2,
            type = 'lab',
            name = 'se-space-science-lab',
            ref_name = 'se-space-science-lab',
            tech = 'se-space-science-lab',
            min = 2,
            max = settings.startup['PHI-MB-LAB-TIER'].value
        }

        items['equipment']['fusion-reactor-equipment'].tech = 'se-rtg-equipment'
        items['equipment']['fusion-reactor-equipment'].base_name = 'se-rtg'

        items['equipment']['battery-equipment'].tech = 'battery-equipment'
        items['equipment']['battery-equipment'].min = 2

        items['equipment']['energy-shield-equipment'].tech = 'energy-shield-equipment'
        items['equipment']['energy-shield-equipment'].min = 2

        items['equipment']['personal-roboport-equipment'].tech = 'personal-roboport-equipment'
        items['equipment']['personal-roboport-equipment'].min = 2
    end

** MAIN

-- equipment
function main.EEQ(source, tier)
    local item = table.deepcopy(data.raw[source.type][source.ref_name])

    item.name = source.name .. '-mk' .. tier .. '-equipment'
    item.take_result = source.name .. '-mk' .. tier .. '-equipment'

    if item.power then
        item.power = tostring(tonumber(string.match(item.power, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.power, '%a+')
    end

    if item.energy_source then
        if item.energy_source.buffer_capacity then
            item.energy_source.buffer_capacity = tostring(tonumber(string.match(item.energy_source.buffer_capacity, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_source.buffer_capacity, '%a+')
        end

        if item.energy_source.input_flow_limit then
            item.energy_source.input_flow_limit = tostring(tonumber(string.match(item.energy_source.input_flow_limit, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_source.input_flow_limit, '%a+')
        end

        if item.energy_source.output_flow_limit then
            item.energy_source.output_flow_limit = tostring(tonumber(string.match(item.energy_source.output_flow_limit, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_source.output_flow_limit, '%a+')
        end
    end

    if item.energy_consumption then
        item.energy_consumption = tostring(tonumber(string.match(item.energy_consumption, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_consumption, '%a+')

    elseif item.energy_input then
        item.energy_input = tostring(tonumber(string.match(item.energy_input, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.energy_input, '%a+')
    end

    if item.darkness_to_turn_on and item.color_lookup then
        item.darkness_to_turn_on = 0
        item.color_lookup = {{0, '__core__/graphics/color_luts/lut-sunset.png'}}

    elseif item.attack_parameters then
        if item.attack_parameters.cooldown then
            item.attack_parameters.cooldown = math.floor(item.attack_parameters.cooldown * ((32 - (tier - source.min + 1)) / 32))
        end

        if item.attack_parameters.damage_modifier then
            item.attack_parameters.damage_modifier = item.attack_parameters.damage_modifier * (2 ^ (tier - source.min + 1))
        end

        if item.attack_parameters.ammo_type then
            if item.attack_parameters.ammo_type.energy_consumption then
                item.attack_parameters.ammo_type.energy_consumption = tostring(tonumber(string.match(item.attack_parameters.ammo_type.energy_consumption, '[%d%.]+')) * (2 ^ (tier - source.min + 1))) .. string.match(item.attack_parameters.ammo_type.energy_consumption, '%a+')
            end

            if item.attack_parameters.ammo_type.action_delivery then

                if item.attack_parameters.ammo_type.action_delivery then
                    item.attack_parameters.ammo_type.action_delivery.max_length = item.attack_parameters.ammo_type.action_delivery.max_length + (tier - source.min + 1)
                end
            end
        end

        if item.attack_parameters.range then
            item.attack_parameters.range = item.attack_parameters.range + (tier - source.min + 1)
        end

    elseif item.max_shield_value and item.energy_per_shield then
        item.max_shield_value = item.max_shield_value * (2 ^ (tier - source.min + 1))
        item.energy_per_shield = tostring(math.floor(tonumber(string.match(item.energy_per_shield, '[%d%.]+')) * ((32 - (tier - source.min + 1)) / 32))) .. string.match(item.energy_per_shield, '%a+')

    elseif item.movement_bonus then
        item.movement_bonus = item.movement_bonus * (2 ^ (tier - source.min + 1))

    elseif item.charging_energy and item.charging_station_count then
        item.charging_station_count = math.max(item.charging_station_count, 4)
        item.charging_energy = tostring(tonumber(string.match(item.charging_energy, '[%d%.]+')) * (2 ^ (tier - source.min + 2))) .. string.match(item.charging_energy, '%a+')
    end

    if item.sprite then
        item.sprite.tint = items['tint'][tier]

        if item.sprite.hr_version then
            item.sprite.hr_version.tint = items['tint'][tier]
        end
    end

    item.localised_name = {'phi-cl.combine-gen', {'name.' .. source.ref_name}, tostring(tier)}
    item.localised_description = item.localised_description

    data:extend({item})
end


            for _, tc in pairs({'layers', 'sheets'}) do
                if item[ve][tc] and item[ve][tc][1] then
                    item[ve][tc][1].tint = items['tint'][tier]

                    if item[ve][tc][1].hr_version then
                        item[ve][tc][1].hr_version.tint = items['tint'][tier]
                    end
                end

                for _, v in pairs(item[ve]) do
                    if type(v) == 'table' then
                        if v[tc] then
                            if v[tc][1] then
                                v[tc][1].tint = items['tint'][tier]

                                if v[tc][1].hr_version then
                                    v[tc][1].hr_version.tint = items['tint'][tier]
                                end
                            end
                        end

                        for i=1, #v, 1 do
                            if v[i] and type(v[i]) == 'table' then
                                if v[i][tc] and v[i][tc][1] then
                                    v[i][tc][1].tint = items['tint'][tier]

                                    if v[i][tc][1].hr_version then
                                        v[i][tc][1].hr_version.tint = items['tint'][tier]
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
    if source.name == 'kr-gas-power-station' then
        item.fluid_usage_per_tick = item.fluid_usage_per_tick * (tier - source.min + 2)

    elseif (source.ref_name == 'se-space-solar-panel') then
        item.production = tostring(tonumber(string.match(item.production, '[%d%.]+')) * (4 ^ (tier - source.min + 2))) .. string.match(item.production, '%a+')
        end

** DATA
for _, v in pairs(items['equipment']) do
    if (v.stage == file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'equipment'

        for j=v.min, v.max, 1 do
            main.EEQ(v, j)
            main.EI(v, j)
            main.ER(v, j)
            main.ET(v, j)
        end
    end
end


if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TRAIN'].value then
    local item = table.deepcopy(data.raw['item']['used-up-uranium-fuel-cell'])
    item.name = 'empty-train-battery'
    item.icon = items['general']['graphics_location'] .. 'battery.png'
    item.order = 'qa'
    item.stack_size = 100
    item.localised_name = {'name.empty-train-battery'}
    item.localised_description = {'description.empty-train-battery'}
    data:extend({item})

    data:extend({{
        type = 'recipe',
        name = 'empty-train-battery',
        energy_required = 30,
        enabled = true,
        icon = items['general']['graphics_location'] .. 'battery.png',
        icon_size = 64,
        subgroup = 'intermediate-product',
        order = 'zc',
        allow_productivity = true,
        ingredients = {{type='item', name='battery', amount=50}},
        results = {{type='item', name='empty-train-battery', amount=1}},
        main_product = 'empty-train-battery',
        localised_name = {'name.empty-train-battery'},
        localised_description = {'description.empty-train-battery'}
    }})

    item = table.deepcopy(data.raw['item']['nuclear-fuel'])
    item.name = 'charged-train-battery'
    item.burnt_result = 'empty-train-battery'
    item.fuel_value = '1GJ'
    item.icon = items['general']['graphics_location'] .. 'battery.png'
    item.stack_size = 10
    item.localised_name = {'name.charged-train-battery'}
    item.localised_description = {'description.charged-train-battery'}
    data:extend({item})

    data:extend({{
        type = 'recipe',
        name = 'charged-train-battery',
        energy_required = 60,
        enabled = true,
        icon = items['general']['graphics_location'] .. 'battery.png',
        icon_size = 64,
        subgroup = 'intermediate-product',
        ingredients = {{type='item', name='empty-train-battery', amount=1}},
        results = {{type='item', name='charged-train-battery', probability=0.995, amount=1}, {type='item', name='battery', probability=0.005, amount=5}},
        main_product = 'charged-train-battery',
        localised_name = {'name.charged-train-battery'},
        localised_description = {'description.charged-train-battery'}
    }})

    data.raw['locomotive']['locomotive'].burner.burnt_inventory_size = 1
end

** DATA UPDATE
if settings.startup['PHI-MB'].value and mods['space-exploration'] and settings.startup['PHI-MB-MINING-TIER'].value > 1 then
    data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group = 'se-core-miner-drill'

    local se = {
        type = 'mining-drill',
        name = 'se-core-miner-drill',
        ref_name = 'se-core-miner-drill',
        min = 2,
        max = 3
    }

    for i=2, settings.startup['PHI-MB-MINING-TIER'].value do
        local miner_name = 'se-core-miner-' .. i
        local drill_name = 'se-core-miner-drill-' .. i

        main.EEE(se, i)
        data.raw['mining-drill'][drill_name].minable.result = miner_name
        data.raw['mining-drill'][drill_name].placeable_by.item = miner_name

        local item = table.deepcopy(data.raw['item']['se-core-miner'])
        item.name = 'se-core-miner-' .. i
        item.place_result = drill_name
        item.order = 'zzzz-core-miner-' .. i

        item.icons = {
            {
                icon = '__space-exploration-graphics__/graphics/icons/core-miner.png',
                tint = items['tint'][i],
                icon_size = 64,
            }
        }

        item.icon = nil
        item.icon_size = nil
        item.localised_name = {'name.se-core-miner-drill'}
        item.localised_description = {'description.se-core-miner-drill'}
        data:extend({item})

        if i > 2 then
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{name='se-core-miner-' .. (i - 1), amount=1}, {name='se-core-miner', amount=1}},
                result = miner_name,
                localised_name = {'name.se-core-miner-drill'},
                localised_description = {'description.se-core-miner-drill'}
            }})

        else
            data:extend({{
                type = 'recipe',
                name = miner_name,
                energy_required = 2,
                enabled = false,
                ingredients = {{name='se-core-miner', amount=2}},
                result = miner_name,
                localised_name = {'name.se-core-miner-drill'},
                localised_description = {'description.se-core-miner-drill'}
            }})
        end

        data.raw['mining-drill'][drill_name].fast_replaceable_group = data.raw['mining-drill']['se-core-miner-drill'].fast_replaceable_group
        table.insert(data.raw.technology['se-core-miner'].effects, {type='unlock-recipe', recipe=miner_name})
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-REPAIR'].value then
    for _, v in pairs(data.raw['repair-tool']) do
        v.speed = v.speed * settings.startup['PHI-MI-REPAIR'].value
        v.durability = v.durability * settings.startup['PHI-MI-REPAIR'].value
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-PIPE'].value then
    local s = (1 + settings.startup['PHI-MI-PIPE'].value) / 2

    for _, t in pairs({data.raw['pipe'], data.raw['pipe-to-ground']}) do
        for _, v in pairs(t) do
            if v.fluid_box.height then
                v.fluid_box.height = v.fluid_box.height * s

            else
                v.fluid_box.height = s
            end
        end
    end

    for _, v in pairs(data.raw['pump']) do
        if v.fluid_box.height then
            v.fluid_box.height = v.fluid_box.height * s

        else
            v.fluid_box.height = s
        end

        v.pumping_speed = v.pumping_speed * s
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-ROBOT'].value then
    local s = (1 + settings.startup['PHI-MI-ROBOT'].value) / 2
    local sn = (17 - settings.startup['PHI-MI-ROBOT'].value) / 16

    for _, t in pairs({data.raw['construction-robot'], data.raw['logistic-robot']}) do
        for _, v in pairs(t) do
            v.speed = v.speed * s
            v.energy_per_tick = tostring(tonumber(string.match(v.energy_per_tick, '[%d%.]+')) * sn) .. string.match(v.energy_per_tick, '%a+')
            v.energy_per_move = tostring(tonumber(string.match(v.energy_per_move, '[%d%.]+')) * sn) .. string.match(v.energy_per_move, '%a+')
        end
    end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-TRAIN'].value then
    local s = (7 + settings.startup['PHI-MI-TRAIN'].value) / 8

    for _, t in pairs({data.raw['locomotive'], data.raw['cargo-wagon'], data.raw['fluid-wagon'], data.raw['artillery-wagon']}) do
        for _, v in pairs(t) do
            v.max_health = v.max_health * s
            v.max_speed = v.max_speed * s
            v.braking_force = v.braking_force * s

            if v.max_power then
                v.max_power = tostring(tonumber(string.match(v.max_power, '[%d%.]+')) * s) .. string.match(v.max_power, '%a+')
                v.reversing_power_modifier = 1
            end
        end
    end
end

** DATA FINAL FIXES
data.raw['utility-constants'].default.zoom_to_world_effect_strength = 0
data.raw['utility-constants'].default.zoom_to_world_can_use_nightvision = true
data.raw['utility-constants'].default.train_inactivity_wait_condition_default = 60

data.raw['arithmetic-combinator']['arithmetic-combinator'].energy_source.usage_priority = 'primary-input'
data.raw['decider-combinator']['decider-combinator'].energy_source.usage_priority = 'primary-input'

data.raw['active-defense-equipment']['discharge-defense-equipment'].automatic = true

data.raw['gui-style']['default'].machine_slots_scroll_pane.maximal_height = nil
data.raw['gui-style']['default'].machine_ingredients_scroll_pane.maximal_height = nil
data.raw['gui-style']['default'].machine_outputs_scroll_pane.maximal_height = nil
data.raw['gui-style']['default'].module_inventory_scroll_pane.maximal_height = nil
data.raw['utility-constants'].select_group_row_count

for _,name in pairs({'furnace', 'lab', 'beacon'}) do
	local entities = {}

	for _, entity in pairs(data.raw[name]) do
		table.insert(entities, entity.name)
	end

	for _, entity in pairs(data.raw[name]) do
		entity.additional_pastable_entities = entities
	end
end


for _, t in pairs(data.raw['tree']) do
	t.collision_box = {{-0.05, -0.05}, {0.05, 0.05}}
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-ARTILLERY'].value then
	for _, t in pairs({data.raw['artillery-turret'], data.raw['artillery-wagon']}) do
		for _, v in pairs(t) do
			v.manual_range_modifier = 1
		end
	end

	-- data.raw['artillery-projectile']['artillery-projectile'].reveal_map = false
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TILE'].value then
	for _, tile in pairs (data.raw.tile) do
		tile.autoplace = nil
	end

	data.raw.tile[settings.startup['PHI-CT-TILE-CHOICE'].value].autoplace = {}

	for _, t in pairs({data.raw['simple-entity'], data.raw['optimized-decorative'], data.raw['fish']}) do
		for _, e in pairs(t) do
			e.autoplace = nil
		end
    end

	local autoplace_controls = {}

	for k, _ in pairs (data.raw['autoplace-control']) do
		autoplace_controls[k] = {
			size = 'none'
		}
	end

	data.raw['map-gen-presets']['default']['empty-world'] = {
		order = 'zz',
		basic_settings = {
			autoplace_controls = autoplace_controls,
			water = 'none',
			cliff_settings = {
				name = 'none',
				cliff_elevation_interval = 100,
				cliff_elevation_0 = 100,
				richness = 0
			}
		},
		advanced_settings = {
			pollution = {enabled = false},
			enemy_evolution = {enabled = false},
			enemy_expansion = {enabled = false}
		}
	}
end

** SETTING
{
    type = 'bool-setting',
    name = 'PHI-EQ',
    setting_type = 'startup',
    default_value = false,
    order = 'D00'
  }, 
, {
    type = 'int-setting',
    name = 'PHI-EQ-SOLAR-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'D01'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-BATTERY-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'D02'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-REACTOR-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'D03'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-LASER-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'D04'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-ROBOPORT-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'D05'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-SHIELD-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'D06'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-NIGHT-TIER',
    setting_type = 'startup',
    default_value = 2,
    allowed_values = {1, 2},
    order = 'D07'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-EXO-TIER',
    setting_type = 'startup',
    default_value = 2,
    allowed_values = {1, 2},
    order = 'D08'
  }, {
    type = 'bool-setting',
    name = 'PHI-EQ-ARMOR',
    setting_type = 'startup',
    default_value = true,
    order = 'D09'
  }, 
   {
    type = 'int-setting',
    name = 'PHI-MI-REPAIR',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'E06'
  }, {
    type = 'int-setting',
    name = 'PHI-MI-PIPE',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'E07'
  }, {
    type = 'int-setting',
    name = 'PHI-MI-ROBOT',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'E08'
  }, {
    type = 'int-setting',
    name = 'PHI-MI-TRAIN',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'E09'
  }, {
    type = 'bool-setting',
    name = 'PHI-MI-ARTILLERY',
    setting_type = 'startup',
    default_value = true,
    order = 'E10'
  }, 
  
        "? aai-industry >= 0.5.0",
        "? Krastorio2 >= 1.3.0",
        "? space-exploration >= 0.6.0",
        "(?) big-mining-drill >= 0.1.0",
        "(?) angelsrefining >= 0.12.0",
        "(?) exotic-industries >= 0.6.0"
]]
