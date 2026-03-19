local items = {}

if mods and mods['aai-industry'] then
    items['item']['industrial-furnace'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'aai-industry',
        type = 'assembling-machine',
        name = 'industrial-furnace',
        ref_name = 'industrial-furnace',
        tech = 'industrial-furnace',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['fuel-processor'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'aai-industry',
        type = 'assembling-machine',
        name = 'fuel-processor',
        ref_name = 'fuel-processor',
        tech = 'fuel-processing',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }
end

if mods and (mods['aai-industry'] or mods['big-mining-drill']) then
    items['item']['area-mining-drill'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = (mods['big-mining-drill'] and 'big-mining-drill') or 'aai-industry',
        type = 'mining-drill',
        name = 'area-mining-drill',
        ref_name = 'area-mining-drill',
        tech = 'area-mining-drill',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }
end

if mods and mods['space-exploration'] then
    items['item']['se-space-assembling-machine'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-assembling-machine',
        ref_name = 'se-space-assembling-machine',
        tech = 'se-space-assembling',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-manufactory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-manufactory',
        ref_name = 'se-space-manufactory',
        tech = 'se-space-manufactory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-casting-machine'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-casting-machine',
        ref_name = 'se-casting-machine',
        tech = 'se-pyroflux-smelting',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-pulveriser'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-pulveriser',
        ref_name = 'se-pulveriser',
        tech = 'se-pulveriser',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-lifesupport-facility'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-lifesupport-facility',
        ref_name = 'se-lifesupport-facility',
        tech = 'se-lifesupport-facility',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-fuel-refinery'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-fuel-refinery',
        ref_name = 'se-fuel-refinery',
        tech = 'se-fuel-refining',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-decontamination-facility'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-decontamination-facility',
        ref_name = 'se-space-decontamination-facility',
        tech = 'se-space-decontamination-facility',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-genetics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-genetics-laboratory',
        ref_name = 'se-space-genetics-laboratory',
        tech = 'se-space-genetics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-growth-facility'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-growth-facility',
        ref_name = 'se-space-growth-facility',
        tech = 'se-space-growth-facility',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-biochemical-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-biochemical-laboratory',
        ref_name = 'se-space-biochemical-laboratory',
        tech = 'se-space-biochemical-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-radiation-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-radiation-laboratory',
        ref_name = 'se-space-radiation-laboratory',
        tech = 'se-space-radiation-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-electromagnetics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-electromagnetics-laboratory',
        ref_name = 'se-space-electromagnetics-laboratory',
        tech = 'se-space-electromagnetics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-laser-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-laser-laboratory',
        ref_name = 'se-space-laser-laboratory',
        tech = 'se-space-laser-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-astrometrics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-astrometrics-laboratory',
        ref_name = 'se-space-astrometrics-laboratory',
        tech = 'se-space-astrometrics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-gravimetrics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-gravimetrics-laboratory',
        ref_name = 'se-space-gravimetrics-laboratory',
        tech = 'se-space-gravimetrics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-mechanical-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-mechanical-laboratory',
        ref_name = 'se-space-mechanical-laboratory',
        tech = 'se-space-mechanical-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-thermodynamics-laboratory'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-thermodynamics-laboratory',
        ref_name = 'se-space-thermodynamics-laboratory',
        tech = 'se-space-thermodynamics-laboratory',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-material-fabricator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-material-fabricator',
        ref_name = 'se-space-material-fabricator',
        tech = 'se-space-material-fabricator',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-particle-accelerator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-particle-accelerator',
        ref_name = 'se-space-particle-accelerator',
        tech = 'se-space-particle-accelerator',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-particle-collider'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-particle-collider',
        ref_name = 'se-space-particle-collider',
        tech = 'se-space-particle-collider',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-plasma-generator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-plasma-generator',
        ref_name = 'se-space-plasma-generator',
        tech = 'se-space-plasma-generator',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-hypercooler'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-hypercooler',
        ref_name = 'se-space-hypercooler',
        tech = 'se-space-hypercooling-1',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-radiator'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-radiator',
        ref_name = 'se-space-radiator-2',
        tech = 'se-space-radiator-2',
        min = 3,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value + 1
    }

    items['item']['se-space-telescope'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope',
        ref_name = 'se-space-telescope',
        tech = 'se-space-telescope',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-telescope-gammaray'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope-gammaray',
        ref_name = 'se-space-telescope-gammaray',
        tech = 'se-space-telescope-gammaray',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-telescope-microwave'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope-microwave',
        ref_name = 'se-space-telescope-microwave',
        tech = 'se-space-telescope-microwave',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-telescope-radio'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope-radio',
        ref_name = 'se-space-telescope-radio',
        tech = 'se-space-telescope-radio',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-telescope-xray'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'assembling-machine',
        name = 'se-space-telescope-xray',
        ref_name = 'se-space-telescope-xray',
        tech = 'se-space-telescope-xray',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

    items['item']['se-space-science-lab'] = {
        enabled = settings.startup['PHI-MB'].value and settings.startup['PHI-MB-MACHINE'].value,
        stage = 2,
        mod = 'space-exploration',
        type = 'lab',
        name = 'se-space-science-lab',
        ref_name = 'se-space-science-lab',
        tech = 'se-space-science-lab',
        min = 2,
        max = settings.startup['PHI-MB-MACHINE-TIER'].value
    }

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
