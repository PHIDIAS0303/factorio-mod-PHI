local function EN(source, name, subgroup, order, icon, stack_size, default_request_amount)
    local item = table.deepcopy(data.raw.item[source])
    item.name = name
    item.place_result = item.name
    item.icons = {{icon = item.icon, icon_mipmaps = 4, icon_size = 64}}
    item.subgroup = subgroup
    item.order = order
    item.icon = icon
    item.stack_size = stack_size
    item.default_request_amount = default_request_amount
    data:extend({item})
end

local items = {
    {source = "accumulator", name = "accumulator-mk2", subgroup = "energy", order = "e[accumulator]-b[accumulator-mk2]", icon = "__base__/graphics/icons/accumulator.png", stack_size = 50, default_request_amount = 50},
    {source = "accumulator", name = "accumulator-mk3", subgroup = "energy", order = "e[accumulator]-c[accumulator-mk3]", icon = "__base__/graphics/icons/accumulator.png", stack_size = 50, default_request_amount = 50},
    {source = "accumulator", name = "accumulator-mk4", subgroup = "energy", order = "e[accumulator]-d[accumulator-mk4]", icon = "__base__/graphics/icons/accumulator.png", stack_size = 50, default_request_amount = 50},
    {source = "accumulator", name = "accumulator-mk5", subgroup = "energy", order = "e[accumulator]-e[accumulator-mk5]", icon = "__base__/graphics/icons/accumulator.png", stack_size = 50, default_request_amount = 50},
    {source = "accumulator", name = "accumulator-mk6", subgroup = "energy", order = "e[accumulator]-f[accumulator-mk6]", icon = "__base__/graphics/icons/accumulator.png", stack_size = 50, default_request_amount = 50},
    {source = "accumulator", name = "accumulator-mk7", subgroup = "energy", order = "e[accumulator]-g[accumulator-mk7]", icon = "__base__/graphics/icons/accumulator.png", stack_size = 50, default_request_amount = 50},
    {source = "accumulator", name = "accumulator-mk8", subgroup = "energy", order = "e[accumulator]-h[accumulator-mk8]", icon = "__base__/graphics/icons/accumulator.png", stack_size = 50, default_request_amount = 50},
    {source = "solar-panel", name = "solar-panel-mk2", subgroup = "energy", order = "d[solar-panel]-b[solar-panel-mk2]", icon = "__base__/graphics/icons/solar-panel.png", stack_size = 50, default_request_amount = 50},
    {source = "solar-panel", name = "solar-panel-mk3", subgroup = "energy", order = "d[solar-panel]-c[solar-panel-mk3]", icon = "__base__/graphics/icons/solar-panel.png", stack_size = 50, default_request_amount = 50},
    {source = "solar-panel", name = "solar-panel-mk4", subgroup = "energy", order = "d[solar-panel]-d[solar-panel-mk4]", icon = "__base__/graphics/icons/solar-panel.png", stack_size = 50, default_request_amount = 50},
    {source = "solar-panel", name = "solar-panel-mk5", subgroup = "energy", order = "d[solar-panel]-e[solar-panel-mk5]", icon = "__base__/graphics/icons/solar-panel.png", stack_size = 50, default_request_amount = 50},
    {source = "solar-panel", name = "solar-panel-mk6", subgroup = "energy", order = "d[solar-panel]-f[solar-panel-mk6]", icon = "__base__/graphics/icons/solar-panel.png", stack_size = 50, default_request_amount = 50},
    {source = "solar-panel", name = "solar-panel-mk7", subgroup = "energy", order = "d[solar-panel]-g[solar-panel-mk7]", icon = "__base__/graphics/icons/solar-panel.png", stack_size = 50, default_request_amount = 50},
    {source = "solar-panel", name = "solar-panel-mk8", subgroup = "energy", order = "d[solar-panel]-h[solar-panel-mk8]", icon = "__base__/graphics/icons/solar-panel.png", stack_size = 50, default_request_amount = 50},
}

for _, item in pairs(items) do
    EN(item.source, item.name, item.subgroup, item.order, item.icon_name, item.stack_size, item.default_request_amount)
end