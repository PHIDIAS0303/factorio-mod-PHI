local main = {}

function main.build(event)
    if event.entity.type ~= 'logistic-container' or event.entity.logistic_mode ~= 'storage' then
        return
    end

    local inventory = event.entity.get_inventory(defines.inventory.chest)

    if not inventory then
        return
    end

    local contents = inventory.get_contents()

    if not contents or #contents ~= 1 then
        return
    end

    event.entity.storage_filter = {name = contents[1].name, quality = contents[1].quality}
end

return main
