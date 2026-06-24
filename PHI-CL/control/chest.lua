local main = {}

function main.build(event)
    if event.entity.type ~= 'logistic-container' or not event.entity.prototype or not event.entity.prototype.logistic_mode or event.entity.prototype.logistic_mode ~= 'storage' then
        return
    end

    local inventory = event.entity.get_inventory(defines.inventory.chest)

    if not inventory then
        return
    end

    local contents = inventory.get_contents()

    if not contents or #contents ~= 1 or not contents[1].name then
        return
    end

    event.entity.storage_filter = {name = contents[1].name, quality = contents[1].quality or 'normal'}
end

return main
