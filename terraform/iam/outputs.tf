
output "write_user_access_key" {
  description = "Access key ID of the user with write permissions"
  value       = aws_iam_access_key.write_user_key.id
  sensitive   = true
}

output "write_user_secret_key" {
  description = "Secret access key of the user with write permissions"
  value       = aws_iam_access_key.write_user_key.secret
  sensitive   = true
}

output "read_user_access_key" {
  description = "Access key ID of the user with read permissions"
  value       = aws_iam_access_key.read_user_key.id
  sensitive   = true
}

output "read_user_secret_key" {
  description = "Secret access key of the user with read permissions"
  value       = aws_iam_access_key.read_user_key.secret
  sensitive   = true
}