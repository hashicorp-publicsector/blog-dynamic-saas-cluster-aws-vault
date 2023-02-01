#### Global Variables ####
variable "region" {
  description = "Region for deploying resources"
  type        = string
  default     = "us-east-2"
}

variable "tag_prefix" {
  description = "Prefix tag for VPCs"
  default     = "dynamic-policy-saas-cluster"
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
    volume_details   = map(string)
  })
  default = {
    version          = "1.24",
    instance_types   = ["t3.medium", "t3a.medium"],
    ami_type_default = "AL2_x86_64",
    volume_details = {
      size       = "80",
      iops       = "3000",
      throughput = "150",
      type       = "gp3"
    },
  }
}
