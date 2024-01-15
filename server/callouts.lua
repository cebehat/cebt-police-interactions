RegisterCommand('calloutTest', function(source, args, rawCommand)
    TriggerClientEvent('chat:addMessage', source, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Callouts', 'This is a test callout'}
    })
    TriggerClientEvent('police-interactions:client:shotsfired', source)
end, false)