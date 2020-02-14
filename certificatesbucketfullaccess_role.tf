# ------------------------------------------------------------------------------
# Create the IAM role that allows full access to the certboto-docker
# certificates bucket in the DNS account.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "certificatesbucketfullaccess_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
  description        = var.certificatesbucketfullaccess_role_description
  name               = var.certificatesbucketfullaccess_role_name
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "certificatesbucketfullaccess_policy_attachment" {
  policy_arn = aws_iam_policy.certificatesbucketfullaccess_policy.arn
  role       = aws_iam_role.certificatesbucketfullaccess_role.name
}
