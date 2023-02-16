output "EKS_CLUSTER_NAME" {
  value = module.eks.cluster_name
}

output "VAULT_REPO_NAME" {
  value = module.push_vault_image_ecr.ecr_repo_name
}

output "VAULT_IMAGE_TAG" {
  value = trimprefix(data.aws_ecr_image.vault_image.id, "sha256:")
}

output "REPO_URI_VAULT" {
  value = module.push_vault_image_ecr.ecr_url
}

output "AWSCLI_REPO_NAME" {
  value = module.push_aws_cli_image_ecr.ecr_repo_name
}

output "REPO_URI_AWSCLI" {
  value = module.push_aws_cli_image_ecr.ecr_url
}

output "AWSCLI_IMAGE_TAG" {
  value = trimprefix(data.aws_ecr_image.aws_image.id, "sha256:")
}

output "VAULT_K8S_ECR_URI" {
  value = module.push_vault_k8s_image_ecr.ecr_url
}

output "VAULT_K8S_IMAGE_TAG" {
  value = trimprefix(data.aws_ecr_image.vaultk8s_image.id, "sha256:")
}

output "VAULT_SA_ROLE_ARN" {
  value = aws_iam_role.vault_sa_role.arn
}

output "VAULT_AGENT_TEMPLATES_BUCKET" {
  value = aws_s3_bucket.vault_s3_bucket.id
}

output "ACCOUNT_ID" {
  value = data.aws_caller_identity.current.account_id
}

output "AWS_REGION" {
  value = var.region
}

output "VAULT_NS" {
  value = var.helm_config.namespace
}

output "VAULT_ROLE" {
  value = aws_iam_role.vault_role.name
}

output "RANDOM_STRING" {
  value = random_string.random_string.id
}

output "TENANT_SA_ROLE_ARN" {
  value = aws_iam_role.s3_access_role.arn
}
