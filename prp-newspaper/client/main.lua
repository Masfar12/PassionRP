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
local guiEnabled = false
local newspaper = false
local endloop = false
local newsDict = "amb@world_human_tourist_map@female@base"
local newsAnim = "base"
Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNUICallback('CloseNews', function(data, cb)
    closeGui()
    endloop = true
    cb('ok')
end)

local newsStands = {
	[1] = 1211559620,
	[2] = -1186769817,
	[3] = -756152956,
    [4] = 720581693,
    [5] = -838860344,
}

function checkForNewsStand()
	for i = 1, #newsStands do
		local objFound = GetClosestObjectOfType( GetEntityCoords(PlayerPedId()), 3.0, newsStands[i], 0, 0, 0)
		if DoesEntityExist(objFound) then
			return true
		end
	end
	return false
end

RegisterNetEvent('prp-newspaper:client:CheckNewsStand')
AddEventHandler('prp-newspaper:client:CheckNewsStand', function()
    if checkForNewsStand() then
        openGui()
	else
		PRPCore.Functions.Notify('You\'re not near a newstand', 'error')
    end
end)

RegisterNetEvent('prp-newspaper:client:CheckNews')
AddEventHandler('prp-newspaper:client:CheckNews', function()
    openGui()
end)

function PlayAnim(bool)
    if bool and not newspaper then
        newspaper = true
        local playerPed = PlayerPedId()
        SetCurrentPedWeapon(playerPed, GetHashKey(weapon_unarmed), true)
        TriggerEvent("attachItem","newspaper01")
        Citizen.CreateThread(function()
            RequestAnimDict(newsDict)

            while not HasAnimDictLoaded(newsDict) do
                Citizen.Wait(150)
            end
            while newspaper do
                Citizen.Wait(100)
                playerPed = PlayerPedId()

                if not IsEntityPlayingAnim(playerPed, newsDict, newsAnim, 3) then
                    TaskPlayAnim(playerPed, newsDict, newsAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                end
            end

            ClearPedSecondaryTask(playerPed)

            Citizen.Wait(450)
        end)

    elseif not toggle and newspaper then
        TriggerEvent("destroyProp")
        ClearPedTasks(PlayerPedId())
        newspaper = false
    end
end

function openGui()
    guiEnabled = true
    SetNuiFocus(true,true)
    PlayAnim(true)
    TriggerEvent("inmenu",true)
    SetPlayerControl(PlayerId(), 0, 0)
    PRPCore.Functions.TriggerCallback('prp-newspaper:server:getPlayers', function(players)
        if players ~= nil then
            SendNUIMessage({
                action = "OpenNews",
                JailedPlayers = players
            })
        end
    end)
end

function closeGui()
    --SendNUIMessage({action = "CloseNews"})
    endloop = true
    guiEnabled = false
    SetNuiFocus(false,false)
    TriggerEvent("inmenu",false)
    PlayAnim(false)
    Wait(250)
    ClearPedTasks(PlayerPedId())
    SetPlayerControl(PlayerId(), 1, 0)
end