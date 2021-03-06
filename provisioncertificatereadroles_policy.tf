# ------------------------------------------------------------------------------
# Create the IAM policy that gives the ability to create IAM roles
# that can read selected certificates in the certificate bucket in the
# DNS account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "provisioncertificatereadroles_doc" {
  statement {
    actions = [
      "iam:AttachRolePolicy",
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:DeleteRolePolicy",
      "iam:DetachRolePolicy",
      "iam:GetRole",
      "iam:GetRolePolicy",
      "iam:ListAttachedRolePolicies",
      "iam:ListInstanceProfilesForRole",
      "iam:ListRolePolicies",
      "iam:PutRolePolicy",
      "iam:TagRole",
      "iam:UpdateAssumeRolePolicy",
      "iam:UpdateRole",
      "iam:UpdateRoleDescription",
    ]
    resources = [
      "arn:aws:iam::${local.dns_account_id}:role/CertificateReadOnly-*"
    ]
  }

  statement {
    actions = [
      "iam:CreatePolicy",
      "iam:DeletePolicy",
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:ListPolicyVersions",
    ]
    resources = [
      "arn:aws:iam::${local.dns_account_id}:policy/CertificateReadOnly-*"
    ]
  }
}

resource "aws_iam_policy" "provisioncertificatereadroles_policy" {
  provider = aws.dnsprovisionaccount

  description = var.provisioncertificatereadroles_role_description
  name        = var.provisioncertificatereadroles_role_name
  policy      = data.aws_iam_policy_document.provisioncertificatereadroles_doc.json
}
