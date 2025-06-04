data:extend({
{
  type = 'bool-setting',
  name = 'PHI-MB',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', {'mod-setting-name-prefix.PHI-MB'}, {'phi-cl.enable', {'mod-setting-name.PHI-MB'}}},
  order = 'A00'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-ENERGY',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.setting-category-color', {'mod-setting-name-prefix.PHI-MB-ENERGY'}, {'phi-cl.enable', {'mod-setting-name.PHI-MB-ENERGY'}}},
  order = 'AA00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-ENERGY-POWER-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MB-ENERGY-POWER-TIER'}, {'phi-cl.tier', {'mod-setting-name.PHI-MB-ENERGY-POWER-TIER'}}},
  order = 'AA01'
}, {
  type = 'int-setting',
  name = 'PHI-MB-ENERGY-SOLAR-RATIO',
  setting_type = 'startup',
  default_value = 4,
  allowed_values = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MB-ENERGY-SOLAR-RATIO'}, {'phi-cl.proportion', {'mod-setting-name.PHI-MB-ENERGY-SOLAR-RATIO'}}},
  order = 'AA02'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-MACHINE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', {'mod-setting-name-prefix.PHI-MB-MACHINE'}, {'phi-cl.enable', {'mod-setting-name.PHI-MB-MACHINE'}}},
  order = 'AB00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-MACHINE-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MB-MACHINE-TIER'}, {'phi-cl.tier', {'mod-setting-name.PHI-MB-MACHINE-TIER'}}},
  order = 'AB01'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT'}, {'phi-cl.enable', {'mod-setting-name.PHI-MB-EQUIPMENT'}}},
  order = 'AC00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-EQUIPMENT-TIER',
  setting_type = 'startup',
  default_value = 2,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-TIER'}, {'phi-cl.tier', {'mod-setting-name.PHI-MB-EQUIPMENT-TIER'}}},
  order = 'AC01'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT-ARMOR',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-ARMOR'}, {'phi-cl.enable', {'mod-setting-name.PHI-MB-EQUIPMENT-ARMOR'}}},
  order = 'AC02'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT-SIZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-SIZE'}, {'phi-cl.enable', {'mod-setting-name.PHI-MB-EQUIPMENT-SIZE'}}},
  order = 'AC03'
}, {
  type = 'bool-setting',
  name = 'PHI-MI',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', {'mod-setting-name-prefix.PHI-MI'}, {'phi-cl.enable', {'mod-setting-name.PHI-MI'}}},
  order = 'B00'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 160,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MI-PIPE'}, {'phi-cl.proportion', {'mod-setting-name.PHI-MI-PIPE'}}},
  order = 'B01'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROBOT',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 160,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MI-ROBOT'}, {'phi-cl.proportion', {'mod-setting-name.PHI-MI-ROBOT'}}},
  order = 'B02'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-ROBOT-ENERGY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MI-ROBOT-ENERGY'}, {'phi-cl.enable', {'mod-setting-name.PHI-MI-ROBOT-ENERGY'}}},
  order = 'B03'
}, {
  type = 'int-setting',
  name = 'PHI-MI-TRAIN',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 160,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MI-TRAIN'}, {'phi-cl.proportion', {'mod-setting-name.PHI-MI-TRAIN'}}},
  order = 'B04'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE-EXTENT',
  setting_type = 'startup',
  default_value = 320,
  minimum_value = 80,
  maximum_value = 10240,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-MI-PIPE-EXTENT'}, {'mod-setting-name.PHI-MI-PIPE-EXTENT'}},
  order = 'B05'
}, {
  type = 'bool-setting',
  name = 'PHI-SA',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', {'mod-setting-name-prefix.PHI-SA'}, {'phi-cl.enable', {'mod-setting-name.PHI-SA'}}},
  order = 'C00'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-SA-SPOIL'}, {'phi-cl.enable', {'mod-setting-name.PHI-SA-SPOIL'}}},
  order = 'C01'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL-FREEZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE'}, {'phi-cl.enable', {'mod-setting-name.PHI-SA-SPOIL-FREEZE'}}},
  order = 'C02'
}, {
  type = 'int-setting',
  name = 'PHI-SA-SPOIL-FREEZE-RATIO',
  setting_type = 'startup',
  default_value = 50,
  minimum_value = 1,
  maximum_value = 1000,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE-RATIO'}, {'phi-cl.proportion', {'mod-setting-name.PHI-SA-SPOIL-FREEZE-RATIO'}}},
  order = 'C03'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-ENABLE-QUALITY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-SA-ENABLE-QUALITY'}, {'phi-cl.enable', {'mod-setting-name.PHI-SA-ENABLE-QUALITY'}}},
  order = 'C04'
}, {
  type = 'int-setting',
  name = 'PHI-SA-QUALITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 100,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-SA-QUALITY'}, {'phi-cl.proportion', {'mod-setting-name.PHI-SA-QUALITY'}}},
  order = 'C05'
}, {
  type = 'int-setting',
  name = 'PHI-SA-ROCKET-CAPACITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 10000,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-SA-ROCKET-CAPACITY'}, {'phi-cl.proportion', {'mod-setting-name.PHI-SA-ROCKET-CAPACITY'}}},
  order = 'C06'
}, {
  type = 'string-setting',
  name = 'PHI-GM',
  setting_type = 'startup',
  allow_blank = true,
  default_value = '',
  allowed_values = {'', 'SAP', 'VP'},
  localised_name = {'phi-cl.setting-category-color', {'mod-setting-name-prefix.PHI-GM'}, {'phi-cl.enable', {'mod-setting-name.PHI-GM'}}},
  order = 'D00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-category-color', {'mod-setting-name-prefix.PHI-CT'}, {'phi-cl.enable', {'mod-setting-name.PHI-CT'}}},
  order = 'E00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT-TILE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-CT-TILE'}, {'mod-setting-name.PHI-CT-TILE'}},
  order = 'E01'
}, {
  type = 'string-setting',
  name = 'PHI-CT-TILE-CHOICE',
  setting_type = 'startup',
  default_value = 'grass-1',
  allowed_values = {'landfill', 'stone-path', 'concrete', 'refined-concrete', 'water', 'water-mud', 'water-shallow', 'deepwater', 'deepwater-green', 'dirt-1', 'dirt-2', 'dirt-3', 'dirt-4', 'dirt-5', 'dirt-6', 'dirt-7', 'dry-dirt', 'grass-1', 'grass-2', 'grass-3', 'grass-4'},
  localised_name = {'phi-cl.setting-class-color', {'mod-setting-name-prefix.PHI-CT-TILE-CHOICE'}, {'mod-setting-name.PHI-CT-TILE-CHOICE'}},
  order = 'E02'
}
})
