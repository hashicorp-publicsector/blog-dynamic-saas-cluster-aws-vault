# IAM Policy Documents
data "aws_iam_policy_document" "s3_access_policy" {
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:GetObjectVersion"]
    resources = [
      "${aws_s3_bucket.vault_s3_bucket.arn}/*"
    ]
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.vault_s3_bucket.arn]
  }
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    effect  = "Deny"
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.vault_s3_bucket.arn,
      "${aws_s3_bucket.vault_s3_bucket.arn}/*"
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"

      values = ["false"]
    }
  }
}

data "aws_iam_policy_document" "s3_bucket_logs_policy" {
  statement {
    effect  = "Allow"
    actions = ["s3:PutObject"]
    resources = [
      "${aws_s3_bucket.access_logs_bucket.arn}/*"
    ]
    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.vault_s3_bucket.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
  statement {
    effect  = "Deny"
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.access_logs_bucket.arn,
      "${aws_s3_bucket.access_logs_bucket.arn}/*"
    ]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

data "aws_iam_policy_document" "dynamodb_policy" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:BatchGetItem",
      "dynamodb:Query",
      "dynamodb:DescribeTable"
    ]
    resources = [
      aws_dynamodb_table.product_table.arn
    ]
  }
}

data "aws_iam_policy_document" "vault_sa_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    resources = [
      aws_iam_role.vault_role.arn
    ]
  }
  statement {
    sid       = "VaultKMSUnseal"
    effect    = "Allow"
    resources = [aws_kms_key.vault_autounseal_key.arn]

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:DescribeKey",
    ]
  }
}

#### Vault Configuration ####
# IAM Resources
resource "aws_iam_role" "vault_role" {
  name = "vault-role-${random_pet.random_pet.id}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "AllowNodes"
        Principal = {
          "AWS" : aws_iam_role.vault_sa_role.arn
        }
      }
    ]
  })
}

resource "aws_iam_policy" "dynamodb_policy" {
  name        = "dynamodb-policy-${random_pet.random_pet.id}"
  path        = "/"
  description = "dynamodb policy for tenants"
  policy      = data.aws_iam_policy_document.dynamodb_policy.json
}

resource "aws_iam_role_policy_attachment" "vault_role_policy" {
  role       = aws_iam_role.vault_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}

resource "aws_iam_role" "vault_sa_role" {
  name = "${var.tag_prefix}-vault-sa-role-${random_pet.random_pet.id}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          "Federated" : module.eks.oidc_provider_arn
        }
        Condition = {
          "StringLike" = {
            "${module.eks.oidc_provider}:sub" = "system:serviceaccount:vault:vault-sa",
            "${module.eks.oidc_provider}:aud" = "sts.amazonaws.com"
          }
        },
      }
    ]
  })
}

resource "aws_iam_policy" "vault_sa_policy" {
  name        = "vault-sa-role-policy-${random_pet.random_pet.id}"
  path        = "/"
  description = "Policy for Vault SA in EKS"
  policy      = data.aws_iam_policy_document.vault_sa_role_policy.json
}

resource "aws_iam_role_policy_attachment" "vault_sa_role" {
  role       = aws_iam_role.vault_sa_role.name
  policy_arn = aws_iam_policy.vault_sa_policy.arn
}

resource "aws_iam_role" "s3_access_role" {
  name = "${var.tag_prefix}-s3-access-role-${random_pet.random_pet.id}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          "Federated" : module.eks.oidc_provider_arn
        }
        Condition = {
          "StringLike" = {
            "${module.eks.oidc_provider}:sub" = "system:serviceaccount:tenant*:tenant*-sa",
            "${module.eks.oidc_provider}:aud" = "sts.amazonaws.com"
          }
        },
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "${var.tag_prefix}-s3-access-policy"
  path        = "/"
  description = "s3 access policy for eks cluster"
  policy      = data.aws_iam_policy_document.s3_access_policy.json
}

resource "aws_iam_role_policy_attachment" "s3_access_role" {
  role       = aws_iam_role.s3_access_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}