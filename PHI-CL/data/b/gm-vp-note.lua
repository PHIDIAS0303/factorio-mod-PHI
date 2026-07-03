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

修改機械手的方向為8向 (長機械手為 16)。
Inserter is now 8 way, or 16 way for long inserter.
This will disable rotation
-- MIG C 5 BASE ENTITY
-- MIG C 1 SPACE_AGE ENTITY
if data.raw['inserter'] then
    for _, v in pairs(data.raw['inserter']) do
        if v.energy_source and v.energy_source.type and (v.energy_source.type == 'electric' or v.energy_source.type == 'void' or v.energy_source.type == 'burner') then
            if not v.flags then
                v.flags = {'placeable-neutral', 'placeable-player', 'player-creation'}
            end

            table.insert(v.flags, ((v.hand_size and v.hand_size > 0.8) and 'building-direction-16-way' or 'building-direction-8-way'))

            if v.energy_source.type == 'burner' then
                v.allow_burner_leech = true
            end
        end
    end
end
]]
