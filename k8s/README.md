# Kubernetes – POMPI

## Objectif
Ce dossier contient une première base de déploiement Kubernetes pour l’application POMPI.

## Contenu
- deployment.yaml : déploiement de l’application Node.js
- service.yaml : exposition du service

## Statut
Cette configuration constitue une première étape vers une architecture Kubernetes complète.  
Elle sera enrichie avec :
- base de données PostgreSQL
- gestion des secrets
- monitoring
- logique GitOps

## Remarque
Dans cette version, l’application est exécutée via Docker Compose pour garantir un environnement stable et démontrable.  
La migration vers Kubernetes est prévue dans les prochaines étapes du projet.