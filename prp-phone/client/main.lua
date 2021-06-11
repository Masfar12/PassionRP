PRPCore = nil

Citizen.CreateThread(function() 
    while PRPCore == nil do
        TriggerEvent("PRPCore:GetObject", function(obj) PRPCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

local PlayerJob = {}

phoneProp = 0
local ServiceAlerts = {}

PhoneData = {
    MetaData = {},
    isOpen = false,
    PlayerData = nil,
    Contacts = {},
    Tweets = {},
    MentionedTweets = {},
    Hashtags = {},
    Chats = {},
    Invoices = {},
    CallData = {},
    RecentCalls = {},
    Garage = {},
    Mails = {},
    Adverts = {},
    GarageVehicles = {},
    Gallery = {},
    AnimationData = {
        lib = nil,
        anim = nil,
    },
    SuggestedContacts = {},
    CryptoTransactions = {},
    DWChats = {},
    appKeys = {},
    jobOffers = {},
}

RegisterNetEvent('prp-phone:client:RaceNotify')
AddEventHandler('prp-phone:client:RaceNotify', function(message)
    if PhoneData.isOpen then
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Carrera",
                text = message,
                icon = "fas fa-flag-checkered",
                color = "#353b48",
                timeout = 1500,
            },
        })
    else
        SendNUIMessage({
            action = "Notification",
            NotifyData = {
                title = "Race", 
                content = message, 
                icon = "fas fa-flag-checkered", 
                timeout = 3500, 
                color = "#353b48",
            },
        })
    end
end)

RegisterNetEvent('prp-phone:client:AddRecentCall')
AddEventHandler('prp-phone:client:AddRecentCall', function(data, time, type)
    table.insert(PhoneData.RecentCalls, {
        name = IsNumberInContacts(data.number),
        time = time,
        type = type,
        number = data.number,
        anonymous = data.anonymous
    })
    TriggerServerEvent('prp-phone:server:SetPhoneAlerts', "phone")
    Config.PhoneApplications["phone"].Alerts = Config.PhoneApplications["phone"].Alerts + 1
    SendNUIMessage({ 
        action = "RefreshAppAlerts",
        AppData = Config.PhoneApplications
    })
end)

RegisterNetEvent('PRPCore:Client:OnJobUpdate')
AddEventHandler('PRPCore:Client:OnJobUpdate', function(JobInfo)
    if JobInfo.name == "police" then
        SendNUIMessage({
            action = "UpdateApplications",
            JobData = JobInfo,
            applications = Config.PhoneApplications,
            appKeys = PhoneData.appKeys
        })
    elseif PlayerJob.name == "police" and JobInfo.name == "unemployed" then
        SendNUIMessage({
            action = "UpdateApplications",
            JobData = JobInfo,
            applications = Config.PhoneApplications,
            appKeys = PhoneData.appKeys
        })
    end

    PlayerJob = JobInfo
    ServiceAlerts = {}
end)

RegisterNUICallback('ClearRecentAlerts', function(data, cb)
    TriggerServerEvent('prp-phone:server:SetPhoneAlerts', "phone", 0)
    Config.PhoneApplications["phone"].Alerts = 0
    SendNUIMessage({ action = "RefreshAppAlerts", AppData = Config.PhoneApplications })
end)

RegisterNUICallback('SetBackground', function(data)
    local background = data.background

    PhoneData.MetaData.background = background
    TriggerServerEvent('prp-phone:server:SaveMetaData', PhoneData.MetaData)
end)

RegisterNUICallback('GetMissedCalls', function(data, cb)
    cb(PhoneData.RecentCalls)
end)

RegisterNUICallback('GetSuggestedContacts', function(data, cb)
    cb(PhoneData.SuggestedContacts)
end)

function IsNumberInContacts(num)
    local retval = num
    for _, v in pairs(PhoneData.Contacts) do
        if num == v.number then
            retval = v.name
        end
    end
    return retval
end

local isLoggedIn = false

Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(0, Config.OpenPhone) then
            if not PhoneData.isOpen then
                local IsHandcuffed = exports['police']:IsHandcuffed()
                if not IsHandcuffed then
                    OpenPhone()
                else
                    PRPCore.Functions.Notify("You can't do this now..", "error")
                end
            end
        end
        Citizen.Wait(3)
    end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()
    
    local obj = {}
    
	if minute <= 9 then
		minute = "0" .. minute
    end
    
    obj.hour = hour
    obj.minute = minute

    return obj
end

Citizen.CreateThread(function()
    while true do
        if PhoneData.isOpen then
            SendNUIMessage({
                action = "UpdateTime",
                InGameTime = CalculateTimeToDisplay(),
            })
        end
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(90000)

        if isLoggedIn then
            PRPCore.Functions.TriggerCallback('prp-phone:server:GetPhoneData', function(pData)   
                if pData.PlayerContacts ~= nil and next(pData.PlayerContacts) ~= nil then 
                    PhoneData.Contacts = pData.PlayerContacts
                end

                SendNUIMessage({
                    action = "RefreshContacts",
                    Contacts = PhoneData.Contacts
                })
            end)
        end
    end
end)

function LoadPhone()
    Citizen.Wait(100)
    isLoggedIn = true
    PRPCore.Functions.TriggerCallback('prp-phone:server:GetPhoneData', function(pData)
        PlayerJob = PRPCore.Functions.GetPlayerData().job
        PhoneData.PlayerData = PRPCore.Functions.GetPlayerData()
        local PhoneMeta = PhoneData.PlayerData.metadata["phone"]
        PhoneData.MetaData = PhoneMeta

        if PhoneMeta.profilepicture == nil then
            PhoneData.MetaData.profilepicture = "default"
        else
            PhoneData.MetaData.profilepicture = PhoneMeta.profilepicture
        end

        if pData.Applications ~= nil and next(pData.Applications) ~= nil then
            for k, v in pairs(pData.Applications) do 
                Config.PhoneApplications[k].Alerts = v 
            end
        end

        if pData.MentionedTweets ~= nil and next(pData.MentionedTweets) ~= nil then 
            PhoneData.MentionedTweets = pData.MentionedTweets 
        end

        if pData.PlayerContacts ~= nil and next(pData.PlayerContacts) ~= nil then 
            PhoneData.Contacts = pData.PlayerContacts
        end

        if pData.Chats ~= nil and next(pData.Chats) ~= nil then
            local Chats = {}
            for k, v in pairs(pData.Chats) do
                Chats[v.number] = {
                    name = IsNumberInContacts(v.number),
                    number = v.number,
                    messages = json.decode(v.messages)
                }
            end

            PhoneData.Chats = Chats
        end

        if pData.Invoices ~= nil and next(pData.Invoices) ~= nil then
            for _, invoice in pairs(pData.Invoices) do
                invoice.name = IsNumberInContacts(invoice.number)
            end
            PhoneData.Invoices = pData.Invoices
        end

        if pData.Hashtags ~= nil and next(pData.Hashtags) ~= nil then
            PhoneData.Hashtags = pData.Hashtags
        end

        if pData.Tweets ~= nil and next(pData.Tweets) ~= nil then
            PhoneData.Tweets = pData.Tweets
        end

        if pData.Mails ~= nil and next(pData.Mails) ~= nil then
            PhoneData.Mails = pData.Mails
        end

        if pData.Adverts ~= nil and next(pData.Adverts) ~= nil then
            PhoneData.Adverts = pData.Adverts
        end

        if pData.CryptoTransactions ~= nil and next(pData.CryptoTransactions) ~= nil then
            PhoneData.CryptoTransactions = pData.CryptoTransactions
        end

        if pData.Gallery ~= nil and next(pData.Gallery) ~= nil then
            PhoneData.Gallery = pData.Gallery
        end

        if pData.volcalls ~= nil then
            PhoneData.volcalls = pData.volcalls
            exports["mvoip"]:SetCallVolume(pData.volcalls/10)
        end

        if pData.volradio ~= nil then
            PhoneData.volradio = pData.volradio
            exports["mvoip"]:SetRadioVolume(pData.volradio/10)
        end

        if pData.volclicks ~= nil then
            PhoneData.volclicks = pData.volclicks
            exports.prp_voice:setVoiceProperty("micClicks",pData.volclicks)
        end

        if pData.appKeys ~= nil and next(pData.appKeys) ~= nil then 
            PhoneData.appKeys = pData.appKeys
        end

        if pData.jobOffers ~= nil and next(pData.jobOffers) ~= nil then 
            PhoneData.jobOffers = pData.jobOffers
        end

        Citizen.Wait(300)
    
        SendNUIMessage({ 
            action = "LoadPhoneData", 
            PhoneData = PhoneData, 
            PlayerData = PhoneData.PlayerData,
            PlayerJob = PhoneData.PlayerData.job,
            applications = Config.PhoneApplications 
        })
    end)
end

Citizen.CreateThread(function()
    Wait(500)
    LoadPhone()
end)

RegisterNetEvent('PRPCore:Client:OnPlayerUnload')
AddEventHandler('PRPCore:Client:OnPlayerUnload', function()
    PhoneData = {
        MetaData = {},
        isOpen = false,
        PlayerData = nil,
        Contacts = {},
        Tweets = {},
        MentionedTweets = {},
        Hashtags = {},
        Chats = {},
        Invoices = {},
        CallData = {},
        RecentCalls = {},
        Garage = {},
        Mails = {},
        Adverts = {},
        GarageVehicles = {},
        AnimationData = {
            lib = nil,
            anim = nil,
        },
        SuggestedContacts = {},
        CryptoTransactions = {},
        appKeys = {}
    }

    isLoggedIn = false
end)

RegisterNetEvent('PRPCore:Client:OnPlayerLoaded')
AddEventHandler('PRPCore:Client:OnPlayerLoaded', function()
    LoadPhone()
end)

RegisterNUICallback('HasPhone', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-phone:server:HasPhone', function(HasPhone)
        cb(HasPhone)
    end)
end)

function OpenPhone()
    PRPCore.Functions.TriggerCallback('prp-phone:server:HasPhone', function(HasPhone)
        if HasPhone then
            PhoneData.PlayerData = PRPCore.Functions.GetPlayerData()
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = "open",
                Tweets = PhoneData.Tweets,
                AppData = Config.PhoneApplications,
                CallData = PhoneData.CallData,
                PlayerData = PhoneData.PlayerData,
            })
            PhoneData.isOpen = true
            TriggerEvent('prp-phone:PhoneToggle',true)
            if not PhoneData.CallData.InCall then
                DoPhoneAnimation('cellphone_text_in')
            else
                DoPhoneAnimation('cellphone_call_to_text')
            end

            SetTimeout(250, function()
                newPhoneProp()
            end)
    
            PRPCore.Functions.TriggerCallback('prp-phone:server:GetGarageVehicles', function(vehicles)
                PhoneData.GarageVehicles = vehicles
            end)
        else
            PRPCore.Functions.Notify("You don't have a phone", "error")
        end
    end)
end

RegisterNUICallback('SetupGarageVehicles', function(data, cb)
    cb(PhoneData.GarageVehicles)
end)

RegisterNUICallback('Close', function()
    if not PhoneData.CallData.InCall then
        DoPhoneAnimation('cellphone_text_out')
        SetTimeout(400, function()
            StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)
            deletePhone()
            PhoneData.AnimationData.lib = nil
            PhoneData.AnimationData.anim = nil
        end)
    else
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
        DoPhoneAnimation('cellphone_text_to_call')
    end
    SetNuiFocus(false, false)
    TriggerEvent('prp-phone:PhoneToggle',false)
    -- SetNuiFocusKeepInput(false)
    SetTimeout(1000, function()
        PhoneData.isOpen = false
    end)
end)

RegisterNUICallback('RemoveMail', function(data, cb)
    local MailId = data.mailId

    TriggerServerEvent('prp-phone:server:RemoveMail', MailId)
    cb('ok')
end)

RegisterNetEvent('prp-phone:client:UpdateMails')
AddEventHandler('prp-phone:client:UpdateMails', function(NewMails)
    SendNUIMessage({
        action = "UpdateMails",
        Mails = NewMails
    })
    PhoneData.Mails = NewMails
end)

RegisterNUICallback('AcceptMailButton', function(data)
    TriggerEvent(data.buttonEvent, data.buttonData)
    TriggerServerEvent('prp-phone:server:ClearButtonData', data.mailId)
end)

RegisterNUICallback('AddNewContact', function(data, cb)
    table.insert(PhoneData.Contacts, {
        name = data.ContactName,
        number = data.ContactNumber,
        iban = data.ContactIban
    })
    Citizen.Wait(100)
    cb(PhoneData.Contacts)
    if PhoneData.Chats[data.ContactNumber] ~= nil and next(PhoneData.Chats[data.ContactNumber]) ~= nil then
        PhoneData.Chats[data.ContactNumber].name = data.ContactName
    end
    TriggerServerEvent('prp-phone:server:AddNewContact', data.ContactName, data.ContactNumber, data.ContactIban)
end)

RegisterNUICallback('GetMails', function(data, cb)
    cb(PhoneData.Mails)
end)

RegisterNUICallback('GetWhatsappChat', function(data, cb)
    if PhoneData.Chats[data.phone] ~= nil then
        cb(PhoneData.Chats[data.phone])
    else
        cb(false)
    end
end)

RegisterNUICallback('GetProfilePicture', function(data, cb)
    local number = data.number

    PRPCore.Functions.TriggerCallback('prp-phone:server:GetPicture', function(picture)
        cb(picture)
    end, number)
end)

RegisterNUICallback('GetBankContacts', function(data, cb)
    cb(PhoneData.Contacts)
end)

RegisterNUICallback('GetInvoices', function(data, cb)
    if PhoneData.Invoices ~= nil and next(PhoneData.Invoices) ~= nil then
        cb(PhoneData.Invoices)
    else
        cb(nil)
    end
end)

function GetKeyByDate(Number, Date)
    local retval = nil
    if PhoneData.Chats[Number] ~= nil then
        if PhoneData.Chats[Number].messages ~= nil then
            for key, chat in pairs(PhoneData.Chats[Number].messages) do
                if chat.date == Date then
                    retval = key
                    break
                end
            end
        end
    end
    return retval
end

function GetKeyByNumber(Number)
    local retval = nil
    if PhoneData.Chats then
        for k, v in pairs(PhoneData.Chats) do
            if v.number == Number then
                retval = k
            end
        end
    end
    return retval
end

function ReorganizeChats(key)
    local ReorganizedChats = {}
    ReorganizedChats[1] = PhoneData.Chats[key]
    for k, chat in pairs(PhoneData.Chats) do
        if k ~= key then
            table.insert(ReorganizedChats, chat)
        end
    end
    PhoneData.Chats = ReorganizedChats
end

function DeleteChats(key)
    for k, v in pairs(PhoneData.Chats) do
        if v.number == key then
            PhoneData.Chats[k] = nil
        end
    end
end

RegisterNUICallback('DeleteChat', function(data, cb)
    local chatMessage = data["ChatNumber"]
    local citizenid = PhoneData.PlayerData.citizenid

    --print("Deleting "..chatMessage.." and "..citizenid)
    TriggerServerEvent("prp-phone:server:DeleteChat", chatMessage,citizenid)
    DeleteChats(chatMessage)
end)

RegisterNUICallback('SendMessage', function(data, cb)
    local ChatMessage = data.ChatMessage
    local ChatDate = data.ChatDate
    local ChatNumber = data.ChatNumber
    local ChatTime = data.ChatTime
    local ChatType = data.ChatType

    local Ped = GetPlayerPed(-1)
    local Pos = GetEntityCoords(Ped)
    local NumberKey = GetKeyByNumber(ChatNumber)
    local ChatKey = GetKeyByDate(NumberKey, ChatDate)

    if PhoneData.Chats[NumberKey] ~= nil then
        if PhoneData.Chats[NumberKey].messages[ChatKey] ~= nil then
            if ChatType == "message" or ChatType == "image" then
                table.insert(PhoneData.Chats[NumberKey].messages[ChatKey].messages, {
                    message = ChatMessage,
                    time = ChatTime,
                    sender = PhoneData.PlayerData.citizenid,
                    type = ChatType,
                    data = {},
                })
            elseif ChatType == "location" then
                table.insert(PhoneData.Chats[NumberKey].messages[ChatKey].messages, {
                    message = "Shared Location",
                    time = ChatTime,
                    sender = PhoneData.PlayerData.citizenid,
                    type = ChatType,
                    data = {
                        x = Pos.x,
                        y = Pos.y,
                    },
                })
            end
            TriggerServerEvent('prp-phone:server:UpdateMessages', PhoneData.Chats[NumberKey].messages, ChatNumber, false)
            NumberKey = GetKeyByNumber(ChatNumber)
            ReorganizeChats(NumberKey)
        else
            table.insert(PhoneData.Chats[NumberKey].messages, {
                date = ChatDate,
                messages = {},
            })
            ChatKey = GetKeyByDate(NumberKey, ChatDate)
            if ChatType == "message" or ChatType == "image" then
                table.insert(PhoneData.Chats[NumberKey].messages[ChatKey].messages, {
                    message = ChatMessage,
                    time = ChatTime,
                    sender = PhoneData.PlayerData.citizenid,
                    type = ChatType,
                    data = {},
                })
            elseif ChatType == "location" then
                table.insert(PhoneData.Chats[NumberKey].messages[ChatDate].messages, {
                    message = "Shared Location",
                    time = ChatTime,
                    sender = PhoneData.PlayerData.citizenid,
                    type = ChatType,
                    data = {
                        x = Pos.x,
                        y = Pos.y,
                    },
                })
            end
            TriggerServerEvent('prp-phone:server:UpdateMessages', PhoneData.Chats[NumberKey].messages, ChatNumber, true)
            NumberKey = GetKeyByNumber(ChatNumber)
            ReorganizeChats(NumberKey)
        end
    else
        table.insert(PhoneData.Chats, {
            name = IsNumberInContacts(ChatNumber),
            number = ChatNumber,
            messages = {},
        })
        NumberKey = GetKeyByNumber(ChatNumber)
        table.insert(PhoneData.Chats[NumberKey].messages, {
            date = ChatDate,
            messages = {},
        })
        ChatKey = GetKeyByDate(NumberKey, ChatDate)
        if ChatType == "message" or ChatType == "image" then
            table.insert(PhoneData.Chats[NumberKey].messages[ChatKey].messages, {
                message = ChatMessage,
                time = ChatTime,
                sender = PhoneData.PlayerData.citizenid,
                type = ChatType,
                data = {},
            })
        elseif ChatType == "location" then
            table.insert(PhoneData.Chats[NumberKey].messages[ChatKey].messages, {
                message = "Shared Location",
                time = ChatTime,
                sender = PhoneData.PlayerData.citizenid,
                type = ChatType,
                data = {
                    x = Pos.x,
                    y = Pos.y,
                },
            })
        end
        TriggerServerEvent('prp-phone:server:UpdateMessages', PhoneData.Chats[NumberKey].messages, ChatNumber, true)
        NumberKey = GetKeyByNumber(ChatNumber)
        ReorganizeChats(NumberKey)
    end

    PRPCore.Functions.TriggerCallback('prp-phone:server:GetContactPicture', function(Chat)
        SendNUIMessage({
            action = "UpdateChat",
            chatData = Chat,
            chatNumber = ChatNumber,
        })
    end,  PhoneData.Chats[GetKeyByNumber(ChatNumber)])
end)

RegisterNUICallback('SharedLocation', function(data)
    local x = data.coords.x
    local y = data.coords.y

    SetNewWaypoint(x, y)
    SendNUIMessage({
        action = "PhoneNotification",
        PhoneNotify = {
            title = "Whatsapp",
            text = "Location is set!",
            icon = "fab fa-whatsapp",
            color = "#25D366",
            timeout = 1500,
        },
    })
end)

RegisterNetEvent('prp-phone:client:UpdateMessages')
AddEventHandler('prp-phone:client:UpdateMessages', function(ChatMessages, SenderNumber, New)
    local Sender = IsNumberInContacts(SenderNumber)

    local NumberKey = GetKeyByNumber(SenderNumber)

    if New or NumberKey == nil then
        table.insert(PhoneData.Chats, {
            name = IsNumberInContacts(SenderNumber),
            number = SenderNumber,
            messages = {},
        })
        NumberKey = GetKeyByNumber(SenderNumber)
        PhoneData.Chats[NumberKey] = {
            name = IsNumberInContacts(SenderNumber),
            number = SenderNumber,
            messages = ChatMessages
        }

        if PhoneData.Chats[NumberKey].Unread ~= nil then
            PhoneData.Chats[NumberKey].Unread = PhoneData.Chats[NumberKey].Unread + 1
        else
            PhoneData.Chats[NumberKey].Unread = 1
        end

        if PhoneData.isOpen then
            if SenderNumber ~= PhoneData.PlayerData.charinfo.phone then
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "New message from "..IsNumberInContacts(SenderNumber).."!",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 1500,
                    },
                })
            else
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "Why are you even trying?",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 4000,
                    },
                })
            end

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)

            Wait(100)
            PRPCore.Functions.TriggerCallback('prp-phone:server:GetContactPictures', function(Chats)
                SendNUIMessage({
                    action = "UpdateChat",
                    chatData = Chats[GetKeyByNumber(SenderNumber)],
                    chatNumber = SenderNumber,
                    Chats = Chats,
                })
            end,  PhoneData.Chats)
        else
            SendNUIMessage({
                action = "Notification",
                NotifyData = {
                    title = "Whatsapp", 
                    content = "You received a new message from "..IsNumberInContacts(SenderNumber).."!", 
                    icon = "fab fa-whatsapp", 
                    timeout = 3500, 
                    color = "#25D366",
                },
            })
            Config.PhoneApplications['whatsapp'].Alerts = Config.PhoneApplications['whatsapp'].Alerts + 1
            TriggerServerEvent('prp-phone:server:SetPhoneAlerts', "whatsapp")
        end
    else
        PhoneData.Chats[NumberKey].messages = ChatMessages

        if PhoneData.Chats[NumberKey].Unread ~= nil then
            PhoneData.Chats[NumberKey].Unread = PhoneData.Chats[NumberKey].Unread + 1
        else
            PhoneData.Chats[NumberKey].Unread = 1
        end

        if PhoneData.isOpen then
            if SenderNumber ~= PhoneData.PlayerData.charinfo.phone then
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "New message from "..IsNumberInContacts(SenderNumber).."!",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 1500,
                    },
                })
            else
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "Why are you even trying?",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 4000,
                    },
                })
            end

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)
            
            Wait(100)
            PRPCore.Functions.TriggerCallback('prp-phone:server:GetContactPictures', function(Chats)
                SendNUIMessage({
                    action = "UpdateChat",
                    chatData = Chats[GetKeyByNumber(SenderNumber)],
                    chatNumber = SenderNumber,
                    Chats = Chats,
                })
            end,  PhoneData.Chats)
        else
            SendNUIMessage({
                action = "Notification",
                NotifyData = {
                    title = "Whatsapp", 
                    content = "You received a new message from "..IsNumberInContacts(SenderNumber).."!", 
                    icon = "fab fa-whatsapp", 
                    timeout = 3500, 
                    color = "#25D366",
                },
            })

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)

            Config.PhoneApplications['whatsapp'].Alerts = Config.PhoneApplications['whatsapp'].Alerts + 1
            TriggerServerEvent('prp-phone:server:SetPhoneAlerts', "whatsapp")
        end
    end
end)

RegisterNetEvent("prp-phone-new:client:BankNotify")
AddEventHandler("prp-phone-new:client:BankNotify", function(text)
    SendNUIMessage({
        action = "Notification",
        NotifyData = {
            title = "Banco", 
            content = text, 
            icon = "fas fa-university", 
            timeout = 3500, 
            color = "#ff002f",
        },
    })
end)

RegisterNetEvent("prp-phone-new:client:cleartwitter")
AddEventHandler("prp-phone-new:client:cleartwitter", function()

    if PhoneData.Tweets ~= nil then
        PhoneData.Tweets = {}
    end

    if PhoneData.MentionedTweets ~= nil then
        PhoneData.MentionedTweets = {}
    end

end)

RegisterNetEvent('prp-phone:client:NewMailNotify')
AddEventHandler('prp-phone:client:NewMailNotify', function(MailData)
    if PhoneData.isOpen then
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Mail",
                text = "You received a new email from "..MailData.sender,
                icon = "fas fa-envelope",
                color = "#ff002f",
                timeout = 1500,
            },
        })
    else
        SendNUIMessage({
            action = "Notification",
            NotifyData = {
                title = "Mail", 
                content = "You received a new email from "..MailData.sender, 
                icon = "fas fa-envelope", 
                timeout = 3500, 
                color = "#ff002f",
            },
        })
    end
    Config.PhoneApplications['mail'].Alerts = Config.PhoneApplications['mail'].Alerts + 1
    TriggerServerEvent('prp-phone:server:SetPhoneAlerts', "mail")
end)

RegisterNUICallback('PostAdvert', function(data)
    TriggerServerEvent('prp-phone:server:AddAdvert', data.message)
end)

RegisterNetEvent('prp-phone:client:UpdateAdverts')
AddEventHandler('prp-phone:client:UpdateAdverts', function(Adverts, LastAd)
    PhoneData.Adverts = Adverts

    if PhoneData.isOpen then
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Advertisement",
                text = "New advertisement posted by "..LastAd,
                icon = "fas fa-ad",
                color = "#ff8f1a",
                timeout = 2500,
            },
        })
    else
        SendNUIMessage({
            action = "Notification",
            NotifyData = {
                title = "Advertisement", 
                content = "New advertisement posted by "..LastAd,
                icon = "fas fa-ad", 
                timeout = 2500, 
                color = "#ff8f1a",
            },
        })
    end

    SendNUIMessage({
        action = "RefreshAdverts",
        Adverts = PhoneData.Adverts
    })
end)

RegisterNUICallback('LoadAdverts', function()
    SendNUIMessage({
        action = "RefreshAdverts",
        Adverts = PhoneData.Adverts
    })
end)

RegisterNUICallback('ClearAlerts', function(data, cb)
    local chat = data.number
    local ChatKey = GetKeyByNumber(chat)

    if PhoneData.Chats[ChatKey].Unread ~= nil then
        local newAlerts = (Config.PhoneApplications['whatsapp'].Alerts - PhoneData.Chats[ChatKey].Unread)
        Config.PhoneApplications['whatsapp'].Alerts = newAlerts
        TriggerServerEvent('prp-phone:server:SetPhoneAlerts', "whatsapp", newAlerts)

        PhoneData.Chats[ChatKey].Unread = 0

        SendNUIMessage({
            action = "RefreshWhatsappAlerts",
            Chats = PhoneData.Chats,
        })
        SendNUIMessage({ action = "RefreshAppAlerts", AppData = Config.PhoneApplications })
    end
end)

RegisterNUICallback('PayInvoice', function(data, cb)
    local sender = data.sender
    local amount = data.amount
    local invoiceId = data.invoiceId

    PRPCore.Functions.TriggerCallback('prp-phone:server:PayInvoice', function(CanPay, Invoices)
        if CanPay then PhoneData.Invoices = Invoices end
        cb(CanPay)
    end, sender, amount, invoiceId)
end)

RegisterNUICallback('DeclineInvoice', function(data, cb)
    local sender = data.sender
    local amount = data.amount
    local invoiceId = data.invoiceId

    PRPCore.Functions.TriggerCallback('prp-phone:server:DeclineInvoice', function(CanPay, Invoices)
        PhoneData.Invoices = Invoices
        cb('ok')
    end, sender, amount, invoiceId)
end)

RegisterNUICallback('EditContact', function(data, cb)
    local NewName = data.CurrentContactName
    local NewNumber = data.CurrentContactNumber
    local NewIban = data.CurrentContactIban
    local OldName = data.OldContactName
    local OldNumber = data.OldContactNumber
    local OldIban = data.OldContactIban

    for k, v in pairs(PhoneData.Contacts) do
        if v.name == OldName and v.number == OldNumber then
            v.name = NewName
            v.number = NewNumber
            v.iban = NewIban
        end
    end
    if PhoneData.Chats[NewNumber] ~= nil and next(PhoneData.Chats[NewNumber]) ~= nil then
        PhoneData.Chats[NewNumber].name = NewName
    end
    Citizen.Wait(100)
    cb(PhoneData.Contacts)
    TriggerServerEvent('prp-phone:server:EditContact', NewName, NewNumber, NewIban, OldName, OldNumber, OldIban)
end)

local function escape_str(s)
	-- local in_char  = {'\\', '"', '/', '\b', '\f', '\n', '\r', '\t'}
	-- local out_char = {'\\', '"', '/',  'b',  'f',  'n',  'r',  't'}
	-- for i, c in ipairs(in_char) do
	--   s = s:gsub(c, '\\' .. out_char[i])
	-- end
	return s
end

function GenerateTweetId()
    local tweetId = "TWEET-"..math.random(11111111, 99999999)
    return tweetId
end

function GenerateDWChatId()
    local DWChatId = "DWC-"..math.random(11111111, 99999999)
    return DWChatId
end

RegisterNetEvent('prp-phone:client:UpdateHashtags')
AddEventHandler('prp-phone:client:UpdateHashtags', function(Handle, msgData)
    if PhoneData.Hashtags[Handle] ~= nil then
        table.insert(PhoneData.Hashtags[Handle].messages, msgData)
    else
        PhoneData.Hashtags[Handle] = {
            hashtag = Handle,
            messages = {}
        }
        table.insert(PhoneData.Hashtags[Handle].messages, msgData)
    end

    SendNUIMessage({
        action = "UpdateHashtags",
        Hashtags = PhoneData.Hashtags,
    })
end)

RegisterNUICallback('GetHashtagMessages', function(data, cb)
    if PhoneData.Hashtags[data.hashtag] ~= nil and next(PhoneData.Hashtags[data.hashtag]) ~= nil then
        cb(PhoneData.Hashtags[data.hashtag])
    else
        cb(nil)
    end
end)

RegisterNUICallback('GetTweets', function(data, cb)
    cb(PhoneData.Tweets)
end)

RegisterNUICallback('UpdateProfilePicture', function(data)
    local pf = data.profilepicture

    PhoneData.MetaData.profilepicture = pf
    
    TriggerServerEvent('prp-phone:server:SaveMetaData', PhoneData.MetaData)
end)

local patt = "[?!@#]"

RegisterNUICallback('PostNewTweet', function(data, cb)
    local TweetMessage = {
        firstName = PhoneData.PlayerData.charinfo.firstname,
        lastName = PhoneData.PlayerData.charinfo.lastname,
        message = escape_str(data.Message),
        time = data.Date,
        tweetId = GenerateTweetId(),
        picture = data.Picture,
        notification = data.Notification
    }

    local TwitterMessage = data.Message
    local MentionTag = TwitterMessage:split("@")
    local Hashtag = TwitterMessage:split("#")

    TriggerServerEvent("prp-log:server:CreateLog", "tweets", "Twitter", "red", "**"..GetPlayerName(PlayerId()).."** "..TwitterMessage)

    for i = 2, #Hashtag, 1 do
        local Handle = Hashtag[i]:split(" ")[1]
        if Handle ~= nil or Handle ~= "" then
            local InvalidSymbol = string.match(Handle, patt)
            if InvalidSymbol then
                Handle = Handle:gsub("%"..InvalidSymbol, "")
            end
            TriggerServerEvent('prp-phone:server:UpdateHashtags', Handle, TweetMessage)
        end
    end

    for i = 2, #MentionTag, 1 do
        local Handle = MentionTag[i]:split(" ")[1]
        if Handle ~= nil or Handle ~= "" then
            local Fullname = Handle:split("_")
            local Firstname = Fullname[1]
            table.remove(Fullname, 1)
            local Lastname = table.concat(Fullname, " ")

            if (Firstname ~= nil and Firstname ~= "") and (Lastname ~= nil and Lastname ~= "") then
                if Firstname ~= PhoneData.PlayerData.charinfo.firstname and Lastname ~= PhoneData.PlayerData.charinfo.lastname then
                    TriggerServerEvent('prp-phone:server:MentionedPlayer', Firstname, Lastname, TweetMessage)
                else
                    SetTimeout(2500, function()
                        SendNUIMessage({
                            action = "PhoneNotification",
                            PhoneNotify = {
                                title = "Twitter", 
                                text = "Cant mention yourself!", 
                                icon = "fab fa-twitter",
                                color = "#1DA1F2",
                            },
                        })
                    end)
                end
            end
        end
    end

    table.insert(PhoneData.Tweets, TweetMessage)
    Citizen.Wait(100)
    cb(PhoneData.Tweets)

    TriggerServerEvent('prp-phone:server:UpdateTweets', PhoneData.Tweets, TweetMessage)
end)

RegisterNetEvent('prp-phone:client:TransferMoney')
AddEventHandler('prp-phone:client:TransferMoney', function(amount, newmoney)
    PhoneData.PlayerData.money.bank = newmoney
    if PhoneData.isOpen then
        SendNUIMessage({ action = "PhoneNotification", PhoneNotify = { title = "Banco", text = "$"..amount.." acreditado!", icon = "fas fa-university", color = "#8c7ae6", }, })
        SendNUIMessage({ action = "UpdateBank", NewBalance = PhoneData.PlayerData.money.bank })
    else
        SendNUIMessage({ action = "Notification", NotifyData = { title = "Banco", content = "$"..amount.." acreditado!", icon = "fas fa-university", timeout = 2500, color = nil, }, })
    end
end)

RegisterNetEvent('prp-phone:client:UpdateTweets')
AddEventHandler('prp-phone:client:UpdateTweets', function(src, Tweets, NewTweetData)
    PhoneData.Tweets = Tweets
    local MyPlayerId = PhoneData.PlayerData.source

    if src ~= MyPlayerId then
        if not PhoneData.isOpen then
            SendNUIMessage({
                action = "Notification",
                NotifyData = {
                    title = "New Tweet (@"..NewTweetData.firstName.." "..NewTweetData.lastName..")", 
                    content = NewTweetData.notification, 
                    icon = "fab fa-twitter", 
                    timeout = 3500, 
                    color = nil,
                },
            })
        else
            SendNUIMessage({
                action = "PhoneNotification",
                PhoneNotify = {
                    title = "New Tweet (@"..NewTweetData.firstName.." "..NewTweetData.lastName..")", 
                    text = NewTweetData.notification, 
                    icon = "fab fa-twitter",
                    color = "#1DA1F2",
                },
            })
        end
    else
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Twitter", 
                text = "Tweet Posted!", 
                icon = "fab fa-twitter",
                color = "#1DA1F2",
                timeout = 1000,
            },
        })
    end
end)

RegisterNUICallback('GetMentionedTweets', function(data, cb)
    cb(PhoneData.MentionedTweets)
end)

RegisterNUICallback('GetHashtags', function(data, cb)
    if PhoneData.Hashtags ~= nil and next(PhoneData.Hashtags) ~= nil then
        cb(PhoneData.Hashtags)
    else
        cb(nil)
    end
end)

RegisterNetEvent('prp-phone:client:GetMentioned')
AddEventHandler('prp-phone:client:GetMentioned', function(TweetMessage, AppAlerts)
    Config.PhoneApplications["twitter"].Alerts = AppAlerts
    if not PhoneData.isOpen then
        SendNUIMessage({ action = "Notification", NotifyData = { title = "You have been mentioned!", content = TweetMessage.message, icon = "fab fa-twitter", timeout = 3500, color = nil, }, })
    else
        SendNUIMessage({ action = "PhoneNotification", PhoneNotify = { title = "You have been mentioned!", text = TweetMessage.message, icon = "fab fa-twitter", color = "#1DA1F2", }, })
    end
    local TweetMessage = {firstName = TweetMessage.firstName, lastName = TweetMessage.lastName, message = escape_str(TweetMessage.message), time = TweetMessage.time, picture = TweetMessage.picture}
    table.insert(PhoneData.MentionedTweets, TweetMessage)
    SendNUIMessage({ action = "RefreshAppAlerts", AppData = Config.PhoneApplications })
    SendNUIMessage({ action = "UpdateMentionedTweets", Tweets = PhoneData.MentionedTweets })
end)

RegisterNUICallback('ClearMentions', function()
    Config.PhoneApplications["twitter"].Alerts = 0
    SendNUIMessage({
        action = "RefreshAppAlerts",
        AppData = Config.PhoneApplications
    })
    TriggerServerEvent('prp-phone:server:SetPhoneAlerts', "twitter", 0)
    SendNUIMessage({ action = "RefreshAppAlerts", AppData = Config.PhoneApplications })
end)

RegisterNUICallback('ClearGeneralAlerts', function(data)
    SetTimeout(400, function()
        Config.PhoneApplications[data.app].Alerts = 0
        SendNUIMessage({
            action = "RefreshAppAlerts",
            AppData = Config.PhoneApplications
        })
        TriggerServerEvent('prp-phone:server:SetPhoneAlerts', data.app, 0)
        SendNUIMessage({ action = "RefreshAppAlerts", AppData = Config.PhoneApplications })
    end)
end)

function string:split(delimiter)
    local result = { }
    local from  = 1
    local delim_from, delim_to = string.find( self, delimiter, from  )
    while delim_from do
      table.insert( result, string.sub( self, from , delim_from-1 ) )
      from  = delim_to + 1
      delim_from, delim_to = string.find( self, delimiter, from  )
    end
    table.insert( result, string.sub( self, from  ) )
    return result
end

RegisterNUICallback('TransferMoney', function(data, cb)
    data.amount = tonumber(data.amount)
    if tonumber(PhoneData.PlayerData.money.bank) >= data.amount then
        local amaountata = PhoneData.PlayerData.money.bank - data.amount
        TriggerServerEvent('prp-phone:server:TransferMoney', data.iban, data.amount)
        local cbdata = {
            CanTransfer = true,
            NewAmount = amaountata 
        }
        cb(cbdata)
    else
        local cbdata = {
            CanTransfer = false,
            NewAmount = nil,
        }
        cb(cbdata)
    end
end)

RegisterNUICallback('GetWhatsappChats', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-phone:server:GetContactPictures', function(Chats)
        cb(Chats)
    end, PhoneData.Chats)
end)

RegisterNUICallback('CallContact', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-phone:server:GetCallState', function(CanCall, IsOnline)
        local status = { 
            CanCall = CanCall, 
            IsOnline = IsOnline,
            InCall = PhoneData.CallData.InCall,
        }
        cb(status)
        if CanCall and not status.InCall and (data.ContactData.number ~= PhoneData.PlayerData.charinfo.phone) then
            CallContact(data.ContactData, data.Anonymous)
        end
    end, data.ContactData)
end)

function GenerateCallId(caller, target)
    local CallId = math.ceil(((tonumber(caller) + tonumber(target)) / 100 * 1))
    return CallId
end

CallContact = function(CallData, AnonymousCall)
    local RepeatCount = 0
    PhoneData.CallData.CallType = "outgoing"
    PhoneData.CallData.InCall = true
    PhoneData.CallData.TargetData = CallData
    PhoneData.CallData.AnsweredCall = false
    PhoneData.CallData.CallId = GenerateCallId(PhoneData.PlayerData.charinfo.phone, CallData.number)


    TriggerServerEvent('prp-phone:server:CallContact', PhoneData.CallData.TargetData, PhoneData.CallData.CallId, AnonymousCall)
    TriggerServerEvent('prp-phone:server:SetCallState', true)
    
    for i = 1, Config.CallRepeats + 1, 1 do
        if not PhoneData.CallData.AnsweredCall then
            if RepeatCount + 1 ~= Config.CallRepeats + 1 then
                if PhoneData.CallData.InCall then
                    RepeatCount = RepeatCount + 1
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "demo", 0.1)
                else
                    break
                end
                Citizen.Wait(Config.RepeatTimeout)
            else
                CancelCall()
                break
            end
        else
            break
        end
    end
end

CancelCall = function()
    TriggerServerEvent('prp-phone:server:CancelCall', PhoneData.CallData)
    if PhoneData.CallData.CallType == "ongoing" then
        --exports["mvoip"]:removePlayerFromCall(PhoneData.CallData.CallId)
        exports.tokovoip_script:removePlayerFromRadio(PhoneData.CallData.CallId)
    end
    PhoneData.CallData.CallType = nil
    PhoneData.CallData.InCall = false
    PhoneData.CallData.AnsweredCall = false
    PhoneData.CallData.TargetData = {}
    PhoneData.CallData.CallId = nil

    if not PhoneData.isOpen then
        StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)
        deletePhone()
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    else
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    end

    TriggerServerEvent('prp-phone:server:SetCallState', false)

    if not PhoneData.isOpen then
        SendNUIMessage({ 
            action = "Notification", 
            NotifyData = { 
                title = "Phone",
                content = "Call has ended", 
                icon = "fas fa-phone", 
                timeout = 3500, 
                color = "#e84118",
            }, 
        })            
    else
        SendNUIMessage({ 
            action = "PhoneNotification", 
            PhoneNotify = { 
                title = "Phone", 
                text = "Call has ended", 
                icon = "fas fa-phone", 
                color = "#e84118", 
            }, 
        })

        SendNUIMessage({
            action = "SetupHomeCall",
            CallData = PhoneData.CallData,
        })

        SendNUIMessage({
            action = "CancelOutgoingCall",
        })
    end
end

RegisterNetEvent('prp-phone:client:CancelCall')
AddEventHandler('prp-phone:client:CancelCall', function()
    if PhoneData.CallData.CallType == "ongoing" then
        SendNUIMessage({
            action = "CancelOngoingCall"
        })
        exports.tokovoip_script:removePlayerFromRadio(PhoneData.CallData.CallId)
        --exports["mvoip"]:removePlayerFromCall(PhoneData.CallData.CallId)
    end
    PhoneData.CallData.CallType = nil
    PhoneData.CallData.InCall = false
    PhoneData.CallData.AnsweredCall = false
    PhoneData.CallData.TargetData = {}

    if not PhoneData.isOpen then
        StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)
        deletePhone()
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    else
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    end

    TriggerServerEvent('prp-phone:server:SetCallState', false)

    if not PhoneData.isOpen then
        SendNUIMessage({ 
            action = "Notification", 
            NotifyData = { 
                title = "Phone",
                content = "Call has ended", 
                icon = "fas fa-phone", 
                timeout = 3500, 
                color = "#e84118",
            }, 
        })            
    else
        SendNUIMessage({ 
            action = "PhoneNotification", 
            PhoneNotify = { 
                title = "Phone", 
                text = "Call has ended", 
                icon = "fas fa-phone", 
                color = "#e84118", 
            }, 
        })

        SendNUIMessage({
            action = "SetupHomeCall",
            CallData = PhoneData.CallData,
        })

        SendNUIMessage({
            action = "CancelOutgoingCall",
        })
    end
end)

RegisterNetEvent('prp-phone:client:GetCalled')
AddEventHandler('prp-phone:client:GetCalled', function(CallerNumber, CallId, AnonymousCall)
    local RepeatCount = 0
    local CallData = {
        number = CallerNumber,
        name = IsNumberInContacts(CallerNumber),
        anonymous = AnonymousCall
    }

    if AnonymousCall then
        CallData.name = "Anónimo"
    end

    PhoneData.CallData.CallType = "incoming"
    PhoneData.CallData.InCall = true
    PhoneData.CallData.AnsweredCall = false
    PhoneData.CallData.TargetData = CallData
    PhoneData.CallData.CallId = CallId

    TriggerServerEvent('prp-phone:server:SetCallState', true)

    SendNUIMessage({
        action = "SetupHomeCall",
        CallData = PhoneData.CallData,
    })

    for i = 1, Config.CallRepeats + 1, 1 do
        if not PhoneData.CallData.AnsweredCall then
            if RepeatCount + 1 ~= Config.CallRepeats + 1 then
                if PhoneData.CallData.InCall then
                    RepeatCount = RepeatCount + 1
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "ringing", 0.2)
                    
                    if not PhoneData.isOpen then
                        SendNUIMessage({
                            action = "IncomingCallAlert",
                            CallData = PhoneData.CallData.TargetData,
                            Canceled = false,
                            AnonymousCall = AnonymousCall,
                        })
                    end
                else
                    SendNUIMessage({
                        action = "IncomingCallAlert",
                        CallData = PhoneData.CallData.TargetData,
                        Canceled = true,
                        AnonymousCall = AnonymousCall,
                    })
                    TriggerServerEvent('prp-phone:server:AddRecentCall', "missed", CallData)
                    break
                end
                Citizen.Wait(Config.RepeatTimeout)
            else
                SendNUIMessage({
                    action = "IncomingCallAlert",
                    CallData = PhoneData.CallData.TargetData,
                    Canceled = true,
                    AnonymousCall = AnonymousCall,
                })
                TriggerServerEvent('prp-phone:server:AddRecentCall', "missed", CallData)
                break
            end
        else
            TriggerServerEvent('prp-phone:server:AddRecentCall', "missed", CallData)
            break
        end
    end
end)

RegisterNUICallback('CancelOutgoingCall', function()
    CancelCall()
end)

RegisterNUICallback('DenyIncomingCall', function()
    CancelCall()
end)

RegisterNUICallback('CancelOngoingCall', function()
    CancelCall()
end)

RegisterNUICallback('AnswerCall', function()
    AnswerCall()
end)

function AnswerCall()
    if (PhoneData.CallData.CallType == "incoming" or PhoneData.CallData.CallType == "outgoing") and PhoneData.CallData.InCall and not PhoneData.CallData.AnsweredCall then
        PhoneData.CallData.CallType = "ongoing"
        PhoneData.CallData.AnsweredCall = true
        PhoneData.CallData.CallTime = 0

        SendNUIMessage({ action = "AnswerCall", CallData = PhoneData.CallData})
        SendNUIMessage({ action = "SetupHomeCall", CallData = PhoneData.CallData})

        TriggerServerEvent('prp-phone:server:SetCallState', true)

        if PhoneData.isOpen then
            DoPhoneAnimation('cellphone_text_to_call')
        else
            DoPhoneAnimation('cellphone_call_listen_base')
        end

        Citizen.CreateThread(function()
            while true do
                if PhoneData.CallData.AnsweredCall then
                    PhoneData.CallData.CallTime = PhoneData.CallData.CallTime + 1
                    SendNUIMessage({
                        action = "UpdateCallTime",
                        Time = PhoneData.CallData.CallTime,
                        Name = PhoneData.CallData.TargetData.name,
                    })
                else
                    break
                end

                Citizen.Wait(1000)
            end
        end)

        TriggerServerEvent('prp-phone:server:AnswerCall', PhoneData.CallData)
        --exports["mvoip"]:addPlayerToCall(PhoneData.CallData.CallId)
        exports.tokovoip_script:addPlayerToRadio(PhoneData.CallData.CallId, 'Phone')
    else
        PhoneData.CallData.InCall = false
        PhoneData.CallData.CallType = nil
        PhoneData.CallData.AnsweredCall = false

        SendNUIMessage({ 
            action = "PhoneNotification", 
            PhoneNotify = { 
                title = "Phone", 
                text = "You dont have any incoming calls...", 
                icon = "fas fa-phone", 
                color = "#e84118", 
            }, 
        })
    end
end

RegisterNetEvent('prp-phone:client:AnswerCall')
AddEventHandler('prp-phone:client:AnswerCall', function()
    if (PhoneData.CallData.CallType == "incoming" or PhoneData.CallData.CallType == "outgoing") and PhoneData.CallData.InCall and not PhoneData.CallData.AnsweredCall then
        PhoneData.CallData.CallType = "ongoing"
        PhoneData.CallData.AnsweredCall = true
        PhoneData.CallData.CallTime = 0

        SendNUIMessage({ action = "AnswerCall", CallData = PhoneData.CallData})
        SendNUIMessage({ action = "SetupHomeCall", CallData = PhoneData.CallData})

        TriggerServerEvent('prp-phone:server:SetCallState', true)

        if PhoneData.isOpen then
            DoPhoneAnimation('cellphone_text_to_call')
        else
            DoPhoneAnimation('cellphone_call_listen_base')
        end

        Citizen.CreateThread(function()
            while true do
                if PhoneData.CallData.AnsweredCall then
                    PhoneData.CallData.CallTime = PhoneData.CallData.CallTime + 1
                    SendNUIMessage({
                        action = "UpdateCallTime",
                        Time = PhoneData.CallData.CallTime,
                        Name = PhoneData.CallData.TargetData.name,
                    })
                else
                    break
                end

                Citizen.Wait(1000)
            end
        end)
        exports.tokovoip_script:addPlayerToRadio(PhoneData.CallData.CallId, 'Phone')
        --exports["mvoip"]:addPlayerToCall(PhoneData.CallData.CallId)
    else
        PhoneData.CallData.InCall = false
        PhoneData.CallData.CallType = nil
        PhoneData.CallData.AnsweredCall = false

        SendNUIMessage({ 
            action = "PhoneNotification", 
            PhoneNotify = { 
                title = "Phone", 
                text = "You dont have any incoming calls...", 
                icon = "fas fa-phone", 
                color = "#e84118", 
            }, 
        })
    end
end)

-- AddEventHandler('onResourceStop', function(resource)
--     if resource == GetCurrentResourceName() then
--         -- SetNuiFocus(false, false)
--     end
-- end)

RegisterNUICallback('FetchSearchResults', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-phone:server:FetchResult', function(result)
        cb(result)
    end, data.input)
end)

RegisterNUICallback('FetchVehicleResults', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-phone:server:GetVehicleSearchResults', function(result)
        if result ~= nil then 
            for k, v in pairs(result) do
                PRPCore.Functions.TriggerCallback('police:IsPlateFlagged', function(flagged)
                    result[k].isFlagged = flagged
                end, result[k].plate)
                Citizen.Wait(50)
            end
        end
        cb(result)
    end, data.input)
end)

RegisterNUICallback('FetchVehicleScan', function(data, cb)
    local vehicle = PRPCore.Functions.GetClosestVehicle()
    local plate = GetVehicleNumberPlateText(vehicle)
    local model = GetEntityModel(vehicle)

    PRPCore.Functions.TriggerCallback('prp-phone:server:ScanPlate', function(result)
        PRPCore.Functions.TriggerCallback('police:IsPlateFlagged', function(flagged)
            result.isFlagged = flagged
            local vehicleInfo = PRPCore.Shared.Vehicles[PRPCore.Shared.VehicleModels[model]["model"]] ~= nil and PRPCore.Shared.Vehicles[PRPCore.Shared.VehicleModels[model]["model"]] or {["brand"] = "Type", ["name"] = ""}
            result.label = vehicleInfo["name"]
            cb(result)
        end, plate)
    end, plate)
end)

RegisterNetEvent('prp-phone:client:addPoliceAlert')
AddEventHandler('prp-phone:client:addPoliceAlert', function(alertData)
    if PlayerJob.name == 'police' and PlayerJob.onduty then
        SendNUIMessage({
            action = "AddPoliceAlert",
            alert = alertData,
        })
    end
    --TriggerServerEvent('prp-phone:server:ServiceMessage',"police",alertData.description,alertData.title,alertData.coords)
end)

RegisterNUICallback('SetAlertWaypoint', function(data)
    local coords = data.alert.coords

    PRPCore.Functions.Notify('GPS Location set: '..data.alert.title,"success")
    SetNewWaypoint(coords.x, coords.y)
end)

RegisterNUICallback('RemoveSuggestion', function(data, cb)
    local data = data.data

    if PhoneData.SuggestedContacts ~= nil and next(PhoneData.SuggestedContacts) ~= nil then
        for k, v in pairs(PhoneData.SuggestedContacts) do
            if (data.name[1] == v.name[1] and data.name[2] == v.name[2]) and data.number == v.number and data.bank == v.bank then
                table.remove(PhoneData.SuggestedContacts, k)
            end
        end
    end
end)

function GetClosestPlayer()
    local closestPlayers = PRPCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

RegisterNetEvent('prp-phone:client:GiveContactDetails')
AddEventHandler('prp-phone:client:GiveContactDetails', function(player)
    local PlayerId = GetPlayerServerId(player)
    TriggerServerEvent('prp-phone:server:GiveContactDetails', PlayerId)
end)

RegisterNUICallback('DeleteContact', function(data, cb)
    local Name = data.CurrentContactName
    local Number = data.CurrentContactNumber
    local Account = data.CurrentContactIban

    for k, v in pairs(PhoneData.Contacts) do
        if v.name == Name and v.number == Number then
            table.remove(PhoneData.Contacts, k)
            if PhoneData.isOpen then
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Phone",
                        text = "You deleted the contact!", 
                        icon = "fa fa-phone-alt",
                        color = "#04b543",
                        timeout = 1500,
                    },
                })
            else
                SendNUIMessage({
                    action = "Notification",
                    NotifyData = {
                        title = "Phone", 
                        content = "You deleted the contact!", 
                        icon = "fa fa-phone-alt", 
                        timeout = 3500, 
                        color = "#04b543",
                    },
                })
            end
            break
        end
    end
    Citizen.Wait(100)
    cb(PhoneData.Contacts)
    if PhoneData.Chats[Number] ~= nil and next(PhoneData.Chats[Number]) ~= nil then
        PhoneData.Chats[Number].name = Number
    end
    TriggerServerEvent('prp-phone:server:RemoveContact', Name, Number)
end)

RegisterNetEvent('prp-phone:client:AddNewSuggestion')
AddEventHandler('prp-phone:client:AddNewSuggestion', function(SuggestionData)
    table.insert(PhoneData.SuggestedContacts, SuggestionData)

    if PhoneData.isOpen then
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Phone",
                text = "New suggested contact!", 
                icon = "fa fa-phone-alt",
                color = "#04b543",
                timeout = 1500,
            },
        })
    else
        SendNUIMessage({
            action = "Notification",
            NotifyData = {
                title = "Phone", 
                content = "New suggested contact!", 
                icon = "fa fa-phone-alt", 
                timeout = 3500, 
                color = "#04b543",
            },
        })
    end

    Config.PhoneApplications["phone"].Alerts = Config.PhoneApplications["phone"].Alerts + 1
    TriggerServerEvent('prp-phone:server:SetPhoneAlerts', "phone", Config.PhoneApplications["phone"].Alerts)
end)

RegisterNUICallback('GetCryptoData', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-crypto:server:GetCryptoData', function(CryptoData)
        cb(CryptoData)
    end, data.crypto)
end)

RegisterNUICallback('BuyCrypto', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-crypto:server:BuyCrypto', function(CryptoData)
        cb(CryptoData)
    end, data)
end)

RegisterNUICallback('SellCrypto', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-crypto:server:SellCrypto', function(CryptoData)
        cb(CryptoData)
    end, data)
end)

RegisterNUICallback('TransferCrypto', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-crypto:server:TransferCrypto', function(CryptoData)
        cb(CryptoData)
    end, data)
end)

RegisterNetEvent('prp-phone:client:RemoveBankMoney')
AddEventHandler('prp-phone:client:RemoveBankMoney', function(amount)
    if PhoneData.isOpen then
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Banco",
                text = "$"..amount.." removed from your bank!", 
                icon = "fas fa-university", 
                color = "#ff002f",
                timeout = 3500,
            },
        })
    else
        SendNUIMessage({
            action = "Notification",
            NotifyData = {
                title = "Bank",
                content = "$"..amount.." removed from your bank!!", 
                icon = "fas fa-university",
                timeout = 3500, 
                color = "#ff002f",
            },
        })
    end
end)

RegisterNetEvent('prp-phone:client:AddTransaction')
AddEventHandler('prp-phone:client:AddTransaction', function(SenderData, TransactionData, Message, Title)
    local Data = {
        TransactionTitle = Title,
        TransactionMessage = Message,
    }
    
    table.insert(PhoneData.CryptoTransactions, Data)

    if PhoneData.isOpen then
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Crypto",
                text = Message, 
                icon = "fas fa-chart-pie",
                color = "#04b543",
                timeout = 1500,
            },
        })
    else
        SendNUIMessage({
            action = "Notification",
            NotifyData = {
                title = "Crypto",
                content = Message, 
                icon = "fas fa-chart-pie",
                timeout = 3500, 
                color = "#04b543",
            },
        })
    end

    SendNUIMessage({
        action = "UpdateTransactions",
        CryptoTransactions = PhoneData.CryptoTransactions
    })

    TriggerServerEvent('prp-phone:server:AddTransaction', Data)
end)

RegisterNUICallback('GetCryptoTransactions', function(data, cb)
    local Data = {
        CryptoTransactions = PhoneData.CryptoTransactions
    }
    cb(Data)
end)

RegisterNUICallback('GetAvailableRaces', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-lapraces:server:GetRaces', function(Races)
        cb(Races)
    end)
end)

RegisterNUICallback('JoinRace', function(data)
    TriggerServerEvent('prp-lapraces:server:JoinRace', data.RaceData)
end)

RegisterNUICallback('LeaveRace', function(data)
    TriggerServerEvent('prp-lapraces:server:LeaveRace', data.RaceData)
end)

RegisterNUICallback('StartRace', function(data)
    TriggerServerEvent('prp-lapraces:server:StartRace', data.RaceData.RaceId)
end)

RegisterNetEvent('prp-phone:client:UpdateLapraces')
AddEventHandler('prp-phone:client:UpdateLapraces', function()
    SendNUIMessage({
        action = "UpdateRacingApp",
    })
end)

RegisterNUICallback('GetRaces', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-lapraces:server:GetListedRaces', function(Races)
        cb(Races)
    end)
end)

RegisterNUICallback('GetTrackData', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-lapraces:server:GetTrackData', function(TrackData, CreatorData)
        TrackData.CreatorData = CreatorData
        cb(TrackData)
    end, data.RaceId)
end)

RegisterNUICallback('SetupRace', function(data, cb)
    TriggerServerEvent('prp-lapraces:server:SetupRace', data.RaceId, tonumber(data.AmountOfLaps))
end)

RegisterNUICallback('HasCreatedRace', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-lapraces:server:HasCreatedRace', function(HasCreated)
        cb(HasCreated)
    end)
end)

RegisterNUICallback('IsInRace', function(data, cb)
    local InRace = exports['prp-lapraces']:IsInRace()
    cb(InRace)
end)

RegisterNUICallback('IsAuthorizedToCreateRaces', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-lapraces:server:IsAuthorizedToCreateRaces', function(IsAuthorized, NameAvailable)
        local data = {
            IsAuthorized = IsAuthorized,
            IsBusy = exports['prp-lapraces']:IsInEditor(),
            IsNameAvailable = NameAvailable,
        }
        cb(data)
    end, data.TrackName)
end)

RegisterNUICallback('StartTrackEditor', function(data, cb)
    TriggerServerEvent('prp-lapraces:server:CreateLapRace', data.TrackName)
end)

RegisterNUICallback('GetRacingLeaderboards', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-lapraces:server:GetRacingLeaderboards', function(Races)
        cb(Races)
    end)
end)

RegisterNUICallback('RaceDistanceCheck', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-lapraces:server:GetRacingData', function(RaceData)
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(ped)
        local checkpointcoords = RaceData.Checkpoints[1].coords
        local dist = GetDistanceBetweenCoords(coords, checkpointcoords.x, checkpointcoords.y, checkpointcoords.z, true)
        if dist <= 115.0 then
            if data.Joined then
                TriggerEvent('prp-lapraces:client:WaitingDistanceCheck')
            end
            cb(true)
        else
            PRPCore.Functions.Notify('Youre too far from the race, rerouting back to race..', 'error', 5000)
            SetNewWaypoint(checkpointcoords.x, checkpointcoords.y)
            cb(false)
        end
    end, data.RaceId)
end)

RegisterNUICallback('IsBusyCheck', function(data, cb)
    if data.check == "editor" then
        cb(exports['prp-lapraces']:IsInEditor())
    else
        cb(exports['prp-lapraces']:IsInRace())
    end
end)

RegisterNUICallback('CanRaceSetup', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-lapraces:server:CanRaceSetup', function(CanSetup)
        cb(CanSetup)
    end)
end)

RegisterNUICallback('GetPlayerHouses', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-phone:server:GetPlayerHouses', function(Houses)
        cb(Houses)
    end)
end)

RegisterNUICallback('RemoveKeyholder', function(data)
    TriggerServerEvent('prp-houses:server:removeHouseKey', data.HouseData.name, {
        citizenid = data.HolderData.citizenid,
        firstname = data.HolderData.charinfo.firstname,
        lastname = data.HolderData.charinfo.lastname,
    })
end)

RegisterNUICallback('FetchPlayerHouses', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-phone:server:MeosGetPlayerHouses', function(result)
        cb(result)
    end, data.input)
end)

RegisterNUICallback('SetGPSLocation', function(data, cb)
    local ped = GetPlayerPed(-1)

    SetNewWaypoint(data.coords.x, data.coords.y)
    PRPCore.Functions.Notify('GPS marcado!', 'success')
end)

RegisterNUICallback('SetApartmentLocation', function(data, cb)
    local ApartmentData = data.data.appartmentdata
    local TypeData = Apartments.Locations[ApartmentData.type]

    SetNewWaypoint(TypeData.coords.enter.x, TypeData.coords.enter.y)
    PRPCore.Functions.Notify('GPS marcado!', 'success')
end)

RegisterNUICallback('GetCurrentLawyers', function(data, cb)
    PRPCore.Functions.TriggerCallback('prp-phone:server:GetCurrentLawyers', function(lawyers)
        cb(lawyers)
    end)
end)

-- config


RegisterNUICallback('setmute', function(data)
    local val = data.val

end)

RegisterNUICallback('setcalls', function(data)
    local val = tonumber(data.val)
    PhoneData.MetaData.volcalls = val
    TriggerServerEvent('prp-phone:server:SaveMetaData', PhoneData.MetaData)
    exports["mvoip"]:SetCallVolume(PhoneData.MetaData.volcalls/10)
    --TriggerEvent('prp-voip:updateVol', PhoneData.MetaData)
end)

RegisterNUICallback('setradio', function(data)
    local val = tonumber(data.val)
    PhoneData.MetaData.volradio = val
    TriggerServerEvent('prp-phone:server:SaveMetaData', PhoneData.MetaData)
    exports["mvoip"]:SetRadioVolume(PhoneData.MetaData.volradio/10)
    --TriggerEvent('prp-voip:updateVol', PhoneData.MetaData)
end)

RegisterNUICallback('setclicks', function(data)
    local val = data.val
    PhoneData.MetaData.volclicks = val
    TriggerServerEvent('prp-phone:server:SaveMetaData', PhoneData.MetaData)
    --exports["mvoip"]:SetClickVolume(PhoneData.MetaData.volclicks)
    exports.prp_voice:setVoiceProperty("micClicks",PhoneData.MetaData.volclicks)
    --TriggerEvent('prp-voip:updateVol', PhoneData.MetaData)
end)

--- SERVICIOS

RegisterNetEvent('prp-phone:client:ServiceMessage')
AddEventHandler('prp-phone:client:ServiceMessage', function(data)
    local added = false
    if data.job == "ambulance" then
        if (PhoneData.PlayerData.job.name == "ambulance" or PhoneData.PlayerData.job.name == "doctor") and PhoneData.PlayerData.job.onduty then
            ServiceAlerts[data.id] = data
            added = true
        end
    else
        if PhoneData.PlayerData.job.name == data.job and PhoneData.PlayerData.job.onduty then
            ServiceAlerts[data.id] = data
            added = true
        end
    end
    if added then
        if PhoneData.isOpen then
            SendNUIMessage({
                action = "PhoneNotification",
                PhoneNotify = {
                    title = data.type,
                    text = data.text,
                    icon = "fa fa-exclamation-circle",
                    color = "#005e55",
                    timeout = 1500,
                    }
            })
        else
            SendNUIMessage({
                action = "Notification",
                NotifyData = {
                    title = data.type, 
                    content = data.text, 
                    icon = "fa fa-exclamation-circle", 
                    timeout = 3500, 
                    color = "#005e55",
                },
            })
        end
        SendNUIMessage({
            action = "ServiceMessage",
            datos = data,
        })
    end
end)

RegisterNUICallback('ServiceMessage', function(data, cb)
    TriggerServerEvent('prp-phone:server:ServiceMessage',data.name,data.text,"Service Messages",GetEntityCoords(PlayerPedId()))
end)

RegisterNUICallback('sAssist', function(data, cb)
    local id = data.id
    if ServiceAlerts[data.id] then
        local alert = ServiceAlerts[data.id]
        TriggerServerEvent('prp-phone:server:AsistService', alert.id)
        SetNewWaypoint(alert.coord.x, alert.coord.y)
        PRPCore.Functions.Notify('GPS Set!', 'success')
    end
end)

RegisterNUICallback('sGPS', function(data, cb)
    if ServiceAlerts[data.id] then
        local alert = ServiceAlerts[data.id]
        SetNewWaypoint(alert.coord.x, alert.coord.y)
        PRPCore.Functions.Notify('GPS Marked!', 'success')
    end
end)
--- GALERIA

RegisterNUICallback('GetGallery', function(data, cb)
    cb(PhoneData.Gallery)
end)

RegisterNUICallback('addGallery', function(data, cb)
    PhoneData.Gallery[#PhoneData.Gallery + 1] = data.url
    cb(PhoneData.Gallery)
    TriggerServerEvent('prp-phone:server:updateGallery',PhoneData.Gallery)
end)

RegisterNUICallback('deleteGallery', function(data, cb)
    local i = indexGalleryImage(data.url)
    if i then
        table.remove(PhoneData.Gallery,i)
    end
    cb(PhoneData.Gallery)
    TriggerServerEvent('prp-phone:server:updateGallery',PhoneData.Gallery)
end)

indexGalleryImage = function(url)
    for c,v in pairs(PhoneData.Gallery) do
        if v == url then
            return c
        end
    end
end

takingPhoto = false
frontCam = false

RegisterNUICallback('Camera', function(data, cb)
    CreateMobilePhone(0)
    CellCamActivate(true, true)
    SetNuiFocus(false, false)
    takingPhoto = true
    Citizen.Wait(500)
    while takingPhoto do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 27) then 
			frontCam = not frontCam
			CellFrontCamActivate(frontCam)
        elseif IsControlJustPressed(1, 177) or IsControlJustPressed(1, 288) or IsControlJustPressed(1, 22) then 
            DestroyMobilePhone()
            CellCamActivate(false, false)
            SetNuiFocus(true, true)
            cb(false)
            takePhoto = false
            SetPauseMenuActive(false)
            break
        elseif IsControlJustPressed(1, 176) then 
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'photo', 0.5)
            takePhoto = false
            exports['screenshot-basic']:requestScreenshotUpload('https://api.awau.moe/upload/pomf/associated?key=57a9e212-e462-41db-b7c6-5f5e0a795138&url=passion.is-fi.re', GetConvar("ea_screenshotfield", 'files[]'), function(data)
                local resp = data
                CellCamActivate(false, false)
                DestroyMobilePhone()
                SetNuiFocus(true, true)
                local x = json.decode(resp)
                local url = "http://passion.is-fi.re/"..x.files[1].url
                cb(url)
            end)            
            break
        end
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(19)
        HideHudAndRadarThisFrame()
        SetPauseMenuActive(false)
        DisableControlAction(1, 200, true)
    end
end)

function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
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

 RegisterNUICallback('SendDWChat', function(data, cb)
    local ChatMessage = {
        nickname = PRPCore.Functions.GetPlayerData().metadata["deepweb"].nickname,
        message = escape_str(data.Message),
        time = data.Date,
        chatId = GenerateDWChatId(),
        picture = data.Picture,
        notification = data.Notification
    }

    table.insert(PhoneData.DWChats, ChatMessage)
    Citizen.Wait(100)
    cb(PhoneData.DWChats)

    TriggerServerEvent('prp-phone:server:UpdateDWChats', PhoneData.DWChats, ChatMessage)
end)

RegisterNetEvent('prp-phone:server:UpdateDWChats')
AddEventHandler('prp-phone:server:UpdateDWChats', function(src, DWChats, NewChatData)
    PhoneData.DWChats = DWChats
end)

RegisterNUICallback('GetDWChats', function(data, cb)
    cb(PhoneData.DWChats)
end)

RegisterNUICallback('ChangeDWNickname', function(data, cb)
    TriggerServerEvent("ChangeDWNickname", data.nickname)
end)

RegisterNetEvent("prp-phone:client:CopyText")
AddEventHandler("prp-phone:client:CopyText", function(text)
    exports["CopyCoords"]:CopyText(text)
end)

RegisterNUICallback('RedeemAppCode', function(data, cb)
    local cbval = nil
    PRPCore.Functions.TriggerCallback("prp-phone:server:GetAppCodeData", function(appName)
        cbval = appName
    end, data.key)
    Citizen.Wait(3000)
    if cbval == nil then cbval = "timeout" end
    cb(cbval)
end)

RegisterNUICallback('RedeemAppCodeConfirm', function(data, cb)
    local cbval = {}
    cbval.result = nil
    PRPCore.Functions.TriggerCallback("prp-phone:server:ActivateApp", function(result)
        cbval.result = result
    end, data.key, data.app)
    Citizen.Wait(3000)
    if cbval.result == nil then cbval.result = false end
    if cbval.result then
        table.insert(PhoneData.appKeys, {
            AppTitle = data.app,
        })
    end
    cbval.appKeys = PhoneData.appKeys
    cbval.JobData = PRPCore.Functions.GetPlayerData().job
    cbval.applications = Config.PhoneApplications
    cb(cbval)
end)

RegisterNUICallback('GetJobs', function(data, cb)
    local PlayerData = PRPCore.Functions.GetPlayerData()
    local jobs = {
        currentJob = PlayerData.job,
        playerJobs = PlayerData.jobList
    }
    cb(jobs)
end)

-- This one is also called when accepting a job offer, firing, promoting or demoting an employee
RegisterNUICallback('SetJob', function(data, cb)
    local cbval = nil
    PRPCore.Functions.TriggerCallback("prp-phone:server:SetJob", function(result)
        cbval = result
    end, data.job, data.grade, data.action)
    while cbval == nil do 
        Citizen.Wait(100)
    end
    if data.action == "acceptOffer" then
        PhoneData.jobOffers[data.job] = nil
    end
    cb(cbval)
end)

RegisterNUICallback('RemoveJob', function(data, cb)
    local cbval = nil
    PRPCore.Functions.TriggerCallback("prp-phone:server:RemoveJob", function(result)
        cbval = result
    end, data.job)
    while cbval == nil do 
        Citizen.Wait(100)
    end
    cb(cbval)
end)

RegisterNUICallback('OfferJob', function(data, cb)
    TriggerServerEvent('prp-phone:server:OfferJob', data.player, data.job, data.grade)
end)

function UpdateJobOffers(notify, job)
    SendNUIMessage({
        action = "UpdateJobOffers",
    })
    if notify then
        if PhoneData.isOpen then
            SendNUIMessage({
                action = "PhoneNotification",
                PhoneNotify = {
                    title = "Jobs",
                    text = "You got a new job offer!",
                    icon = "fas fa-suitcase",
                    color = "#703C00",
                    timeout = 1500,
                },
            })
        else
            SendNUIMessage({
                action = "Notification",
                NotifyData = {
                    title = "Jobs", 
                    content = "You received a new job offer into "..PRPCore.Shared.Jobs[job].label.."!", 
                    icon = "fas fa-suitcase", 
                    timeout = 3500, 
                    color = "#703C00",
                },
            })
        end
    end
end

RegisterNetEvent("prp-phone:client:sendJobOffer")
AddEventHandler("prp-phone:client:sendJobOffer", function(job, grade)
    local notify = true
    if (PhoneData.jobOffers[job] ~= nil) then
        if PhoneData.jobOffers[job].grade == grade then
            notify = false
        end
    end
    PhoneData.jobOffers[job] = {
        job = PRPCore.Shared.Jobs[job],
        grade = grade,
    }
    UpdateJobOffers(notify, job)
end)

RegisterNUICallback('DenyJobOffer', function(data, cb)
    local done = false
    PhoneData.jobOffers[data.job] = nil
    PRPCore.Functions.TriggerCallback("prp-phone:server:DenyJobOffer", function(result)
        done = true
    end, data.job)
    while done == false do 
        Citizen.Wait(100)
    end
    cb(PhoneData.jobOffers)
end)

RegisterNUICallback('GetJobOffers', function(data, cb)
    cb(json.encode(PhoneData.jobOffers))
end)