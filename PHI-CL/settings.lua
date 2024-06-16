data:extend({
  {
    type = 'bool-setting',
    name = 'PHI-EN',
    setting_type = 'startup',
    default_value = true,
    order = 'A1'
  },
  {
    type = 'bool-setting',
    name = 'PHI-MB',
    setting_type = 'startup',
    default_value = true,
    order = 'A2'
  },
  {
    type = 'bool-setting',
    name = 'PHI-WE',
    setting_type = 'startup',
    default_value = true,
    order = 'A3'
  },
  {
    type = 'bool-setting',
    name = 'PHI-EQ',
    setting_type = 'startup',
    default_value = true,
    order = 'A6'
  },
  {
    type = 'int-setting',
    name = 'PHI-XW-WATER',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {0, 1, 2, 3, 4, 5},
    order = 'A7'
  },
  {
    type = 'int-setting',
    name = 'PHI-EN-SOLAR-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'B1'
  }, {
    type = 'int-setting',
    name = 'PHI-EN-STEAM-TIER',
    setting_type = 'startup',
    default_value = 5,
    allowed_values = {1, 2, 3, 4, 5},
    order = 'B2'
  }, {
    type = 'int-setting',
    name = 'PHI-EN-NUCLEAR-TIER',
    setting_type = 'startup',
    default_value = 5,
    allowed_values = {1, 2, 3, 4, 5},
    order = 'B3'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-ASSEMBLING-TIER',
    setting_type = 'startup',
    default_value = 5,
    allowed_values = {3, 4, 5},
    order = 'C1'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-FURNACE-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C2'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-OIL-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C3'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-CENTRIFUGE-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C4'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-LAB-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C5'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-MINING-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C6'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-SE-ASSEMBLING-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C7'
  },
  {
    type = 'int-setting',
    name = 'PHI-WE-LASER-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'D1'
  }, {
    type = 'int-setting',
    name = 'PHI-WE-FLAME-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'D2'
  }, {
    type = 'int-setting',
    name = 'PHI-WE-GUN-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'D3'
  }, {
    type = 'int-setting',
    name = 'PHI-WE-RADAR-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'D4'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-SOLAR-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'G1'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-BATTERY-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'G2'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-REACTOR-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'G3'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-LASER-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'G4'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-ROBOPORT-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'G5'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-SHIELD-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'G6'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-NIGHT-TIER',
    setting_type = 'startup',
    default_value = 2,
    allowed_values = {1, 2},
    order = 'G7'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-EXO-TIER',
    setting_type = 'startup',
    default_value = 2,
    allowed_values = {1, 2},
    order = 'G8'
  }, {
    type = 'bool-setting',
    name = 'PHI-EQ-ARMOR',
    setting_type = 'startup',
    default_value = true,
    order = 'G9'
  }, {
    type = 'int-setting',
    name = 'PHI-XW-WATER',
    setting_type = 'startup',
    default_value = 5,
    allowed_values = {1, 2, 3, 4, 5},
    order = 'H1'
  }
}
)