output "certificates_bucket" {
  description = "The S3 bucket where certboto-docker certificates will be stored."
  value       = aws_s3_bucket.certificates
}

output "certificatesbucketfullaccess_role" {
  description = "The IAM role that allows full access to the certboto-docker certificates bucket in the DNS account."
  value       = aws_iam_role.certificatesbucketfullaccess_role
}

output "certificatesbucketreadonly_role" {
  description = "The IAM role that allows read-only access to the certboto-docker certificates bucket in the DNS account."
  value       = aws_iam_role.certificatesbucketreadonly_role
}

output "provisioncertificatereadroles_role" {
  description = "The IAM role with the ability to provision IAM roles that can read selected certificates in the certificates bucket in the DNS account."
  value       = aws_iam_role.provisioncertificatereadroles_role
}

output "provisioncertificatesbucket_policy" {
  description = "The IAM policy that allows provisioning of the certboto-docker certificates bucket in the DNS account."
  value       = aws_iam_policy.provisioncertificatesbucket_policy
}
