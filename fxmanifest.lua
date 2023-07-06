fx_version 'cerulean'
game 'gta5'

author 'Votre nom'
description 'Script de gestion des bus'
version '1.0.0'

-- Dépendances
dependencies {
  'es_extended',
  -- Ajoutez d'autres dépendances ici si nécessaire
}

-- Manifeste du serveur
server_scripts {
  'config.lua',
  'server/main.lua',
}

-- Manifeste du client
client_scripts {
  'config.lua',
  'client/main.lua',
}
