#!/bin/bash

TERRAFORM_VERSION="1.0.0"
TERRAFORM_SHA256SUM=ca7a3c5d03912d7a4b425866c6972e61a3f4595a2e19d800f797ef1fa5d206fe
# TERRAFORM_DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
TERRAFORM_DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip

curl -o terraform.zip -L "${TERRAFORM_DOWNLOAD_URL}"
echo "${TERRAFORM_SHA256SUM}  terraform.zip" > terraform.sha256sum
sha256sum -cs terraform.sha256sum
unzip terraform.zip
chmod +x terraform