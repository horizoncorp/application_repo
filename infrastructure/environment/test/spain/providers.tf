terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-3"
  assume_role {
    role_arn     = "arn:aws:iam::166719468913:role/tfadmin"
    session_name = "TERRAFORM"
    external_id  = "TERRAFORM"
  }
}
