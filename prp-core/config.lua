PRPConfig = {}

PRPConfig.MaxPlayers = GetConvarInt('sv_maxclients', 120) -- Gets max players from config file, default 32
PRPConfig.IdentifierType = "steam" -- Set the identifier type (can be: steam, license)
PRPConfig.DefaultSpawn = {x=-1035.71,y=-2731.87,z=12.86,a=0.0}

PRPConfig.Money = {}
PRPConfig.Money.MoneyTypes = {['cash'] = 1000, ['bank'] = 30000, ['crypto'] = 1 } -- ['type']=startamount - Add or remove money types for your server (for ex. ['blackmoney']=0), remember once added it will not be removed from the database!
PRPConfig.Money.DontAllowMinus = {"cash", "bank"} -- Money that is not allowed going in minus

PRPConfig.Player = {}
PRPConfig.Player.MaxWeight = 120000 -- Max weight a player can carry (currently 120kg, written in grams)
PRPConfig.Player.BagAdditionalWeightGrams = 100000 -- The additional weight added to inv by holding a duffel bag
PRPConfig.Player.MaxInvSlots = 40 -- Max inventory slots for a player
PRPConfig.Player.Bloodtypes = {
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
}

PRPConfig.Server = {} -- General server config
PRPConfig.Server.closed = false -- Set server closed (no one can join except people with ace permission 'fxadmin.join')
PRPConfig.Server.closedReason = "maintenance" -- Reason message to display when people can't join the server
PRPConfig.Server.uptime = 0 -- Time the server has been up.
PRPConfig.Server.whitelist = false -- Enable or disable whitelist on the server
PRPConfig.Server.discord = "https://discord.gg/passionrp" -- Discord invite link
PRPConfig.Server.PermissionList = {} -- permission list