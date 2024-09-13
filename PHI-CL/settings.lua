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
    default_value = 5,
    allowed_values = {3, 4, 5},
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
    type = 'int-setting',
    name = 'PHI-MB-SE-ASSEMBLING-TIER',
    setting_type = 'startup',
    default_value = 3,
    allowed_values = {1, 2, 3},
    order = 'B07'
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
    type = 'int-setting',
    name = 'PHI-EQ-SOLAR-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'D01'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-BATTERY-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'D02'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-REACTOR-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'D03'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-LASER-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'D04'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-ROBOPORT-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'D05'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-SHIELD-TIER',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {2, 3, 4, 5, 6, 7, 8},
    order = 'D06'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-NIGHT-TIER',
    setting_type = 'startup',
    default_value = 2,
    allowed_values = {1, 2},
    order = 'D07'
  }, {
    type = 'int-setting',
    name = 'PHI-EQ-EXO-TIER',
    setting_type = 'startup',
    default_value = 2,
    allowed_values = {1, 2},
    order = 'D08'
  }, {
    type = 'bool-setting',
    name = 'PHI-EQ-ARMOR',
    setting_type = 'startup',
    default_value = true,
    order = 'D09'
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
    default_value = 20,
    minimum_value = 1,
    maximum_value = 40,
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
    type = 'int-setting',
    name = 'PHI-MI-REPAIR',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'E06'
  }, {
    type = 'int-setting',
    name = 'PHI-MI-PIPE',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'E07'
  }, {
    type = 'int-setting',
    name = 'PHI-MI-ROBOT',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'E08'
  }, {
    type = 'int-setting',
    name = 'PHI-MI-TRAIN',
    setting_type = 'startup',
    default_value = 1,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8},
    order = 'E09'
  }, {
    type = 'bool-setting',
    name = 'PHI-RS',
    setting_type = 'startup',
    default_value = false,
    order = 'F00'
  }, {
    type = 'int-setting',
    name = 'PHI-RS-RECIPE-1',
    setting_type = 'startup',
    default_value = 4,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    order = 'F01'
  }, {
    type = 'int-setting',
    name = 'PHI-RS-RECIPE-2',
    setting_type = 'startup',
    default_value = 8,
    allowed_values = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    order = 'F02'
  }, {
    type = 'bool-setting',
    name = 'PHI-RS-MODULE',
    setting_type = 'startup',
    default_value = true,
    order = 'F03'
  }, {
    type = 'int-setting',
    name = 'PHI-RS-RECIPE-DROF',
    setting_type = 'startup',
    default_value = 1,
    minimum_value = 1,
    maximum_value = 100,
    order = 'F04'
  }, {
    type = 'int-setting',
    name = 'PHI-RS-RECIPE-MINROM',
    setting_type = 'startup',
    default_value = 2,
    minimum_value = 1,
    maximum_value = 100,
    order = 'F05'
  }, {
    type = 'int-setting',
    name = 'PHI-RS-RECIPE-MAXROM',
    setting_type = 'startup',
    default_value = 100,
    minimum_value = 1,
    maximum_value = 100,
    order = 'F06'
  }, {
    type = 'int-setting',
    name = 'PHI-XW-WATER',
    setting_type = 'startup',
    default_value = 0,
    allowed_values = {0, 1, 2, 3, 4, 5},
    order = 'G00'
  }, {
    type = 'bool-setting',
    name = 'PHI-XC',
    setting_type = 'startup',
    default_value = false,
    order = 'H00'
  }, {
    type = 'bool-setting',
    name = 'PHI-PB',
    setting_type = 'startup',
    default_value = false,
    order = 'I00'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-CMMS',
    setting_type = 'startup',
    default_value = 2,
    minimum_value = 0,
    maximum_value = 4,
    order = 'IA01'
  }, {
    type = 'double-setting',
    name = 'PHI-PB-CRS',
    setting_type = 'startup',
    default_value = 1.5,
    minimum_value = 0,
    maximum_value = 5,
    order = 'IA02'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-CCS',
    setting_type = 'startup',
    default_value = 5,
    minimum_value = 0,
    maximum_value = 10,
    order = 'IA03'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-CISB',
    setting_type = 'startup',
    default_value = 100,
    minimum_value = 0,
    maximum_value = 120,
    order = 'IA04'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-CHB',
    setting_type = 'startup',
    default_value = 200,
    minimum_value = 0,
    maximum_value = 400,
    order = 'IA05'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-CRDB',
    setting_type = 'startup',
    default_value = 10,
    minimum_value = 0,
    maximum_value = 20,
    order = 'IA06'
  }, 
    --[[ {
    type = 'int-setting',
    name = 'PHI-PB-FMMS',
    setting_type = 'startup',
    default_value = 2,
    minimum_value = 0,
    maximum_value = 10,
    order = 'IB01'
  }, {
    type = 'double-setting',
    name = 'PHI-PB-FRS',
    setting_type = 'startup',
    default_value = 1.5,
    minimum_value = 0,
    maximum_value = 10,
    order = 'IB02'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-FCS',
    setting_type = 'startup',
    default_value = 5,
    minimum_value = 0,
    maximum_value = 20,
    order = 'IB03'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-FISB',
    setting_type = 'startup',
    default_value = 100,
    minimum_value = 0,
    maximum_value = 200,
    order = 'IB04'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-FHB',
    setting_type = 'startup',
    default_value = 200,
    minimum_value = 0,
    maximum_value = 1000,
    order = 'IB05'
  }, {
    type = 'double-setting',
    name = 'PHI-PB-FWRSM',
    setting_type = 'startup',
    default_value = 1.3,
    minimum_value = 0,
    maximum_value = 20,
    order = 'IB06'
  }, {
    type = 'double-setting',
    name = 'PHI-PB-FWRBM',
    setting_type = 'startup',
    default_value = 1,
    minimum_value = 0,
    maximum_value = 20,
    order = 'IB07'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-FWRSB',
    setting_type = 'startup',
    default_value = 1,
    minimum_value = 0,
    maximum_value = 40,
    order = 'IB08'
  }, {
    type = 'int-setting',
    name = 'PHI-PB-FFRLM',
    setting_type = 'startup',
    default_value = 1,
    minimum_value = 0,
    maximum_value = 20,
    order = 'IB09'
  },
  ]]
  {
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
    name = 'PHI-CT-TRASH',
    setting_type = 'startup',
    default_value = true,
    order = 'J03'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-MINER',
    setting_type = 'startup',
    default_value = true,
    order = 'J04'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-LINKED',
    setting_type = 'startup',
    default_value = true,
    order = 'J05'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-LOADER',
    setting_type = 'startup',
    default_value = true,
    order = 'J06'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-RECIPE',
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
    name = 'PHI-CT-LAMP',
    setting_type = 'startup',
    default_value = true,
    order = 'J09'
  }, {
    type = 'bool-setting',
    name = 'PHI-CT-TILE',
    setting_type = 'startup',
    default_value = true,
    order = 'J10'
  }, {
    type = 'string-setting',
    name = 'PHI-CT-TILE-CHOICE',
    setting_type = 'startup',
    default_value = 'grass-1',
    allowed_values = {'concrete', 'deepwater', 'deepwater-green', 'dirt-1', 'dirt-2', 'dirt-3', 'dirt-4', 'dirt-5', 'dirt-6', 'dirt-7', 'dry-dirt', 'grass-1', 'grass-2', 'grass-3', 'grass-4', 'hazard-concrete-left', 'hazard-concrete-right', 'lab-dark-1', 'lab-dark-2', 'lab-white', 'landfill', 'out-of-map', 'red-desert-0', 'red-desert-1', 'red-desert-2', 'red-desert-3', 'refined-concrete', 'refined-hazard-concrete-left', 'refined-hazard-concrete-right', 'sand-1', 'sand-2', 'sand-3', 'stone-path', 'tutorial-grid', 'water', 'water-green', 'water-mud', 'water-shallow'},
    order = 'J11'
  }
})
