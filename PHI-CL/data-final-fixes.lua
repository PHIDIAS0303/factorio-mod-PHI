local items = require 'config'
local main = require 'main'
local file_stage = 3

data.raw['utility-constants'].default.zoom_to_world_effect_strength = 0
data.raw['utility-constants'].default.zoom_to_world_can_use_nightvision = true
data.raw['utility-constants'].default.train_inactivity_wait_condition_default = 60

data.raw['arithmetic-combinator']['arithmetic-combinator'].energy_source.usage_priority = 'primary-input'
data.raw['decider-combinator']['decider-combinator'].energy_source.usage_priority = 'primary-input'

data.raw['active-defense-equipment']['discharge-defense-equipment'].automatic = true

-- data.raw['utility-constants'].select_group_row_count

for _, t in pairs(data.raw['tree']) do
	t.collision_box = {{-0.05, -0.05}, {0.05, 0.05}}
end

for _,name in pairs({'furnace', 'lab', 'beacon'}) do
	local entities = {}

	for _, entity in pairs(data.raw[name]) do
		table.insert(entities, entity.name)
	end

	for _, entity in pairs(data.raw[name]) do
		entity.additional_pastable_entities = entities
	end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-ARTILLERY'].value then
	for _, t in pairs({data.raw['artillery-turret'], data.raw['artillery-wagon']}) do
		for _, v in pairs(t) do
			v.manual_range_modifier = 1
		end
	end

	-- data.raw['artillery-projectile']['artillery-projectile'].reveal_map = false
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TILE'].value then
	for _, tile in pairs (data.raw.tile) do
		tile.autoplace = nil
	end

	data.raw.tile[settings.startup['PHI-CT-TILE-CHOICE'].value].autoplace = {}

	for _, t in pairs({data.raw['simple-entity'], data.raw['optimized-decorative'], data.raw['fish']}) do
		for _, e in pairs(t) do
			e.autoplace = nil
		end
    end

	local autoplace_controls = {}

	for k, _ in pairs (data.raw['autoplace-control']) do
		autoplace_controls[k] = {
			size = 'none'
		}
	end

	data.raw['map-gen-presets']['default']['empty-world'] = {
		order = 'zz',
		basic_settings = {
			autoplace_controls = autoplace_controls,
			water = 'none',
			cliff_settings = {
				name = 'none',
				cliff_elevation_interval = 100,
				cliff_elevation_0 = 100,
				richness = 0
			}
		},
		advanced_settings = {
			pollution = {enabled = false},
			enemy_evolution = {enabled = false},
			enemy_expansion = {enabled = false}
		}
	}
end

if settings.startup['PHI-RS'].value then
    data.raw['assembling-machine']['electric-filter-furnace'].crafting_categories = {}

    for i=1, #data.raw['furnace']['electric-furnace'].crafting_categories do
        table.insert(data.raw['assembling-machine']['electric-filter-furnace'].crafting_categories, data.raw['furnace']['electric-furnace'].crafting_categories[i])
    end
end

for _, v in pairs(items['item']) do
    if (v.stage <= file_stage) and v.enabled and (v.max >= v.min) then
        v.category = 'item'

        for j=v.min, v.max, 1 do
            main.EEEC(v, j)
        end
    end
end
