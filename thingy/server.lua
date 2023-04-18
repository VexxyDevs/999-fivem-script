RegisterServerEvent('999Call')
AddEventHandler('999Call', function(emergency)
    local player = source
    local playerPed = GetPlayerPed(player)
    local coords = GetEntityCoords(playerPed)
    local playerName = GetPlayerName(player)

    TriggerClientEvent('showCall', -1, coords, emergency, playerName)
end)
