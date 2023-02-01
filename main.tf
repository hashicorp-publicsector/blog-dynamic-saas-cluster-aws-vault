# VPC Configuration
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "${var.vpc_tag_prefix}/VPC"
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnet_cidrs
  public_subnets  = var.public_subnet_cidrs

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_dns_hostnames   = true
  enable_dns_support     = true

  nat_gateway_tags = {
    "Name" = "${var.vpc_tag_prefix}/natgw"
  }

  igw_tags = {
    "Name" = "${var.vpc_tag_prefix}/igw"
  }

  private_subnet_names = ["${var.vpc_tag_prefix}/PrivateSubnet01", "${var.vpc_tag_prefix}/PrivateSubnet02"]
  public_subnet_names  = ["${var.vpc_tag_prefix}/PublicSubnet01", "${var.vpc_tag_prefix}/PublicSubnet02"]
}
