resource "aws_iam_role" "this" {
  name               = var.role
  assume_role_policy = data.aws_iam_policy_document.roles_anywhere_policy.json
  tags               = var.tags
}

resource "aws_iam_policy" "s3_admin_policy" {
  name        = "S3AdminPolicyForRolesAnywhere"
  description = "Custom policy for full S3 access"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:*",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_custom_policy" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.s3_admin_policy.arn
}
