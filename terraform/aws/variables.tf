variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ecr_repository_url" {
  description = "Base URL for ECR repository"
  # This would typically be passed via -var "ecr_repository_url=..."
}
