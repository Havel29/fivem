ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_technician:PayMoney')
AddEventHandler('esx_technician:PayMoney', totalQuest, function()
    xPlayer = ESX.GetPlayerFromId(source)
    PlayerJob = xPlayer.getJob()

    if PlayerJob.name == "technician" then
        if Config.MoneyType == true then
            xPlayer.addMoney(Config.MoneyAmount * totalQuest)
        else
            xPlayer.addAccountMoney('bank', Config.MoneyAmount * totalQuest)
        end
    end
end)
