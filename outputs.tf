output "certificate_bucket_arn" {
  value       = aws_s3_bucket.certificates.arn
  description = "The ARN of the S3 bucket where certboto-docker certificates will be stored."
}

output "certificate_bucket_id" {
  value       = aws_s3_bucket.certificates.id
  description = "The ID of the S3 bucket where certboto-docker certificates will be stored."
}
