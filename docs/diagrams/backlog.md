# Backlog produit – POMPI

## Méthodologie
Le projet est organisé selon une approche Agile (Scrum), avec un backlog structuré en epics et user stories.  
Les fonctionnalités sont priorisées selon leur valeur métier et leur importance dans le MVP.

---

# 📊 Backlog POMPI

---

## 🔥 EPIC 1 — Gestion des projets

### US1
En tant que développeur  
Je veux créer un projet POMPI  
Afin de pouvoir déployer mon application

### US2
En tant que développeur  
Je veux enregistrer l’URL de mon dépôt Git  
Afin de connecter mon code à la plateforme

---

## 🚀 EPIC 2 — Déploiement automatisé

### US3 (CRITIQUE)
En tant que développeur  
Je veux déclencher un déploiement à partir de mon dépôt  
Afin de mettre mon application en ligne automatiquement

### US4
En tant que système  
Je veux déclencher un pipeline CI après un push  
Afin d’automatiser le processus de build

### US5
En tant que système  
Je veux construire une image Docker  
Afin de conteneuriser l’application

### US6
En tant que système  
Je veux déployer l’image sur Kubernetes  
Afin de rendre l’application accessible

---

## 📡 EPIC 3 — Suivi et monitoring

### US7
En tant que développeur  
Je veux consulter l’état du déploiement  
Afin de vérifier si mon application fonctionne

### US8
En tant que développeur  
Je veux consulter les logs  
Afin de diagnostiquer les erreurs

---

## ⚙️ EPIC 4 — Administration

### US9
En tant qu’administrateur DevOps  
Je veux configurer l’infrastructure  
Afin de préparer l’environnement de déploiement

### US10
En tant qu’administrateur DevOps  
Je veux superviser les services  
Afin de garantir leur disponibilité

---

## 🔐 EPIC 5 — Sécurité (anticipation)

### US11
En tant que système  
Je veux sécuriser les accès aux services  
Afin de protéger les données et l’infrastructure

---

# 🎯 Priorisation

## MVP (Phase 1 — cœur du produit)
- US1 → création projet
- US2 → liaison Git
- US3 → déclenchement déploiement
- US4 → pipeline CI
- US5 → build Docker
- US6 → déploiement Kubernetes

## Phase 2
- US7 → monitoring état
- US8 → logs

## Phase 3
- US9 → administration infrastructure
- US10 → supervision services
- US11 → sécurité