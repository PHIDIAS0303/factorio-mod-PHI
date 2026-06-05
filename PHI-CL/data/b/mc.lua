local main = {}

function main.space_age()
    if not mods['space-age'] then
        error('Mod not found\nSpace Age is not enabled\n太空時代尚未啟用\nSpace Age が有効になっていません')
        return
    end
end

return main
