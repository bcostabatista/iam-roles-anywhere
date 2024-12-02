output "acm_pca_arn" {
  description = "The ARN of the ACM Private CA"
  value       = data.external.list_pcas.result.arn_0
}

output "certicate_id" {
  description = "The id of the certificate."
  value       = aws_acmpca_certificate.this.id
}

output "certificate_arn" {
  description = "The ARN of the certificate."
  value       = aws_acmpca_certificate.this.arn
}