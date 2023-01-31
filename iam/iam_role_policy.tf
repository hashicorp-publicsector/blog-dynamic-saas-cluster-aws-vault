resource "aws_iam_role_policy" "tfer--JupiterOneServiceRole_JupiterOneAdditional" {
  name = "JupiterOneAdditional"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "access-analyzer:List*",
        "batch:Describe*",
        "batch:List*",
        "cloudhsm:DescribeBackups",
        "cloudhsm:DescribeClusters",
        "cloudhsm:ListTags",
        "cloudwatch:GetMetricData",
        "dynamodb:Describe*",
        "dynamodb:List*",
        "ecr:Describe*",
        "ecr:GetLifecyclePolicy",
        "ecr:GetRepositoryPolicy",
        "ecr:List*",
        "elasticache:List*",
        "elasticfilesystem:Describe*",
        "elasticmapreduce:List*",
        "es:List*",
        "kinesis:Describe*",
        "kinesis:List*",
        "lambda:GetFunction*",
        "macie:ListFindings",
        "monitoring:ListTagsForResource",
        "organizations:ListAccounts",
        "shield:GetSubscriptionState",
        "s3:GetObjectRetention",
        "s3:GetObjectLegalHold",
        "s3:Get*Configuration",
        "sns:GetTopicAttributes",
        "sns:GetSubscriptionAttributes",
        "sns:ListTopics",
        "sns:ListSubscriptions",
        "sns:ListTagsForResource",
        "waf:List*",
        "waf:Get*",
        "waf-regional:List*",
        "waf-regional:Get*",
        "wafv2:List*",
        "wafv2:Get*",
        "wafv2:CheckCapacity",
        "wafv2:DescribeManagedRuleGroup",
        "workspaces:List*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "AdditionalPermissions"
    },
    {
      "Action": [
        "apigateway:GET"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:apigateway:*::/*",
      "Sid": "AdditionalPermissionsApiGateway"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "JupiterOneServiceRole"
}

resource "aws_iam_role_policy" "tfer--JupiterOneServiceRole_SecurityAudit" {
  name = "SecurityAudit"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "access-analyzer:GetAnalyzedResource",
        "access-analyzer:GetAnalyzer",
        "access-analyzer:GetArchiveRule",
        "access-analyzer:GetFinding",
        "access-analyzer:ListAnalyzedResources",
        "access-analyzer:ListAnalyzers",
        "access-analyzer:ListArchiveRules",
        "access-analyzer:ListFindings",
        "access-analyzer:ListTagsForResource",
        "acm:Describe*",
        "acm:List*",
        "application-autoscaling:Describe*",
        "appmesh:Describe*",
        "appmesh:List*",
        "appsync:List*",
        "athena:GetWorkGroup",
        "athena:List*",
        "autoscaling:Describe*",
        "batch:DescribeComputeEnvironments",
        "batch:DescribeJobDefinitions",
        "chime:List*",
        "cloud9:Describe*",
        "cloud9:ListEnvironments",
        "clouddirectory:ListDirectories",
        "cloudformation:DescribeStack*",
        "cloudformation:GetTemplate",
        "cloudformation:ListStack*",
        "cloudformation:GetStackPolicy",
        "cloudfront:Get*",
        "cloudfront:List*",
        "cloudhsm:ListHapgs",
        "cloudhsm:ListHsms",
        "cloudhsm:ListLunaClients",
        "cloudsearch:DescribeDomains",
        "cloudsearch:DescribeServiceAccessPolicies",
        "cloudtrail:DescribeTrails",
        "cloudtrail:GetEventSelectors",
        "cloudtrail:GetTrailStatus",
        "cloudtrail:ListTags",
        "cloudtrail:LookupEvents",
        "cloudwatch:Describe*",
        "codebuild:ListProjects",
        "codecommit:BatchGetRepositories",
        "codecommit:GetBranch",
        "codecommit:GetObjectIdentifier",
        "codecommit:GetRepository",
        "codecommit:List*",
        "codedeploy:Batch*",
        "codedeploy:Get*",
        "codedeploy:List*",
        "codepipeline:ListPipelines",
        "codestar:Describe*",
        "codestar:List*",
        "cognito-identity:ListIdentityPools",
        "cognito-idp:ListUserPools",
        "cognito-sync:Describe*",
        "cognito-sync:List*",
        "comprehend:Describe*",
        "comprehend:List*",
        "config:BatchGetAggregateResourceConfig",
        "config:BatchGetResourceConfig",
        "config:Deliver*",
        "config:Describe*",
        "config:Get*",
        "config:List*",
        "datapipeline:DescribeObjects",
        "datapipeline:DescribePipelines",
        "datapipeline:EvaluateExpression",
        "datapipeline:GetPipelineDefinition",
        "datapipeline:ListPipelines",
        "datapipeline:QueryObjects",
        "datapipeline:ValidatePipelineDefinition",
        "datasync:Describe*",
        "datasync:List*",
        "dax:Describe*",
        "dax:ListTags",
        "directconnect:Describe*",
        "dms:Describe*",
        "dms:ListTagsForResource",
        "ds:DescribeDirectories",
        "dynamodb:DescribeContinuousBackups",
        "dynamodb:DescribeGlobalTable",
        "dynamodb:DescribeTable",
        "dynamodb:DescribeTimeToLive",
        "dynamodb:ListBackups",
        "dynamodb:ListGlobalTables",
        "dynamodb:ListStreams",
        "dynamodb:ListTables",
        "ec2:Describe*",
        "ecr:DescribeRepositories",
        "ecr:GetRepositoryPolicy",
        "ecs:Describe*",
        "ecs:List*",
        "eks:DescribeCluster",
        "eks:DescribeNodeGroup",
        "eks:ListClusters",
        "eks:ListNodeGroups",
        "elasticache:Describe*",
        "elasticbeanstalk:Describe*",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeMountTargetSecurityGroups",
        "elasticfilesystem:DescribeMountTargets",
        "elasticloadbalancing:Describe*",
        "elasticmapreduce:Describe*",
        "elasticmapreduce:ListClusters",
        "elasticmapreduce:ListInstances",
        "es:Describe*",
        "es:ListDomainNames",
        "events:Describe*",
        "events:List*",
        "firehose:Describe*",
        "firehose:List*",
        "fms:ListComplianceStatus",
        "fms:ListPolicies",
        "fsx:Describe*",
        "fsx:List*",
        "gamelift:ListBuilds",
        "gamelift:ListFleets",
        "glacier:DescribeVault",
        "glacier:GetVaultAccessPolicy",
        "glacier:ListVaults",
        "globalaccelerator:Describe*",
        "globalaccelerator:List*",
        "greengrass:List*",
        "guardduty:Get*",
        "guardduty:List*",
        "iam:GenerateCredentialReport",
        "iam:GenerateServiceLastAccessedDetails",
        "iam:Get*",
        "iam:List*",
        "iam:SimulateCustomPolicy",
        "iam:SimulatePrincipalPolicy",
        "inspector:Describe*",
        "inspector:Get*",
        "inspector:List*",
        "inspector:Preview*",
        "iot:Describe*",
        "iot:GetPolicy",
        "iot:GetPolicyVersion",
        "iot:List*",
        "kinesis:DescribeStream",
        "kinesis:ListStreams",
        "kinesis:ListTagsForStream",
        "kinesisanalytics:ListApplications",
        "kms:Describe*",
        "kms:Get*",
        "kms:List*",
        "lambda:GetAccountSettings",
        "lambda:GetFunctionConfiguration",
        "lambda:GetLayerVersionPolicy",
        "lambda:GetPolicy",
        "lambda:List*",
        "license-manager:List*",
        "lightsail:GetInstances",
        "lightsail:GetLoadBalancers",
        "logs:Describe*",
        "logs:ListTagsLogGroup",
        "machinelearning:DescribeMLModels",
        "mediaconnect:Describe*",
        "mediaconnect:List*",
        "mediastore:GetContainerPolicy",
        "mediastore:ListContainers",
        "opsworks:DescribeStacks",
        "opsworks-cm:DescribeServers",
        "organizations:List*",
        "organizations:Describe*",
        "quicksight:Describe*",
        "quicksight:List*",
        "ram:List*",
        "rds:Describe*",
        "rds:DownloadDBLogFilePortion",
        "rds:ListTagsForResource",
        "redshift:Describe*",
        "rekognition:Describe*",
        "rekognition:List*",
        "robomaker:Describe*",
        "robomaker:List*",
        "route53:Get*",
        "route53:List*",
        "route53domains:GetDomainDetail",
        "route53domains:GetOperationDetail",
        "route53domains:ListDomains",
        "route53domains:ListOperations",
        "route53domains:ListTagsForDomain",
        "route53resolver:List*",
        "route53resolver:Get*",
        "s3:GetAccelerateConfiguration",
        "s3:GetAccessPoint",
        "s3:GetAccessPointPolicy",
        "s3:GetAccessPointPolicyStatus",
        "s3:GetAccountPublicAccessBlock",
        "s3:GetAnalyticsConfiguration",
        "s3:GetBucket*",
        "s3:GetEncryptionConfiguration",
        "s3:GetInventoryConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:GetMetricsConfiguration",
        "s3:GetObjectAcl",
        "s3:GetObjectVersionAcl",
        "s3:GetReplicationConfiguration",
        "s3:ListAccessPoints",
        "s3:ListAllMyBuckets",
        "sagemaker:Describe*",
        "sagemaker:List*",
        "sdb:DomainMetadata",
        "sdb:ListDomains",
        "secretsmanager:GetResourcePolicy",
        "secretsmanager:ListSecrets",
        "secretsmanager:ListSecretVersionIds",
        "securityhub:Describe*",
        "securityhub:Get*",
        "securityhub:List*",
        "serverlessrepo:GetApplicationPolicy",
        "serverlessrepo:List*",
        "ses:GetIdentityDkimAttributes",
        "ses:GetIdentityPolicies",
        "ses:GetIdentityVerificationAttributes",
        "ses:ListIdentities",
        "ses:ListIdentityPolicies",
        "ses:ListVerifiedEmailAddresses",
        "shield:Describe*",
        "shield:List*",
        "snowball:ListClusters",
        "snowball:ListJobs",
        "sns:GetTopicAttributes",
        "sns:ListSubscriptionsByTopic",
        "sns:ListTopics",
        "sqs:GetQueueAttributes",
        "sqs:ListDeadLetterSourceQueues",
        "sqs:ListQueues",
        "sqs:ListQueueTags",
        "ssm:Describe*",
        "ssm:GetAutomationExecution",
        "ssm:ListDocuments",
        "sso:DescribePermissionsPolicies",
        "sso:List*",
        "states:ListStateMachines",
        "storagegateway:DescribeBandwidthRateLimit",
        "storagegateway:DescribeCache",
        "storagegateway:DescribeCachediSCSIVolumes",
        "storagegateway:DescribeGatewayInformation",
        "storagegateway:DescribeMaintenanceStartTime",
        "storagegateway:DescribeNFSFileShares",
        "storagegateway:DescribeSnapshotSchedule",
        "storagegateway:DescribeStorediSCSIVolumes",
        "storagegateway:DescribeTapeArchives",
        "storagegateway:DescribeTapeRecoveryPoints",
        "storagegateway:DescribeTapes",
        "storagegateway:DescribeUploadBuffer",
        "storagegateway:DescribeVTLDevices",
        "storagegateway:DescribeWorkingStorage",
        "storagegateway:List*",
        "tag:GetResources",
        "tag:GetTagKeys",
        "transfer:Describe*",
        "transfer:List*",
        "translate:List*",
        "trustedadvisor:Describe*",
        "waf-regional:Get*",
        "waf-regional:List*",
        "waf:Get*",
        "waf:List*",
        "wafv2:Get*",
        "wafv2:List*",
        "workdocs:Describe*",
        "workspaces:Describe*",
        "xray:Get*",
        "xray:List*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "SecurityAudit"
    },
    {
      "Action": [
        "apigateway:GET"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:apigateway:*::/apis",
        "arn:aws:apigateway:*::/apis/*/stages",
        "arn:aws:apigateway:*::/apis/*/stages/*",
        "arn:aws:apigateway:*::/apis/*/routes",
        "arn:aws:apigateway:*::/restapis",
        "arn:aws:apigateway:*::/restapis/*/authorizers",
        "arn:aws:apigateway:*::/restapis/*/authorizers/*",
        "arn:aws:apigateway:*::/restapis/*/documentation/versions",
        "arn:aws:apigateway:*::/restapis/*/resources",
        "arn:aws:apigateway:*::/restapis/*/resources/*",
        "arn:aws:apigateway:*::/restapis/*/resources/*/methods/*",
        "arn:aws:apigateway:*::/restapis/*/stages",
        "arn:aws:apigateway:*::/restapis/*/stages/*",
        "arn:aws:apigateway:*::/vpclinks"
      ],
      "Sid": "SecurityAuditApiGateway"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "JupiterOneServiceRole"
}

resource "aws_iam_role_policy" "tfer--PermisoServiceRole_PermisoIdentityReadOnly" {
  name = "PermisoIdentityReadOnly"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "cloudtrail:LookupEvents",
        "config:ListDiscoveredResources",
        "ec2:DescribeInstances",
        "guardduty:GetFindings",
        "guardduty:ListDetectors",
        "guardduty:ListFindings",
        "iam:GenerateCredentialReport",
        "iam:GenerateServiceLastAccessedDetails",
        "iam:GetAccessKeyLastUsed",
        "iam:GetAccountAuthorizationDetails",
        "iam:GetCredentialReport",
        "iam:GetPolicy",
        "iam:GetPolicyVersion",
        "iam:GetSAMLProvider",
        "iam:GetServiceLastAccessedDetails",
        "iam:ListAccessKeys",
        "iam:ListGroups",
        "iam:ListInstanceProfiles",
        "iam:ListPolicies",
        "iam:ListRoles",
        "iam:ListUsers",
        "iam:ListSAMLProviders",
        "iam:ListAccountAliases",
        "identitystore:DescribeGroup",
        "identitystore:DescribeUser",
        "lambda:ListFunctions",
        "lambda:GetFunction",
        "organizations:DescribeAccount",
        "organizations:DescribeEffectivePolicy",
        "organizations:DescribeOrganization",
        "organizations:DescribeOrganizationalUnit",
        "organizations:DescribePolicy",
        "organizations:ListAccounts",
        "organizations:ListAccountsForParent",
        "organizations:ListChildren",
        "organizations:ListOrganizationalUnitsForParent",
        "organizations:ListParents",
        "organizations:ListPolicies",
        "organizations:ListPoliciesForTarget",
        "organizations:ListRoots",
        "organizations:ListTagsForResource",
        "organizations:ListTargetsForPolicy",
        "sso:DescribePermissionSet",
        "sso:GetInlinePolicyForPermissionSet",
        "sso:ListAccountAssignments",
        "sso:ListAccountsForProvisionedPermissionSet",
        "sso:ListInstances",
        "sso:ListManagedPoliciesInPermissionSet",
        "sso:ListPermissionSets",
        "s3:GetBucketPolicyStatus",
        "s3:GetEncryptionConfiguration",
        "s3:ListAllMyBuckets",
        "s3:GetBucketVersioning",
        "s3:GetBucketAcl",
        "s3:GetBucketPolicy",
        "s3:GetBucketPublicAccessBlock",
        "s3:GetAccountPublicAccessBlock"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "PermisoIdentityReadOnly"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "PermisoServiceRole"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-admin_AdministratorAccess" {
  name = "AdministratorAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "AdministratorAccess"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-admin"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-developer_AllowEKSOIDCProvider" {
  name = "AllowEKSOIDCProvider"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:AddClientIDToOpenIDConnectProvider",
        "iam:CreateOpenIDConnectProvider",
        "iam:DeleteOpenIDConnectProvider",
        "iam:RemoveClientIDFromOpenIDConnectProvider",
        "iam:TagOpenIDConnectProvider",
        "iam:UntagOpenIDConnectProvider",
        "iam:UpdateOpenIDConnectProviderThumbprint"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:iam::591976937045:oidc-provider/oidc.eks.*.amazonaws.com",
        "arn:aws:iam::591976937045:oidc-provider/oidc.eks.*.amazonaws.com/*"
      ],
      "Sid": "EKSOIDCProvider"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-developer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-developer_AllowMutateIAM" {
  name = "AllowMutateIAM"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:AttachRolePolicy",
        "iam:CreateRole",
        "iam:DeleteRole",
        "iam:DeleteRolePolicy",
        "iam:DetachRolePolicy",
        "iam:PutRolePolicy",
        "iam:UpdateAssumeRolePolicy",
        "iam:UpdateRole",
        "iam:UpdateRoleDescription",
        "iam:PassRole",
        "iam:TagRole",
        "iam:UntagRole",
        "iam:AddRoleToInstanceProfile",
        "iam:CreateInstanceProfile",
        "iam:DeleteInstanceProfile",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:TagInstanceProfile",
        "iam:UntagInstanceProfile",
        "iam:CreateAccessKey",
        "iam:DeleteAccessKey",
        "iam:UpdateAccessKey",
        "iam:CreateVirtualMFADevice",
        "iam:EnableMFADevice",
        "iam:DeactivateMFADevice",
        "iam:DeleteVirtualMFADevice",
        "iam:ResyncMFADevice",
        "iam:DeleteUserPolicy",
        "iam:PutUserPolicy",
        "iam:GenerateOrganizationsAccessReport",
        "iam:CreateServiceLinkedRole",
        "iam:DeleteServiceLinkedRole",
        "iam:UpdateServerCertificate",
        "iam:UploadServerCertificate",
        "iam:DeleteServerCertificate",
        "rolesanywhere:Delete*",
        "rolesanywhere:Disable*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "AllowIAM"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-developer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-developer_AllowMutateIAMPoliciesAndPassword" {
  name = "AllowMutateIAMPoliciesAndPassword"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:ChangePassword",
        "iam:DeleteLoginProfile",
        "iam:CreatePolicy",
        "iam:CreatePolicyVersion",
        "iam:DeletePolicy",
        "iam:DeletePolicyVersion",
        "iam:TagPolicy",
        "iam:UntagPolicy"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "PoliciesAndPassword"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-developer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-developer_AllowTFCOIDCProvider" {
  name = "AllowTFCOIDCProvider"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:AddClientIDToOpenIDConnectProvider",
        "iam:CreateOpenIDConnectProvider",
        "iam:DeleteOpenIDConnectProvider",
        "iam:GetOpenIDConnectProvider",
        "iam:ListOpenIDConnectProviderTags",
        "iam:RemoveClientIDFromOpenIDConnectProvider",
        "iam:TagOpenIDConnectProvider",
        "iam:UntagOpenIDConnectProvider",
        "iam:UpdateOpenIDConnectProviderThumbprint"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:iam::591976937045:oidc-provider/app.terraform.io",
        "arn:aws:iam::591976937045:oidc-provider/app.terraform.io/*"
      ],
      "Sid": "TFCOIDCProvider"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-developer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-developer_DemoUserCreate" {
  name = "DemoUserCreate"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:CreateUser"
      ],
      "Condition": {
        "StringEquals": {
          "iam:PermissionsBoundary": "arn:aws:iam::591976937045:policy/DemoUser"
        }
      },
      "Effect": "Allow",
      "Resource": "arn:aws:iam::591976937045:user/demo-$${aws:SourceIdentity}*",
      "Sid": "DemoUserCreate"
    },
    {
      "Action": [
        "iam:DeleteUser"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::591976937045:user/demo-$${aws:SourceIdentity}*",
      "Sid": "DemoUserDelete"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-developer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-developer_IAMAndOrgReadOnlyAccess" {
  name = "IAMAndOrgReadOnlyAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "rolesanywhere:Get*",
        "rolesanywhere:List*",
        "organizations:Describe*",
        "organizations:List*",
        "iam:Generate*",
        "iam:Get*",
        "iam:List*",
        "iam:Simulate*",
        "account:ListRegions"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "ReadOnly"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-developer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-developer_PowerUserAccess" {
  name = "PowerUserAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Effect": "Allow",
      "NotAction": [
        "account:*",
        "iam:*",
        "organizations:*",
        "rolesanywhere:*"
      ],
      "Resource": "*",
      "Sid": "PowerUserAccess"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-developer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-viewer_AdditionalMetadataAccess" {
  name = "AdditionalMetadataAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "backup:Describe*",
        "backup:GetBackupPlan",
        "backup:GetBackupPlanFromJSON",
        "backup:GetBackupPlanFromTemplate",
        "backup:GetBackupSelection",
        "backup:GetBackupVaultAccessPolicy",
        "backup:GetBackupVaultNotifications",
        "backup:GetRecoveryPointRestoreMetadata",
        "backup:GetSupportedResourceTypes",
        "backup:List*",
        "health:Describe*",
        "kafka:Describe*",
        "kafka:Get*",
        "kafka:List*",
        "lambda:GetFunction",
        "logs:FilterLogEvents",
        "pi:Describe*",
        "pi:Get*",
        "pi:List*",
        "rds:List*",
        "ses:Get*",
        "sns:Get*",
        "sqs:Get*",
        "sqs:List*",
        "support:Describe*",
        "support:SearchForCases"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "AdditionalMetadataAccess"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-viewer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-viewer_SecurityAudit" {
  name = "SecurityAudit"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "application-autoscaling:Describe*",
        "cloudwatch:Describe*",
        "elasticloadbalancing:Describe*",
        "events:Describe*",
        "events:List*",
        "kms:Describe*",
        "kms:Get*",
        "kms:List*",
        "lambda:GetAccountSettings",
        "lambda:GetFunctionConfiguration",
        "s3:GetAccelerateConfiguration",
        "s3:GetAccountPublicAccessBlock",
        "s3:GetAnalyticsConfiguration",
        "s3:GetEncryptionConfiguration",
        "s3:GetInventoryConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:GetMetricsConfiguration",
        "s3:GetReplicationConfiguration",
        "tag:GetResources"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "SecurityAudit"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-viewer"
}

resource "aws_iam_role_policy" "tfer--aws_jay-002E-aware_test-viewer_ViewOnlyAccess" {
  name = "ViewOnlyAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "acm:ListCertificates",
        "athena:List*",
        "autoscaling:Describe*",
        "aws-marketplace:ViewSubscriptions",
        "batch:ListJobs",
        "clouddirectory:ListAppliedSchemaArns",
        "clouddirectory:ListDevelopmentSchemaArns",
        "clouddirectory:ListDirectories",
        "clouddirectory:ListPublishedSchemaArns",
        "cloudformation:DescribeStacks",
        "cloudformation:List*",
        "cloudfront:List*",
        "cloudhsm:ListAvailableZones",
        "cloudhsm:ListHapgs",
        "cloudhsm:ListHsms",
        "cloudhsm:ListLunaClients",
        "cloudsearch:DescribeDomains",
        "cloudsearch:List*",
        "cloudtrail:DescribeTrails",
        "cloudtrail:LookupEvents",
        "cloudwatch:Get*",
        "cloudwatch:List*",
        "codebuild:ListBuilds*",
        "codebuild:ListProjects",
        "codecommit:List*",
        "codedeploy:Get*",
        "codedeploy:List*",
        "codepipeline:ListPipelines",
        "codestar:List*",
        "cognito-identity:ListIdentities",
        "cognito-identity:ListIdentityPools",
        "cognito-idp:List*",
        "cognito-sync:ListDatasets",
        "config:Describe*",
        "config:List*",
        "connect:List*",
        "comprehend:Describe*",
        "comprehend:List*",
        "datapipeline:DescribePipelines",
        "datapipeline:GetAccountLimits",
        "datapipeline:ListPipelines",
        "dax:DescribeClusters",
        "dax:DescribeDefaultParameters",
        "dax:DescribeEvents",
        "dax:DescribeParameterGroups",
        "dax:DescribeParameters",
        "dax:DescribeSubnetGroups",
        "dax:ListTags",
        "devicefarm:List*",
        "directconnect:Describe*",
        "discovery:List*",
        "dms:List*",
        "ds:DescribeDirectories",
        "dynamodb:DescribeBackup",
        "dynamodb:DescribeContinuousBackups",
        "dynamodb:DescribeGlobalTable",
        "dynamodb:DescribeGlobalTableSettings",
        "dynamodb:DescribeLimits",
        "dynamodb:DescribeReservedCapacity",
        "dynamodb:DescribeReservedCapacityOfferings",
        "dynamodb:DescribeStream",
        "dynamodb:DescribeTable",
        "dynamodb:DescribeTimeToLive",
        "dynamodb:ListBackups",
        "dynamodb:ListGlobalTables",
        "dynamodb:ListStreams",
        "dynamodb:ListTables",
        "dynamodb:ListTagsOfResource",
        "ec2:DescribeAccountAttributes",
        "ec2:DescribeAddresses",
        "ec2:DescribeAvailabilityZones",
        "ec2:DescribeBundleTasks",
        "ec2:DescribeCarrierGateways",
        "ec2:DescribeClassicLinkInstances",
        "ec2:DescribeConversionTasks",
        "ec2:DescribeCustomerGateways",
        "ec2:DescribeDhcpOptions",
        "ec2:DescribeExportTasks",
        "ec2:DescribeFlowLogs",
        "ec2:DescribeHost*",
        "ec2:DescribeIdFormat",
        "ec2:DescribeIdentityIdFormat",
        "ec2:DescribeImage*",
        "ec2:DescribeImport*",
        "ec2:DescribeInstance*",
        "ec2:DescribeInternetGateways",
        "ec2:DescribeKeyPairs",
        "ec2:DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations",
        "ec2:DescribeLocalGatewayRouteTableVpcAssociations",
        "ec2:DescribeLocalGatewayRouteTables",
        "ec2:DescribeLocalGatewayVirtualInterfaceGroups",
        "ec2:DescribeLocalGatewayVirtualInterfaces",
        "ec2:DescribeLocalGateways",
        "ec2:DescribeMovingAddresses",
        "ec2:DescribeNatGateways",
        "ec2:DescribeNetwork*",
        "ec2:DescribePlacementGroups",
        "ec2:DescribePrefixLists",
        "ec2:DescribeRegions",
        "ec2:DescribeReserved*",
        "ec2:DescribeRouteTables",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSnapshot*",
        "ec2:DescribeSpot*",
        "ec2:DescribeSubnets",
        "ec2:DescribeTags",
        "ec2:DescribeVolume*",
        "ec2:DescribeVpc*",
        "ec2:DescribeVpnGateways",
        "ec2:SearchLocalGatewayRoutes",
        "ecr:DescribeRepositories",
        "ecr:ListImages",
        "ecs:Describe*",
        "ecs:List*",
        "elastic-inference:DescribeAccelerators",
        "elastic-inference:DescribeAcceleratorTypes",
        "elastic-inference:DescribeAcceleratorOfferings",
        "elastic-inference:ListTagsForResource",
        "elasticache:Describe*",
        "elasticbeanstalk:DescribeApplicationVersions",
        "elasticbeanstalk:DescribeApplications",
        "elasticbeanstalk:DescribeEnvironments",
        "elasticbeanstalk:ListAvailableSolutionStacks",
        "elasticfilesystem:DescribeFileSystems",
        "elasticloadbalancing:DescribeInstanceHealth",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:DescribeLoadBalancers",
        "elasticloadbalancing:DescribeTargetGroups",
        "elasticloadbalancing:DescribeTargetHealth",
        "elasticmapreduce:List*",
        "elastictranscoder:List*",
        "es:DescribeElasticsearchDomain",
        "es:DescribeElasticsearchDomains",
        "es:ListDomainNames",
        "firehose:DescribeDeliveryStream",
        "firehose:List*",
        "fsx:DescribeFileSystems",
        "gamelift:List*",
        "glacier:List*",
        "greengrass:List*",
        "iam:GetAccountSummary",
        "iam:GetLoginProfile",
        "iam:List*",
        "importexport:ListJobs",
        "inspector:List*",
        "iot:List*",
        "kinesis:ListStreams",
        "kinesisanalytics:ListApplications",
        "lambda:List*",
        "lex:GetBotAliases",
        "lex:GetBotChannelAssociations",
        "lex:GetBotVersions",
        "lex:GetBots",
        "lex:GetIntentVersions",
        "lex:GetIntents",
        "lex:GetSlotTypeVersions",
        "lex:GetSlotTypes",
        "lex:GetUtterancesView",
        "lightsail:GetBlueprints",
        "lightsail:GetBundles",
        "lightsail:GetInstanceSnapshots",
        "lightsail:GetInstances",
        "lightsail:GetKeyPair",
        "lightsail:GetRegions",
        "lightsail:GetStaticIps",
        "lightsail:IsVpcPeered",
        "logs:Describe*",
        "lookoutvision:ListModelPackagingJobs",
        "lookoutvision:ListModels",
        "lookoutvision:ListProjects",
        "machinelearning:Describe*",
        "mediaconnect:ListEntitlements",
        "mediaconnect:ListFlows",
        "mediaconnect:ListOfferings",
        "mediaconnect:ListReservations",
        "mobilehub:ListAvailableFeatures",
        "mobilehub:ListAvailableRegions",
        "mobilehub:ListProjects",
        "mobiletargeting:GetApplicationSettings",
        "mobiletargeting:GetCampaigns",
        "mobiletargeting:GetImportJobs",
        "mobiletargeting:GetSegments",
        "opsworks-cm:Describe*",
        "opsworks:Describe*",
        "organizations:List*",
        "outposts:GetOutpost",
        "outposts:GetOutpostInstanceTypes",
        "outposts:ListOutposts",
        "outposts:ListSites",
        "outposts:ListTagsForResource",
        "polly:Describe*",
        "polly:List*",
        "rds:Describe*",
        "redshift:DescribeClusters",
        "redshift:DescribeEvents",
        "redshift:ViewQueriesInConsole",
        "route53:Get*",
        "route53:List*",
        "route53domains:List*",
        "route53resolver:Get*",
        "route53resolver:List*",
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "sagemaker:Describe*",
        "sagemaker:List*",
        "sdb:List*",
        "servicecatalog:List*",
        "ses:List*",
        "shield:List*",
        "sns:List*",
        "ssm:ListAssociations",
        "ssm:ListDocuments",
        "states:ListActivities",
        "states:ListStateMachines",
        "storagegateway:ListGateways",
        "storagegateway:ListLocalDisks",
        "storagegateway:ListVolumeRecoveryPoints",
        "storagegateway:ListVolumes",
        "swf:List*",
        "trustedadvisor:Describe*",
        "waf-regional:List*",
        "waf:List*",
        "wafv2:List*",
        "workdocs:DescribeAvailableDirectories",
        "workdocs:DescribeInstances",
        "workmail:Describe*",
        "workspaces:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "ViewOnlyAccess"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "aws_jay.aware_test-viewer"
}

resource "aws_iam_role_policy" "tfer--doormat-ssm_SSM" {
  name = "SSM"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ssm:StartSession"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "SSM"
    },
    {
      "Action": [
        "ssm:DescribeInstanceInformation",
        "ec2:DescribeInstances"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "SSMDescribe"
    },
    {
      "Action": [
        "ssm:TerminateSession"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:ssm:*:*:session/${aws:PrincipalTag/RoleSessionName}-*",
      "Sid": "SSMTerminate"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "doormat-ssm"
}

resource "aws_iam_role_policy" "tfer--doormat_AccountBootstrapIAMAccountAlias" {
  name = "AccountBootstrapIAMAccountAlias"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:CreateAccountAlias",
        "iam:ListAccountAlias",
        "iam:DeleteAccountAlias"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "doormat"
}

resource "aws_iam_role_policy" "tfer--doormat_AccountBootstrapIAMAssumeRolePolicy" {
  name = "AccountBootstrapIAMAssumeRolePolicy"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:UpdateAssumeRolePolicy"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::*:role/honeybee-iam-role"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "doormat"
}

resource "aws_iam_role_policy" "tfer--doormat_IAMRead" {
  name = "IAMRead"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:GetRole",
        "iam:ListRoles"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "doormat"
}

resource "aws_iam_role_policy" "tfer--doormat_SSMListInstances" {
  name = "SSMListInstances"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ssm:DescribeInstanceInformation",
        "ec2:DescribeInstances"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "doormat"
}

resource "aws_iam_role_policy" "tfer--eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0_eksctl-dynamic-policy-saas-cluster-PolicyCloudWatchMetrics" {
  name = "eksctl-dynamic-policy-saas-cluster-PolicyCloudWatchMetrics"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "cloudwatch:PutMetricData"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0"
}

resource "aws_iam_role_policy" "tfer--eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0_eksctl-dynamic-policy-saas-cluster-PolicyELBPermissions" {
  name = "eksctl-dynamic-policy-saas-cluster-PolicyELBPermissions"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:DescribeAccountAttributes",
        "ec2:DescribeAddresses",
        "ec2:DescribeInternetGateways"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0"
}

resource "aws_iam_role_policy" "tfer--honeybee-config-recorder_ModifyIAM" {
  name = "ModifyIAM"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:CreateServiceLinkedRole",
        "config:DescribeConfigurationRecorders",
        "config:DescribeConfigurationRecorderStatus",
        "config:DescribeDeliveryChannels",
        "config:PutConfigurationRecorder",
        "config:PutDeliveryChannel",
        "config:StartConfigurationRecorder"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "Config"
    },
    {
      "Action": [
        "iam:PassRole"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::591976937045:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig",
      "Sid": "PassRole"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "honeybee-config-recorder"
}

resource "aws_iam_role_policy" "tfer--honeybee-iam-account-alias_ModifyIAMAccountAlias" {
  name = "ModifyIAMAccountAlias"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:CreateAccountAlias",
        "iam:DeleteAccountAlias",
        "iam:ListAccountAliases"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "ModifyIAMAccountAlias"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "honeybee-iam-account-alias"
}

resource "aws_iam_role_policy" "tfer--honeybee-iam-policy_ModifyIAM" {
  name = "ModifyIAM"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:CreatePolicy",
        "iam:CreatePolicyVersion",
        "iam:GetAccountAuthorizationDetails",
        "iam:DeletePolicyVersion",
        "iam:ListPolicyTags",
        "iam:TagPolicy",
        "iam:UnTagPolicy"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "ModifyIAM"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "honeybee-iam-policy"
}

resource "aws_iam_role_policy" "tfer--honeybee-iam-role_ModifyIAM" {
  name = "ModifyIAM"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "ModifyIAM"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "honeybee-iam-role"
}

resource "aws_iam_role_policy" "tfer--sec-break-glass_BreakGlass" {
  name = "BreakGlass"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:AttachUserPolicy",
        "iam:ChangePassword",
        "iam:CreateAccessKey",
        "iam:CreateLoginProfile",
        "iam:CreateUser",
        "iam:GetUser",
        "iam:TagUser",
        "iam:DeleteUser"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "BreakGlassIAM"
    },
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::hc1-swag-infrasec-prod-*",
      "Sid": "SWAG"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "sec-break-glass"
}

resource "aws_iam_role_policy" "tfer--security-response_EC2InstanceCollection" {
  name = "EC2InstanceCollection"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:CopySnapshot",
        "ec2:CreateSnapshot",
        "ec2:CreateTags",
        "ec2:DeleteSnapshot",
        "ec2:DescribeInstances",
        "ec2:DescribeSnapshots",
        "ec2:DescribeVolumes",
        "ec2:ModifySnapshotAttribute"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "EC2SnapshotAcquisition"
    },
    {
      "Action": [
        "kms:CreateGrant",
        "kms:CreateKey",
        "kms:DescribeKey",
        "kms:GenerateDataKeyWithoutPlaintext",
        "kms:GetKeyPolicy",
        "kms:PutKeyPolicy",
        "kms:ScheduleKeyDeletion",
        "kms:TagResource"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "KMSSnapshotEncryption"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "security-response"
}

resource "aws_iam_role_policy" "tfer--security-response_EC2InstanceTermination" {
  name = "EC2InstanceTermination"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:TerminateInstances"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "EC2InstanceTermination"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "security-response"
}

resource "aws_iam_role_policy" "tfer--security-response_IAMKeyDeletion" {
  name = "IAMKeyDeletion"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:DeleteAccessKey",
        "sts:GetAccessKeyInfo"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "IAMKeyDeletion"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "security-response"
}

resource "aws_iam_role_policy" "tfer--security-response_IAMRoleDeletion" {
  name = "IAMRoleDeletion"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:DeleteRole"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "IAMRoleDeletion"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "security-response"
}

resource "aws_iam_role_policy" "tfer--torq-inspect_TorqAdditional" {
  name = "TorqAdditional"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "access-analyzer:List*",
        "dynamodb:Describe*",
        "dynamodb:List*",
        "ecr:Describe*",
        "ecr:GetLifecyclePolicy",
        "ecr:GetRepositoryPolicy",
        "ecr:List*",
        "elasticache:List*",
        "elasticfilesystem:Describe*",
        "elasticmapreduce:List*",
        "es:List*",
        "kinesis:Describe*",
        "kinesis:List*",
        "s3:GetObjectRetention",
        "s3:GetObjectLegalHold",
        "s3:Get*Configuration",
        "sns:GetTopicAttributes",
        "sns:GetSubscriptionAttributes",
        "sns:ListTopics",
        "sns:ListSubscriptions",
        "sns:ListTagsForResource",
        "sts:GetAccessKeyInfo",
        "waf:List*",
        "waf:Get*",
        "waf-regional:List*",
        "waf-regional:Get*",
        "workspaces:List*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "AdditionalPermissions"
    },
    {
      "Action": [
        "apigateway:GET"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:apigateway:*::/*",
      "Sid": "AdditionalPermissionsApiGateway"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "torq-inspect"
}

resource "aws_iam_role_policy" "tfer--torq-inspect_TorqReadSwag" {
  name = "TorqReadSwag"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::hc1-swag-infrasec-prod-us-east-1/v2/accounts.json",
      "Sid": "SwagEnrich"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "torq-inspect"
}

resource "aws_iam_role_policy" "tfer--torq-inspect_TorqSecurityAudit" {
  name = "TorqSecurityAudit"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "access-analyzer:GetAnalyzedResource",
        "access-analyzer:GetAnalyzer",
        "access-analyzer:GetArchiveRule",
        "access-analyzer:GetFinding",
        "access-analyzer:ListAnalyzedResources",
        "access-analyzer:ListAnalyzers",
        "access-analyzer:ListArchiveRules",
        "access-analyzer:ListFindings",
        "access-analyzer:ListTagsForResource",
        "acm:Describe*",
        "acm:List*",
        "application-autoscaling:Describe*",
        "appmesh:Describe*",
        "appmesh:List*",
        "appsync:List*",
        "athena:GetWorkGroup",
        "athena:List*",
        "autoscaling:Describe*",
        "batch:DescribeComputeEnvironments",
        "batch:DescribeJobDefinitions",
        "chime:List*",
        "cloud9:Describe*",
        "cloud9:ListEnvironments",
        "clouddirectory:ListDirectories",
        "cloudformation:DescribeStack*",
        "cloudformation:GetTemplate",
        "cloudformation:ListStack*",
        "cloudformation:GetStackPolicy",
        "cloudfront:Get*",
        "cloudfront:List*",
        "cloudhsm:ListHapgs",
        "cloudhsm:ListHsms",
        "cloudhsm:ListLunaClients",
        "cloudsearch:DescribeDomains",
        "cloudsearch:DescribeServiceAccessPolicies",
        "cloudtrail:DescribeTrails",
        "cloudtrail:GetEventSelectors",
        "cloudtrail:GetTrailStatus",
        "cloudtrail:ListTags",
        "cloudtrail:LookupEvents",
        "cloudwatch:Describe*",
        "codebuild:ListProjects",
        "codecommit:BatchGetRepositories",
        "codecommit:GetBranch",
        "codecommit:GetObjectIdentifier",
        "codecommit:GetRepository",
        "codecommit:List*",
        "codedeploy:Batch*",
        "codedeploy:Get*",
        "codedeploy:List*",
        "codepipeline:ListPipelines",
        "codestar:Describe*",
        "codestar:List*",
        "cognito-identity:ListIdentityPools",
        "cognito-idp:ListUserPools",
        "cognito-sync:Describe*",
        "cognito-sync:List*",
        "comprehend:Describe*",
        "comprehend:List*",
        "config:BatchGetAggregateResourceConfig",
        "config:BatchGetResourceConfig",
        "config:Deliver*",
        "config:Describe*",
        "config:Get*",
        "config:List*",
        "datapipeline:DescribeObjects",
        "datapipeline:DescribePipelines",
        "datapipeline:EvaluateExpression",
        "datapipeline:GetPipelineDefinition",
        "datapipeline:ListPipelines",
        "datapipeline:QueryObjects",
        "datapipeline:ValidatePipelineDefinition",
        "datasync:Describe*",
        "datasync:List*",
        "dax:Describe*",
        "dax:ListTags",
        "directconnect:Describe*",
        "dms:Describe*",
        "dms:ListTagsForResource",
        "ds:DescribeDirectories",
        "dynamodb:DescribeContinuousBackups",
        "dynamodb:DescribeGlobalTable",
        "dynamodb:DescribeTable",
        "dynamodb:DescribeTimeToLive",
        "dynamodb:ListBackups",
        "dynamodb:ListGlobalTables",
        "dynamodb:ListStreams",
        "dynamodb:ListTables",
        "ec2:Describe*",
        "ecr:DescribeRepositories",
        "ecr:GetRepositoryPolicy",
        "ecs:Describe*",
        "ecs:List*",
        "eks:DescribeCluster",
        "eks:ListClusters",
        "elasticache:Describe*",
        "elasticbeanstalk:Describe*",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeMountTargetSecurityGroups",
        "elasticfilesystem:DescribeMountTargets",
        "elasticloadbalancing:Describe*",
        "elasticmapreduce:Describe*",
        "elasticmapreduce:ListClusters",
        "elasticmapreduce:ListInstances",
        "es:Describe*",
        "es:ListDomainNames",
        "events:Describe*",
        "events:List*",
        "firehose:Describe*",
        "firehose:List*",
        "fms:ListComplianceStatus",
        "fms:ListPolicies",
        "fsx:Describe*",
        "fsx:List*",
        "gamelift:ListBuilds",
        "gamelift:ListFleets",
        "glacier:DescribeVault",
        "glacier:GetVaultAccessPolicy",
        "glacier:ListVaults",
        "globalaccelerator:Describe*",
        "globalaccelerator:List*",
        "greengrass:List*",
        "guardduty:Get*",
        "guardduty:List*",
        "iam:GenerateCredentialReport",
        "iam:GenerateServiceLastAccessedDetails",
        "iam:Get*",
        "iam:List*",
        "iam:SimulateCustomPolicy",
        "iam:SimulatePrincipalPolicy",
        "inspector:Describe*",
        "inspector:Get*",
        "inspector:List*",
        "inspector:Preview*",
        "iot:Describe*",
        "iot:GetPolicy",
        "iot:GetPolicyVersion",
        "iot:List*",
        "kinesis:DescribeStream",
        "kinesis:ListStreams",
        "kinesis:ListTagsForStream",
        "kinesisanalytics:ListApplications",
        "kms:Describe*",
        "kms:Get*",
        "kms:List*",
        "lambda:GetAccountSettings",
        "lambda:GetFunctionConfiguration",
        "lambda:GetLayerVersionPolicy",
        "lambda:GetPolicy",
        "lambda:List*",
        "license-manager:List*",
        "lightsail:GetInstances",
        "lightsail:GetLoadBalancers",
        "logs:Describe*",
        "logs:ListTagsLogGroup",
        "machinelearning:DescribeMLModels",
        "mediaconnect:Describe*",
        "mediaconnect:List*",
        "mediastore:GetContainerPolicy",
        "mediastore:ListContainers",
        "opsworks:DescribeStacks",
        "opsworks-cm:DescribeServers",
        "organizations:List*",
        "organizations:Describe*",
        "quicksight:Describe*",
        "quicksight:List*",
        "ram:List*",
        "rds:Describe*",
        "rds:DownloadDBLogFilePortion",
        "rds:ListTagsForResource",
        "redshift:Describe*",
        "rekognition:Describe*",
        "rekognition:List*",
        "robomaker:Describe*",
        "robomaker:List*",
        "route53:Get*",
        "route53:List*",
        "route53domains:GetDomainDetail",
        "route53domains:GetOperationDetail",
        "route53domains:ListDomains",
        "route53domains:ListOperations",
        "route53domains:ListTagsForDomain",
        "route53resolver:List*",
        "route53resolver:Get*",
        "s3:GetAccelerateConfiguration",
        "s3:GetAccessPoint",
        "s3:GetAccessPointPolicy",
        "s3:GetAccessPointPolicyStatus",
        "s3:GetAccountPublicAccessBlock",
        "s3:GetAnalyticsConfiguration",
        "s3:GetBucket*",
        "s3:GetEncryptionConfiguration",
        "s3:GetInventoryConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:GetMetricsConfiguration",
        "s3:GetObjectAcl",
        "s3:GetObjectVersionAcl",
        "s3:GetReplicationConfiguration",
        "s3:ListAccessPoints",
        "s3:ListBucket",
        "sagemaker:Describe*",
        "sagemaker:List*",
        "sdb:DomainMetadata",
        "sdb:ListDomains",
        "secretsmanager:GetResourcePolicy",
        "secretsmanager:ListSecrets",
        "secretsmanager:ListSecretVersionIds",
        "securityhub:Describe*",
        "securityhub:Get*",
        "securityhub:List*",
        "serverlessrepo:GetApplicationPolicy",
        "serverlessrepo:List*",
        "ses:GetIdentityDkimAttributes",
        "ses:GetIdentityPolicies",
        "ses:GetIdentityVerificationAttributes",
        "ses:ListIdentities",
        "ses:ListIdentityPolicies",
        "ses:ListVerifiedEmailAddresses",
        "shield:Describe*",
        "shield:List*",
        "snowball:ListClusters",
        "snowball:ListJobs",
        "sns:GetTopicAttributes",
        "sns:ListSubscriptionsByTopic",
        "sns:ListTopics",
        "sqs:GetQueueAttributes",
        "sqs:ListDeadLetterSourceQueues",
        "sqs:ListQueues",
        "sqs:ListQueueTags",
        "ssm:Describe*",
        "ssm:GetAutomationExecution",
        "ssm:ListDocuments",
        "sso:DescribePermissionsPolicies",
        "sso:List*",
        "states:ListStateMachines",
        "storagegateway:DescribeBandwidthRateLimit",
        "storagegateway:DescribeCache",
        "storagegateway:DescribeCachediSCSIVolumes",
        "storagegateway:DescribeGatewayInformation",
        "storagegateway:DescribeMaintenanceStartTime",
        "storagegateway:DescribeNFSFileShares",
        "storagegateway:DescribeSnapshotSchedule",
        "storagegateway:DescribeStorediSCSIVolumes",
        "storagegateway:DescribeTapeArchives",
        "storagegateway:DescribeTapeRecoveryPoints",
        "storagegateway:DescribeTapes",
        "storagegateway:DescribeUploadBuffer",
        "storagegateway:DescribeVTLDevices",
        "storagegateway:DescribeWorkingStorage",
        "storagegateway:List*",
        "tag:GetResources",
        "tag:GetTagKeys",
        "transfer:Describe*",
        "transfer:List*",
        "translate:List*",
        "trustedadvisor:Describe*",
        "waf:ListWebACLs",
        "waf-regional:ListWebACLs",
        "workspaces:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "SecurityAudit"
    },
    {
      "Action": [
        "apigateway:GET"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:apigateway:*::/apis",
        "arn:aws:apigateway:*::/apis/*/stages",
        "arn:aws:apigateway:*::/apis/*/stages/*",
        "arn:aws:apigateway:*::/apis/*/routes",
        "arn:aws:apigateway:*::/restapis",
        "arn:aws:apigateway:*::/restapis/*/authorizers",
        "arn:aws:apigateway:*::/restapis/*/authorizers/*",
        "arn:aws:apigateway:*::/restapis/*/documentation/versions",
        "arn:aws:apigateway:*::/restapis/*/resources",
        "arn:aws:apigateway:*::/restapis/*/resources/*",
        "arn:aws:apigateway:*::/restapis/*/resources/*/methods/*",
        "arn:aws:apigateway:*::/restapis/*/stages",
        "arn:aws:apigateway:*::/restapis/*/stages/*",
        "arn:aws:apigateway:*::/vpclinks"
      ],
      "Sid": "SecurityAuditApiGateway"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "torq-inspect"
}

resource "aws_iam_role_policy" "tfer--vault-assumed-role-credentials-demo_DescribeRegions" {
  name = "DescribeRegions"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:DescribeRegions"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "vault-assumed-role-credentials-demo"
}
