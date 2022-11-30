local function EQ(source, name, order, icon, placed_as_equipment_result)
    data:extend({
        {
            type = "item",
            name = name,
            icon = icon,
            icon_size = 64,
            icon_mipmaps = 4,
            placed_as_equipment_result = placed_as_equipment_result,
            subgroup = "equipment",
            order = order,
            stack_size = 20
        }
    })
end

local equipments = {
    {source = "solar-panel-equipment", name = "solar-panel-equipment-mk2", order = "a[energy-source]-ab[solar-panel-mk2]", placed_as_equipment_result = "solar-panel-equipment-mk2", icon_name = "__base__/graphics/icons/solar-panel-equipment.png"},
    {source = "solar-panel-equipment", name = "solar-panel-equipment-mk3", order = "a[energy-source]-ac[solar-panel-mk3]", placed_as_equipment_result = "solar-panel-equipment-mk3", icon_name = "__base__/graphics/icons/solar-panel-equipment.png"},
    {source = "solar-panel-equipment", name = "solar-panel-equipment-mk4", order = "a[energy-source]-ad[solar-panel-mk4]", placed_as_equipment_result = "solar-panel-equipment-mk4", icon_name = "__base__/graphics/icons/solar-panel-equipment.png"},
    {source = "solar-panel-equipment", name = "solar-panel-equipment-mk5", order = "a[energy-source]-ae[solar-panel-mk5]", placed_as_equipment_result = "solar-panel-equipment-mk5", icon_name = "__base__/graphics/icons/solar-panel-equipment.png"},
    {source = "solar-panel-equipment", name = "solar-panel-equipment-mk6", order = "a[energy-source]-af[solar-panel-mk6]", placed_as_equipment_result = "solar-panel-equipment-mk6", icon_name = "__base__/graphics/icons/solar-panel-equipment.png"},
    {source = "solar-panel-equipment", name = "solar-panel-equipment-mk7", order = "a[energy-source]-ag[solar-panel-mk7]", placed_as_equipment_result = "solar-panel-equipment-mk7", icon_name = "__base__/graphics/icons/solar-panel-equipment.png"},
    {source = "solar-panel-equipment", name = "solar-panel-equipment-mk8", order = "a[energy-source]-ah[solar-panel-mk8]", placed_as_equipment_result = "solar-panel-equipment-mk8", icon_name = "__base__/graphics/icons/solar-panel-equipment.png"},
    
    {source = "battery-mk2-equipment", name = "battery-mk3-equipment", order = "b[battery]-bc[battery-equipment-mk3]", placed_as_equipment_result = "battery-mk3-equipment", icon_name = "__base__/graphics/icons/battery-mk2-equipment.png"},
    {source = "battery-mk2-equipment", name = "battery-mk4-equipment", order = "b[battery]-bd[battery-equipment-mk4]", placed_as_equipment_result = "battery-mk4-equipment", icon_name = "__base__/graphics/icons/battery-mk2-equipment.png"},
    {source = "battery-mk2-equipment", name = "battery-mk5-equipment", order = "b[battery]-be[battery-equipment-mk5]", placed_as_equipment_result = "battery-mk5-equipment", icon_name = "__base__/graphics/icons/battery-mk2-equipment.png"},
    {source = "battery-mk2-equipment", name = "battery-mk6-equipment", order = "b[battery]-bf[battery-equipment-mk6]", placed_as_equipment_result = "battery-mk6-equipment", icon_name = "__base__/graphics/icons/battery-mk2-equipment.png"},
    {source = "battery-mk2-equipment", name = "battery-mk7-equipment", order = "b[battery]-bg[battery-equipment-mk7]", placed_as_equipment_result = "battery-mk7-equipment", icon_name = "__base__/graphics/icons/battery-mk2-equipment.png"},
    {source = "battery-mk2-equipment", name = "battery-mk8-equipment", order = "b[battery]-bh[battery-equipment-mk8]", placed_as_equipment_result = "battery-mk8-equipment", icon_name = "__base__/graphics/icons/battery-mk2-equipment.png"},
    
    {source = "generator-equipment", name = "burner-generator-equipment", order = "a[energy-source]-b[burner-generator-equipment]", placed_as_equipment_result = "burner-generator-equipment", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "burner-generator-equipment-mk2", order = "a[energy-source]-bb[burner-generator-equipment]", placed_as_equipment_result = "burner-generator-equipment-mk2", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "burner-generator-equipment-mk3", order = "a[energy-source]-bc[burner-generator-equipment]", placed_as_equipment_result = "burner-generator-equipment-mk3", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    
    {source = "generator-equipment", name = "nuclear-generator-equipment", order = "a[energy-source]-c[nuclear-generator-equipment]", placed_as_equipment_result = "nuclear-generator-equipment", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "nuclear-generator-equipment-mk2", order = "a[energy-source]-cb[nuclear-generator-equipment]", placed_as_equipment_result = "nuclear-generator-equipment-mk2", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    
    {source = "generator-equipment", name = "fusion-reactor-equipment-mk2", order = "a[energy-source]-db[fusion-reactor]", placed_as_equipment_result = "fusion-reactor-equipment-mk2", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "fusion-reactor-equipment-mk3", order = "a[energy-source]-dc[fusion-reactor]", placed_as_equipment_result = "fusion-reactor-equipment-mk3", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "fusion-reactor-equipment-mk4", order = "a[energy-source]-dd[fusion-reactor]", placed_as_equipment_result = "fusion-reactor-equipment-mk4", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "fusion-reactor-equipment-mk5", order = "a[energy-source]-de[fusion-reactor]", placed_as_equipment_result = "fusion-reactor-equipment-mk5", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "fusion-reactor-equipment-mk6", order = "a[energy-source]-df[fusion-reactor]", placed_as_equipment_result = "fusion-reactor-equipment-mk6", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "fusion-reactor-equipment-mk7", order = "a[energy-source]-dg[fusion-reactor]", placed_as_equipment_result = "fusion-reactor-equipment-mk7", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    {source = "generator-equipment", name = "fusion-reactor-equipment-mk8", order = "a[energy-source]-dh[fusion-reactor]", placed_as_equipment_result = "fusion-reactor-equipment-mk8", icon_name = "__base__/graphics/icons/fusion-reactor-equipment.png"},
    
    {source = "night-vision-equipment", name = "night-vision-equipment-mk2", order = "f[night-vision]-ab[night-vision-equipment]", placed_as_equipment_result = "night-vision-equipment-mk2", icon_name = "__base__/graphics/icons/night-vision-equipment.png"},
    {source = "energy-shield-equipment", name = "energy-shield-mk3-equipment", order = "a[shield]-c[energy-shield-equipment-mk3]", placed_as_equipment_result = "energy-shield-mk3-equipment", icon_name = "__base__/graphics/icons/energy-shield-mk2-equipment.png"},
    {source = "movement-bonus-equipment", name = "exoskeleton-equipment-mk2", order = "d[exoskeleton]-b[exoskeleton-equipment-mk2]", placed_as_equipment_result = "exoskeleton-equipment-mk2", icon_name = "__base__/graphics/icons/exoskeleton-equipment.png"},
    {source = "active-defense-equipment", name = "personal-laser-defense-equipment-mk2", order = "b[active-defense]-ab[personal-laser-defense-equipment-mk2]", placed_as_equipment_result = "personal-laser-defense-equipment-mk2", icon_name = "__base__/graphics/icons/personal-laser-defense-equipment.png"},
    {source = "roboport-equipment", name = "personal-roboport-mk3-equipment", order = "e[robotics]-bb[personal-roboport-mk3-equipment]", placed_as_equipment_result = "personal-roboport-mk3-equipment", icon_name = "__base__/graphics/icons/personal-roboport-mk2-equipment.png"}
}

for _, item in pairs(equipments) do
    EQ(item.source, item.name, item.order, item.icon_name, item.placed_as_equipment_result)
end

for _, animation in ipairs(data.raw["character"]["character"]["animations"]) do
    if animation.armors then
        for _, armor in ipairs(animation.armors) do
            if armor == "power-armor-mk2" then
                animation.armors[#animation.armors + 1] = "power-armor-mk3"
                break
            end
        end
    end
end

data:extend({
    {
        type = "equipment-grid",
        name = "equipment-grid-14x14",
        width = 14,
        height = 14,
        equipment_categories = {"armor"}
    },
    {
        type = "armor",
        name = "power-armor-mk3",
        icon = "__base__/graphics/icons/power-armor-mk2.png",
        icon_size = 64, icon_mipmaps = 4,
        resistances = {{type = "physical", decrease = 20, percent = 50}, {type = "acid", decrease = 20, percent = 80},
        {type = "explosion", decrease = 70, percent = 60}, {type = "fire", decrease = 20, percent = 80},
        {type = "laser", decrease = 20, percent = 50}, {type = "electric", decrease = 20, percent = 50},
        {type = "impact", decrease = 20, percent = 50}, {type = "poison", decrease = 20, percent = 50}},
        subgroup = "armor",
        order = "eb[power-armor-mk3]",
        stack_size = 1,
        infinite = true,
        equipment_grid = "equipment-grid-14x14",
        inventory_size_bonus = 40,
        open_sound = {filename =  "__base__/sound/armor-open.ogg", volume = 1},
        close_sound = {filename = "__base__/sound/armor-close.ogg", volume = 1}
    }
}
