output "cloud9_subnet" {
  value = module.vpc.public_subnets[0]
}

output "cloud9_id" {
  value = aws_cloud9_environment_ec2.saas_cloud9.id
}

output "cloud9_arn" {
  value = aws_cloud9_environment_ec2.saas_cloud9.arn
}

output "cloud9_url" {
  value = "https://${var.region}.console.aws.amazon.com/cloud9/ide/${aws_cloud9_environment_ec2.saas_cloud9.id}"
}

output "cloud9_vpc" {
  value = module.vpc.vpc_id
}
