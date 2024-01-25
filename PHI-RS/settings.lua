data:extend({{
    type = 'int-setting',
    name = 'PHI-RS-RECIPE-1',
    setting_type = 'startup',
    default_value = 4,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    order = 'A1'
  }, {
    type = 'int-setting',
    name = 'PHI-RS-RECIPE-2',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    order = 'A2'
  }, {
    type = 'bool-setting',
    name = 'PHI-RS-MODULE',
    setting_type = 'startup',
    default_value = true,
    order = 'A3'
  }, {
    type = 'int-setting',
    name = 'PHI-RS-RECIPE-DROF',
    setting_type = 'startup',
    default_value = 100,
    minimum_value = 50,
    maximum_value = 10000,
    order = 'A4'
  }})