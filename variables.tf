#### Global Variables ####
variable "region" {
  description = "Region for deploying resources"
  type        = string
  default     = "us-east-2"
}


#### VPC Variables ####
variable "availability_zones" {
  description = "List of AZs in AWS to deploy into"
  type        = list(any)
  default     = ["us-east-2a", "us-east-2b"]
}

variable "vpc_cidr" {
  description = "CIDR of VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "List of Private Subnet CIDRs"
  type        = list(any)
  default     = ["10.2.64.0/19", "10.2.96.0/19"]

}

variable "public_subnet_cidrs" {
  description = "List of Public Subnet CIDRs"
  type        = list(any)
  default     = ["10.0.0.0/27", "10.0.16.0/27"]
}

variable "vpc_tag_prefix" {
  description = "Prefix tag for VPCs"
  default     = "dynamic-policy-saas-cluster"
  type        = string
}

#### EKS Variables ####
