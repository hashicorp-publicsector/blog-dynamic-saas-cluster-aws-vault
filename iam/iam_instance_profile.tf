resource "aws_iam_instance_profile" "tfer--AWSCloud9SSMInstanceProfile" {
  name = "AWSCloud9SSMInstanceProfile"
  path = "/cloud9/"
  role = "AWSCloud9SSMAccessRole"
}

resource "aws_iam_instance_profile" "tfer--dynamic-policy-ref-arch-admin" {
  name = "dynamic-policy-ref-arch-admin"
  path = "/"
  role = "dynamic-policy-ref-arch-admin"
}

resource "aws_iam_instance_profile" "tfer--eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86" {
  name = "eks-bcc2fbb0-5cc6-aa1f-af64-7baec72beb86"
  path = "/"
  role = "eksctl-dynamic-policy-saas-nodegr-NodeInstanceRole-1IV221YYCCQET"
}
