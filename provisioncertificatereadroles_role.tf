# ------------------------------------------------------------------------------
# Create the IAM role that is allowed to itself create IAM roles that
# can read selected certificates in the certificate bucket in the DNS
# account.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "provisioncertificatereadroles_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
  description        = var.provisioncertificatereadroles_role_description
  name               = var.provisioncertificatereadroles_role_name
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "provisioncertificatereadroles_policy_attachment" {
  policy_arn = aws_iam_policy.provisioncertificatereadroles_policy.arn
  role       = aws_iam_role.provisioncertificatereadroles_role.name
}
