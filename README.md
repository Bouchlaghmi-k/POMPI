# POMPI

## Présentation
POMPI est une plateforme DevOps self-service inspirée d'un mini Heroku interne, centrée sur l'automatisation du build, de la conteneurisation, du déploiement et de la supervision d'applications.  
Le projet repose sur une implémentation concrète autour d'une application Node.js / Express connectée à PostgreSQL, avec une stack de monitoring opérationnelle et une architecture orientée vers un déploiement Kubernetes en cible.

## Objectifs du projet
- Automatiser le build d'une application depuis un dépôt Git
- Conteneuriser l'application avec Docker
- Mettre en place un pipeline CI/CD réel avec publication d'image
- Superviser les services déployés via Prometheus et Grafana
- Préparer un déploiement continu sur Kubernetes
- Intégrer une logique GitOps avec Argo CD
- Provisionner l'infrastructure cible via Terraform (AWS)

## Contexte
Ce projet est réalisé dans le cadre de la formation RNCP 36061 – Administrateur Système DevOps.  
L'objectif est de construire un projet réaliste, professionnalisant et défendable devant un jury, avec des preuves d'implémentation concrètes et non uniquement une intention documentaire.

## Stack technique
- Node.js / Express
- PostgreSQL
- Docker / Docker Compose
- GitHub Actions
- GitHub Container Registry (GHCR)
- Kubernetes
- Argo CD
- Terraform (AWS)
- Prometheus
- Grafana
- Bash / PowerShell

## Architecture
POMPI repose sur deux couches complémentaires :

**Plateforme opérationnelle (Docker Compose)**  
L'environnement de déploiement actuel tourne via Docker Compose et inclut l'application Express, PostgreSQL, Prometheus et Grafana. C'est la plateforme qui tourne réellement et qui sera déployée sur un VPS AWS via Terraform.

**Architecture cible (Kubernetes)**  
Les manifests Kubernetes constituent la couche de scalabilité documentée : StatefulSet PostgreSQL, PVC, Secrets, Deployment applicatif, Service et Ingress. Cette couche représente l'évolution naturelle de la plateforme vers un environnement multi-nœuds.

## Fonctionnement cible
1. Récupérer une application depuis un dépôt Git
2. Déclencher automatiquement le pipeline CI
3. Construire l'image Docker et la publier sur GHCR
4. Provisionner l'infrastructure via Terraform
5. Déployer l'application sur le VPS via Docker Compose
6. Superviser l'application via Prometheus et Grafana
7. Évoluer vers un déploiement Kubernetes avec GitOps Argo CD

## Avancement actuel
- [x] Dépôt GitHub créé et structuré
- [x] README et cahier des charges rédigés
- [x] Documentation d'architecture ajoutée
- [x] Application Node.js / Express créée
- [x] Connexion PostgreSQL fonctionnelle
- [x] Route `/health` opérationnelle avec vérification DB
- [x] Dockerfile fonctionnel
- [x] Pipeline CI GitHub Actions (install, test, build)
- [x] Scripts Bash de provisionnement et vérification
- [x] Structure Terraform initialisée (AWS)
- [x] Stack monitoring déployée (Prometheus + Grafana)
- [x] Volumes persistants et healthchecks configurés
- [ ] Publication image sur GHCR via CI/CD
- [ ] Terraform AWS fonctionnel (EC2 + réseau + sécurité)
- [ ] Déploiement sur VPS AWS
- [ ] Stack Kubernetes complète (StatefulSet, PVC, Secrets, Probes)
- [ ] GitOps avec Argo CD
- [ ] Secrets externalisés (Kubernetes Secrets)
- [ ] Node Exporter intégré

## Structure du projet
```text
# POMPI

## Présentation
POMPI est une plateforme DevOps self-service inspirée d'un mini Heroku interne, centrée sur l'automatisation du build, de la conteneurisation, du déploiement et de la supervision d'applications.  
Le projet repose sur une implémentation concrète autour d'une application Node.js / Express connectée à PostgreSQL, avec une stack de monitoring opérationnelle et une architecture orientée vers un déploiement Kubernetes en cible.

## Objectifs du projet
- Automatiser le build d'une application depuis un dépôt Git
- Conteneuriser l'application avec Docker
- Mettre en place un pipeline CI/CD réel avec publication d'image
- Superviser les services déployés via Prometheus et Grafana
- Préparer un déploiement continu sur Kubernetes
- Intégrer une logique GitOps avec Argo CD
- Provisionner l'infrastructure cible via Terraform (AWS)

## Contexte
Ce projet est réalisé dans le cadre de la formation RNCP 36061 – Administrateur Système DevOps.  
L'objectif est de construire un projet réaliste, professionnalisant et défendable devant un jury, avec des preuves d'implémentation concrètes et non uniquement une intention documentaire.

## Stack technique
- Node.js / Express
- PostgreSQL
- Docker / Docker Compose
- GitHub Actions
- GitHub Container Registry (GHCR)
- Kubernetes
- Argo CD
- Terraform (AWS)
- Prometheus
- Grafana
- Bash / PowerShell

## Architecture
POMPI repose sur deux couches complémentaires :

**Plateforme opérationnelle (Docker Compose)**  
L'environnement de déploiement actuel tourne via Docker Compose et inclut l'application Express, PostgreSQL, Prometheus et Grafana. C'est la plateforme qui tourne réellement et qui sera déployée sur un VPS AWS via Terraform.

**Architecture cible (Kubernetes)**  
Les manifests Kubernetes constituent la couche de scalabilité documentée : StatefulSet PostgreSQL, PVC, Secrets, Deployment applicatif, Service et Ingress. Cette couche représente l'évolution naturelle de la plateforme vers un environnement multi-nœuds.

## Fonctionnement cible
1. Récupérer une application depuis un dépôt Git
2. Déclencher automatiquement le pipeline CI
3. Construire l'image Docker et la publier sur GHCR
4. Provisionner l'infrastructure via Terraform
5. Déployer l'application sur le VPS via Docker Compose
6. Superviser l'application via Prometheus et Grafana
7. Évoluer vers un déploiement Kubernetes avec GitOps Argo CD

## Avancement actuel
- [x] Dépôt GitHub créé et structuré
- [x] README et cahier des charges rédigés
- [x] Documentation d'architecture ajoutée
- [x] Application Node.js / Express créée
- [x] Connexion PostgreSQL fonctionnelle
- [x] Route `/health` opérationnelle avec vérification DB
- [x] Dockerfile fonctionnel
- [x] Pipeline CI GitHub Actions (install, test, build)
- [x] Scripts Bash de provisionnement et vérification
- [x] Structure Terraform initialisée (AWS)
- [x] Stack monitoring déployée (Prometheus + Grafana)
- [x] Volumes persistants et healthchecks configurés
- [ ] Publication image sur GHCR via CI/CD
- [ ] Terraform AWS fonctionnel (EC2 + réseau + sécurité)
- [ ] Déploiement sur VPS AWS
- [ ] Stack Kubernetes complète (StatefulSet, PVC, Secrets, Probes)
- [ ] GitOps avec Argo CD
- [ ] Secrets externalisés (Kubernetes Secrets)
- [ ] Node Exporter intégré

## Structure du projet
```text
POMPI/
├── .github/
│   └── workflows/
│       └── ci.yml
├── app/
│   ├── .env.example
│   ├── db.js
│   ├── package.json
│   ├── package-lock.json
│   ├── server.js
│   └── server.test.js
├── docs/
│   ├── diagrams/
│   │   ├── use-case-diagram.md
│   │   └── use-case.png
│   ├── architecture.md
│   ├── backlog.md
│   ├── cahier-des-charges.md
│   ├── schema.drawio
│   └── schema.png
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── README.md
├── monitoring/
│   └── prometheus/
│       └── prometheus.yml
├── scripts/
│   ├── provision/
│   │   ├── provision-local.ps1
│   │   └── setup.sh
│   └── verify/
│       ├── check.sh
│       └── verify-local.ps1
├── terraform/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── compose.yml
├── Dockerfile
├── .dockerignore
├── .gitignore
└── README.md
```