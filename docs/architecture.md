# Architecture de POMPI

## 1. Objectif
POMPI est une plateforme DevOps self-service conçue comme un mini Heroku interne.
Son objectif est de standardiser et d’automatiser le cycle de déploiement d’une application, depuis le code source jusqu’à son exécution dans un environnement conteneurisé.

## 2. Principe général
L’architecture de POMPI repose sur une logique de centralisation des outils DevOps autour d’un dépôt Git structuré.
Le dépôt contient la documentation du projet, les scripts de provisionnement et de vérification, les premiers fichiers d’infrastructure as code, ainsi que les éléments liés à la conteneurisation et à l’intégration continue.

## 3. Composants principaux
Les principaux composants de l’architecture sont les suivants :

- GitHub : hébergement du code source et centralisation du projet
- GitHub Actions : exécution du pipeline d’intégration continue
- Docker : conteneurisation de l’application
- Terraform : base d’infrastructure as code pour le provisionnement
- Scripts PowerShell : automatisation locale du provisionnement et des vérifications
- Documentation technique : description de l’architecture, du projet et des choix techniques

## 4. Fonctionnement cible
À terme, le fonctionnement prévu est le suivant :

1. le développeur pousse le code source dans le dépôt GitHub
2. un pipeline CI est déclenché automatiquement
3. l’application est analysée et préparée pour le build
4. une image Docker est construite
5. l’image pourra ensuite être publiée dans un registre
6. l’application sera déployée sur un environnement Kubernetes
7. l’infrastructure et les services seront supervisés

## 5. État actuel
À ce stade, l’architecture est en phase d’initialisation.
Les éléments actuellement en place sont :

- le dépôt GitHub du projet
- le README professionnel
- le cahier des charges
- le Dockerfile
- un premier workflow CI
- la structure de scripts
- le début du dossier Terraform

## 6. Évolution prévue
Les prochaines évolutions prévues sont :

- ajout d’une application de démonstration
- amélioration du pipeline CI
- ajout du build Docker automatisé
- mise en place d’un environnement Kubernetes
- intégration d’une logique GitOps
- ajout de la supervision avec Prometheus et Grafana
- mise en place d’une couche self-service

## 7. Choix techniques
Les choix techniques retenus visent à construire un projet réaliste, progressif et professionnalisant.
L’utilisation de GitHub, Docker, Terraform et GitHub Actions permet de poser une base cohérente pour un projet DevOps.
Cette architecture a été pensée pour être enrichie progressivement sans surcomplexifier le socle initial.