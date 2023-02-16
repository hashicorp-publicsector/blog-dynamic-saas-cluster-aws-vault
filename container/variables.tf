variable "image_name" {
  type        = string
  description = "Container image name to pull from Docker Hub"
}

variable "region" {
  type = string
  description = "ECR Repository Region"
}

variable "name" {
  type = string
  description = "ECR Repository Name"
}