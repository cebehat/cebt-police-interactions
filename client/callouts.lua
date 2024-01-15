RegisterNetEvent('police-interactions:client:shotsfired')
AddEventHandler('police-interactions:client:shotsfired', function ()
    local calloutLocation = Config.CalloutLocations[math.random(1, #Config.CalloutLocations)]
    local calloutNpc = Config.CalloutNpcs[math.random(1, #Config.CalloutNpcs)]
    local calloutPed = GetHashKey(calloutNpc[math.random(1, #calloutNpc)])
    local calloutPedCoords = calloutLocation.coords

    RequestModel(calloutPed)
    while not HasModelLoaded(calloutPed) do
        Citizen.Wait(0)
    end

    local calloutPedId = CreatePed(4, calloutPed, calloutPedCoords.x, calloutPedCoords.y, calloutPedCoords.z, 0.0, true, true)
    SetEntityAsMissionEntity(calloutPedId, true, true)
    if calloutLocation.weapon ~= nil then
        GiveWeaponToPed(calloutPedId, GetHashKey(calloutLocation.weapon), 2800, false, true)
    end
    TaskCombatPed(calloutPedId, PlayerPedId(), 0, 16)
end)