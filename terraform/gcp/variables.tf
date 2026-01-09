variable "project_id" {
  description = "GCP Project ID"
}

variable "region" {
  description = "GCP Region"
  default     = "us-central1"
}

variable "alert_email" {
  description = "Email address for monitoring alerts"
  type        = string
}

variable "database_secret" {
  description = "Sensitive database secret"
  type        = string
  sensitive   = true
}
