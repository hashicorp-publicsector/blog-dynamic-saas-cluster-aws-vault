#### Data Sources ####
data "aws_caller_identity" "current" {}

data "aws_canonical_user_id" "current" {}

resource "helm_release" "vault" {
  depends_on = [module.eks, module.push_vault_image_ecr, module.push_vault_k8s_image_ecr, module.vpc_endpoints, module.vpc,
  aws_route.vpc_to_peer, aws_route.peer_to_vpc, aws_vpc_peering_connection.vpc_peering]
  name             = try(var.helm_config.name, "vault")
  namespace        = try(var.helm_config.namespace, "vault")
  create_namespace = try(var.helm_config.create_namespace, true)
  description      = try(var.helm_config.description, null)
  chart            = "vault"
  version          = try(var.helm_config.version, "0.23.0")
  repository       = try(var.helm_config.repository, "https://helm.releases.hashicorp.com")
  values = [templatefile("${path.module}/values.tmpl", {
    vault_injector_ecr_repo      = "${module.push_vault_k8s_image_ecr.ecr_url}@sha256"
    vault_injector_ecr_image_tag = trimprefix(data.aws_ecr_image.vaultk8s_image.id, "sha256:")
    vault_ecr_repo               = "${module.push_vault_image_ecr.ecr_url}@sha256"
    vault_ecr_image_tag          = trimprefix(data.aws_ecr_image.vault_image.id, "sha256:")
    vault_sa_role                = aws_iam_role.vault_sa_role.arn
    aws_region                   = local.region
    kms_key_id                   = aws_kms_key.vault_autounseal_key.key_id
  })]
}

#### Random string generator ####
resource "random_pet" "random_pet" {
  length = 1
}
