/*

# This configuration is terraform code in development to showcase Dynamic Credential Brokering in a secure SaaS cluster.
It is currently a WIP, and under active development


TODO: refactor logical resource names to use snake case across codebase
TODO: push containers to ECR

*/

#### Data Sources ####
data "aws_caller_identity" "current" {}

data "aws_canonical_user_id" "current" {}

data "aws_iam_policy_document" "generic_endpoint_policy" {
  statement {
    effect    = "Deny"
    actions   = ["*"]
    resources = ["*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "StringNotEquals"
      variable = "aws:SourceVpc"

      values = [module.vpc.vpc_id]
    }
  }
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    effect  = "Deny"
    actions = ["s3:*"]
    resources = [
      "${aws_s3_bucket.vault_s3_bucket.arn}",
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
      values   = ["${aws_s3_bucket.vault_s3_bucket.arn}"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["${data.aws_caller_identity.current.account_id}"]
    }
  }
  statement {
    effect  = "Deny"
    actions = ["s3:*"]
    resources = [
      "${aws_s3_bucket.access_logs_bucket.arn}",
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

#### VPC Configuration ####
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "${var.tag_prefix}/VPC"
  cidr = var.vpc_data.cidr

  azs             = var.vpc_data.availability_zones
  private_subnets = var.vpc_data.private_subnet_cidrs
  public_subnets  = var.vpc_data.public_subnet_cidrs

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_dns_hostnames   = true
  enable_dns_support     = true

  nat_gateway_tags = {
    "Name" = "${var.tag_prefix}/natgw"
  }

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
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"

  vpc_id = module.vpc.vpc_id

  endpoints = {
    s3 = {
      service         = "s3"
      service_type    = "Gateway"
      tags            = { Name = "${var.tag_prefix}-s3-vpce" }
      route_table_ids = flatten(module.vpc.private_route_table_ids)
      policy          = data.aws_iam_policy_document.generic_endpoint_policy.json
    },
    dynamodb = {
      service         = "dynamodb"
      service_type    = "Gateway"
      route_table_ids = flatten(module.vpc.private_route_table_ids)
      policy          = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags            = { Name = "${var.tag_prefix}-ddb-vpce" }
    },
    ec2 = {
      service             = "ec2"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      policy              = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags                = { Name = "${var.tag_prefix}-ec2-vpce" }
    },
    sts = {
      service             = "sts"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      policy              = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags                = { Name = "${var.tag_prefix}-sts-vpce" }


    },
    logs = {
      service             = "logs"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      policy              = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags                = { Name = "${var.tag_prefix}-logs-vpce" }
    },

    ecr_api = {
      service             = "ecr.api"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      policy              = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags                = { Name = "${var.tag_prefix}-ecr-api-vpce" }

    },
    ecr_dkr = {
      service             = "ecr.dkr"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      policy              = data.aws_iam_policy_document.generic_endpoint_policy.json
      tags                = { Name = "${var.tag_prefix}-ecr-dkr-vpce" }
    },
    kms = {
      service             = "kms"
      private_dns_enabled = true
      subnet_ids          = module.vpc.private_subnets
      security_group_ids  = [aws_security_group.vpc_tls.id]
      policy              = data.aws_iam_policy_document.generic_endpoint_policy.json
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


#### EKS Configuration ####
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.6.0"

  cluster_name                   = var.tag_prefix
  cluster_version                = var.eks_data.version
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type                   = var.eks_data.ami_type_default
    instance_types             = var.eks_data.instance_types
    iam_role_attach_cni_policy = true
    vpc_cni_enable_ipv4        = true
  }

  #manage_aws_auth_configmap = true
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
  }
  eks_managed_node_groups = {
    default_node_group = {
      use_custom_launch_template = false

      min_size     = 2
      max_size     = 2
      desired_size = 2

      update_config = {
        max_unavailable = 1
      }

      description       = "EKS managed node group"
      ebs_optimized     = true
      enable_monitoring = true
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = var.eks_data.volume_details.size
            volume_type           = var.eks_data.volume_details.type
            iops                  = var.eks_data.volume_details.iops
            throughput            = var.eks_data.volume_details.throughput
            encrypted             = true
            kms_key_id            = module.kms_key.key_id
            delete_on_termination = true
          }
        }
      }
    }
  }

  create_iam_role          = true
  iam_role_name            = "${var.tag_prefix}-nodes"
  iam_role_use_name_prefix = false
  iam_role_description     = "EKS managed node group role"
  iam_role_additional_policies = {
    AmazonEC2ContainerRegistryReadOnly = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
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

  key_service_users = [
    module.eks.cluster_iam_role_arn
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

#### Dynamo DB Configuration ####
resource "aws_dynamodb_table" "ProductTable" {
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
  name         = "ProductsTable"

  point_in_time_recovery {
    enabled = "false"
  }

  range_key      = "ProductID"
  read_capacity  = "5"
  stream_enabled = "false"
  table_class    = "STANDARD"
  write_capacity = "5"
}

#### S3 Configuration ####
resource "aws_s3_bucket" "vault_s3_bucket" {
  bucket = "vault-agent-template-${random_string.random_string.id}"
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
  bucket = "${aws_s3_bucket.vault_s3_bucket.id}-access-logs"
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


#### ECR Configuration
resource "aws_ecr_repository" "cli" {
  name = "${var.tag_prefix}-repo-${random_string.random_string.id}-aws-cli"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
}

data "aws_ecr_authorization_token" "ecr-cli-token" {
  registry_id = aws_ecr_repository.cli.registry_id
}

resource "aws_ecr_repository" "vault" {
  name = "${var.tag_prefix}-repo-${random_string.random_string.id}-vault"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
}

data "aws_ecr_authorization_token" "ecr-vault-token" {
  registry_id = aws_ecr_repository.vault.registry_id
}

resource "aws_ecr_repository" "vault-k8s" {
  name = "${var.tag_prefix}-repo-${random_string.random_string.id}-vault-k8s"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
}

data "aws_ecr_authorization_token" "ecr-vault-k8s-token" {
  registry_id = aws_ecr_repository.vault-k8s.registry_id
}

#### Secure Image Delivery to ECR ####
resource "docker_image" "vault" {
  name = "hashicorp/vault:1.12.2"
}

resource "docker_image" "vault-k8s" {
  name = "hashicorp/vault-k8s:1.1"
}

resource "docker_image" "aws-cli" {
  name = "public.ecr.aws/aws-cli/aws-cli:latest"
}

resource "docker_tag" "vault" {
  source_image = docker_image.vault.name
  target_image = "${aws_ecr_repository.vault.repository_url}:latest"
}

resource "docker_tag" "vault-k8s" {
  source_image = docker_image.vault-k8s.name
  target_image = "${aws_ecr_repository.vault-k8s.repository_url}:latest"
}

resource "docker_tag" "aws-cli" {
  source_image = docker_image.aws-cli.name
  target_image = "${aws_ecr_repository.cli.repository_url}:latest"
}

resource "docker_registry_image" "vault" {
  name = docker_tag.vault.target_image

  provider = docker.vault_ecr

}

resource "docker_registry_image" "vault-k8s" {
  name     = docker_tag.vault-k8s.target_image
  provider = docker.vault_k8s_ecr


}

resource "docker_registry_image" "aws-cli" {
  name     = docker_tag.aws-cli.target_image
  provider = docker.aws_cli_ecr


}


#### Random string generator ####
resource "random_string" "random_string" {
  length           = 8
  special          = true
  upper            = false
  override_special = "-"
}
