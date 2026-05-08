local main = {}

function main.build(event)
    if event.entity.type == 'proxy-container' then
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

    elseif event.entity.type == 'cargo-landing-pad' then
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

        if not ep then
            return
        end

        for _, v in pairs(ep) do
            v.proxy_target_entity = ec[1]
            v.proxy_target_inventory = defines.inventory.cargo_landing_pad_main
        end
    end
end

return main
