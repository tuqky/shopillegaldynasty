TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent("illegal:buy")
AddEventHandler("illegal:buy", function(item, type, price)
    local source = source;
    local xPlayer = ESX.GetPlayerFromId(source)
    for _, v in pairs(Config) do
        if item == v.item then
            if price ~= v.price then
                DropPlayer(source, "Kick ( IllégalShop )")
            else
            end
        end
    end
    if type == "weapon" then
      if xPlayer.getAccount('cash').money >= tonumber(price) then
          xPlayer.removeAccountMoney('cash', tonumber(price))
          xPlayer.addWeapon(item, 255)
          xPlayer.showNotification("~p~Dynasty Information\n~s~Vous venez d'acheter une arme ".. item .."")
      else
          xPlayer.showNotification("~p~Dynasty Information\n~s~Tu n'as pas d'argent")
      end
    elseif type == "item" then
       if xPlayer.getAccount('cash').money >= tonumber(price) then
           xPlayer.removeAccountMoney('cash', tonumber(price))
           xPlayer.addInventoryItem(item, 1)
           xPlayer.showNotification("~p~Dynasty Information\n~s~Vous venez d'acheter un item ".. item .."")
       else
        xPlayer.showNotification("~p~Dynasty Information\n~s~Tu n'as pas d'argent")
       end
    end
end)
