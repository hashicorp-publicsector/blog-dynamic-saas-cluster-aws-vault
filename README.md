# SaaS Data Isolation with Dynamic Credentials Using Hashicorp Vault in Amazon EKS

The code shared here is intended to provide a sample implementation of SaaS Data Isolation with Dynamic Credentials Using HashiCorp Vault in Amazon EKS. The goal is to provide SaaS developers and architects with working code that will illustrate how multi-tenant SaaS applications can be design and delivered on AWS using HashiCorp Vault and Amazon EKS. The solution implements an identity model that simplifies the management of data access policies and credentials in isolated tenant environments. The focus here is more on giving developers a view into the working elements of the solution without going to the extent of making a full, production-ready solution.  

This is a repository utilizing [HashiCorp Terraform](https://www.hashicorp.com/products/terraform) and it's [providers](https://registry.terraform.io/providers/) to configure the architecture provided in the blog post [insert-valid-link](http://0)  

TODO: refactor logical resource names to use snake case across codebase  
TODO: Get terraform up past step8  

## Prerequisites
<details>
<summary>click to expand</summary>

1. Terraform OSS (it's free!)
1. git CLI (if using Terraform OSS)


</details>

## Usage
<details>
<summary>click to expand</summary>

### Terraform OSS
1. Clone the git repository and navigate to the cloud9 directory:
    ```sh
    git clone [url]
    cd [repo-name]/cloud9/
    ```


2. Run these Terraform commands:
    ```hcl
    terraform init [press enter]
    terraform plan [press enter]
    terraform apply --auto-approve [press enter]
    ```

3. Once complete, Terraform will output the URL for Cloud9:
    ```hcl
    https://us-east-2.console.aws.amazon.com/cloud9control/home?region=us-east-2/
    ```

4. Create EC2 Instance Role via the AWS Console

    - Follow [this deep link](https://console.aws.amazon.com/iam/home#/roles$new?step=review&commonUseCase=EC2%2BEC2&selectedUseCase=EC2&policies=arn:aws:iam::aws:policy%2FAdministratorAccess) to create an IAM role with Administrator access.
    - Confirm that AWS service and EC2 are selected, then click Next to view permissions.
    - Confirm that AdministratorAccess is checked, then click Next: Tags to assign tags.
    - Take the defaults, and click Next: Review to review.
    - Enter dynamic-policy-ref-arch-admin for the Name, and click Create role.

5. Remove managed credentials and attach EC2 Instance Role to Cloud9 Instance

    - Click the gear in the upper right-hand corner of the IDE which opens settings. Click the `AWS Settings` on the left and under `Credentials` slide the button to the left for `AWS managed temporary credentials`. The button should be greyed out when done, indicating it's off.
    - Click the round button with an alphabet in the upper right-hand corner of the IDE and click `Manage EC2 Instance`. This will take you to the EC2 portion of the AWS Console
    - Right-click the EC2 instance and in the fly-out menu, click `Security` -> `Modify IAM Role`
    - Choose the Role you created in the step above. It should be titled `dynamic-policy-ref-arch-admin` and click  `Save`.

6. In the Cloud9 IDE, clone the repo and resume provisioning with Terraform:
    - Click `Window` -> `New Terminal` and enter the following commands:
    -   ```sh
        cd [repo-name]/ [press enter]
        ```
    -   ```hcl
        terraform init [press enter]
        terraform plan [press enter]
        terraform apply --auto-approve [press enter]
        ```

    We've now provisioned + configured the EKS cluster, DynamoDB Table, and all associated networking/security resources! Let's continue with the rest of the deployment.

7. Install k8s dependencies:
    - Click `Window` -> `New Terminal` and enter the following commands:
    -   ```sh
        cd [repo-name]/scripts/ [press enter]
        chmod +x install-k8s-tools.sh
        ./install-k8s-tools.sh
        ```

8. Install Vault:
    - Click `Window` -> `New Terminal` and enter the following commands:
    -   ```sh
        cd [repo-name]/vault/ [press enter]
        chmod +x deploy-vault.sh
        ./deploy-vault.sh
        ```

9. Deploy Sample Silo Tenants:
    - Click `Window` -> `New Terminal` and enter the following commands:
    -   ```sh
        cd [repo-name]/silo/ [press enter]
        chmod +x deploy-siloed-tenants.sh
        ./deploy-siloed-tenants.sh
        ```

10. Test Silo Tenant Deployments:
    > :warning: Close the terminal window that you created the cluster in, and open a new terminal before starting this step otherwise you may get errors about your AWS_REGION not set.
    * Open a **_NEW_** terminal window and `cd` back into `aws-saas-factory-data-isolation-using-hashicorp-vault-in-amazon-eks` and run the following script:

    a. In the Cloud9 test editor, open [test-cases/shell-into-tenant-container.sh](./test-cases/shell-into-tenant-container.sh)
    
    b. Modify the value of environment variable APPLICATION_NS to "tenanta" or "tenantb"
    
    c. Select all the contents of test-cases/shell-into-tenant-container.sh
    
    d. Open a **_NEW_** terminal window
    
    e. Paste the contents of test-cases/shell-into-tenant-container.sh
    
    f. You would now be in a shell within the tenant-specific application (myapp) container
    
    g. In the Cloud9 test editor, open [test-cases/test-dynamodb-access.sh](./test-cases/test-dynamodb-access.sh)
    
    h. Modify the value of environment variable TENANT to "tenanta" or "tenantb", matching the APPLICATION_NS value set in step (b)
    
    i. Select all the contents of test-cases/test-dynamodb-access.sh
    
    j. Paste the contents into the shell that was started on the tenant-specific application container
    
    k. Data items will be pulled from the DynamoDB table Products only where the ShardID matches the tenant ID set by the environment variable AWS_PROFILE. AWS CLI uses the AWS credentials file to use the credentials for the tenant-specific profile.

    l. Data items where the ShardID doesn't match the tenant ID will not be retrieved and the following error will be generated.
    ```
    An error occurred (AccessDeniedException) when calling the GetItem operation: User: arn:aws:sts::ACCOUNT_ID:federated-user/vault-xxxxxxxxxx-yyyyyyyyyyyyyyy is not authorized to perform: dynamodb:GetItem on resource: arn:aws:dynamodb:AWS_REGION:ACCOUNT_ID:table/Products_xxxxxxxx because no session policy allows the dynamodb:GetItem action
    ```

11. Deploy Sample Pooled Tenants
    > :warning: Close the terminal window that you created the cluster in, and open a new terminal before starting this step otherwise you may get errors about your AWS_REGION not set.
    * Open a **_NEW_** terminal window and `cd` back into `aws-saas-factory-data-isolation-using-hashicorp-vault-in-amazon-eks` and run the following script:

    ```bash
    cd pool
    chmod +x deploy-pooled-tenants.sh
    ./deploy-pooled-tenants.sh
    ```

    This [script](./pool/deploy-pooled-tenants.sh) creates the following, for each tenant (tenantc & tenantd):

    a. A Vault role with tenant-scoped IAM session policy
    
    b. Vault policy that allows access to credentials for all sub-tenant (tenantc-* / tenantd-*)
    
    c. A Vault credentials endpoint
    
    d. AppRole for the Vault Agent bound to the tenant-specific Vault policy
    
    e. AppRole credentials (role_id / secret_id) for the Vault Agent sidecar

    f. Kubernetes namespace for the tenant
    
    g. Kubernetes secret containing the Vault Agent's AppRole credentials
    
    h. Kubernetes configmap containing the Vault Agent configuration

    i. Application pods


12. Deploy Sample Pooled Sub-Tenants
    > :warning: Close the terminal window that you created the cluster in, and open a new terminal before starting this step otherwise you may get errors about your AWS_REGION not set.
    * Open a **_NEW_** terminal window and `cd` back into `aws-saas-factory-data-isolation-using-hashicorp-vault-in-amazon-eks` and run the following script:

    ```bash
    cd pool
    chmod +x deploy-pool-sub-tenants.sh
    ./deploy-pool-sub-tenants.sh
    ```

    This [script](./pool/deploy-pool-sub-tenants.sh) completes the following, for each tenant (tenantc & tenantd):

    a. For each sub-tenant, creates a Vault role along with the sub-tenant-scoped IAM session policy
    
    b. For each sub-tenant, creates a Vault credentials endpoint
    
    c. Updates tenant-specific Vault Agent configmap with a template to generate sub-tenant credentials in the mapped secrets volume

    d. Restarts the Vault Agent process with a kill -SIGHUP, for the process to re-read the configmap


13. Test Pooled Tenant Deployments
    > :warning: Close the terminal window that you created the cluster in, and open a new terminal before starting this step otherwise you may get errors about your AWS_REGION not set.
    * Open a **_NEW_** terminal window and `cd` back into `aws-saas-factory-data-isolation-using-hashicorp-vault-in-amazon-eks` and run the following script:

    a. In the Cloud9 test editor, open [test-cases/shell-into-tenant-container.sh](./test-cases/shell-into-tenant-container.sh)
    
    b. Modify the value of environment variable APPLICATION_NS to "tenantc" or "tenantd"
    
    c. Select all the contents of test-cases/shell-into-tenant-container.sh
    
    d. Open a **_NEW_** terminal window
    
    e. Paste the contents of test-cases/shell-into-tenant-container.sh
    
    f. You would now be in a shell within the sub-tenant-specific application (myapp) container
    
    g. In the Cloud9 test editor, open [test-cases/test-dynamodb-access.sh](./test-cases/test-dynamodb-access.sh)
    
    h. Modify the value of environment variable TENANT to "tenantc-1", "tenantc-2", "tenantd-1", or "tenantd-2", corresponding to the APPLICATION_NS value set in step (b)
    
    i. Select all the contents of test-cases/test-dynamodb-access.sh
    
    j. Paste the contents into the shell that was started on the sub-tenant-specific application container
    
    k. Data items will be pulled from the DynamoDB table Products only where the ShardID matches the sub-tenant ID set by the environment variable AWS_PROFILE. AWS CLI uses the AWS credentials file to use the credentials for the sub-tenant-specific profile.

    l. Data items where the ShardID doesn't match the tenant ID will not be retrieved and the following error will be generated.
    ```
    An error occurred (AccessDeniedException) when calling the GetItem operation: User: arn:aws:sts::ACCOUNT_ID:federated-user/vault-xxxxxxxxxx-yyyyyyyyyyyyyyy is not authorized to perform: dynamodb:GetItem on resource: arn:aws:dynamodb:AWS_REGION:ACCOUNT_ID:table/Products_xxxxxxxx because no session policy allows the dynamodb:GetItem action
    ```
</details>

## Cleanup
<details>
<summary>click to expand</summary>


The deployed components can be cleaned up via the following procedure.

### Cloud9 IDE

1. Run the cleanup script via a new terminal window
    - Click `Window` -> `New Terminal` and enter the following commands:
    -   ```sh
        cd [repo-name]/ [press enter]
        chmod +x cleanup.sh
        ./cleanup.sh
        ```
2. Destroy the infrastructure and resources created by Terraform
    - In the same terminal window, run these commands:
    -   ```hcl
        terraform init [press enter]
        terraform plan [press enter]
        terraform destroy --auto-approve [press enter]
        ```

### Local Workstation
1. On your local workstation, destroy the Cloud9 environment created by Terraform:
    -   ```sh
        cd [repo-name]/cloud9 [press enter]
        ```
    -   ```hcl
        terraform init [press enter]
        terraform plan [press enter]
        terraform destroy --auto-approve [press enter]
        ```
</details>




## Requirements
<details>
<summary>click to expand</summary>


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.51.0 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.6.0 |
| <a name="module_kms_key"></a> [kms\_key](#module\_kms\_key) | terraform-aws-modules/kms/aws | ~> 1.1 |
| <a name="module_push_aws_cli_image_ecr"></a> [push\_aws\_cli\_image\_ecr](#module\_push\_aws\_cli\_image\_ecr) | ./container | n/a |
| <a name="module_push_vault_image_ecr"></a> [push\_vault\_image\_ecr](#module\_push\_vault\_image\_ecr) | ./container | n/a |
| <a name="module_push_vault_k8s_image_ecr"></a> [push\_vault\_k8s\_image\_ecr](#module\_push\_vault\_k8s\_image\_ecr) | ./container | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.19.0 |
| <a name="module_vpc_cni_irsa"></a> [vpc\_cni\_irsa](#module\_vpc\_cni\_irsa) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 5.0 |
| <a name="module_vpc_endpoints"></a> [vpc\_endpoints](#module\_vpc\_endpoints) | terraform-aws-modules/vpc/aws//modules/vpc-endpoints | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.product_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_dynamodb_table_item.insert_items](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table_item) | resource |
| [aws_ecr_repository.aws_cli](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.vault_k8s](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_iam_policy.s3_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.s3_access_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.vault-sa-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.s3_access_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_route.peer_to_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.vpc_to_peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_s3_bucket.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_logging.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_policy.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.vault_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_security_group.vpc_eks_node_to_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.vpc_tls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_peering_connection.vpc_peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [random_string.random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_iam_policy_document.s3_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_bucket_logs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route_table.cloud9_rtb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |
| [aws_vpc.cloud9_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cli_image"></a> [aws\_cli\_image](#input\_aws\_cli\_image) | Image name and tag for aws\_cli | `string` | n/a | yes |
| <a name="input_cloud9_subnet_id"></a> [cloud9\_subnet\_id](#input\_cloud9\_subnet\_id) | Subnet ID of Cloud9 Subnet | `string` | n/a | yes |
| <a name="input_cloud9_vpc_id"></a> [cloud9\_vpc\_id](#input\_cloud9\_vpc\_id) | VPC ID of Cloud9 Subnet | `string` | n/a | yes |
| <a name="input_ddb_items"></a> [ddb\_items](#input\_ddb\_items) | Items to add to DDB table | <pre>map(object({<br>    shard_id     = string<br>    product_id   = string<br>    product_name = string<br>  }))</pre> | n/a | yes |
| <a name="input_eks_data"></a> [eks\_data](#input\_eks\_data) | Map of data relevant to the EKS Cluster | <pre>object({<br>    version          = string<br>    ami_type_default = string<br>    instance_types   = list(string)<br>    volume_size      = string<br>    volume_type      = string<br>    min_size         = number<br>    max_size         = number<br>    desired_size     = number<br>  })</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for deploying resources | `string` | n/a | yes |
| <a name="input_tag_prefix"></a> [tag\_prefix](#input\_tag\_prefix) | Prefix tag for VPCs | `string` | n/a | yes |
| <a name="input_vault_image"></a> [vault\_image](#input\_vault\_image) | Image name and tag for Vault | `string` | n/a | yes |
| <a name="input_vault_k8s_image"></a> [vault\_k8s\_image](#input\_vault\_k8s\_image) | Image name and tag for Vault-K8S | `string` | n/a | yes |
| <a name="input_vpc_data"></a> [vpc\_data](#input\_vpc\_data) | Data required to be passed to VPC module | <pre>object({<br>    cidr                 = string<br>    public_subnet_cidrs  = list(string)<br>    private_subnet_cidrs = list(string)<br>    availability_zones   = list(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | n/a |
| <a name="output_random_string"></a> [random\_string](#output\_random\_string) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_vault_ecr_uri"></a> [vault\_ecr\_uri](#output\_vault\_ecr\_uri) | n/a |
| <a name="output_vault_k8s_ecr_uri"></a> [vault\_k8s\_ecr\_uri](#output\_vault\_k8s\_ecr\_uri) | n/a |
| <a name="output_vpc_cni_irsa"></a> [vpc\_cni\_irsa](#output\_vpc\_cni\_irsa) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
</details>