
# IAM Roles Anywhere Terraform Module

This Terraform module simplifies the setup and management of AWS IAM Roles Anywhere, including creating:

- A trust anchor
- A profile
- An IAM role with the appropriate trust relationships
- A private certificate authority (PCA) certificate chain and private key securely stored in AWS Secrets Manager

## Module Features
- Fully automates the creation of all necessary IAM Roles Anywhere resources.
- Securely stores sensitive data (certificate chain and private key) in AWS Secrets Manager.

## Instructions

### Prerequisites
- Ensure you have Terraform installed.
- AWS CLI configured with appropriate permissions.

### Retrieve Certificate Chain and Private Key
1. Retrieve the certificate chain:
   ```bash
   aws secretsmanager get-secret-value \
       --secret-id roles-anywhere-certificate-chain \
       --query SecretString --output text > ./certificates/full_certificate_chain.pem
   ```

2. Retrieve the private key:
   ```bash
   aws secretsmanager get-secret-value \
       --secret-id roles-anywhere-private-key \
       --query SecretString --output text > ./private-key.pem
   ```

### Sign in Using `aws_signing_helper`
1. Use the `aws_signing_helper` to initiate a session:
   ```bash
   aws_signing_helper credential-process \
       --certificate ./certificates/full_certificate_chain.pem \
       --private-key ./private-key.pem \
       --profile-arn arn:aws:rolesanywhere:us-east-1:123456789012:profile/your-profile-id \
       --role-arn arn:aws:iam::123456789012:role/your-role-name \
       --trust-anchor-arn arn:aws:rolesanywhere:us-east-1:123456789012:trust-anchor/your-trust-anchor-id
   ```

Replace the placeholders (`your-profile-id`, `your-role-name`, and `your-trust-anchor-id`) with the appropriate values output by Terraform.

## Notes
- Rotate the private key and certificate regularly for security.
- Ensure AWS Secrets Manager is secured with appropriate permissions.

## Example Usage
```hcl
module "iam_roles_anywhere" {
  source = "path-to-your-module"

  # Add necessary variables here
}
```

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

## License

MIT