local items = require 'config'

data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus = math.max(40, data.raw['cargo-bay']['cargo-bay'].inventory_size_bonus)
data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size = math.max(60, data.raw['rocket-silo']['rocket-silo'].to_be_inserted_to_rocket_inventory_size)
data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size = math.max(60, data.raw['rocket-silo-rocket']['rocket-silo-rocket'].inventory_size)
data.raw['cargo-wagon']['cargo-wagon'].inventory_size = math.max(80, data.raw['cargo-wagon']['cargo-wagon'].inventory_size)

data.raw.technology['foundation'].prerequisites = {'rail-support-foundations'}
data.raw.technology['foundation'].unit.count = 1000
data.raw.technology['foundation'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['rail-support-foundations'].prerequisites = {'elevated-rail', 'planet-discovery-fulgora'}
data.raw.technology['rail-support-foundations'].unit.count = 600
data.raw.technology['rail-support-foundations'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}}
data.raw.technology['elevated-rail'].prerequisites = {'concrete', 'railway'}
data.raw.technology['elevated-rail'].unit.count = 400
data.raw.technology['elevated-rail'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}

data.raw.recipe['foundation'].ingredients = {{type = 'item', name = 'landfill', amount = 1}, {type = 'item', name = 'refined-concrete', amount = 10}, {type = 'item', name = 'steel-plate', amount = 10}}
data.raw.recipe['foundation'].results = {{type = 'item', name = 'foundation', amount = 1}}
data.raw.recipe['atomic-bomb'].ingredients[3] = {type = 'item', name = 'uranium-235', amount = 30}
data.raw.recipe['cliff-explosives'].ingredients = {{type = 'item', name = 'explosives', amount = 10}, {type = 'item', name = 'grenade', amount = 1}, {type = 'item', name = 'barrel', amount = 1}}
data.raw.recipe['artillery-turret'].ingredients = {{type = 'item', name = 'steel-plate', amount = 60}, {type = 'item', name = 'concrete', amount = 60}, {type = 'item', name = 'iron-gear-wheel', amount = 40}, {type = 'item', name = 'advanced-circuit', amount = 20}}
data.raw.recipe['artillery-shell'].ingredients = {{type = 'item', name = 'explosive-cannon-shell', amount = 4}, {type = 'item', name = 'radar', amount = 1}, {type = 'item', name = 'explosives', amount = 8}}
data.raw.recipe['artillery-wagon'].ingredients = {{type = 'item', name = 'engine-unit', amount = 64}, {type = 'item', name = 'iron-gear-wheel', amount = 10}, {type = 'item', name = 'steel-plate', amount = 40}, {type = 'item', name = 'pipe', amount = 16}, {type = 'item', name = 'advanced-circuit', amount = 20}}

data.raw['ammo-turret']['railgun-turret'].starting_attack_speed = 1
data.raw['ammo-turret']['railgun-turret'].starting_attack_speed_secondary = 1
data.raw['ammo-turret']['railgun-turret'].starting_attack_speed_when_killed = 1
data.raw['ammo-turret']['railgun-turret'].preparing_speed = 1
data.raw['ammo-turret']['railgun-turret'].attacking_speed = 1
data.raw['ammo-turret']['railgun-turret'].ending_attack_speed = 1
data.raw['ammo-turret']['railgun-turret'].folding_speed = 1
data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit = tonumber(string.match(data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit, '[%d%.]+')) * 32 .. string.match(data.raw['ammo-turret']['railgun-turret'].energy_source.input_flow_limit, '%a+')

data.raw['roboport']['roboport'].energy_source.input_flow_limit = nil
data.raw['roboport']['roboport'].charging_energy = tostring(tonumber(string.match(data.raw['roboport']['roboport'].charging_energy, '[%d%.]+')) * 2) .. string.match(data.raw['roboport']['roboport'].charging_energy, '%a+')
data.raw['roboport']['roboport'].robot_slots_count = 10
data.raw['roboport']['roboport'].material_slots_count = 2
data.raw['roboport']['roboport'].charging_station_count = 8

data.raw.ammo['artillery-shell'].stack_size = data.raw['inserter']['stack-inserter'].max_belt_stack_size

data.raw.technology['cliff-explosives'].prerequisites = {'explosives', 'military-2'}
data.raw.technology['cliff-explosives'].unit = {count = 200, time = 15, ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}}}
data.raw.technology['cliff-explosives'].effects = {{type = 'unlock-recipe', recipe = 'cliff-explosives'}, {type = 'cliff-deconstruction-enabled', modifier = true}}
data.raw.technology['research-productivity'].prerequisites = {'cryogenic-science-pack'}
data.raw.technology['research-productivity'].unit.ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}, {'agricultural-science-pack', 1}, {'cryogenic-science-pack', 1}, {'electromagnetic-science-pack', 1}, {'metallurgic-science-pack', 1}}

table.insert(data.raw.technology['stronger-explosives-4'].effects, {type = 'ammo-damage', ammo_category = 'artillery-shell', modifier = 0.1})
table.insert(data.raw.technology['stronger-explosives-5'].effects, {type = 'ammo-damage', ammo_category = 'artillery-shell', modifier = 0.1})
table.insert(data.raw.technology['stronger-explosives-6'].effects, {type = 'ammo-damage', ammo_category = 'artillery-shell', modifier = 0.2})
table.insert(data.raw.technology['stronger-explosives-7'].effects, {type = 'ammo-damage', ammo_category = 'artillery-shell', modifier = 0.2})
table.insert(data.raw.technology['laser-weapons-damage-3'].effects, {type = 'ammo-damage', ammo_category = 'beam', modifier = 0.3})
table.insert(data.raw.technology['laser-weapons-damage-4'].effects, {type = 'ammo-damage', ammo_category = 'beam', modifier = 0.4})
table.insert(data.raw.technology['laser-shooting-speed-5'].effects, {type = 'gun-speed', ammo_category = 'electric', modifier = 0.2})
table.insert(data.raw.technology['laser-shooting-speed-6'].effects, {type = 'gun-speed', ammo_category = 'electric', modifier = 0.3})
table.insert(data.raw.technology['laser-shooting-speed-7'].effects, {type = 'gun-speed', ammo_category = 'electric', modifier = 0.5})

for i=5, 7 do
    table.insert(data.raw.technology['laser-weapons-damage-' .. i].effects, {type = 'ammo-damage', ammo_category = 'tesla', modifier = 0.7})
    table.insert(data.raw.technology['laser-weapons-damage-' .. i].effects, {type = 'ammo-damage', ammo_category = 'electric', modifier = 0.7})
    table.insert(data.raw.technology['laser-weapons-damage-' .. i].effects, {type = 'ammo-damage', ammo_category = 'beam', modifier = 0.6})
end

table.insert(data.raw.technology['physical-projectile-damage-6'].effects, {type = 'ammo-damage', ammo_category = 'railgun', modifier = 0.2})
table.insert(data.raw.technology['physical-projectile-damage-7'].effects, {type = 'ammo-damage', ammo_category = 'railgun', modifier = 0.4})
table.insert(data.raw.technology['weapon-shooting-speed-6'].effects, {type = 'gun-speed', ammo_category = 'railgun', modifier = 0.2})
table.insert(data.raw.technology['artillery-shell-speed-1'].effects, {type = 'gun-speed', ammo_category = 'railgun', modifier = 0.2})

for _, v in pairs({'artillery-shell-damage-1', 'railgun-damage-1', 'railgun-shooting-speed-1', 'electric-weapons-damage-1', 'electric-weapons-damage-2', 'electric-weapons-damage-3', 'electric-weapons-damage-4', 'promethium-science-pack'}) do
    if data.raw.technology[v] then
        data.raw.technology[v].hidden = true
        data.raw.technology[v].hidden_in_factoriopedia = true
        data.raw.technology[v].effects = nil
    end
end

data.raw.tool['promethium-science-pack'].hidden = true
data.raw.tool['promethium-science-pack'].hidden_in_factoriopedia = true

local item = table.deepcopy(data.raw['item']['depleted-uranium-fuel-cell'])
item.name = 'empty-train-battery'
item.icon = items['general']['graphics_location'] .. 'battery.png'
item.order = 'qa'
item.stack_size = 100
item.localised_name = {'name.empty-train-battery'}
item.localised_description = {'description.empty-train-battery'}
data:extend({item})

data:extend({{
    type = 'recipe',
    name = 'empty-train-battery',
    energy_required = 30,
    enabled = true,
    icon = items['general']['graphics_location'] .. 'battery.png',
    icon_size = 64,
    subgroup = 'intermediate-product',
    order = 'zc',
    allow_productivity = false,
    ingredients = {{type = 'item', name = 'battery', amount = 100}},
    results = {{type = 'item', name = 'empty-train-battery', amount = 1}},
    main_product = 'empty-train-battery',
    localised_name = {'name.empty-train-battery'},
    localised_description = {'description.empty-train-battery'}
}})

item = table.deepcopy(data.raw['item']['nuclear-fuel'])
item.name = 'charged-train-battery'
item.burnt_result = 'empty-train-battery'
item.fuel_value = '1GJ'
item.icon = items['general']['graphics_location'] .. 'battery.png'
item.stack_size = 10
item.localised_name = {'name.charged-train-battery'}
item.localised_description = {'description.charged-train-battery'}
data:extend({item})

data:extend({{
    type = 'recipe',
    name = 'charged-train-battery',
    energy_required = 60,
    enabled = true,
    icon = items['general']['graphics_location'] .. 'battery.png',
    icon_size = 64,
    subgroup = 'intermediate-product',
    order = 'zd',
    allow_productivity = false,
    ingredients = {{type = 'item', name = 'empty-train-battery', amount = 1}},
    results = {{type = 'item', name = 'charged-train-battery', probability = 0.995, amount = 1}, {type = 'item', name = 'battery', probability = 0.005, amount = 5}},
    main_product = 'charged-train-battery',
    localised_name = {'name.charged-train-battery'},
    localised_description = {'description.charged-train-battery'}
}})

for _, v in pairs(data.raw['locomotive']) do
    if v.energy_source then
        v.energy_source.burnt_inventory_size = (v.energy_source.burnt_inventory_size and math.max(v.energy_source.burnt_inventory_size, 1)) or 1
    end
end

for _, v in pairs({'coal', 'stone', 'iron-ore', 'copper-ore', 'uranium-ore'}) do
    if data.raw.item[v] then
        data.raw.item[v].stack_size = math.max(data.raw.item[v].stack_size, 100)
    end
end
