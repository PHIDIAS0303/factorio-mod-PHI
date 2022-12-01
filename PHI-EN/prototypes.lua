local alpha_order = {"b", "c", "d", "e", "f", "g", "h", "i"}
local base_battery_energy = 5
local base_battery_flow = 300
local base_solar_energy = 60
local graphics_location = "__PHI-EN__/graphics/"

local function EE(source, tier)
    local item = table.deepcopy(data.raw[source][source])
    item.name = source .. "-mk" .. tier
    item.place_result = source .. "-mk" .. tier
    item.minable.result = source .. "-mk" .. tier
    item.max_health = 1000
    item.subgroup = "energy"
    item.stack_size = 50
    item.default_request_amount = 50
    item.picture.layers[1].filename = graphics_location .. source .. "-e.png"
    item.picture.layers[1].hr_version.filename = graphics_location .. source .."-eh.png"
    item.icon = graphics_location .. source .. "-i.png"
    item.icon_size = 64
    item.icon_mipmaps = 4

    if (source == "accumulator")
    then
        item.order = "d[" .. source .. "]-b" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
        item.energy_source.buffer_capacity = (base_battery_energy * 4 ^ (tier - 1)) .. "MJ"
        item.energy_source.input_flow_limit = (base_battery_flow * (4 ^ (tier - 1))) .. "kW"
        item.energy_source.output_flow_limit = (base_battery_flow * (4 ^ (tier - 1))) .. "kW"
        item.charge_animation.layers[1].layers[1].filename = item.picture.layers[1].filename
        item.charge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
        item.charge_animation.layers[1].layers[1].hr_version.filename = item.picture.layers[1].hr_version.filename
        item.charge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
        item.discharge_animation.layers[1].layers[1].filename = item.picture.layers[1].filename
        item.discharge_animation.layers[1].layers[1].tint = {r = 1, g = 1, b = 1, a = 1}
        item.discharge_animation.layers[1].layers[1].hr_version.filename = item.picture.layers[1].hr_version.filename
        item.discharge_animation.layers[1].layers[1].hr_version.tint = {r = 1, g = 1, b = 1, a = 1}
    else
        item.order = "e[" .. source .. "]-b" .. alpha_order[tier - 1] .. "[" .. source .. "-mk" .. tier .. "]"
        item.production = (base_solar_energy * (4 ^ (tier - 1))) .. "kW"
    end
    
    if (tier <= 7)
    then
        item.next_upgrade = source .. "-mk" .. (tier + 1)
    end
    
    data:extend({item})
end

local function ER(source, tier)
    na = source

    if (tier >= 3)
    then
        na = na .. "-mk" .. (tier - 1)
    end

    data:extend({{
        type = "recipe",
        name = source .. "-mk" .. tier,
        energy_required = 5,
        enabled = "false",
        ingredients = {{na, 4}},
        result = source .. "-mk" .. tier,
    }})
end

items = {"accumulator", "solar-panel"}

for i=1, 2, 1 do
    for j=2, 8, 1 do
        EE(items[i], j)
        -- ER(items[i], j)
    end
end

data:extend(
{
  {
    type = "recipe",
    name = "solar-panel-mk2",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"solar-panel", 4}
    },
    result = "solar-panel-mk2"
  },
  {
    type = "recipe",
    name = "solar-panel-mk3",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"solar-panel-mk2", 4}
    },
    result = "solar-panel-mk3"
  },
  {
    type = "recipe",
    name = "solar-panel-mk4",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"solar-panel-mk3", 4}
    },
    result = "solar-panel-mk4"
  },
  {
    type = "recipe",
    name = "solar-panel-mk5",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"solar-panel-mk4", 4}
    },
    result = "solar-panel-mk5"
  },
  {
    type = "recipe",
    name = "solar-panel-mk6",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"solar-panel-mk5", 4}
    },
    result = "solar-panel-mk6"
  },
  {
    type = "recipe",
    name = "solar-panel-mk7",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"solar-panel-mk6", 4}
    },
    result = "solar-panel-mk7"
  },
  {
    type = "recipe",
    name = "solar-panel-mk8",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"solar-panel-mk7", 4}
    },
    result = "solar-panel-mk8"
  },
  {
    type = "recipe",
    name = "accumulator-mk2",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"accumulator", 4}
    },
    result = "accumulator-mk2"
  },
  {
    type = "recipe",
    name = "accumulator-mk3",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"accumulator-mk2", 4}
    },
    result = "accumulator-mk3"
  },
  {
    type = "recipe",
    name = "accumulator-mk4",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"accumulator-mk3", 4}
    },
    result = "accumulator-mk4"
  },
  {
    type = "recipe",
    name = "accumulator-mk5",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"accumulator-mk4", 4}
    },
    result = "accumulator-mk5"
  },
  {
    type = "recipe",
    name = "accumulator-mk6",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"accumulator-mk5", 4}
    },
    result = "accumulator-mk6"
  },
  {
    type = "recipe",
    name = "accumulator-mk7",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"accumulator-mk6", 4}
    },
    result = "accumulator-mk7"
  },
  {
    type = "recipe",
    name = "accumulator-mk8",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {"accumulator-mk7", 4}
    },
    result = "accumulator-mk8"
  }
})