local _markers = exports.libs:Markers()

_DoorsConfig   = {
    markers = _markers,
    doors   = {
        {
            bringVehicle = true,
            left         = {
                marker  = _markers.ThickChevronUp,
                seeDist = 10,
                useDist = 4,
                label   = "Real Estate Parking",
                coords  = vector3(-1537.18494, -578.21821, 25.70779),
                heading = 29.20671,
            },
            right        = {
                marker  = _markers.ThickChevronUp,
                seeDist = 10,
                useDist = 4,
                label   = "Real Estate Garage",
                coords  = vector3(-1572.18592, -571.19654, 86.50052),
                heading = 214.36978,
            },
        },
        {
            bringVehicle = false,
            left         = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Real Estate Enter",
                coords  = vector3(-1586.11463, -561.57068, 86.50051),
                heading = 216.61416,
            },
            right        = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Real Estate Garage",
                coords  = vector3(-1577.87317, -563.71735, 108.52295),
                heading = 123.96675,
            },
        },
        {
            bringVehicle = false,
            left         = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Real Estate Roof",
                coords  = vector3(-1581.46253, -562.26691, 108.52288),
                heading = 306.24398,
            },
            right        = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Real Estate Office",
                coords  = vector3(-1560.94336, -568.87989, 114.44849),
                heading = 34.43826,
            },
        },
        {
            restrictions = {
                jobs = {
                    {
                        name  = 'realestateagent',
                        grade = 0,
                    },
                },
            },
            bringVehicle = false,
            left         = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Enter Arcadeus Office",
                coords  = vector3(-116.20485, -603.40546, 36.28076),
                heading = 251.85868,
            },
            right        = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Exit Arcadeus Office",
                coords  = vector3(-142.66894, -614.27204, 168.82049),
                heading = 273.2998,
            },
        },
        {
            restrictions = {
                jobs = {
                    {
                        name  = 'realestateagent',
                        grade = 0,
                    },
                },
            },
            bringVehicle = true,
            left         = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Enter Arcadeus Parking",
                coords  = vector3(-144.22852, -576.69654, 32.42448),
                heading = 156.88647,
            },
            right        = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Exit Arcadeus Parking",
                coords  = vector3(-182.32029, -573.16449, 136.00036),
                heading = 261.13186,
            },
        },
        {
            restrictions = {
                jobs = {
                    {
                        name  = 'realestateagent',
                        grade = 0,
                    },
                },
            },
            bringVehicle = false,
            left         = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Enter Arcadeus Office",
                coords  = vector3(-198.19788, -580.68757, 136.00038),
                heading = 275.55407,
            },
            right        = {
                marker  = _markers.ThickChevronUp,
                seeDist = 5,
                useDist = 2,
                label   = "Enter Arcadeus Parking",
                coords  = vector3(-139.56757, -620.79834, 168.82051),
                heading = 87.77282,
            },
        },
        {
            bringVehicle = false,
            left         = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Upstairs",
                coords  = vector3(-46.43, 832.345, 231.331),
                heading = 832.345,
            },
            right        = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Downstairs",
                coords  = vector3(-61.744, 825.157, 235.73),
                heading = 825.204,
            },
        },
        {
            bringVehicle = false,
            left         = {
                seeDist = 5,
                useDist = 2,
                label   = "Take the elevator to the hospital",
                coords  = vector3(344.722, -586.448, 28.796),
                heading = 249.65,
            },
            right        = {
                seeDist = 5,
                useDist = 2,
                label   = "Take the elevator to the lower hospital",
                coords  = vector3(329.89, -601.03, 43.284),
                heading = 68.469,
            },
        },
        {
            bringVehicle = false,
            left         = {
                seeDist = 5,
                useDist = 2,
                label   = "Take the elevator to the hospital",
                coords  = vector3(338.613, -583.853, 74.161),
                heading = 249.824,
            },
            right        = {
                seeDist = 5,
                useDist = 2,
                label   = "Take the elevator to roof",
                coords  = vector3(327.239, -603.606, 43.284),
                heading = 340.125,
            },
        },
        {
            restrictions = {
                jobs  = {
                    {
                        name  = "police",
                        grade = 0,
                    },
                    {
                        name  = "doctor",
                        grade = 0,
                    },
                    {
                        name  = "ambulance",
                        grade = 0,
                    },
                    {
                        name  = "citygov",
                        grade = 2,
                    },
                },
                items = {
                    "hospitalkeycard",
                    "trueoriginalcard",
                },
            },
            bringVehicle = false,
            left         = {
                seeDist = 5,
                useDist = 2,
                label   = "Take the elevator to the parking garage",
                coords  = vector3(332.067, -595.619, 43.284),
                heading = 249.824,
            },
            right        = {
                seeDist = 5,
                useDist = 2,
                label   = "Take the elevator to hospital",
                coords  = vector3(341.219, -580.901, 28.796),
                heading = 66.66,
            },
        },
        {
            restrictions = {
                jobs  = {
                    {
                        name  = "police",
                        grade = 0,
                    },
                    {
                        name  = "doctor",
                        grade = 0,
                    },
                    {
                        name  = "ambulance",
                        grade = 0,
                    },
                    {
                        name  = "citygov",
                        grade = 2,
                    },
                },
                items = {
                    "hospitalkeycard",
                    "trueoriginalcard",
                },
            },
            bringVehicle = false,
            left         = {
                seeDist = 5,
                useDist = 2,
                label   = "Take the elevator to the morgue",
                coords  = vector3(339.961, -584.74, 28.796),
                heading = 69.993,
            },
            right        = {
                seeDist = 5,
                useDist = 2,
                label   = "Take the elevator to hospital",
                coords  = vector3(247.08, -1371.982, 24.537),
                heading = 319.353,
            },
        },
        {
            bringVehicle = false,
            left         = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Upstairs",
                coords  = vector3(-1510.625, 6.339, 56.066),
                heading = 261.224,
            },
            right        = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Downstairs",
                coords  = vector3(-1509.396, 10.696, 61.434),
                heading = 258.922,
            },
        },
        {
            bringVehicle = false,
            left         = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Upstairs",
                coords  = vector3(-1579.128, 13.422, 61.082),
                heading = 170.954,
            },
            right        = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Downstairs",
                coords  = vector3(-1586.211, 19.526, 65.792),
                heading = 78.4,
            },
        },
        {
            bringVehicle = false,
            left         = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Upstairs",
                coords  = vector3(-1635.24, 26.064, 62.536),
                heading = 156.327,
            },
            right        = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Downstairs",
                coords  = vector3(-1649.542, 20.05, 66.393),
                heading = 155.013,
            },
        },
        {
            bringVehicle = false,
            left         = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Upstairs",
                coords  = vector3(-1481.098, -41.099, 56.844),
                heading = 129.428,
            },
            right        = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Downstairs",
                coords  = vector3(-1477.477, -34.955, 63.006),
                heading = 40.723,
            },
        },
        {
            bringVehicle = false,
            left         = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Upstairs",
                coords  = vector3(-895.649, 49.904, 50.038),
                heading = 53.318,
            },
            right        = {
                marker  = _markers.HorizontalBars,
                seeDist = 5,
                useDist = 2,
                label   = "Go Downstairs",
                coords  = vector3(-900.785, 46.315, 53.129),
                heading = 323.713,
            },
        },
        {
            bringVehicle = true,
            left         = {
                marker  = _markers.CarSymbol,
                seeDist = 10,
                useDist = 5,
                label   = "Enter Garage",
                coords  = vector3(722.87, -822.836, 24.717),
                heading = 177.277,
            },
            right        = {
                marker  = _markers.CarSymbol,
                seeDist = 10,
                useDist = 5,
                label   = "Leave Garage",
                coords  = vector3(2681.24, -361.077, -55.187),
                heading = 269.895,
            },
            restrictions = {
                jobs  = {
                    {
                        name  = "arcade",
                        grade = 4,
                    },
                    {
                        name  = "house",
                        grade = 0,
                    },
                },
            },
        },
    },
}