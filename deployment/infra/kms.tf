#### Security Configuration ####
module "kms_key" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 1.1"

  description = "CMK to encrypt EKS Managed Node Group Volumes"

  key_administrators = [
    data.aws_caller_identity.current.arn
  ]

  key_users = [
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"

  ]
  key_service_users = [
    module.eks.cluster_iam_role_arn,
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  ]

  aliases = ["eks/${var.tag_prefix}"]

  tags = {
    Name = "${var.tag_prefix}/kms"
  }
}

resource "aws_kms_key" "vault_autounseal_key" {
  description             = "Vault unseal key"
  deletion_window_in_days = 10

  tags = {
    Name = "vault-kms-unseal-${random_pet.random_pet.id}"
  }
}