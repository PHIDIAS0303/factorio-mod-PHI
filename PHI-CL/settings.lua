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
    default_value = false,
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
    default_value = false,
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
    default_value = false,
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
    name = 'PHI-MI',
    setting_type = 'startup',
    default_value = false,
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
    default_value = false,
    order = 'E03'
  }, {
    type = 'bool-setting',
    name = 'PHI-MI-BOILER',
    setting_type = 'startup',
    default_value = false,
    order = 'E04'
  }, {
    type = 'bool-setting',
    name = 'PHI-MI-CHEST',
    setting_type = 'startup',
    default_value = false,
    order = 'E05'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT',
    setting_type = 'startup',
    default_value = false,
    order = 'J00'
  },  {
    type = 'bool-setting',
    name = 'PHI-CT-FLUID',
    setting_type = 'startup',
    default_value = true,
    order = 'J01'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-RADAR',
    setting_type = 'startup',
    default_value = true,
    order = 'J02'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-TRASH',
    setting_type = 'startup',
    default_value = true,
    order = 'J05'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-LINKED',
    setting_type = 'startup',
    default_value = true,
    order = 'J06'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-LOADER',
    setting_type = 'startup',
    default_value = true,
    order = 'J07'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-ENERGY',
    setting_type = 'startup',
    default_value = true,
    order = 'J08'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-TRAIN',
    setting_type = 'startup',
    default_value = true,
    order = 'J09'
  }
})
