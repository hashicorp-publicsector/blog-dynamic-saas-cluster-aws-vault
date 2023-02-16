# container

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.51.0 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |
| <a name="provider_docker"></a> [docker](#provider\_docker) | 3.0.1 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.ecr_repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [docker_image.image_pull](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.1/docs/resources/image) | resource |
| [docker_tag.image_tag](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.1/docs/resources/tag) | resource |
| [null_resource.image_push](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_ecr_authorization_token.ecr_token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_authorization_token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Container image name to pull from Docker Hub | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | ECR Repository Name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | ECR Repository Region | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repo_name"></a> [ecr\_repo\_name](#output\_ecr\_repo\_name) | n/a |
| <a name="output_ecr_url"></a> [ecr\_url](#output\_ecr\_url) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
