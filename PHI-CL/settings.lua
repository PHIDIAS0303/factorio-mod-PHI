data:extend({
{
  type = 'bool-setting',
  name = 'PHI-EN',
  setting_type = 'startup',
  default_value = true,
  order = 'A00'
}, {
  type = 'int-setting',
  name = 'PHI-EN-SOLAR-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  order = 'A01'
}, {
  type = 'int-setting',
  name = 'PHI-EN-POWER-TIER',
  setting_type = 'startup',
  default_value = 5,
  allowed_values = {1, 2, 3, 4, 5},
  order = 'A02'
}, {
  type = 'bool-setting',
  name = 'PHI-MB',
  setting_type = 'startup',
  default_value = true,
  order = 'B00'
}, {
  type = 'int-setting',
  name = 'PHI-MB-MACHINE-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  order = 'B01'
}, {
  type = 'bool-setting',
  name = 'PHI-WE',
  setting_type = 'startup',
  default_value = true,
  order = 'C00'
}, {
  type = 'int-setting',
  name = 'PHI-WE-TURRET-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  order = 'C01'
}, {
  type = 'int-setting',
  name = 'PHI-WE-RADAR-TIER',
  setting_type = 'startup',
  default_value = 3,
  allowed_values = {1, 2, 3},
  order = 'C02'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ',
  setting_type = 'startup',
  default_value = true,
  order = 'D00'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-POWER-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  order = 'D01'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-DEFENSE-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  order = 'D02'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-TOOL-TIER',
  setting_type = 'startup',
  default_value = 8,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  order = 'D03'
}, {
  type = 'int-setting',
  name = 'PHI-EQ-UTILITY-TIER',
  setting_type = 'startup',
  default_value = 2,
  allowed_values = {1, 2},
  order = 'D04'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ-ARMOR',
  setting_type = 'startup',
  default_value = true,
  order = 'D05'
}, {
  type = 'bool-setting',
  name = 'PHI-EQ-SIZE',
  setting_type = 'startup',
  default_value = false,
  order = 'D06'
}, {
  type = 'bool-setting',
  name = 'PHI-MI',
  setting_type = 'startup',
  default_value = true,
  order = 'E00'
}, {
  type = 'int-setting',
  name = 'PHI-MI-LANDFILL',
  setting_type = 'startup',
  default_value = 50,
  minimum_value = 1,
  maximum_value = 100,
  order = 'E01'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-EFFCY',
  setting_type = 'startup',
  default_value = false,
  order = 'E02'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-NUCLEAR',
  setting_type = 'startup',
  default_value = true,
  order = 'E03'
}, {
  type = 'int-setting',
  name = 'PHI-MI-PIPE',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  order = 'E04'
}, {
  type = 'int-setting',
  name = 'PHI-MI-ROBOT',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  order = 'E05A'
}, {
  type = 'bool-setting',
  name = 'PHI-MI-ROBOT-ENERGY',
  setting_type = 'startup',
  default_value = false,
  order = 'E05B'
}, {
  type = 'int-setting',
  name = 'PHI-MI-TRAIN',
  setting_type = 'startup',
  default_value = 1,
  allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
  order = 'E06'
}, {
  type = 'bool-setting',
  name = 'PHI-SA',
  setting_type = 'startup',
  default_value = true,
  order = 'F00'
}, {
  type = 'int-setting',
  name = 'PHI-SA-ROCKET-CAPACITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 10000,
  order = 'F01'
}, {
  type = 'int-setting',
  name = 'PHI-SA-CARGO-WEIGHT',
  setting_type = 'startup',
  default_value = 100,
  minimum_value = 1,
  maximum_value = 1000,
  order = 'F02'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-SPOIL',
  setting_type = 'startup',
  default_value = false,
  order = 'F03'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-GENERIC',
  setting_type = 'startup',
  default_value = true,
  order = 'F04'
}, {
  type = 'int-setting',
  name = 'PHI-SA-QUALITY',
  setting_type = 'startup',
  default_value = 10,
  minimum_value = 1,
  maximum_value = 100,
  order = 'F05'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-NO-QUALITY',
  setting_type = 'startup',
  default_value = false,
  order = 'F06'
}, {
  type = 'bool-setting',
  name = 'PHI-SA-VANILLA',
  setting_type = 'startup',
  default_value = false,
  order = 'F07'
}, {
  type = 'bool-setting',
  name = 'PHI-CT',
  setting_type = 'startup',
  default_value = true,
  order = 'G00'
},  {
  type = 'bool-setting',
  name = 'PHI-CT-TOOL',
  setting_type = 'startup',
  default_value = false,
  order = 'G01'
}, {
  type = 'bool-setting',
  name = 'PHI-CT-UTILITY',
  setting_type = 'startup',
  default_value = true,
  order = 'G02'
}, {
  type = 'bool-setting',
  name = 'PHI-CT-HIDDEN',
  setting_type = 'startup',
  default_value = false,
  order = 'G03'
}
})
