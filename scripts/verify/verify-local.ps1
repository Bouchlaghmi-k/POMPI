# ============================================================================
# Nom : verify-local.ps1
# Projet : POMPI
# Rôle : Vérifier la présence des éléments minimaux attendus dans le dépôt.
# Auteur : Khalil BOUCHLAGHMI
# ============================================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$LogDir = Join-Path $ProjectRoot "logs"
$LogFile = Join-Path $LogDir "verify-local.log"

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

function Test-RequiredPath {
    param(
        [string]$Path,
        [string]$Label
    )

    if (Test-Path $Path) {
        Write-Log "[OK] $Label trouvé : $Path"
        return $true
    }
    else {
        Write-Log "[ERREUR] $Label manquant : $Path"
        return $false
    }
}

Write-Log "Début de la vérification locale POMPI"

$results = @()

$results += Test-RequiredPath (Join-Path $ProjectRoot "README.md") "README"
$results += Test-RequiredPath (Join-Path $ProjectRoot "docs\cahier-des-charges.md") "Cahier des charges"
$results += Test-RequiredPath (Join-Path $ProjectRoot "docs\architecture.md") "Documentation architecture"
$results += Test-RequiredPath (Join-Path $ProjectRoot "Dockerfile") "Dockerfile"
$results += Test-RequiredPath (Join-Path $ProjectRoot ".dockerignore") ".dockerignore"
$results += Test-RequiredPath (Join-Path $ProjectRoot ".github\workflows\ci.yml") "Workflow CI"
$results += Test-RequiredPath (Join-Path $ProjectRoot "scripts\provision\provision-local.ps1") "Script de provisionnement"
$results += Test-RequiredPath (Join-Path $ProjectRoot "terraform\main.tf") "Terraform main.tf"
$results += Test-RequiredPath (Join-Path $ProjectRoot "terraform\variables.tf") "Terraform variables.tf"
$results += Test-RequiredPath (Join-Path $ProjectRoot "terraform\outputs.tf") "Terraform outputs.tf"

if ($results -contains $false) {
    Write-Log "Vérification terminée : certains éléments sont manquants."
    exit 1
}
else {
    Write-Log "Vérification terminée : tous les éléments attendus sont présents."
    exit 0
}