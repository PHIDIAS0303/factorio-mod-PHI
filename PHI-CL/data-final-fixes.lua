local items = require 'config'
local main = require 'main'
local file_stage = 3

data.raw['utility-constants'].default.zoom_to_world_effect_strength = 0
data.raw['utility-constants'].default.zoom_to_world_can_use_nightvision = true

for _,name in pairs({'furnace', 'lab', 'beacon'}) do
	local entities = {}

	for _, entity in pairs(data.raw[name]) do
		table.insert(entities, entity.name)
	end

	for _, entity in pairs(data.raw[name]) do
		entity.additional_pastable_entities = entities
	end
end

if settings.startup['PHI-CT-TILE'].value then
	for _, tile in pairs (data.raw.tile) do
		tile.autoplace = nil
	end

	data.raw.tile[settings.startup['PHI-CT-TILE-CHOICE'].value].autoplace = {}

	for _, simple in pairs (data.raw['simple-entity']) do
        simple.autoplace = nil
    end

	for _, decor in pairs (data.raw['optimized-decorative']) do
        decor.autoplace = nil
    end

	for _, fish in pairs (data.raw['fish']) do
        fish.autoplace = nil
    end

	local autoplace_controls = {}

	for key, _ in pairs (data.raw['autoplace-control']) do
		autoplace_controls[key] = {
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
			pollution = {
				enabled = false
			},
			enemy_evolution = {
				enabled=false,
			},
			enemy_expansion = {
				enabled=false
			}
		}
	}
end
