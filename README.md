# POMPI

## Présentation
POMPI est une plateforme DevOps self-service conçue comme un mini Heroku interne.  
Le projet a pour objectif d’automatiser le build, la conteneurisation, le déploiement et la supervision d’applications à partir d’un dépôt Git.

## Objectifs du projet
- Automatiser le build d’une application
- Conteneuriser l’application avec Docker
- Mettre en place un pipeline CI
- Préparer un déploiement continu sur Kubernetes
- Intégrer une logique GitOps
- Superviser les services déployés
- Proposer une base de self-service pour le déploiement

## Contexte
Ce projet est réalisé dans le cadre de la formation RNCP 36061 – Administrateur Système DevOps.  
L’objectif est de concevoir un projet réaliste, professionnalisant et défendable devant un jury.

## Stack technique
- Node.js / Express
- Docker
- GitHub Actions
- GitHub Container Registry
- Kubernetes
- Argo CD
- Terraform
- Prometheus
- Grafana
- PowerShell

## Architecture
L’architecture actuelle de POMPI repose sur un dépôt GitHub structuré centralisant la documentation, les scripts de provisionnement et de vérification, le Dockerfile, un premier pipeline CI et une base Terraform. À terme, le dépôt doit permettre de construire une chaîne DevOps complète allant du versionnement du code source jusqu’au déploiement d’une application conteneurisée dans un environnement Kubernetes, avec une logique GitOps et une supervision des services déployés.

## Fonctionnement cible
À terme, la plateforme devra permettre :
1. de récupérer une application depuis un dépôt Git ;
2. de lancer automatiquement un pipeline CI ;
3. de construire une image Docker ;
4. de publier cette image dans un registre ;
5. de déployer l’application sur Kubernetes via GitOps ;
6. de superviser l’application déployée.

## Avancement actuel
- [x] Dépôt GitHub créé
- [x] Structure initiale du projet créée
- [x] README rédigé
- [x] Cahier des charges rédigé
- [x] Documentation d’architecture ajoutée
- [x] Schéma d’architecture ajouté
- [x] Dockerfile créé
- [x] Pipeline CI initial créé
- [x] Scripts de provisionnement et de vérification ajoutés
- [x] Structure Terraform initiale ajoutée
- [ ] Application de démonstration
- [ ] Build Docker automatisé
- [ ] Déploiement Kubernetes
- [ ] GitOps avec Argo CD
- [ ] Monitoring avec Prometheus et Grafana
- [ ] Couche self-service

## Structure du projet
```text
POMPI/
├── .github/
│   └── workflows/
│       └── ci.yml
├── docs/
│   ├── architecture.md
│   ├── cahier-des-charges.md
│   ├── schema.drawio
│   └── schema.png
├── scripts/
│   ├── provision/
│   │   └── provision-local.ps1
│   └── verify/
│       └── verify-local.ps1
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── Dockerfile
├── .dockerignore
├── .gitignore
└── README.md