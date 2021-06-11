PRPCore = nil

setonce = false
setonce2 = false
hasbeenarmed = false
armedVeh = 0
detoVeh = 0
detonated = false

Citizen.CreateThread(function()
  while PRPCore == nil do
    TriggerEvent('PRPCore:GetObject', function(obj) PRPCore = obj end)
    Citizen.Wait(200)
  end
end)


RegisterNetEvent('Kroviox:freemanpussy')
AddEventHandler('Kroviox:freemanpussy', function()
  setonce = false
  setonce2 = false
  hasbeenarmed = false
  armedVeh = 0
  detoVeh = 0
  detonated = false
  local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
  local anim = "weed_spraybottle_crouch_base_inspector"
  local ped = GetPlayerPed(-1)
  local coords = GetEntityCoords(ped)
  local veh = GetClosestVehicle(coords.x, coords.y, coords.z, 3.000, 0, 70)
  local vCoords = GetEntityCoords(veh)
  local dist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, vCoords.x, vCoords.y, vCoords.z, false)

  if not IsPedInAnyVehicle(ped, false) then
    if veh and (dist < 3.0) then
      loadAnimDict(animDict)
      Citizen.Wait(1000)
      TaskPlayAnim(ped, animDict, anim, 3.0, 1.0, -1, 0, 1, 0, 0, 0)
      PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
      PRPCore.Functions.Progressbar("arm_vehicle", "applying bomb", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {}, {}, {}, function() -- Done
        armedVeh = veh
        TriggerServerEvent('Kroviox:freemanstillpussy')
        PlaySoundFrontend( -1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1 )
      end)
    else
      PRPCore.Functions.Notify("No Vehicle Nearby", "error")
    end
  else
    PRPCore.Functions.Notify("Can't do this inside", "error")
    end
  end)

  function DetonateVehicle(veh)
    local vCoords = GetEntityCoords(veh)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local msg = streetLabel
    local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    if DoesEntityExist(veh) then
      if not detonated then
      AddExplosion(vCoords.x, vCoords.y, vCoords.z, 5, 50.0, true, false, true)
      TriggerServerEvent("Kroviox:explioded", pos, msg, street1, street2)
      end
    end
  end


Citizen.CreateThread(function()
  while true do
    while armedVeh do
            Citizen.Wait(1)
            local SPeed = GetEntitySpeed(armedVeh)
            local speed = SPeed * 2.236936

            if armedVeh and speed > 60 then
                if not setonce then
                PlaySoundFrontend( -1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1 )
                setonce = true
                hasbeenarmed = true
                detoVeh = armedVeh
                end
            end

            if detoVeh and hasbeenarmed then
              if not setonce2 then
                if speed < 60 then
                  DetonateVehicle(armedVeh)
                  setonce2 = true
                end
              end
            end
    end
  end
end)

  function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
      RequestAnimDict(dict)
      Citizen.Wait(20)
    end
  end
  -- voor in de loop als bomb activated is.
  -- missionText("A Speed Bomb is active on this vehicle!")
  function missionText(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
  end
