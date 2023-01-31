resource "aws_iam_role" "tfer--AWSCloud9SSMAccessRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cloud9.amazonaws.com",
          "ec2.amazonaws.com"
        ]
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSCloud9SSMInstanceProfile"]
  max_session_duration = "3600"
  name                 = "AWSCloud9SSMAccessRole"
  path                 = "/service-role/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAWSCloud9" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloud9.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service linked role for AWS Cloud9"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSCloud9ServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAWSCloud9"
  path                 = "/aws-service-role/cloud9.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAmazonEKS" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows Amazon EKS to call AWS services on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonEKSServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAmazonEKS"
  path                 = "/aws-service-role/eks.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAmazonEKSNodegroup" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "eks-nodegroup.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "This policy allows Amazon EKS to create and manage Nodegroups"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAmazonEKSNodegroup"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAmazonEKSNodegroup"
  path                 = "/aws-service-role/eks-nodegroup.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAmazonGuardDuty" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "guardduty.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonGuardDutyServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAmazonGuardDuty"
  path                 = "/aws-service-role/guardduty.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAutoScaling" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "autoscaling.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAutoScaling"
  path                 = "/aws-service-role/autoscaling.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForCloudTrail" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/CloudTrailServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForCloudTrail"
  path                 = "/aws-service-role/cloudtrail.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForConfig" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "config.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSConfigServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForConfig"
  path                 = "/aws-service-role/config.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForOrganizations" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "organizations.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service-linked role used by AWS Organizations to enable integration of other AWS services with Organizations."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForOrganizations"
  path                 = "/aws-service-role/organizations.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForSupport" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "support.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Enables resource access for AWS to provide billing, administrative and support services"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForSupport"
  path                 = "/aws-service-role/support.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForTrustedAdvisor" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "trustedadvisor.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForTrustedAdvisor"
  path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
}

resource "aws_iam_role" "tfer--JupiterOneServiceRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "20cf3959-fa0f-4ac0-9b73-211030682873"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::612791702201:root"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  description = "JupiterOne AWS Integration Role"

  inline_policy {
    name   = "JupiterOneAdditional"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"access-analyzer:List*\",\"batch:Describe*\",\"batch:List*\",\"cloudhsm:DescribeBackups\",\"cloudhsm:DescribeClusters\",\"cloudhsm:ListTags\",\"cloudwatch:GetMetricData\",\"dynamodb:Describe*\",\"dynamodb:List*\",\"ecr:Describe*\",\"ecr:GetLifecyclePolicy\",\"ecr:GetRepositoryPolicy\",\"ecr:List*\",\"elasticache:List*\",\"elasticfilesystem:Describe*\",\"elasticmapreduce:List*\",\"es:List*\",\"kinesis:Describe*\",\"kinesis:List*\",\"lambda:GetFunction*\",\"macie:ListFindings\",\"monitoring:ListTagsForResource\",\"organizations:ListAccounts\",\"shield:GetSubscriptionState\",\"s3:GetObjectRetention\",\"s3:GetObjectLegalHold\",\"s3:Get*Configuration\",\"sns:GetTopicAttributes\",\"sns:GetSubscriptionAttributes\",\"sns:ListTopics\",\"sns:ListSubscriptions\",\"sns:ListTagsForResource\",\"waf:List*\",\"waf:Get*\",\"waf-regional:List*\",\"waf-regional:Get*\",\"wafv2:List*\",\"wafv2:Get*\",\"wafv2:CheckCapacity\",\"wafv2:DescribeManagedRuleGroup\",\"workspaces:List*\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AdditionalPermissions\"},{\"Action\":[\"apigateway:GET\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:apigateway:*::/*\",\"Sid\":\"AdditionalPermissionsApiGateway\"}]}"
  }

  inline_policy {
    name   = "SecurityAudit"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"access-analyzer:GetAnalyzedResource\",\"access-analyzer:GetAnalyzer\",\"access-analyzer:GetArchiveRule\",\"access-analyzer:GetFinding\",\"access-analyzer:ListAnalyzedResources\",\"access-analyzer:ListAnalyzers\",\"access-analyzer:ListArchiveRules\",\"access-analyzer:ListFindings\",\"access-analyzer:ListTagsForResource\",\"acm:Describe*\",\"acm:List*\",\"application-autoscaling:Describe*\",\"appmesh:Describe*\",\"appmesh:List*\",\"appsync:List*\",\"athena:GetWorkGroup\",\"athena:List*\",\"autoscaling:Describe*\",\"batch:DescribeComputeEnvironments\",\"batch:DescribeJobDefinitions\",\"chime:List*\",\"cloud9:Describe*\",\"cloud9:ListEnvironments\",\"clouddirectory:ListDirectories\",\"cloudformation:DescribeStack*\",\"cloudformation:GetTemplate\",\"cloudformation:ListStack*\",\"cloudformation:GetStackPolicy\",\"cloudfront:Get*\",\"cloudfront:List*\",\"cloudhsm:ListHapgs\",\"cloudhsm:ListHsms\",\"cloudhsm:ListLunaClients\",\"cloudsearch:DescribeDomains\",\"cloudsearch:DescribeServiceAccessPolicies\",\"cloudtrail:DescribeTrails\",\"cloudtrail:GetEventSelectors\",\"cloudtrail:GetTrailStatus\",\"cloudtrail:ListTags\",\"cloudtrail:LookupEvents\",\"cloudwatch:Describe*\",\"codebuild:ListProjects\",\"codecommit:BatchGetRepositories\",\"codecommit:GetBranch\",\"codecommit:GetObjectIdentifier\",\"codecommit:GetRepository\",\"codecommit:List*\",\"codedeploy:Batch*\",\"codedeploy:Get*\",\"codedeploy:List*\",\"codepipeline:ListPipelines\",\"codestar:Describe*\",\"codestar:List*\",\"cognito-identity:ListIdentityPools\",\"cognito-idp:ListUserPools\",\"cognito-sync:Describe*\",\"cognito-sync:List*\",\"comprehend:Describe*\",\"comprehend:List*\",\"config:BatchGetAggregateResourceConfig\",\"config:BatchGetResourceConfig\",\"config:Deliver*\",\"config:Describe*\",\"config:Get*\",\"config:List*\",\"datapipeline:DescribeObjects\",\"datapipeline:DescribePipelines\",\"datapipeline:EvaluateExpression\",\"datapipeline:GetPipelineDefinition\",\"datapipeline:ListPipelines\",\"datapipeline:QueryObjects\",\"datapipeline:ValidatePipelineDefinition\",\"datasync:Describe*\",\"datasync:List*\",\"dax:Describe*\",\"dax:ListTags\",\"directconnect:Describe*\",\"dms:Describe*\",\"dms:ListTagsForResource\",\"ds:DescribeDirectories\",\"dynamodb:DescribeContinuousBackups\",\"dynamodb:DescribeGlobalTable\",\"dynamodb:DescribeTable\",\"dynamodb:DescribeTimeToLive\",\"dynamodb:ListBackups\",\"dynamodb:ListGlobalTables\",\"dynamodb:ListStreams\",\"dynamodb:ListTables\",\"ec2:Describe*\",\"ecr:DescribeRepositories\",\"ecr:GetRepositoryPolicy\",\"ecs:Describe*\",\"ecs:List*\",\"eks:DescribeCluster\",\"eks:DescribeNodeGroup\",\"eks:ListClusters\",\"eks:ListNodeGroups\",\"elasticache:Describe*\",\"elasticbeanstalk:Describe*\",\"elasticfilesystem:DescribeFileSystems\",\"elasticfilesystem:DescribeMountTargetSecurityGroups\",\"elasticfilesystem:DescribeMountTargets\",\"elasticloadbalancing:Describe*\",\"elasticmapreduce:Describe*\",\"elasticmapreduce:ListClusters\",\"elasticmapreduce:ListInstances\",\"es:Describe*\",\"es:ListDomainNames\",\"events:Describe*\",\"events:List*\",\"firehose:Describe*\",\"firehose:List*\",\"fms:ListComplianceStatus\",\"fms:ListPolicies\",\"fsx:Describe*\",\"fsx:List*\",\"gamelift:ListBuilds\",\"gamelift:ListFleets\",\"glacier:DescribeVault\",\"glacier:GetVaultAccessPolicy\",\"glacier:ListVaults\",\"globalaccelerator:Describe*\",\"globalaccelerator:List*\",\"greengrass:List*\",\"guardduty:Get*\",\"guardduty:List*\",\"iam:GenerateCredentialReport\",\"iam:GenerateServiceLastAccessedDetails\",\"iam:Get*\",\"iam:List*\",\"iam:SimulateCustomPolicy\",\"iam:SimulatePrincipalPolicy\",\"inspector:Describe*\",\"inspector:Get*\",\"inspector:List*\",\"inspector:Preview*\",\"iot:Describe*\",\"iot:GetPolicy\",\"iot:GetPolicyVersion\",\"iot:List*\",\"kinesis:DescribeStream\",\"kinesis:ListStreams\",\"kinesis:ListTagsForStream\",\"kinesisanalytics:ListApplications\",\"kms:Describe*\",\"kms:Get*\",\"kms:List*\",\"lambda:GetAccountSettings\",\"lambda:GetFunctionConfiguration\",\"lambda:GetLayerVersionPolicy\",\"lambda:GetPolicy\",\"lambda:List*\",\"license-manager:List*\",\"lightsail:GetInstances\",\"lightsail:GetLoadBalancers\",\"logs:Describe*\",\"logs:ListTagsLogGroup\",\"machinelearning:DescribeMLModels\",\"mediaconnect:Describe*\",\"mediaconnect:List*\",\"mediastore:GetContainerPolicy\",\"mediastore:ListContainers\",\"opsworks:DescribeStacks\",\"opsworks-cm:DescribeServers\",\"organizations:List*\",\"organizations:Describe*\",\"quicksight:Describe*\",\"quicksight:List*\",\"ram:List*\",\"rds:Describe*\",\"rds:DownloadDBLogFilePortion\",\"rds:ListTagsForResource\",\"redshift:Describe*\",\"rekognition:Describe*\",\"rekognition:List*\",\"robomaker:Describe*\",\"robomaker:List*\",\"route53:Get*\",\"route53:List*\",\"route53domains:GetDomainDetail\",\"route53domains:GetOperationDetail\",\"route53domains:ListDomains\",\"route53domains:ListOperations\",\"route53domains:ListTagsForDomain\",\"route53resolver:List*\",\"route53resolver:Get*\",\"s3:GetAccelerateConfiguration\",\"s3:GetAccessPoint\",\"s3:GetAccessPointPolicy\",\"s3:GetAccessPointPolicyStatus\",\"s3:GetAccountPublicAccessBlock\",\"s3:GetAnalyticsConfiguration\",\"s3:GetBucket*\",\"s3:GetEncryptionConfiguration\",\"s3:GetInventoryConfiguration\",\"s3:GetLifecycleConfiguration\",\"s3:GetMetricsConfiguration\",\"s3:GetObjectAcl\",\"s3:GetObjectVersionAcl\",\"s3:GetReplicationConfiguration\",\"s3:ListAccessPoints\",\"s3:ListAllMyBuckets\",\"sagemaker:Describe*\",\"sagemaker:List*\",\"sdb:DomainMetadata\",\"sdb:ListDomains\",\"secretsmanager:GetResourcePolicy\",\"secretsmanager:ListSecrets\",\"secretsmanager:ListSecretVersionIds\",\"securityhub:Describe*\",\"securityhub:Get*\",\"securityhub:List*\",\"serverlessrepo:GetApplicationPolicy\",\"serverlessrepo:List*\",\"ses:GetIdentityDkimAttributes\",\"ses:GetIdentityPolicies\",\"ses:GetIdentityVerificationAttributes\",\"ses:ListIdentities\",\"ses:ListIdentityPolicies\",\"ses:ListVerifiedEmailAddresses\",\"shield:Describe*\",\"shield:List*\",\"snowball:ListClusters\",\"snowball:ListJobs\",\"sns:GetTopicAttributes\",\"sns:ListSubscriptionsByTopic\",\"sns:ListTopics\",\"sqs:GetQueueAttributes\",\"sqs:ListDeadLetterSourceQueues\",\"sqs:ListQueues\",\"sqs:ListQueueTags\",\"ssm:Describe*\",\"ssm:GetAutomationExecution\",\"ssm:ListDocuments\",\"sso:DescribePermissionsPolicies\",\"sso:List*\",\"states:ListStateMachines\",\"storagegateway:DescribeBandwidthRateLimit\",\"storagegateway:DescribeCache\",\"storagegateway:DescribeCachediSCSIVolumes\",\"storagegateway:DescribeGatewayInformation\",\"storagegateway:DescribeMaintenanceStartTime\",\"storagegateway:DescribeNFSFileShares\",\"storagegateway:DescribeSnapshotSchedule\",\"storagegateway:DescribeStorediSCSIVolumes\",\"storagegateway:DescribeTapeArchives\",\"storagegateway:DescribeTapeRecoveryPoints\",\"storagegateway:DescribeTapes\",\"storagegateway:DescribeUploadBuffer\",\"storagegateway:DescribeVTLDevices\",\"storagegateway:DescribeWorkingStorage\",\"storagegateway:List*\",\"tag:GetResources\",\"tag:GetTagKeys\",\"transfer:Describe*\",\"transfer:List*\",\"translate:List*\",\"trustedadvisor:Describe*\",\"waf-regional:Get*\",\"waf-regional:List*\",\"waf:Get*\",\"waf:List*\",\"wafv2:Get*\",\"wafv2:List*\",\"workdocs:Describe*\",\"workspaces:Describe*\",\"xray:Get*\",\"xray:List*\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SecurityAudit\"},{\"Action\":[\"apigateway:GET\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:apigateway:*::/apis\",\"arn:aws:apigateway:*::/apis/*/stages\",\"arn:aws:apigateway:*::/apis/*/stages/*\",\"arn:aws:apigateway:*::/apis/*/routes\",\"arn:aws:apigateway:*::/restapis\",\"arn:aws:apigateway:*::/restapis/*/authorizers\",\"arn:aws:apigateway:*::/restapis/*/authorizers/*\",\"arn:aws:apigateway:*::/restapis/*/documentation/versions\",\"arn:aws:apigateway:*::/restapis/*/resources\",\"arn:aws:apigateway:*::/restapis/*/resources/*\",\"arn:aws:apigateway:*::/restapis/*/resources/*/methods/*\",\"arn:aws:apigateway:*::/restapis/*/stages\",\"arn:aws:apigateway:*::/restapis/*/stages/*\",\"arn:aws:apigateway:*::/vpclinks\"],\"Sid\":\"SecurityAuditApiGateway\"}]}"
  }

  max_session_duration = "3600"
  name                 = "JupiterOneServiceRole"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--PermisoServiceRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "EnvC9wiynP6h-EXVW7r0A-FKiV9FMkqlerxJ"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:sts::940313271035:assumed-role/PermisoExternal/permisoIdentity"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  description = "Permiso AWS Integration Role"

  inline_policy {
    name   = "PermisoIdentityReadOnly"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"cloudtrail:LookupEvents\",\"config:ListDiscoveredResources\",\"ec2:DescribeInstances\",\"guardduty:GetFindings\",\"guardduty:ListDetectors\",\"guardduty:ListFindings\",\"iam:GenerateCredentialReport\",\"iam:GenerateServiceLastAccessedDetails\",\"iam:GetAccessKeyLastUsed\",\"iam:GetAccountAuthorizationDetails\",\"iam:GetCredentialReport\",\"iam:GetPolicy\",\"iam:GetPolicyVersion\",\"iam:GetSAMLProvider\",\"iam:GetServiceLastAccessedDetails\",\"iam:ListAccessKeys\",\"iam:ListGroups\",\"iam:ListInstanceProfiles\",\"iam:ListPolicies\",\"iam:ListRoles\",\"iam:ListUsers\",\"iam:ListSAMLProviders\",\"iam:ListAccountAliases\",\"identitystore:DescribeGroup\",\"identitystore:DescribeUser\",\"lambda:ListFunctions\",\"lambda:GetFunction\",\"organizations:DescribeAccount\",\"organizations:DescribeEffectivePolicy\",\"organizations:DescribeOrganization\",\"organizations:DescribeOrganizationalUnit\",\"organizations:DescribePolicy\",\"organizations:ListAccounts\",\"organizations:ListAccountsForParent\",\"organizations:ListChildren\",\"organizations:ListOrganizationalUnitsForParent\",\"organizations:ListParents\",\"organizations:ListPolicies\",\"organizations:ListPoliciesForTarget\",\"organizations:ListRoots\",\"organizations:ListTagsForResource\",\"organizations:ListTargetsForPolicy\",\"sso:DescribePermissionSet\",\"sso:GetInlinePolicyForPermissionSet\",\"sso:ListAccountAssignments\",\"sso:ListAccountsForProvisionedPermissionSet\",\"sso:ListInstances\",\"sso:ListManagedPoliciesInPermissionSet\",\"sso:ListPermissionSets\",\"s3:GetBucketPolicyStatus\",\"s3:GetEncryptionConfiguration\",\"s3:ListAllMyBuckets\",\"s3:GetBucketVersioning\",\"s3:GetBucketAcl\",\"s3:GetBucketPolicy\",\"s3:GetBucketPublicAccessBlock\",\"s3:GetAccountPublicAccessBlock\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"PermisoIdentityReadOnly\"}]}"
  }

  max_session_duration = "3600"
  name                 = "PermisoServiceRole"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--aws_jay-002E-aware_test-admin" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::397512762488:user/doormatServiceUser"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  inline_policy {
    name   = "AdministratorAccess"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"*\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AdministratorAccess\"}]}"
  }

  max_session_duration = "43200"
  name                 = "aws_jay.aware_test-admin"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--aws_jay-002E-aware_test-developer" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::397512762488:user/doormatServiceUser"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  inline_policy {
    name   = "AllowEKSOIDCProvider"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:AddClientIDToOpenIDConnectProvider\",\"iam:CreateOpenIDConnectProvider\",\"iam:DeleteOpenIDConnectProvider\",\"iam:RemoveClientIDFromOpenIDConnectProvider\",\"iam:TagOpenIDConnectProvider\",\"iam:UntagOpenIDConnectProvider\",\"iam:UpdateOpenIDConnectProviderThumbprint\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::591976937045:oidc-provider/oidc.eks.*.amazonaws.com\",\"arn:aws:iam::591976937045:oidc-provider/oidc.eks.*.amazonaws.com/*\"],\"Sid\":\"EKSOIDCProvider\"}]}"
  }

  inline_policy {
    name   = "AllowMutateIAM"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:AttachRolePolicy\",\"iam:CreateRole\",\"iam:DeleteRole\",\"iam:DeleteRolePolicy\",\"iam:DetachRolePolicy\",\"iam:PutRolePolicy\",\"iam:UpdateAssumeRolePolicy\",\"iam:UpdateRole\",\"iam:UpdateRoleDescription\",\"iam:PassRole\",\"iam:TagRole\",\"iam:UntagRole\",\"iam:AddRoleToInstanceProfile\",\"iam:CreateInstanceProfile\",\"iam:DeleteInstanceProfile\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:TagInstanceProfile\",\"iam:UntagInstanceProfile\",\"iam:CreateAccessKey\",\"iam:DeleteAccessKey\",\"iam:UpdateAccessKey\",\"iam:CreateVirtualMFADevice\",\"iam:EnableMFADevice\",\"iam:DeactivateMFADevice\",\"iam:DeleteVirtualMFADevice\",\"iam:ResyncMFADevice\",\"iam:DeleteUserPolicy\",\"iam:PutUserPolicy\",\"iam:GenerateOrganizationsAccessReport\",\"iam:CreateServiceLinkedRole\",\"iam:DeleteServiceLinkedRole\",\"iam:UpdateServerCertificate\",\"iam:UploadServerCertificate\",\"iam:DeleteServerCertificate\",\"rolesanywhere:Delete*\",\"rolesanywhere:Disable*\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AllowIAM\"}]}"
  }

  inline_policy {
    name   = "AllowMutateIAMPoliciesAndPassword"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:ChangePassword\",\"iam:DeleteLoginProfile\",\"iam:CreatePolicy\",\"iam:CreatePolicyVersion\",\"iam:DeletePolicy\",\"iam:DeletePolicyVersion\",\"iam:TagPolicy\",\"iam:UntagPolicy\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"PoliciesAndPassword\"}]}"
  }

  inline_policy {
    name   = "AllowTFCOIDCProvider"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:AddClientIDToOpenIDConnectProvider\",\"iam:CreateOpenIDConnectProvider\",\"iam:DeleteOpenIDConnectProvider\",\"iam:GetOpenIDConnectProvider\",\"iam:ListOpenIDConnectProviderTags\",\"iam:RemoveClientIDFromOpenIDConnectProvider\",\"iam:TagOpenIDConnectProvider\",\"iam:UntagOpenIDConnectProvider\",\"iam:UpdateOpenIDConnectProviderThumbprint\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::591976937045:oidc-provider/app.terraform.io\",\"arn:aws:iam::591976937045:oidc-provider/app.terraform.io/*\"],\"Sid\":\"TFCOIDCProvider\"}]}"
  }

  inline_policy {
    name   = "DemoUserCreate"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreateUser\"],\"Condition\":{\"StringEquals\":{\"iam:PermissionsBoundary\":\"arn:aws:iam::591976937045:policy/DemoUser\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::591976937045:user/demo-${aws:SourceIdentity}*\",\"Sid\":\"DemoUserCreate\"},{\"Action\":[\"iam:DeleteUser\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::591976937045:user/demo-${aws:SourceIdentity}*\",\"Sid\":\"DemoUserDelete\"}]}"
  }

  inline_policy {
    name   = "IAMAndOrgReadOnlyAccess"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"rolesanywhere:Get*\",\"rolesanywhere:List*\",\"organizations:Describe*\",\"organizations:List*\",\"iam:Generate*\",\"iam:Get*\",\"iam:List*\",\"iam:Simulate*\",\"account:ListRegions\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ReadOnly\"}]}"
  }

  inline_policy {
    name   = "PowerUserAccess"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"NotAction\":[\"account:*\",\"iam:*\",\"organizations:*\",\"rolesanywhere:*\"],\"Resource\":\"*\",\"Sid\":\"PowerUserAccess\"}]}"
  }

  max_session_duration = "43200"
  name                 = "aws_jay.aware_test-developer"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--aws_jay-002E-aware_test-viewer" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::397512762488:user/doormatServiceUser"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  inline_policy {
    name   = "AdditionalMetadataAccess"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"backup:Describe*\",\"backup:GetBackupPlan\",\"backup:GetBackupPlanFromJSON\",\"backup:GetBackupPlanFromTemplate\",\"backup:GetBackupSelection\",\"backup:GetBackupVaultAccessPolicy\",\"backup:GetBackupVaultNotifications\",\"backup:GetRecoveryPointRestoreMetadata\",\"backup:GetSupportedResourceTypes\",\"backup:List*\",\"health:Describe*\",\"kafka:Describe*\",\"kafka:Get*\",\"kafka:List*\",\"lambda:GetFunction\",\"logs:FilterLogEvents\",\"pi:Describe*\",\"pi:Get*\",\"pi:List*\",\"rds:List*\",\"ses:Get*\",\"sns:Get*\",\"sqs:Get*\",\"sqs:List*\",\"support:Describe*\",\"support:SearchForCases\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AdditionalMetadataAccess\"}]}"
  }

  inline_policy {
    name   = "SecurityAudit"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"application-autoscaling:Describe*\",\"cloudwatch:Describe*\",\"elasticloadbalancing:Describe*\",\"events:Describe*\",\"events:List*\",\"kms:Describe*\",\"kms:Get*\",\"kms:List*\",\"lambda:GetAccountSettings\",\"lambda:GetFunctionConfiguration\",\"s3:GetAccelerateConfiguration\",\"s3:GetAccountPublicAccessBlock\",\"s3:GetAnalyticsConfiguration\",\"s3:GetEncryptionConfiguration\",\"s3:GetInventoryConfiguration\",\"s3:GetLifecycleConfiguration\",\"s3:GetMetricsConfiguration\",\"s3:GetReplicationConfiguration\",\"tag:GetResources\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SecurityAudit\"}]}"
  }

  inline_policy {
    name   = "ViewOnlyAccess"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"acm:ListCertificates\",\"athena:List*\",\"autoscaling:Describe*\",\"aws-marketplace:ViewSubscriptions\",\"batch:ListJobs\",\"clouddirectory:ListAppliedSchemaArns\",\"clouddirectory:ListDevelopmentSchemaArns\",\"clouddirectory:ListDirectories\",\"clouddirectory:ListPublishedSchemaArns\",\"cloudformation:DescribeStacks\",\"cloudformation:List*\",\"cloudfront:List*\",\"cloudhsm:ListAvailableZones\",\"cloudhsm:ListHapgs\",\"cloudhsm:ListHsms\",\"cloudhsm:ListLunaClients\",\"cloudsearch:DescribeDomains\",\"cloudsearch:List*\",\"cloudtrail:DescribeTrails\",\"cloudtrail:LookupEvents\",\"cloudwatch:Get*\",\"cloudwatch:List*\",\"codebuild:ListBuilds*\",\"codebuild:ListProjects\",\"codecommit:List*\",\"codedeploy:Get*\",\"codedeploy:List*\",\"codepipeline:ListPipelines\",\"codestar:List*\",\"cognito-identity:ListIdentities\",\"cognito-identity:ListIdentityPools\",\"cognito-idp:List*\",\"cognito-sync:ListDatasets\",\"config:Describe*\",\"config:List*\",\"connect:List*\",\"comprehend:Describe*\",\"comprehend:List*\",\"datapipeline:DescribePipelines\",\"datapipeline:GetAccountLimits\",\"datapipeline:ListPipelines\",\"dax:DescribeClusters\",\"dax:DescribeDefaultParameters\",\"dax:DescribeEvents\",\"dax:DescribeParameterGroups\",\"dax:DescribeParameters\",\"dax:DescribeSubnetGroups\",\"dax:ListTags\",\"devicefarm:List*\",\"directconnect:Describe*\",\"discovery:List*\",\"dms:List*\",\"ds:DescribeDirectories\",\"dynamodb:DescribeBackup\",\"dynamodb:DescribeContinuousBackups\",\"dynamodb:DescribeGlobalTable\",\"dynamodb:DescribeGlobalTableSettings\",\"dynamodb:DescribeLimits\",\"dynamodb:DescribeReservedCapacity\",\"dynamodb:DescribeReservedCapacityOfferings\",\"dynamodb:DescribeStream\",\"dynamodb:DescribeTable\",\"dynamodb:DescribeTimeToLive\",\"dynamodb:ListBackups\",\"dynamodb:ListGlobalTables\",\"dynamodb:ListStreams\",\"dynamodb:ListTables\",\"dynamodb:ListTagsOfResource\",\"ec2:DescribeAccountAttributes\",\"ec2:DescribeAddresses\",\"ec2:DescribeAvailabilityZones\",\"ec2:DescribeBundleTasks\",\"ec2:DescribeCarrierGateways\",\"ec2:DescribeClassicLinkInstances\",\"ec2:DescribeConversionTasks\",\"ec2:DescribeCustomerGateways\",\"ec2:DescribeDhcpOptions\",\"ec2:DescribeExportTasks\",\"ec2:DescribeFlowLogs\",\"ec2:DescribeHost*\",\"ec2:DescribeIdFormat\",\"ec2:DescribeIdentityIdFormat\",\"ec2:DescribeImage*\",\"ec2:DescribeImport*\",\"ec2:DescribeInstance*\",\"ec2:DescribeInternetGateways\",\"ec2:DescribeKeyPairs\",\"ec2:DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations\",\"ec2:DescribeLocalGatewayRouteTableVpcAssociations\",\"ec2:DescribeLocalGatewayRouteTables\",\"ec2:DescribeLocalGatewayVirtualInterfaceGroups\",\"ec2:DescribeLocalGatewayVirtualInterfaces\",\"ec2:DescribeLocalGateways\",\"ec2:DescribeMovingAddresses\",\"ec2:DescribeNatGateways\",\"ec2:DescribeNetwork*\",\"ec2:DescribePlacementGroups\",\"ec2:DescribePrefixLists\",\"ec2:DescribeRegions\",\"ec2:DescribeReserved*\",\"ec2:DescribeRouteTables\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeSnapshot*\",\"ec2:DescribeSpot*\",\"ec2:DescribeSubnets\",\"ec2:DescribeTags\",\"ec2:DescribeVolume*\",\"ec2:DescribeVpc*\",\"ec2:DescribeVpnGateways\",\"ec2:SearchLocalGatewayRoutes\",\"ecr:DescribeRepositories\",\"ecr:ListImages\",\"ecs:Describe*\",\"ecs:List*\",\"elastic-inference:DescribeAccelerators\",\"elastic-inference:DescribeAcceleratorTypes\",\"elastic-inference:DescribeAcceleratorOfferings\",\"elastic-inference:ListTagsForResource\",\"elasticache:Describe*\",\"elasticbeanstalk:DescribeApplicationVersions\",\"elasticbeanstalk:DescribeApplications\",\"elasticbeanstalk:DescribeEnvironments\",\"elasticbeanstalk:ListAvailableSolutionStacks\",\"elasticfilesystem:DescribeFileSystems\",\"elasticloadbalancing:DescribeInstanceHealth\",\"elasticloadbalancing:DescribeListeners\",\"elasticloadbalancing:DescribeLoadBalancers\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetHealth\",\"elasticmapreduce:List*\",\"elastictranscoder:List*\",\"es:DescribeElasticsearchDomain\",\"es:DescribeElasticsearchDomains\",\"es:ListDomainNames\",\"firehose:DescribeDeliveryStream\",\"firehose:List*\",\"fsx:DescribeFileSystems\",\"gamelift:List*\",\"glacier:List*\",\"greengrass:List*\",\"iam:GetAccountSummary\",\"iam:GetLoginProfile\",\"iam:List*\",\"importexport:ListJobs\",\"inspector:List*\",\"iot:List*\",\"kinesis:ListStreams\",\"kinesisanalytics:ListApplications\",\"lambda:List*\",\"lex:GetBotAliases\",\"lex:GetBotChannelAssociations\",\"lex:GetBotVersions\",\"lex:GetBots\",\"lex:GetIntentVersions\",\"lex:GetIntents\",\"lex:GetSlotTypeVersions\",\"lex:GetSlotTypes\",\"lex:GetUtterancesView\",\"lightsail:GetBlueprints\",\"lightsail:GetBundles\",\"lightsail:GetInstanceSnapshots\",\"lightsail:GetInstances\",\"lightsail:GetKeyPair\",\"lightsail:GetRegions\",\"lightsail:GetStaticIps\",\"lightsail:IsVpcPeered\",\"logs:Describe*\",\"lookoutvision:ListModelPackagingJobs\",\"lookoutvision:ListModels\",\"lookoutvision:ListProjects\",\"machinelearning:Describe*\",\"mediaconnect:ListEntitlements\",\"mediaconnect:ListFlows\",\"mediaconnect:ListOfferings\",\"mediaconnect:ListReservations\",\"mobilehub:ListAvailableFeatures\",\"mobilehub:ListAvailableRegions\",\"mobilehub:ListProjects\",\"mobiletargeting:GetApplicationSettings\",\"mobiletargeting:GetCampaigns\",\"mobiletargeting:GetImportJobs\",\"mobiletargeting:GetSegments\",\"opsworks-cm:Describe*\",\"opsworks:Describe*\",\"organizations:List*\",\"outposts:GetOutpost\",\"outposts:GetOutpostInstanceTypes\",\"outposts:ListOutposts\",\"outposts:ListSites\",\"outposts:ListTagsForResource\",\"polly:Describe*\",\"polly:List*\",\"rds:Describe*\",\"redshift:DescribeClusters\",\"redshift:DescribeEvents\",\"redshift:ViewQueriesInConsole\",\"route53:Get*\",\"route53:List*\",\"route53domains:List*\",\"route53resolver:Get*\",\"route53resolver:List*\",\"s3:ListAllMyBuckets\",\"s3:ListBucket\",\"sagemaker:Describe*\",\"sagemaker:List*\",\"sdb:List*\",\"servicecatalog:List*\",\"ses:List*\",\"shield:List*\",\"sns:List*\",\"ssm:ListAssociations\",\"ssm:ListDocuments\",\"states:ListActivities\",\"states:ListStateMachines\",\"storagegateway:ListGateways\",\"storagegateway:ListLocalDisks\",\"storagegateway:ListVolumeRecoveryPoints\",\"storagegateway:ListVolumes\",\"swf:List*\",\"trustedadvisor:Describe*\",\"waf-regional:List*\",\"waf:List*\",\"wafv2:List*\",\"workdocs:DescribeAvailableDirectories\",\"workdocs:DescribeInstances\",\"workmail:Describe*\",\"workspaces:Describe*\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ViewOnlyAccess\"}]}"
  }

  max_session_duration = "43200"
  name                 = "aws_jay.aware_test-viewer"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--doormat" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::397512762488:role/doormatLambdaProfile",
          "arn:aws:iam::397512762488:user/doormatServiceUser",
          "arn:aws:iam::397512762488:role/doormatAccountMonitorLambdaProfile"
        ]
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  description = "Role for Doormat backend to use in a target account."

  inline_policy {
    name   = "AccountBootstrapIAMAccountAlias"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreateAccountAlias\",\"iam:ListAccountAlias\",\"iam:DeleteAccountAlias\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }

  inline_policy {
    name   = "AccountBootstrapIAMAssumeRolePolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:UpdateAssumeRolePolicy\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::*:role/honeybee-iam-role\"}]}"
  }

  inline_policy {
    name   = "IAMRead"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:GetRole\",\"iam:ListRoles\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }

  inline_policy {
    name   = "SSMListInstances"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ssm:DescribeInstanceInformation\",\"ec2:DescribeInstances\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }

  max_session_duration = "3600"
  name                 = "doormat"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--doormat-ssm" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::397512762488:user/doormatServiceUser"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  description = "Doormat remote role for SSM actions"

  inline_policy {
    name   = "SSM"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ssm:StartSession\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SSM\"},{\"Action\":[\"ssm:DescribeInstanceInformation\",\"ec2:DescribeInstances\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SSMDescribe\"},{\"Action\":[\"ssm:TerminateSession\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:session/${aws:PrincipalTag/RoleSessionName}-*\",\"Sid\":\"SSMTerminate\"}]}"
  }

  max_session_duration = "3600"
  name                 = "doormat-ssm"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--dynamic-policy-ref-arch-admin" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows EC2 instances to call AWS services on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = "dynamic-policy-ref-arch-admin"
  path                 = "/"
}

resource "aws_iam_role" "tfer--dynamic-policy-saas-s3-access-role-xdgssrli" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringLike": {
          "oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA:aud": "sts.amazonaws.com",
          "oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA:sub": "system:serviceaccount:tenant*:tenant*-sa"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::591976937045:oidc-provider/oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::591976937045:policy/s3-object-access-policy-xdgssrli"]
  max_session_duration = "3600"
  name                 = "dynamic-policy-saas-s3-access-role-xdgssrli"
  path                 = "/"
}

resource "aws_iam_role" "tfer--dynamic-policy-saas-vault-sa-role-mwuwglxk" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringLike": {
          "oidc.eks.us-east-2.amazonaws.com/id/E65F49EDCA5B400545EB7A8DA322AE00:aud": "sts.amazonaws.com",
          "oidc.eks.us-east-2.amazonaws.com/id/E65F49EDCA5B400545EB7A8DA322AE00:sub": "system:serviceaccount:vault:vault-sa"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::591976937045:oidc-provider/oidc.eks.us-east-2.amazonaws.com/id/E65F49EDCA5B400545EB7A8DA322AE00"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  max_session_duration = "3600"
  name                 = "dynamic-policy-saas-vault-sa-role-mwuwglxk"
  path                 = "/"
}

resource "aws_iam_role" "tfer--dynamic-policy-saas-vault-sa-role-xdgssrli" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringLike": {
          "oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA:aud": "sts.amazonaws.com",
          "oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA:sub": "system:serviceaccount:vault:vault-sa"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::591976937045:oidc-provider/oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::591976937045:policy/vault-sa-assumerole-policy-xdgssrli"]
  max_session_duration = "3600"
  name                 = "dynamic-policy-saas-vault-sa-role-xdgssrli"
  path                 = "/"
}

resource "aws_iam_role" "tfer--eksctl-dynamic-policy-saas-addon-aws-ebs-csi-Role1-QWZPKN5SLWZ7" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA:aud": "sts.amazonaws.com"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::591976937045:oidc-provider/oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"]
  max_session_duration = "3600"
  name                 = "eksctl-dynamic-policy-saas-addon-aws-ebs-csi-Role1-QWZPKN5SLWZ7"
  path                 = "/"

  tags = {
    "alpha.eksctl.io/addon-name"                  = "aws-ebs-csi-driver"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    "alpha.eksctl.io/addon-name"                  = "aws-ebs-csi-driver"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }
}

resource "aws_iam_role" "tfer--eksctl-dynamic-policy-saas-addon-iamservicea-Role1-1IN5O2JI2UWXD" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA:aud": "sts.amazonaws.com",
          "oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA:sub": "system:serviceaccount:kube-system:aws-node"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::591976937045:oidc-provider/oidc.eks.us-east-2.amazonaws.com/id/DACD87E28DE16F79B0D7E98FBE3949CA"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]
  max_session_duration = "3600"
  name                 = "eksctl-dynamic-policy-saas-addon-iamservicea-Role1-1IN5O2JI2UWXD"
  path                 = "/"

  tags = {
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "alpha.eksctl.io/iamserviceaccount-name"      = "kube-system/aws-node"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "alpha.eksctl.io/iamserviceaccount-name"      = "kube-system/aws-node"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }
}

resource "aws_iam_role" "tfer--eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "eksctl-dynamic-policy-saas-cluster-PolicyCloudWatchMetrics"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"cloudwatch:PutMetricData\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }

  inline_policy {
    name   = "eksctl-dynamic-policy-saas-cluster-PolicyELBPermissions"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:DescribeAccountAttributes\",\"ec2:DescribeAddresses\",\"ec2:DescribeInternetGateways\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]
  max_session_duration = "3600"
  name                 = "eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0"
  path                 = "/"

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/ServiceRole"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-cluster/ServiceRole"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }
}

resource "aws_iam_role" "tfer--eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  max_session_duration = "3600"
  name                 = "eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET"
  path                 = "/"

  tags = {
    Name                                          = "eksctl-dynamic-policy-saas-nodegroup-nodegroup/NodeInstanceRole"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "alpha.eksctl.io/nodegroup-name"              = "nodegroup"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }

  tags_all = {
    Name                                          = "eksctl-dynamic-policy-saas-nodegroup-nodegroup/NodeInstanceRole"
    "alpha.eksctl.io/cluster-name"                = "dynamic-policy-saas"
    "alpha.eksctl.io/eksctl-version"              = "0.127.0"
    "alpha.eksctl.io/nodegroup-name"              = "nodegroup"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "dynamic-policy-saas"
  }
}

resource "aws_iam_role" "tfer--honeybee-config-recorder" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::397512762488:role/HoneybeeWorkerConfigRecorderLambdaProfile"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  description = "Honeybee Config Recorder "

  inline_policy {
    name   = "ModifyIAM"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreateServiceLinkedRole\",\"config:DescribeConfigurationRecorders\",\"config:DescribeConfigurationRecorderStatus\",\"config:DescribeDeliveryChannels\",\"config:PutConfigurationRecorder\",\"config:PutDeliveryChannel\",\"config:StartConfigurationRecorder\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"Config\"},{\"Action\":[\"iam:PassRole\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::591976937045:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig\",\"Sid\":\"PassRole\"}]}"
  }

  max_session_duration = "3600"
  name                 = "honeybee-config-recorder"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--honeybee-iam-account-alias" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::397512762488:role/HoneybeeWorkerIamAccountAliasLambdaProfile"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  inline_policy {
    name   = "ModifyIAMAccountAlias"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreateAccountAlias\",\"iam:DeleteAccountAlias\",\"iam:ListAccountAliases\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ModifyIAMAccountAlias\"}]}"
  }

  max_session_duration = "3600"
  name                 = "honeybee-iam-account-alias"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--honeybee-iam-policy" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::397512762488:role/HoneybeeWorkerIamPolicyLambdaProfile"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  description = "Honeybee Manage IAM Policy"

  inline_policy {
    name   = "ModifyIAM"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreatePolicy\",\"iam:CreatePolicyVersion\",\"iam:GetAccountAuthorizationDetails\",\"iam:DeletePolicyVersion\",\"iam:ListPolicyTags\",\"iam:TagPolicy\",\"iam:UnTagPolicy\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ModifyIAM\"}]}"
  }

  max_session_duration = "3600"
  name                 = "honeybee-iam-policy"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--honeybee-iam-role" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::397512762488:role/HoneybeeWorkerIamRoleLambdaProfile"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description = "Honeybee Manage IAM Role"

  inline_policy {
    name   = "ModifyIAM"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:*\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ModifyIAM\"}]}"
  }

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = "honeybee-iam-role"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--sec-break-glass" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::397512762488:role/secBreakGlassRole",
          "arn:aws:iam::955375582891:role/otterbotLambdaProfile"
        ]
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  description = "Role for Security Break Glass"

  inline_policy {
    name   = "BreakGlass"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:AttachUserPolicy\",\"iam:ChangePassword\",\"iam:CreateAccessKey\",\"iam:CreateLoginProfile\",\"iam:CreateUser\",\"iam:GetUser\",\"iam:TagUser\",\"iam:DeleteUser\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"BreakGlassIAM\"},{\"Action\":[\"s3:GetObject\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::hc1-swag-infrasec-prod-*\",\"Sid\":\"SWAG\"}]}"
  }

  max_session_duration = "3600"
  name                 = "sec-break-glass"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--security-response" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::866619548692:role/security-response-trust"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description = "target role for security incident response and forensics"

  inline_policy {
    name   = "EC2InstanceCollection"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:CopySnapshot\",\"ec2:CreateSnapshot\",\"ec2:CreateTags\",\"ec2:DeleteSnapshot\",\"ec2:DescribeInstances\",\"ec2:DescribeSnapshots\",\"ec2:DescribeVolumes\",\"ec2:ModifySnapshotAttribute\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"EC2SnapshotAcquisition\"},{\"Action\":[\"kms:CreateGrant\",\"kms:CreateKey\",\"kms:DescribeKey\",\"kms:GenerateDataKeyWithoutPlaintext\",\"kms:GetKeyPolicy\",\"kms:PutKeyPolicy\",\"kms:ScheduleKeyDeletion\",\"kms:TagResource\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"KMSSnapshotEncryption\"}]}"
  }

  inline_policy {
    name   = "EC2InstanceTermination"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:TerminateInstances\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"EC2InstanceTermination\"}]}"
  }

  inline_policy {
    name   = "IAMKeyDeletion"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:DeleteAccessKey\",\"sts:GetAccessKeyInfo\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"IAMKeyDeletion\"}]}"
  }

  inline_policy {
    name   = "IAMRoleDeletion"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:DeleteRole\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"IAMRoleDeletion\"}]}"
  }

  max_session_duration = "3600"
  name                 = "security-response"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--torq-inspect" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::272924243770:role/TorqServiceRole"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  description = "Torq AWS Integration Role for account inspection"

  inline_policy {
    name   = "TorqAdditional"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"access-analyzer:List*\",\"dynamodb:Describe*\",\"dynamodb:List*\",\"ecr:Describe*\",\"ecr:GetLifecyclePolicy\",\"ecr:GetRepositoryPolicy\",\"ecr:List*\",\"elasticache:List*\",\"elasticfilesystem:Describe*\",\"elasticmapreduce:List*\",\"es:List*\",\"kinesis:Describe*\",\"kinesis:List*\",\"s3:GetObjectRetention\",\"s3:GetObjectLegalHold\",\"s3:Get*Configuration\",\"sns:GetTopicAttributes\",\"sns:GetSubscriptionAttributes\",\"sns:ListTopics\",\"sns:ListSubscriptions\",\"sns:ListTagsForResource\",\"sts:GetAccessKeyInfo\",\"waf:List*\",\"waf:Get*\",\"waf-regional:List*\",\"waf-regional:Get*\",\"workspaces:List*\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AdditionalPermissions\"},{\"Action\":[\"apigateway:GET\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:apigateway:*::/*\",\"Sid\":\"AdditionalPermissionsApiGateway\"}]}"
  }

  inline_policy {
    name   = "TorqReadSwag"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:GetObject\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::hc1-swag-infrasec-prod-us-east-1/v2/accounts.json\",\"Sid\":\"SwagEnrich\"}]}"
  }

  inline_policy {
    name   = "TorqSecurityAudit"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"access-analyzer:GetAnalyzedResource\",\"access-analyzer:GetAnalyzer\",\"access-analyzer:GetArchiveRule\",\"access-analyzer:GetFinding\",\"access-analyzer:ListAnalyzedResources\",\"access-analyzer:ListAnalyzers\",\"access-analyzer:ListArchiveRules\",\"access-analyzer:ListFindings\",\"access-analyzer:ListTagsForResource\",\"acm:Describe*\",\"acm:List*\",\"application-autoscaling:Describe*\",\"appmesh:Describe*\",\"appmesh:List*\",\"appsync:List*\",\"athena:GetWorkGroup\",\"athena:List*\",\"autoscaling:Describe*\",\"batch:DescribeComputeEnvironments\",\"batch:DescribeJobDefinitions\",\"chime:List*\",\"cloud9:Describe*\",\"cloud9:ListEnvironments\",\"clouddirectory:ListDirectories\",\"cloudformation:DescribeStack*\",\"cloudformation:GetTemplate\",\"cloudformation:ListStack*\",\"cloudformation:GetStackPolicy\",\"cloudfront:Get*\",\"cloudfront:List*\",\"cloudhsm:ListHapgs\",\"cloudhsm:ListHsms\",\"cloudhsm:ListLunaClients\",\"cloudsearch:DescribeDomains\",\"cloudsearch:DescribeServiceAccessPolicies\",\"cloudtrail:DescribeTrails\",\"cloudtrail:GetEventSelectors\",\"cloudtrail:GetTrailStatus\",\"cloudtrail:ListTags\",\"cloudtrail:LookupEvents\",\"cloudwatch:Describe*\",\"codebuild:ListProjects\",\"codecommit:BatchGetRepositories\",\"codecommit:GetBranch\",\"codecommit:GetObjectIdentifier\",\"codecommit:GetRepository\",\"codecommit:List*\",\"codedeploy:Batch*\",\"codedeploy:Get*\",\"codedeploy:List*\",\"codepipeline:ListPipelines\",\"codestar:Describe*\",\"codestar:List*\",\"cognito-identity:ListIdentityPools\",\"cognito-idp:ListUserPools\",\"cognito-sync:Describe*\",\"cognito-sync:List*\",\"comprehend:Describe*\",\"comprehend:List*\",\"config:BatchGetAggregateResourceConfig\",\"config:BatchGetResourceConfig\",\"config:Deliver*\",\"config:Describe*\",\"config:Get*\",\"config:List*\",\"datapipeline:DescribeObjects\",\"datapipeline:DescribePipelines\",\"datapipeline:EvaluateExpression\",\"datapipeline:GetPipelineDefinition\",\"datapipeline:ListPipelines\",\"datapipeline:QueryObjects\",\"datapipeline:ValidatePipelineDefinition\",\"datasync:Describe*\",\"datasync:List*\",\"dax:Describe*\",\"dax:ListTags\",\"directconnect:Describe*\",\"dms:Describe*\",\"dms:ListTagsForResource\",\"ds:DescribeDirectories\",\"dynamodb:DescribeContinuousBackups\",\"dynamodb:DescribeGlobalTable\",\"dynamodb:DescribeTable\",\"dynamodb:DescribeTimeToLive\",\"dynamodb:ListBackups\",\"dynamodb:ListGlobalTables\",\"dynamodb:ListStreams\",\"dynamodb:ListTables\",\"ec2:Describe*\",\"ecr:DescribeRepositories\",\"ecr:GetRepositoryPolicy\",\"ecs:Describe*\",\"ecs:List*\",\"eks:DescribeCluster\",\"eks:ListClusters\",\"elasticache:Describe*\",\"elasticbeanstalk:Describe*\",\"elasticfilesystem:DescribeFileSystems\",\"elasticfilesystem:DescribeMountTargetSecurityGroups\",\"elasticfilesystem:DescribeMountTargets\",\"elasticloadbalancing:Describe*\",\"elasticmapreduce:Describe*\",\"elasticmapreduce:ListClusters\",\"elasticmapreduce:ListInstances\",\"es:Describe*\",\"es:ListDomainNames\",\"events:Describe*\",\"events:List*\",\"firehose:Describe*\",\"firehose:List*\",\"fms:ListComplianceStatus\",\"fms:ListPolicies\",\"fsx:Describe*\",\"fsx:List*\",\"gamelift:ListBuilds\",\"gamelift:ListFleets\",\"glacier:DescribeVault\",\"glacier:GetVaultAccessPolicy\",\"glacier:ListVaults\",\"globalaccelerator:Describe*\",\"globalaccelerator:List*\",\"greengrass:List*\",\"guardduty:Get*\",\"guardduty:List*\",\"iam:GenerateCredentialReport\",\"iam:GenerateServiceLastAccessedDetails\",\"iam:Get*\",\"iam:List*\",\"iam:SimulateCustomPolicy\",\"iam:SimulatePrincipalPolicy\",\"inspector:Describe*\",\"inspector:Get*\",\"inspector:List*\",\"inspector:Preview*\",\"iot:Describe*\",\"iot:GetPolicy\",\"iot:GetPolicyVersion\",\"iot:List*\",\"kinesis:DescribeStream\",\"kinesis:ListStreams\",\"kinesis:ListTagsForStream\",\"kinesisanalytics:ListApplications\",\"kms:Describe*\",\"kms:Get*\",\"kms:List*\",\"lambda:GetAccountSettings\",\"lambda:GetFunctionConfiguration\",\"lambda:GetLayerVersionPolicy\",\"lambda:GetPolicy\",\"lambda:List*\",\"license-manager:List*\",\"lightsail:GetInstances\",\"lightsail:GetLoadBalancers\",\"logs:Describe*\",\"logs:ListTagsLogGroup\",\"machinelearning:DescribeMLModels\",\"mediaconnect:Describe*\",\"mediaconnect:List*\",\"mediastore:GetContainerPolicy\",\"mediastore:ListContainers\",\"opsworks:DescribeStacks\",\"opsworks-cm:DescribeServers\",\"organizations:List*\",\"organizations:Describe*\",\"quicksight:Describe*\",\"quicksight:List*\",\"ram:List*\",\"rds:Describe*\",\"rds:DownloadDBLogFilePortion\",\"rds:ListTagsForResource\",\"redshift:Describe*\",\"rekognition:Describe*\",\"rekognition:List*\",\"robomaker:Describe*\",\"robomaker:List*\",\"route53:Get*\",\"route53:List*\",\"route53domains:GetDomainDetail\",\"route53domains:GetOperationDetail\",\"route53domains:ListDomains\",\"route53domains:ListOperations\",\"route53domains:ListTagsForDomain\",\"route53resolver:List*\",\"route53resolver:Get*\",\"s3:GetAccelerateConfiguration\",\"s3:GetAccessPoint\",\"s3:GetAccessPointPolicy\",\"s3:GetAccessPointPolicyStatus\",\"s3:GetAccountPublicAccessBlock\",\"s3:GetAnalyticsConfiguration\",\"s3:GetBucket*\",\"s3:GetEncryptionConfiguration\",\"s3:GetInventoryConfiguration\",\"s3:GetLifecycleConfiguration\",\"s3:GetMetricsConfiguration\",\"s3:GetObjectAcl\",\"s3:GetObjectVersionAcl\",\"s3:GetReplicationConfiguration\",\"s3:ListAccessPoints\",\"s3:ListBucket\",\"sagemaker:Describe*\",\"sagemaker:List*\",\"sdb:DomainMetadata\",\"sdb:ListDomains\",\"secretsmanager:GetResourcePolicy\",\"secretsmanager:ListSecrets\",\"secretsmanager:ListSecretVersionIds\",\"securityhub:Describe*\",\"securityhub:Get*\",\"securityhub:List*\",\"serverlessrepo:GetApplicationPolicy\",\"serverlessrepo:List*\",\"ses:GetIdentityDkimAttributes\",\"ses:GetIdentityPolicies\",\"ses:GetIdentityVerificationAttributes\",\"ses:ListIdentities\",\"ses:ListIdentityPolicies\",\"ses:ListVerifiedEmailAddresses\",\"shield:Describe*\",\"shield:List*\",\"snowball:ListClusters\",\"snowball:ListJobs\",\"sns:GetTopicAttributes\",\"sns:ListSubscriptionsByTopic\",\"sns:ListTopics\",\"sqs:GetQueueAttributes\",\"sqs:ListDeadLetterSourceQueues\",\"sqs:ListQueues\",\"sqs:ListQueueTags\",\"ssm:Describe*\",\"ssm:GetAutomationExecution\",\"ssm:ListDocuments\",\"sso:DescribePermissionsPolicies\",\"sso:List*\",\"states:ListStateMachines\",\"storagegateway:DescribeBandwidthRateLimit\",\"storagegateway:DescribeCache\",\"storagegateway:DescribeCachediSCSIVolumes\",\"storagegateway:DescribeGatewayInformation\",\"storagegateway:DescribeMaintenanceStartTime\",\"storagegateway:DescribeNFSFileShares\",\"storagegateway:DescribeSnapshotSchedule\",\"storagegateway:DescribeStorediSCSIVolumes\",\"storagegateway:DescribeTapeArchives\",\"storagegateway:DescribeTapeRecoveryPoints\",\"storagegateway:DescribeTapes\",\"storagegateway:DescribeUploadBuffer\",\"storagegateway:DescribeVTLDevices\",\"storagegateway:DescribeWorkingStorage\",\"storagegateway:List*\",\"tag:GetResources\",\"tag:GetTagKeys\",\"transfer:Describe*\",\"transfer:List*\",\"translate:List*\",\"trustedadvisor:Describe*\",\"waf:ListWebACLs\",\"waf-regional:ListWebACLs\",\"workspaces:Describe*\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SecurityAudit\"},{\"Action\":[\"apigateway:GET\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:apigateway:*::/apis\",\"arn:aws:apigateway:*::/apis/*/stages\",\"arn:aws:apigateway:*::/apis/*/stages/*\",\"arn:aws:apigateway:*::/apis/*/routes\",\"arn:aws:apigateway:*::/restapis\",\"arn:aws:apigateway:*::/restapis/*/authorizers\",\"arn:aws:apigateway:*::/restapis/*/authorizers/*\",\"arn:aws:apigateway:*::/restapis/*/documentation/versions\",\"arn:aws:apigateway:*::/restapis/*/resources\",\"arn:aws:apigateway:*::/restapis/*/resources/*\",\"arn:aws:apigateway:*::/restapis/*/resources/*/methods/*\",\"arn:aws:apigateway:*::/restapis/*/stages\",\"arn:aws:apigateway:*::/restapis/*/stages/*\",\"arn:aws:apigateway:*::/vpclinks\"],\"Sid\":\"SecurityAuditApiGateway\"}]}"
  }

  max_session_duration = "3600"
  name                 = "torq-inspect"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--vault-assumed-role-credentials-demo" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession",
        "sts:SetSourceIdentity"
      ],
      "Condition": {
        "StringLike": {
          "aws:PrincipalAccount": "591976937045"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description = "Role to be assumed by Vault mount when demoing assumed_role credential type in Vault"

  inline_policy {
    name   = "DescribeRegions"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:DescribeRegions\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }

  max_session_duration = "3600"
  name                 = "vault-assumed-role-credentials-demo"
  path                 = "/"

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
    hc-repo           = "github.com/hashicorp/honeybee-templates"
  }
}

resource "aws_iam_role" "tfer--vault-role-xdgssrli" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::591976937045:role/dynamic-policy-saas-vault-sa-role-xdgssrli"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::591976937045:policy/dynamodb-policy-xdgssrli"]
  max_session_duration = "3600"
  name                 = "vault-role-xdgssrli"
  path                 = "/"
}
