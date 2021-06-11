Config = Config or {}

Config.RepeatTimeout = 2000
Config.CallRepeats = 10
Config.OpenPhone = 244
Config.KeyExpireTime = 1209600 -- 14 days
Config.PhoneApplications = {
    ["phone"] = {
        app = "phone",color = "#04b543",icon = "fa fa-phone-alt",tooltipText = "Phone",tooltipPos = "top",job = false,blockedjobs = {},slot = 1,Alerts = 0,
    },
    ["whatsapp"] = {
        app = "whatsapp",color = "#25d366",icon = "fab fa-whatsapp",tooltipText = "Whatsapp",tooltipPos = "top",style = "font-size: 2.8vh";job = false,blockedjobs = {},slot = 2,Alerts = 0,
    },
    ["settings"] = {
        app = "settings",color = "#636e72",icon = "fa fa-cog",tooltipText = "Settings",tooltipPos = "top",style = "padding-right: .08vh; font-size: 2.3vh";job = false,blockedjobs = {},slot = 3,Alerts = 0,
    },
    ["twitter"] = {
        app = "twitter",color = "#1da1f2",icon = "fab fa-twitter",tooltipText = "Twitter",tooltipPos = "top",job = false,blockedjobs = {},slot = 4,Alerts = 0,
    },
    ["garage"] = {
        app = "garage",color = "#575fcf",icon = "fas fa-warehouse",tooltipText = "Garage",job = false,blockedjobs = {},slot = 5,Alerts = 0,
    },
    ["mail"] = {
        app = "mail",color = "#ff002f",icon = "fas fa-envelope",tooltipText = "Mail",job = false,blockedjobs = {},slot = 6,Alerts = 0,
    },
    ["advert"] = {
        app = "advert",color = "#ff8f1a",icon = "fas fa-ad",tooltipText = "Advertisements",job = false,blockedjobs = {},slot = 7,Alerts = 0,
    },
    ["bank"] = {
        app = "bank",color = "#9c88ff",icon = "fas fa-university",tooltipText = "Bank",job = false,blockedjobs = {},slot = 8,Alerts = 0,
    },
    ["camara"] = {
        app = "camara",color = "#454544",icon = "fas fa-camera",tooltipText = "Camera",job = false,blockedjobs = {},slot = 9,Alerts = 0,
    },
    ["racing"] = {
        app = "racing",color = "#353b48",icon = "fas fa-flag-checkered",tooltipText = "Racing",job = false,blockedjobs = {"police"},slot = 10,Alerts = 0,
    },
    ["gallery"] = {
        app = "gallery",color = "#ff002f",icon = "fas fa-image",tooltipText = "Gallery",job = false,blockedjobs = {},slot = 11,Alerts = 0,
    },
    ["internet"] = {
        app = "internet",color = "#333333",icon = "fab fa-chrome",tooltipText = "Internet",job = false,blockedjobs = {},slot = 12,Alerts = 0,
    },
    ["crypto"] = {
         app = "crypto",color = "#004682",icon = "fas fa-chart-pie",tooltipText = "Crypto",job = false,blockedjobs = {},slot = 13, Alerts = 0,
     },
    -- ["services"] = {
    --     app = "services",color = "#004682",icon = "fas fa-ad",tooltipText = "Services",job = false,blockedjobs = {},slot = 14,Alerts = 0,
    -- },
    ["lawyers"] = {
        app = "lawyers",color = "#353b48",icon = "fas fa-user-tie",tooltipText = "Lawyers",job = false,blockedjobs = {},slot = 14,Alerts = 0,
    },
    ["meos"] = {
        app = "meos",color = "#004682",icon = "fas fa-ad",tooltipText = "MDT",job = "police",blockedjobs = {},slot = 15,Alerts = 0,
    },
    ["tor"] = {
        app = "tor",color = "#EB94FF",icon = "fab fa-firefox-browser",tooltipText = "Tor browser",tooltipPos = "top",job = false,blockedjobs = {},slot = 16,Alerts = 0,needsCode = true,
    },
    ["jobs"] = {
        app = "jobs",color = "#703C00",icon = "fas fa-suitcase",tooltipText = "Job Manager",tooltipPos = "top",job = false,blockedjobs = {},slot = 17,Alerts = 0,
    },
}