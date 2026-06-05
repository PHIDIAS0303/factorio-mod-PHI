data:extend({
{
  type = 'bool-setting',
  name = 'PHI-MB',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', 'MB', {'phi-cl.enable'}, {'mod-setting-name.PHI-MB'}},
  localised_description = {'', ''},
  order = 'A00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-ENERGY',
  setting_type = 'startup',
  default_value = 1,
  minimum_value = 1,
  maximum_value = 8,
  localised_name = {'phi-cl.setting-category-color', 'MBE', {'phi-cl.enable'}, {'mod-setting-name.PHI-MB-ENERGY'}},
  localised_description = {'', '[item=solar-panel]', {'phi-cl.setting-change-color', '\n[104] A103 C1'}},
  order = 'AA00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-ENERGY-SOLAR-RATIO',
  setting_type = 'startup',
  default_value = 4,
  minimum_value = 2,
  maximum_value = 16,
  localised_name = {'phi-cl.setting-class-color', 'MBE1', {'phi-cl.ratio'}, {'mod-setting-name.PHI-MB-ENERGY-SOLAR-RATIO'}},
  localised_description = {'', '[item=beacon]'},
  order = 'AA01'
}, {
  type = 'int-setting',
  name = 'PHI-MB-MACHINE',
  setting_type = 'startup',
  default_value = 1,
  minimum_value = 1,
  maximum_value = 3,
  localised_name = {'phi-cl.setting-category-color', 'MBM', {'phi-cl.enable'}, {'mod-setting-name.PHI-MB-MACHINE'}},
  localised_description = {'', '[item=assembling-machine-3]', {'phi-cl.setting-change-color', '\n[150] A150'}},
  order = 'AB00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-EQUIPMENT',
  setting_type = 'startup',
  default_value = 1,
  minimum_value = 1,
  maximum_value = 3,
  localised_name = {'phi-cl.setting-category-color', 'MBQ', {'phi-cl.enable'}, {'mod-setting-name.PHI-MB-EQUIPMENT'}},
  localised_description = {'', '[item=personal-laser-defense-equipment]', {'phi-cl.setting-change-color', '\n[63] A63'}},
  order = 'AC00'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT-ARMOR',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', 'MBQ1', {'phi-cl.enable'}, {'mod-setting-name.PHI-MB-EQUIPMENT-ARMOR'}},
  localised_description = (mods['space-age'] and {'', '[item=power-armor-mk2] 3, [item=mech-armor] 2', {'phi-cl.setting-change-color', '\n[8] A8'}}) or {'', '[item=power-armor-mk2] 3', {'phi-cl.setting-change-color', '\n[8] A8'}},
  order = 'AC01'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT-SIZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', 'MBQ2', {'phi-cl.enable'}, {'mod-setting-name.PHI-MB-EQUIPMENT-SIZE'}},
  localised_description = {'', '1x1', {'phi-cl.setting-change-color', '\n[11] A11'}},
  order = 'AC02'
}, {
  type = 'bool-setting',
  name = 'PHI-MI',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', 'MI', {'phi-cl.enable'}, {'mod-setting-name.PHI-MI'}},
  localised_description = {'', ''},
  order = 'B00'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-GENERIC',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', 'MI1', {'phi-cl.enable'}, {'mod-setting-name.PHI-MI-GENERIC'}},
  localised_description = {'', {'phi-cl.setting-change-color', '[183] A104 C79'}},
  order = 'B01'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 160,
  localised_name = {'phi-cl.setting-class-color', 'MI2', {'phi-cl.ratio'}, {'mod-setting-name.PHI-MI-PIPE'}},
  localised_description = {'', '[item=pipe] x0.1', {'phi-cl.setting-change-color', '\n[9] C9'}},
  order = 'B02'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-ROBOT-ENERGY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', 'MI3', {'phi-cl.enable'}, {'mod-setting-name.PHI-MI-ROBOT-ENERGY'}},
  localised_description = {'', '[item=battery]', {'phi-cl.setting-change-color', '\n[2] C2'}},
  order = 'B03'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE-EXTENT',
  setting_type = 'startup',
  default_value = 320,
  minimum_value = 80,
  maximum_value = 10240,
  localised_name = {'phi-cl.setting-class-color', 'MI4', {'phi-cl.ratio'}, {'mod-setting-name.PHI-MI-PIPE-EXTENT'}},
  localised_description = {'', '[item=pipe-to-ground]', {'phi-cl.setting-change-color', '\n[1] C1'}},
  order = 'B04'
}, {
  type = 'bool-setting',
  name = 'PHI-SA',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', 'SA', {'phi-cl.enable'}, {'mod-setting-name.PHI-SA'}},
  order = 'C00'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', 'SA1', {'phi-cl.enable'}, {'mod-setting-name.PHI-SA-SPOIL'}},
  localised_description = (mods['space-age'] and {'', '[item=spoilage]', {'phi-cl.setting-change-color', '\n[16] A2 C11 H3'}}) or nil,
  order = 'C01'
}, {
  type = 'int-setting',
  name = 'PHI-SA-SPOIL-FREEZE-MULTIPLIER',
  setting_type = 'startup',
  default_value = 50,
  minimum_value = 0,
  maximum_value = 1000,
  localised_name = {'phi-cl.setting-class-color', 'SA2', {'phi-cl.ratio'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE-MULTIPLIER'}},
  localised_description = (mods['space-age'] and {'', '[item=ice][virtual-signal=signal-clock] x0.1', {'phi-cl.setting-change-color', '\n[55] A55'}}) or nil,
  order = 'C02'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-ENABLE-QUALITY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', 'SA3', {'phi-cl.enable'}, {'mod-setting-name.PHI-SA-ENABLE-QUALITY'}},
  localised_description = (mods['space-age'] and {'', '[virtual-signal=signal-any-quality]', {'phi-cl.setting-change-color', '\n[17] H17'}}) or nil,
  order = 'C03'
}, {
  type = 'int-setting',
  name = 'PHI-SA-QUALITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 100,
  localised_name = {'phi-cl.setting-class-color', 'SA4', {'phi-cl.ratio'}, {'mod-setting-name.PHI-SA-QUALITY'}},
  localised_description = (mods['space-age'] and {'', '[item=quality-module-3] x 0.1', {'phi-cl.setting-change-color', '\n[34] C25 H9'}}) or nil,
  order = 'C04'
}, {
  type = 'int-setting',
  name = 'PHI-SA-ROCKET-CAPACITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 10000,
  localised_name = {'phi-cl.setting-class-color', 'SA5', {'phi-cl.ratio'}, {'mod-setting-name.PHI-SA-ROCKET-CAPACITY'}},
  localised_description = {'', '[item=rocket-silo] 000 KG', {'phi-cl.setting-change-color', '\n[1] C1'}},
  order = 'C05'
}, {
  type = 'string-setting',
  name = 'PHI-GM',
  setting_type = 'startup',
  allow_blank = true,
  default_value = '',
  allowed_values = {'', 'SAP', 'VP'},
  localised_name = {'phi-cl.setting-category-color', 'GM', {'phi-cl.enable'}, {'mod-setting-name.PHI-GM'}},
  localised_description = {'', {'phi-cl.setting-change-color', '[GM] [48] A20 C21 H7\n[SAP] [33] A3 C30\n[VP] [614] A12 C192 H410'}},
  order = 'D00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', 'CT', {'phi-cl.enable'}, {'mod-setting-name.PHI-CT'}},
  localised_description = {'', {'phi-cl.setting-change-color', '[17] A12 C2 U3'}},
  order = 'E00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT-TILE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', 'CT1', {'phi-cl.enable'}, {'mod-setting-name.PHI-CT-TILE'}},
  localised_description = {'', {'phi-cl.setting-change-color', '[1] C1'}},
  order = 'E01'
}, {
  type = 'string-setting',
  name = 'PHI-CT-TILE-CHOICE',
  setting_type = 'startup',
  default_value = 'grass-1',
  allowed_values = {'landfill', 'stone-path', 'concrete', 'refined-concrete', 'water', 'water-mud', 'water-shallow', 'deepwater', 'deepwater-green', 'dirt-1', 'dirt-2', 'dirt-3', 'dirt-4', 'dirt-5', 'dirt-6', 'dirt-7', 'dry-dirt', 'grass-1', 'grass-2', 'grass-3', 'grass-4'},
  localised_name = {'phi-cl.setting-class-color', 'CT2', '', {'mod-setting-name.PHI-CT-TILE-CHOICE'}},
  order = 'E02'
}
})
