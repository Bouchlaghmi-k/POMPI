#!/usr/bin/env bash
set -euo pipefail

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

require_file() {
  local path="$1"
  if [ ! -f "$path" ]; then
    log "ERREUR: fichier manquant -> $path"
    exit 1
  fi
  log "OK: fichier présent -> $path"
}

require_command() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    log "ERREUR: commande introuvable -> $cmd"
    exit 1
  fi
  log "OK: commande disponible -> $cmd"
}

log "Début des vérifications POMPI"

require_command docker
require_command npm

require_file "Dockerfile"
require_file "compose.yml"
require_file ".github/workflows/ci.yml"
require_file "app/package.json"
require_file "app/server.js"
require_file "app/db.js"
require_file "app/.env.example"
require_file "docs/architecture.md"
require_file "docs/cahier-des-charges.md"
require_file "terraform/main.tf"

log "Vérification des dépendances Node.js"
(
  cd app
  npm ci >/dev/null
  npm test
)

log "Vérification du build Docker"
docker build -t pompi-app:check . >/dev/null

log "Vérification de PostgreSQL"
if docker ps --format '{{.Names}}' | grep -qx 'pompi-postgres'; then
  log "OK: conteneur pompi-postgres en cours d'exécution"
else
  log "ERREUR: conteneur pompi-postgres absent ou arrêté"
  exit 1
fi

log "Toutes les vérifications sont passées avec succès."