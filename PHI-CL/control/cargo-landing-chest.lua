local main = {}

function main.build(event)
    if event.entity.type ~= 'cargo-landing-pad' then
        return
    end

    if event.entity.name ~= 'cargo-landing-pad' then
        return
    end
    if not prototypes.entity['proxy-cargo-landing-chest'] then
        return
    end

    local ec = game.surfaces[event.entity.surface].find_entities_filtered{type='cargo-landing-pad'}

    if #ec > 1 then
        return
    end

    local ep = game.surfaces[event.entity.surface].find_entities_filtered{type='proxy-container', name='proxy-cargo-landing-chest'}

    for _, v in pairs(ep) do
        v.proxy_target_entity = ec[1]
        v.proxy_target_inventory = defines.inventory.cargo_landing_pad_main
    end
end

return main
