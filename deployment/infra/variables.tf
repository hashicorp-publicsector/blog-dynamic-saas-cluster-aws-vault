#### Global Variables ####

variable "tag_prefix" {
  description = "Prefix tag for VPCs"
  type        = string
  default     = "dynamic-policy-saas-cluster"
}

#### VPC Variables ####
variable "vpc_data" {
  description = "Data required to be passed to VPC module"
  type = object({
    cidr                 = string
    public_subnet_cidrs  = list(string)
    private_subnet_cidrs = list(string)
    availability_zones   = list(string)
  })
  default = {
    cidr                 = "10.0.0.0/16"
    public_subnet_cidrs  = ["10.0.0.0/24", "10.0.1.0/24"]
    private_subnet_cidrs = ["10.0.100.0/24", "10.0.101.0/24"]
    availability_zones   = ["us-east-2a", "us-east-2b"]
  }
}

#### EKS Variables ####
variable "eks_data" {
  description = "Map of data relevant to the EKS Cluster"
  type = object({
    version          = string
    ami_type_default = string
    instance_types   = list(string)
    volume_size      = string
    volume_type      = string
    min_size         = number
    max_size         = number
    desired_size     = number
  })
  default = {
    version          = "1.24",
    instance_types   = ["t3.medium", "t3a.medium"],
    ami_type_default = "AL2_x86_64",
    min_size         = 2,
    max_size         = 2,
    desired_size     = 2,
    volume_size      = 80
    volume_type      = "gp2",
  }
}

variable "vault_image" {
  description = "Image name and tag for Vault"
  type        = string
  default     = "hashicorp/vault:1.12.2"
}
variable "vault_k8s_image" {
  description = "Image name and tag for Vault-K8S"
  type        = string
  default     = "hashicorp/vault-k8s:1.1"
}

variable "aws_cli_image" {
  description = "Image name and tag for aws_cli"
  type        = string
  default     = "public.ecr.aws/aws-cli/aws-cli:latest"
}

#### DynamoDB Table Items ####
variable "ddb_items" {
  description = "Items to add to DDB table"
  type = map(object({
    shard_id     = string
    product_id   = string
    product_name = string
  }))
  default = {
    item1 = {
      shard_id     = "tenanta",
      product_id   = "1",
      product_name = "SmartWatch",
    },
    item2 = {
      shard_id     = "tenanta",
      product_id   = "2",
      product_name = "PowerBank",
    },
    item3 = {
      shard_id     = "tenantb",
      product_id   = "3",
      product_name = "AirFreshner",
    },
    item4 = {
      shard_id     = "tenantb",
      product_id   = "4",
      product_name = "BabyFormula",
    },
    item5 = {
      shard_id     = "tenantc-1",
      product_id   = "5",
      product_name = "Book",
    },
    item6 = {
      shard_id     = "tenantc-2",
      product_id   = "6",
      product_name = "SmartPhone",
    },
    item7 = {
      shard_id     = "tenantd-1",
      product_id   = "7",
      product_name = "RingLight",
    },
    item8 = {
      shard_id     = "tenantd-2",
      product_id   = "8",
      product_name = "Laptop",
    }
  }
}


variable "helm_config" {
  description = "Object to hold helm values"
  type = object({
    name             = string
    namespace        = string
    create_namespace = bool
    description      = string
    version          = string
    repository       = string
  })
  default = {
    name             = "vault"
    namespace        = "vault"
    create_namespace = true
    description      = "Vault on EKS"
    version          = "0.23.0"
    repository       = "https://helm.releases.hashicorp.com"
  }
}
