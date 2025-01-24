data:extend({
{
  type = 'bool-setting',
  name = 'PHI-EN',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EN'}, {'mod-setting-name.PHI-EN'}},
  order = 'A00'
}, {
  type = 'int-setting',
  name = 'PHI-EN-SOLAR-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EN-SOLAR-TIER'}, {'mod-setting-name.PHI-EN-SOLAR-TIER'}},
  order = 'A01'
}, {
  type = 'int-setting',
  name = 'PHI-EN-SOLAR-RATIO',
  setting_type = 'startup',
  default_value = 4,
  minimum_value = 2,
  maximum_value = 16,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EN-SOLAR-RATIO'}, {'mod-setting-name.PHI-EN-SOLAR-RATIO'}},
  order = 'A02'
}, {
  type = 'int-setting',
  name = 'PHI-EN-POWER-TIER',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EN-POWER-TIER'}, {'mod-setting-name.PHI-EN-POWER-TIER'}},
  order = 'A03'
}, {
  type = 'bool-setting',
  name = 'PHI-MB',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB'}, {'mod-setting-name.PHI-MB'}},
  order = 'B00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-MACHINE-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MB-MACHINE-TIER'}, {'mod-setting-name.PHI-MB-MACHINE-TIER'}},
  order = 'B01'
}, {
  type = 'bool-setting',
  name = 'PHI-WE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-WE'}, {'mod-setting-name.PHI-WE'}},
  order = 'C00'
}, {
  type = 'int-setting',
  name = 'PHI-WE-TURRET-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-WE-TURRET-TIER'}, {'mod-setting-name.PHI-WE-TURRET-TIER'}},
  order = 'C01'
}, {
  type = 'int-setting',
  name = 'PHI-WE-RADAR-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-WE-RADAR-TIER'}, {'mod-setting-name.PHI-WE-RADAR-TIER'}},
  order = 'C02'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ'}, {'mod-setting-name.PHI-EQ'}},
  order = 'D00'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-POWER-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-POWER-TIER'}, {'mod-setting-name.PHI-EQ-POWER-TIER'}},
  order = 'D01'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-DEFENSE-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-DEFENSE-TIER'}, {'mod-setting-name.PHI-EQ-DEFENSE-TIER'}},
  order = 'D02'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-TOOL-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-TOOL-TIER'}, {'mod-setting-name.PHI-EQ-TOOL-TIER'}},
  order = 'D03'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-UTILITY-TIER',
  setting_type = 'startup',
  default_value = 2,
  allowed_values = {1, 2},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-UTILITY-TIER'}, {'mod-setting-name.PHI-EQ-UTILITY-TIER'}},
  order = 'D04'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ-ARMOR',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-ARMOR'}, {'mod-setting-name.PHI-EQ-ARMOR'}},
  order = 'D05'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ-SIZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-EQ-SIZE'}, {'mod-setting-name.PHI-EQ-SIZE'}},
  order = 'D06'
}, {
  type = 'bool-setting',
  name = 'PHI-MI',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI'}, {'mod-setting-name.PHI-MI'}},
  order = 'E00'
}, {
  type = 'int-setting',
  name = 'PHI-MI-LANDFILL',
  setting_type = 'startup',
  default_value = 20,
  minimum_value = 1,
  maximum_value = 100,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-LANDFILL'}, {'mod-setting-name.PHI-MI-LANDFILL'}},
  order = 'E01'
}, {
  type = 'int-setting',
  name = 'PHI-MI-EFFCY',
  setting_type = 'startup',
  default_value = 100,
  minimum_value = 10,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-EFFCY'}, {'mod-setting-name.PHI-MI-EFFCY'}},
  order = 'E02'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-NUCLEAR',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-NUCLEAR'}, {'mod-setting-name.PHI-MI-NUCLEAR'}},
  order = 'E03'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-PIPE'}, {'mod-setting-name.PHI-MI-PIPE'}},
  order = 'E04'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROBOT',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROBOT'}, {'mod-setting-name.PHI-MI-ROBOT'}},
  order = 'E05'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-ROBOT-ENERGY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-ROBOT-ENERGY'}, {'mod-setting-name.PHI-MI-ROBOT-ENERGY'}},
  order = 'E06'
}, {
  type = 'int-setting',
  name = 'PHI-MI-TRAIN',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-TRAIN'}, {'mod-setting-name.PHI-MI-TRAIN'}},
  order = 'E07'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE-EXTENT',
  setting_type = 'startup',
  default_value = 320,
  minimum_value = 80,
  maximum_value = 2560,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-MI-PIPE-EXTENT'}, {'mod-setting-name.PHI-MI-PIPE-EXTENT'}},
  order = 'E08'
}, {
  type = 'bool-setting',
  name = 'PHI-SA',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA'}, {'mod-setting-name.PHI-SA'}},
  order = 'F00'
}, {
  type = 'int-setting',
  name = 'PHI-SA-ROCKET-CAPACITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 10000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-ROCKET-CAPACITY'}, {'mod-setting-name.PHI-SA-ROCKET-CAPACITY'}},
  order = 'F01'
}, {
  type = 'int-setting',
  name = 'PHI-SA-CARGO-WEIGHT',
  setting_type = 'startup',
  default_value = 100,
  minimum_value = 1,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-CARGO-WEIGHT'}, {'mod-setting-name.PHI-SA-CARGO-WEIGHT'}},
  order = 'F02'
}, {
  type = 'int-setting',
  name = 'PHI-SA-HEAT-RADIUS',
  setting_type = 'startup',
  default_value = 1,
  minimum_value = 1,
  maximum_value = 7,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-HEAT-RADIUS'}, {'mod-setting-name.PHI-SA-HEAT-RADIUS'}},
  order = 'F03'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL'}, {'mod-setting-name.PHI-SA-SPOIL'}},
  order = 'F04'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL-FREEZE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE'}},
  order = 'F05'
}, {
  type = 'int-setting',
  name = 'PHI-SA-SPOIL-FREEZE-RATIO',
  setting_type = 'startup',
  default_value = 50,
  minimum_value = 1,
  maximum_value = 1000,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-SPOIL-FREEZE-RATIO'}, {'mod-setting-name.PHI-SA-SPOIL-FREEZE-RATIO'}},
  order = 'F06'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-RESTRICTION',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-RESTRICTION'}, {'mod-setting-name.PHI-SA-RESTRICTION'}},
  order = 'F07'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-GENERIC',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-GENERIC'}, {'mod-setting-name.PHI-SA-GENERIC'}},
  order = 'F08'
}, {
  type = 'int-setting',
  name = 'PHI-SA-QUALITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 100,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-QUALITY'}, {'mod-setting-name.PHI-SA-QUALITY'}},
  order = 'F09'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-NO-QUALITY',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-NO-QUALITY'}, {'mod-setting-name.PHI-SA-NO-QUALITY'}},
  order = 'F10'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-VANILLA',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-SA-VANILLA'}, {'mod-setting-name.PHI-SA-VANILLA'}},
  order = 'F11'
}, {
  type = 'bool-setting',
  name = 'PHI-CT',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT'}, {'mod-setting-name.PHI-CT'}},
  order = 'G00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT-TOOL',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-TOOL'}, {'mod-setting-name.PHI-CT-TOOL'}},
  order = 'G01'
}, {
  type = 'bool-setting',
  name = 'PHI-CT-UTILITY',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-UTILITY'}, {'mod-setting-name.PHI-CT-UTILITY'}},
  order = 'G02'
}, {
  type = 'bool-setting',
  name = 'PHI-CT-HIDDEN',
  setting_type = 'startup',
  default_value = true,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-HIDDEN'}, {'mod-setting-name.PHI-CT-HIDDEN'}},
  order = 'G03'
}, {
  type = 'bool-setting',
  name = 'PHI-CT-TILE',
  setting_type = 'startup',
  default_value = false,
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-TILE'}, {'mod-setting-name.PHI-CT-TILE'}},
  order = 'G04'
}, {
  type = 'string-setting',
  name = 'PHI-CT-TILE-CHOICE',
  setting_type = 'startup',
  default_value = 'grass-1',
  allowed_values = {'concrete', 'deepwater', 'deepwater-green', 'dirt-1', 'dirt-2', 'dirt-3', 'dirt-4', 'dirt-5', 'dirt-6', 'dirt-7', 'dry-dirt', 'grass-1', 'grass-2', 'grass-3', 'grass-4', 'hazard-concrete-left', 'hazard-concrete-right', 'lab-dark-1', 'lab-dark-2', 'lab-white', 'landfill', 'out-of-map', 'red-desert-0', 'red-desert-1', 'red-desert-2', 'red-desert-3', 'refined-concrete', 'refined-hazard-concrete-left', 'refined-hazard-concrete-right', 'sand-1', 'sand-2', 'sand-3', 'stone-path', 'tutorial-grid', 'water', 'water-green', 'water-mud', 'water-shallow'},
  localised_name = {'phi-cl.combine', {'mod-setting-name-prefix.PHI-CT-TILE-CHOICE'}, {'mod-setting-name.PHI-CT-TILE-CHOICE'}},
  order = 'G05'
}
})
