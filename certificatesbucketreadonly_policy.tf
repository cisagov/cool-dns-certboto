# ------------------------------------------------------------------------------
# Create the IAM policy that allows read-only access to the
# certboto-docker certificates bucket in the DNS account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "certificatesbucketreadonly_doc" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.certificates.arn
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "${aws_s3_bucket.certificates.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "certificatesbucketreadonly_policy" {
  description = var.certificatesbucketreadonly_role_description
  name        = var.certificatesbucketreadonly_role_name
  policy      = data.aws_iam_policy_document.certificatesbucketreadonly_doc.json
}
