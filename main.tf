module "iam_role" {
  source = "./modules/iam/roles"
  role   = var.role
  tags = {
    Name        = "${var.role}-tag"
    Environment = "Dev"
  }
}

module "certificates" {
  source = "./modules/acm"
}

module "roles_anywhere" {
  source            = "./modules/iam/roles_anywhere"
  trust_anchor_name = "prefix_trust_anchor_name"
  profile_name      = "prefix_profile_name"
  source_type       = "AWS_ACM_PCA"
  iam_roles_arns    = [module.iam_role.role_arn]
  acm_pca_arn       = module.certificates.acm_pca_arn
}

output "role" {
  description = "The name of the IAM Role created by the roles_anywhere module"
  value       = module.iam_role.role
}

output "role_arn" {
  description = "The ARN of the IAM Role created by the roles_anywhere module"
  value       = module.iam_role.role_arn
}

output "certificate_id" {
  description = "The ID of the certificate created by the ACM module"
  value       = module.certificates.certicate_id
}

output "certificate_arn" {
  description = "The ARN of the certificate created by the ACM module"
  value       = module.certificates.certificate_arn
}