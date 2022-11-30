-- Don't Match vanilla collision if bobpower is installed
if not mods["bobpower"] then
    data.raw["solar-panel"]["solar-panel"].collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
end

-- solar-panel                              sp1         sp2         sp3
-- max_health                               200         400         600
-- production                               60kW        240kW       960kW
--

local sp2 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
sp2.name = "solar-panel-mk2"
sp2.icon = "__base__/graphics/icons/solar-panel.png"
sp2.icon_size = 64
sp2.icon_mipmaps = 4
sp2.minable.result = sp2.name
sp2.max_health = 400
sp2.next_upgrade = "solar-panel-mk3"
sp2.production = "240kW"

sp2.picture.layers[1].filename = "__base__/graphics/entity/solar-panel/solar-panel.png"
sp2.picture.layers[1].hr_version.filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png"

local sp3 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
sp3.name = "solar-panel-mk3"
sp3.icon = "__base__/graphics/icons/solar-panel.png"
sp3.icon_size = 64
sp3.icon_mipmaps = 4
sp3.minable.result = sp3.name
sp3.max_health = 400
sp3.next_upgrade = "solar-panel-mk4"
sp3.production = "960kW"

sp3.picture.layers[1].filename = "__base__/graphics/entity/solar-panel/solar-panel.png"
sp3.picture.layers[1].hr_version.filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png"

local sp4 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
sp4.name = "solar-panel-mk4"
sp4.icon = "__base__/graphics/icons/solar-panel.png"
sp4.icon_size = 64
sp4.icon_mipmaps = 4
sp4.minable.result = sp4.name
sp4.max_health = 600
sp4.next_upgrade = "solar-panel-mk5"
sp4.production = "3840kW"

sp4.picture.layers[1].filename = "__base__/graphics/entity/solar-panel/solar-panel.png"
sp4.picture.layers[1].hr_version.filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png"

local sp5 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
sp5.name = "solar-panel-mk5"
sp5.icon = "__base__/graphics/icons/solar-panel.png"
sp5.icon_size = 64
sp5.icon_mipmaps = 4
sp5.minable.result = sp5.name
sp5.max_health = 800
sp5.next_upgrade = "solar-panel-mk6"
sp5.production = "15360kW"

sp5.picture.layers[1].filename = "__base__/graphics/entity/solar-panel/solar-panel.png"
sp5.picture.layers[1].hr_version.filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png"

local sp6 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
sp6.name = "solar-panel-mk6"
sp6.icon = "__base__/graphics/icons/solar-panel.png"
sp6.icon_size = 64
sp6.icon_mipmaps = 4
sp6.minable.result = sp6.name
sp6.max_health = 1000
sp6.next_upgrade = "solar-panel-mk7"
sp6.production = "61440kW"

sp6.picture.layers[1].filename = "__base__/graphics/entity/solar-panel/solar-panel.png"
sp6.picture.layers[1].hr_version.filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png"

local sp7 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
sp7.name = "solar-panel-mk7"
sp7.icon = "__base__/graphics/icons/solar-panel.png"
sp7.icon_size = 64
sp7.icon_mipmaps = 4
sp7.minable.result = sp7.name
sp7.max_health = 1200
sp7.next_upgrade = "solar-panel-mk8"
sp7.production = "245760kW"

sp7.picture.layers[1].filename = "__base__/graphics/entity/solar-panel/solar-panel.png"
sp7.picture.layers[1].hr_version.filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png"

local sp8 = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
sp8.name = "solar-panel-mk8"
sp8.icon = "__base__/graphics/icons/solar-panel.png"
sp8.icon_size = 64
sp8.icon_mipmaps = 4
sp8.minable.result = sp8.name
sp8.max_health = 1400
sp8.next_upgrade = nil
sp8.production = "983040kW"

sp8.picture.layers[1].filename = "__base__/graphics/entity/solar-panel/solar-panel.png"
sp8.picture.layers[1].hr_version.filename = "__base__/graphics/entity/solar-panel/hr-solar-panel.png"

-- accumulator                              a1         a2         a3
-- max_health                               150         300         450
-- energy_source.buffer_capacity            5MJ         20MJ        80MJ
-- energy_source.input_flow_limit           300kW       1200kW      4800kW
-- energy_source.output_flow_limit          300kW       1200kW      4800kW
--

local a2 = table.deepcopy(data.raw["accumulator"]["accumulator"])
a2.name = "accumulator-mk2"
a2.icon = "__base__/graphics/icons/accumulator.png"
a2.icon_size = 64
a2.icon_mipmaps = 4
a2.minable.result = a2.name
a2.max_health = 300
a2.energy_source.buffer_capacity = "20MJ"
a2.energy_source.input_flow_limit = "1200kW"
a2.energy_source.output_flow_limit = "1200kW"
a2.next_upgrade = "accumulator-mk3"

a2.picture.layers[1].filename = "__base__/graphics/entity/accumulator/accumulator.png"
a2.picture.layers[1].hr_version.filename = "__base__/graphics/entity/accumulator/hr-accumulator.png"
a2.charge_animation.layers[1].layers[1].filename = a2.picture.layers[1].filename
a2.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a2.charge_animation.layers[1].layers[1].hr_version.filename = a2.picture.layers[1].hr_version.filename
a2.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
a2.discharge_animation.layers[1].layers[1].filename = a2.picture.layers[1].filename
a2.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a2.discharge_animation.layers[1].layers[1].hr_version.filename = a2.picture.layers[1].hr_version.filename
a2.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}

local a3 = table.deepcopy(data.raw["accumulator"]["accumulator"])
a3.name = "accumulator-mk3"
a3.icon = "__base__/graphics/icons/accumulator.png"
a3.icon_size = 64
a3.icon_mipmaps = 4
a3.minable.result = a3.name
a3.max_health = 450
a3.energy_source.buffer_capacity = "80MJ"
a3.energy_source.input_flow_limit = "4800kW"
a3.energy_source.output_flow_limit = "4800kW"
a3.next_upgrade = "accumulator-mk4"

a3.picture.layers[1].filename = "__base__/graphics/entity/accumulator/accumulator.png"
a3.picture.layers[1].hr_version.filename = "__base__/graphics/entity/accumulator/hr-accumulator.png"
a3.charge_animation.layers[1].layers[1].filename = a3.picture.layers[1].filename
a3.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a3.charge_animation.layers[1].layers[1].hr_version.filename = a3.picture.layers[1].hr_version.filename
a3.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
a3.discharge_animation.layers[1].layers[1].filename = a3.picture.layers[1].filename
a3.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a3.discharge_animation.layers[1].layers[1].hr_version.filename = a3.picture.layers[1].hr_version.filename
a3.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}

local a4 = table.deepcopy(data.raw["accumulator"]["accumulator"])
a4.name = "accumulator-mk4"
a4.icon = "__base__/graphics/icons/accumulator.png"
a4.icon_size = 64
a4.icon_mipmaps = 4
a4.minable.result = a4.name
a4.max_health = 600
a4.energy_source.buffer_capacity = "320MJ"
a4.energy_source.input_flow_limit = "19200kW"
a4.energy_source.output_flow_limit = "19200kW"
a4.next_upgrade = "accumulator-mk5"

a4.picture.layers[1].filename = "__base__/graphics/entity/accumulator/accumulator.png"
a4.picture.layers[1].hr_version.filename = "__base__/graphics/entity/accumulator/hr-accumulator.png"
a4.charge_animation.layers[1].layers[1].filename = a4.picture.layers[1].filename
a4.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a4.charge_animation.layers[1].layers[1].hr_version.filename = a4.picture.layers[1].hr_version.filename
a4.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
a4.discharge_animation.layers[1].layers[1].filename = a4.picture.layers[1].filename
a4.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a4.discharge_animation.layers[1].layers[1].hr_version.filename = a4.picture.layers[1].hr_version.filename
a4.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}

local a5 = table.deepcopy(data.raw["accumulator"]["accumulator"])
a5.name = "accumulator-mk5"
a5.icon = "__base__/graphics/icons/accumulator.png"
a5.icon_size = 64
a5.icon_mipmaps = 4
a5.minable.result = a5.name
a5.max_health = 750
a5.energy_source.buffer_capacity = "1280MJ"
a5.energy_source.input_flow_limit = "76800kW"
a5.energy_source.output_flow_limit = "76800kW"
a5.next_upgrade = "accumulator-mk6"

a5.picture.layers[1].filename = "__base__/graphics/entity/accumulator/accumulator.png"
a5.picture.layers[1].hr_version.filename = "__base__/graphics/entity/accumulator/hr-accumulator.png"
a5.charge_animation.layers[1].layers[1].filename = a5.picture.layers[1].filename
a5.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a5.charge_animation.layers[1].layers[1].hr_version.filename = a5.picture.layers[1].hr_version.filename
a5.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
a5.discharge_animation.layers[1].layers[1].filename = a5.picture.layers[1].filename
a5.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a5.discharge_animation.layers[1].layers[1].hr_version.filename = a5.picture.layers[1].hr_version.filename
a5.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}

local a6 = table.deepcopy(data.raw["accumulator"]["accumulator"])
a6.name = "accumulator-mk6"
a6.icon = "__base__/graphics/icons/accumulator.png"
a6.icon_size = 64
a6.icon_mipmaps = 4
a6.minable.result = a6.name
a6.max_health = 900
a6.energy_source.buffer_capacity = "5120MJ"
a6.energy_source.input_flow_limit = "307200kW"
a6.energy_source.output_flow_limit = "307200kW"
a6.next_upgrade = "accumulator-mk7"

a6.picture.layers[1].filename = "__base__/graphics/entity/accumulator/accumulator.png"
a6.picture.layers[1].hr_version.filename = "__base__/graphics/entity/accumulator/hr-accumulator.png"
a6.charge_animation.layers[1].layers[1].filename = a6.picture.layers[1].filename
a6.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a6.charge_animation.layers[1].layers[1].hr_version.filename = a6.picture.layers[1].hr_version.filename
a6.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
a6.discharge_animation.layers[1].layers[1].filename = a6.picture.layers[1].filename
a6.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a6.discharge_animation.layers[1].layers[1].hr_version.filename = a6.picture.layers[1].hr_version.filename
a6.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}

local a7 = table.deepcopy(data.raw["accumulator"]["accumulator"])
a7.name = "accumulator-mk7"
a7.icon = "__base__/graphics/icons/accumulator.png"
a7.icon_size = 64
a7.icon_mipmaps = 4
a7.minable.result = a7.name
a7.max_health = 1050
a7.energy_source.buffer_capacity = "20480MJ"
a7.energy_source.input_flow_limit = "1228800kW"
a7.energy_source.output_flow_limit = "1228800kW"
a7.next_upgrade = "accumulator-mk8"

a7.picture.layers[1].filename = "__base__/graphics/entity/accumulator/accumulator.png"
a7.picture.layers[1].hr_version.filename = "__base__/graphics/entity/accumulator/hr-accumulator.png"
a7.charge_animation.layers[1].layers[1].filename = a7.picture.layers[1].filename
a7.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a7.charge_animation.layers[1].layers[1].hr_version.filename = a7.picture.layers[1].hr_version.filename
a7.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
a7.discharge_animation.layers[1].layers[1].filename = a7.picture.layers[1].filename
a7.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a7.discharge_animation.layers[1].layers[1].hr_version.filename = a7.picture.layers[1].hr_version.filename
a7.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}

local a8 = table.deepcopy(data.raw["accumulator"]["accumulator"])
a8.name = "accumulator-mk8"
a8.icon = "__base__/graphics/icons/accumulator.png"
a8.icon_size = 64
a8.icon_mipmaps = 4
a8.minable.result = a8.name
a8.max_health = 1200
a8.energy_source.buffer_capacity = "81920MJ"
a8.energy_source.input_flow_limit = "4915200kW"
a8.energy_source.output_flow_limit = "4915200kW"
a8.next_upgrade = nil

a8.picture.layers[1].filename = "__base__/graphics/entity/accumulator/accumulator.png"
a8.picture.layers[1].hr_version.filename = "__base__/graphics/entity/accumulator/hr-accumulator.png"
a8.charge_animation.layers[1].layers[1].filename = a8.picture.layers[1].filename
a8.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a8.charge_animation.layers[1].layers[1].hr_version.filename = a8.picture.layers[1].hr_version.filename
a8.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
a8.discharge_animation.layers[1].layers[1].filename = a8.picture.layers[1].filename
a8.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
a8.discharge_animation.layers[1].layers[1].hr_version.filename = a8.picture.layers[1].hr_version.filename
a8.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}

data:extend({sp2, sp3, sp4, sp5, sp6, sp7, sp8, a2, a3, a4, a5, a6, a7, a8})
