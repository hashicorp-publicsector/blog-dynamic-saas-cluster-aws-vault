# Place your variable overrides or values in this file if you aren't using TFC's variable store for some reason
tag_prefix = "dynamic-policy-saas-cluster"
vpc_data = {
  cidr                 = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.100.0/24", "10.0.101.0/24"]
  availability_zones   = ["us-east-2a", "us-east-2b"]
}
eks_data = {
  version          = "1.24",
  instance_types   = ["t3.medium", "t3a.medium"],
  ami_type_default = "AL2_x86_64",
  min_size         = 2,
  max_size         = 2,
  desired_size     = 2,
  volume_size      = 80
  volume_type      = "gp2",
}
vault_image     = "hashicorp/vault:1.12.2"
vault_k8s_image = "hashicorp/vault-k8s:1.1"
aws_cli_image   = "public.ecr.aws/aws-cli/aws-cli:latest"


ddb_items = {
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

helm_config = {
  name             = "vault"
  namespace        = "vault"
  create_namespace = true
  description      = "Vault on EKS"
  version          = "0.23.0"
  repository       = "https://helm.releases.hashicorp.com"
}
