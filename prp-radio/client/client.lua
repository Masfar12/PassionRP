PRPCore = nil

Citizen.CreateThread(function() 
  while PRPCore == nil do
      TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
      Citizen.Wait(200)
  end
end)

-- Code

local radioMenu = false
local isLoggedIn = false

function enableRadio(enable)
  if enable then
    SetNuiFocus(enable, enable)
    PhonePlayIn()
    SendNUIMessage({
      type = "open",
    })
    radioMenu = enable
  end
end

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

Citizen.CreateThread(function()
  while true do
    if PRPCore ~= nil then
      if isLoggedIn then
        PRPCore.Functions.TriggerCallback('prp-radio:server:GetItem', function(hasItem)
          if not hasItem then
            local playerName = GetPlayerName(PlayerId())
            local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

            if getPlayerRadioChannel ~= "nil" then
              exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
              exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
              PRPCore.Functions.Notify('You have been removed of the frequency!', 'error')
            end
          end
        end, "radio")
      end
    end

    Citizen.Wait(30000)
  end
end)

RegisterNUICallback('joinRadio', function(data, cb)
  local _source = source
  local PlayerData = PRPCore.Functions.GetPlayerData()
  local playerName = GetPlayerName(PlayerId())
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
print(dump(data))
  if tonumber(data.channel) <= Config.MaxFrequency then
    if tonumber(data.channel) ~= tonumber(getPlayerRadioChannel) then
      if tonumber(data.channel) <= Config.RestrictedChannels then
        if(PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'doctor') then
          exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
          exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
          exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel), "Radio", "radio")
          if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
            PRPCore.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
          else
            PRPCore.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
          end
        else
          PRPCore.Functions.Notify(Config.messages['restricted_channel_error'], 'error')
        end
      end

      if tonumber(data.channel) > Config.RestrictedChannels then
        exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
        exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
        exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel), "Radio", "radio")
        if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
          PRPCore.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
        else
          PRPCore.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
        end
      end
    else
      if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
        PRPCore.Functions.Notify(Config.messages['you_on_radio'] .. data.channel .. ' MHz </b>', 'error')
      else
        PRPCore.Functions.Notify(Config.messages['you_on_radio'] .. data.channel .. '.00 MHz </b>', 'error')
      end
    end
  else
    PRPCore.Functions.Notify('This frequency is not available.', 'error')
  end
  cb('ok')
end)

RegisterNUICallback('leaveRadio', function(data, cb)
  local playerName = GetPlayerName(PlayerId())
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
  if getPlayerRadioChannel == "nil" then
    PRPCore.Functions.Notify(Config.messages['not_on_radio'], 'error')
  else
    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
    if SplitStr(getPlayerRadioChannel, ".")[2] ~= nil and SplitStr(getPlayerRadioChannel, ".")[2] ~= "" then 
      PRPCore.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. ' MHz </b>', 'error')
    else
      PRPCore.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>', 'error')
    end
    
  end
  cb('ok')
end)

RegisterNUICallback('escape', function(data, cb)
  SetNuiFocus(false, false)
  radioMenu = false
  PhonePlayOut()
  cb('ok')
end)

RegisterNetEvent('prp-radio:use')
AddEventHandler('prp-radio:use', function()
  enableRadio(true)
end)

RegisterNetEvent('prp-radio:onRadioDrop')
AddEventHandler('prp-radio:onRadioDrop', function()
  local playerName = GetPlayerName(PlayerId())
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

  if getPlayerRadioChannel ~= "nil" then
    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
    PRPCore.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>', 'error')
  end
end)

RegisterNetEvent('prp-radio:radioSwitch')
AddEventHandler('prp-radio:radioSwitch', function(data)
  local _source = source
  local PlayerData = PRPCore.Functions.GetPlayerData()
  local playerName = GetPlayerName(PlayerId())
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
  if tonumber(data.channel) <= Config.MaxFrequency then
    if tonumber(data.channel) ~= tonumber(getPlayerRadioChannel) then
      if tonumber(data.channel) <= Config.RestrictedChannels then
        if(PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'doctor') then
          if PlayerData.job.onduty then
            exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
            exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
            exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel), "Radio", "radio")
            if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
              PRPCore.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
            else
              PRPCore.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
            end
          else
            PRPCore.Functions.Notify(Config.messages['you_off_duty'], 'error')
          end
        else
          PRPCore.Functions.Notify(Config.messages['restricted_channel_error'], 'error')
        end
      end

      if tonumber(data.channel) > Config.RestrictedChannels then
        exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
        exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
        exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel), "Radio", "radio")
        if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
          PRPCore.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
        else
          PRPCore.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
        end
      end
    else
      if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then 
        PRPCore.Functions.Notify(Config.messages['you_on_radio'] .. data.channel .. ' MHz </b>', 'error')
      else
        PRPCore.Functions.Notify(Config.messages['you_on_radio'] .. data.channel .. '.00 MHz </b>', 'error')
      end
    end
  else
    PRPCore.Functions.Notify('This frequency is not available.', 'error')
  end
end)

RegisterNetEvent("prp-radio:setRadioVolune")
AddEventHandler("prp-radio:setRadioVolune", function(volume)
  if volume ~= nil then
    if volume <= 100 and volume >= 0 then
      local volume = (volume - 50)

      exports.tokovoip_script:setRadioVolume(volume)

      TriggerEvent('PRPCore:Notify', "Volume set to: " .. volume + 50, "success")
    end
  end
end)

function SplitStr(inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end