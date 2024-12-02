resource "aws_rolesanywhere_trust_anchor" "this" {
  name    = var.trust_anchor_name
  enabled = var.enable_trust_anchor
  source {
    source_data {
      acm_pca_arn = var.acm_pca_arn
    }
    source_type = var.source_type
  }
}

resource "aws_rolesanywhere_profile" "this" {
  name      = var.profile_name
  role_arns = var.iam_roles_arns
  enabled   = var.enable_profile
}