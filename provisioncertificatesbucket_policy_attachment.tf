# ------------------------------------------------------------------------------
# Attach to the ProvisionAccount role the IAM policy that allows
# provisioning of the certboto-docker certificates bucket in the DNS
# account.
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "provisioncertificatesbucket_policy_attachment" {
  provider = aws.dnsprovisionaccount

  policy_arn = aws_iam_policy.provisioncertificatesbucket_policy.arn
  role       = var.provisionaccount_role_name
}
