# Cahier des charges – POMPI

## 1. Présentation du projet
POMPI est une plateforme DevOps self-service conçue comme un mini Heroku interne.  
Son objectif est de permettre l’automatisation du build, de la conteneurisation, du déploiement et de la supervision d’une application à partir d’un dépôt Git.

## 2. Contexte
Ce projet est réalisé dans le cadre de la formation RNCP 36061 – Administrateur Système DevOps.  
Il s’inscrit dans une logique professionnalisante et vise à démontrer la maîtrise de plusieurs compétences clés :
- automatisation du déploiement
- mise en place d’une chaîne CI/CD
- déploiement d’applications conteneurisées
- supervision des services
- utilisation d’outils DevOps modernes

## 3. Problématique
Comment concevoir une plateforme permettant à un utilisateur de déployer une application de manière standardisée, automatisée et supervisée, tout en s’appuyant sur des outils modernes du DevOps ?

## 4. Objectifs du projet

### Objectif principal
Concevoir une plateforme DevOps self-service capable d’automatiser les étapes principales du cycle de déploiement d’une application.

### Objectifs secondaires
- récupérer une application depuis un dépôt Git
- exécuter un pipeline d’intégration continue
- construire une image Docker
- publier l’image dans un registre
- préparer un déploiement sur Kubernetes
- intégrer une logique GitOps avec Argo CD
- superviser les applications déployées
- proposer une première couche de self-service

## 5. Besoins fonctionnels
La plateforme devra permettre :
- de versionner le code source dans GitHub
- de déclencher automatiquement une pipeline CI lors d’un push
- de construire une image Docker de l’application
- de publier l’image construite dans un registre
- de déployer l’application sur un environnement Kubernetes
- de préparer un mécanisme standardisé de déploiement
- de superviser l’état et les performances du service
- de documenter l’architecture et les choix techniques

## 6. Besoins techniques
Le projet reposera sur les technologies suivantes :
- Git / GitHub
- GitHub Actions
- Docker
- GitHub Container Registry
- Kubernetes
- Argo CD
- Terraform
- Prometheus
- Grafana
- Node.js / Express pour l’application de démonstration

## 7. Périmètre du MVP
La première version du projet devra inclure :
- un dépôt GitHub structuré
- une documentation initiale
- une application de démonstration
- un Dockerfile fonctionnel
- un pipeline CI initial
- la préparation du déploiement Kubernetes
- une base de supervision

## 8. Hors périmètre initial
Dans un premier temps, les éléments suivants ne seront pas prioritaires :
- gestion multi-cluster
- haute disponibilité avancée
- portail self-service complexe type Backstage
- gestion avancée des identités
- sécurité enterprise complète
- scalabilité de niveau production

## 9. Utilisateurs cibles
Les utilisateurs visés par la plateforme sont :
- un développeur souhaitant déployer son application
- un administrateur DevOps souhaitant standardiser les déploiements
- un étudiant ou évaluateur souhaitant observer une chaîne DevOps complète

## 10. Architecture cible
L’architecture visée reposera sur les composants suivants :
- dépôt GitHub pour le code source
- GitHub Actions pour l’intégration continue
- Docker pour la conteneurisation
- registre d’images pour le stockage
- Kubernetes pour l’exécution des applications
- Argo CD pour la logique GitOps
- Terraform pour le provisionnement et le bootstrap
- Prometheus / Grafana pour la supervision

## 11. Livrables attendus
Les livrables du projet seront :
- un dépôt GitHub professionnel
- un README détaillé
- un cahier des charges
- un Dockerfile
- un pipeline CI initial
- des fichiers de déploiement
- une documentation technique
- une démonstration du fonctionnement global

## 12. Planning prévisionnel
- Phase 1 : cadrage et initialisation du projet
- Phase 2 : création de l’application de démonstration
- Phase 3 : mise en place de Docker
- Phase 4 : mise en place de la CI
- Phase 5 : déploiement Kubernetes
- Phase 6 : intégration GitOps
- Phase 7 : supervision
- Phase 8 : couche self-service
- Phase 9 : finalisation et préparation de la démonstration

## 13. Critères de réussite
Le projet sera considéré comme réussi si :
- le code est correctement versionné et documenté
- l’application est conteneurisée
- une pipeline CI est opérationnelle
- le déploiement sur Kubernetes est démontrable
- la supervision est visible
- les choix techniques sont justifiés
- l’ensemble est cohérent, réaliste et défendable à l’oral