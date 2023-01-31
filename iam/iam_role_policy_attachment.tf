resource "aws_iam_role_policy_attachment" "tfer--AWSCloud9SSMAccessRole_AWSCloud9SSMInstanceProfile" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9SSMInstanceProfile"
  role       = "AWSCloud9SSMAccessRole"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAWSCloud9_AWSCloud9ServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSCloud9ServiceRolePolicy"
  role       = "AWSServiceRoleForAWSCloud9"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAmazonEKSNodegroup_AWSServiceRoleForAmazonEKSNodegroup" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAmazonEKSNodegroup"
  role       = "AWSServiceRoleForAmazonEKSNodegroup"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAmazonEKS_AmazonEKSServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonEKSServiceRolePolicy"
  role       = "AWSServiceRoleForAmazonEKS"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAmazonGuardDuty_AmazonGuardDutyServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonGuardDutyServiceRolePolicy"
  role       = "AWSServiceRoleForAmazonGuardDuty"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAutoScaling_AutoScalingServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"
  role       = "AWSServiceRoleForAutoScaling"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForCloudTrail_CloudTrailServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/CloudTrailServiceRolePolicy"
  role       = "AWSServiceRoleForCloudTrail"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForConfig_AWSConfigServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSConfigServiceRolePolicy"
  role       = "AWSServiceRoleForConfig"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForOrganizations_AWSOrganizationsServiceTrustPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  role       = "AWSServiceRoleForOrganizations"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSupport_AWSSupportServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = "AWSServiceRoleForSupport"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForTrustedAdvisor_AWSTrustedAdvisorServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = "AWSServiceRoleForTrustedAdvisor"
}

resource "aws_iam_role_policy_attachment" "tfer--dynamic-policy-ref-arch-admin_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "dynamic-policy-ref-arch-admin"
}

resource "aws_iam_role_policy_attachment" "tfer--dynamic-policy-saas-s3-access-role-xdgssrli_s3-object-access-policy-xdgssrli" {
  policy_arn = "arn:aws:iam::591976937045:policy/s3-object-access-policy-xdgssrli"
  role       = "dynamic-policy-saas-s3-access-role-xdgssrli"
}

resource "aws_iam_role_policy_attachment" "tfer--dynamic-policy-saas-vault-sa-role-xdgssrli_vault-sa-assumerole-policy-xdgssrli" {
  policy_arn = "arn:aws:iam::591976937045:policy/vault-sa-assumerole-policy-xdgssrli"
  role       = "dynamic-policy-saas-vault-sa-role-xdgssrli"
}

resource "aws_iam_role_policy_attachment" "tfer--eksctl-dynamic-policy-saas-addon-aws-ebs-csi-Role1-QWZPKN5SLWZ7_AmazonEBSCSIDriverPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = "eksctl-dynamic-policy-saas-addon-aws-ebs-csi-Role1-QWZPKN5SLWZ7"
}

resource "aws_iam_role_policy_attachment" "tfer--eksctl-dynamic-policy-saas-addon-iamservicea-Role1-1IN5O2JI2UWXD_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "eksctl-dynamic-policy-saas-addon-iamservicea-Role1-1IN5O2JI2UWXD"
}

resource "aws_iam_role_policy_attachment" "tfer--eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0"
}

resource "aws_iam_role_policy_attachment" "tfer--eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0_AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = "eksctl-dynamic-policy-saas-cluster-ServiceRole-1KY0S2H79QNW0"
}

resource "aws_iam_role_policy_attachment" "tfer--eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET"
}

resource "aws_iam_role_policy_attachment" "tfer--eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET"
}

resource "aws_iam_role_policy_attachment" "tfer--eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET_AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = "eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET"
}

resource "aws_iam_role_policy_attachment" "tfer--honeybee-iam-role_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "honeybee-iam-role"
}

resource "aws_iam_role_policy_attachment" "tfer--vault-role-xdgssrli_dynamodb-policy-xdgssrli" {
  policy_arn = "arn:aws:iam::591976937045:policy/dynamodb-policy-xdgssrli"
  role       = "vault-role-xdgssrli"
}
