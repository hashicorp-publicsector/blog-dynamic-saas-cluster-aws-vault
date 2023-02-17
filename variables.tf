#### Global Variables ####
variable "region" {
  description = "Region for deploying resources"
  type        = string
}

variable "tag_prefix" {
  description = "Prefix tag for VPCs"
  type        = string
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
}

variable "vault_image" {
  description = "Image name and tag for Vault"
  type        = string
}
variable "vault_k8s_image" {
  description = "Image name and tag for Vault-K8S"
  type        = string
}

variable "aws_cli_image" {
  description = "Image name and tag for aws_cli"
  type        = string
}

variable "cloud9_vpc_id" {
  description = "VPC ID of Cloud9 Subnet"
  type        = string
}

variable "cloud9_subnet_id" {
  description = "Subnet ID of Cloud9 Instance"
  type        = string
}

#### DynamoDB Table Items ####
variable "ddb_items" {
  description = "Items to add to DDB table"
  type = map(object({
    shard_id     = string
    product_id   = string
    product_name = string
  }))
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
}
