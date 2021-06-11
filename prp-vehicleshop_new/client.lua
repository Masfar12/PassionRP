----------------
-- Core Stuff --
----------------
PRPCore = nil
Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

---------------
-- Variables --
---------------
local timer = 1
local timer2 = 1
local PlayerData = nil
local lastvehicle = 0
local isLoggedIn = false
local pdmBlip = nil
local VehPos = nil
local nearDealership = false
local gotStockValues = false
local gotSharedValues = false
local stockVehicles = nil
local sharedVehicles = nil

local NumberCharset = {}
local Charset = {}
for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

---------------
-- Polyzones --
---------------
AddEventHandler("prp-polyzone:enter", function(name)

    if name == "nearcardealership" then 
        nearDealership = true
        print(nearDealership)
    end

end)

AddEventHandler("prp-polyzone:exit", function(name)

    if name == "nearcardealership" then
        nearDealership = false
        print(nearDealership)
    end

end)


---------------------
-- Citizen Threads --
---------------------

Citizen.CreateThread(function()
	while Config.showcase == nil do
		Citizen.Wait(200)
	end
	VehPos = Config.showcase
end)

Citizen.CreateThread(function()
	CreateWarMenu('STOCK_MENU', 'PDM STOCK', 'PDM STOCK')
	while true do
		local sleep = 300

		if isLoggedIn then
			if WarMenu.IsMenuOpened('STOCK_MENU') then
				sleep = 0
				if not gotStockValues then
					stockVehicles = GetStockVehicles()
					gotStockValues = true
				end
				local vehicles = stockVehicles
				if tablelength(vehicles) > 0 then
					for k, v in pairs(vehicles) do
						if WarMenu.Button(v.name) then
							PRPCore.Functions.SpawnVehicle(GetHashKey(v.name), function(vehicle)
								PRPCore.Functions.TriggerCallback("prp:checkvehicleinfo", function(vehiclesinfo)
									local vehicleProps = PRPCore.Functions.GetVehicleProperties(vehicle)
									if vehiclesinfo ~= nil then
										PRPCore.Functions.SetVehicleProperties(vehicle, vehiclesinfo)
									else
										TriggerServerEvent("prp:setnewinfocar", vehicleProps, v.id)
									end
									SetVehicleEngineOn(vehicle, true, true)
									TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
									SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
									SetEntityAsMissionEntity(vehicle, true, true)
								end, v.id)
							end, {x = -759.60, y = -233.74, z = 37.28, a = 206.53}, true)
							WarMenu.CloseMenu()
						end
					end
				end
				WarMenu.Display()
			else
				gotStockValues = false
				stockVehicles = nil
			end
			if PlayerData.job ~= nil and PlayerData.job.name == "cardealer" then
				for _,v in pairs(Config.showcase) do
					local ped = GetPlayerPed(-1)
					local x,y,z = table.unpack(GetEntityCoords(ped, true))
					local distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z)
					if distance <= 1.3 and IsPedInAnyVehicle(ped) then
						sleep = 0
						PRPCore.Functions.DrawText3D(v.x, v.y, v.z + 1.60, "[~g~"..v.price.."$~w~]~n~ Press [~g~E~w~] to place on the [~g~Stand~w~]")
						PRPCore.Functions.DrawText3D(v.x, v.y, v.z + 1.45, "Press [~g~G~w~] to take from the [~g~Stand~w~]")
						PRPCore.Functions.DrawText3D(v.x, v.y, v.z + 1.30, "Press [~g~H~w~] to buy the car from the [~g~Stand~w~]")
						--PRPCore.Functions.DrawText3D(v.x, v.y, v.z + 1.259, "Press [~g~B~w~] to pay for the car [~g~Financially~w~]")

						if distance <= 1.3 then
							if IsControlJustReleased(0, 38) and IsPedInAnyVehicle(ped) then
								DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
								while (UpdateOnscreenKeyboard() == 0) do
									DisableAllControlActions(0);
									Wait(0);
								end
								if (GetOnscreenKeyboardResult()) then
									local result = tonumber(GetOnscreenKeyboardResult())
									if result == nil then
										PRPCore.Functions.Notify("Invalid Amount!", "error")
									else
										local vehicle = GetVehiclePedIsIn(ped)
										local vehicleProps = PRPCore.Functions.GetVehicleProperties(vehicle)
										v.price = result
										lastvehicle = vehicle

										-- GetDisplayNameFromVehicleModel cuts off at 8 characters... 
										local model = GetDisplayNameFromVehicleModel(vehicleProps.model)

										if string.match(model, "02") then
											model = string.gsub(model, "02", "2")
										end

										if string.match(model, "03") then
											model = string.gsub(model, "03", "3")
										end

										if string.match(model, "04") then
											model = string.gsub(model, "04", "4")
										end

										if model == "WASHINGT" then
											model = "WASHINGTON"
										end

										if model == "CARBONIZ" then
											model = "CARBONIZZARE"
										end

										if model == "BUCCANEE" then
											model = "BUCCANEER2"
										end

										if model == "FAGGION" then
											model = "FAGGIO"
										end

										if model == "CARBON" then
											model = "CARBONRS"
										end

										if model == "COGCABRI" then
											model = "COGCABRIO"
										end

										TriggerServerEvent("prp:sendcarinfo", v.name, model, GetEntityHeading(vehicle), vehicleProps, vehicle,v.x, v.y, v.z, result)
									end
								end
							end

							if IsControlJustReleased(0, 47) and IsPedInAnyVehicle(ped) then
								local vehicle = GetVehiclePedIsIn(ped)
								FreezeEntityPosition(vehicle, false)
								local he = GetEntityHeading(vehicle)
								local getcarcoords = GetEntityCoords(vehicle)
								TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
								TriggerServerEvent("prp:takecarinfo", v.name, he, getcarcoords)
							end

							if IsControlJustReleased(0, 74) and IsPedInAnyVehicle(ped) then
								if v.price > 0 then
									local vehicle = GetVehiclePedIsIn(ped)
									local vehicleProps = PRPCore.Functions.GetVehicleProperties(vehicle)
									local newplate = GeneratePlate()
									SetVehicleNumberPlateText(vehicle, newplate)
									vehicleProps.plate = GetVehicleNumberPlateText(vehicle)
									TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
									local carname = GetDisplayNameFromVehicleModel(vehicleProps.model)
									if carname == "WASHINGT" then
										carname = "WASHINGTON"
									end

									if carname == "CARBONIZ" then
										carname = "CARBONIZZARE"
									end

									if carname == "BUCCANEE" then
										carname = "BUCCANEER2"
									end

									if carname == "FAGGION" then
										carname = "FAGGIO"
									end

									if carname == "CARBON" then
										carname = "CARBONRS"
									end

									if carname == "COGCABRI" then
										carname = "COGCABRIO"
									end

								TriggerServerEvent("prp:setVehicleOwned", vehicleProps, vehicleProps.model,v.name, v.price, vector3(v.x,v.y,v.z), GetEntityHeading(vehicle))
								end
							end
--[[
							if IsControlJustReleased(0, 29) and IsPedInAnyVehicle(ped) then
								if v.price > 0 then
									local vehicle = GetVehiclePedIsIn(ped)
									
									local vehicleProps = PRPCore.Functions.GetVehicleProperties(vehicle)
									local newplate = GeneratePlate()
									SetVehicleNumberPlateText(vehicle, newplate)
									vehicleProps.plate = GetVehicleNumberPlateText(vehicle)

									TriggerServerEvent("prp:setVehicleOwnedfinancial", vehicleProps, GetDisplayNameFromVehicleModel(vehicleProps.model), v.price, v.name, vector3(v.x,v.y,v.z), GetEntityHeading(vehicle))
								end
							end
]]						end
					end
				end

				for _,v in pairs(Config.webpages) do
					local ped = GetPlayerPed(-1)
					local x,y,z = table.unpack(GetEntityCoords(ped, true))
					local distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z)
					if distance <= 1.3 then
						sleep = 0
						PRPCore.Functions.DrawText3D(v.x, v.y, v.z + 0.6, "[~r~Menu~w~] ~n~ Press [~g~E~w~] to open the [~g~Website~w~]")
						if distance <= 1.3 then
							if IsControlJustReleased(0, 38) and PlayerData.job.grade.level == 4 then
								PRPCore.Functions.TriggerCallback("prp:getAllInfoHtml",function(Customers, Vehicles, CompanyInfo, Employers, CarSoldList, CCount, VCount, ECount, CSoldCount)
									SetNuiFocus( true, true )
									SendNUIMessage({
										showPlayerMenu = true,
										Clist = Customers,
										Vlist = Vehicles,
										COlist = CompanyInfo,
										ClistCount = CCount,
										VlistCount = VCount,
										Elist = Employers,
										ElistCount = ECount,
										CSoldlist = CarSoldList,
										CSoldlistCount = CSoldCount,
										User = "boss"
									})
								end)
							elseif IsControlJustReleased(0, 38) then
								PRPCore.Functions.TriggerCallback("prp:getAllInfoHtml",function(Customers, Vehicles, CompanyInfo, Employers, CarSoldList, CCount, VCount, ECount, CSoldCount)
									SetNuiFocus( true, true )
									SendNUIMessage({
										showPlayerMenu = true,
										Clist = Customers,
										Vlist = Vehicles,
										COlist = CompanyInfo,
										ClistCount = CCount,
										VlistCount = VCount,
										Elist = Employers,
										ElistCount = ECount,
										CSoldlist = CarSoldList,
										CSoldlistCount = CSoldCount,
										User = "notboss"
									})
								end)
							end
						end
					end
				end
					

				local ped = GetPlayerPed(-1)
				local x,y,z = table.unpack(GetEntityCoords(ped, true))
				local distance = GetDistanceBetweenCoords(x, y, z, -770.05816650391, -223.56993103027, 37.408218383789)
				if distance <= 3 then
					sleep = 0
					PRPCore.Functions.DrawText3D(-770.05816650391, -223.56993103027, 37.408218383789 + 0.2, "[~r~Menu~w~] ~n~ Press [~g~E~w~] to see the [~g~Stock~w~]")
					if IsControlJustReleased(0, 38) then
						WarMenu.OpenMenu('STOCK_MENU')
					end
				end

				local ped = GetPlayerPed(-1)
				local x,y,z = table.unpack(GetEntityCoords(ped, true))
				local distance = GetDistanceBetweenCoords(x, y, z, -763.83752441406, -226.50738525391, 36.527545928955)
				if distance <= 3 then
					sleep = 0
					PRPCore.Functions.DrawText3D(-763.83752441406, -226.50738525391, 36.527545928955 + 0.2, "[~r~Menu~w~] ~n~ Press [~g~E~w~] to delete the vehicle")
					if IsControlJustReleased(0, 38) then
						DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
					end 
				end

				--local ped = GetPlayerPed(-1)
				--local x,y,z = table.unpack(GetEntityCoords(ped, true))
				--local distance = GetDistanceBetweenCoords(x, y, z, -782.30596923828, -213.86328125, 37.152755737305)
				--if distance <= 3 then
				--	sleep = 0
				--	PRPCore.Functions.DrawText3D(-782.30596923828, -213.86328125, 37.152755737305 + 0.2, "[~r~Menu~w~] ~n~ Press [~g~E~w~] to open catalog")
				--	if IsControlJustReleased(0, 38) then
				--		PRPCore.Functions.TriggerCallback("prp:getAllInfoHtmlCat",function(Customers, Vehicles, CompanyInfo, Employers, CarSoldList, CCount, VCount, ECount, CSoldCount)
				--			SetNuiFocus( true, true )
				--			SendNUIMessage({
				--				showPlayerMenu = true,
				--				Clist = Customers,
				--				Vlist = Vehicles,
				--				COlist = CompanyInfo,
				--				ClistCount = CCount,
				--				VlistCount = VCount,
				--				Elist = Employers,
				--				ElistCount = ECount,
				--				CSoldlist = CarSoldList,
				--				CSoldlistCount = CSoldCount,
				--				User = "catalog"
				--			})
				--		end)
				--	end
				--end
			else
				for _,v in pairs(Config.showcase) do
					local ped = GetPlayerPed(-1)
					local x,y,z = table.unpack(GetEntityCoords(ped, true))
					local distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z)
					if distance <= 1.3 and IsPedInAnyVehicle(ped) then
						sleep = 0
						PRPCore.Functions.DrawText3D(v.x, v.y, v.z + 1.6, "[~g~"..v.price.."$~w~] ~n~ Press [~g~E~w~] to buy the car from the [~g~Stand~w~]")
						--PRPCore.Functions.DrawText3D(v.x, v.y, v.z + 1.38, "Press [~g~G~w~] to pay for the car [~g~Financially~w~]")
						if distance <= 1.3 then
							if IsControlJustReleased(0, 38) and IsPedInAnyVehicle(ped) then
								if v.price > 0 then
									local vehicle = GetVehiclePedIsIn(ped)
									local vehicleProps = PRPCore.Functions.GetVehicleProperties(vehicle)
									
									-- here is where we check that the vehicle that's being driven is the same that is on the slot
									if ExecuteIntegrityCheck(vehicle,vehicleProps,v.name) == true then
										local vehicleProps = PRPCore.Functions.GetVehicleProperties(vehicle)
										local newplate = GeneratePlate()
										SetVehicleNumberPlateText(vehicle, newplate)
										vehicleProps.plate = GetVehicleNumberPlateText(vehicle)
										TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
										local carname = GetDisplayNameFromVehicleModel(vehicleProps.model)
										if model == "WASHINGT" then
											model = "WASHINGTON"
										end

										if model == "CARBONIZ" then
											model = "CARBONIZZARE"
										end

										if model == "BUCCANEE" then
											model = "BUCCANEER2"
										end

										if model == "FAGGION" then
											model = "FAGGIO"
										end

										if model == "CARBON" then
											model = "CARBONRS"
										end	

										if model == "COGCABRI" then
											model = "COGCABRIO"
										end

										TriggerServerEvent("prp:setVehicleOwned", vehicleProps, vehicleProps.model,v.name, v.price, vector3(v.x,v.y,v.z), GetEntityHeading(vehicle))
									else
										PRPCore.Functions.Notify('Unknown error occured while trying to buy this vehicle, make sure the price is above $100', 'error')
									end
								end
							end
--[[
							if IsControlJustReleased(0, 47) and IsPedInAnyVehicle(ped) then
								if v.price > 0 then
									local vehicle = GetVehiclePedIsIn(ped)
									
									local vehicleProps = PRPCore.Functions.GetVehicleProperties(vehicle)
									local newplate = GeneratePlate()
									SetVehicleNumberPlateText(vehicle, newplate)
									vehicleProps.plate = GetVehicleNumberPlateText(vehicle)

									TriggerServerEvent("prp:setVehicleOwnedfinancial", vehicleProps, GetDisplayNameFromVehicleModel(vehicleProps.model), v.price, v.name, vector3(v.x,v.y,v.z), GetEntityHeading(vehicle))
								end
							end
]]						end
					end
				end
				--local ped = GetPlayerPed(-1)
				--local x,y,z = table.unpack(GetEntityCoords(ped, true))
				--local distance = GetDistanceBetweenCoords(x, y, z, -798.61, -200.75, 37.16)
				--if distance <= 3 then
				--	sleep = 0
				--	PRPCore.Functions.DrawText3D(-798.61, -200.75, 37.16 + 0.2, "[~r~Menu~w~] ~n~ Press [~g~E~w~] to open catalog")
				--	if IsControlJustReleased(0, 38) then
				--		PRPCore.Functions.TriggerCallback("prp:getAllInfoHtmlCat",function(Customers, Vehicles, CompanyInfo, Employers, CarSoldList, CCount, VCount, ECount, CSoldCount)
				--			SetNuiFocus( true, true )
				--			SendNUIMessage({
				--				showPlayerMenu = true,
				--				Clist = Customers,
				--				Vlist = Vehicles,
				--				COlist = CompanyInfo,
				--				ClistCount = CCount,
				--				VlistCount = VCount,
				--				Elist = Employers,
				--				ElistCount = ECount,
				--				CSoldlist = CarSoldList,
				--				CSoldlistCount = CSoldCount,
				--				User = "catalog"
				--			})
				--		end)
				--	end
				--end
			end
		end
		Citizen.Wait(sleep)
	end
end)

------------
-- Events --
------------
RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
	isLoggedIn = true
	PlayerData = PRPCore.Functions.GetPlayerData()
	RemoveVehicles()

	Citizen.Wait(500)

	TriggerServerEvent("prp:AskToSpawnVehicles")
	if not DoesBlipExist(pdmBlip) then
		pdmBlip = addBlip(vector3(-792.19519042969, -223.58055114746, 37.152763366699), 225, 0, "Sunrise Auto")
	end
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
	isLoggedIn = false
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function()
	PlayerData = PRPCore.Functions.GetPlayerData()
end)

RegisterNetEvent('prp:SpawnVehicles')
AddEventHandler('prp:SpawnVehicles', function()
	SpawnVehicles()
end)

RegisterNetEvent('prp:refreshmoney')
AddEventHandler('prp:refreshmoney', function(comoney)
	SendNUIMessage({
		showPlayerMenu = "refreshmoney",
		comoney = comoney
	})
end)

RegisterNetEvent('prp:sendnewempinfo')
AddEventHandler('prp:sendnewempinfo', function(emplist, empcount)
	SendNUIMessage({
		showPlayerMenu = "addemp",
		Elist = emplist,
		ElistCount = empcount
	})
end)

RegisterNetEvent('prp:refreshslot')
AddEventHandler('prp:refreshslot', function(slot)
	for _, v in pairs(Config.showcase) do 
		if v.name == slot then
			v.price = 0
		end
	end
	RemoveVehicles(slot)
end)

RegisterNetEvent('prp:spawnnewvehslot')
AddEventHandler('prp:spawnnewvehslot', function(vehdata, model, heading, carcoords)
	local ped = GetPlayerPed(-1)
	PRPCore.Functions.SpawnVehicle(GetHashKey(model), function(vehicle)
		local peddata = GetPlayerPed(-1)
		SetEntityHeading(vehicle, round(heading, 2))
		SetPedIntoVehicle(peddata, vehicle, -1)
		PRPCore.Functions.SetVehicleProperties(vehicle, vehdata)
		FreezeEntityPosition(vehicle, false)
		SetEntityAsMissionEntity(vehicle, true, true)
	end, {x = carcoords.x, y = carcoords.y, z = carcoords.z, a = heading}, true)

	local getvehicle = GetVehiclePedIsIn(ped)
	PRPCore.Functions.SetVehicleProperties(getvehicle, vehdata)
end)


RegisterNetEvent('prp:setpricetoeveryone')
AddEventHandler('prp:setpricetoeveryone', function(price, slot)
	for _, v in pairs(Config.showcase) do 
		if v.name == slot then
			v.price = price
		end
	end
end)

RegisterNetEvent('prp:spawnnewvehbuy')
AddEventHandler('prp:spawnnewvehbuy', function(vehdata, model, heading, carcoords)
	PRPCore.Functions.SpawnVehicle(GetHashKey(model), function(vehicle)
		local peddata = GetPlayerPed(-1)
		SetEntityHeading(vehicle, round(heading, 2))
		SetPedIntoVehicle(peddata, vehicle, -1)
		PRPCore.Functions.SetVehicleProperties(vehicle, vehdata)
		FreezeEntityPosition(vehicle, false)
		SetEntityAsMissionEntity(vehicle, true, true)
	end, {x = carcoords.x, y = carcoords.y, z = carcoords.z, a = carcoords.heading}, true)

	local getvehicle = GetVehiclePedIsIn(PlayerPedId())
	PRPCore.Functions.SetVehicleProperties(getvehicle, vehdata)
end)


RegisterNetEvent('prp:teleportcarslot')
AddEventHandler('prp:teleportcarslot', function(hash, x,y,z, h, vehdata, slot)

	DeleteVehicle(lastvehicle)
	lastvehicle = 0

	if hash == "-1692411346" then
		hash = "736902334"
	end

	PRPCore.Functions.SpawnVehicle(hash, function(vehicle)
		PRPCore.Functions.SetVehicleProperties(vehicle, vehdata)
		FreezeEntityPosition(vehicle, true)
		SetEntityAsMissionEntity(vehicle, true, true)
	end, {x = x, y = y, z = z, a = h}, true)

end)

RegisterNetEvent('prp-vehicleshop:client:sendMailBuyer')
AddEventHandler('prp-vehicleshop:client:sendMailBuyer', function(plate)
	SetTimeout(math.random(2500, 4000), function()
		local buyer = PRPCore.Functions.GetPlayerData()
		local gender = "Mr."
        if buyer.charinfo.gender == 1 then
            gender = "Miss."
        end
        local charinfo = buyer.charinfo
        local plate = plate
        TriggerServerEvent('prp-phone:server:sendNewMailToOffline', buyer.citizenid,  {
            sender = "Premium Deluxe Motorsports",
            subject = "Vehicle Purchase",
            message = "Dear " .. gender .. " " .. charinfo.lastname .. ",<br /><br />Thank you for purchasing from <br />PDM.<br /><br />The license plate is <strong>"..plate.."</strong> and is now in your name.<br /><br/>Sincerely,<br /> PDM <br/><br/><img src=https://vignette.wikia.nocookie.net/gtawiki/images/2/24/PremiumDeluxeMotorsport-GTAV-PDMSign.PNG/revision/latest?cb=20180804184510 width=200 height=50>",
        })
    end)
end)

RegisterNetEvent('prp_vehicleshop:client:ShowHelpNui')
AddEventHandler('prp_vehicleshop:client:ShowHelpNui', function()
	SetNuiFocus( false, false )
	SendNUIMessage({
		showPlayerMenu = false
	})
	menuEnabled = false
end)

RegisterNetEvent("prp:deletevehiclepedisin")
AddEventHandler("prp:deletevehiclepedisin", function()
	local me = PlayerPedId()
	local veh = GetVehiclePedIsIn(me, false)
	DeleteEntity(veh)
end)

RegisterNetEvent("prp_vehicleshop:client:OpenCatalogue")
AddEventHandler("prp_vehicleshop:client:OpenCatalogue", function()
	PRPCore.Functions.TriggerCallback("prp:getAllInfoHtmlCat",function(Customers, Vehicles, CompanyInfo, Employers, CarSoldList, CCount, VCount, ECount, CSoldCount)
		SetNuiFocus( true, true )
		SendNUIMessage({
			showPlayerMenu = true,
			Clist = Customers,
			Vlist = Vehicles,
			COlist = CompanyInfo,
			ClistCount = CCount,
			VlistCount = VCount,
			Elist = Employers,
			ElistCount = ECount,
			CSoldlist = CarSoldList,
			CSoldlistCount = CSoldCount,
			User = "catalog"
		})
	end)
end)






-------------------
-- NUI Callbacks --
-------------------
RegisterNUICallback('closeButton', function(data, cb)
	SetNuiFocus( false, false )
	SendNUIMessage({
		showPlayerMenu = false
	})
  	cb('ok')
end)


RegisterNUICallback('buycompanycar', function(data, cb)
	TriggerServerEvent("prp:addstockcar", data.model)
  	cb('ok')
end)

RegisterNUICallback('removeemployer', function(data, cb)
	TriggerServerEvent("prp:removeemployer", data.name)
  	cb('ok')
end)

RegisterNUICallback('removecustomer', function(data, cb)
	TriggerServerEvent("prp:removecustomer", data.plate)
  	cb('ok')
end)

RegisterNUICallback('addemployer', function(data, cb)
	TriggerServerEvent("prp:addemployer", data.id)
  	cb('ok')
end)

RegisterNUICallback('addmoneycmp', function(data, cb)
	TriggerServerEvent("prp:addmoneycmp", data.amount)
  	cb('ok')
end)

RegisterNUICallback('removemoneycmp', function(data, cb)
	TriggerServerEvent("prp:removemoneycmp", data.amount)
  	cb('ok')
end)

RegisterNUICallback('testdrivecar', function(data, cb)
	SetNuiFocus( false, false )
	SendNUIMessage({
		showPlayerMenu = false
	})
	PRPCore.Functions.SpawnVehicle(GetHashKey(data.model), function(vehicle)
		SetVehicleEngineOn(vehicle, true, true)
		TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
		SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
		SetEntityAsMissionEntity(vehicle, true, true)
	end, {x = -758.0, y = -235.69, z = 37.28, a = 204.2}, true)
	TriggerEvent('prp-svmod:client:FullyUpgradeCar')
  	cb('ok')
end)


---------------
-- Functions --
---------------
function GeneratePlate()
	local generatedPlate
	local doBreak = false
	math.randomseed(GetGameTimer())
		generatedPlate = string.upper(GetRandomLetter(4) .. '' .. GetRandomNumber(4))

	PRPCore.Functions.TriggerCallback("prp:isPlateTaken", function (isPlateTaken)
		if not isPlateTaken then
			doBreak = true
		end
	end, generatedPlate)
	Wait(300)
	if doBreak then
		return generatedPlate
	else
		return GeneratePlate()
	end
end

-- This makes sure it is the right car in the right slot.
function ExecuteIntegrityCheck(vehicle,vehicleProps, slot)
	local model = vehicleProps.model
	if model == "WASHINGT" then
		model = "WASHINGTON"
	end

	if model == "CARBONIZ" then
		model = "CARBONIZZARE"
	end

	if model == "BUCCANEE" then
		model = "BUCCANEER2"
	end

	local callback = false
	PRPCore.Functions.TriggerCallback("prp:getvehicles", function(vehicles)
		for _,v in pairs(vehicles) do
			if string.match(v["nome"], "slot") then
				--print('String matched...')
				local slotCar = v["hash"]
				local price = tonumber(v["price"])
				--print('slotCar = '..slotCar..' model = '.. model..' slot should be ' .. v["nome"].. " but it's ".. slot.. " And the price is ".. price)
				--print(lotCar == model)
				--print(v["nome"] == slot)
				--print(price > 100)
				if (slotCar == model) and (v["nome"] == slot) and (price > 100) then
					print('All good, Executing purchase...')
					callback = true
				end
			end
		end
	end)
	Citizen.Wait(1000)

	if callback == true then
		return true
	end

	return false
end

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing
function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*14
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+1, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function SpawnVehicles()
	PRPCore.Functions.TriggerCallback("prp:getvehicles", function(vehicles)
		for _,v in pairs(vehicles) do
			for _,vv in pairs(VehPos) do
				if vv.name == v.nome then
					vv.price = v.price
					PRPCore.Functions.SpawnVehicle(v.car, function(vehicle)
						PRPCore.Functions.SetVehicleProperties(vehicle, v.vehicleprops)
						FreezeEntityPosition(vehicle, true)
						SetEntityAsMissionEntity(vehicle, true, true)
					end, {x = vv.x, y = vv.y, z = vv.z, a = v.h}, true)
				end
			end
		end
	end)

end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

LoadModel = function(model)
	while not HasModelLoaded(model) do
		RequestModel(model)

		Citizen.Wait(1)
	end
end

function RemoveVehicles(slot)
	if slot == nil then
		for i = 1, #VehPos, 1 do
			local vehicles        = PRPCore.Functions.GetVehicles()
			local closestDistance = -1
			local closestVehicle  = -1
			local coords          = vector3(VehPos[i].x, VehPos[i].y, VehPos[i].z)

			if coords == nil then
				local playerPed = GetPlayerPed(-1)
				coords          = GetEntityCoords(playerPed)
			end

			for i=1, #vehicles, 1 do
				local vehicleCoords = GetEntityCoords(vehicles[i])
				local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

				if closestDistance == -1 or closestDistance > distance then
					closestVehicle  = vehicles[i]
					closestDistance = distance
				end
			end

			if DoesEntityExist(closestVehicle) and closestDistance <= 3.0 then
				DeleteEntity(closestVehicle)
				--print('deleted something without slot')
			end
		end
	else
		for i = 1, #VehPos, 1 do
			if VehPos[i].name == slot then
				local vehicles        = PRPCore.Functions.GetVehicles()
				local closestDistance = -1
				local closestVehicle  = -1
				local coords          = vector3(VehPos[i].x, VehPos[i].y, VehPos[i].z)
	
				if coords == nil then
					local playerPed = GetPlayerPed(-1)
					coords          = GetEntityCoords(playerPed)
				end
	
				for i=1, #vehicles, 1 do
					local vehicleCoords = GetEntityCoords(vehicles[i])
					local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)
	
					if closestDistance == -1 or closestDistance > distance then
						closestVehicle  = vehicles[i]
						closestDistance = distance
					end
				end
	
				if DoesEntityExist(closestVehicle) and closestDistance <= 1.0 then
					DeleteEntity(closestVehicle)
					--print('deleted something with slot')
				end
			end
		end
	end
	
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function CreateWarMenu(id, title, subtitle)--, pos, width, rgba)
	--local x,y = table.unpack(pos)
	--local r,g,b,a = table.unpack(rgba)
	WarMenu.CreateMenu(id, title)
	WarMenu.SetSubTitle(id, subtitle)
	--WarMenu.SetMenuX(id, x)
	--WarMenu.SetMenuY(id, y)
	--WarMenu.SetMenuWidth(id, width)
	--WarMenu.SetTitleBackgroundColor(id, r, g, b, a)
	--WarMenu.SetTitleColor(id, 255, 255, 255, a)
end

function GetStockVehicles()
	local rtval = nil
	PRPCore.Functions.TriggerCallback("prp:getstockcars",function(vehicles)
		print(vehicles)
		rtval = vehicles
	end)
	while rtval == nil do
		Wait(100)
	end
	return rtval
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
	  return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
	  return ''
	end
end
  
function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
	  return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
	  return ''
	end
end

function GetSharedVehicles()
	local rtval = nil
	PRPCore.Functions.TriggerCallback("prp:getAllcarsteste",function(vehiclest)
		rtval = vehiclest
	end)
	while rtval == nil do
		Wait(50)
	end
	return rtval
end

addBlip = function(coords, sprite, colour, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
	SetBlipScale  (blip, 0.65)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    return blip
end


function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end
