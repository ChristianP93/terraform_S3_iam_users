output "write_user_access_key" {
  value     = module.iam_users.write_user_access_key
  sensitive = true
}

output "write_user_secret_key" {
  value     = module.iam_users.write_user_secret_key
  sensitive = true
}

output "read_user_access_key" {
  value     = module.iam_users.read_user_access_key
  sensitive = true
}

output "read_user_secret_key" {
  value     = module.iam_users.read_user_secret_key
  sensitive = true
}