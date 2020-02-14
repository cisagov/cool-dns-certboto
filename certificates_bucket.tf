# ------------------------------------------------------------------------------
# Create the S3 bucket where the certboto-docker certificates will be
# stored.
# ------------------------------------------------------------------------------

resource "aws_s3_bucket" "certificates" {
  bucket = var.certificates_bucket_name
  depends_on = [
    # Until this policy attachment happens, we don't even have
    # permission to create the bucket.
    aws_iam_role_policy_attachment.createcertificatesbucket_policy_attachment,
  ]
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = var.tags
}

# This blocks ANY public access to the bucket or the objects it
# contains, even if misconfigured to allow public access.
resource "aws_s3_bucket_public_access_block" "certificates" {
  bucket = aws_s3_bucket.certificates.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
