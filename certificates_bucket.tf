# ------------------------------------------------------------------------------
# Provision the S3 bucket where the certboto-docker certificates will
# be stored.
# ------------------------------------------------------------------------------

resource "aws_s3_bucket" "certificates" {
  provider = aws.dnsprovisionaccount

  bucket = var.certificates_bucket_name
  depends_on = [
    # Until this policy attachment happens, we don't have permission
    # to provision the bucket.
    aws_iam_role_policy_attachment.provisioncertificatesbucket_policy_attachment,
  ]
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# This blocks ANY public access to the bucket or the objects it
# contains, even if misconfigured to allow public access.
resource "aws_s3_bucket_public_access_block" "certificates" {
  provider = aws.dnsprovisionaccount

  bucket = aws_s3_bucket.certificates.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
