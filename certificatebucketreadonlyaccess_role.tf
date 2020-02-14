# ------------------------------------------------------------------------------
# Create the IAM role that allows read-only access to the
# certboto-docker certificates bucket in the DNS account.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "certificatesbucketreadonlyaccess_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
  description        = var.certificatesbucketreadonlyaccess_role_description
  name               = var.certificatesbucketreadonlyaccess_role_name
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "certificatesbucketreadonlyaccess_policy_attachment" {
  policy_arn = aws_iam_policy.certificatesbucketreadonlyaccess_policy.arn
  role       = aws_iam_role.certificatesbucketreadonlyaccess_role.name
}
