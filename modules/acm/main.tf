resource "aws_acmpca_certificate" "this" {
  certificate_authority_arn   = data.external.list_pcas.result.arn_0
  certificate_signing_request = tls_cert_request.csr.cert_request_pem
  signing_algorithm           = "SHA256WITHRSA"
  validity {
    type  = "YEARS"
    value = 1
  }
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "tls_cert_request" "csr" {
  private_key_pem = tls_private_key.key.private_key_pem

  subject {
    common_name = "whatever.com"
  }
}

# output the certificate chain to AWS secrets manager
resource "aws_secretsmanager_secret" "certificate_chain" {
  name = "roles-anywhere-certificate-chain"
}

resource "aws_secretsmanager_secret_version" "certificate_chain_version" {
  secret_id     = aws_secretsmanager_secret.certificate_chain.id
  secret_string = aws_acmpca_certificate.this.certificate
}

# output the private key to AWS secrets manager
resource "aws_secretsmanager_secret" "private_key" {
  name = "roles-anywhere-private-key"
}

resource "aws_secretsmanager_secret_version" "private_key_version" {
  secret_id     = aws_secretsmanager_secret.private_key.id
  secret_string = tls_private_key.key.private_key_pem
}
