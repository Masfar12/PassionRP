Config = {
    tienda = {
        coords = vector3(562.45, 2741.26, 42.87),
        animales = {
            {
                nombre = 'Cat',
                model = 1462895032,
                price = 3000,
                animations = {
                    { dictionary = 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', animation = "idle_a", name = "Lie down", },
                }
            },
            -- {
            --     nombre = 'Rabbit',
            --     model = -541762431,
            --     price = 1500,
            --     animations = {}
            -- },
            {
                nombre = 'Husky',
                model = 1318032802,
                price = 7000,
                animations = {
                    { dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lie down", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Bark", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_sitting@base", animation = "base", name = "Sit down", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Scratch", },
                    { dictionary = "creatures@rottweiler@indication@", animation = "indicate_high", name = "Ask for attention", },
                    { dictionary = "creatures@rottweiler@melee@streamed_taunts@", animation = "taunt_02", name = "Taunt", },
                    { dictionary = "creatures@rottweiler@melee@", animation = "dog_takedown_from_back", name = "Attack", },
                }
            },
            -- {
            --     nombre = 'Pig',
            --     model = -1323586730,
            --     price = 10000,
            --     animations = {
            --         { dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lie down", },
            --         { dictionary = "creatures@rottweiler@amb@world_dog_sitting@base", animation = "base", name = "Sit down", },
            --         { dictionary = "creatures@rottweiler@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Scratch", },
            --         { dictionary = "creatures@rottweiler@melee@", animation = "dog_takedown_from_back", name = "Attack", },
            --     }
            -- },
            {
                nombre = 'Poodle',
                model = 1125994524,
                price = 2500,
                animations = {
                    { dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lie down", },
                    { dictionary = "creatures@pug@amb@world_dog_barking@base", animation = "base", name = "Bark", },
                    { dictionary = "creatures@pug@amb@world_dog_sitting@base", animation = "base", name = "Sit down", },
                    { dictionary = "creatures@pug@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Scratch", },
                    { dictionary = "creatures@rottweiler@indication@", animation = "indicate_high", name = "Ask for attention", },
                    { dictionary = "creatures@pug@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Taunt", },
                    { dictionary = "creatures@pug@melee@streamed_core@", animation = "dog_takedown_from_back", name = "Attack", },
                }
            },
            {
                nombre = 'Pug',
                model = 1832265812,
                price = 3000,
                animations = {
                    { dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lie down", },
                    { dictionary = "creatures@pug@amb@world_dog_barking@base", animation = "base", name = "Bark", },
                    { dictionary = "creatures@pug@amb@world_dog_sitting@base", animation = "base", name = "Sit down", },
                    { dictionary = "creatures@pug@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Scratch", },
                    { dictionary = "creatures@rottweiler@indication@", animation = "indicate_high", name = "Ask for attention", },
                    { dictionary = "creatures@pug@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Taunt", },
                    { dictionary = "creatures@pug@melee@streamed_core@", animation = "dog_takedown_from_back", name = "Attack", },
                }
            },
            {
                nombre = 'Golden Retriever',
                model = 882848737,
                price = 3000,
                animations = {
                    { dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lie down", },
                    { dictionary = "creatures@retriever@amb@world_dog_barking@base", animation = "base", name = "Bark", },
                    { dictionary = "creatures@retriever@amb@world_dog_sitting@base", animation = "base", name = "Sit down", },
                    { dictionary = "creatures@retriever@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Scratch", },
                    { dictionary = "creatures@rottweiler@indication@", animation = "indicate_high", name = "Ask for attention", },
                    { dictionary = "creatures@rottweiler@melee@streamed_taunts@", animation = "taunt_02", name = "Taunt", },
                    { dictionary = "creatures@retriever@melee@base@", animation = "dog_takedown_from_back", name = "Attack", },
                }
            },
            {
                nombre = 'West Highland Terrier',
                model = -1384627013,
                price = 2500,
                animations = {
                    { dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lie down", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Bark", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_sitting@base", animation = "base", name = "Sit down", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Scratch", },
                    { dictionary = "creatures@rottweiler@indication@", animation = "indicate_high", name = "Ask for attention", },
                    { dictionary = "creatures@rottweiler@melee@streamed_taunts@", animation = "taunt_02", name = "Taunt", },
                    { dictionary = "creatures@rottweiler@melee@", animation = "dog_takedown_from_back", name = "Attack", },
                }
            },
            {
                nombre = 'Rottweiler',
                model = 351016938,
                price = 5000,
                animations = {
                    { dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lie down", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Bark", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_sitting@base", animation = "base", name = "Sit down", },
                    { dictionary = "creatures@rottweiler@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Scratch", },
                    { dictionary = "creatures@rottweiler@indication@", animation = "indicate_high", name = "Ask for attention", },
                    { dictionary = "creatures@rottweiler@melee@streamed_taunts@", animation = "taunt_02", name = "Taunt", },
                    { dictionary = "creatures@rottweiler@melee@", animation = "dog_takedown_from_back", name = "Attack", },
                }
            }
        }
    }
}