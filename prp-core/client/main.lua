PRPCore = {}
PRPCore.PlayerData = {}
PRPCore.Config = PRPConfig
PRPCore.Shared = PRPShared
PRPCore.ServerCallbacks = {}

isLoggedIn = false

function GetCoreObject()
	return PRPCore
end

RegisterNetEvent('PRPCore:GetObject')
AddEventHandler('PRPCore:GetObject', function(cb)
	cb(GetCoreObject())
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
	ShutdownLoadingScreenNui()

	isLoggedIn = true
	TriggerEvent('chatMessage', "Info", "error", "Type the /help command to get started!")
	Wait(500)
	TriggerServerEvent('PRPCore:Server:OnPlayerLoad')
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)
