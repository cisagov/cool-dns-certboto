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

output "certificatesbucketreadonlyaccess_role_arn" {
  value       = aws_iam_role.certificatesbucketreadonlyaccess_role.arn
  description = "The ARN of the IAM role that allows read-only access to the certboto-docker certificates bucket in the DNS account."
}

output "createcertificatesbucket_policy_arn" {
  value       = aws_iam_policy.createcertificatesbucket_policy.arn
  description = "The ARN of the IAM role that allows creation of the certboto-docker certificates bucket in the DNS account."
}
