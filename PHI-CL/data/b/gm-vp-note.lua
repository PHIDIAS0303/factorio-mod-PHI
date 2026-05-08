--[[
裝飾生成 Decoration Generation
地磚生成 Tile Generation

for _, v in pairs(data.raw['tile']) do
    if v.subgroup and (v.subgroup == 'vulcanus-tiles' or v.subgroup == 'gleba-tiles' or v.subgroup == 'gleba-water-tiles' or v.subgroup == 'fulgora-tiles' or v.subgroup == 'aquilo-tiles') then
        v.autoplace = nil
    end
end

for _, v in pairs({'lichen-decal', 'shroom-decal', 'pink-lichen-decal', 'red-lichen-decal', 'yellow-lettuce-lichen-1x1', 'yellow-lettuce-lichen-3x3', 'yellow-lettuce-lichen-6x6', 'yellow-lettuce-lichen-cups-1x1', 'yellow-lettuce-lichen-cups-3x3', 'yellow-lettuce-lichen-cups-6x6', 'honeycomb-fungus', 'honeycomb-fungus-1x1', 'honeycomb-fungus-decayed', 'green-lettuce-lichen-1x1', 'green-lettuce-lichen-3x3', 'green-lettuce-lichen-6x6', 'green-lettuce-lichen-water-1x1', 'green-lettuce-lichen-water-3x3', 'green-lettuce-lichen-water-6x6', 'split-gill-1x1', 'split-gill-2x2', 'split-gill-dying-1x1', 'split-gill-dying-2x2', 'split-gill-red-1x1', 'split-gill-red-2x2', 'fuchsia-pita', 'wispy-lichen', 'coral-land', 'coral-water', 'black-sceptre', 'pink-phalanges', 'green-cup', 'mycelium', 'veins', 'veins-small', 'brambles', 'blood-grape', 'blood-grape-vibrant', 'brown-cup', 'polycephalum-slime', 'polycephalum-balloon', 'grey-cracked-mud-decal', 'yellow-coral', 'solo-barnacle', 'curly-roots-orange', 'curly-roots-grey', 'pale-lettuce-lichen-cups-1x1', 'pale-lettuce-lichen-cups-3x3', 'pale-lettuce-lichen-cups-6x6', 'pale-lettuce-lichen-1x1', 'pale-lettuce-lichen-3x3', 'pale-lettuce-lichen-6x6', 'pale-lettuce-lichen-water-1x1', 'pale-lettuce-lichen-water-3x3', 'pale-lettuce-lichen-water-6x6', 'matches-small', 'nerve-roots-dense', 'nerve-roots-sparse', 'red-nerve-roots-veins-dense', 'red-nerve-roots-veins-sparse', 'purple-nerve-roots-veins-dense', 'purple-nerve-roots-veins-sparse', 'cream-nerve-roots-veins-dense', 'cream-nerve-roots-veins-sparse', 'white-carpet-grass', 'barnacles-decal', 'coral-stunted-grey', 'coral-stunted', 'gleba-spawner-slime', 'knobbly-roots', 'knobbly-roots-orange', 'fulgoran-ruin-tiny', 'fulgoran-gravewort', 'urchin-cactus', 'medium-fulgora-rock', 'small-fulgora-rock', 'tiny-fulgora-rock', 'aqulio-ice-decal-blue', 'aqulio-snowy-decal', 'floating-iceberg-large', 'floating-iceberg-small', 'lithium-iceberg-medium', 'lithium-iceberg-small', 'lithium-iceberg-tiny', 'snow-drift-decal', 'v-green-hairy-grass', 'v-brown-hairy-grass', 'v-brown-carpet-grass', 'v-red-pita', 'vulcanus-rock-decal-large', 'vulcanus-crack-decal', 'vulcanus-crack-decal-large', 'vulcanus-crack-decal-huge-warm', 'vulcanus-crack-decal-warm', 'calcite-stain', 'calcite-stain-small', 'sulfur-stain', 'sulfur-stain-small', 'sulfuric-acid-puddle', 'sulfuric-acid-puddle-small', 'crater-small', 'crater-large', 'pumice-relief-decal', 'vulcanus-sand-decal', 'vulcanus-dune-decal', 'waves-decal', 'medium-volcanic-rock', 'small-volcanic-rock', 'tiny-volcanic-rock', 'tiny-rock-cluster', 'small-sulfur-rock', 'tiny-sulfur-rock', 'sulfur-rock-cluster', 'vulcanus-lava-fire'}) do
    data.raw['optimized-decorative'][v].autoplace = nil
end

data.raw['lightning-attractor']['fulgoran-ruin-attractor'].autoplace = nil

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
