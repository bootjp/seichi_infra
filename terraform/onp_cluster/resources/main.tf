variable "argocd_github_oauth_app_secret" {
  type          = string
  sensitive     = true
}

variable "grafana_github_oauth_app_id" {
  type          = string
  sensitive     = true
}

variable "grafana_github_oauth_app_secret" {
  type          = string
  sensitive     = true
}

variable "synology_csi_config" {
  type          = string
  sensitive     = true
}
