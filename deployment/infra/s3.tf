#### S3 Configuration ####
resource "aws_s3_bucket" "vault_s3_bucket" {
  bucket        = "vault-agent-template-${random_pet.random_pet.id}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "vault_s3_bucket" {
  bucket = aws_s3_bucket.vault_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "vault_s3_bucket" {
  bucket = aws_s3_bucket.vault_s3_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_logging" "vault_s3_bucket" {
  bucket = aws_s3_bucket.vault_s3_bucket.id

  target_bucket = aws_s3_bucket.access_logs_bucket.id
  target_prefix = "/"
}

resource "aws_s3_bucket_policy" "vault_s3_bucket" {
  bucket = aws_s3_bucket.vault_s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

resource "aws_s3_bucket" "access_logs_bucket" {
  bucket        = "${aws_s3_bucket.vault_s3_bucket.id}-access-logs"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "access_logs_bucket" {
  bucket = aws_s3_bucket.access_logs_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "access_logs_bucket" {
  bucket = aws_s3_bucket.access_logs_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "access_logs_bucket" {
  bucket = aws_s3_bucket.access_logs_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_logs_policy.json
}

resource "aws_s3_bucket_acl" "access_logs_bucket" {
  bucket = aws_s3_bucket.access_logs_bucket.id
  access_control_policy {
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/s3/LogDelivery"
      }
      permission = "READ_ACP"
    }
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/s3/LogDelivery"
      }
      permission = "WRITE"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}