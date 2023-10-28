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
    if GetResourceState('qb-core') == 'started' then
        AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
            TriggerEvent('tam:showChangelog')
        end)
    elseif GetPlayerSwitchState() ~= 12 then
        TriggerEvent('tam:showChangelog')
    end
end)
