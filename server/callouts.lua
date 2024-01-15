local QBCore = exports['qb-core']:GetCoreObject()




RegisterCommand('calloutTest', function(source, args, rawCommand)
    TriggerClientEvent('chat:addMessage', source, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Callouts', 'This is a test callout'}
    })
    TriggerClientEvent('police-interactions:client:shotsfired', source)
end, true)

RegisterNetEvent('police-interactions:server:complete')
AddEventHandler('police-interactions:server:complete', function (payment)
    TriggerClientEvent('chat:addMessage', source, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Callouts', 'received ' .. payment .. ' as a bonus'}
    })
    local Player = QBCore.Functions.GetPlayer(source)
    Player.AddMoney('bank', payment, 'Law Enforcement Bonus')
    --exports['qb-banking']:AddMoney('bank', payment, 'Law Enforcement Bonus')
end)