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
  name = 'PHI-MB-ENERGY-SOLAR-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-ENERGY-SOLAR-TIER'}, {'mod-setting-name.PHI-MB-ENERGY-SOLAR-TIER'}},
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
  type = 'int-setting',
  name = 'PHI-MB-ENERGY-POWER-TIER',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-ENERGY-POWER-TIER'}, {'mod-setting-name.PHI-MB-ENERGY-POWER-TIER'}},
  order = 'AA03'
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
  name = 'PHI-MB-WEAPON',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-WEAPON'}, {'mod-setting-name.PHI-MB-WEAPON'}},
  order = 'AC00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-WEAPON-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-WEAPON-TIER'}, {'mod-setting-name.PHI-MB-WEAPON-TIER'}},
  order = 'AC01'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT'}, {'mod-setting-name.PHI-MB-EQUIPMENT'}},
  order = 'AD00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-EQUIPMENT-TIER',
  setting_type = 'startup',
  default_value = 2,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-TIER'}, {'mod-setting-name.PHI-MB-EQUIPMENT-TIER'}},
  order = 'AD01'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT-ARMOR',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-ARMOR'}, {'mod-setting-name.PHI-MB-EQUIPMENT-ARMOR'}},
  order = 'AD02'
}, {
  type = 'bool-setting',
  name = 'PHI-MB-EQUIPMENT-SIZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-EQUIPMENT-SIZE'}, {'mod-setting-name.PHI-MB-EQUIPMENT-SIZE'}},
  order = 'AD03'
}, {
  type = 'bool-setting',
  name = 'PHI-MI',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI'}, {'mod-setting-name.PHI-MI'}},
  order = 'B00'
}, {
  type = 'int-setting',
  name = 'PHI-MI-LANDFILL',
  setting_type = 'startup',
  default_value = 20,
  minimum_value = 1,
  maximum_value = 100,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-LANDFILL'}, {'mod-setting-name.PHI-MI-LANDFILL'}},
  order = 'B01'
}, {
  type = 'int-setting',
  name = 'PHI-MI-EFFCY',
  setting_type = 'startup',
  default_value = 100,
  minimum_value = 10,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-EFFCY'}, {'mod-setting-name.PHI-MI-EFFCY'}},
  order = 'B02'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-PIPE'}, {'mod-setting-name.PHI-MI-PIPE'}},
  order = 'B03'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROBOT',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROBOT'}, {'mod-setting-name.PHI-MI-ROBOT'}},
  order = 'B04'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-ROBOT-ENERGY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROBOT-ENERGY'}, {'mod-setting-name.PHI-MI-ROBOT-ENERGY'}},
  order = 'B05'
}, {
  type = 'int-setting',
  name = 'PHI-MI-TRAIN',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-TRAIN'}, {'mod-setting-name.PHI-MI-TRAIN'}},
  order = 'B06'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE-EXTENT',
  setting_type = 'startup',
  default_value = 320,
  minimum_value = 80,
  maximum_value = 5120,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-PIPE-EXTENT'}, {'mod-setting-name.PHI-MI-PIPE-EXTENT'}},
  order = 'B07'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROCKET-CAPACITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 10000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROCKET-CAPACITY'}, {'mod-setting-name.PHI-MI-ROCKET-CAPACITY'}},
  order = 'B08'
}, {
  type = 'bool-setting',
  name = 'PHI-SA',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA'}, {'mod-setting-name.PHI-SA'}},
  order = 'C00'
}, {
  type = 'int-setting',
  name = 'PHI-SA-HEAT-RADIUS',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-HEAT-RADIUS'}, {'mod-setting-name.PHI-SA-HEAT-RADIUS'}},
  order = 'C01'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL'}, {'mod-setting-name.PHI-SA-SPOIL'}},
  order = 'C02'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL-FREEZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE'}},
  order = 'C03'
}, {
  type = 'int-setting',
  name = 'PHI-SA-SPOIL-FREEZE-RATIO',
  setting_type = 'startup',
  default_value = 50,
  minimum_value = 1,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE-RATIO'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE-RATIO'}},
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
  name = 'PHI-SA-MAX-QUALITY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-MAX-QUALITY'}, {'mod-setting-name.PHI-SA-MAX-QUALITY'}},
  order = 'C06'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-RESTRICTION',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-RESTRICTION'}, {'mod-setting-name.PHI-SA-RESTRICTION'}},
  order = 'C07'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-GENERIC',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-GENERIC'}, {'mod-setting-name.PHI-SA-GENERIC'}},
  order = 'C08'
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
