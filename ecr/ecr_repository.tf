resource "aws_ecr_repository" "tfer--dynamic-policy-saas-repo-xdgssrli-aws-cli" {
  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = "arn:aws:kms:us-east-2:591976937045:key/3c083639-ff56-41fd-a271-8a130873fdb5"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "MUTABLE"
  name                 = "dynamic-policy-saas-repo-xdgssrli-aws-cli"
}

resource "aws_ecr_repository" "tfer--dynamic-policy-saas-repo-xdgssrli-vault" {
  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = "arn:aws:kms:us-east-2:591976937045:key/3c083639-ff56-41fd-a271-8a130873fdb5"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "MUTABLE"
  name                 = "dynamic-policy-saas-repo-xdgssrli-vault"
}

resource "aws_ecr_repository" "tfer--dynamic-policy-saas-repo-xdgssrli-vault-k8s" {
  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = "arn:aws:kms:us-east-2:591976937045:key/3c083639-ff56-41fd-a271-8a130873fdb5"
  }

  image_scanning_configuration {
    scan_on_push = "false"
  }

  image_tag_mutability = "MUTABLE"
  name                 = "dynamic-policy-saas-repo-xdgssrli-vault-k8s"
}
