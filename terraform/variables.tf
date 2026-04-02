variable "project_name" {
  description = "Nom du projet"
  type        = string
  default     = "POMPI"
}

variable "environment" {
  description = "Environnement cible du projet"
  type        = string
  default     = "local"
}