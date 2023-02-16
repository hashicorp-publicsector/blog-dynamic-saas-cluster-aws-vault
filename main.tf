#### Data Sources ####
data "aws_caller_identity" "current" {}

data "aws_canonical_user_id" "current" {}

# VPC Data Resources
data "aws_vpc" "cloud9_vpc" {
  id = var.cloud9_vpc_id
}

data "aws_route_table" "cloud9_rtb" {
  vpc_id = var.cloud9_vpc_id
}


# IAM Policy Documents
data "aws_iam_policy_document" "s3_access_policy" {
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:GetObjectVersion"]
    resources = [
      "${aws_s3_bucket.vault_s3_bucket.arn}/*"
    ]
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.vault_s3_bucket.arn]
  }
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    effect  = "Deny"
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.vault_s3_bucket.arn,
      "${aws_s3_bucket.vault_s3_bucket.arn}/*"
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"

      values = ["false"]
    }
  }
}

data "aws_iam_policy_document" "s3_bucket_logs_policy" {
  statement {
    effect  = "Allow"
    actions = ["s3:PutObject"]
    resources = [
      "${aws_s3_bucket.access_logs_bucket.arn}/*"
    ]
    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.vault_s3_bucket.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
  statement {
    effect  = "Deny"
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.access_logs_bucket.arn,
      "${aws_s3_bucket.access_logs_bucket.arn}/*"
    ]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

data "aws_iam_policy_document" "dynamodb_policy" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:BatchGetItem",
      "dynamodb:Query",
      "dynamodb:DescribeTable"
    ]
    resources = [
      aws_dynamodb_table.product_table.arn
    ]
  }
}

data "aws_iam_policy_document" "vault_sa_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    resources = [
      aws_iam_role.vault_role.arn
    ]
  }
  statement {
    sid       = "VaultKMSUnseal"
    effect    = "Allow"
    resources = [aws_kms_key.vault_autounseal_key.arn]

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:DescribeKey",
    ]
  }
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

#### Vault Configuration ####
# IAM Resources
resource "aws_iam_role" "vault_role" {
  name = "vault-role-${random_string.random_string.id}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "AllowNodes"
        Principal = {
          "AWS" : aws_iam_role.vault_sa_role.arn
        }
      }
    ]
  })
}

resource "aws_iam_policy" "dynamodb_policy" {
  name        = "dynamodb-policy-${random_string.random_string.id}"
  path        = "/"
  description = "dynamodb policy for tenants"
  policy      = data.aws_iam_policy_document.dynamodb_policy.json
}

resource "aws_iam_role_policy_attachment" "vault_role_policy" {
  role       = aws_iam_role.vault_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}

resource "aws_iam_role" "vault_sa_role" {
  name = "${var.tag_prefix}-vault-sa-role-${random_string.random_string.id}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          "Federated" : module.eks.oidc_provider_arn
        }
        Condition = {
          "StringLike" = {
            "${module.eks.oidc_provider}:sub" = "system:serviceaccount:vault:vault-sa",
            "${module.eks.oidc_provider}:aud" = "sts.amazonaws.com"
          }
        },
      }
    ]
  })
}

resource "aws_iam_policy" "vault_sa_policy" {
  name        = "vault-sa-role-policy-${random_string.random_string.id}"
  path        = "/"
  description = "Policy for Vault SA in EKS"
  policy      = data.aws_iam_policy_document.vault_sa_role_policy.json
}

resource "aws_iam_role_policy_attachment" "vault_sa_role" {
  role       = aws_iam_role.vault_sa_role.name
  policy_arn = aws_iam_policy.vault_sa_policy.arn
}

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
    aws_region                   = var.region
    kms_key_id                   = aws_kms_key.vault_autounseal_key.key_id
  })]

}

resource "aws_kms_key" "vault_autounseal_key" {
  description             = "Vault unseal key"
  deletion_window_in_days = 10

  tags = {
    Name = "vault-kms-unseal-${random_string.random_string.id}"
  }
}
#### END VAULT CONFIG ####


#### VPC Configuration ####
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "${var.tag_prefix}/VPC"
  cidr = var.vpc_data.cidr

  azs             = var.vpc_data.availability_zones
  private_subnets = var.vpc_data.private_subnet_cidrs

  enable_dns_hostnames = true
  enable_dns_support   = true

  igw_tags = {
    "Name" = "${var.tag_prefix}/igw"
  }

  private_subnet_names = ["${var.tag_prefix}/PrivateSubnet01", "${var.tag_prefix}/PrivateSubnet02"]
  public_subnet_names  = ["${var.tag_prefix}/PublicSubnet01", "${var.tag_prefix}/PublicSubnet02"]

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}

module "vpc_endpoints" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "3.19.0"
  vpc_id  = module.vpc.vpc_id

  endpoints = {
    s3 = {
      service         = "s3"
      service_type    = "Gateway"
      tags            = { Name = "${var.tag_prefix}-s3-vpce" }
      route_table_ids = flatten(module.vpc.private_route_table_ids)
    },
    dynamodb = {
      service         = "dynamodb"
      service_type    = "Gateway"
      route_table_ids = flatten(module.vpc.private_route_table_ids)
      tags            = { Name = "${var.tag_prefix}-ddb-vpce" }
    },
    ec2 = {
      service             = "ec2"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      tags                = { Name = "${var.tag_prefix}-ec2-vpce" }
    },
    eks = {
      service             = "eks"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_eks_node_to_cluster.id]
      tags                = { Name = "${var.tag_prefix}-eks-vpce" }
    },

    sts = {
      service             = "sts"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      tags                = { Name = "${var.tag_prefix}-sts-vpce" }


    },
    logs = {
      service             = "logs"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      tags                = { Name = "${var.tag_prefix}-logs-vpce" }
    },

    ecr_api = {
      service             = "ecr.api"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      tags                = { Name = "${var.tag_prefix}-ecr-api-vpce" }

    },
    ecr_dkr = {
      service             = "ecr.dkr"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      tags                = { Name = "${var.tag_prefix}-ecr-dkr-vpce" }
    },
    kms = {
      service             = "kms"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      tags                = { Name = "${var.tag_prefix}-kms-vpce" }
    },
  }
}

module "vpc_cni_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name_prefix      = "${var.tag_prefix}-cni-irsa"
  attach_vpc_cni_policy = true
  vpc_cni_enable_ipv4   = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-node"]
    }
  }
}



resource "aws_route" "vpc_to_peer" {
  count                     = length(module.vpc.private_route_table_ids)
  route_table_id            = element(module.vpc.private_route_table_ids, count.index)
  destination_cidr_block    = data.aws_vpc.cloud9_vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_route" "peer_to_vpc" {
  route_table_id            = data.aws_route_table.cloud9_rtb.id
  destination_cidr_block    = module.vpc.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_vpc_id = var.cloud9_vpc_id
  vpc_id      = module.vpc.vpc_id


  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}


#### EKS Configuration ####
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.6.0"

  cluster_name                   = var.tag_prefix
  cluster_version                = var.eks_data.version
  cluster_endpoint_public_access = false

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets



  eks_managed_node_group_defaults = {
    ami_type                   = var.eks_data.ami_type_default
    instance_types             = var.eks_data.instance_types
    iam_role_attach_cni_policy = true
    vpc_cni_enable_ipv4        = true
  }

  create_kms_key = false
  cluster_encryption_config = {
    resources        = ["secrets"]
    provider_key_arn = module.kms_key.key_arn
  }

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent              = true
      service_account_role_arn = module.vpc_cni_irsa.iam_role_arn
    }
    aws-ebs-csi-driver = {
      most_recent = true
    }
  }

  cluster_security_group_additional_rules = {
    ingress_source_cloud9_cidr = {
      description = "Ingress from Cloud9"
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      type        = "ingress"
      cidr_blocks = [data.aws_vpc.cloud9_vpc.cidr_block]
    }
  }

  eks_managed_node_groups = {

    default_node_group = {
      name            = "managed_node_group"
      use_name_prefix = true

      subnet_ids = module.vpc.private_subnets

      min_size     = var.eks_data.min_size
      max_size     = var.eks_data.max_size
      desired_size = var.eks_data.desired_size

      instance_types = var.eks_data.instance_types


      update_config = {
        max_unavailable_percentage = 1
      }

      description = "EKS managed node group launch template"

      ebs_optimized           = true
      disable_api_termination = false
      enable_monitoring       = true

      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {

            volume_size = var.eks_data.volume_size
            volume_type = var.eks_data.volume_type

            encrypted             = true
            kms_key_id            = module.kms_key.key_arn
            delete_on_termination = true
          }
        }
      }

      create_iam_role          = true
      iam_role_name            = "${var.tag_prefix}-nodes"
      iam_role_use_name_prefix = false
      iam_role_description     = "EKS managed node group role"
      iam_role_additional_policies = {
        AmazonEC2ContainerRegistryReadOnly = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        AmazonSSMManagedInstanceCore       = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
        AmazonEBSCSIDriverPolicy           = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      }
    }
  }
}

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

# Security Group for VPCE
resource "aws_security_group" "vpc_tls" {
  name_prefix = "${var.tag_prefix}-vpce"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }
}

resource "aws_security_group_rule" "vault_webhook_nodes" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  description              = "Cluster API to Nodes Vault Webhook"
  source_security_group_id = module.eks.cluster_security_group_id
  security_group_id        = module.eks.node_security_group_id
}

resource "aws_security_group" "vpc_eks_node_to_cluster" {
  name_prefix = "${var.tag_prefix}-eks-vpce"
  description = "Allow all traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }
}


resource "aws_iam_role" "s3_access_role" {
  name = "${var.tag_prefix}-s3-access-role-${random_string.random_string.id}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          "Federated" : module.eks.oidc_provider_arn
        }
        Condition = {
          "StringLike" = {
            "${module.eks.oidc_provider}:sub" = "system:serviceaccount:tenant*:tenant*-sa",
            "${module.eks.oidc_provider}:aud" = "sts.amazonaws.com"
          }
        },
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "${var.tag_prefix}-s3-access-policy"
  path        = "/"
  description = "s3 access policy for eks cluster"
  policy      = data.aws_iam_policy_document.s3_access_policy.json
}

resource "aws_iam_role_policy_attachment" "s3_access_role" {
  role       = aws_iam_role.s3_access_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

#### Dynamo DB Configuration ####
resource "aws_dynamodb_table" "product_table" {
  attribute {
    name = "ProductID"
    type = "S"
  }

  attribute {
    name = "ShardID"
    type = "S"
  }

  billing_mode = "PROVISIONED"
  hash_key     = "ShardID"
  name         = "ProductsTable_${random_string.random_string.id}"

  point_in_time_recovery {
    enabled = "false"
  }

  range_key      = "ProductID"
  read_capacity  = "5"
  stream_enabled = "false"
  table_class    = "STANDARD"
  write_capacity = "5"
}

resource "aws_dynamodb_table_item" "insert_items" {
  for_each   = var.ddb_items
  table_name = aws_dynamodb_table.product_table.name
  hash_key   = aws_dynamodb_table.product_table.hash_key
  range_key  = aws_dynamodb_table.product_table.range_key
  item = jsonencode({
    ShardID     = { S = each.value.shard_id }
    ProductID   = { S = each.value.product_id }
    ProductName = { S = each.value.product_name }
  })
}

#### S3 Configuration ####
resource "aws_s3_bucket" "vault_s3_bucket" {
  bucket        = "vault-agent-template-${random_string.random_string.id}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "vault_s3_bucket" {
  bucket = aws_s3_bucket.vault_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "vault_s3_bucket" {
  bucket = aws_s3_bucket.vault_s3_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_logging" "vault_s3_bucket" {
  bucket = aws_s3_bucket.vault_s3_bucket.id

  target_bucket = aws_s3_bucket.access_logs_bucket.id
  target_prefix = "/"
}

resource "aws_s3_bucket_policy" "vault_s3_bucket" {
  bucket = aws_s3_bucket.vault_s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

resource "aws_s3_bucket" "access_logs_bucket" {
  bucket        = "${aws_s3_bucket.vault_s3_bucket.id}-access-logs"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "access_logs_bucket" {
  bucket = aws_s3_bucket.access_logs_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "access_logs_bucket" {
  bucket = aws_s3_bucket.access_logs_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "access_logs_bucket" {
  bucket = aws_s3_bucket.access_logs_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_logs_policy.json
}

resource "aws_s3_bucket_acl" "access_logs_bucket" {
  bucket = aws_s3_bucket.access_logs_bucket.id
  access_control_policy {
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/s3/LogDelivery"
      }
      permission = "READ_ACP"
    }
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/s3/LogDelivery"
      }
      permission = "WRITE"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}


module "push_vault_image_ecr" {
  depends_on = [module.eks]
  source     = "./container"
  name       = "${var.tag_prefix}-repo-${random_string.random_string.id}-vault"
  image_name = var.vault_image
  region     = var.region
}

module "push_vault_k8s_image_ecr" {
  depends_on = [module.eks]
  source     = "./container"
  name       = "${var.tag_prefix}-repo-${random_string.random_string.id}-vault-k8s"
  image_name = var.vault_k8s_image
  region     = var.region
}

module "push_aws_cli_image_ecr" {
  depends_on = [module.eks]
  source     = "./container"
  name       = "${var.tag_prefix}-repo-${random_string.random_string.id}-aws-cli"
  image_name = var.aws_cli_image
  region     = var.region
}

#### Random string generator ####
resource "random_string" "random_string" {
  length           = 8
  special          = true
  upper            = false
  override_special = "-"
}
