PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent("prp-cards:client:ShowPilotSTTicket")
AddEventHandler("prp-cards:client:ShowPilotSTTicket", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Expiration date:</strong> {4}</div></div>',
            args = {'Sisyphus Theatre ticket', character.firstname, character.lastname, character.birthdate, character.expire}
        })
    end
end)

RegisterNetEvent("prp-cards:client:ShowVUNenbership")
AddEventHandler("prp-cards:client:ShowVUNenbership", function(coords, citizenid, character)
    local sourcePos = coords
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First name:</strong> {1} <br><strong>Surname:</strong> {2} <br><strong>Birthdate:</strong> {3} <br><strong>Date:</strong> {4}</div></div>',
            args = {'VU Membership card', character.firstname, character.lastname, character.birthdate, character.expire}
        })
    end
end)