local changelogFile = LoadResourceFile(GetCurrentResourceName(), 'changelog.md')

RegisterCommand('changelog', function()
    --TriggerEvent('showChangelog')
    print(changelogFile)
end, false)


RegisterNetEvent('showChangelog', function()
    local alert = lib.alertDialog({
        header = 'Changelog - 01/01/2024',
        content = changelogFile,
        centered = true,
        cancel = false,
        size = 'xl',
        labels = {
            confirm = 'Close'
        }
    })

    print(alert)
end)