output "cloud9_subnet" {
  value = data.aws_subnets.public.ids[0]
}

output "cloud9_id" {
  value = aws_cloud9_environment_ec2.saas_cloud9.id
}

output "cloud9_arn" {
  value = aws_cloud9_environment_ec2.saas_cloud9.arn
}
