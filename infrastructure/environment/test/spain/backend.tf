terraform {
  backend "s3" {
    bucket = "s3-spain-tf-bucket"
    key    = "test/tfstate"
    region = "eu-west-3"
    role_arn     = "arn:aws:iam::166719468913:role/tfadmin"
  }
}