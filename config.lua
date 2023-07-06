-- Configuration du script de gestion des bus

Config = {}

-- Configuration du système de passagers
Config.PassengerSystem = {
  Enabled = true, -- Activer/désactiver le système de passagers
  MaxPassengers = 10, -- Nombre maximum de passagers dans le bus
}

-- Configuration du système d'horaires et d'itinéraires
Config.ScheduleSystem = {
  Enabled = true, -- Activer/désactiver le système d'horaires et d'itinéraires
  BusStops = {
    { x = 100.0, y = -200.0, z = 30.0, destination = "Destination 1" },
    { x = 200.0, y = -300.0, z = 30.0, destination = "Destination 2" },
    -- Ajoutez d'autres arrêts de bus ici
  },
  ScheduleInterval = 5 * 60 * 1000, -- Intervalle entre les horaires de passage du bus (5 minutes par défaut)
}

-- Configuration du système de paiement des passagers
Config.PaymentSystem = {
  Enabled = true, -- Activer/désactiver le système de paiement des passagers
  Fare = 5, -- Tarif du bus en dollars
}

-- Configuration du système de maintenance du bus
Config.MaintenanceSystem = {
  Enabled = true, -- Activer/désactiver le système de maintenance du bus
  BreakdownChance = 5, -- Probabilité de panne du bus en pourcentage (5% par défaut)
}

-- Configuration du système de personnalisation du bus
Config.CustomizationSystem = {
  Enabled = false, -- Activer/désactiver le système de personnalisation du bus
}

-- Configuration de l'intégration avec le framework ESX
Config.ESX = {
  Enabled = true, -- Activer/désactiver l'intégration avec ESX
  JobName = "busdriver", -- Nom du métier dans ESX pour le chauffeur de bus
  PaymentTrigger = "esx_addonaccount:getSharedAccount", -- Nom de l'événement pour effectuer le paiement via ESX
  PaymentAccount = "society_busdriver", -- Nom du compte dans ESX pour effectuer les paiements
}
Config.Command = "bus"

-- Export de la configuration pour être accessible à d'autres scripts
return Config
