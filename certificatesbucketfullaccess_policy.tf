# ------------------------------------------------------------------------------
# Create the IAM policy that allows full access to the certboto-docker
# certificates bucket in the DNS account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "certificatesbucketfullaccess_doc" {
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
      "s3:DeleteObject",
      "s3:PutObject",
    ]
    resources = [
      "${aws_s3_bucket.certificates.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "certificatesbucketfullaccess_policy" {
  description = var.certificatesbucketfullaccess_role_description
  name        = var.certificatesbucketfullaccess_role_name
  policy      = data.aws_iam_policy_document.certificatesbucketfullaccess_doc.json
}
