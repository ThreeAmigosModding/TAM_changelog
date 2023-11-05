local changelogFile = LoadResourceFile(GetCurrentResourceName(), 'changelog.md')
local display = true


RegisterCommand('changelog', function()
    TriggerEvent('tam:showChangelog')
end, false)

exports('showChangelog', function(show)
    if show then
        display = true
    elseif not show then
        display = false
    end
end)

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
    if display then
        print(alert)
    end
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