# ------------------------------------------------------------------------------
# Attach the IAM policy that allows creation of the certboto-docker
# certificates bucket in the DNS account to the ProvisionAccount role.
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "createcertificatesbucket_policy_attachment" {
  policy_arn = aws_iam_policy.createcertificatesbucket_policy.arn
  role       = var.provisionaccount_role_name
}
