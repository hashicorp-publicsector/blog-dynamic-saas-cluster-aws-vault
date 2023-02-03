variable "image_name" {
  type        = string
  description = "Container image name to pull from Docker Hub"
}

variable "ecr_repository_url" {
  type        = string
  description = "ECR URL"
}

variable "ecr_registry_id" {
  type        = string
  description = "ECR Registry ID"
}

variable "region" {
  type = string
  description = "ECR Repository Region"
}