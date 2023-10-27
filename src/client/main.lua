local changelogFile = LoadResourceFile(GetCurrentResourceName(), 'changelog.md')

RegisterCommand('changelog', function()
    TriggerEvent('showChangelog')
end, false)


RegisterNetEvent('tam:showChangelog', function()
    local alert = lib.alertDialog({
        header = config.changelogHeader,
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
        TriggerEvent('tam:showChangelog')
    end
end)