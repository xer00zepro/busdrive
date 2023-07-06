local depotLock = {}
BDDB = {}
BDDB.Depot = {
    {
        uid = 'Legion1',
        name = "Legion Square",
        aZone = 997,
        zones = {
            menu = {x = 256.040, y = -866.1, z = 28.357},
            passenger = {x = 242.461, y = -862.791, z = 28.683},
            departure = {x = 238.818, y = -859.174, z = 30.478, h = 249.654},
            receiving = {x = 238.818, y = -859.174, z = 30.478, h = 249.654}
        },
        blip = {sprite = 58, color = 3, scale = 1.0}
    },
    {
        uid = 'city1',
        name = "Town Hall",
        aZone = 17,
        zones = {
            menu = {x = -560.992, y = -174.790, z = 37.11},
            passenger = {x = -563.057, y = -165.685, z = 37.096},
            departure = {x = -568.056, y = -165.575, z = 38.040, h = 289.892},
            receiving = {x = -569.6, y = -158.8, z = 38.1, h = 289.892}
        },
        blip = {sprite = 58, color = 3, scale = 1.0}
    },
    {
        uid = 'pillhub1',
        name = "Pillbox Dashound",
        aZone = 138,
        zones = {
            menu = {x = 457.4, y = -596.9, z = 27.499},
            passenger = {x = 469.526, y = -611.367, z = 27.499},
            departure = {x = 471.7, y = -606.8, z = 28.495, h = 174.100},
            receiving = {x = 442.503, y = -584.429, z = 28.495, h = 259.700}
        },
        blip = {sprite = 58, color = 3, scale = 1.0}
    },
    {
        uid = 'strawb1',
        name = "Strawberry Metro",
        aZone = 74,
        zones = {
            menu = {x = 260.424, y = -1202.279, z = 28.288},
            passenger = {x = 265.424, y = -1185.714, z = 28.537},
            departure = {x = 270.053, y = -1187.702, z = 29.443, h = 86.426},
            receiving = {x = 276.4, y = -1217.4, z = 29.443, h = 268.426}
        },
        blip = {sprite = 58, color = 3, scale = 1.0}
    },
    {
        uid = 'casino1',
        name = "Casino",
        aZone = 160,
        zones = {
            menu = {x = 935.0, y = .
ESX.RegisterServerCallback('bus:getNearestBusStop', function(source, cb, playerCoords)
  local nearestStop = GetNearestBusStop(playerCoords)
  cb(nearestStop)
end)

AddEventHandler('playerConnecting', function()
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end)

RegisterServerEvent('bus:requestBus')
AddEventHandler('bus:requestBus', function(playerCoords)
  local source = source
  ESX.TriggerServerCallback('bus:getNearestBusStop', function(nearestStop)
    if nearestStop then
      local bus = GenerateBus(nearestStop)
      AssignBusToPlayer(source, bus)
      TriggerClientEvent('bus:busAssigned', source, bus)
    else
      TriggerClientEvent('bus:noValidBusStop', source)
    end
  end, playerCoords)
end)
