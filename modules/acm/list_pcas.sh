#!/bin/bash
pcas=$(aws acm-pca list-certificate-authorities \
    --query 'CertificateAuthorities[?Status!=`DELETED`].[Arn]' \
    --output json)

# extract the first ARN from the JSON array and output it as a string
first_arn=$(echo "$pcas" | jq -r '.[0][0]')

echo "{\"arn_0\": \"$first_arn\"}"
