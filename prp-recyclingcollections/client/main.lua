PRPCore = nil

_liveData = {
    isOnJob = false,
    vehicle = nil,
    isOnRoute = false,
    hasNewVehicle = false,
    blip = nil,
    currentRegionIndex = 0, -- 0 to start at the beginning (next one will be 1)
    remainingLocations = {
        north   = {table.unpack(_Config.collectionCoords.north)},
        east    = {table.unpack(_Config.collectionCoords.east)},
        south   = {table.unpack(_Config.collectionCoords.south)},
        west    = {table.unpack(_Config.collectionCoords.west)},
    },
}