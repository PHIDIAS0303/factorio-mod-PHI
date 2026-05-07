--[[
for _, v in pairs({'gleba-spawner', 'gleba-spawner-small'}) do
    data.raw['unit-spawner'][v].loot = nil
    data.raw['unit-spawner'][v].collision_mask = nil
    data.raw['unit-spawner'][v].autoplace = nil
    data.raw['unit-spawner'][v].hidden = true
    data.raw['unit-spawner'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-demolisher', 'medium-demolisher', 'big-demolisher'}) do
    data.raw['segmented-unit'][v].hidden = true
    data.raw['segmented-unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-wriggler-pentapod-premature', 'medium-wriggler-pentapod-premature', 'big-wriggler-pentapod-premature'}) do
    data.raw['unit'][v].absorptions_to_join_attack = {pollution = 0}
    data.raw['unit'][v].hidden = true
    data.raw['unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-wriggler-pentapod', 'medium-wriggler-pentapod', 'big-wriggler-pentapod'}) do
    data.raw['unit'][v].absorptions_to_join_attack = {pollution = 2}
    data.raw['unit'][v].hidden = true
    data.raw['unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-strafer-pentapod', 'medium-strafer-pentapod', 'big-strafer-pentapod'}) do
    data.raw['spider-unit'][v].absorptions_to_join_attack = {pollution = 20}
    data.raw['spider-unit'][v].hidden = true
    data.raw['spider-unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'small-stomper-pentapod', 'medium-stomper-pentapod', 'big-stomper-pentapod'}) do
    data.raw['spider-unit'][v].absorptions_to_join_attack = {pollution = 25}
    table.remove(data.raw['spider-unit'][v].dying_trigger_effect, 1)
    data.raw['spider-unit'][v].hidden = true
    data.raw['spider-unit'][v].hidden_in_factoriopedia = true
end

for _, v in pairs({'ashland-lichen-tree', 'ashland-lichen-tree-flaming', 'cuttlepop', 'slipstack', 'funneltrunk', 'hairyclubnub', 'teflilly', 'lickmaw', 'stingfrond', 'boompuff', 'sunnycomb', 'water-cane'}) do
    data.raw['tree'][v].autoplace = nil
end

for _, v in pairs({'yumako-tree', 'jellystem'}) do
    data.raw['plant'][v].autoplace = nil
end 

for _, v in pairs({'natural-yumako-soil', 'natural-jellynut-soil', 'wetland-yumako', 'wetland-jellynut', 'lowland-brown-blubber', 'lowland-olive-blubber', 'lowland-olive-blubber-2', 'lowland-olive-blubber-3', 'lowland-cream-red', 'lowland-red-vein', 'lowland-red-vein-2', 'lowland-red-vein-3', 'lowland-red-vein-4', 'lowland-red-vein-dead', 'lowland-red-infection', 'ammoniacal-ocean', 'ammoniacal-ocean-2'}) do
    data.raw['planet']['nauvis'].map_gen_settings.autoplace_settings.tile.settings[v] = nil
end
]]
