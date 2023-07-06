# busdrive
# Script de gestion des bus

Ce script permet de gérer les bus dans un serveur de jeu en ligne. Il offre différentes fonctionnalités pour les joueurs et les chauffeurs de bus.

## Fonctionnalités

- Affichage des arrêts de bus sur la carte
- Demande de bus pour les joueurs
- Affichage des prochaines stations du bus en cours de route
- Notifications pour informer les joueurs lorsque le bus est en route
- Notifications pour alerter le chauffeur du bus lorsqu'une maintenance est nécessaire
- Interaction avec le bus et le chauffeur
- Suppression d'un arrêt de bus de l'overlay
- Gestion des dépôts de bus
- Affichage des repères (blips) pour les dépôts de bus
- Contrôle du comportement du bus (vitesse, itinéraire, etc.)
- Gestion des erreurs et affichage des messages d'erreur appropriés
- Configurabilité des paramètres du script
- Utilisation de threads pour des mises à jour en temps réel
- Gestion des ressources pour une suppression appropriée des objets et des données
- Documentation détaillée pour faciliter l'intégration du script dans le serveur de jeu

## Installation

1. Copiez les fichiers du script dans le répertoire approprié de votre serveur de jeu.
2. Assurez-vous d'avoir les dépendances requises installées et configurées correctement.
3. Configurez les paramètres du script selon vos besoins spécifiques (fichier de configuration : `config.lua`).
4. Démarrez ou redémarrez le serveur de jeu.

## Utilisation

- Les joueurs peuvent demander un bus en utilisant la touche e pour appeler le bus.
- Les arrêts de bus sont affichés sur la carte du jeu.
- Les prochaines stations du bus en cours de route sont affichées à l'écran.
- Les chauffeurs de bus reçoivent des notifications pour la maintenance du bus.
- Les interactions avec le bus et le chauffeur sont gérées automatiquement.

## Configuration

Le script offre une certaine configurabilité. Vous pouvez ajuster les paramètres suivants dans le fichier `config.lua` :

- Coordonnées des arrêts de bus
- Vitesses de conduite du bus
- Autres paramètres de comportement du bus

## Auteurs

Ce script a été développé par [xer00ze](https://youtu.be/tuHcM8E0YDU).

## Licence

Ce script est sous licence [MIT](https://opensource.org/licenses/MIT).


