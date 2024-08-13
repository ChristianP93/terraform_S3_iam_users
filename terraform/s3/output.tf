output "bucket_id" {
  description = "Bucket ID"
  value       = aws_s3_bucket.private_bucket.id
}

output "bucket_arn" {
  description = "Bucket ARN"
  value       = aws_s3_bucket.private_bucket.arn
}