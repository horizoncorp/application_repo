terraform {
  backend "s3" {
    bucket = "s3-spain-tf-bucket"
    key    = "prod/tfstate"
    region = "eu-west-3"
  }
}