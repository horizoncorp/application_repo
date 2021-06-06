terraform {
  backend "s3" {
    bucket = "s3-agcs-tf-bucket"
    key    = "test/tfstate"
    region = "eu-central-1"
    role_arn     = "arn:aws:iam::166719468913:role/tfadmin"
  }
}