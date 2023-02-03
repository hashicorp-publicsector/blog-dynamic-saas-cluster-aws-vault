output "random_string" {
  value = random_string.random_string.id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "vault_ecr_uri" {
  value = aws_ecr_repository.vault.repository_url
}

output "vpc_cni_irsa" {
  value = module.vpc_cni_irsa.iam_role_arn
}

output "vault_k8s_ecr_uri" {
  value = aws_ecr_repository.vault_k8s.repository_url
}

output "region" {
  value = var.region
}