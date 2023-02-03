data "aws_iam_policy_document" "cloud9_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "admin_policy" {
  name = "AdministratorAccess"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "public" {
  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#### Random string generator ####
resource "random_string" "random_string" {
  length           = 8
  special          = true
  upper            = false
  override_special = "-"
}

#### Cloud 9 Resources ####
resource "aws_cloud9_environment_ec2" "saas-cloud9" {
  connection_type             = "CONNECT_SSM"
  name                        = "dynamic-saas-cluster-${random_string.random_string.id}"
  automatic_stop_time_minutes = var.cloud9_auto_stop_minutes
  instance_type               = var.cloud9_instance_size
  subnet_id                   = data.aws_subnets.public.ids[0]
}

resource "aws_iam_instance_profile" "cloud9_role" {
  name = aws_iam_role.cloud9_role.name
  role = aws_iam_role.cloud9_role.name
}

resource "aws_iam_role" "cloud9_role" {
  name                = "cloud9_role_${random_string.random_string.id}"
  managed_policy_arns = [data.aws_iam_policy.admin_policy.arn]
  assume_role_policy  = data.aws_iam_policy_document.cloud9_assume_role_policy.json
}
