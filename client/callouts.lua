local QBCore = exports['qb-core']:GetCoreObject()
ActiveCallout = false

local function CreateCalloutPed(callout, calloutLocation, calloutPed)
    local coords = callout.coords
    local ped = GetHashKey(calloutPed)
    RequestModel(ped)
    while not HasModelLoaded(ped) do
        Citizen.Wait(1)
    end

    Wait(1000)

    local pedId = CreatePed(4, ped, calloutLocation.x, calloutLocation.y, calloutLocation.z, calloutLocation.w, true, true)
    SetEntityAsMissionEntity(pedId, true, true)
    if callout.calloutType == "shotsfired" then
        local weapon = Config.GunTypes[math.random(1, #Config.GunTypes)]
        local weaponHash = GetHashKey(weapon)
        print("Give weapon " .. weapon)
        GiveWeaponToPed(pedId, weaponHash, 255, false, true)
        SetPedDropsWeaponsWhenDead(pedId, false)
    end
    AddRelationshipGroup("suspect")

    SetRelationshipBetweenGroups(5, GetHashKey("suspect"), GetHashKey("PLAYER"))
    SetPedRelationshipGroupHash(pedId, GetHashKey("suspect"))
    TaskCombatHatedTargetsAroundPed(pedId, 100.0, 0)
    SetPedCombatMovement(pedId, 1)
    SetPedHasAiBlip(pedId, true)
    return pedId
end

local function CompleteCallout(callout, calloutPedId)
    --ActiveCallout = false
    --QBCore.Functions.Notify("he ded", "primary", 2000)
    QBCore.Functions.Notify("You receive " .. callout.calloutPay .. " as a bonus", "success", 2000)
    TriggerServerEvent('police-interactions:server:complete', callout.calloutPay)
    SetPedAsNoLongerNeeded(calloutPedId)
    Wait(Config.NpcDespawnTime * 1000)
    DeletePed(calloutPedId)
end



RegisterNetEvent('police-interactions:client:shotsfired')
AddEventHandler('police-interactions:client:shotsfired', function ()
    if ActiveCallout then
        QBCore.Functions.Notify("You are already responding to a callout", "error", 2000)
        return
    end
    local calloutLocation = Config.CalloutLocations[math.random(1, #Config.CalloutLocations)]
    local callout = Config.CalloutDefinitions[math.random(1, #Config.CalloutDefinitions)]
    local calloutNpc = Config.CalloutNpcs[math.random(1, #Config.CalloutNpcs)]
    local calloutPedId = CreateCalloutPed(callout,calloutLocation, calloutNpc[math.random(1, #calloutNpc)])

    QBCore.Functions.Notify(callout.dispatchmessage, "error", 10000)
    SetPedAiBlipForcedOn(calloutPedId, true)
    SetNewWaypoint(calloutLocation.x, calloutLocation.y)

    --CreateThread(function()
        while not IsPedDeadOrDying(calloutPedId, true) do
            Citizen.Wait(100)
        end
        CompleteCallout(callout, calloutPedId)
    --end)

end)