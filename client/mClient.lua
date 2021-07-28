ESX = {};

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj)
    ESX = obj
end)

local yeshop = {
    {x = 793.734, y = 2162.504, z = 53.09}
} 

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end

function illegalshopMenu()
    local mainMenu = RageUI.CreateMenu("Marchant Illegal", "Que voulez-vous ?")
    mainMenu.TitleFont = 2;
    mainMenu.Closed = function()
        FreezeEntityPosition(PlayerPedId(), false)
    end
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        FreezeEntityPosition(PlayerPedId(), true)
        while mainMenu do
            Wait(0)
            RageUI.IsVisible(mainMenu, function()
                FreezeEntityPosition(PlayerPedId(), true)
                for i, v in pairs(Config) do
                    RageUI.Button(v.label .."", nil, { RightLabel = "" .. v.price.."~HUD_COLOUR_DEGEN_RED~ $" }, true, {
                        onSelected = function()
                            TriggerServerEvent("illegal:buy", v.item, v.type, v.price) -- TODO
                        end
                    })
                end
            end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType("mainMenu", true)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local cooldown = 500
        local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
        for k,v in pairs(yeshop) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, yeshop[k].x, yeshop[k].y, yeshop[k].z)
            if not mainMenu then
                if distance <= 10.0 then
                    cooldown = 1
                    DrawMarker(22, yeshop[k].x, yeshop[k].y, yeshop[k].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 109, 74, 223, 255, 0, 0, 1, nil, nil, 0)
                
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~r~[E]~s~ pour intéragir avec Bob Le Bricoleur 💣"})
                        if IsControlJustPressed(0, 51) then
                            illegalshopMenu()
                        end
                    end
                end
            end
        end
        Citizen.Wait(cooldown)
    end
end)

DecorRegister("UHQ", 4)
pedHashloca1 = "ig_chengsr"
zoneloca1 = vector3(793.93487548828, 2163.1362304688, 52.092929840088)
Headingloca1 = 152.65225219727
Pedloca1 = nil
HeadingSpawnloca1 = 152.65225219727

Citizen.CreateThread(function()
    LoadModel(pedHashloca1)
    Pedloca1 = CreatePed(2, GetHashKey(pedHashloca1), zoneloca1, Headingloca1, 0, 0)
    DecorSetInt(Pedloca1, "UHQ", 5431)
    FreezeEntityPosition(Pedloca1, 1)
    TaskStartScenarioInPlace(Pedloca1, "WORLD_HUMAN_SMOKING_CLUBHOUSE", 0, false)
    SetEntityInvincible(Pedloca1, true)
    SetBlockingOfNonTemporaryEvents(Pedloca1, 1)
end)
