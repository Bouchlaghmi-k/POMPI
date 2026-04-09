# POMPI

## Présentation
POMPI est un projet DevOps centré sur l’automatisation du build, de la conteneurisation, du déploiement et de la supervision d’une application.  
Le projet prend la forme d’une base de plateforme self-service inspirée d’un mini Heroku interne, mais il repose désormais sur une implémentation concrète autour d’une application Node.js / Express connectée à PostgreSQL.

## Objectifs du projet
- Automatiser le build d’une application
- Conteneuriser l’application avec Docker
- Mettre en place un pipeline CI réel
- Préparer un déploiement continu sur Kubernetes
- Intégrer une logique GitOps
- Superviser les services déployés
- Proposer à terme une base de self-service pour le déploiement

## Contexte
Ce projet est réalisé dans le cadre de la formation RNCP 36061 – Administrateur Système DevOps.  
L’objectif est de construire un projet réaliste, professionnalisant et défendable devant un jury, avec des preuves d’implémentation concrètes et non uniquement une intention documentaire.

## Stack technique
- Node.js / Express
- PostgreSQL
- Docker
- Docker Compose
- GitHub Actions
- GitHub Container Registry
- Kubernetes
- Argo CD
- Terraform
- Prometheus
- Grafana
- Bash
- PowerShell

## Architecture
L’architecture actuelle de POMPI repose sur un dépôt GitHub structuré centralisant la documentation, les scripts, la configuration Docker, la CI, l’application de démonstration et une base Terraform.  
À ce stade, le projet dispose déjà d’une application Express fonctionnelle connectée à PostgreSQL, d’un build Docker opérationnel, d’un pipeline CI capable d’installer les dépendances, d’exécuter les tests et de construire l’image, ainsi que de scripts Bash de préparation et de vérification. L’évolution visée est de prolonger cette base vers un déploiement Kubernetes local, une logique GitOps et une supervision complète.

## Fonctionnement cible
À terme, la plateforme devra permettre :
1. de récupérer une application depuis un dépôt Git ;
2. de lancer automatiquement un pipeline CI ;
3. de construire une image Docker ;
4. de publier cette image dans un registre ;
5. de déployer l’application sur Kubernetes ;
6. d’intégrer une logique GitOps avec Argo CD ;
7. de superviser l’application et son environnement.

## Avancement actuel
- [x] Dépôt GitHub créé
- [x] Structure initiale du projet créée
- [x] README rédigé
- [x] Cahier des charges rédigé
- [x] Documentation d’architecture ajoutée
- [x] Schéma d’architecture ajouté
- [x] Application de démonstration Node.js / Express créée
- [x] Connexion PostgreSQL mise en place
- [x] Route `/health` fonctionnelle
- [x] Dockerfile corrigé et build Docker fonctionnel
- [x] Pipeline CI réel ajouté
- [x] Scripts Bash de provisionnement et de vérification ajoutés
- [x] Scripts PowerShell initiaux conservés
- [x] Structure Terraform initiale ajoutée
- [ ] Environnement Kubernetes local
- [ ] Déploiement Kubernetes
- [ ] GitOps avec Argo CD
- [ ] Monitoring avec Prometheus et Grafana
- [ ] Couche self-service complète
- [ ] Terraform avec ressources réelles

## Structure du projet
```text
POMPI/
├── .github/
│   └── workflows/
│       └── ci.yml
├── app/
│   ├── .env.example
│   ├── db.js
│   ├── package-lock.json
│   ├── package.json
│   ├── server.js
│   └── server.test.js
├── docs/
│   ├── architecture.md
│   ├── cahier-des-charges.md
│   ├── schema.drawio
│   └── schema.png
├── scripts/
│   ├── provision/
│   │   ├── provision-local.ps1
│   │   └── setup.sh
│   └── verify/
│       ├── check.sh
│       └── verify-local.ps1
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── compose.yml
├── Dockerfile
├── .dockerignore
├── .gitignore
└── README.md