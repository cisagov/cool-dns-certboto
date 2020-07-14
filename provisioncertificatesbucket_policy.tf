# ------------------------------------------------------------------------------
# Create the IAM policy that allows provisioning of the
# certboto-docker certificates bucket in the DNS account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "provisioncertificatesbucket_doc" {
  statement {
    actions = [
      "s3:*",
    ]
    resources = [
      # This policy needs to be created before the bucket is
      # provisioned, so we can't use aws_s3_bucket.certificates.arn
      # here.
      "arn:aws:s3:::${var.certificates_bucket_name}",
    ]
  }
}

resource "aws_iam_policy" "provisioncertificatesbucket_policy" {
  provider = aws.dnsprovisionaccount

  description = var.provisioncertificatesbucket_policy_description
  name        = var.provisioncertificatesbucket_policy_name
  policy      = data.aws_iam_policy_document.provisioncertificatesbucket_doc.json
}
