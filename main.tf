# Data Sources #
data "aws_caller_identity" "current" {}


# VPC Configuration
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


# Dynamo DB Configuration
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
