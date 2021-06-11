Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

PRPCore = nil

Citizen.CreateThread(function()
	while PRPCore == nil do
		TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
		Citizen.Wait(0)
	end
	PlayerData = PRPCore.Functions.GetPlayerData()

	_PRPCrafting.Config.CraftingItems   = generateItemTable(_PRPCrafting.Config.CraftingItems)
	_PRPCrafting.Config.TempleItems     = generateItemTable(_PRPCrafting.Config.TempleItems)
	_PRPCrafting.Config.AmmunationItems = generateItemTable(_PRPCrafting.Config.AmmunationItems)
	_PRPCrafting.Config.FirearmItems    = generateItemTable(_PRPCrafting.Config.FirearmItems)
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    PlayerData = PRPCore.Functions.GetPlayerData()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

function DrawText3D(x, y, z, text)
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

local maxDistance = 1.25

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isLoggedIn then

			if PlayerData.job.name == "bennys" or PlayerData.job.name == "mechanic1" or PlayerData.job.name == "mechanic2" then

				local pos, awayFromObject = GetEntityCoords(GetPlayerPed(-1)), true
				local craftObject = GetClosestObjectOfType(pos, 2.0, -573669520, false, false, false)
				if craftObject ~= 0 then
					local objectPos = GetEntityCoords(craftObject)
					if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, objectPos.x, objectPos.y, objectPos.z, true) < 1.5 then
						awayFromObject = false
						DrawText3D(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~E~w~ - Craft")
						if IsControlJustReleased(0, 38) then
							local crafting = {}
							crafting.label = "Crafting"
							crafting.items = GetThresholdItems()
							TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99), crafting)
						end
					end
				end

				if awayFromObject then
					Citizen.Wait(1000)
				end
			else
				Wait(1000)
			end
		else
			Wait(250)
		end
	end
end)

function GetThresholdItems()
	local items = {}
	local curRep = PRPCore.Functions.GetPlayerData().metadata["craftingrep"]
	for k, item in pairs(_PRPCrafting.Config.CraftingItems) do
		if curRep >= _PRPCrafting.Config.CraftingItems[k].threshold then
			items[k] = _PRPCrafting.Config.CraftingItems[k]
		end
	end
	return items
end

function countTable(table)
	local n = 0
	for _ in pairs(table) do
		n = n + 1
	end
	return n
end

function getItemLabel(itemName)
	local item = PRPCore.Shared.Items[itemName:lower()]
	return item ~= nil and item.label or nil
end

function getCostString(costs)
	local out = ""
	local count = countTable(costs)

	local counter = 1
	for mat, n in pairs(costs) do
		out = string.format("%s%dx: %s", out, n, getItemLabel(mat))
		out = string.format("%s%s", out, counter == count and "." or "<br>")
		counter = counter + 1
	end

	return out
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

function generateItemTable(items)
	local out = {}

	for k, v in ipairs(items) do
		local itemInfo = PRPCore.Shared.Items[v.name:lower()]
		out[k]         = {
			name        = itemInfo.name,
			label       = itemInfo.label,
			amount      = tonumber(v.amount),
			info        = {
				costs = getCostString(v.costs),
			},
			description = itemInfo["description"] ~= nil and itemInfo.description or "",
			weight      = itemInfo.weight,
			type        = itemInfo.type,
			unique      = itemInfo.unique,
			useable     = itemInfo.useable,
			image       = itemInfo.image,
			slot        = k,
			costs       = v.costs,
			threshold   = v.threshold,
			points      = v.points,
		}
	end

	return out
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		local pos       = GetEntityCoords(GetPlayerPed(-1))

		local isInRange = false

		for _, loc in ipairs(_PRPCrafting.Config.Locations) do
			local dist = #(pos - loc.coords)
			if dist <= 1.5 then
				if loc.showHint then
					DrawText3D(loc.coords.x, loc.coords.y, loc.coords.z + 1.0, "~g~E~w~ - Craft")
				end
				isInRange = true
				if IsControlJustReleased(0, Keys.E) then
					local crafting = {
						label = loc.label,
                        items = _PRPCrafting.Config[loc.items],
					}
					TriggerServerEvent(
							"inventory:server:OpenInventory",
							loc.id,
							math.random(1, 99),
							crafting
					)
				end
			end
		end

		if not isInRange then
			Citizen.Wait(2000)
		end
	end
end)
