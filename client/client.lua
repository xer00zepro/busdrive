-- Variables globales
local busStops = {} -- Liste des arrêts de bus
local nextStations = {} -- Liste des prochaines stations

-- Événement pour recevoir les arrêts de bus
RegisterNetEvent('bus:SetBusStops')
AddEventHandler('bus:SetBusStops', function(stops)
    busStops = stops
    for _, stop in ipairs(busStops) do
        AddBusStopOverlay(stop)
    end
end)
RegisterKeyMapping('busRequest', 'Demander un bus', 'keyboard', 'E')

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustPressed(0, Keys['E']) then
      local playerCoords = GetEntityCoords(PlayerPedId())
      TriggerServerEvent('bus:requestBus', playerCoords)
    end
  end
end)
-- Événement pour supprimer un arrêt de bus de l'overlay
RegisterNetEvent('bus:RemoveBusStopOverlay')
AddEventHandler('bus:RemoveBusStopOverlay', function(stop)
    -- Supprimer l'arrêt de bus de l'overlay
end)

-- Événement pour recevoir les prochaines stations
RegisterNetEvent('bus:SetNextStationsOverlay')
AddEventHandler('bus:SetNextStationsOverlay', function(stations)
    nextStations = stations
    -- Mettre à jour l'overlay des prochaines stations
end)

-- Événement pour notifier le joueur que le bus est en route
RegisterNetEvent('bus:NotifyBusEnRoute')
AddEventHandler('bus:NotifyBusEnRoute', function()
    -- Afficher un message indiquant que le bus est en route
end)

-- Événement pour notifier le chauffeur du bus qu'une maintenance est nécessaire
RegisterNetEvent('bus:NotifyMaintenanceNeeded')
AddEventHandler('bus:NotifyMaintenanceNeeded', function()
    -- Afficher un message indiquant qu'une maintenance est nécessaire
end)

-- Fonction pour demander un bus
function RequestBus()
    TriggerServerEvent('bus:RequestBus')
end

-- Fonction pour ajouter un arrêt de bus à l'overlay
function AddBusStopOverlay(stop)
    -- Ajouter l'arrêt de bus à l'overlay
end

-- Côté client - code pour l'affichage des overlays

-- Ajoutez votre propre code pour afficher les overlays sur la carte

-- Côté client - code pour l'interaction avec le bus et le chauffeur

-- Ajoutez votre propre code pour l'interaction avec le bus et le chauffeur
local isReady = false
local polydebug = false
local Depot = {}
local Driver = {}
local Blip = {}
local BusBlip = {}
local pZones = {}
local PassengerZones = {}
local signObjs = {}
local DepotPolyList = nil
local currentZone = nil
local currentRoutes = nil
local pedGroup = nil  
local drivingStyle = 786603
local maxBusSpeed = 20.0
activeDepot = nil
activeBus = nil
activeBusNetId = nil
activeDriver = nil
activeState = nil

-- Ajoutez les fonctions et les variables nécessaires ici

-- NET HANDLERS
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteBusAndDriver(activeBus, activeDriver)
        for j=1, #signObjs do
            DeleteObject(signObjs[j])        
        end
    end
end)

RegisterNetEvent('bdm:errormsg')
AddEventHandler('bdm:errormsg', function(errormsg)  
    print(errormsg)    
end)

-- Ajoutez les autres événements réseau ici

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isReady == true then
            for i=1, #Depot do
                if not DoesBlipExist(Blip[Depot[i].uid]) then                    
                    Blip[Depot[i].uid] = AddBlipForCoord(Depot[i].zones.menu.x, Depot[i].zones.menu.y, Depot[i].zones.menu.z)
                    SetBlipSprite(Blip[Depot[i].uid], Depot[i].blip.sprite)
                    SetBlipDisplay(Blip[Depot[i].uid], 4)
                    SetBlipScale(Blip[Depot[i].uid], Depot[i].blip.scale)
                    SetBlipColour(Blip[Depot[i].uid], Depot[i].blip.color)
                    SetBlipAsShortRange(Blip[Depot[i].uid], true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Bus Transfer")
                    EndTextCommandSetBlipName(Blip[Depot[i].uid])
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if activeBus ~= nil then
            if IsVehicleStuckOnRoof(activeBus) or IsEntityUpsidedown(activeBus) or IsEntityDead(activeDriver) or IsEntityDead(activeBus) then
                DeleteBusAndDriver(activeBus, activeDriver)  
            end

            local buscoords = GetEntityCoords(activeBus)
            local distancetostop = GetDistanceBetweenCoords(buscoords[1], buscoords[2], buscoords[3], activeDepot.zones.recieving.x, activeDepot.zones.recieving.y, activeDepot.zones.recieving.z, false)

            if activeState == nil  then
                TaskVehicleTempAction(activeDriver, activeBus, 6, 2000)
                SetVehicleHandbrake(activeBus, true)
                SetVehicleEngineOn(activeBus, true, true, false)
            else
                SetVehicleHandbrake(activeBus, false)

                if distancetostop >= 100.0 then
                    -- TaskVehicleDriveToCoordLongrange(activeDriver, activeBus, activeDepot.zones.recieving.x, activeDepot.zones.recieving.y, activeDepot.zones.recieving.z, maxBusSpeed, drivingStyle)
                    TaskVehicleDriveToCoordLongrange(activeDriver, activeBus, activeDepot.zones.recieving.x, activeDepot.zones.recieving.y, activeDepot.zones.recieving.z, maxBusSpeed, drivingStyle, 1.0)
                else
                    SetVehicleEngineOn(activeBus, false, true, false)
                    TaskLeaveVehicle(activeDriver, activeBus, 256)
                    SetVehicleEngineOn(activeBus, true, true, false)
                    TaskVehicleTempAction(activeDriver, activeBus, 6, 2000)
                end
            end
        end
    end
end)

-- Ajoutez les autres threads ici

