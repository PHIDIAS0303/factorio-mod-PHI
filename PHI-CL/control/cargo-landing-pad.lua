local main = {}

function main.build(event)
    if event.entity.type ~= 'proxy-container' then
        return
    end

    if event.entity.name ~= 'proxy-cargo-landing-chest' then
        return
    end

    if not prototypes.entity['cargo-landing-pad'] then
        return
    end

    local ec = game.surfaces[event.entity.surface].find_entities_filtered{type='cargo-landing-pad'}

    if not ec then
        return
    end

    event.entity.proxy_target_entity = ec[1]
    event.entity.proxy_target_inventory = defines.inventory.cargo_landing_pad_main
end

return main
