data "aws_ecr_authorization_token" "ecr_token" {
  registry_id = aws_ecr_repository.ecr_repo.registry_id
}

resource "aws_ecr_repository" "ecr_repo" {
  name = var.name

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }

  force_delete = true
}

resource "docker_image" "image_pull" {
  name = var.image_name
}

resource "docker_tag" "image_tag" {
  source_image = docker_image.image_pull.name
  target_image = "${aws_ecr_repository.ecr_repo.repository_url}:latest"
}

#### Secure Image Delivery to ECR ####
resource "null_resource" "image_push" {
  depends_on  = [aws_ecr_repository.ecr_repo]
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.ecr_repo.repository_url} && docker push ${docker_tag.image_tag.target_image}" 
  }
}


