PRPCore           = nil
local _isLoggedIn = false
local _playerData = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if PRPCore == nil then
            TriggerEvent("PRPCore:GetObject", function(o)
                PRPCore = o
            end)
            Citizen.Wait(200)
        end
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

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if _isLoggedIn then
            local pos = GetEntityCoords(GetPlayerPed(-1))

            for _, stash in ipairs(PRPStashes.stashes) do
                local canAccess = false

                for _, jobData in ipairs(stash.restrictions.jobs) do
                    if _playerData.job.name == jobData.name and _playerData.job.grade.level >= jobData.minGrade then
                        canAccess = true
                        goto open
                    end
                end

                :: open ::
                if not canAccess then
                    goto nextStash
                end

                local dist = #(pos - stash.coords)
                if dist <= stash.seeDist then
                    if dist <= stash.useDist then
                        PRPCore.Functions.DrawText3D(
                                stash.coords.x,
                                stash.coords.y,
                                stash.coords.z,
                                ("~g~[%s]~w~ - %s"):format(stash.useKey, stash.label)
                        )

                        if IsControlJustReleased(0, PRPStashes.keys[stash.useKey]) then
                            TriggerServerEvent(
                                    "prp-log:server:CreateLog",
                                    "passcodes",
                                    "Opened Stash",
                                    "red",
                                    ("%s opened the %s stash"):format(
                                            GetPlayerName(PlayerId()),
                                            stash.label
                                    )
                            )
                            TriggerEvent("inventory:client:SetCurrentStash", stash.uid)
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", stash.uid, {
                                maxweight = stash.kg * 1000,
                                slots     = stash.slots,
                            })
                        end
                    else
                        PRPCore.Functions.DrawText3D(
                                stash.coords.x,
                                stash.coords.y,
                                stash.coords.z,
                                ("%s"):format(stash.label)
                        )
                    end
                end

                :: nextStash ::
            end
        else
            Citizen.Wait(5000)
        end
    end
end)