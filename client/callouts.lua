local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('police-interactions:client:shotsfired')
AddEventHandler('police-interactions:client:shotsfired', function ()
    local callout = Config.CalloutLocations[math.random(1, #Config.CalloutLocations)]
    local calloutNpc = Config.CalloutNpcs[math.random(1, #Config.CalloutNpcs)]
    local calloutPed = GetHashKey(calloutNpc[math.random(1, #calloutNpc)])
    local calloutPedCoords = callout.coords

    RequestModel(calloutPed)
    while not HasModelLoaded(calloutPed) do
        Citizen.Wait(0)
    end

    local calloutPedId = CreatePed(4, calloutPed, calloutPedCoords.x, calloutPedCoords.y, calloutPedCoords.z, 0.0, true, true)
    SetEntityAsMissionEntity(calloutPedId, true, true)
    if callout.weapon ~= nil then
        GiveWeaponToPed(calloutPedId, GetHashKey(callout.weapon), 2800, false, true)
    end
    TaskCombatPed(calloutPedId, PlayerPedId(), 0, 16)
    QBCore.Functions.Notify(callout.dispatchmessage, "error", 4000)
    SetNewWaypoint(calloutPedCoords.x, calloutPedCoords.y)
end)