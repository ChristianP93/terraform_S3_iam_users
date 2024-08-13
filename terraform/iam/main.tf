resource "aws_iam_user" "write_user" {
  name = "write-worker"
}

resource "aws_iam_user" "read_user" {
  name = "read-worker"
}

resource "aws_iam_access_key" "write_user_key" {
  user = aws_iam_user.write_user.name
}

resource "aws_iam_access_key" "read_user_key" {
  user = aws_iam_user.read_user.name
}

resource "aws_iam_user_policy" "write_policy" {
  name = "s3_write_policy"
  user = aws_iam_user.write_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "${var.bucket_arn}",
          "${var.bucket_arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_user_policy" "read_policy" {
  name = "s3_read_policy"
  user = aws_iam_user.read_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "${var.bucket_arn}",
          "${var.bucket_arn}/*"
        ]
      }
    ]
  })
}
