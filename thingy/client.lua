RegisterCommand('999', function(source, args, rawCommand)
    local emergency = table.concat(args, ' ')
    TriggerServerEvent('999Call', emergency)
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = { '^*^1[Emergency Center]^r^0^*^7', 'Your 999 call has been received!'}
    })
end)

RegisterNetEvent('showCall')
AddEventHandler('showCall', function(coords, emergency, playerName)
    local message = '^*^1[999 Call DataBase]^r^0^*^7 Emergency: ' .. emergency

    if playerName ~= nil then
        message = message .. ' Caller: ' .. playerName
    end

    TriggerEvent('chat:addMessage', {
        color = { 255, 255, 255 },
        args = { message }
    })
end)

RegisterServerEvent('999Call')
AddEventHandler('999Call', function(emergency)
    local player = source
    local playerPed = GetPlayerPed(player)
    local coords = GetEntityCoords(playerPed)
    local playerName = GetPlayerName(player)

    for k, v in pairs(GetPlayers()) do
        TriggerClientEvent('showCall', v, coords, emergency, playerName)
    end
end)
