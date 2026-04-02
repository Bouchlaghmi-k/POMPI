# ============================================================================
# Nom : provision-local.ps1
# Projet : POMPI
# Rôle : Préparer localement la structure minimale du projet et vérifier
#        la présence des outils principaux.
# Auteur : Khalil BOUCHLAGHMI
# ============================================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$LogDir = Join-Path $ProjectRoot "logs"
$LogFile = Join-Path $LogDir "provision-local.log"

if (-not (Test-Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir | Out-Null
}

function Write-Log {
    param(
        [string]$Message
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "[$timestamp] $Message"

    Write-Host $line
    Add-Content -Path $LogFile -Value $line
}

function Ensure-Directory {
    param(
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
        Write-Log "Dossier créé : $Path"
    }
    else {
        Write-Log "Dossier déjà présent : $Path"
    }
}

function Test-Tool {
    param(
        [string]$Name
    )

    $command = Get-Command $Name -ErrorAction SilentlyContinue

    if ($null -ne $command) {
        Write-Log "Outil détecté : $Name"
    }
    else {
        Write-Log "Outil non trouvé : $Name"
    }
}

Write-Log "Début du provisionnement local POMPI"

Ensure-Directory (Join-Path $ProjectRoot "app")
Ensure-Directory (Join-Path $ProjectRoot "docs")
Ensure-Directory (Join-Path $ProjectRoot "docker")
Ensure-Directory (Join-Path $ProjectRoot "scripts")
Ensure-Directory (Join-Path $ProjectRoot "terraform")

Test-Tool "git"
Test-Tool "docker"
Test-Tool "node"
Test-Tool "terraform"

Write-Log "Provisionnement local terminé avec succès"