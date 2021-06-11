local savedHat = { propIndex = -1, textureIndex = -1 }
local savedGlasses = { propIndex = -1, textureIndex = -1 }
local savedMask = -1

Citizen.CreateThread(function()
    while true do
        local data = getPropData()

        if savedHat.propIndex ~= data.hat.prop and data.hat.prop ~= -1 then
            savedHat.propIndex = data.hat.prop
            savedHat.textureIndex = data.hat.texture
        end

        if savedGlasses.propIndex ~= data.glasses.prop and data.glasses.prop ~= -1 then
            savedGlasses.propIndex = data.glasses.prop
            savedGlasses.textureIndex = data.glasses.texture
        end

        if savedMask ~= data.mask and data.mask ~= 0 then
            savedMask = data.mask
        end

        Wait(1000)
    end
end)

function getPropData()
    local ped = GetPlayerPed(-1)

    return {
        hat = {
            prop = GetPedPropIndex(ped, 0),
            texture = GetPedPropTextureIndex(ped, 0)
        },
        glasses = {
            prop = GetPedPropIndex(ped, 1),
            texture = GetPedPropTextureIndex(ped, 1)
        },
        mask = GetPedDrawableVariation(ped, 1),
    }
end

RegisterCommand("putonhat", function()
    SetPedPropIndex(GetPlayerPed(-1), 0, savedHat.propIndex, savedHat.textureIndex)
end)

RegisterCommand("putonglasses", function()
    SetPedPropIndex(GetPlayerPed(-1), 1, savedGlasses.propIndex, savedGlasses.textureIndex, true)
end)

RegisterCommand("putonmask", function()
    SetPedComponentVariation(GetPlayerPed(-1), 1, savedMask, 0, 2)
end)