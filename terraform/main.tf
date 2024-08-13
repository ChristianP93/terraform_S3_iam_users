# Bucket S3
module "s3_private_bucket" {
  source = "./s3"

  environment = var.environment
  bucket_name = var.bucket_name
}

# IAM Users
module "iam_users" {
  source     = "./iam"
  bucket_arn = module.s3_private_bucket.bucket_arn
}
