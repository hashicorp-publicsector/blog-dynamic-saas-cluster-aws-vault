data "aws_iam_policy_document" "cloud9_ssm_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com", "cloud9.amazonaws.com"]
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name    = "cloud9-vpc-${random_pet.random_pet.id}"
  cidr    = var.cloud9_vpc.cidr

  azs                  = var.cloud9_vpc.azs
  public_subnets       = var.cloud9_vpc.public_subnet_cidrs
  enable_dns_support   = true
  enable_dns_hostnames = true

}

#### Random string generator ####
resource "random_pet" "random_pet" {
  length = 1
}

#### Cloud 9 Resources ####
resource "aws_cloud9_environment_ec2" "saas_cloud9" {
  connection_type             = "CONNECT_SSM"
  name                        = "dynamic-saas-cluster-${random_pet.random_pet.id}"
  automatic_stop_time_minutes = var.cloud9_auto_stop_minutes
  instance_type               = var.cloud9_instance_size
  subnet_id                   = module.vpc.public_subnets[0]
}


resource "aws_iam_instance_profile" "cloud9_ssm_profile" {
  count = var.cloud9_default_role_exists == false ? 1 : 0
  name  = "AWSCloud9SSMInstanceProfile"
  role  = aws_iam_role.cloud9_ssm_role[0].name
  path  = "/cloud9/"
}

resource "aws_iam_role" "cloud9_ssm_role" {
  count               = var.cloud9_default_role_exists == false ? 1 : 0
  name                = "AWSCloud9SSMAccessRole"
  managed_policy_arns = ["arn:aws:iam::aws:policy/AWSCloud9SSMInstanceProfile"]
  assume_role_policy  = data.aws_iam_policy_document.cloud9_ssm_assume_role_policy.json
  path                = "/service-role/"
}
