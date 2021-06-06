#!/bin/bash

TERRAFORM_VERSION="0.15.5"
TERRAFORM_SHA256SUM=3b144499e08c245a8039027eb2b84c0495e119f57d79e8fb605864bb48897a7d
# TERRAFORM_DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
TERRAFORM_DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip

curl -o terraform.zip -L "${TERRAFORM_DOWNLOAD_URL}"
echo "${TERRAFORM_SHA256SUM}  terraform.zip" > terraform.sha256sum
sha256sum -cs terraform.sha256sum
unzip terraform.zip
chmod +x terraform