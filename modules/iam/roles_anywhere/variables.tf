# trust anchor variables
variable "trust_anchor_name" {
  description = "The name of the Trust Anchor to be created."
  type        = string
}

variable "source_type" {
  description = "The type of the source of trust. Must be either AWS_ACM_PCA or CERTIFICATE_BUNDLE"
  type        = string

  validation {
    condition     = contains(["AWS_ACM_PCA", "CERTIFICATE_BUNDLE"], var.source_type)
    error_message = "The source_type variable must be either 'AWS_ACM_PCA' or 'CERTIFICATE_BUNDLE'."
  }
}

variable "acm_pca_arn" {
  description = "The ARN of an ACM Private Certificate Authority."
  type        = string
}

variable "enable_trust_anchor" {
  description = "Whether or not to enable the new trust anchor by default"
  type        = bool
  default     = true
}

# profile variables
variable "profile_name" {
  description = "The name of the Profile to be created."
  type        = string
}

variable "iam_roles_arns" {
  description = "A list of IAM roles that this profile can assume"
  type        = list(string)
}

variable "enable_profile" {
  description = "Whether or not to enable the new profile by default"
  type        = bool
  default     = true
}
