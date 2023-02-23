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