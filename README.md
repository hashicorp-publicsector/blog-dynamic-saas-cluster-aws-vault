# aws-saas-blog
This is a Terraform version of the AWS Blog post for Dynamic Policy for SaaS with vault  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.19.0 |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.ProductTable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of AZs in AWS to deploy into | `list(any)` | <pre>[<br>  "us-east-2a",<br>  "us-east-2b"<br>]</pre> | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of Private Subnet CIDRs | `list(any)` | <pre>[<br>  "10.0.100.0/24",<br>  "10.0.101.0/24"<br>]</pre> | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of Public Subnet CIDRs | `list(any)` | <pre>[<br>  "10.0.0.0/24",<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Region for deploying resources | `string` | `"us-east-2"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR of VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_tag_prefix"></a> [vpc\_tag\_prefix](#input\_vpc\_tag\_prefix) | Prefix tag for VPCs | `string` | `"dynamic-policy-saas-cluster"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
