-- local items = require 'config'
-- local main = require 'main'
-- local file_stage = 3

data.raw['utility-constants'].default.zoom_to_world_effect_strength = 0
data.raw['utility-constants'].default.zoom_to_world_can_use_nightvision = true

data.raw['arithmetic-combinator']['arithmetic-combinator'].energy_source.usage_priority = 'primary-input'
data.raw['decider-combinator']['decider-combinator'].energy_source.usage_priority = 'primary-input'

data.raw['active-defense-equipment']['discharge-defense-equipment'].automatic = true

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
	for _, v in pairs(data.raw['artillery-turret']) do
		v.manual_range_modifier = 1
	end

	for _, v in pairs(data.raw['artillery-wagon']) do
		v.manual_range_modifier = 1
	end
end

if settings.startup['PHI-MI'].value and settings.startup['PHI-MI-PIPE'].value then
    for k, _ in pairs(data.raw) do
        if data.raw[k] then
            if data.raw[k].fluid_box then
                if data.raw[k].fluid_box.height < settings.startup['PHI-MI-PIPE'].value then
                    data.raw[k].fluid_box.height = settings.startup['PHI-MI-PIPE'].value
                end

                if data.raw[k].fluid_box.base_level < (1 + settings.startup['PHI-MI-PIPE'].value) then
                    data.raw[k].fluid_box.base_level = 1 + settings.startup['PHI-MI-PIPE'].value
                end
            end

            if data.raw[k].output_fluid_box then
                if data.raw[k].output_fluid_box.height < settings.startup['PHI-MI-PIPE'].value then
                    data.raw[k].output_fluid_box.height = settings.startup['PHI-MI-PIPE'].value
                end

                if data.raw[k].output_fluid_box.base_level > (-1 - settings.startup['PHI-MI-PIPE'].value) then
                    data.raw[k].output_fluid_box.base_level = (-1 - settings.startup['PHI-MI-PIPE'].value)
                end
            end

            if data.raw[k].fluid_boxes then
                for k1, _ in pairs(data.raw[k].fluid_boxes) do
                    if data.raw[k].fluid_boxes[k1] ~= true and data.raw[k].fluid_boxes[k1] ~= false then
                        if data.raw[k].fluid_boxes[k1].production_type then
                            data.raw[k].fluid_boxes[k1].height = settings.startup['PHI-MI-PIPE'].value

                            if data.raw[k].fluid_boxes[k1].base_level then
                                data.raw[k].fluid_boxes[k1].base_level = 1 + settings.startup['PHI-MI-PIPE'].value
                            end
                        end
                    end
                end
            end
        end
    end
end

if settings.startup['PHI-CT'].value and settings.startup['PHI-CT-TILE'].value then
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
