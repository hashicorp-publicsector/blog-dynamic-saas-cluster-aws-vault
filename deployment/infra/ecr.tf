module "push_vault_image_ecr" {
  depends_on = [module.eks]
  source     = "./container"
  name       = "${var.tag_prefix}-repo-${random_pet.random_pet.id}-vault"
  image_name = var.vault_image
  region     = local.region
}

module "push_vault_k8s_image_ecr" {
  depends_on = [module.eks]
  source     = "./container"
  name       = "${var.tag_prefix}-repo-${random_pet.random_pet.id}-vault-k8s"
  image_name = var.vault_k8s_image
  region     = local.region
}

module "push_aws_cli_image_ecr" {
  depends_on = [module.eks]
  source     = "./container"
  name       = "${var.tag_prefix}-repo-${random_pet.random_pet.id}-aws-cli"
  image_name = var.aws_cli_image
  region     = local.region
}

# ECR Images
data "aws_ecr_image" "aws_image" {
  depends_on      = [module.push_aws_cli_image_ecr]
  repository_name = module.push_aws_cli_image_ecr.ecr_repo_name
  image_tag       = "latest"
}

data "aws_ecr_image" "vault_image" {
  depends_on      = [module.push_vault_image_ecr]
  repository_name = module.push_vault_image_ecr.ecr_repo_name
  image_tag       = "latest"
}

data "aws_ecr_image" "vaultk8s_image" {
  depends_on      = [module.push_vault_k8s_image_ecr]
  repository_name = module.push_vault_k8s_image_ecr.ecr_repo_name
  image_tag       = "latest"
}