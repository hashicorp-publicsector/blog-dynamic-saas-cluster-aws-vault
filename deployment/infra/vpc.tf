# VPC Data Resources
data "aws_vpc" "cloud9_vpc" {
  id = local.cloud9_vpc_id
}

data "aws_route_table" "cloud9_rtb" {
  vpc_id    = local.cloud9_vpc_id
  subnet_id = local.cloud9_subnet_id
}

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
  peer_vpc_id = local.cloud9_vpc_id
  vpc_id      = module.vpc.vpc_id


  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
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