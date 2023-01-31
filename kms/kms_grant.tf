resource "aws_kms_grant" "tfer--arn-003A-aws-003A-kms-003A-us-east-2-003A-591976937045-003A-key-002F-1e9f165b-cfec-4ca5-8a25-fbbb923c12f0-003A-d9d8a902f41878304af87b13dbede593f680243465bae87653a83b2ac309d836" {
  constraints "encryption_context_equals" {
    "aws:eks:context" = "79d0cff5-332e-48b6-a10a-644dbab62fdd"
  }

  name       = "eks-grant-dynamic-policy-saas"
  operations = ["Decrypt", "Encrypt"]
}
