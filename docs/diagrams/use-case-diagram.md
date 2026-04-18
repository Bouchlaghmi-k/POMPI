# Diagramme de cas d’utilisation – POMPI

## 1. Description
Ce diagramme présente les interactions principales entre les acteurs et le système POMPI.  
Il met en évidence la fonctionnalité centrale de déploiement automatisé d’une application à partir d’un dépôt Git.

## 2. Diagramme

![Diagramme de cas d’utilisation](diagrams/use-case.png)

## 3. Interprétation
Le développeur peut déployer une application et consulter l’état du déploiement.  
L’administrateur DevOps peut configurer l’infrastructure et superviser les services.

Le processus de déploiement inclut obligatoirement :
- le déclenchement du pipeline CI
- la construction de l’image Docker
- le déploiement sur Kubernetes

La supervision intervient comme une extension après le déploiement.