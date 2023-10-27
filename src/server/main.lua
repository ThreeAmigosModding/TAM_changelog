local webhookURL = "" -- Add your Discord webhook URL here.


RegisterNetEvent('tam:triggerWebhook', function()
    if config.enableWebhook then
        local changelogFile = LoadResourceFile(GetCurrentResourceName(), 'changelog.md')
        local embed = {
            {
            ["color"] = 000000,
            ["title"] = config.embedTitle,
            ["description"] = changelogFile,
            ["footer"] = {
                ["text"] = config.footer,
            },
            }
        }

        PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode({username = config.username, embeds = embed, avatar_url = config.avatar}), { ['Content-Type'] = 'application/json' })
    end
end)

if config.enableWebhook then
    SaveResourceFile(GetCurrentResourceName(), 'src/server/cache.md', LoadResourceFile(GetCurrentResourceName(), 'changelog.md'), string.len(LoadResourceFile(GetCurrentResourceName(), 'changelog.md')))
    
    CreateThread(function()
        while true do
            Wait(500)
            local cache = LoadResourceFile(GetCurrentResourceName(), 'src/server/cache.md')
            local changelog = LoadResourceFile(GetCurrentResourceName(), 'changelog.md')
            if changelog ~= cache then
                TriggerEvent('tam:triggerWebhook')
                SaveResourceFile(GetCurrentResourceName(), 'src/server/cache.md', changelog, string.len(changelog))
                cache = LoadResourceFile(GetCurrentResourceName(), 'src/server/cache.md')
                changelog = LoadResourceFile(GetCurrentResourceName(), 'changelog.md')
            end
        end
    end)
end