# ------------------------------------------------------------------------------
# Create the IAM policy that allows creation of the certboto-docker
# certificates bucket in the DNS account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "createcertificatesbucket_doc" {
  statement {
    actions = [
      "s3:*",
    ]
    resources = [
      # This policy needs to be created before the bucket is created,
      # so we can't use aws_s3_bucket.certificates.arn here.
      "arn:aws:s3:::${var.certificates_bucket_name}",
    ]
  }
}

resource "aws_iam_policy" "createcertificatesbucket_policy" {
  description = var.createcertificatesbucket_policy_description
  name        = var.createcertificatesbucket_policy_name
  policy      = data.aws_iam_policy_document.createcertificatesbucket_doc.json
}
