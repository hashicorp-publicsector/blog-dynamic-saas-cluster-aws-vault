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
| <a name="provider_docker.remote_repo"></a> [docker.remote\_repo](#provider\_docker.remote\_repo) | 3.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_image.image_pull](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.1/docs/resources/image) | resource |
| [docker_registry_image.image_push](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.1/docs/resources/registry_image) | resource |
| [docker_tag.image_tag](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.1/docs/resources/tag) | resource |
| [aws_ecr_authorization_token.ecr_token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_authorization_token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_registry_id"></a> [ecr\_registry\_id](#input\_ecr\_registry\_id) | ECR Registry ID | `string` | n/a | yes |
| <a name="input_ecr_repository_url"></a> [ecr\_repository\_url](#input\_ecr\_repository\_url) | ECR URL | `string` | n/a | yes |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Container image name to pull from Docker Hub | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
