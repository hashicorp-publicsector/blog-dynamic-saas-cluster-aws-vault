output "ecr_image" {
    value = docker_tag.image_tag.target_image
}

