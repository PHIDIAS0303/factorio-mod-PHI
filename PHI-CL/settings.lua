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
    name = 'PHI-EN-STEAM-TIER',
    setting_type = 'startup',
    default_value = 5,
    allowed_values = {1, 2, 3, 4, 5},
    order = 'A02'
  }, {
    type = 'int-setting',
    name = 'PHI-EN-NUCLEAR-TIER',
    setting_type = 'startup',
    default_value = 5,
    allowed_values = {1, 2, 3, 4, 5},
    order = 'A03'
  }, {
    type = 'bool-setting',
    name = 'PHI-MB',
    setting_type = 'startup',
    default_value = false,
    order = 'B00'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-ASSEMBLING-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'B01'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-FURNACE-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'B02'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-OIL-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'B03'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-CENTRIFUGE-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'B04'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-LAB-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'B05'
  }, {
    type = 'int-setting',
    name = 'PHI-MB-MINING-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'B06'
  }, {
    type = 'bool-setting',
    name = 'PHI-WE',
    setting_type = 'startup',
    default_value = false,
    order = 'C00'
  }, {
    type = 'int-setting',
    name = 'PHI-WE-LASER-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C01'
  }, {
    type = 'int-setting',
    name = 'PHI-WE-FLAME-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C02'
  }, {
    type = 'int-setting',
    name = 'PHI-WE-GUN-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C03'
  }, {
    type = 'int-setting',
    name = 'PHI-WE-RADAR-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'C04'
  }, {
    type = 'bool-setting',
    name = 'PHI-EQ',
    setting_type = 'startup',
    default_value = false,
    order = 'D00'
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
    name = 'PHI-XC',
    setting_type = 'startup',
    default_value = false,
    order = 'H00'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT',
    setting_type = 'startup',
    default_value = false,
    order = 'J00'
  },  {
    type = 'bool-setting',
    name = 'PHI-CT-OIL',
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
    name = 'PHI-CT-TILE',
    setting_type = 'startup',
    default_value = true,
    order = 'J03'
  }, {
    type = 'string-setting',
    name = 'PHI-CT-TILE-CHOICE',
    setting_type = 'startup',
    default_value = 'grass-1',
    allowed_values = {'concrete', 'deepwater', 'deepwater-green', 'dirt-1', 'dirt-2', 'dirt-3', 'dirt-4', 'dirt-5', 'dirt-6', 'dirt-7', 'dry-dirt', 'grass-1', 'grass-2', 'grass-3', 'grass-4', 'hazard-concrete-left', 'hazard-concrete-right', 'lab-dark-1', 'lab-dark-2', 'lab-white', 'landfill', 'out-of-map', 'red-desert-0', 'red-desert-1', 'red-desert-2', 'red-desert-3', 'refined-concrete', 'refined-hazard-concrete-left', 'refined-hazard-concrete-right', 'sand-1', 'sand-2', 'sand-3', 'stone-path', 'tutorial-grid', 'water', 'water-green', 'water-mud', 'water-shallow'},
    order = 'J04'
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
    order = 'J07'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-LOADER',
    setting_type = 'startup',
    default_value = true,
    order = 'J08'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-ENERGY',
    setting_type = 'startup',
    default_value = true,
    order = 'J10'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-TRAIN',
    setting_type = 'startup',
    default_value = true,
    order = 'J12'
  }
})
