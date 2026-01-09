variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ecr_repository_url" {
  description = "Base URL for ECR repository"
}

variable "db_password" {
  description = "Database password or API key"
  type        = string
  sensitive   = true
}
