local webhookURL = "https://discord.com/api/webhooks/1167461379855372328/DbuRA2i3URpwxMMM73X9ffPEDjBo4bTRgTwY0IfnQHpKaXC_fVryMwDDKjK1DqEBVfrY" -- Add your Discord webhook URL here.


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