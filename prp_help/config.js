const config = {

    /**
     * Basic settings
     */
    settings: {
        page_height: 730,
    },

    /**
     * This is where we define pages. The pages and navbar will show in order listed here
     * The "contact us" and "commands" are prebuild pages that still **MUST** be defined here,
     * or they will not show
     */
    pages:  [
        {
            enabled: true,
            title: `Home`,
            contents: `<h1>Hi there, Nova Gillon here extending a warm welcome to you all!</h1><br>This is where power, wealth, dreams and business are booming, where the streets are bustling and life is moving at high speed!<br>We have plenty of career options for you to pursue, whether you want to go into law enforcement with our Police Department, provide legal support within our DOJ, treat the wounded as a doctor at Pillbox Hospital or simply want to collect scrap for Mohammed, there's plenty of avenues for you to venture down!<br>What separates us from other cities is our high crime rate but our police force is working tirelessly to stomp out criminal activity and corruption. Regardless of what path you choose, head over to our city hall, get yourself signed up for a job, start earning your way and begin writing your story.<br>Settle down in Los Santos, the city of opportunity.<br></br>- His Excellency, Nova Gillion, The Governor.<br><br><h2>Discordia(Discord)</h2><ins>discord.gg/passionrp</ins>`
        },
        {
            enabled: true,
            title: `List of Content`,
            contents: `<h1>Content List</h1><br><ul><li>Robberies</li><ul><li>Banks</li><li>Jewelry</li><li>Convenience Stores</li><li>Houses</li><li>Electronics Store</li></ul><li>Secret Heists</li><li>NPC Missions</li><ul><li>Van Missions</li><li>Drug Missions</li></ul><li>Whitelisted Jobs</li><ul><li>Police/EMS/Mechanics/Gangs/Vehicle Sales</li></ul><li>Crafting</li><li>Racing</li><li>Cryptocurrency</li><li>Legal Jobs</li><ul><li>Lumberjack</li><li>Uber</li><li>Truck Driver</li><li>Garbage Truck</li><li>Hot Dog Salesman</li><li>Miner</li><li>Tow Truck</li></ul></ul>`
        },
        {
            enabled: true,
            title: `Commands / Hotkeys`,
            contents: `{commands}`,
        },
        {
            enabled: false,
            title: `Contact Us`,
            contents: `{contact}`,
        },
        {
            enabled: true,
            title: `City Rules`,
            contents: `<h2>Common Rules</h2> <ul> <li>NVL - Remember to value your life in all situations.</li><li>FailRP - Fail roleplay i.e jumping off bridges repeatedly.</li><li>RDM/VDM - Going up to a group and shooting someone for no reason.<br> This includes random deathmatch using a vehicle as well.</li><li>Character immersion - Stay in character and within your characters lane.<br> South-side gangs wouldn't naturally want attention from the police.</li><li>OOC - Don't mention anything out of character within the city.</li><li>Meta Gaming - Don't use any information you have not obtained in-character.</li><li>Don't abuse game mechanics.</li><li>Report any bugs you find.</li><li>NLR - If you aren't picked up by EMS, the new life rule applies and you must forget the events that led to your death.</li> </ul> <br><br>Head to our #FAQ channel on Discord to view the full set of rules.<br><br> `
        },
        {
            enabled: true,
            title: `FAQ`,
            contents: `<h3>Q: How do I make money?</h3>A: We have plenty of legal jobs available which can be acquired by going over to CITY HALL and selecting which job you'd like to try! Other more Criminal avenues will open up to you as you progress your story within the city! <br><br> <h3>Q: Where do people hang out?</h3>A: It varies, but mostly checking common places like PDM and Pillbox (Hospital) are good places to start!<br><br> <h3>Q: Where can I report a player or file a refund request?</h3>A: Hit the "Contact Us" tab.<br><br>`
        },
        {
            enabled: true,
            title: `Keybinds`,
            contents: `<h1>Key binds</h1><br>You can open your binds menu by typing <ins>/binds</ins><br><img src="https://i.imgur.com/hQlZniM.png"><br><br><h2>Command & Argument</h2>Any in-game command you can bind in this menu, if you take for example <ins>/e handsup</ins> you will be able to bind your "Hands Up" emote to any Key (F2-F10) including Numbpad (7-9) as "handsup" is the argument and "e" is the command.`
        },
    ],

    /**
     * Should we enable the "contact us" module?
     * IMPORTANT: Make sure you update the discord webhook url in config.lua
     */
    contact: {
        wait_between_contact_us: 5, // In minutes, prevents spam on a discord server
        categories: ['General Inquiry', 'Player Report', 'Bug Report', 'Refund Request', 'Complaint Report']
    },

    /**
     * Commands
     */
    commands: [
        {
            name: 'General',
            items: [
                {
                    command: '/help',
                    info: 'Show this popup'
                },
                {
                    command: '/r',
                    args: '{# frequency number} | /r 0 to get off radio',
                    info: 'Join/Leave radio (channels)'
                },
                {
                    command: '/911',
                    info: 'Contact Emergency Services'
                },
                {
                    command: '/clearcommands',
                    info: 'If youre stuck use this command'
                },
                {
                    command: '/binds',
                    info: 'Open personal keybind Menu'
                },
                {
                    command: '/411',
                    info: 'Contact Mechanic Services'
                },
                {
                    command: '/me',
                    info: 'Display "me doing" text on screen'
                },
                {
                    command: '/report',
                    info: 'Get in touch with a game moderator'
                },
                {
                    command: '/do',
                    info: 'Display actions'
                },
                { 
                    command: '/rob',
                    args: '{id}',
                    info: 'Rob a player within RP, do not abuse this.'
                },
                {
                    command: '/givecash',
                    info: 'Give cash to someone'
                },
                {
                    command: '/notes',
                    info: 'Open your notepad'
                },
                {
                    command: '/news',
                    info: 'Walk up to a news stand to read the news.'
                },
                {
                    command: '/sc',
                    info: 'Softcuff someone'
                },
                {
                    command: '/carry',
                    info: 'Carry a person'
                },
                {
                    command: '/hostage',
                    info: 'Take someone hostage (with a gun equipped)'
                },
                {
                    command: '/dice',
                    args: '{# of sides} {# of dice}',
                    info: 'Roll a die'
                },
                {
                    command: '/record',
                    info: 'Start recording your gameplay'
                },
            ],
        },
        {
            name: 'Outfit',
            items: [
                {
                    command: '/hat',
                    info: 'Take helmet/hat off/on'
                },
                {
                    command: '/glasses',
                    info: 'Take glasses off/on'
                },
                {
                    command: '/mask',
                    info: 'Take mask off/on'
                },
                {
                    command: '/neck',
                    info: 'Take neck accessory off/on'
                },
                {
                    command: '/gloves',
                    info: 'Take gloves accessory off/on'
                },
                {
                    command: '/bag',
                    info: 'opens or closes your bag'
                },
                { 
                    command: '/putonhat',
                    info: 'in case your hat gets hit off your head'
                },
                {
                    command: '/putonglasses',
                    info: 'in case your glasses gets hit off your face'
                },
                {
                    command: '/putonmask',
                    info: 'In case your mask gets hit off your face'
                },
                {
                    command: '/revertclothing',
                    info: 'Revert clothes to normal.'
                },
            ],
        },
        {
            name: 'Vehicles',
            items: [
                {
                    command: '/shuffle',
                    info: 'Shuffle Car Seat'
                },
                {
                    command: '/engine',
                    info: 'Toggle engine ON/OFF'
                },
                {
                    command: '/givecarkeys',
                    info: 'Give your car keys to someone'
                },
                { 
                    command: '/windowsup',
                    info: 'Roll windows up'
                },
                {
                    command: '/getintrunk',
                    info: 'Get in trunk'
                },
            ],
        },
        {
            name: 'Police',
            items: [
                {
                    command: '/sc',
                    info: 'Softcuff'
                },
                {
                    command: '/impound',
                    args: 'price {$}',
                    info: 'Impound vehicle with or without charge'
                },
                {
                    command: '/panic',
                    info: 'Toggle Panic Button'
                },
                {
                    command: '/seizeveh',
                    info: 'Seize a vehicle'
                },
                {
                    command: '/flagplate',
                    args: '{plate} {reason}',
                    info: 'Flag a vehicle plate for the ANPR'
                },
                {
                    command: '/unflagplate',
                    args: '{plate}',
                    info: 'Unflag a flagged vehicle plate'
                },
                {
                    command: '/showcad',
                    info: 'Show Police CAD system'
                },
                {
                    command: '/escort',
                    info: 'Escort a suspect'
                },
                {
                    command: '/seizecash',
                    args: 'player {id} & price {$}',
                    info: 'Seize player cash.'
                },
            ],
        },
        {
            name: 'EMS',
            items: [
                {
                    command: '/revive',
                    info: 'Revive a player'
                },
                {
                    command: '/status',
                    args: 'player {id}',
                    info: 'Check for player injuries'
                },
                {
                    command: '/escort',
                    info: 'Escort a patient'
                },
            ],
        },
        {
            name: 'Taxi',
            items: [
                {
                    command: '/taxibase',
                    info: 'Set the base price of your taxi meter.'
                },
                {
                    command: '/taxifreeze',
                    info: 'Stop the taxi meter from running.'
                },
                {
                    command: '/taximin',
                    info: 'Set the minimal price per minute in your taxi meter.'
                },
                {
                    command: '/taxireset',
                    info: 'Reset your taxi to base values.'
                },
            ],
        },
    ],

    /**
     * Hotkeys
     */
    hotkeys: [
        {
            name: 'General',
            items: [
                {
                    pressKey: 'TAB',
                    info: 'Open the inventory'
                },
                { 
                    pressKey: 'Y',
                    info: 'Hold to open your clothing menu whilst on foot!'
                },
                {
                    pressKey: 'M',
                    info: 'Pull up the phone (must own one)'
                },
                {
                    pressKey: '`',
                    info: 'Hold to enable your interaction menu',
                    special: 'You can interact with yourself, other players, your pet, vehicles and objects!'
                },
                {
                    pressKey: 'B',
                    info: 'Point in the direction you are facing'
                },
                {
                    pressKey: 'ESC',
                    info: 'Show GPS MAP'
                },
                {
                    pressKey: 'DEL',
                    info: 'Open emote menu'
                },
                {
                    pressKey: 'HOME',
                    info: 'Show availability and player IDs',
                    special: 'Ensure to HOLD HOME to show which jobs are online.'
                },
            ]
        },
        {
            name: 'Vehicle',
            items: [
                {
                    pressKey: 'B',
                    info: 'Press to toggle Seatbelt'
                },
                { 
                    pressKey: 'Y',
                    info: 'Press to open your Car HUD menu whilst in a vehicle!'
                },
                {
                    pressKey: 'L',
                    info: 'Press to Toggles Car Door locks'
                },
                {
                    pressKey: 'G',
                    info: 'Press to Toggle Cruise Control'
                },
                {
                    pressKey: 'CTRL + SPACEBAR',
                    info: 'Press to Toggle Auto Pilot (EMS/PD RESTRICTED)'
                },
            ]
        },
        {
            name: 'Voice',
            items: [
                {
                    pressKey: 'F1',
                    info: 'Change voice range'
                },
                {
                    pressKey: 'CAPS LOCK',
                    info: 'PTT key to speak on radio'
                },
                {
                    pressKey: 'Teamspeak PTT Key',
                    info: 'Normal Voice Push to Talk',
                    special: 'This is set & comes from the teamspeak application'
                },
            ]
        },
        {
            name: 'Movement',
            items: [
                {
                    pressKey: 'ALT',
                    info: 'Tackle (fall over)',
                    special: 'Must be running before pressing keys'
                },
            ]
        },
    ],

    locale: {
        'submitted': 'Your requested has been submitted',
        'not_enough': 'Field {name} is not enough characters. Minimum is {amount}',
        'too_many': 'Field {name} has too many characters. Maximum is {amount}',
        'missing_fields': 'Please ensure all fields are filled out',
        'post_error': 'There was an error processing your request',
        'wait_between': 'Please wait 5 minutes between submitting requests'
    }


}

export default config;