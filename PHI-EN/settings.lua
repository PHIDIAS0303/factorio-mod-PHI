data:extend({{
    type = 'bool-setting',
    name = 'PHI-EN-SOLAR',
    setting_type = 'startup',
    default_value = true,
    order = 'A1'
  }, {
    type = 'bool-setting',
    name = 'PHI-EN-STEAM',
    setting_type = 'startup',
    default_value = true,
    order = 'A2'
  }, {
    type = 'bool-setting',
    name = 'PHI-EN-NUCLEAR',
    setting_type = 'startup',
    default_value = true,
    order = 'A3'
  }, {
    type = 'int-setting',
    name = 'PHI-EN-SOLAR-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'B1'
  }, {
    type = 'int-setting',
    name = 'PHI-EN-STEAM-TIER',
    setting_type = 'startup',
    default_value = 5,
    allowed_values = {2, 3, 4, 5},
    order = 'B2'
  }, {
    type = 'int-setting',
    name = 'PHI-EN-NUCLEAR-TIER',
    setting_type = 'startup',
    default_value = 5,
    allowed_values = {2, 3, 4, 5},
    order = 'B3'
  }})