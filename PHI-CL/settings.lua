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
  name = 'PHI-MB-WEAPON-TURRET-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-WEAPON-TURRET-TIER'}, {'mod-setting-name.PHI-MB-WEAPON-TURRET-TIER'}},
  order = 'AC01'
}, {
  type = 'int-setting',
  name = 'PHI-MB-WEAPON-RADAR-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-WEAPON-RADAR-TIER'}, {'mod-setting-name.PHI-MB-WEAPON-RADAR-TIER'}},
  order = 'AC02'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ'}, {'mod-setting-name.PHI-EQ'}},
  order = 'B00'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-POWER-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-POWER-TIER'}, {'mod-setting-name.PHI-EQ-POWER-TIER'}},
  order = 'B01'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-DEFENSE-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-DEFENSE-TIER'}, {'mod-setting-name.PHI-EQ-DEFENSE-TIER'}},
  order = 'B02'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-TOOL-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-TOOL-TIER'}, {'mod-setting-name.PHI-EQ-TOOL-TIER'}},
  order = 'B03'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-UTILITY-TIER',
  setting_type = 'startup',
  default_value = 2,
  allowed_values = {1, 2},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-UTILITY-TIER'}, {'mod-setting-name.PHI-EQ-UTILITY-TIER'}},
  order = 'B04'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ-ARMOR',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-ARMOR'}, {'mod-setting-name.PHI-EQ-ARMOR'}},
  order = 'B05'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ-SIZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-SIZE'}, {'mod-setting-name.PHI-EQ-SIZE'}},
  order = 'B06'
}, {
  type = 'bool-setting',
  name = 'PHI-MI',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI'}, {'mod-setting-name.PHI-MI'}},
  order = 'C00'
}, {
  type = 'int-setting',
  name = 'PHI-MI-LANDFILL',
  setting_type = 'startup',
  default_value = 20,
  minimum_value = 1,
  maximum_value = 100,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-LANDFILL'}, {'mod-setting-name.PHI-MI-LANDFILL'}},
  order = 'C01'
}, {
  type = 'int-setting',
  name = 'PHI-MI-EFFCY',
  setting_type = 'startup',
  default_value = 100,
  minimum_value = 10,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-EFFCY'}, {'mod-setting-name.PHI-MI-EFFCY'}},
  order = 'C02'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-NUCLEAR',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-NUCLEAR'}, {'mod-setting-name.PHI-MI-NUCLEAR'}},
  order = 'C03'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-PIPE'}, {'mod-setting-name.PHI-MI-PIPE'}},
  order = 'C04'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROBOT',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROBOT'}, {'mod-setting-name.PHI-MI-ROBOT'}},
  order = 'C05'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-ROBOT-ENERGY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROBOT-ENERGY'}, {'mod-setting-name.PHI-MI-ROBOT-ENERGY'}},
  order = 'C06'
}, {
  type = 'int-setting',
  name = 'PHI-MI-TRAIN',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-TRAIN'}, {'mod-setting-name.PHI-MI-TRAIN'}},
  order = 'C07'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE-EXTENT',
  setting_type = 'startup',
  default_value = 320,
  minimum_value = 80,
  maximum_value = 2560,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-PIPE-EXTENT'}, {'mod-setting-name.PHI-MI-PIPE-EXTENT'}},
  order = 'C08'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROCKET-CAPACITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 10000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROCKET-CAPACITY'}, {'mod-setting-name.PHI-MI-ROCKET-CAPACITY'}},
  order = 'C09'
}, {
  type = 'int-setting',
  name = 'PHI-MI-CARGO-WEIGHT',
  setting_type = 'startup',
  default_value = 100,
  minimum_value = 1,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-CARGO-WEIGHT'}, {'mod-setting-name.PHI-MI-CARGO-WEIGHT'}},
  order = 'C10'
}, {
  type = 'bool-setting',
  name = 'PHI-SA',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA'}, {'mod-setting-name.PHI-SA'}},
  order = 'D00'
}, {
  type = 'int-setting',
  name = 'PHI-SA-HEAT-RADIUS',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-HEAT-RADIUS'}, {'mod-setting-name.PHI-SA-HEAT-RADIUS'}},
  order = 'D01'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL'}, {'mod-setting-name.PHI-SA-SPOIL'}},
  order = 'D02'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL-FREEZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE'}},
  order = 'D03'
}, {
  type = 'int-setting',
  name = 'PHI-SA-SPOIL-FREEZE-RATIO',
  setting_type = 'startup',
  default_value = 50,
  minimum_value = 1,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE-RATIO'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE-RATIO'}},
  order = 'D04'
}, {
  type = 'int-setting',
  name = 'PHI-SA-QUALITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 100,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-QUALITY'}, {'mod-setting-name.PHI-SA-QUALITY'}},
  order = 'D05'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-MAX-QUALITY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-MAX-QUALITY'}, {'mod-setting-name.PHI-SA-MAX-QUALITY'}},
  order = 'D06'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-RESTRICTION',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-RESTRICTION'}, {'mod-setting-name.PHI-SA-RESTRICTION'}},
  order = 'D07'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-GENERIC',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-GENERIC'}, {'mod-setting-name.PHI-SA-GENERIC'}},
  order = 'D08'
}, {
  type = 'bool-setting',
  name = 'PHI-VP',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-VP'}, {'mod-setting-name.PHI-VP'}},
  order = 'E00'
},  {
  type = 'bool-setting',
  name = 'PHI-VP-MAIN',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-VP-MAIN'}, {'mod-setting-name.PHI-VP-MAIN'}},
  order = 'E01'
}, {
  type = 'bool-setting',
  name = 'PHI-CT',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT'}, {'mod-setting-name.PHI-CT'}},
  order = 'F00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT-TILE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-TILE'}, {'mod-setting-name.PHI-CT-TILE'}},
  order = 'F01'
}, {
  type = 'string-setting',
  name = 'PHI-CT-TILE-CHOICE',
  setting_type = 'startup',
  default_value = 'grass-1',
  allowed_values = {'concrete', 'deepwater', 'deepwater-green', 'dirt-1', 'dirt-2', 'dirt-3', 'dirt-4', 'dirt-5', 'dirt-6', 'dirt-7', 'dry-dirt', 'grass-1', 'grass-2', 'grass-3', 'grass-4', 'hazard-concrete-left', 'hazard-concrete-right', 'lab-dark-1', 'lab-dark-2', 'lab-white', 'landfill', 'out-of-map', 'red-desert-0', 'red-desert-1', 'red-desert-2', 'red-desert-3', 'refined-concrete', 'refined-hazard-concrete-left', 'refined-hazard-concrete-right', 'sand-1', 'sand-2', 'sand-3', 'stone-path', 'tutorial-grid', 'water', 'water-green', 'water-mud', 'water-shallow'},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-TILE-CHOICE'}, {'mod-setting-name.PHI-CT-TILE-CHOICE'}},
  order = 'F02'
}
})
