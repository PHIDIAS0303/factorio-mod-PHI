data:extend({
{
  type = 'bool-setting',
  name = 'PHI-MB',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB'}, {'mod-setting-name.PHI-MB'}},
  order = 'A00'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-ENERGY',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-ENERGY'}, {'mod-setting-name.PHI-MB-ENERGY'}},
  order = 'AA00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-ENERGY-POWER-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-ENERGY-POWER-TIER'}, {'mod-setting-name.PHI-MB-ENERGY-POWER-TIER'}},
  order = 'AA01'
}, {
  type = 'int-setting',
  name = 'PHI-MB-ENERGY-SOLAR-RATIO',
  setting_type = 'startup',
  default_value = 4,
  allowed_values = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-ENERGY-SOLAR-RATIO'}, {'mod-setting-name.PHI-MB-ENERGY-SOLAR-RATIO'}},
  order = 'AA02'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-MACHINE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-MACHINE'}, {'mod-setting-name.PHI-MB-MACHINE'}},
  order = 'AB00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-MACHINE-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-MACHINE-TIER'}, {'mod-setting-name.PHI-MB-MACHINE-TIER'}},
  order = 'AB01'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT'}, {'mod-setting-name.PHI-MB-EQUIPMENT'}},
  order = 'AC00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-EQUIPMENT-TIER',
  setting_type = 'startup',
  default_value = 2,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-TIER'}, {'mod-setting-name.PHI-MB-EQUIPMENT-TIER'}},
  order = 'AC01'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT-ARMOR',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-ARMOR'}, {'mod-setting-name.PHI-MB-EQUIPMENT-ARMOR'}},
  order = 'AC02'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT-SIZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-SIZE'}, {'mod-setting-name.PHI-MB-EQUIPMENT-SIZE'}},
  order = 'AC03'
}, {
  type = 'bool-setting',
  name = 'PHI-MI',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI'}, {'mod-setting-name.PHI-MI'}},
  order = 'B00'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 160,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-PIPE'}, {'mod-setting-name.PHI-MI-PIPE'}},
  order = 'B01'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROBOT',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 160,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROBOT'}, {'mod-setting-name.PHI-MI-ROBOT'}},
  order = 'B02'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-ROBOT-ENERGY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROBOT-ENERGY'}, {'mod-setting-name.PHI-MI-ROBOT-ENERGY'}},
  order = 'B03'
}, {
  type = 'int-setting',
  name = 'PHI-MI-TRAIN',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 160,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-TRAIN'}, {'mod-setting-name.PHI-MI-TRAIN'}},
  order = 'B04'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE-EXTENT',
  setting_type = 'startup',
  default_value = 320,
  minimum_value = 80,
  maximum_value = 10240,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-PIPE-EXTENT'}, {'mod-setting-name.PHI-MI-PIPE-EXTENT'}},
  order = 'B05'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROCKET-CAPACITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 10000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROCKET-CAPACITY'}, {'mod-setting-name.PHI-MI-ROCKET-CAPACITY'}},
  order = 'B06'
}, {
  type = 'bool-setting',
  name = 'PHI-SA',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA'}, {'mod-setting-name.PHI-SA'}},
  order = 'C00'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL'}, {'mod-setting-name.PHI-SA-SPOIL'}},
  order = 'C01'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL-FREEZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE'}},
  order = 'C02'
}, {
  type = 'int-setting',
  name = 'PHI-SA-SPOIL-FREEZE-RATIO',
  setting_type = 'startup',
  default_value = 50,
  minimum_value = 1,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE-RATIO'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE-RATIO'}},
  order = 'C03'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-ENABLE-QUALITY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-ENABLE-QUALITY'}, {'mod-setting-name.PHI-SA-ENABLE-QUALITY'}},
  order = 'C04'
}, {
  type = 'int-setting',
  name = 'PHI-SA-QUALITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 100,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-QUALITY'}, {'mod-setting-name.PHI-SA-QUALITY'}},
  order = 'C05'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-GENERIC',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-GENERIC'}, {'mod-setting-name.PHI-SA-GENERIC'}},
  order = 'C06'
}, {
  type = 'bool-setting',
  name = 'PHI-VP',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-VP'}, {'mod-setting-name.PHI-VP'}},
  order = 'D00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT'}, {'mod-setting-name.PHI-CT'}},
  order = 'E00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT-TILE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-TILE'}, {'mod-setting-name.PHI-CT-TILE'}},
  order = 'E01'
}, {
  type = 'string-setting',
  name = 'PHI-CT-TILE-CHOICE',
  setting_type = 'startup',
  default_value = 'grass-1',
  allowed_values = {'landfill', 'stone-path', 'concrete', 'refined-concrete', 'lab-dark-1', 'lab-dark-2', 'lab-white', 'water', 'water-green', 'water-mud', 'water-shallow', 'deepwater', 'deepwater-green', 'dirt-1', 'dirt-2', 'dirt-3', 'dirt-4', 'dirt-5', 'dirt-6', 'dirt-7', 'dry-dirt', 'grass-1', 'grass-2', 'grass-3', 'grass-4'},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-TILE-CHOICE'}, {'mod-setting-name.PHI-CT-TILE-CHOICE'}},
  order = 'E02'
}
})
