AddEventHandler('rcore_pool:notification', function(serverId, message)
    PRPCore.Functions.Notify("Player #" .. serverId .. ' - ' .. message)
end)