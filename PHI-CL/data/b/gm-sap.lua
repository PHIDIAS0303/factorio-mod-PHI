
-- GM-SAP A 1 BASE RESEARCH
data:extend({{
    type = 'technology',
    name = 'cargo-landing-pad',
    prerequisites = {'space-science-pack'},
    effects = {{type = 'cargo-landing-pad-count', modifier = 1}},
    unit = {count_formula = '1000 * L', ingredients = {{'automation-science-pack', 1}, {'logistic-science-pack', 1}, {'military-science-pack', 1}, {'chemical-science-pack', 1}, {'production-science-pack', 1}, {'utility-science-pack', 1}, {'space-science-pack', 1}}, time = 60},
    icons = {{icon = '__base__/graphics/technology/rocket-silo.png', icon_size = 256}, {icon = '__core__/graphics/icons/technology/constants/constant-recipe-productivity.png', icon_size = 128, scale = 0.5, shift = {50, 50}}},
    order = 'a-i-a',
    max_level = 'infinite',
    upgrade = true,
    localised_name = {'entity-name.cargo-landing-pad'}
}})
