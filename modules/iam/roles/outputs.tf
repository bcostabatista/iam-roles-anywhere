output "role" {
  description = "The name of the IAM role."
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "The ARN of the IAM Role."
  value       = aws_iam_role.this.arn
}