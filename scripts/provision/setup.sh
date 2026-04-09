#!/usr/bin/env bash
set -euo pipefail

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

require_command() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    log "ERREUR: commande introuvable -> $cmd"
    exit 1
  fi
}

wait_for_postgres() {
  local retries=30
  local count=1

  while [ "$count" -le "$retries" ]; do
    status="$(docker inspect --format='{{.State.Health.Status}}' pompi-postgres 2>/dev/null || true)"

    if [ "$status" = "healthy" ]; then
      log "PostgreSQL est healthy."
      return 0
    fi

    log "Attente PostgreSQL... tentative $count/$retries"
    sleep 2
    count=$((count + 1))
  done

  log "ERREUR: PostgreSQL n'est pas devenu healthy."
  exit 1
}

log "Début de la préparation de l'environnement POMPI"

require_command docker
require_command npm

if docker compose version >/dev/null 2>&1; then
  log "Docker Compose détecté."
else
  log "ERREUR: Docker Compose n'est pas disponible."
  exit 1
fi

log "Démarrage de PostgreSQL"
docker compose up -d postgres

wait_for_postgres

log "Installation des dépendances Node.js"
(
  cd app
  npm ci
)

log "Build de l'image Docker applicative"
docker build -t pompi-app:local .

log "Préparation de l'environnement terminée avec succès."