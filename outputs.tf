output "certificates_bucket_arn" {
  value       = aws_s3_bucket.certificates.arn
  description = "The ARN of the S3 bucket where certboto-docker certificates will be stored."
}

output "certificates_bucket_id" {
  value       = aws_s3_bucket.certificates.id
  description = "The ID of the S3 bucket where certboto-docker certificates will be stored."
}

output "certificatesbucketfullaccess_role_arn" {
  value       = aws_iam_role.certificatesbucketfullaccess_role.arn
  description = "The ARN of the IAM role that allows full access to the certboto-docker certificates bucket in the DNS account."
}

output "certificatesbucketreadonly_role_arn" {
  value       = aws_iam_role.certificatesbucketreadonly_role.arn
  description = "The ARN of the IAM role that allows read-only access to the certboto-docker certificates bucket in the DNS account."
}

output "provisioncertificatesbucket_policy_arn" {
  value       = aws_iam_policy.provisioncertificatesbucket_policy.arn
  description = "The ARN of the IAM policy that allows provisioning of the certboto-docker certificates bucket in the DNS account."
}
