Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Config = {}

Config.MenuItems = {
    {
        id = 'citizen',
        title = 'Citizen Interaction',
        icon = '#citizen',
        items = {
            {
                id    = 'givenum',
                title = 'Give Number',
                icon = '#nummer',
                type = 'client',
                event = 'prp-phone:client:giveNumber',
                shouldClose = true,
            },
            {
                id    = 'givebank',
                title = 'Give bank details.',
                icon = '#banknr',
                type = 'client',
                event = 'prp-phone:client:giveBankAccount',
                shouldClose = true,
            },
            {
                id    = 'getintrunk',
                title = 'Get in trunk',
                icon = '#vehiclekey',
                type = 'client',
                event = 'prp-trunk:client:GetIn',
                shouldClose = true,
            },
            {
                id    = 'togglehotdogsell',
                title = 'Hotdog Sale',
                icon = '#cornerselling',
                type = 'client',
                event = 'prp-hotdogjob:client:ToggleSell',
                shouldClose = true,
            },
            {
                id = 'interactions',
                title = 'Interactions',
                icon = '#illegal',
                items = {
                    {
                        id    = 'handcuff',
                        title = 'Handcuff',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:CuffPlayerSoft',
                        shouldClose = true,
                    },
                    {
                        id    = 'playerinvehicle',
                        title = 'Drag in vehicle',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:PutPlayerInVehicle',
                        shouldClose = true,
                    },
                    {
                        id    = 'playeroutvehicle',
                        title = 'Drag out vehicle',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:SetPlayerOutVehicle',
                        shouldClose = true,
                    },
                   {
                     id    = 'stealplayer',
                       title = 'Rob player',
                       icon = '#general',
                       type = 'client',
                       event = 'police:client:RobPlayer',
                       shouldClose = true,
                   },
                    {
                        id    = 'escort',
                        title = 'Kidnap',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:KidnapPlayer',
                        shouldClose = true,
                    },
                    {
                        id    = 'escort2',
                        title = 'Escorter',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:EscortPlayer',
                        shouldClose = true,
                    },
                }
            },
        }
    },
    {
        id = 'general',
        title = 'General',
        icon = '#general',
        items = {
            {
                id = 'house',
                title = 'House Interaction',
                icon = '#house',
                items = {
                    {
                        id    = 'givehousekey',
                        title = 'Give house key',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'prp-houses:client:giveHouseKey',
                        shouldClose = true,
                        items = {},
                    },
                    {
                        id    = 'removehousekey',
                        title = 'Remove house key',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'prp-houses:client:removeHouseKey',
                        shouldClose = true,
                        items = {},
                    },
                    {
                        id    = 'togglelock',
                        title = 'Toggle Door',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'prp-houses:client:toggleDoorlock',
                        shouldClose = true,
                    },      
                    {
                        id = 'houseLocations',
                        title = 'Interaction Locations',
                        icon = '#house',
                        items = {
                            {
                                id    = 'setstash',
                                title = 'Set Stash',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'prp-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setoutift',
                                title = 'Set outfits',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'prp-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setlogout',
                                title = 'set log out',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'prp-houses:client:setLocation',
                                shouldClose = true,
                            },
                        }
                    },
                }
            },
            {
                id = 'illegalactions',
                title = 'Illegal action\'s',
                icon = '#illegal',
                items = {
                    {
                        id    = 'cornerselling',
                        title = 'Corner Selling',
                        icon = '#cornerselling',
                        type = 'client',
                        event = 'prp-drugs:client:cornerselling',
                        shouldClose = true,
                    }
                }
            },
            {
                id    = 'carkeys',
                title = 'Give car keys',
                icon = '#general',
                type = 'client',
                event = 'vehiclekeys:client:GiveKeys',
                shouldClose = false,
            },
        }
    },
    {
        id = 'vehicle',
        title = 'Vehicle interaction',
        icon = '#vehicle',
        items = {
            {
                id    = 'vehicledoors',
                title = 'Vehicle Doors',
                icon = '#vehicledoors',
                items = {
                    {
                        id    = 'door0',
                        title = 'Left door',
                        icon = '#leftdoor',
                        type = 'client',
                        event = 'prp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door4',
                        title = 'Hood',
                        icon = '#idkaart',
                        type = 'client',
                        event = 'prp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door1',
                        title = 'Right door',
                        icon = '#rightdoor',
                        type = 'client',
                        event = 'prp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door3',
                        title = 'Rear right door',
                        icon = '#rightdoor',
                        type = 'client',
                        event = 'prp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door5',
                        title = 'Trunk',
                        icon = '#idkaart',
                        type = 'client',
                        event = 'prp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door2',
                        title = 'Rear left door',
                        icon = '#leftdoor',
                        type = 'client',
                        event = 'prp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                }
            },
            {
                id    = 'vehicleseats',
                title = 'Swap Seats',
                icon = '#vehicleseat',
                items = {
                    {
                        id    = 'door0',
                        title = 'Driver Seat',
                        icon = '#plus',
                        type = 'client',
                        event = 'prp-radialmenu:client:ChangeSeat',
                        shouldClose = false,
                    },
                }
            },
            {
                id    = 'towvehicle',
                title = 'Uber Eats Missions',
                icon = '#vehicle',
                type = 'client',
                event = 'prp-uberdelivery:start',
                shouldClose = true,
            },
        }
    },
    {
        id = 'jobinteractions',
        title = 'Job interactions',
        icon = '#vehicle',
        items = {},
    },
}

Config.JobInteractions = {
    ["doctor"] = {
        {
            id    = 'statuscheck',
            title = 'Medical review person',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'treatwounds',
            title = 'Heal wounds',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true,
        },
        {
            id    = 'reviveplayer',
            title = 'Revive Player',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true,
        },
        -- {
        --     id    = 'emergencybutton2',
        --     title = 'Panic',
        --     icon = '#general',
        --     type = 'client',
        --     event = 'police:client:SendPoliceEmergencyAlert',
        --     shouldClose = true,
        -- },
        {
            id    = 'escort',
            title = 'Escort',
            icon = '#general',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true,
        },
        {
            id = 'brancardoptions',
            title = 'Stretcher',
            icon = '#vehicle',
            items = {
                {
                    id    = 'spawnbrancard',
                    title = 'Grab Stretcher',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:TakeBrancard',
                    shouldClose = false,
                },
                {
                    id    = 'despawnbrancard',
                    title = 'Delete Stretcher',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:RemoveBrancard',
                    shouldClose = false,
                },
            },
        },
    },
    ["ambulance"] = {
        {
            id    = 'statuscheck',
            title = 'Medical review person',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'treatwounds',
            title = 'Heal wounds',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true,
        },
        {
            id    = 'reviveplayer',
            title = 'Revive Player',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true,
        },
        -- {
        --     id    = 'emergencybutton2',
        --     title = 'Panic',
        --     icon = '#general',
        --     type = 'client',
        --     event = 'police:client:SendPoliceEmergencyAlert',
        --     shouldClose = true,
        -- },
        {
            id    = 'escort',
            title = 'Escort',
            icon = '#general',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true,
        },
        {
            id    = 'stretcher1',
            title = 'Grab Stretcher',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:TakeBrancard',
            shouldClose = true,
        },
        {
            id    = 'stretcher2',
            title = 'Remove Stretcher',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:RemoveBrancard',
            shouldClose = true,
        },
    },
     ["taxi"] = {
         {
             id    = 'togglemeter',
             title = 'Show/Hide Meter',
             icon = '#general',
             type = 'client',
             event = 'prp-taxi:client:toggleMeter',
             shouldClose = false,
         },
         {
              id    = 'togglemouse',
              title = 'Start/Stop Meter',
              icon = '#general',
              type = 'client',
              event = 'prp-taxi:client:enableMeter',
              shouldClose = true,
         },
         {
             id    = 'toggletaxi',
             title = 'Missions with NPC',
             icon = '#general',
             type = 'client',
             event = 'prp-taxi:client:DoTaxiNpc',
             shouldClose = true,
         },
     },
    ["tow"] = {
        {
            id    = 'togglenpc',
            title = 'Tow NPC Missions',
            icon = '#general',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true,
        },
        {
            id    = 'towvehicle',
            title = 'Tow Vehicle',
            icon = '#vehicle',
            type = 'client',
            event = 'prp-tow:client:TowVehicle',
            shouldClose = true,
        },



    },
    ["police"] = {
        -- {
        --     id    = 'emergencybutton',
        --     title = 'Panic',
        --     icon = '#general',
        --     type = 'client',
        --     event = 'police:client:SendPoliceEmergencyAlert',
        --     shouldClose = true,
        -- },
        {
            id    = 'checkvehstatus',
            title = 'Check Tune Status',
            icon = '#vehiclekey',
            type = 'client',
            event = 'prp-tunerchip:server:TuneStatus',
            shouldClose = true,
        },
        {
            id    = 'takedriverlicense',
            title = 'Take License',
            icon = '#vehicle',
            type = 'client',
            event = 'police:client:SeizeDriverLicense',
            shouldClose = true,
        },
        {
            id = 'policeinteraction',
            title = 'Police Interaction',
            icon = '#house',
            items = {
                {
                    id    = 'statuscheck',
                    title = 'Check person',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:CheckStatus',
                    shouldClose = true,
                },
                {
                    id    = 'checkstatus',
                    title = 'Status Check',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:CheckStatus',
                    shouldClose = true,
                },
                {
                    id    = 'escort',
                    title = 'Escort',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true,
                },
                {
                    id    = 'searchplayer',
                    title = 'Frisk',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:SearchPlayer',
                    shouldClose = true,
                },
                {
                    id    = 'jailplayer',
                    title = 'Jail',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true,
                },
            }
        },
        {
            id = 'policeobjects',
            title = 'Objects',
            icon = '#house',
            items = {
                {
                    id    = 'Traffic Cone',
                    title = 'Cone',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false,
                },
                {
                    id    = 'Barrier',
                    title = 'Barrier',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnBarier',
                    shouldClose = false,
                },
                {
                    id    = 'crimeScreen',
                    title = 'CrimeScreen',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:crimeScreen',
                    shouldClose = false,
                },
                {
                    id    = 'spawntent',
                    title = 'Tent',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false,
                },
                {
                    id    = 'scenelight',
                    title = 'scenelight',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false,
                },
                {
                    id    = 'deleteobject',
                    title = 'Delete object',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false,
                },
            }
        },
    },
    ["hotdog"] = {
        {
            id    = 'togglesell',
            title = 'Toggle Sale',
            icon = '#general',
            type = 'client',
            event = 'prp-hotdogjob:client:ToggleSell',
            shouldClose = true,
        },
    },
    ["mechanic"] = {
        {
            id    = 'towvehicle',
            title = 'Tow Vehicle',
            icon = '#vehicle',
            type = 'client',
            event = 'prp-tow:client:TowVehicle',
            shouldClose = true,
        },
        {
            id    = 'vehicleextras',
            title = 'Vehicle Extras',
            icon = '#vehicle',
            items = {
                {
                    id    = 'extra1',
                    title = 'Extra 1',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra2',
                    title = 'Extra 2',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra3',
                    title = 'Extra 3',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra4',
                    title = 'Extra 4',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra5',
                    title = 'Extra 5',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra6',
                    title = 'Extra 6',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra7',
                    title = 'Extra 7',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra8',
                    title = 'Extra 8',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra9',
                    title = 'Extra 9',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },                                                                                                                
            }
        },
    },
    ["mechanic1"] = {
        {
            id    = 'towvehicle',
            title = 'Tow Vehicle',
            icon = '#vehicle',
            type = 'client',
            event = 'prp-tow:client:TowVehicle',
            shouldClose = true,
        },
        {
            id    = 'vehicleextras',
            title = 'Vehicle Extras',
            icon = '#vehicle',
            items = {
                {
                    id    = 'extra1',
                    title = 'Extra 1',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra2',
                    title = 'Extra 2',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra3',
                    title = 'Extra 3',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra4',
                    title = 'Extra 4',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra5',
                    title = 'Extra 5',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra6',
                    title = 'Extra 6',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra7',
                    title = 'Extra 7',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra8',
                    title = 'Extra 8',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra9',
                    title = 'Extra 9',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },                                                                                                                
            }
        },
    },
    ["mechanic2"] = {
        {
            id    = 'towvehicle',
            title = 'Tow Vehicle',
            icon = '#vehicle',
            type = 'client',
            event = 'prp-tow:client:TowVehicle',
            shouldClose = true,
        },
        {
            id    = 'vehicleextras',
            title = 'Vehicle Extras',
            icon = '#vehicle',
            items = {
                {
                    id    = 'extra1',
                    title = 'Extra 1',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra2',
                    title = 'Extra 2',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra3',
                    title = 'Extra 3',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra4',
                    title = 'Extra 4',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra5',
                    title = 'Extra 5',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra6',
                    title = 'Extra 6',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra7',
                    title = 'Extra 7',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra8',
                    title = 'Extra 8',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },
                {
                    id    = 'extra9',
                    title = 'Extra 9',
                    icon = '#plus',
                    type = 'client',
                    event = 'prp-radialmenu:client:setExtra',
                    shouldClose = false,
                },                                                                                                            
            }
        },
    },
}

Config.TrunkClasses = {
    [0]  = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, --Coupes  
    [1]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sedans  
    [2]  = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --SUVs  
    [3]  = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, --Coupes  
    [4]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Muscle  
    [5]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sports Classics  
    [6]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sports  
    [7]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Super  
    [8]  = { allowed = false, x = 0.0, y = -1.0, z = 0.25 }, --Motorcycles  
    [9]  = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Off-road  
    [10] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Industrial  
    [11] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Utility  
    [12] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Vans  
    [13] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Cycles  
    [14] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Boats  
    [15] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Helicopters  
    [16] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Planes  
    [17] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Service  
    [18] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Emergency  
    [19] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Military  
    [20] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Commercial  
    [21] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Trains  
}