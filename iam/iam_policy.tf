resource "aws_iam_policy" "tfer--DemoUser" {
  description = "Policy for Boundary and Vault IAM Demo Users"
  name        = "DemoUser"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:DescribeInstances",
        "ec2:DescribeRegions",
        "iam:GetInstanceProfile"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "DemoUserPermissions"
    },
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::591976937045:role/vault-assumed-role-credentials-demo",
      "Sid": "DemoAssumedRoleCredentialType"
    },
    {
      "Action": [
        "sts:GetFederationToken"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:sts::591976937045:federated-user/$${aws:username}*",
      "Sid": "DemoUserFederationCredentialType"
    },
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
      "Resource": "arn:aws:iam::591976937045:user/$${aws:username}*",
      "Sid": "CreateChildUser"
    },
    {
      "Action": [
        "iam:DeleteUser",
        "iam:DeleteUserPolicy",
        "iam:PutUserPolicy",
        "iam:TagUser",
        "iam:UntagUser"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::591976937045:user/$${aws:username}*",
      "Sid": "ManageAndDeleteChildren"
    },
    {
      "Action": [
        "iam:CreateAccessKey",
        "iam:DeleteAccessKey",
        "iam:GetAccessKeyLastUsed",
        "iam:GetUser",
        "iam:GetUserPolicy",
        "iam:List*",
        "iam:UpdateAccessKey"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::591976937045:user/$${aws:username}*",
      "Sid": "ManageSelfAndChildren"
    },
    {
      "Effect": "Deny",
      "NotAction": [
        "ec2:DescribeRegions",
        "ec2:DescribeInstances",
        "iam:CreateAccessKey",
        "iam:CreateUser",
        "iam:DeleteAccessKey",
        "iam:DeleteUser",
        "iam:DeleteUserPolicy",
        "iam:GetAccessKeyLastUsed",
        "iam:GetInstanceProfile",
        "iam:GetUser",
        "iam:GetUserPolicy",
        "iam:List*",
        "iam:PutUserPolicy",
        "iam:TagUser",
        "iam:UntagUser",
        "iam:UpdateAccessKey",
        "sts:AssumeRole",
        "sts:GetFederationToken"
      ],
      "Resource": "*",
      "Sid": "ExplicitDenyAll"
    },
    {
      "Action": "sts:AssumeRole",
      "Effect": "Deny",
      "NotResource": "arn:aws:iam::591976937045:role/vault-assumed-role-credentials-demo",
      "Sid": "ExplicitDenyAssumeRole"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
  }
}

resource "aws_iam_policy" "tfer--SecurityComputeAccess" {
  description = "Base Managed Policy for Security Tooling"
  name        = "SecurityComputeAccess"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ssm:DescribeAssociation",
        "ssm:GetDeployablePatchSnapshotForInstance",
        "ssm:GetDocument",
        "ssm:DescribeDocument",
        "ssm:GetManifest",
        "ssm:ListAssociations",
        "ssm:ListInstanceAssociations",
        "ssm:PutInventory",
        "ssm:PutComplianceItems",
        "ssm:PutConfigurePackageResult",
        "ssm:UpdateAssociationStatus",
        "ssm:UpdateInstanceAssociationStatus",
        "ssm:UpdateInstanceInformation"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "1"
    },
    {
      "Action": [
        "ssmmessages:CreateControlChannel",
        "ssmmessages:CreateDataChannel",
        "ssmmessages:OpenControlChannel",
        "ssmmessages:OpenDataChannel"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "2"
    },
    {
      "Action": [
        "ec2messages:AcknowledgeMessage",
        "ec2messages:DeleteMessage",
        "ec2messages:FailMessage",
        "ec2messages:GetEndpoint",
        "ec2messages:GetMessages",
        "ec2messages:SendReply"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "3"
    },
    {
      "Action": [
        "ssm:GetParameter",
        "ssm:GetParameters"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:ssm:*:591976937045:parameter/security-ssm/*",
      "Sid": "4"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  tags = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
  }

  tags_all = {
    hc-config-as-code = "honeybee"
    hc-owner-dl       = "team-secops@hashicorp.com"
  }
}

resource "aws_iam_policy" "tfer--dynamodb-policy-xdgssrli" {
  name = "dynamodb-policy-xdgssrli"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "dynamodb:GetItem",
        "dynamodb:BatchGetItem",
        "dynamodb:Query",
        "dynamodb:DescribeTable"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:dynamodb:us-east-2:591976937045:table/Products_xdgssrli"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--s3-object-access-policy-cafiaite" {
  name = "s3-object-access-policy-cafiaite"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-cafiaite/*"
    },
    {
      "Action": "s3:ListBucket",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-cafiaite"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--s3-object-access-policy-oyfrdhcm" {
  name = "s3-object-access-policy-oyfrdhcm"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-oyfrdhcm/*"
    },
    {
      "Action": "s3:ListBucket",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-oyfrdhcm"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--s3-object-access-policy-scbatbdc" {
  name = "s3-object-access-policy-scbatbdc"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-scbatbdc/*"
    },
    {
      "Action": "s3:ListBucket",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-scbatbdc"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--s3-object-access-policy-vbuizzhv" {
  name = "s3-object-access-policy-vbuizzhv"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-vbuizzhv/*"
    },
    {
      "Action": "s3:ListBucket",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-vbuizzhv"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--s3-object-access-policy-xdgssrli" {
  name = "s3-object-access-policy-xdgssrli"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-xdgssrli/*"
    },
    {
      "Action": "s3:ListBucket",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::vault-agent-template-xdgssrli"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--vault-sa-assumerole-policy-xdgssrli" {
  name = "vault-sa-assumerole-policy-xdgssrli"
  path = "/"

  policy = <<POLICY
{
  "Statement": {
    "Action": "sts:AssumeRole",
    "Effect": "Allow",
    "Resource": "arn:aws:iam::591976937045:role/vault-role-xdgssrli"
  },
  "Version": "2012-10-17"
}
POLICY
}
