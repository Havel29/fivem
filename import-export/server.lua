ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("venduto")
AddEventHandler("venduto", function(quantita, merce, player)
    
    quantita = tonumber(quantita)

    local itemId
    local moneyPerPiece

    if merce == 'pollo' then --Pollo
        itemId = 'packaged_chicken'
        moneyPerPiece = 40
    elseif merce == 'legno' then --Legno
        itemId = 'packaged_plank'
        moneyPerPiece = 30
    end

    local xPlayer = ESX.GetPlayerFromId(player)
    local inventory =xPlayer.getInventory(minimal)

    local found = false
    for k, v in pairs(inventory) do
        if (v.name == itemId and v.count >= quantita) then
            found = true
            xPlayer.removeInventoryItem(itemId, quantita)
            xPlayer.addMoney(moneyPerPiece * quantita)
            TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~Hai ricevuto $' .. moneyPerPiece * quantita)
        end
    end

    if (found == false) then
        TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~Non hai ' .. quantita .. ' ' .. merce)
    end
    
    
end)