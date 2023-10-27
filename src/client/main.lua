local changelogFile = LoadResourceFile(GetCurrentResourceName(), 'changelog.md')

RegisterCommand('changelog', function()
    TriggerEvent('showChangelog')
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

CreateThread(function() 
    if GetPlayerSwitchState() ~= 12 then
        TriggerEvent('showChangelog')
    end
end)