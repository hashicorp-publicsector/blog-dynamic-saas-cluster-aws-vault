data "aws_ecr_authorization_token" "ecr_token" {
  registry_id = var.ecr_registry_id
}

resource "docker_image" "image_pull" {
  name = var.image_name
}

resource "docker_tag" "image_tag" {
  source_image = docker_image.image_pull.name
  target_image = "${var.ecr_repository_url}:latest"
}

#### Secure Image Delivery to ECR ####
resource "null_resource" "image_push" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${var.ecr_repository_url} && docker push ${docker_tag.image_tag.target_image}" 
  }
}
