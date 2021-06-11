PRPCore = nil
local _isLoggedIn = false
local _playerData = {}

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent("PRPCore:Client:OnPlayerLoaded")
AddEventHandler("PRPCore:Client:OnPlayerLoaded", function()
    _isLoggedIn = true
    _playerData = PRPCore.Functions.GetPlayerData()
end)

RegisterNetEvent("PRPCore:Client:OnPlayerUnload")
AddEventHandler("PRPCore:Client:OnPlayerUnload", function()
    _isLoggedIn = false
end)

RegisterNetEvent("PRPCore:Client:OnJobUpdate")
AddEventHandler("PRPCore:Client:OnJobUpdate", function()
    _playerData = PRPCore.Functions.GetPlayerData()
end)

-- code

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)

        for i, shop in pairs(Config.Locations) do
            local position = shop.coords
            for _, loc in pairs(position) do
                local dist = GetDistanceBetweenCoords(PlayerPos, loc["x"], loc["y"], loc["z"])
                if dist < 10 then
                    if _isLoggedIn and shop["jobRestrictions"] ~= nil then
                        local canUse = false
                        for _, job in ipairs(shop.jobRestrictions) do
                            if _playerData.job.name == job.name and _playerData.job.grade.level >= job.minGrade then
                                canUse = true
                                goto continue
                            end
                        end

                        :: continue ::

                        if not canUse then
                            goto nextShop
                        end
                    end
                    InRange = true
                    if shop["hideMarker"] == nil or not shop.hideMarker then
                        DrawMarker(2, loc["x"], loc["y"], loc["z"], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 255, 255, 155, 0, 0, 0, 1, 0, 0, 0)
                    end
                    if dist < 1 then
                        if shop["hideText"] == nil or not shop.hideText then
                            DrawText3Ds(loc["x"], loc["y"], loc["z"] + 0.15, '~g~E~w~ - Shopping')
                        end
                        if IsControlJustPressed(0, 38) then
                            local ShopItems = {}
                            ShopItems.label = shop["label"]
                            ShopItems.items = shop["products"]
                            ShopItems.slots = 30
                            TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_" .. i, ShopItems)
                        end
                    end
                end
            end

            :: nextShop ::
        end

        if not InRange then
            Citizen.Wait(5000)
        end
        Citizen.Wait(5)
    end
end)

RegisterNetEvent('prp-shops:client:UpdateShop')
AddEventHandler('prp-shops:client:UpdateShop', function(shop, itemData, amount)
    TriggerServerEvent('prp-shops:server:UpdateShopItems', shop, itemData, amount)
end)

RegisterNetEvent('prp-shops:client:SetShopItems')
AddEventHandler('prp-shops:client:SetShopItems', function(shop, shopProducts)
    Config.Locations[shop]["products"] = shopProducts
end)

RegisterNetEvent('prp-shops:client:RestockShopItems')
AddEventHandler('prp-shops:client:RestockShopItems', function(shop, amount)
    if Config.Locations[shop]["products"] ~= nil then 
        for k, v in pairs(Config.Locations[shop]["products"]) do 
            Config.Locations[shop]["products"][k].amount = Config.Locations[shop]["products"][k].amount + amount
        end
    end
end)

Citizen.CreateThread(function()
    for i, store in pairs(Config.Locations) do
        if store["hideBlip"] == nil or not store.hideBlip then
            StoreBlip = AddBlipForCoord(Config.Locations[i]["coords"][1]["x"], Config.Locations[i]["coords"][1]["y"], Config.Locations[i]["coords"][1]["z"])
            SetBlipColour(StoreBlip, 0)

            -- TODO: When there's time, put these in a config
            if Config.Locations[i]["products"] == Config.Products["normal"] then
                SetBlipSprite(StoreBlip, 52)
                SetBlipScale(StoreBlip, 0.45)
            elseif Config.Locations[i]["products"] == Config.Products["coffeeplace"] then
                SetBlipSprite(StoreBlip, 52)
                SetBlipScale(StoreBlip, 0.45)
            elseif Config.Locations[i]["products"] == Config.Products["customcoffee"] then
                SetBlipSprite(StoreBlip, 52)
                SetBlipScale(StoreBlip, 0.45)
            elseif Config.Locations[i]["products"] == Config.Products["pearls"] then
                SetBlipSprite(StoreBlip, 52)
                SetBlipScale(StoreBlip, 0.45)
            elseif Config.Locations[i]["products"] == Config.Products["gearshop"] then
                SetBlipSprite(StoreBlip, 52)
                SetBlipScale(StoreBlip, 0.45)
            elseif Config.Locations[i]["products"] == Config.Products["hardware"] then
                SetBlipSprite(StoreBlip, 402)
                SetBlipScale(StoreBlip, 0.45)
            elseif Config.Locations[i]["products"] == Config.Products["weapons"] then
                SetBlipSprite(StoreBlip, 110)
                SetBlipScale(StoreBlip, 0.45)
            elseif Config.Locations[i]["products"] == Config.Products["leisureshop"] then
                SetBlipSprite(StoreBlip, 52)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 3)
            elseif Config.Locations[i]["products"] == Config.Products["newtshop"] then
                SetBlipSprite(StoreBlip, 225)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 3)
            elseif Config.Locations[i]["products"] == Config.Products["coffeeshop"] then
                SetBlipSprite(StoreBlip, 140)
                SetBlipScale(StoreBlip, 0.45)
            elseif Config.Locations[i]["products"] == Config.Products["tacoplace"] then
                SetBlipSprite(StoreBlip, 514)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 5)
            elseif Config.Locations[i]["products"] == Config.Products["whiskeyjim"] then
                SetBlipSprite(StoreBlip, 84)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 1)
            elseif Config.Locations[i]["products"] == Config.Products["tequila"] then
                SetBlipSprite(StoreBlip, 93)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 15)
            elseif Config.Locations[i]["products"] == Config.Products["passion"] then
                SetBlipSprite(StoreBlip, 605)
                SetBlipScale(StoreBlip, 0.65)
                SetBlipColour(StoreBlip, 15)
            elseif Config.Locations[i]["products"] == Config.Products["alcohol"] then
                SetBlipSprite(StoreBlip, 93)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 5)
            elseif Config.Locations[i]["products"] == Config.Products["bestbuds"] then
                SetBlipSprite(StoreBlip, 140)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 2)
            elseif Config.Locations[i]["products"] == Config.Products["casinoshop"] then
                SetBlipSprite(StoreBlip, 108)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 1)
            elseif Config.Locations[i]["products"] == Config.Products["vanilla"] then
                SetBlipSprite(StoreBlip, 93)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 15)
            elseif Config.Locations[i]["products"] == Config.Products["nightclub"] then
                SetBlipSprite(StoreBlip, 93)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 15)
            elseif Config.Locations[i]["products"] == Config.Products["materials"] then
                SetBlipSprite(StoreBlip, 588)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 15)
            elseif Config.Locations[i]["products"] == Config.Products["burger"] then
                SetBlipSprite(StoreBlip, 106)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 47)
            elseif Config.Locations[i]["products"] == Config.Products["bahamas"] then
                SetBlipSprite(StoreBlip, 106)
                SetBlipScale(StoreBlip, 0.45)
                SetBlipColour(StoreBlip, 14)
            end

            SetBlipDisplay(StoreBlip, 4)
            SetBlipAsShortRange(StoreBlip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Locations[i]["label"])
            EndTextCommandSetBlipName(StoreBlip)
        end
    end
end)