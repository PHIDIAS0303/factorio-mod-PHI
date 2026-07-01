--[[
裝飾生成 Decoration Generation
地磚生成 Tile Generation
隱藏 Hide
成就 Achievement
隱藏 Hide
提示 Tip and Trick

for _, v in pairs({'gleba-spawner', 'gleba-spawner-small'}) do
    data.raw['unit-spawner'][v].loot = nil
    data.raw['unit-spawner'][v].collision_mask = nil
    data.raw['unit-spawner'][v].autoplace = nil
end

data.raw['unit']['small-wriggler-pentapod-premature'].absorptions_to_join_attack = {pollution = 0}
data.raw['unit']['small-wriggler-pentapod'].absorptions_to_join_attack = {pollution = 2}
data.raw['spider-unit']['small-strafer-pentapod'].absorptions_to_join_attack = {pollution = 20}
data.raw['spider-unit']['small-stomper-pentapod'].absorptions_to_join_attack = {pollution = 25}
table.remove(data.raw['spider-unit'][v].dying_trigger_effect, 1)

for _, v in pairs({'ashland-lichen-tree', 'ashland-lichen-tree-flaming', 'cuttlepop', 'slipstack', 'funneltrunk', 'hairyclubnub', 'teflilly', 'lickmaw', 'stingfrond', 'boompuff', 'sunnycomb', 'water-cane'}) do
    data.raw['tree'][v].autoplace = nil
end

for _, v in pairs({'yumako-tree', 'jellystem'}) do
    data.raw['plant'][v].autoplace = nil
end 

data.raw['simple-entity']['small-stomper-shell'].autoplace = nil
]]
