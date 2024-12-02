## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_certificates"></a> [certificates](#module\_certificates) | ./modules/acm | n/a |
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | ./modules/iam/roles | n/a |
| <a name="module_roles_anywhere"></a> [roles\_anywhere](#module\_roles\_anywhere) | ./modules/iam/roles_anywhere | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_role"></a> [role](#input\_role) | Name of the IAM role being created | `string` | `"roles-anywhere-iam-role"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_arn"></a> [certificate\_arn](#output\_certificate\_arn) | The ARN of the certificate created by the ACM module |
| <a name="output_certificate_id"></a> [certificate\_id](#output\_certificate\_id) | The ID of the certificate created by the ACM module |
| <a name="output_role"></a> [role](#output\_role) | The name of the IAM Role created by the roles\_anywhere module |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | The ARN of the IAM Role created by the roles\_anywhere module |
