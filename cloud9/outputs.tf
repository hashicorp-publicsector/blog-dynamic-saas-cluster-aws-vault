output "cloud9_subnet" {
  value = data.aws_subnets.public.ids[0]
}
