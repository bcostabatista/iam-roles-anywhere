## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_rolesanywhere_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rolesanywhere_profile) | resource |
| [aws_rolesanywhere_trust_anchor.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rolesanywhere_trust_anchor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_pca_arn"></a> [acm\_pca\_arn](#input\_acm\_pca\_arn) | The ARN of an ACM Private Certificate Authority. | `string` | n/a | yes |
| <a name="input_enable_profile"></a> [enable\_profile](#input\_enable\_profile) | Whether or not to enable the new profile by default | `bool` | `true` | no |
| <a name="input_enable_trust_anchor"></a> [enable\_trust\_anchor](#input\_enable\_trust\_anchor) | Whether or not to enable the new trust anchor by default | `bool` | `true` | no |
| <a name="input_iam_roles_arns"></a> [iam\_roles\_arns](#input\_iam\_roles\_arns) | A list of IAM roles that this profile can assume | `list(string)` | n/a | yes |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | The name of the Profile to be created. | `string` | n/a | yes |
| <a name="input_source_type"></a> [source\_type](#input\_source\_type) | The type of the source of trust. Must be either AWS\_ACM\_PCA or CERTIFICATE\_BUNDLE | `string` | n/a | yes |
| <a name="input_trust_anchor_name"></a> [trust\_anchor\_name](#input\_trust\_anchor\_name) | The name of the Trust Anchor to be created. | `string` | n/a | yes |

## Outputs

No outputs.
